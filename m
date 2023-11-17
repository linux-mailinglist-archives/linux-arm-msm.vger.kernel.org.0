Return-Path: <linux-arm-msm+bounces-944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2440A7EF0EC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 11:48:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFE7F280F69
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 10:47:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 760F518C3D;
	Fri, 17 Nov 2023 10:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="arvcMNsW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541361A592;
	Fri, 17 Nov 2023 10:47:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B167C433C8;
	Fri, 17 Nov 2023 10:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700218075;
	bh=7g4hbHLfUyULJOVW3vf8Sh7y3UZATocPdgH7ZaOrhwk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=arvcMNsWuLaHFNnEDXLSxBRNuDbZEj3hNQtXWVgddTf9FmfRlhGjqo5Djz7zD3pqg
	 OopSyBIWu14DRhP8byFeQ/BySIPGnPXFUE7vOv3GuIYJKpiTOIbcpyzOxO6DHEvROj
	 VbbL5rkzUMA7tRaUVh7Giuu6iEue+dpW0G31Mevq7+Db0blEd1SEnszvQcA0Icouyz
	 h9zTbBlE5xIlG9NEFxUWUhBo20gk0a6kgBsJApu8ma0W/hb9UKmB+oYQwmSo7lVP/q
	 4UxWMUEgwgN/lyiqp0FXvCqkXrUno38OnT1qVDbct+H3JoLtU2v8U8UIsH5pmoKNwZ
	 0hi3osb5uJI+Q==
Date: Fri, 17 Nov 2023 16:17:48 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qrb5165-rb5: correct LED panic
 indicator
Message-ID: <20231117104748.GP250770@thinkpad>
References: <20231111094623.12476-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231111094623.12476-1-krzysztof.kozlowski@linaro.org>

On Sat, Nov 11, 2023 at 10:46:23AM +0100, Krzysztof Kozlowski wrote:
> There is no "panic-indicator" default trigger but a property with that
> name:
> 
>   qrb5165-rb5.dtb: leds: led-user4: Unevaluated properties are not allowed ('linux,default-trigger' was unexpected)
> 
> Fixes: b5cbd84e499a ("arm64: dts: qcom: qrb5165-rb5: Add onboard LED support")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> index 3bd0c06e7315..e43f73f1be1b 100644
> --- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> @@ -64,8 +64,8 @@ led-user4 {
>  			function = LED_FUNCTION_INDICATOR;
>  			color = <LED_COLOR_ID_GREEN>;
>  			gpios = <&pm8150_gpios 10 GPIO_ACTIVE_HIGH>;
> -			linux,default-trigger = "panic-indicator";
>  			default-state = "off";
> +			panic-indicator;
>  		};
>  
>  		led-wlan {
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

