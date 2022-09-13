Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83D655B6A51
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Sep 2022 11:09:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231500AbiIMJJe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Sep 2022 05:09:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231514AbiIMJJc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Sep 2022 05:09:32 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 033FDFED
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Sep 2022 02:09:31 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id bo13so3168613wrb.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Sep 2022 02:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=NvnQM5buFIVGm1zsvKpl99RN8W6xF+d62qjWE2z+Spo=;
        b=yeAEcf9BIb2Tytfh/GgUgT7KsaSxOS90fj/ZVzqZDtR6K+/gyQYzNg/9xhQwJdH9KJ
         L3uIwiEDaUaOiMJ5ZzS/yGlhugRODPMMoFEvBVRKmUvaYJD9OPactVG7GQd0ZAqXSl3N
         AqqycrzFQtXR/CpwLgA2awRXK0pcRaGtgmy1GxAzBDNW8IDTo2Xj//oLALS/RqcAxcz8
         A2IfzHL+gNT23UdIbsR7yo2WNN6a+y0id+xaw8F5V1gQJbG0zvCDJH5dmYl227ZTgTrI
         z93LLPq3R1mq5HscsTh7Jz+X6RVXZ0oNQbCzBLWqMW/JR0LYFXQs4S7PeMQxTekBDRuP
         rsew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=NvnQM5buFIVGm1zsvKpl99RN8W6xF+d62qjWE2z+Spo=;
        b=4BDCCJCh6dgUBX+1OwjsEuaHF4hMIsfERRWHd52JSmm+c2DOJzEShT+Ynd4CLFajMD
         MYB4MaKyoYi0OfEcK+OeIMc4jxSpgSBWFH0ID6f3tUjIteXlqS2uWc0spMMVC4RJqpCd
         EVm/2kIaq9Qu+52RsCDalzErgsA0/1niU65Jfil7kLd1VkBF/lMzupIb/SCIZR0p3mmH
         95GkN2FSnnl8wjHNHu+upSxmiMg7Htw7fQJmbdul0STfZKD9PYAkwAt3KykSER4k3MB1
         Dzh/q4DhFAXULFSwVSkSVqQ0danDl3xEgSesYLbUpUtbo90lsYm146D1oqeHfQ37etSu
         KyiQ==
X-Gm-Message-State: ACgBeo2zg4eKIfd/U2vzC5UG/p3mu+gWk7rcMGLVejchUxwk07EApjDA
        9YqCwjlGESey+tR9nQoKDmEMCA==
X-Google-Smtp-Source: AA6agR4IDhwR/1J/cHRJ9ZZQ0i6GQLw5921b8xdbaeP6XrAcjmbRTEAzcmGEopFWB980sfRqsLTogQ==
X-Received: by 2002:a5d:584c:0:b0:22a:2c6c:617a with SMTP id i12-20020a5d584c000000b0022a2c6c617amr15168377wrf.532.1663060169508;
        Tue, 13 Sep 2022 02:09:29 -0700 (PDT)
Received: from [10.119.22.201] ([89.101.193.70])
        by smtp.gmail.com with ESMTPSA id q3-20020adff783000000b0021f15514e7fsm11734887wrp.0.2022.09.13.02.09.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Sep 2022 02:09:28 -0700 (PDT)
Message-ID: <9ebbe240-09ac-42bd-661d-f6b1aaac414e@linaro.org>
Date:   Tue, 13 Sep 2022 11:09:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 10/15] ASoC: dt-bindings: qcom,q6asm: convert to
 dtschema
Content-Language: en-US
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220910091428.50418-1-krzysztof.kozlowski@linaro.org>
 <20220910091428.50418-11-krzysztof.kozlowski@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220910091428.50418-11-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/09/2022 11:14, Krzysztof Kozlowski wrote:
> Convert Qualcomm Audio Stream Manager (Q6ASM) bindings to DT schema.
> 
> The original bindings documented:
> 1. APR service node with compatibles: "qcom,q6asm" and
>    "qcom,q6asm-v<MAJOR-NUMBER>.<MINOR-NUMBER>",
> 2. actual DAIs child node with compatible "qcom,q6asm-dais".
> 
> The conversion entirely drops (1) because the compatible is already
> documented in bindings/soc/qcom/qcom,apr.yaml.  The
> "qcom,q6asm-v<MAJOR-NUMBER>.<MINOR-NUMBER>" on the other hand is not
> used at all - neither in existing DTS, nor in downstream sources - so
> versions seems to be fully auto-detectable.
> 
> Another change done in conversion is adding "iommus" property, which is
> already used in DTS and Linux driver.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes since v3:
> 1. Re-order patches, so the change to apr.yaml happens here and we can
>    avoid early `make dt_binding_check` warning.

v3 was reviewed by Rob after I sent it, so let me paste here:
Reviewed-by: Rob Herring <robh@kernel.org>


Best regards,
Krzysztof
