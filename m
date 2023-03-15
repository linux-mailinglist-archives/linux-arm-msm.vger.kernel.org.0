Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1BBE6BB932
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Mar 2023 17:11:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232664AbjCOQLZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Mar 2023 12:11:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232711AbjCOQK4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Mar 2023 12:10:56 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 499A390B47
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 09:10:22 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id z5so19966968ljc.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 09:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678896620;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+2oNQhuWFl2xmjcGLuuONOAMitOfeFrzp8haVzsoX0w=;
        b=zNSd8aZRnYTp/dVaghTYE52N2Muzd8hzkgV+06GTLjEGcVgjLd5uBDXbgQeQ+QeVpE
         pS3NeYtqM0at4xzl3QmTtzIS+UXr+2K1nlJcGoyGFxr5cHbo75AQ3z+TH9i7RuGykQrZ
         VSI9ZB9quWDTt/viUHMQMNV/2Gf5x5C6idagsfuahdS3SCduO36rx7EcwnElSyjexYKX
         9UgCd/aNZ1u3H191uhXxpebCKOmU8MLgrjfJnuAif/IBFEVnUFrh7ycXD2QgsW2LmSg5
         wyI7gOkCB8FfVqAT1ahGHGb2Ots3MFonYkQr/xOiM/xoqiTk9epnwZvBo12knadZzFYG
         YtWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678896620;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+2oNQhuWFl2xmjcGLuuONOAMitOfeFrzp8haVzsoX0w=;
        b=EAAcgpvc6xgWM0WhJs1J1CWhO2J+U5OxsTG4cT3l3Zp5wiLzpGiXRtAPnDwmFSnZ8p
         M9lRJ1Iti35uzuUK2GRcpY4TMA8TGC/c1kj3dUOl1ZY8iGDhgHgJ++8S0jBhaMj9RSTT
         3ciugogCic5dSC0drdRVC+Tj+Aku4b7HfkYXibszeXFuibh7J9RpCIh8EABZ72QAcTW2
         +F588VZQd62jOEfLFsTBIfGglttXrTQXTH5E4gWbs2yJU65Z1AZ4RL01+5gLNnG4/5HL
         8cjM5ltFdvlfDE3hO+S9cRyU7Q+Qkl1nxqJVtxUabPfYPpaFggNWiGa3XRK5WkNcAcZR
         cVDQ==
X-Gm-Message-State: AO0yUKWQWjhdDtRJA5hTHteNpj5LeXjXT2uT+Z/g3XeicUN6n/iiCSvD
        WAx2tDmX9ULPUoV7OA0vheN80Q==
X-Google-Smtp-Source: AK7set8/kniOUBzZbXSQt5chSaEyICBH/kU6FZWPXX2Oajg7gqAEIVV0tva8jm0oRmhdgo+BJckQZA==
X-Received: by 2002:a2e:9b11:0:b0:298:b03d:5715 with SMTP id u17-20020a2e9b11000000b00298b03d5715mr786823lji.25.1678896620381;
        Wed, 15 Mar 2023 09:10:20 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id b24-20020a05651c033800b00298593e3a01sm910401ljp.70.2023.03.15.09.10.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Mar 2023 09:10:19 -0700 (PDT)
Message-ID: <684b31d8-8aad-79e1-247f-b7ef60ac5e95@linaro.org>
Date:   Wed, 15 Mar 2023 17:10:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 2/4] arm64: dts: qcom: sc7180: Drop redundant disable
 in mdp
Content-Language: en-US
To:     Nikita Travkin <nikita@trvn.ru>, agross@kernel.org,
        andersson@kernel.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20230315154311.37299-1-nikita@trvn.ru>
 <20230315154311.37299-3-nikita@trvn.ru>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230315154311.37299-3-nikita@trvn.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 15.03.2023 16:43, Nikita Travkin wrote:
> mdss is useless without a display controller which makes explicitly
> enabling mdp redundant. Have it enabled by default to drop the extra
> node for all users.
> 
> Signed-off-by: Nikita Travkin <nikita@trvn.ru>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sc7180-idp.dts      | 4 ----
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 4 ----
>  arch/arm64/boot/dts/qcom/sc7180.dtsi         | 2 --
>  3 files changed, 10 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> index c3bdd3295c02..828c8b55d925 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> @@ -339,10 +339,6 @@ &dsi_phy {
>  	vdds-supply = <&vreg_l4a_0p8>;
>  };
>  
> -&mdp {
> -	status = "okay";
> -};
> -
>  &mdss {
>  	status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> index 26def6e12723..e72d49a3d97d 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> @@ -818,10 +818,6 @@ dai-link@5 {
>  	};
>  };
>  
> -&mdp {
> -	status = "okay";
> -};
> -
>  &mdss {
>  	status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index f0de177981f9..4ee64ee824b3 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -2983,8 +2983,6 @@ mdp: display-controller@ae01000 {
>  				interrupt-parent = <&mdss>;
>  				interrupts = <0>;
>  
> -				status = "disabled";
> -
>  				ports {
>  					#address-cells = <1>;
>  					#size-cells = <0>;
