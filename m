Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E948B61F282
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Nov 2022 13:07:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231487AbiKGMHc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 07:07:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230507AbiKGMHb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 07:07:31 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10B9D2703
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Nov 2022 04:07:29 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id a15so15885101ljb.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Nov 2022 04:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=chNqcz3S5vRdVnVvUj92NQtmBcRaxQKZcnkrVPNpeNk=;
        b=oNDtTjV7weoRAYL+tZQHQhQGQnwfYUzTRoynoqB/9wvXAW6g/mK9f56G0HgCwbHg9h
         zyenX8YylD/n1Erc8Vwn7mZlAluOBgpSf9n3aMmKxv9Z1UhyJTxC/wP0zo+mHowJyhhI
         07B75KVjV8oGEDhji3UQmSzoSu8wNRJa6Rl5AVHu5lTOVkPTiMZUJIVP54ZSXVqBTSh+
         sdzemihWOIx7BRC4wzeWMJAEDBv7gbe/qXoXsJxbMR/YOYslj6q7NVeARr+EeIxIpnuc
         Kn0KQnhwxQ+Iff+2mD230vAnFBAxzfYY6Dfh2m/p9Ad/ig/XHg40XOly5oFe1sFUN76q
         bhfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=chNqcz3S5vRdVnVvUj92NQtmBcRaxQKZcnkrVPNpeNk=;
        b=AwpkuuubX8jCvgJYScEy/wvBh3esmVH5nZCxXt7vWgXQEP5dR5xfjWuQxssVbUIMYL
         mPW8cE4MHujRoDhpeLBzbPVei49YM0fDheob5SOSAqI1Pn092591lhIIHQ1xXi5uU3MU
         zcxzLETgIoyl2Mltw7ji4AEyjvRASZN7RubCQZomWGTN3C5V9ZLS3YLvCJYfmnhaBtKF
         uFZ/IDFBMORKs/ie1iqCsfhj5ZIHBIzimdXUFUt7M99bQIX7bGNRc2hdW2RVXEnTaWzT
         /CfhAUihidJc0PLbYxCSbpJgyxx2O0Sw2ZS+zV63SusgiCQBj0SOIewuMG8xiEbp5bu2
         BNbQ==
X-Gm-Message-State: ACrzQf1O/XVRwQwJRK+Mkcjx373I+MwzyPPx3DzVb1EBLSv+P9rhh27/
        uzTeX8fF2HZmhKZ2mbYUXLeDeA==
X-Google-Smtp-Source: AMsMyM6nKSgm0r8DvN0SF9gZ1Z35bfPo+P5lOhx9djgmdWCJmI3o77NJSYR6s1jogDhToXKKuXt+Hw==
X-Received: by 2002:a05:651c:1699:b0:277:c68:873e with SMTP id bd25-20020a05651c169900b002770c68873emr18844155ljb.276.1667822847460;
        Mon, 07 Nov 2022 04:07:27 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id s24-20020a056512203800b0048ad4c718f3sm1209784lfs.30.2022.11.07.04.07.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 04:07:26 -0800 (PST)
Message-ID: <4b617d34-60a5-cf5e-8b82-d8d889c69072@linaro.org>
Date:   Mon, 7 Nov 2022 13:07:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v2 1/4] dt-bindings: arm: cpus: Add Kryo 660 CPUs
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     patches@linaro.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Chanho Park <chanho61.park@samsung.com>,
        Thierry Reding <treding@nvidia.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221107120539.12305-1-konrad.dybcio@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221107120539.12305-1-konrad.dybcio@linaro.org>
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



On 07/11/2022 13:05, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@somainline.org>
> 
> Add a compatible for Kryo 660 CPUs found in at least Qualcomm SM6375.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Please ignore, resend incoming.

Konrad
> Changes since v1:
> - Pick up tags
> 
>   Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
> index 5c13b73e4d57..b2058345bb8e 100644
> --- a/Documentation/devicetree/bindings/arm/cpus.yaml
> +++ b/Documentation/devicetree/bindings/arm/cpus.yaml
> @@ -183,6 +183,7 @@ properties:
>         - qcom,kryo485
>         - qcom,kryo560
>         - qcom,kryo570
> +      - qcom,kryo660
>         - qcom,kryo685
>         - qcom,kryo780
>         - qcom,scorpion
