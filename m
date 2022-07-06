Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07BC7568E5F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jul 2022 17:54:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234376AbiGFPyE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jul 2022 11:54:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234212AbiGFPxn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jul 2022 11:53:43 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3C10E02B
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jul 2022 08:53:00 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id y16so26614096lfb.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jul 2022 08:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=3akakfTBgNkS72nT8lwBK+VGmgeYXh2NqN91EsDThbo=;
        b=hTKI/rqJLNYVySE/UI3KEFDJW/pe3y5dp7t8sqYmPCRy1cKkpphw6NzDiWMY13xNam
         u19KXrnp8owOW4X3d8OdIxExKLEeLDQ5cLSQEgLmgzJSL7zmrsN7Zez7gv2ZPNh9ZfMg
         NZtRqUvKfJWjoJHbt6sSXGEAoMYD4HLOsw7RjfmFavLhrk/EJtbBw4s3UnCLpdqdqH/Y
         s0I3LXH3UryWtb6LVWNcLGu/3C+Qfljpu518uFYpYl9sZnSvtc/3E+mSdSPNaleuzWK3
         loES3yYJtWPOAcrmvGLbj9cAD/6t03WWN0hCuWXutg/9VOcU+gdhPMNUYAzcKydvn1h5
         ia4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=3akakfTBgNkS72nT8lwBK+VGmgeYXh2NqN91EsDThbo=;
        b=u6mjmGE7PsW0scZ9TiF3IN6dmhhgfZFmsjy0T7Frb4V1rAw9rZg81zeY0Wji5jzhAW
         j8ReSb9vpyB2qHcYUQ0xX/0uW2LOpCg7orKUP4jcKh32CYQ5032f733loO1pMI77C1jr
         U0Z2X2HyyeJqGqPD5K7jfHJCpcfj2276jqweTb9rBbmwaGsxo0Qp6RLZF7VdSggVmGbq
         AR4QqK4ifRvLR2WXSw7mTMxdoo6C49aRa0sSHO8FMGWHvrsR5Jkn6T2GI1wUkDL4/6gB
         sVqJKa563x1ytPasjoLHYXlyFVWiZPuSOXaIC2R7rvjRBPDFtXWLT/M/h4tzNxPoSdpj
         Ieog==
X-Gm-Message-State: AJIora9Sn1lvVt7OWfSLDNXGVa1iJhSFNb65pQRxQdQicllNKPaHx9xu
        8ILL5D2zUgGsVGJ9sJ15taheKw==
X-Google-Smtp-Source: AGRyM1vBMVXGOieLNVK2/2fBOu/0m+ARLkcBs8rvqmVVeg4hr5pNnbxvTWSoYsNBH+ke7FdXkGvkSQ==
X-Received: by 2002:a05:6512:b1c:b0:481:618f:ec9 with SMTP id w28-20020a0565120b1c00b00481618f0ec9mr19723721lfu.217.1657122779036;
        Wed, 06 Jul 2022 08:52:59 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id v10-20020a2ea60a000000b0025bf92bd024sm3740383ljp.102.2022.07.06.08.52.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 08:52:58 -0700 (PDT)
Message-ID: <7b504ecb-b05a-549e-e2ce-18c539f68655@linaro.org>
Date:   Wed, 6 Jul 2022 17:52:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/4] dt-bindings: display/msm/gmu: account for different
 GMU variants
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20220706145222.1565238-1-dmitry.baryshkov@linaro.org>
 <20220706145222.1565238-4-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220706145222.1565238-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/07/2022 16:52, Dmitry Baryshkov wrote:
> Make display/msm/gmu.yaml describe all existing GMU variants rather than
> just the 630.2 (SDM845) version of it.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/gmu.yaml  | 166 +++++++++++++++---
>  1 file changed, 146 insertions(+), 20 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
> index fe55611d2603..67fdeeabae0c 100644
> --- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
> @@ -20,35 +20,24 @@ description: |
>  properties:
>    compatible:
>      items:
> -      - enum:
> -          - qcom,adreno-gmu-630.2
> +      - pattern: '^qcom,adreno-gmu-6[0-9][0-9]\.[0-9]$'
>        - const: qcom,adreno-gmu
>  
>    reg:
> -    items:
> -      - description: Core GMU registers
> -      - description: GMU PDC registers
> -      - description: GMU PDC sequence registers
> +    minItems: 3
> +    maxItems: 4
>  
>    reg-names:
> -    items:
> -      - const: gmu
> -      - const: gmu_pdc
> -      - const: gmu_pdc_seq
> +    minItems: 3
> +    maxItems: 4
>  
>    clocks:
> -    items:
> -      - description: GMU clock
> -      - description: GPU CX clock
> -      - description: GPU AXI clock
> -      - description: GPU MEMNOC clock
> +    minItems: 4
> +    maxItems: 7
>  
>    clock-names:
> -    items:
> -      - const: gmu
> -      - const: cxo
> -      - const: axi
> -      - const: memnoc
> +    minItems: 4
> +    maxItems: 7
>  
>    interrupts:
>      items:
> @@ -76,6 +65,9 @@ properties:
>  
>    operating-points-v2: true
>  
> +  opp-table:
> +    type: object

instead: opp-table:true

> +

Best regards,
Krzysztof
