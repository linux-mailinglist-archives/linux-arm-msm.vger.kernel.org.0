Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8702B65AA66
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Jan 2023 16:40:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229620AbjAAPkO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 1 Jan 2023 10:40:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229682AbjAAPkM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 1 Jan 2023 10:40:12 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F01538B4
        for <linux-arm-msm@vger.kernel.org>; Sun,  1 Jan 2023 07:40:11 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id bt23so21745300lfb.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Jan 2023 07:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+pVoAe8bQDQU8ygNqgrsQtDq/4LXhpcuUhVS3IiT3ps=;
        b=X1cSZ8BdKum/BGWzz+RS9YB0SX1pWreF0BlzZxBQytsixQ508QjMbAd52nR3uXroak
         8fwsNligWrCarMkm0E0EtEeInqdOf6UZL2bFhqKHJA2XWLULkHVarGZ0PpFAMvyhGo3j
         KyJt3N5UfeenjeKKYHE4bsoX9Z08fUO7WUO816DH7L7u4y9aa+01LxZOWH7UvICf9nXR
         euMR0kFt2ywwTTDisHAM4LwiAqrsdzffzMbouypZD1liuqTf2ko24VinCGWp3gbYMsFQ
         l5aU/EHrhoCBtZVylPmiGTFphlLs81JAzYacei9DfwfgU7+yQomF56idRl1IKI4GaOW3
         fKWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+pVoAe8bQDQU8ygNqgrsQtDq/4LXhpcuUhVS3IiT3ps=;
        b=aPD20Y6UT1dgCFAxQoEajW1D+eHz+I1f1s+rwFvooVUUpZVfI59abaHTPzptLl4Otj
         Ya+6p46HBvN1kBwNyh6I8wAvs4ROtRFV5oB2tENO7k60TOXn+6wpPKC1/FRpjiTwAnSH
         mX9SacPQf5FSlUm5Tycua90wrkqHbyearRTON/OK2f1yescijAmLiaHXyTJZEUhsflAQ
         6Kp6lCXMOxkdwRZiX7GVepUgnOEZRGt6xQ9BCqBgNQ5RoP4GwGzOCWrOUzH0Ii+fKp2Q
         wovC0GGUtYAsrcRK3KzFhQxZs0hffkFfOpepAA/aVhEeKfg8SOjcR3nyQ6OhGRzC1cFh
         JJUg==
X-Gm-Message-State: AFqh2kqUCfCpboOCe+mfB4g3ehHwZE/c7cJaySz0rk9ewvE5s8kJ+/xN
        d5X34zEBj+TRW0MXJ442uJcrSw==
X-Google-Smtp-Source: AMrXdXvzKlCCuN1UVeapGWNHxfTvED0EGCsl7XmG6riyWSVPIzac849lCJ0t3ALG9CwZXk4OPKxIRg==
X-Received: by 2002:a05:6512:3e21:b0:4a4:68b7:deb7 with SMTP id i33-20020a0565123e2100b004a468b7deb7mr14384652lfv.19.1672587609601;
        Sun, 01 Jan 2023 07:40:09 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id m4-20020a056512114400b004a764f9d653sm4198387lfg.242.2023.01.01.07.40.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Jan 2023 07:40:09 -0800 (PST)
Message-ID: <311f2e5e-24bf-9c52-8773-7a350e0fb3c7@linaro.org>
Date:   Sun, 1 Jan 2023 16:40:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v5 1/6] dt-bindings: ufs: qcom: Add SM6125 compatible
 string
Content-Language: en-US
To:     Lux Aliaga <they@mint.lgbt>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        marijn.suijten@somainline.org, linux-arm-msm@vger.kernel.org,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221231222420.75233-1-they@mint.lgbt>
 <20221231222420.75233-2-they@mint.lgbt>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221231222420.75233-2-they@mint.lgbt>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 31/12/2022 23:24, Lux Aliaga wrote:
> Document the compatible for UFS found on the SM6125.
> 
> Signed-off-by: Lux Aliaga <they@mint.lgbt>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

