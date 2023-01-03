Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4771E65BF82
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jan 2023 13:00:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237500AbjACL6p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Jan 2023 06:58:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237486AbjACL6n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Jan 2023 06:58:43 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82D5FE08B
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jan 2023 03:58:41 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id b24-20020a05600c4a9800b003d21efdd61dso22916575wmp.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jan 2023 03:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TFOtRS8x5vpu7ShQKJvJhp6lfmfKxbiaitTGeCP2Z64=;
        b=N1sABL+fBmR5gljhqp+7mTyQxLHJ5zKnyoN9GmOn1UKKnL2tANbqsVJcLvmF13yOeZ
         s0TIKEd185IFlQbg7AQVby5ZQZxgnw/iVpRa/WYGS026ZRPxnUedPEgSPVxRtDx20NGw
         YPbval6OeGsU6Ohnl5mQA3epUucmxjwhHz2OXjQHSPNNy4kn457Tv5KlrGQHwokgzbdv
         VKvmWFsiPrjWlsxVoL7+xT6UoKRhfhX1VtCvHdJ5Z8iO73qk/v4PpGDJImDvF41HCLuq
         r8hTf1PGtX8pXtaqd5Vp/FZAoKN7nqe381TeMFpLGvxCuFiF9hMMqoG2Ogeu54lQWVfY
         I6JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TFOtRS8x5vpu7ShQKJvJhp6lfmfKxbiaitTGeCP2Z64=;
        b=qF6g4GO6ozeTkjmY+j5KADfvYmKGshhyyY1XaHIhka0BbJQaMwBQchv8Tb8t7g97wD
         GzP5DXkIQUH9f7MQKGOFa9PD2CeR5sjaOnQBmctWTnzD5JulyoX5YmmBzHE344p4ToCx
         TmBjOJFp03QV6nT3XVOX3VD5hdv5JNuc+3R2GqE1W2yzaDsJDON0rEwX3OD35Ozn8k4J
         AbrWO6iv0YhUz/YjxPE1NWUyxq5nGD4E19sYP1McZ8mctusvQx7cIgOQ+nNTyHx2Oc0l
         w3htN09qrQ4y9p5biUqX/SNiE7TrSlySJ6HvjSmN34apzMcHnPhwnNs+OhzF1f2cP7St
         6nXQ==
X-Gm-Message-State: AFqh2kr2crUZwptP5QPoYg1xues43d4vU9RiEqKMgFo2e6cFwbd43/0E
        1OCcfzWa2folKdna5t9hZjSTLw==
X-Google-Smtp-Source: AMrXdXs6gZ2Jxyk16Clzy4XwbW9PERGbRK8qvfNNqLl5fXSgzdhAP4DvSM5CNUykg/qCvVEZG4+psg==
X-Received: by 2002:a05:600c:2d85:b0:3d0:7d89:2256 with SMTP id i5-20020a05600c2d8500b003d07d892256mr30142632wmg.13.1672747120098;
        Tue, 03 Jan 2023 03:58:40 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id s16-20020a1cf210000000b003c6bd12ac27sm41448098wmc.37.2023.01.03.03.58.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jan 2023 03:58:39 -0800 (PST)
Message-ID: <267e0f35-abaf-c711-e8a6-f7e800e881d7@linaro.org>
Date:   Tue, 3 Jan 2023 11:58:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/3] dt-bindings: nvmem: qfprom: add sdm670 compatible
Content-Language: en-US
To:     Richard Acayan <mailingradian@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20221205230116.2204-1-mailingradian@gmail.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20221205230116.2204-1-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 05/12/2022 23:01, Richard Acayan wrote:
> There is some configuration in SDM670's QFPROM. Add the compatible for
> it.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>   Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
>   1 file changed, 1 insertion(+)

Applied thanks,

--srini
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> index 2eab2f46cb65..01ec2143a3b5 100644
> --- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> @@ -27,6 +27,7 @@ properties:
>             - qcom,sc7180-qfprom
>             - qcom,sc7280-qfprom
>             - qcom,sdm630-qfprom
> +          - qcom,sdm670-qfprom
>             - qcom,sdm845-qfprom
>             - qcom,sm6115-qfprom
>         - const: qcom,qfprom
