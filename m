Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3ED782C82D2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Nov 2020 12:03:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728952AbgK3LDY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Nov 2020 06:03:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728907AbgK3LDX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Nov 2020 06:03:23 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE1ABC061A04
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 03:02:32 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id f190so21406430wme.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 03:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7f0W4vL0xlDeDL3x7JN2ia6TPDjtyH+/47iU1sBkTes=;
        b=B87p3t0QMfrUOJU+H+Lr2IwBCr1333AC0dSV391wrAHoVQbdzZdeQ1yb3ygJE2Pcke
         xDc5fda84oeZwMt3T5y7ueyj5WtBlbVDu6b3OxcsABz3utzwcD9aIcvzZ3mCc/btM9LF
         vflSeLOJGffNWWXB6W3SOYp+gxlpR9tq1NC+fw922EnvkXpQawV1Vamo3GBOWUJNNXUb
         agpu2lEnvKTnTmDxHDDI2zlXVREX8jqO2UxmH7vKTwuQZ+ChcwHhuPkDsRGWARN51eyr
         AsSuf+SnylqzXm8/U9afXA6U7KOPfoe2y4lQr8zlDSJEoTcHwZDdnlEsXBX/SwTBU1Fb
         h3+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7f0W4vL0xlDeDL3x7JN2ia6TPDjtyH+/47iU1sBkTes=;
        b=Yh00VF5L7TRL8Dl/aEraMc47O3Mg4WU1leC7uds4V7FU4oTMvNsEVs4jG0QTO61TCi
         CGNUIRwMqRSEGPwXQF736RO/R04adZX7/9oN2JBmAqXRSNdBXtSqFq4ktAc5LeYinMio
         rBFjL2MijM21Cflo0i8b1yL7Hsn9XJWiFwil+TQrf636OIoGWSyS5rlQd+1TOCfOv8oY
         QVztCyFvqXYqoAK6nEh1byiV6OmlrWUDychn2Gw0iyLPIiJFwXjMarxMCRrj8rKpFb/+
         R1irsWzmCICpraR0a9IvpB8MeKvG3h7bRhW+G/LaPaPteK5ODw+PjqU2SkONnP/YKvY0
         vayQ==
X-Gm-Message-State: AOAM530z4mnjIZ6yJBz2hkzVFgMzjNPsetS5FuKHWSxrR1bbfKrDVLOW
        TGArAP0z/Rv62gpoOtKWPCsLbA==
X-Google-Smtp-Source: ABdhPJxVo/5vsApqEyBSQwmb1Q/m3aw6KRuVQfHspGcwzY6k0X2hVQ2wvg8pvgA1XMgx67xaCc+ldQ==
X-Received: by 2002:a1c:7e87:: with SMTP id z129mr22698447wmc.176.1606734151516;
        Mon, 30 Nov 2020 03:02:31 -0800 (PST)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id o2sm17201493wrq.37.2020.11.30.03.02.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Nov 2020 03:02:30 -0800 (PST)
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: sc7180-trogdor: Add lpass dai
 link for HDMI
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, rohitkr@codeaurora.org
Cc:     V Sujith Kumar Reddy <vsujithk@codeaurora.org>
References: <1601448168-18396-1-git-send-email-srivasam@codeaurora.org>
 <1601448168-18396-3-git-send-email-srivasam@codeaurora.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <7e17ecf8-f191-1d6c-3473-d8bb060f2e84@linaro.org>
Date:   Mon, 30 Nov 2020 11:02:29 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1601448168-18396-3-git-send-email-srivasam@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 30/09/2020 07:42, Srinivasa Rao Mandadapu wrote:
> From: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> 
> Add dai link in sc7180-trogdor.dtsi for supporting audio over DP
> 
> Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


> ---
>   arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> index 5724982..850b43e 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> @@ -231,6 +231,7 @@
>   
>   		audio-jack = <&alc5682>;
>   
> +		#sound-dai-cells = <0>;
>   		#address-cells = <1>;
>   		#size-cells = <0>;
>   
> @@ -257,6 +258,17 @@
>   				sound-dai = <&max98357a>;
>   			};
>   		};
> +		dai-link@2 {
> +			link-name = "MultiMedia2";
> +			reg = <2>;
> +			cpu {
> +				sound-dai = <&lpass_cpu 2>;
> +			};
> +
> +			codec {
> +				sound-dai = <&msm_dp>;
> +			};
> +		};
>   	};
>   };
>   
> @@ -782,6 +794,9 @@ hp_i2c: &i2c9 {
>   		reg = <MI2S_SECONDARY>;
>   		qcom,playback-sd-lines = <0>;
>   	};
> +	hdmi-primary@0 {
> +		reg = <LPASS_DP_RX>;
> +	};
>   };
>   
>   &mdp {
> 
