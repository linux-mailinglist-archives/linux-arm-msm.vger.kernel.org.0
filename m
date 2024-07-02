Return-Path: <linux-arm-msm+bounces-24899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE999242F1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 17:55:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0AD881C2489F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 15:55:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA4FB1BC08D;
	Tue,  2 Jul 2024 15:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pJbpM50l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1AF26AE4;
	Tue,  2 Jul 2024 15:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719935749; cv=none; b=ucsBsDJThU/3V13riynljmu8LyNzmofcVqRWriO23H1RsbCKU27JUb7wRn0TwWV7pRG59OfbFW4T+/sVi+8/B9eJZqp6xYDakyYvJ1RdYu5cGQupg9XZxHJUnpkjcgqnORrXuPdxsTRGgcsXgg1e8yXVq6iJMs4TRNUR1V+Dlh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719935749; c=relaxed/simple;
	bh=bR4HNfKuY8jGJG6iuXf2xRGlqbsq3FVgf0n2KcVyQlo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G0Qgc9LXlBE7KUCJ0MQOKVI2mYasnsb5WlkAlOo1/e/M+bwywMXzkJJhEVO783QzDvMCiGaVnR9jyL/111PKAvAheljwjdJL9yrf3xAD1uOwZfGBSpYX0of+MfsXdB6L1nTfKgDA6ID5u9cu2WG2i1z1DHD7kT1w4TOPd7nwOLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pJbpM50l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69D7EC4AF07;
	Tue,  2 Jul 2024 15:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719935749;
	bh=bR4HNfKuY8jGJG6iuXf2xRGlqbsq3FVgf0n2KcVyQlo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pJbpM50lyyIUovqd33O82XefqYGxiM+do2g3jXYXYoxk1GTBC93LwYs+pV0ot3Y8K
	 UqnVJVu51D3hUcB8VXMFZbJzn9glQPfYrUz8F9rpN+MNExo14wFGuiIrIY9ysDqvKo
	 OTFRTqcAC0ePiWxzyvaJQXGrV15NbXc08BaE6XwBQoh8mKYMQfR/zCXBwVpthHZR0a
	 efDoebDxfIGXFWaZhQ/QqzMMEUd01hxtLFfDCy7QXZ1O8O1pPnd8rNZo84Fu/oHrqa
	 aQWnG/7eGENVZzDQ9r9QBjHU9NTK0a1bjUY+ZwGAwHOrhr8v+4rk155nOb7rPNdtTY
	 VaBB7glgeMDmQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sOfr7-000000003W1-26rB;
	Tue, 02 Jul 2024 17:55:46 +0200
Date: Tue, 2 Jul 2024 17:55:45 +0200
From: Johan Hovold <johan@kernel.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, andersson@kernel.org,
	konrad.dybcio@linaro.org, jassisinghbrar@gmail.com,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	dmitry.baryshkov@linaro.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	quic_rgottimu@quicinc.com, quic_kshivnan@quicinc.com,
	conor+dt@kernel.org, quic_nkela@quicinc.com,
	quic_psodagud@quicinc.com, abel.vesa@linaro.org
Subject: Re: [PATCH V6 5/5] arm64: dts: qcom: x1e80100: Enable cpufreq
Message-ID: <ZoQjAWse2YxwyRJv@hovoldconsulting.com>
References: <20240612124056.39230-1-quic_sibis@quicinc.com>
 <20240612124056.39230-6-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240612124056.39230-6-quic_sibis@quicinc.com>

On Wed, Jun 12, 2024 at 06:10:56PM +0530, Sibi Sankar wrote:
> Enable cpufreq on X1E80100 SoCs through the SCMI perf protocol node.
> 
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 63 ++++++++++++++++----------
>  1 file changed, 39 insertions(+), 24 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index 7b619db07694..d134dc4c7425 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -69,8 +69,8 @@ CPU0: cpu@0 {
>  			reg = <0x0 0x0>;
>  			enable-method = "psci";
>  			next-level-cache = <&L2_0>;
> -			power-domains = <&CPU_PD0>;
> -			power-domain-names = "psci";
> +			power-domains = <&CPU_PD0>, <&scmi_dvfs 0>;
> +			power-domain-names = "psci", "perf";
>  			cpu-idle-states = <&CLUSTER_C4>;

> +		scmi {
> +			compatible = "arm,scmi";
> +			mboxes = <&cpucp_mbox 0>, <&cpucp_mbox 2>;
> +			mbox-names = "tx", "rx";
> +			shmem = <&cpu_scp_lpri0>, <&cpu_scp_lpri1>;
> +
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			scmi_dvfs: protocol@13 {
> +				reg = <0x13>;
> +				#power-domain-cells = <1>;
> +			};
> +		};
>  	};

This series gives a nice performance boost on the x1e80100 CRD, but I'm
seeing a bunch of warnings and errors that need to be addressed:

[    9.533053] arm-scmi firmware:scmi: Failed to get FC for protocol 13 [MSG_ID:6 / RES_ID:0] - ret:-95. Using regular messaging.
[    9.549458] arm-scmi firmware:scmi: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
[    9.563925] arm-scmi firmware:scmi: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
[    9.572835] arm-scmi firmware:scmi: Failed to get FC for protocol 13 [MSG_ID:6 / RES_ID:1] - ret:-95. Using regular messaging.
[    9.609471] arm-scmi firmware:scmi: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
[    9.633341] arm-scmi firmware:scmi: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
[    9.650000] arm-scmi firmware:scmi: Failed to get FC for protocol 13 [MSG_ID:6 / RES_ID:2] - ret:-95. Using regular messaging.
[    9.727098] cpu cpu4: _opp_is_duplicate: duplicate OPPs detected. Existing: freq: 3417600000, volt: 0, enabled: 1. New: freq: 3417600000, volt: 0, enabled: 1
[    9.737157] cpu cpu4: _opp_is_duplicate: duplicate OPPs detected. Existing: freq: 3417600000, volt: 0, enabled: 1. New: freq: 3417600000, volt: 0, enabled: 1
[    9.875039] cpu cpu8: _opp_is_duplicate: duplicate OPPs detected. Existing: freq: 3417600000, volt: 0, enabled: 1. New: freq: 3417600000, volt: 0, enabled: 1
[    9.888428] cpu cpu8: _opp_is_duplicate: duplicate OPPs detected. Existing: freq: 3417600000, volt: 0, enabled: 1. New: freq: 3417600000, volt: 0, enabled: 1
[    9.913506] debugfs: Directory 'NCC' with parent 'pm_genpd' already present!
[    9.922198] debugfs: Directory 'NCC' with parent 'pm_genpd' already present!

Johan

