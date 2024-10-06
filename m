Return-Path: <linux-arm-msm+bounces-33210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A5793991C2A
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 04:35:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57CFB1F21F87
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 02:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64DB715383A;
	Sun,  6 Oct 2024 02:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="szS9NnB2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C6923CB;
	Sun,  6 Oct 2024 02:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728182132; cv=none; b=EQYvc7WCiwztA6aQZb+STNRQK3rsITQxrQ1vLr3Eip+D4OHfeW4hvsuKhM3B7ZrIZwwRPQhjDmqAGBAld8qM6anf7VHTVK/ECL+G3176xMzOimlzglkdUp4Szs/FWnDEUZ2D7e/RlS58pOJiEfgN7gyO028CsBqQknp3SR8yPww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728182132; c=relaxed/simple;
	bh=tCS9cWvxiAM2hGh0Y6rSeOlkDzX54y+fKh+xilcC8rw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sa87GqzfDm2lxVVNRW0BvKVjTXYJnYGJXTnwZ98xU1VL0iztscej0yf671aC6qv4ITQYyIK1maXJnHejC0ME0hpM+O1FwYhE3z5CUALuI8J7NtyJWSqHVzo53/kFMPTujh8kx7rWbJUL9mnsuuwbRUZZQeJcS448O1xdVi3zn7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=szS9NnB2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF13AC4CEC7;
	Sun,  6 Oct 2024 02:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728182131;
	bh=tCS9cWvxiAM2hGh0Y6rSeOlkDzX54y+fKh+xilcC8rw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=szS9NnB2OxfvaY094lsyyn7Kd7h7IIRtIBRujqj4Wr+8IpBAVUcftsCd0PshvZc1T
	 40vqYs13MwAXN19mzLuId5y8SPjkD4Ci81qxANczYr70vwWt7NvssLhY1ZIuRqbKRB
	 Mi+8WfYXPPhn1OzwcGBB+lzHzaXn+GfR4pcoSGg8RqmLlFE48VKFuNmhR8tcPbd/J/
	 1miZuM5PQIwqs6mQk2C9JEcpp1I/+cGIP7K896PmivCGJVeT3mrJHKOcags5BA8Ydy
	 U1fzoSXdTreGEfHFDU7OAZBIwYFWq7ZAN3jpOJbsmLIMl+gVrmGLrfn4r1gHCbABLA
	 7+5lahYlQwEJA==
Date: Sat, 5 Oct 2024 21:35:29 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Shivnandan Kumar <quic_kshivnan@quicinc.com>
Cc: Sibi Sankar <quic_sibis@quicinc.com>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Ramakrishna Gottimukkula <quic_rgottimu@quicinc.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sc7280: Add cpucp mbox node
Message-ID: <grvdxaiakv62nfom5r5m7zv43xpxfwhxnp7x5byfubbvecfers@pqydhpu7a2vm>
References: <20240924050941.1251485-1-quic_kshivnan@quicinc.com>
 <20240924050941.1251485-4-quic_kshivnan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240924050941.1251485-4-quic_kshivnan@quicinc.com>

On Tue, Sep 24, 2024 at 10:39:41AM GMT, Shivnandan Kumar wrote:
> Add the CPUCP mailbox node required for communication with CPUCP.

I'd like to see a description of why that's useful...

But perhaps more importantly, why are there no user(s) of this?

Regards,
Bjorn

> 
> Signed-off-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 3d8410683402..4b9b26a75c62 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -4009,6 +4009,14 @@ gem_noc: interconnect@9100000 {
>  			qcom,bcm-voters = <&apps_bcm_voter>;
>  		};
> 
> +		cpucp_mbox: mailbox@17430000 {
> +			compatible = "qcom,sc7280-cpucp-mbox";
> +			reg = <0 0x18590000 0 0x2000>,
> +			      <0 0x17C00000 0 0x10>;
> +			interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
> +			#mbox-cells = <1>;
> +		};
> +
>  		system-cache-controller@9200000 {
>  			compatible = "qcom,sc7280-llcc";
>  			reg = <0 0x09200000 0 0x58000>, <0 0x09280000 0 0x58000>,
> --
> 2.25.1
> 

