Return-Path: <linux-arm-msm+bounces-35462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FB69AB3F4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 18:28:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5CF9F1C228C6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 16:28:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E11571BB6B6;
	Tue, 22 Oct 2024 16:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lZvXkGTo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D971B5820;
	Tue, 22 Oct 2024 16:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729614489; cv=none; b=sM4OE8ak8AuQoKKzIPkaYA9XX5Gjs8wBUqoC3Yf458YYUNmnDirUeRRTVh3hDsDjziaSZIQJ0ME2QR4aknWjmgFfmCD5qg7GVY16Cn+vxSLJneOdJMSkoBMwtv6vZ7S8zRrfB+s8TuwmKm+SVlgNzrHKyh1IX5k3VC/pOaPHvZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729614489; c=relaxed/simple;
	bh=Pt7BwMD1B1s86qO1NswZf26kT+rfcP+5gmP6nwEXp24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oQOrRALAuCNAaa40dgVv5v2Ze69wtxlCOzt78G98yVkldbPqbByzEYG551OHnrV++OzEUY3m0fPuIoG/YPlxYhKTGkvhF8kz0q2iKP67e6dST7b8QfR6dEQ3Dyf43vdu6UE9BMy+rJUtuFk9L5oNZohAVw3PHOqP1AV0TexP5DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lZvXkGTo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9300AC4CEC3;
	Tue, 22 Oct 2024 16:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729614489;
	bh=Pt7BwMD1B1s86qO1NswZf26kT+rfcP+5gmP6nwEXp24=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lZvXkGTogaVml+y+wUO5WLog6s0rvWDxZMetDZq3m6tUhSZVJmY/FKc6WgkddoqH5
	 HXDnsrUnCGkULpqemgMkkY1yZ4HGpiR8grQqkY/nPg6SUDTF12mf8GS8ZwJQXSkpFY
	 XbCQzv7EC4nFJP70vx3W+MFO3ORc0b0P+Zoi3xnyBmk/DIeINjdcUEfp6kpHSeVu+G
	 +fycGAujt75mg9lXSxUBLuCT7cc2+S2Qe9dyTkflY1iiCttvlYnbg8OQvqo+5bWPRX
	 jPWX964h9FgpVKl+aVELR/PrWJBBySiPx08KH1iShECsYPCpn1u1Dy7aCU6aE3WrQI
	 fQSYMJOrkGuhQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t3Hk5-000000005cB-0O7W;
	Tue, 22 Oct 2024 18:28:21 +0200
Date: Tue, 22 Oct 2024 18:28:21 +0200
From: Johan Hovold <johan@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Akhil P Oommen <quic_akhilpo@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1e80100: Update C4/C5
 residency/exit numbers
Message-ID: <ZxfSpRDQY10dvHC_@hovoldconsulting.com>
References: <20240716-topic-h_bits-v1-0-f6c5d3ff982c@linaro.org>
 <20240716-topic-h_bits-v1-2-f6c5d3ff982c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240716-topic-h_bits-v1-2-f6c5d3ff982c@linaro.org>

On Tue, Jul 16, 2024 at 12:35:04PM +0200, Konrad Dybcio wrote:
> Update the numbers based on the information found in the DSDT.
> 
> Fixes: af16b00578a7 ("arm64: dts: qcom: Add base X1E80100 dtsi and the QCP dts")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---

What happened to this one? Was it silently rejected?

Only the first patch in the series was merged.

>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index 47bb26a66b2e..120bc418c444 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -278,8 +278,8 @@ CLUSTER_C4: cpu-sleep-0 {
>  				idle-state-name = "ret";
>  				arm,psci-suspend-param = <0x00000004>;
>  				entry-latency-us = <180>;
> -				exit-latency-us = <320>;
> -				min-residency-us = <1000>;
> +				exit-latency-us = <500>;
> +				min-residency-us = <600>;
>  			};
>  		};
>  
> @@ -298,7 +298,7 @@ CLUSTER_CL5: cluster-sleep-1 {
>  				idle-state-name = "ret-pll-off";
>  				arm,psci-suspend-param = <0x01000054>;
>  				entry-latency-us = <2200>;
> -				exit-latency-us = <2500>;
> +				exit-latency-us = <4000>;
>  				min-residency-us = <7000>;
>  			};
>  		};

Johan

