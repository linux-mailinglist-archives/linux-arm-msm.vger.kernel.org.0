Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D82758F9C2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Aug 2022 11:09:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234712AbiHKJJS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Aug 2022 05:09:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234307AbiHKJJS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Aug 2022 05:09:18 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05FAA8E9A9
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Aug 2022 02:09:17 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id z20so18690464ljq.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Aug 2022 02:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=OuNBLM8BAbWtCheZfxDwqu8ugdq6TeyCqLVXqfB8AQU=;
        b=tRUbUgQ7Z4NEozErrjbYsFQdh3BOQSl1mcSUnYMrjW47LdxtNSXjhsWqZXEfOx68BY
         ZX/pRtHyTEIsM66BtZYKj9F06QIufj0ZJtheFfth7sujngmdNxQ67mlJiYYW6OQhWG4V
         GllVC/j/0Hmc/VbLqRC+ULH8iWdR6m3XdanHE1MInU7VCiZlt10ld8/TXsp3ofZ2HXPT
         Jt4VtmbqpVKZtnZATOMuLLhtxyROJy9z+Ycx8QdA+bd0I+D4EF4g+2gtsFERHnpYWLdG
         dHBXWtvTaG/cTvHkGBtoLLxb4WAtLr7+3aDd3OA10tm+NvgBkiQQrtfb5LkeXCqA1GjG
         KAxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=OuNBLM8BAbWtCheZfxDwqu8ugdq6TeyCqLVXqfB8AQU=;
        b=RK/VFfc5dFCyGueBVM/y6Xvg3qsT7Nhvw7K/KGKNdxhiHgQboRvV0V9mb3qCddqL8n
         an92AeqHHw9kWoNMaN5VbRO7ZIUsgE0/Mc2o2ZFzxXAl7jEvzYL+SWt3LiEt6w4ELvOk
         5uB9tvbKPQHLPU4mY/bvLSQl6r015Jl71REwpCPbYXJcA/r/ms048rP9sqPm01C8uzCP
         tUtlpp8IODQfILGFOpDEUZXqVHKAoZO8nGyECPUIUCeKrJ78sRotX9wHMaPlURJQ5XOH
         iBvYyJAhr0Ac9Jao2EG/IWtFRR8eeU/V56CbBiBvD/UjQe6NbMk6QsnBE3TmDu45bVXo
         EVXQ==
X-Gm-Message-State: ACgBeo3tmO0VmREwsvFVe50fgne+kcfsAqH4uSiFbVjrThdM+h4NvCNU
        +OcwZlNeTDqjvUGrLs02UOglGw==
X-Google-Smtp-Source: AA6agR7YslF70qu+nSE+gMvlKJgMKIhfnR3xp3n4p+4AlNM0wWjwnr4uY7K9QMoK8NtwKqFjnn/dFQ==
X-Received: by 2002:a2e:9d91:0:b0:25e:dd34:f5d6 with SMTP id c17-20020a2e9d91000000b0025edd34f5d6mr6679686ljj.501.1660208955427;
        Thu, 11 Aug 2022 02:09:15 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id v18-20020a2ea612000000b0025e4e2a5bbesm743871ljp.1.2022.08.11.02.09.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Aug 2022 02:09:14 -0700 (PDT)
Message-ID: <080c6442-b45f-242a-6535-1f833fbf6cca@linaro.org>
Date:   Thu, 11 Aug 2022 12:09:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/2] dt-bindings: clock: Add Qualcomm SC8280XP GPU binding
Content-Language: en-US
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <tdas@codeaurora.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220811042855.3867774-1-bjorn.andersson@linaro.org>
 <20220811042855.3867774-2-bjorn.andersson@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220811042855.3867774-2-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/08/2022 07:28, Bjorn Andersson wrote:
> Add compatible for the Qualcomm SC8280XP GPU.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
