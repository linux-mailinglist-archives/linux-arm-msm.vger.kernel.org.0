Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 614C5542BAF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jun 2022 11:39:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234274AbiFHJij (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jun 2022 05:38:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235061AbiFHJiC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jun 2022 05:38:02 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB6C4184907
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jun 2022 02:05:16 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id fd25so26187516edb.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jun 2022 02:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=oiAKojnSb91/fs9PbBc2BR8fQQ+2pgjjbaqdMMi6Ld0=;
        b=iR8SBG8llqld/s9wiSkQcvkD5SyH+0lxEupixJwq/BcjKOMCXVBNd3hXbWO/YaHTOM
         paTtgKf2qAwV140JUSvJP3aItVayrqwIahefBZVHlo01Y7sgOdMTOMaRrhaOArLXZDMD
         tdRyAxv3IHihl+A1mOzpRv9vE9xkdidbHad5YfE0mHNyWWTewseGB//634ZxSlY49cSI
         MaQ6lfEVCdTgzvQQO44fyhTeFPzslfQcvaOWYKXlSt3uuWoXl9pU7ZDRb4EHPMsRlKjc
         6hHDdhhR05SjWAzKg8JdiuUhuQT+C9kmTSiPm8/ugSJYS00Ms/FRUdrNBSE6LEzLnLao
         njcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=oiAKojnSb91/fs9PbBc2BR8fQQ+2pgjjbaqdMMi6Ld0=;
        b=QkeXA+ViJSJ/K06XPt4T1e0cTz/RUXmvZKKUo5wpl8yL3BOjqAOZFFLYnmtB9rUj8X
         yRm/kpNk9LyyrGzyyQqURnVGZrhWiAc42Gs1KT4Zo1B1x9bF/phydCeoroRe1b+gwkzB
         sUZnhVw8genai/lIcXeO+DFwiRN9+AuzNnQPcZqYMCDpFnvJPillFoRRkelxoA1cPOcL
         BwxNwjGyZmbV/KfZs+ZC/GV8nKSX7boRlX79HVOqsfvhyEPW6huep6DbfnQII6HWwVu0
         FZT31oHB+hVz0KCVV+Xrg4HRGPD33KWl3n/9j4uvLciydv7L8yAD0sI/XeBIlE3gq7/c
         7Sew==
X-Gm-Message-State: AOAM530U/b5ZX4q0uRgY9EqpON4uVig340BikH08MdEF2EqgbrLUxU8B
        uCL4TDMj/vab4nK47wKvlhL9YvtfCKpJZA==
X-Google-Smtp-Source: ABdhPJyckb8xscBNTOvpq4Q37RPBgb7rImH1MWN1fFRpLJNZ8145876OyuEylO5gyszpaBgghwXnrg==
X-Received: by 2002:a05:6402:2750:b0:42e:3d52:d270 with SMTP id z16-20020a056402275000b0042e3d52d270mr30814728edd.332.1654679115174;
        Wed, 08 Jun 2022 02:05:15 -0700 (PDT)
Received: from [192.168.0.190] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id g22-20020aa7c596000000b0042deea0e961sm11689352edq.67.2022.06.08.02.05.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jun 2022 02:05:14 -0700 (PDT)
Message-ID: <c431b51a-f68f-8608-5d5d-6dac85e2be4f@linaro.org>
Date:   Wed, 8 Jun 2022 11:05:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v1 2/7] dt-bindings: display/msm: hdmi: mark old GPIO
 properties as deprecated
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, David Heidelberg <david@ixit.cz>
References: <20220607185806.2771739-1-dmitry.baryshkov@linaro.org>
 <20220607185806.2771739-3-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220607185806.2771739-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/06/2022 20:58, Dmitry Baryshkov wrote:
> Mark obsolete GPIO properties as deprecated. They are not used by
> existing device trees. While we are at it, also drop them from the
> schema example.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/qcom,hdmi.yaml         | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,hdmi.yaml b/Documentation/devicetree/bindings/display/msm/qcom,hdmi.yaml
> index 2f485b5d1c5d..2b1cac0851ce 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,hdmi.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,hdmi.yaml
> @@ -59,22 +59,27 @@ properties:
>  
>    qcom,hdmi-tx-ddc-clk-gpios:
>      maxItems: 1
> +    deprecated: true
>      description: HDMI DDC clock
>  
>    qcom,hdmi-tx-ddc-data-gpios:
>      maxItems: 1
> +    deprecated: true

This is confusing. These two are not defined in the old bindings, not
used by DTS, not used by Linux implementation - why did you add them?

>      description: HDMI DDC data
>  
>    qcom,hdmi-tx-mux-en-gpios:
>      maxItems: 1
> +    deprecated: true
>      description: HDMI mux enable pin
>  
>    qcom,hdmi-tx-mux-sel-gpios:
>      maxItems: 1
> +    deprecated: true
>      description: HDMI mux select pin
>  
>    qcom,hdmi-tx-mux-lpm-gpios:
>      maxItems: 1
> +    deprecated: true
>      description: HDMI mux lpm pin
>  
>    '#sound-dai-cells':
> @@ -171,8 +176,6 @@ examples:
>            <&clk 61>,
>            <&clk 72>,
>            <&clk 98>;
> -      qcom,hdmi-tx-ddc-clk-gpios = <&msmgpio 70 0>;
> -      qcom,hdmi-tx-ddc-data-gpios = <&msmgpio 71 0>;
>        hpd-gpios = <&msmgpio 72 0>;
>        core-vdda-supply = <&pm8921_hdmi_mvs>;
>        hdmi-mux-supply = <&ext_3p3v>;


Best regards,
Krzysztof
