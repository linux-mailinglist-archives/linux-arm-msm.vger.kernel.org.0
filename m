Return-Path: <linux-arm-msm+bounces-7702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7028A83582E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Jan 2024 23:26:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 294B52817AD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Jan 2024 22:26:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EB5838F8A;
	Sun, 21 Jan 2024 22:26:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [5.144.164.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD7638F88;
	Sun, 21 Jan 2024 22:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705876004; cv=none; b=r0EJfmmifEElQyMwWOxozIi64e4EWSd4hAQKWV8nr5xOr1DEi+ejYRspUO+9YJu8SBHp/f0rWuUUE5ELnsDTwhhFHcpbE5rPQGPNeFeo+jVnehmhOTZPJTydUACLwVgJFeaoU8XSGwiHpqonOCsIHFTi7UisbWykBrN59g9kQcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705876004; c=relaxed/simple;
	bh=PXYpMSGdthUXJnhoTPbS8CoFfCy2vmnLSPU/3dNRZrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dGtilTPPdC0zSxZMVhJIziFyQgnvcpPXadbXPbtOO7sRO8fdAJDOVRXIYp/2nN3kyrl2wYo4/q8xM1fKzcMqz9KYxz7UVPJzFIHk2vcpBNeeYW8Zq/rUSLL2F2iB2ch3UmGmjslb/Nn6OzQYIURTy7IOIb2p/VkrONSqyl7R24U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 101771FF15;
	Sun, 21 Jan 2024 23:16:42 +0100 (CET)
Date: Sun, 21 Jan 2024 23:16:40 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Adam Skladowski <a39.skl@gmail.com>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Krishna Manikandan <quic_mkrishn@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/8] arm64: dts: qcom: msm8976: Declare and wire SDC pins
Message-ID: <umllfip5rqeo5q65jbvdpisy5yaxpl54j4zdhi2hisdha5da4y@lwf2mjxuhiga>
Mail-Followup-To: Marijn Suijten <marijn.suijten@somainline.org>, 
	Adam Skladowski <a39.skl@gmail.com>, phone-devel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Krishna Manikandan <quic_mkrishn@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240121194221.13513-1-a39.skl@gmail.com>
 <20240121194221.13513-8-a39.skl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240121194221.13513-8-a39.skl@gmail.com>

On 2024-01-21 20:41:05, Adam Skladowski wrote:
> Declare pinctrls for SDC pins and wire them to consumers.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>

Where'd the original sign-offs go?

https://lore.kernel.org/linux-arm-msm/20221214232049.703484-1-marijn.suijten@somainline.org/

Thanks taking taking care of this SoC though.  My SM8976 Suzu device finally
emitted the magic smoke after rebasing on the latest MSM8976 patches, and will
need board repairs or a replacement before patches can be tested again :(

- Marijn

> ---
>  arch/arm64/boot/dts/qcom/msm8976.dtsi | 100 ++++++++++++++++++++++++++
>  1 file changed, 100 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8976.dtsi b/arch/arm64/boot/dts/qcom/msm8976.dtsi
> index 765c90ac14cb..5a7be93a0115 100644
> --- a/arch/arm64/boot/dts/qcom/msm8976.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8976.dtsi
> @@ -771,6 +771,96 @@ blsp2_i2c4_sleep: blsp2-i2c4-sleep-state {
>  				drive-strength = <2>;
>  				bias-disable;
>  			};
> +
> +			sdc1_default: sdc1-default-state {
> +				clk-pins {
> +					pins = "sdc1_clk";
> +					drive-strength = <16>;
> +					bias-disable;
> +				};
> +
> +				cmd-pins {
> +					pins = "sdc1_cmd";
> +					drive-strength = <10>;
> +					bias-pull-up;
> +				};
> +
> +				data-pins {
> +					pins = "sdc1_data";
> +					drive-strength = <10>;
> +					bias-pull-up;
> +				};
> +
> +				rclk-pins {
> +					pins = "sdc1_rclk";
> +					bias-pull-down;
> +				};
> +			};
> +
> +			sdc1_sleep: sdc1-sleep-state {
> +				clk-pins {
> +					pins = "sdc1_clk";
> +					drive-strength = <2>;
> +					bias-disable;
> +				};
> +
> +				cmd-pins {
> +					pins = "sdc1_cmd";
> +					drive-strength = <2>;
> +					bias-pull-up;
> +				};
> +
> +				data-pins {
> +					pins = "sdc1_data";
> +					drive-strength = <2>;
> +					bias-pull-up;
> +				};
> +
> +				rclk-pins {
> +					pins = "sdc1_rclk";
> +					bias-pull-down;
> +				};
> +			};
> +
> +			sdc2_default: sdc2-default-state {
> +				clk-pins {
> +					pins = "sdc2_clk";
> +					drive-strength = <16>;
> +					bias-disable;
> +				};
> +
> +				cmd-pins {
> +					pins = "sdc2_cmd";
> +					drive-strength = <10>;
> +					bias-pull-up;
> +				};
> +
> +				data-pins {
> +					pins = "sdc2_data";
> +					drive-strength = <10>;
> +					bias-pull-up;
> +				};
> +			};
> +
> +			sdc2_sleep: sdc2-sleep-state {
> +				clk-pins {
> +					pins = "sdc2_clk";
> +					drive-strength = <2>;
> +					bias-disable;
> +				};
> +
> +				cmd-pins {
> +					pins = "sdc2_cmd";
> +					drive-strength = <2>;
> +					bias-pull-up;
> +				};
> +
> +				data-pins {
> +					pins = "sdc2_data";
> +					drive-strength = <2>;
> +					bias-pull-up;
> +				};
> +			};
>  		};
>  
>  		gcc: clock-controller@1800000 {
> @@ -1246,6 +1336,11 @@ sdhc_1: mmc@7824900 {
>  				 <&gcc GCC_SDCC1_APPS_CLK>,
>  				 <&rpmcc RPM_SMD_XO_CLK_SRC>;
>  			clock-names = "iface", "core", "xo";
> +
> +			pinctrl-0 = <&sdc1_default>;
> +			pinctrl-1 = <&sdc1_sleep>;
> +			pinctrl-names = "default", "sleep";
> +
>  			status = "disabled";
>  		};
>  
> @@ -1262,6 +1357,11 @@ sdhc_2: mmc@7864900 {
>  				 <&gcc GCC_SDCC2_APPS_CLK>,
>  				 <&rpmcc RPM_SMD_XO_CLK_SRC>;
>  			clock-names = "iface", "core", "xo";
> +
> +			pinctrl-0 = <&sdc2_default>;
> +			pinctrl-1 = <&sdc2_sleep>;
> +			pinctrl-names = "default", "sleep";
> +
>  			status = "disabled";
>  		};
>  
> -- 
> 2.43.0
> 

