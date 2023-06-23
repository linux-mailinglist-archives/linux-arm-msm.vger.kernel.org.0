Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93F0E73BCD9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jun 2023 18:41:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232527AbjFWQlE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Jun 2023 12:41:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232452AbjFWQkl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Jun 2023 12:40:41 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03AE42727
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jun 2023 09:40:32 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3113dabc549so1122039f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jun 2023 09:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687538430; x=1690130430;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MbZf0oVzJXs4iYF1O/q/ZT246WFmeDSQwh/CnFpN174=;
        b=A+06xhgeRTruCpBa6V2UUlOLujROBnbhLci9re6tw1C29hkug2B3vfnNnMR6pp5Bm3
         TxpXMV1VUTuMTI1UxR4fj8q3Rp7GDo2HLvP3HlnttbqJf5zX3kdCp1w52zWrIW+ASTYZ
         04tyfrkIp6rDvEfPB2VRBBRLSzQITfcWIxZ6Aa9df9kedB2M/ehxRKY08d/9eWLb8T4e
         MwOTVInukMBzYdgen0zpyj05gNFYSyPiWyM5Bflx+A+BhNoqliEjP1C3TKqUpU7esUPn
         1wt3lDvv+TJAs3VJM7Z9mA1DLkTsubqHPIdjK6C3+Kq9a6+K2xofdijn3paUV5pCJsya
         0U5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687538430; x=1690130430;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MbZf0oVzJXs4iYF1O/q/ZT246WFmeDSQwh/CnFpN174=;
        b=j8wP56AWnm1Jo/2jWixsASLOcVpesqXNJuivxs6j28mj2S4qDVjezf24sZoVNuZpsc
         iq/NOnJo9EVOQZ5Y78wpIBL7Z1pOX0dqoQrAVELVEHzhAD0PvoE9LpyEXCJ+6asLAL3c
         X5Rpl34AI3fLl+LJduP2mjb8dVjprUsP4M18Fiaj31O3AR0mkdO6+IYc3Qg3r7qVm2lM
         kxRoomXG+UxvnV6RiLfS80Cjb2WzFiSAQxsLCO6XCFNEXR3bcagG7tp6pjkfsTmClnOg
         ioxyu+uoclbIpTv3Gg32/2qzxvfsCrizHJnDSK4SdaJA9RY2JMEcoL7ljZzHp5Zd84JY
         j5gg==
X-Gm-Message-State: AC+VfDyu7ykHBLS7N/yHb64Gx5HQ1ZUVEP0OGEOH63izwAF1FDrRcPIp
        DcmpVteIfcwHAarmSgvP6yP7yg==
X-Google-Smtp-Source: ACHHUZ7uLgKfqdwTKg/UMYg0CsPGYZl3IGcEJyZBv+WYKIdQSxznwGI2JxKJFoLw8ZzJNesp5g3qKg==
X-Received: by 2002:a5d:5272:0:b0:307:8651:258e with SMTP id l18-20020a5d5272000000b003078651258emr23704480wrc.21.1687538430467;
        Fri, 23 Jun 2023 09:40:30 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id d4-20020a056000114400b0030ae93bd196sm9978308wrx.21.2023.06.23.09.40.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jun 2023 09:40:29 -0700 (PDT)
Message-ID: <6747a124-36b0-63f8-3f92-f2c986470007@linaro.org>
Date:   Fri, 23 Jun 2023 18:40:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/9] dt-bindings: clock: qcom,mmcc: Add GPLL0_DIV for
 MSM8998
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230622-topic-8998clk-v1-0-5b7a0d6e98b1@linaro.org>
 <20230622-topic-8998clk-v1-2-5b7a0d6e98b1@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230622-topic-8998clk-v1-2-5b7a0d6e98b1@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/06/2023 13:57, Konrad Dybcio wrote:
> We've not been consuming that clock for no apparent reason. Describe it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

