Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64DD05A119A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Aug 2022 15:12:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242292AbiHYNMp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Aug 2022 09:12:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242287AbiHYNMo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Aug 2022 09:12:44 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF4FFAB05C
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Aug 2022 06:12:41 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id bt10so15202651lfb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Aug 2022 06:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=BQMhJRBVYhau1QC9GG7SYi5bOZIopP8I9So28rAAa1w=;
        b=uCGpPSjXkItg2vgzgO7O4xDMOS0knVOSSccBI5jxYBFtCaMlBOoySTzp+WJ6aHM+do
         4ILByduEQz0xNkcqNZ2YIqk7zLx4Gu+otMEa4OiQdE+lXfR8Qu5hZYbZVZjR2yPgdXH0
         R3fEtxzl4WjBnXW9EUufeHbIuk6RP+xWaiSZpF7XEwyco0Dcaj+RBktzc3goIMqytsa/
         KQDSD1G60uEJrN17dhD8klhh1E+JB08HEbgt3KK1tNuvVdB6+mtvZwd544queWRVA+NU
         7ehBxUnm3jcMqfWfvw+RR4mniGCSgSlpQS0Utcirr93w+H9ir6zZw6NgK/m867haa0bU
         nm0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=BQMhJRBVYhau1QC9GG7SYi5bOZIopP8I9So28rAAa1w=;
        b=EJIdciYolsoEUkYdqd//a1V+q5XpWA8sH5p3aXN5lfhUoZCcTyTMhqx3asJ9OXfv64
         28Hd3smn/1x62F5y0w51zq46pqJdGY96+ic++qeibIkdH54X2beNdmgxW2x1DiX3+WH8
         0rMe6UZG0oPEQix22brOPw7w+8apaqZhNDN/KTyWaRZyBHMqmnByU6xws2YrYY/SNMxL
         SGmPhPjBo1SmlIZTC0F4uDV3Oliy21NYtEhCpMNAgDMcAarkh4i/iixEMKwYg/jtq+2R
         eQafoiBeT4hyvM5vmTB8tcmduvWtlYMyrEkFWJb/7VqPJcuhHEV9bYNhz7K2a4mokIkV
         SC4Q==
X-Gm-Message-State: ACgBeo2oXRmTw8VWKTe4o1fQMByng2+21zAZ6jDQWjtVr0PSBhTXqNUo
        OuNgyBWLs0n7edXiJXqlM78Zyw==
X-Google-Smtp-Source: AA6agR63jfR3QXqcUKMWOqQsq9ljuk+IHtFqKG675gxoQNuqU0DXapehQulmf8u9NzY4Xaq0P0b+6Q==
X-Received: by 2002:a05:6512:3503:b0:481:4470:4128 with SMTP id h3-20020a056512350300b0048144704128mr1129892lfs.303.1661433160223;
        Thu, 25 Aug 2022 06:12:40 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s4-20020a056512214400b00492de54940asm499033lfr.82.2022.08.25.06.12.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Aug 2022 06:12:39 -0700 (PDT)
Message-ID: <be28b1bc-9467-5f61-0480-5dd1e30804cf@linaro.org>
Date:   Thu, 25 Aug 2022 16:12:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH RESEND] dt-bindings: nvmem: qfprom: add IPQ8064 and SDM630
 compatibles
Content-Language: en-GB
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Rob Herring <robh@kernel.org>
References: <20220720163802.7209-1-krzysztof.kozlowski@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220720163802.7209-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/07/2022 19:38, Krzysztof Kozlowski wrote:
> Document compatibles for QFPROM used on IPQ8064 and SDM630.  They are
> compatible with generic QFPROM fallback.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Rob Herring <robh@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 2 ++
>   1 file changed, 2 insertions(+)

-- 
With best wishes
Dmitry

