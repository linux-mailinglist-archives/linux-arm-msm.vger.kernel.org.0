Return-Path: <linux-arm-msm+bounces-20844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AFB8D2721
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 23:35:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 687091F260EA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 21:35:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D0E117BB03;
	Tue, 28 May 2024 21:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oeU4xdkR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5BF17B4FA;
	Tue, 28 May 2024 21:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716932119; cv=none; b=h3Y7+YmkgL3bOOA9kvM1/fR1etxkHuEeCxOkBrVjPvWjq19Z10vqnIV9TjrzdOXIcdgmBmmYTkvB8sfVBbCUK2hCbDbI+6XdlkVCcfYzuv2fkqxa5BbPJ0Ksm+7LW4+H5sWyLz7KYfpz+X6tHJq/ueMUQdpa9tf/SRF5jAdjKtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716932119; c=relaxed/simple;
	bh=TTH6TAAHwNlQVXAyaogzfwBqkN2ZRzQ1G1pQrDnBJck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aeXVN7Ij9eTczx8gKgJKkJhw9Bg4owjBXNNwT62ZXCO+81hSxxmVhy0zI61H5KSsz2owPW++lfM+me+ND92wJQ7cyTIyQA8P3CkOvamgVbCjgrqf659E8xCo9VrNGMfEQtFWf8b4pv/XLQcfbNtVZPa/7f6eus1vVS6Pz9uqWFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oeU4xdkR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 912C7C3277B;
	Tue, 28 May 2024 21:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716932118;
	bh=TTH6TAAHwNlQVXAyaogzfwBqkN2ZRzQ1G1pQrDnBJck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oeU4xdkRJ3X0RbaYEe79r7B1TPu84xeNqYBWKsrZxaMGxOC4XE9s7C/4kRLbJ0Aj0
	 XEchBORaoDtvvgb/RDIptSSPBfgAUX9UqhFd0E3frxQikLwi35DH0omy5OuCWh3TAH
	 0AxyXUmioNEpY0e4njH2E969CC7mvkf7YrMRz95tLZcaFXhwbXHiR7zMbvzgeX27SE
	 fB12XzBMONchtmgAdH5sX+VDItHOlyPPDiv+A3Xcwre/07lWvk5CoQ9Cy2ojvuTg8u
	 dkHdk9P65p7TglO/ZnmRyItggxNKVv+eGGzavQ/HF3CKHFhc/2EZ1Fp/fqch2jBKqw
	 su59ULvI41eOw==
Date: Tue, 28 May 2024 16:35:15 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: cros-qcom-dts-watchers@chromium.org, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, Mohammad Rafi Shaik <quic_mohs@quicinc.com>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH DNM 2/2] arm64: dts: qcom: qcm6490-fairphone-fp5: Add
 DisplayPort sound support
Message-ID: <hqwrfe2tcb6vlxybmn52k3j2xrxbt3vw5rqwudindbhj3s3nez@obkr3ayos6gm>
References: <20240510-sc7280-apr-v1-0-e9eabda05f85@fairphone.com>
 <20240510-sc7280-apr-v1-2-e9eabda05f85@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240510-sc7280-apr-v1-2-e9eabda05f85@fairphone.com>

On Fri, May 10, 2024 at 02:27:09PM GMT, Luca Weiss wrote:
> Add the required nodes for sound playback via a connected external
> display (DisplayPort over USB-C).
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> Depends on a bunch of patches upstream doing bringup of Display (DSI),
> DisplayPort, GPU, and then finally audio could land. But we're blocked
> on DPU 1:1:1 topology for all of that unfortunately.
> 
> And also machine driver for sound just exists a bit hackily.

Thanks for sharing this, Luca. Can you please resubmit this once it's
ready to be merged, so that I don't need to keep track of it?

Regards,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 36 ++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> index 05bbf1da5cb8..2bbbcaeff95e 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> @@ -14,6 +14,8 @@
>  #include <dt-bindings/leds/common.h>
>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include <dt-bindings/sound/qcom,q6afe.h>
> +#include <dt-bindings/sound/qcom,q6asm.h>
>  #include "sc7280.dtsi"
>  #include "pm7250b.dtsi"
>  #include "pm7325.dtsi"
> @@ -774,6 +776,12 @@ &pon_resin {
>  	status = "okay";
>  };
>  
> +&q6afedai {
> +	dai@104 {
> +		reg = <DISPLAY_PORT_RX>;
> +	};
> +};
> +
>  &qup_spi13_cs {
>  	drive-strength = <6>;
>  	bias-disable;
> @@ -847,6 +855,34 @@ &sdhc_2 {
>  	status = "okay";
>  };
>  
> +&sound {
> +	compatible = "fairphone,fp5-sndcard";
> +	model = "Fairphone 5";
> +
> +	mm1-dai-link {
> +		link-name = "MultiMedia1";
> +		cpu {
> +			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA1>;
> +		};
> +	};
> +
> +	displayport-rx-dai-link {
> +		link-name = "DisplayPort Playback";
> +
> +		cpu {
> +			sound-dai = <&q6afedai DISPLAY_PORT_RX>;
> +		};
> +
> +		platform {
> +			sound-dai = <&q6routing>;
> +		};
> +
> +		codec {
> +			sound-dai = <&mdss_dp>;
> +		};
> +	};
> +};
> +
>  &spi13 {
>  	status = "okay";
>  
> 
> -- 
> 2.45.0
> 

