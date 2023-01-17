Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0474066E639
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jan 2023 19:41:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231153AbjAQSh5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 13:37:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232715AbjAQSdl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 13:33:41 -0500
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0465F27D4B;
        Tue, 17 Jan 2023 10:05:48 -0800 (PST)
Received: by mail-ot1-f42.google.com with SMTP id g2-20020a9d6b02000000b006864bf5e658so1083481otp.1;
        Tue, 17 Jan 2023 10:05:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PM98rtw7LbzsvTCif2C+5NEYIZSk3KLr63ivyr75RYs=;
        b=09x6Cilpomg/oxCWUi+hxCs9E7p960aaBBHbIZ49g7V5B+iVaoVgS9WpC/g5Zz09VK
         Bml5zLNBBl/ZfPjdt205UrF1QoPwC1iemUNFZeOIdQvDmYJs3l9hZ+/3GartA1feDBjY
         GXlY769UGeNEiOpGtjWXlhnD3nqeQ+GMlQASqiYUFxQwurhE04F8W6UMrYIayoID0cED
         rZlMHZ7k4Oa29BlsFRLnk1cQ3GsLnheC0rhBXR7h2nLhxu5ouRbsrfS+4yJBFHPXRrVk
         yGMz4AtE8lLy/QVvUWnYVkO5VBxSIxIrqhv7+VlTHz9EVsJoBqJX6G/50npd0KZCSxWq
         722w==
X-Gm-Message-State: AFqh2kp1qfsf0bb/PxqerPzgw1AaRcEdZsglm729HwIKsdx+xbwnEZDj
        jytE0AYfcSRg16YoEisEwpTwLpswXg==
X-Google-Smtp-Source: AMrXdXsPrNCO64CoqtqVoJIgO/1bF3oVZOIa0uU6FJXT3ezisRO3DooZ35OaZk84rtCZ7k9My/qgow==
X-Received: by 2002:a9d:624a:0:b0:66d:a5f7:9adc with SMTP id i10-20020a9d624a000000b0066da5f79adcmr2638708otk.2.1673978747227;
        Tue, 17 Jan 2023 10:05:47 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id t11-20020a9d590b000000b00677714a440fsm16777969oth.81.2023.01.17.10.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 10:05:46 -0800 (PST)
Received: (nullmailer pid 3328585 invoked by uid 1000);
        Tue, 17 Jan 2023 18:05:46 -0000
Date:   Tue, 17 Jan 2023 12:05:46 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v6 02/11] dt-bindings: display/msm: add SoC-specific
 compats to qcom,mdp5.yaml
Message-ID: <20230117180546.GA3323490-robh@kernel.org>
References: <20230113083720.39224-1-dmitry.baryshkov@linaro.org>
 <20230113083720.39224-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230113083720.39224-3-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jan 13, 2023 at 10:37:11AM +0200, Dmitry Baryshkov wrote:
> Add platform-specific compatible entries to the qcom,mdp5.yaml to allow
> distinguishing between various platforms.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/qcom,mdp5.yaml         | 17 ++++++++++++++++-
>  .../bindings/display/msm/qcom,mdss.yaml         |  6 +++++-
>  2 files changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
> index 5e3cd7abf046..cb7bf48c3a58 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
> @@ -16,7 +16,22 @@ maintainers:
>  
>  properties:
>    compatible:
> -    const: qcom,mdp5
> +    oneOf:
> +      - const: qcom,mdp5
> +        deprecated: true
> +      - items:
> +          - enum:
> +              - qcom,apq8084-mdp5
> +              - qcom,msm8916-mdp5
> +              - qcom,msm8917-mdp5
> +              - qcom,msm8953-mdp5
> +              - qcom,msm8974-mdp5
> +              - qcom,msm8976-mdp5
> +              - qcom,msm8994-mdp5
> +              - qcom,msm8996-mdp5
> +              - qcom,sdm630-mdp5
> +              - qcom,sdm660-mdp5
> +          - const: qcom,mdp5
>  
>    reg:
>      maxItems: 1
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
> index ba0460268731..dcde34ffc8d0 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
> @@ -88,7 +88,11 @@ patternProperties:
>      type: object
>      properties:
>        compatible:
> -        const: qcom,mdp5
> +        oneOf:
> +          - const: qcom,mdp5
> +          - items:
> +              - {}
> +              - const: qcom,mdp5

Just 'contains' is sufficient for all this. The exact length and order 
will be checked by qcom,mdp5.yaml. With that,

Reviewed-by: Rob Herring <robh@kernel.org>

Rob
