Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EB8034FBDD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Mar 2021 10:48:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234231AbhCaIs1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 04:48:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234456AbhCaIsY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 04:48:24 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E55DCC061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 01:48:23 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id b16so21343454eds.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 01:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6D6+xRXupTucxw0etSGVbGVI62Hei8H8bx8KxOcIYiA=;
        b=R8k8EADw+X1IyYg6JsaBk6DM1a9NAcPtH3Pv221Ja6JagVQ870jwz1jrxNufsIjY2G
         jgrhuPzf+XUDLohKFDCb6z5yPY1sILmIYfH3hjp3ZJ7AJxhyVRejQ/wVanFHuDSOWkq7
         rNUsNV/8TtWGu5An6ptRin3ycFTznFnzUfhSEdUkTcPHrsX5cKwaXW0l/8QnXQtYi/Vy
         dvNA6cJNSfMmW4Juct5bxTcY/SqVmsL7I6UU7mn71HbalzrBp6vMhR74lsmuZ28eke3R
         Ay5OwbXZPW9TlzV4yh5La2fdzC8WN8PzUWGHsl2lxV0/sD6xbEPTshGUjbU6ZkD3yUCx
         HGyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6D6+xRXupTucxw0etSGVbGVI62Hei8H8bx8KxOcIYiA=;
        b=RxDrxL7F6NIz949BNZ63027IlzLk+G50vbDddMuxSVbax0elANVPsIUL0R2DlT6usk
         ew0QnPh1YJs1YNaccCv/rcPluiPcP0BwWUzGJV9qa1S4nfqFCnjX/ummVXS0EkA34WWj
         PIfeVN7o/ysIpTzhvSM25rKxtUS9vJQDRdo6hotw7OygW/qGmIDTMR+dngQw6N1V8tuD
         syVAs3Sv5LflgdHCXkHKVkg+dN6yb6cPXiSwhGLGHDhvedGj8g2rrv1+tVKBKl53K0ex
         INQLrFurVEbxzy2sMtpQJPFsNiS3jBGlzt2NoAM29TBeE07DESL9+/X+oVyaoZtArkOT
         OMCw==
X-Gm-Message-State: AOAM530i8HdI7KpxFbUR0HYE0Y0LYbc5ut2j9LsXHKKBEPbHphd/B8Y1
        A7Xshe4ZWt+kHHVopleG2YT38Q==
X-Google-Smtp-Source: ABdhPJw0M886QE8e3VvBe8+bL9ia7CmIeYA3xZCtF1VVW5vOTXZQAtrZwFeCF3pZq8Pa1l6IxQcHsw==
X-Received: by 2002:a50:ec0e:: with SMTP id g14mr2365055edr.264.1617180502672;
        Wed, 31 Mar 2021 01:48:22 -0700 (PDT)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id g7sm747619ejw.51.2021.03.31.01.48.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 31 Mar 2021 01:48:22 -0700 (PDT)
Subject: Re: [PATCH v7 1/2] arm64: dts: qcom: sc7180-trogdor: Add lpass dai
 link for I2S driver
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, rohitkr@codeaurora.org,
        dianders@chromium.org, swboyd@chromium.org, judyhsiao@chromium.org
Cc:     Ajit Pandey <ajitp@codeaurora.org>,
        V Sujith Kumar Reddy <vsujithk@codeaurora.org>
References: <20210314061054.19451-1-srivasam@codeaurora.org>
 <20210314061054.19451-2-srivasam@codeaurora.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <2ac2e748-7e82-c670-5002-3fc6b361e1fe@linaro.org>
Date:   Wed, 31 Mar 2021 09:48:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210314061054.19451-2-srivasam@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 14/03/2021 06:10, Srinivasa Rao Mandadapu wrote:
> From: Ajit Pandey <ajitp@codeaurora.org>
> 
> Add dai link for supporting lpass I2S driver, which is used
> for audio capture and playback.
> Add lpass-cpu node with  pin controls and i2s primary
> and secondary dai-links
> 
> Signed-off-by: Ajit Pandey <ajitp@codeaurora.org>
> Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---


LGTM,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

>   arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 58 ++++++++++++++++++++
>   1 file changed, 58 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> index 436582279dad..fd345972a361 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> @@ -9,6 +9,7 @@
>   #include <dt-bindings/input/gpio-keys.h>
>   #include <dt-bindings/input/input.h>
>   #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include <dt-bindings/sound/sc7180-lpass.h>
>   
>   /* PMICs depend on spmi_bus label and so must come after SoC */
>   #include "pm6150.dtsi"
> @@ -283,6 +284,42 @@ keyboard_backlight: keyboard-backlight {
>   			max-brightness = <1023>;
>   		};
>   	};
> +
> +	sound: sound {
> +		compatible = "google,sc7180-trogdor";
> +		model = "sc7180-rt5682-max98357a-1mic";
> +
> +		audio-routing =
> +			"Headphone Jack", "HPOL",
> +			"Headphone Jack", "HPOR";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		dai-link@0 {
> +			link-name = "MultiMedia0";
> +			reg = <MI2S_PRIMARY>;
> +			cpu {
> +				sound-dai = <&lpass_cpu MI2S_PRIMARY>;
> +			};
> +
> +			sound_multimedia0_codec: codec {
> +				sound-dai = <&alc5682 0 /* aif1 */>;
> +			};
> +		};
> +
> +		dai-link@1 {
> +			link-name = "MultiMedia1";
> +			reg = <MI2S_SECONDARY>;
> +			cpu {
> +				sound-dai = <&lpass_cpu MI2S_SECONDARY>;
> +			};
> +
> +			sound_multimedia1_codec: codec {
> +				sound-dai = <&max98357a>;
> +			};
> +		};
> +	};
>   };
>   
>   &qfprom {
> @@ -720,6 +757,27 @@ &ipa {
>   	modem-init;
>   };
>   
> +&lpass_cpu {
> +	status = "okay";
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&sec_mi2s_active>, <&pri_mi2s_active>, <&pri_mi2s_mclk_active>;
> +
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	mi2s@0 {
> +		reg = <MI2S_PRIMARY>;
> +		qcom,playback-sd-lines = <1>;
> +		qcom,capture-sd-lines = <0>;
> +	};
> +
> +	mi2s@1 {
> +		reg = <MI2S_SECONDARY>;
> +		qcom,playback-sd-lines = <0>;
> +	};
> +};
> +
>   &mdp {
>   	status = "okay";
>   };
> 
