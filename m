Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98C80653F3E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Dec 2022 12:47:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235535AbiLVLr3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Dec 2022 06:47:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235472AbiLVLr1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Dec 2022 06:47:27 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B73972228B
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 03:47:26 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id z26so2345358lfu.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 03:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0EHYXR6sSgB5vdGVmrtOtKLZP6yhiJpLufZUquvuMTM=;
        b=pn1uImfgSjqommdSMhzsURLzDugGu0FTd7vckLh0eIppD+Hkw6yti7KierhwC+ebZK
         YF138uC/8YhdSSV20XcVnzKKwga9gEKb1OcBV+e08oHnK+JtwEPEbB735yPazKU/no34
         XDTspm8RPAH0vFr4eyWfXAmb8lnd2u+PpHJBrEeIE8NyCKdi4D61hKBafoBeLdnKj14V
         mMeoiV/ttwezyotlUUS5QQqu0dXsDHglxuBhKe49Qn9dWEmYTIa7TYC8tFmAugoJS5/B
         r0XnifxQkvH4tQF90cwlwL7BOj8N0wx2F/WMw04riTFamr+FzXbqRhlobs1jLiN4TepR
         ny4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0EHYXR6sSgB5vdGVmrtOtKLZP6yhiJpLufZUquvuMTM=;
        b=njlxkdqB7LfBEg4MN2B/ufuUUB6jY2Aa0/H5W5XPVFoiGAUvjkKUh/Q9yqVGIBm7aO
         fANRaNZIn9rWx4emg9jiH0u+yVb8DPG/6bDlwHUNcnRY919n3F2+OgWo16Ksk0jFSSaW
         WyXkYyQ7bd2t6nsRPjrXmSlEtHhPt9m23+5b64sYMBfpmSz7Lm4WXsbTCs/xNYYP1ik/
         wc/EHT5h2vyrgpjiWCckMTy56ujkemBh1AATyZ6+N+KpZ/bT1WIfzwhmbRN/jQSqY+Qg
         gim635Br1/Elax7HZIJkyQS7+RACchy4Jn8tcPExi09fX+Z3j321hapmbCFSJmOPTgrJ
         QfWQ==
X-Gm-Message-State: AFqh2koj7YXdb1o1qynNN6X5a1cQ6MBFZu50wMaB3jZT0PRtyvVkssCj
        MUnIn8/51aU2WMEA9ByqvqWJlw==
X-Google-Smtp-Source: AMrXdXvejv9SNAwlLbnZmw6FcDQmaKFCvnGJeIOT1kCLtjTtnwqqgUvY/tTwCYifiYAFep31jdzGkA==
X-Received: by 2002:a05:6512:1582:b0:4b6:e494:a98d with SMTP id bp2-20020a056512158200b004b6e494a98dmr2133911lfb.44.1671709645143;
        Thu, 22 Dec 2022 03:47:25 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id r12-20020ac25a4c000000b00492d064e8f8sm42937lfn.263.2022.12.22.03.47.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Dec 2022 03:47:24 -0800 (PST)
Message-ID: <51770a1c-45f6-9f5a-871d-022cd78a0d4b@linaro.org>
Date:   Thu, 22 Dec 2022 12:47:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 04/21] dt-bindings: msm: dsi-controller-main: Add
 compatible strings for every current SoC
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Cc:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@gmail.com,
        daniel@ffwll.ch, robh+dt@kernel.org, dianders@chromium.org,
        david@ixit.cz, krzysztof.kozlowski+dt@linaro.org,
        swboyd@chromium.org, konrad.dybcio@somainline.org,
        agross@kernel.org, andersson@kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
 <20221220123634.382970-5-bryan.odonoghue@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221220123634.382970-5-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/12/2022 13:36, Bryan O'Donoghue wrote:
> Currently we do not differentiate between the various users of the
> qcom,mdss-dsi-ctrl. The driver is flexible enough to operate from one
> compatible string but, the hardware does have some significant differences
> in the number of clocks.
> 
> To facilitate documenting the clocks add the following compatible strings
> 
> - qcom,apq8064-dsi-ctrl
> - qcom,msm8916-dsi-ctrl
> - qcom,msm8953-dsi-ctrl
> - qcom,msm8974-dsi-ctrl
> - qcom,msm8996-dsi-ctrl
> - qcom,msm8998-dsi-ctrl
> - qcom,sc7180-dsi-ctrl
> - qcom,sc7280-dsi-ctrl
> - qcom,sdm660-dsi-ctrl
> - qcom,sdm845-dsi-ctrl
> - qcom,sm8250-dsi-ctrl
> 
> Each SoC dtsi should declare "qcom,socname-dsi-ctrl", "qcom,mdss-dsi-ctrl";
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../display/msm/dsi-controller-main.yaml      | 20 +++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index 6e2fd6e9fa7f0..01afa9e9c4b3c 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -14,9 +14,21 @@ allOf:
>  
>  properties:
>    compatible:
> -    enum:
> -      - qcom,mdss-dsi-ctrl
> -      - qcom,dsi-ctrl-6g-qcm2290
> +    items:
> +      - enum:
> +          - qcom,apq8064-dsi-ctrl
> +          - qcom,msm8916-dsi-ctrl
> +          - qcom,msm8953-dsi-ctrl
> +          - qcom,msm8974-dsi-ctrl
> +          - qcom,msm8996-dsi-ctrl
> +          - qcom,msm8998-dsi-ctrl
> +          - qcom,dsi-ctrl-6g-qcm2290
> +          - qcom,sc7180-dsi-ctrl
> +          - qcom,sc7280-dsi-ctrl
> +          - qcom,sdm660-dsi-ctrl
> +          - qcom,sdm845-dsi-ctrl
> +          - qcom,sm8250-dsi-ctrl

Usual comment: can we keep the list sorted?

Best regards,
Krzysztof

