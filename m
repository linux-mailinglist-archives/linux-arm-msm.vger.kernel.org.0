Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40FE4625FB7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Nov 2022 17:42:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234319AbiKKQmU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Nov 2022 11:42:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233940AbiKKQmR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Nov 2022 11:42:17 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0444D845D5
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Nov 2022 08:42:15 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id h9so7212569wrt.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Nov 2022 08:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jLuR2VWvIX9pMUk66TarZozpZh1wCQd9RADTJwmvxkM=;
        b=oy6gPYB5GEObYkXtO86u2ukNIhs4ZE4MkQHohRL1Io8Jsuv79Qxy2NhphVAKjSiURu
         bbL11/gsu2Iix8RrqLDXHp7poDVunxH1jd0u3PFZaclwSXmZwnOGp552IwB04brJSLPU
         8A+aRMjSvDmuFsueyrhC/y8nNACHPFu1pAKNe5ez5BYcBeTFeUTxQ4X12VmgxnLWe6jz
         X4FrfkEvdR+efUCUNi2fYFD4ZaWAL2rralFmzBf+tGIA5xh1NC/hI5RV7ZuV9RsRFaJq
         YZ75CZJku5nVXKsRSrfxOLz64XeuO/nwXYLwaVK6n/xddJv46PZVYiwp6Riez2iw1mEc
         q4wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jLuR2VWvIX9pMUk66TarZozpZh1wCQd9RADTJwmvxkM=;
        b=cNhVQML6shW3j9l7UIk5PnU6+71zIvCLKhJiOSJz7cTqwVNGDeKr5PbY12DQ4I1F2d
         9vSN4u6ilb++C2blMsN0zV0mbT09aHK0JZYZCthN8vUSBXPV/gvfxe5wnQ2uzcso3v4c
         LZm9x37O4r+y/UV6TIc6igrQ9LcB2IAvllQ+Qfbcj1aLgGqBb+EmFNbjJz9eZAAagkhw
         d4nCnvE5jhUG0wte4p+17phrWhWTVrihR42EY2/ZHn9imKFSuUr0sDaj/3HVq4P5hMv+
         MmaYgiBoa9b1POzcVNVh2E/uDKzIT5DTAeKDV6ZWn2uyJV672z4ZX3f0nJWyMobI83yp
         DUTA==
X-Gm-Message-State: ANoB5pk8vBbUsbTSsgZqMpvQLhvu76nsb8mVt5Cx08T7PdzaeqO1LXBw
        yE5+qmQM8To46Z2/VF/5eAtGag==
X-Google-Smtp-Source: AA0mqf5Hhw3d5lwAqvy2lPvMVZhb9BL560UK90bhcGji4XJfrDGDLN1s2XcJv0l2tnXnm++pw4DYSg==
X-Received: by 2002:a5d:4cd0:0:b0:236:757c:54a1 with SMTP id c16-20020a5d4cd0000000b00236757c54a1mr1791120wrt.106.1668184934550;
        Fri, 11 Nov 2022 08:42:14 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id j5-20020a05600c1c0500b003cfbbd54178sm14270442wms.2.2022.11.11.08.42.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 08:42:13 -0800 (PST)
Message-ID: <c227c62e-4906-698c-fc27-11d17d6b0817@linaro.org>
Date:   Fri, 11 Nov 2022 16:42:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: qcom,wsa883x: Use correct SD_N
 polarity
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221110133512.478831-1-krzysztof.kozlowski@linaro.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20221110133512.478831-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/11/2022 13:35, Krzysztof Kozlowski wrote:
> Use correct polarity in example and powerdown-gpios description.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
> 
> Changes since v1:
> 1. New patch.
> ---
>   Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml
> index 6113f65f2990..99f9c10bbc83 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml
> @@ -23,7 +23,7 @@ properties:
>       maxItems: 1
>   
>     powerdown-gpios:
> -    description: GPIO spec for Powerdown/Shutdown line to use
> +    description: GPIO spec for Powerdown/Shutdown line to use (pin SD_N)
>       maxItems: 1
>   
>     vdd-supply:
> @@ -47,6 +47,8 @@ additionalProperties: false
>   
>   examples:
>     - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
>       soundwire-controller@3250000 {
>           #address-cells = <2>;
>           #size-cells = <0>;
> @@ -55,7 +57,7 @@ examples:
>           speaker@0,1 {
>               compatible = "sdw10217020200";
>               reg = <0 1>;
> -            powerdown-gpios = <&tlmm 1 0>;
> +            powerdown-gpios = <&tlmm 1 GPIO_ACTIVE_LOW>;
>               vdd-supply = <&vreg_s10b_1p8>;
>               #thermal-sensor-cells = <0>;
>               #sound-dai-cells = <0>;
> @@ -64,7 +66,7 @@ examples:
>           speaker@0,2 {
>               compatible = "sdw10217020200";
>               reg = <0 2>;
> -            powerdown-gpios = <&tlmm 89 0>;
> +            powerdown-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
>               vdd-supply = <&vreg_s10b_1p8>;
>               #thermal-sensor-cells = <0>;
>               #sound-dai-cells = <0>;
