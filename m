Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87BFE6C933D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Mar 2023 10:57:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230237AbjCZI5G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 26 Mar 2023 04:57:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231861AbjCZI5F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 26 Mar 2023 04:57:05 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B406D59FA
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Mar 2023 01:56:59 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id eg48so24055157edb.13
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Mar 2023 01:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679821018;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dluC4HDOGibpGXJ73bE6ouywRyXzDyJti+JzH9GsPB8=;
        b=dAX+2c98gBcOgphaLBmDMcUtwqBUbMPrf7tUqDQXI9/on4bdB2o1S2qPR4BB0I8CFp
         JEYxK6mp1T9zqWoYzm8ocoMGwcE+YHudPDWo9hq/GpUxCj+jtB81IDA7uIat6JSGLToo
         Uw9i2QbZhrKgabm0h+cYQukBtUR+PmOgtbqjMC2qu8DMekJe4U4yQT2VFkOd0/LOr9gg
         Fv1+SA1bF6FbMdBmEsc8sjjDG6iBam1koTXzf8cci08ShzIrjX4Q8X4fXbUzued81kGv
         VgsBMpDsqrTLvZ3o2Oi8sDWTaNGDMzNzZeKgKBH+EMkJjmpWxyE36VHABwnGJUCeiWja
         hBwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679821018;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dluC4HDOGibpGXJ73bE6ouywRyXzDyJti+JzH9GsPB8=;
        b=HBqvvsrSdo7xjT3NL+08hmZkc1Adsw2VOmEyd+i1Iyh4vrtwtoP33+Piw3W78X0DDf
         lqpcI42eM+N8GdU2MdWb5jXaFi5KeQo5tOyusC87/LN40SKYtDTitIwAzTOMbhh8UEl0
         P88uFcm4Wi3Wik6qrQViZP+utN/F4Ap/mj1DnLS08vewpHE5BpeAQOy482h24DDZzxIT
         PpV+8nqfZ5NhoyrCduoOAa8RZimJB4qP+DjUGINQuq0t2/qJJaC5N/fYWmZGyHfgYlX8
         hqS+3r9YoWMO0twx7rv1u4ENBnH725gbrHQzKKvH+38WUo3XJpmczfBt4klH+EbDVz7L
         tArw==
X-Gm-Message-State: AAQBX9eBOH3JUtECNr6emDuKY4X4JpjtiyefG0frQlx+2M7Eq18tEzz8
        st4HvTVHMWV/N89z6iabCoRuCA==
X-Google-Smtp-Source: AKy350Z1I9N9tKciexN2FNB0mlsriQqOFDimd2Edursh4PjdEtRe+/tqkkO9tL+uF3J+Cye7s6Jrsw==
X-Received: by 2002:a17:906:94c2:b0:932:d2bb:4fd with SMTP id d2-20020a17090694c200b00932d2bb04fdmr8026585ejy.58.1679821018291;
        Sun, 26 Mar 2023 01:56:58 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:6cac:926d:a4f2:aa09? ([2a02:810d:15c0:828:6cac:926d:a4f2:aa09])
        by smtp.gmail.com with ESMTPSA id a10-20020a1709065f8a00b0092595899cfcsm12722754eju.53.2023.03.26.01.56.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Mar 2023 01:56:57 -0700 (PDT)
Message-ID: <f59377f9-f16d-eb36-230d-430766c93be4@linaro.org>
Date:   Sun, 26 Mar 2023 10:56:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 3/4] dts: arm64: qcom: sdm845-oneplus: enable SLPI
Content-Language: en-US
To:     Dylan Van Assche <me@dylanvanassche.be>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20230325135114.21688-1-me@dylanvanassche.be>
 <20230325135114.21688-4-me@dylanvanassche.be>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230325135114.21688-4-me@dylanvanassche.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/03/2023 14:51, Dylan Van Assche wrote:
> Enable the SLPI DSP on the Oneplus 6 phone with a Qualcomm SDM845 SoC.
> 
> Signed-off-by: Dylan Van Assche <me@dylanvanassche.be>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> index b01542d79ae2..a14e6021c934 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> @@ -450,6 +450,11 @@ &ipa {
>  	status = "okay";
>  };
>  
> +&slpi_pas {

Judging by context it does not look like properly ordered. m is before s.

> +	status = "okay";

status is the last property.

> +	firmware-name = "qcom/sdm845/oneplus6/slpi.mbn";
> +};
> +
>  &mdss {
>  	status = "okay";
>  };

Best regards,
Krzysztof

