Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9918162BC2E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 12:39:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238889AbiKPLjz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 06:39:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232951AbiKPLjQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 06:39:16 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A82B95B851
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 03:26:57 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id bp15so28933212lfb.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 03:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WO8pGk2BtJ5SR1HFNUrXI6oNBAFdhi38e2dTG4f6QyE=;
        b=jHBeRIEQAojNe0b9tevX4K+rOyn+2dC9TLKAX7JnLugSYHxEPjuYaEeiaWxvsNjT3l
         6J7MYFUKi6WKuDtagBeLKPLKhg1UrN+ddt9e8ioGDdGLeMJCih/pSmC7OA7+TSsGnTzR
         DFPcL38wk7774acfRt2xpPDqWOojJCkuQ4AFkFvR6hVx1VzscGuQrDfgx5pClA0g+EaH
         vBzJmipGY4el5f8cyVuRTgshbGie9mjP9GMbyZtza6g5BwtU0XxUSrUVihCl+BH/97xG
         /gWXA3b28qesH2rSABmvOJpXkYDaE2E5lmdcMB5e1rqK+mRfVHPaIUYSfr0Mng2BFGyn
         KIRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WO8pGk2BtJ5SR1HFNUrXI6oNBAFdhi38e2dTG4f6QyE=;
        b=oz/LZ0rGHR+ppm4impBeEqoq0Xt6mTVjfydcDEoQ6Ll+/7BFR9sjkSgxmSxJHWL1t6
         qTAfCn8b+dFNdW4/oIX8RYJ0+cUd22r7SwTemsffVb5gsPeabqobc8MqKOJIsymlBNit
         58AJgW31fSITI50qrHsP6l/S1WsqNS1cK5bjXU6DYaqktqZ8nb/EsLco7ncBZQf945WN
         MDrVT2CxUyx0JkkBQw/9KLl+coPDswMZce2l6bhNlxs3zpv3p2DT+WC/LIGAkjd4e1ce
         cxcN6RA2V0DczGv5tqPFhxQTPVU2B3F/kcaxRkrTV+OZOtrOTrTdutGdK3luIGj0zkwy
         3/kg==
X-Gm-Message-State: ANoB5pnfHNri4625oB1+C/CSQxAG9/ODAFMTzjoEp/QE2hlhUCoZ2eYG
        nXRa3C4/hku4h6U9RdTbo5sqUC2UNyNvesBs
X-Google-Smtp-Source: AA0mqf676ax6bbZt0psW63FhP1PZcELcaNCa/iyrl4/M889Rk8oiaIdVAX/Su/2MiNSfLRnvKLuPrA==
X-Received: by 2002:a05:6512:530:b0:4a4:77a8:45a4 with SMTP id o16-20020a056512053000b004a477a845a4mr6708458lfc.654.1668598015691;
        Wed, 16 Nov 2022 03:26:55 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id s8-20020a056512314800b00492ce573726sm2548868lfi.47.2022.11.16.03.26.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 03:26:55 -0800 (PST)
Message-ID: <4dd96db7-b667-7b8f-f80d-a250ac63f223@linaro.org>
Date:   Wed, 16 Nov 2022 12:26:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] dt-bindings: thermal: qcom-tsens: Add compatible for
 sm8550
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Amit Kucheria <amitk@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org
References: <20221114-narmstrong-sm8550-upstream-tsens-v1-0-0e169822830f@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221114-narmstrong-sm8550-upstream-tsens-v1-0-0e169822830f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/11/2022 11:09, Neil Armstrong wrote:
> The Qualcomm SM8550 platform has three instances of the tsens block,
> add a compatible for these instances.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> To: Andy Gross <agross@kernel.org>
> To: Bjorn Andersson <andersson@kernel.org>
> To: Konrad Dybcio <konrad.dybcio@somainline.org>
> To: Amit Kucheria <amitk@kernel.org>
> To: Thara Gopinath <thara.gopinath@gmail.com>
> To: "Rafael J. Wysocki" <rafael@kernel.org>
> To: Daniel Lezcano <daniel.lezcano@linaro.org>
> To: Zhang Rui <rui.zhang@intel.com>
> To: Rob Herring <robh+dt@kernel.org>
> To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-pm@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> index f0bd4b979e28..09dbd96d380e 100644
> --- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> +++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> @@ -58,6 +58,7 @@ properties:
>                - qcom,sm8250-tsens
>                - qcom,sm8350-tsens
>                - qcom,sm8450-tsens
> +              - qcom,sm8550-tsens

alOf:if:then should be updated.

Best regards,
Krzysztof

