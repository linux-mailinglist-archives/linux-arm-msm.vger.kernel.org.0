Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F47968BA47
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Feb 2023 11:35:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229576AbjBFKfd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Feb 2023 05:35:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231177AbjBFKew (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Feb 2023 05:34:52 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2455823674
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Feb 2023 02:34:08 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id q8so8292695wmo.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Feb 2023 02:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mxcbcYd9yM82GRoEiNqLK6kFAvDnYbetYCZ2WHY7tl0=;
        b=oOCz+x6xMtkHfCn/UFoxpvWOBqVNrzoSaCRBvDP9ng3efAm12zRu+1g8vQc9nLYS2o
         SnlRlRqBV9eYnTp+HtlaNFnMvcmf1i4rHputHf4hdYb9Tfn0se5xQ+BNvSenuCGbiIjN
         2i19dexf8lUESiJZQYX8G5Cg5YVRyG/X6liEmp5Fl/WHI7e4TOzDz11S8iQrxU5Lozwl
         9fpCaOZTnVq8gDGoc1hhdT26/6SoyRxjoJZZYm5tf5QZablCt2VTrUhOLodL0QKAVSqS
         c+539e5leueCdsl92RhlquIGJxEUASESTsfbN5nH2n3A4jq/DAtAdQiESNoGoIUUsSAw
         1xFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mxcbcYd9yM82GRoEiNqLK6kFAvDnYbetYCZ2WHY7tl0=;
        b=c7INpTISyT16hmDnW2tj3wvxNGdm+poiJcZNb2ppLM4YN49Dc5VHIERV6U0dURqFWz
         xxpa9E0qJLZknKGx0p0O8FFIiMu9lo2DSo1fHR8MBr1DgCsoBhFdPtE1i9cQsLeDSTq0
         IkiabXYAQCk3+9DyecTQZnPb/Wyt4h893WZJwSkmxVV7mJ7biJIlqwRlmhvAEhjRMCc7
         2KCLtMnq1I63D3Dszgvsztlw7N/Fj3aPsEvIjRMFfiAChLCpFbJm44ZaW87RaCtBiExT
         OcKzVLbOok/pANF+VoDZNwyihILRkx7J/OHBouLCynXHDoWYSs/UPlADKZ0v9a3RGruN
         ENoA==
X-Gm-Message-State: AO0yUKXbQX/OrWKFpUEKLY4tuaPyJ6LnSg351PKl5spywPOf9X0ePZAm
        dSX2CUtYSYfB3PUyQvpLo335Yg==
X-Google-Smtp-Source: AK7set/vDvn10a+fQdAU96ODN7IXb+vtLvWxhVPv8Zvs8cIL0xewS3e+HPO0gyTVmaYVvrbsaOQTSQ==
X-Received: by 2002:a05:600c:3c96:b0:3da:516:19ed with SMTP id bg22-20020a05600c3c9600b003da051619edmr18037107wmb.29.1675679604943;
        Mon, 06 Feb 2023 02:33:24 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n9-20020a05600c3b8900b003d9aa76dc6asm16715024wms.0.2023.02.06.02.33.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 02:33:24 -0800 (PST)
Message-ID: <f1665a8f-5b5b-7d98-a94e-d1b1df04afdf@linaro.org>
Date:   Mon, 6 Feb 2023 11:33:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/5] dt-bindings: display: msm: dp-controller: document
 SM8450 compatible
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230206-topic-sm8450-upstream-dp-controller-v1-0-f1345872ed19@linaro.org>
 <20230206-topic-sm8450-upstream-dp-controller-v1-1-f1345872ed19@linaro.org>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230206-topic-sm8450-upstream-dp-controller-v1-1-f1345872ed19@linaro.org>
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

On 06/02/2023 11:17, Neil Armstrong wrote:
> The SM8450 & SM350 shares the same DT TX IP version, use the
> SM8350 compatible as fallback for SM8450.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index 0e8d8df686dc..98bae326e655 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -25,6 +25,10 @@ properties:
>        - qcom,sc8280xp-edp
>        - qcom,sdm845-dp
>        - qcom,sm8350-dp
> +      - items:
> +          - enum:
> +            - qcom,sm8450-dp

Indentation looks wrong here. Testing should fail, did you test it?

Best regards,
Krzysztof

