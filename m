Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB77C749F3E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jul 2023 16:42:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233277AbjGFOmv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jul 2023 10:42:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233263AbjGFOmr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jul 2023 10:42:47 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3006173F
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jul 2023 07:42:45 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-991f956fb5aso93862866b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jul 2023 07:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688654564; x=1691246564;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rwv0k/mBWkQbCFV+RkDpPqaALdJxgV/r5RjPOppDi6o=;
        b=mnCQxa+51OV8EmH7TVRkuUL4xmP8NUtX8XOj9JmBHjaC8ex4aMFLpOYBCgFBgtVJgQ
         cwxRN5kubj2s8oUB7KbOmxtMzXVdemOCTG40C6V3zrX3luu2HqU7aGq7TindSuvSBpCh
         gSjGZM658ijPUMbuJR/C3B2HKIbA7GaaBRDe/wJsZ407du8dNR0gk0ETaavXrzp4VhmU
         19nsmC22yURcHTfTM2w1J7tCX2cPvBRJtE0x7EwkVcQcuu3oAWBus4vZ7S9FI44TmCMf
         CIdziNXHF96eoSI1cotJoHWMe0my54Dx9I57GNH51o5PHDoEGdb27GpTKOBwrVOOKJsl
         OFww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688654564; x=1691246564;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rwv0k/mBWkQbCFV+RkDpPqaALdJxgV/r5RjPOppDi6o=;
        b=OiUShQp5d1H38SXmskDiLNouRrcnKHHAsK+yjlV68H1cbLylAd0rGKpS07LzyJHE2f
         OfWBvMKDyrk+/wxl68/cs6MBjUt15kqUQyGn/rQRRqSAw9MkBxcSCmc8Ed3E6rNHsqVS
         v0RU5CegdqF85w3aIq2oyggebcS8ss68b++I12LWmiiDYn6k1J5znVEASqVWxk9OKbME
         TBwU4ZhfS8xESpty2cD3EtuPgWyMgAk5NrxdTC+1EiDOS70bzukSwmYX6DErIeyhFHjG
         8bB0l/oP3YtU2Vwo4ootSbPvthDIEPtx21QuURCDfWdctYkUWGyF2zSZkP0U12Fn9mxR
         9GAQ==
X-Gm-Message-State: ABy/qLaCKdELEzyNBHPSZwOCZcSa3tFuh8lzvy09q3ylBUuRfBmoT070
        BN2dbt/JfKInU+kEknvVN3eiOA==
X-Google-Smtp-Source: APBJJlFM/RW+UucTd/L+yUB800v87kFAUfQhGjfoW0iSMfjUwQjqs4cYauXTWEyTCJXQaVvZL/qHpg==
X-Received: by 2002:a17:906:17c9:b0:974:1838:88d8 with SMTP id u9-20020a17090617c900b00974183888d8mr1342928eje.57.1688654564504;
        Thu, 06 Jul 2023 07:42:44 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id j16-20020a170906831000b00985ed2f1584sm885929ejx.187.2023.07.06.07.42.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 07:42:44 -0700 (PDT)
Message-ID: <e2c5e565-197c-57bb-bb01-5bcca0bd44ac@linaro.org>
Date:   Thu, 6 Jul 2023 16:42:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 2/7] dt-bindings: arm: qcom,ids: Add SoC ID for SM7125
Content-Language: en-US
To:     David Wronek <davidwronek@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20230706124339.134272-1-davidwronek@gmail.com>
 <20230706124339.134272-3-davidwronek@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230706124339.134272-3-davidwronek@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/07/2023 14:40, David Wronek wrote:
> Add the SoC ID for Qualcomm SM7125.
> 
> Signed-off-by: David Wronek <davidwronek@gmail.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

