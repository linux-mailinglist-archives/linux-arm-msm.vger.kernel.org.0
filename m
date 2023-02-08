Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3F9F68EA3D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Feb 2023 09:59:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230347AbjBHI7C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Feb 2023 03:59:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229648AbjBHI7C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Feb 2023 03:59:02 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DAA742DDB
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Feb 2023 00:59:00 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id bk16so15973167wrb.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Feb 2023 00:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2F+EkTwIc/jMixI+kAlHkZJn/GSWxlvMMJpV3cZ5J9o=;
        b=hNEVWk43d4LGFlJeyNo41hcMxmKehz2FKlFcWxY/MtCW2cUzklMWO+cpylvaTv27C0
         IibuT7D8uII29wrLUmp8VJyGL+OHi+Q9PVYXY2oXvWqcADRjsMSVPiMD4rRntjFl3+K0
         HY+XcKt0KKksvGqni3unWhercfQlVloT2leYTWg3+sVp/SLCrGVf9Q+515sSLWWZwNOS
         znAm8BXDCjWH24yzx7wzcivkydDWUyni6rj8uzMvRR+02/Y1ZzVzIJ6QQCTdA7cud4jZ
         7u0BT0NslpiEpy7ZL+s98Genq3dtEk71TE2CbD2+fnjqaTV329k4kxlGCbCjspeskLq9
         FcTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2F+EkTwIc/jMixI+kAlHkZJn/GSWxlvMMJpV3cZ5J9o=;
        b=kBtjZe7VUGH5G/A29FcA99yTcbmtxeEHPyZUT+zEOJRHt9kNoMjDiKmKb7BDjwAE9m
         XKn2SH0IEvfi4I33VRl1PRpr1/UVEDQE+LdtabqukHxR0aMGQ+hXThvyrj1zg15gmfm+
         kAttDHPUMps4lIoq74S5BdWWGdytHkZ077heU8Ca7gfzRaE8FniaRAp9gkkGoziUpUgg
         +aY1kP2JvCFcnPHZSjRpP/wpnqalQz8YNOeDKujQkV9NEX4HylFC9OBu4Gylxf38XZ8y
         mPi6Uzvja0TTbcaHQ8vbPfhaB5+qKX4uLrzxCANYjAO6dZd9BikuSBxyVUh4KL8Z9Utp
         mnlg==
X-Gm-Message-State: AO0yUKW66vfS7U67EO/f7igym81KQ41bWSlwNd2z3rcprxk01JMjzPSI
        iRdwaOIZqLSU5p+dMC09g3qIFGNRspQ4FxG2
X-Google-Smtp-Source: AK7set9iw2yXnhaeBm8AprZEBqpt2Ib9TaaYicoee6j4alRNKVC9ofgBQq3nleG1+gdXxnGxjH7mmw==
X-Received: by 2002:adf:e492:0:b0:2c3:f4bf:2977 with SMTP id i18-20020adfe492000000b002c3f4bf2977mr6821538wrm.63.1675846739026;
        Wed, 08 Feb 2023 00:58:59 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id c8-20020a5d4cc8000000b002c3f0a4ce98sm4397198wrt.98.2023.02.08.00.58.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Feb 2023 00:58:58 -0800 (PST)
Message-ID: <ef08629a-8e6e-e767-a9e6-d53eaef50fac@linaro.org>
Date:   Wed, 8 Feb 2023 09:58:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] dt-bindings: dma: qcom,bam-dma: add optional memory
 interconnect properties
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230207-topic-sm8550-upstream-bam-dma-bindings-fix-v1-1-57dba71e8727@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230207-topic-sm8550-upstream-bam-dma-bindings-fix-v1-1-57dba71e8727@linaro.org>
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

On 07/02/2023 11:03, Neil Armstrong wrote:
> Recents SoCs like the SM8450 or SM8550 requires memory interconnect
> in order to have functional DMA.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

