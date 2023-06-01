Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94AF971942C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jun 2023 09:27:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231718AbjFAH1f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Jun 2023 03:27:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231962AbjFAH1a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Jun 2023 03:27:30 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42AE01BD
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Jun 2023 00:27:01 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-96f7377c86aso63910366b.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jun 2023 00:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685604409; x=1688196409;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wXn12cHy89+TsifCzQ4kwiHMuDdF/2A+wIoRr520YJU=;
        b=k0gyuxftkJYuU1lWHWyi173L6M5ewUrFR5osKcFGkr38rAJsAO2bBMTEt9DdH6olGt
         2X88y3oVGad56opa2EkK7OA6aHb5LZnn+7TzYdy2iZepDDvpnKG2wUFpsokSXy4Pdkbl
         rid2F53vUNZx1eZ9iLaz+l5hPF+NRJAMPOwg8PIn2c3vb6GQwpCTOaH/mLoQ+vy7TKQu
         M7KB89JmNFMAZkYN9rKsVf1QAqJUFoxw/TahOEYs8aNdjbqSq6tiNQrJTbzyLwDp9Rwk
         i84h7GTpa4u1irzUsCZtw40lrgoklnl6DQ9qQS5EwcUpTZPaPTU6IY5xnOhydt/SZl2Y
         H3Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685604409; x=1688196409;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wXn12cHy89+TsifCzQ4kwiHMuDdF/2A+wIoRr520YJU=;
        b=cCc5bmWcpQQynyRx+AcMxP/35QyO2mW724mgpuewf3SN1EBn+t3xPnCOvVelZt4V6s
         hLAX8qZUV3l5j+aeXMl+7M36Sma/K5DEscypDaAjcM0uW0CMKyOuaqsJOZmlDuUo/ocQ
         6MDpalTtMDFqpu2XvUuC+PnmU0JA6qczJPwTIcAl+ZjXowwSK0cMAx9+Cqeei09n8iTz
         42D9EsrCYZ3MCFdeC4vAKpKwqwJ1GbsOyTyFuJ6QtVEaxAch5HAxLmmvNcZfo8O8lz5d
         rP1WztMF6JJi9omTPSbqxq2QdFPPtacIGsG0AmtQaTUVPRxyvCmawqwYLyVMTjWvmhI/
         VWfw==
X-Gm-Message-State: AC+VfDzDGJz7TFIlTsNFAJsAvsIHKEURZqwEostuZzGxwYkKt+Z79dvU
        qnYtsrgs3lQtmA4SWzAZAkizz7yn4IwFxvFs/e8=
X-Google-Smtp-Source: ACHHUZ5+ZijAEZXNStOsoaJLj50QmEBFqIT7jKitG9vbIVQD9PkbYi4UHiKb/HUHyyMFdcZXBJc8WQ==
X-Received: by 2002:a17:907:934a:b0:94a:6de2:ba9 with SMTP id bv10-20020a170907934a00b0094a6de20ba9mr7229929ejc.68.1685604409699;
        Thu, 01 Jun 2023 00:26:49 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id j23-20020a170906475700b00967a18df1easm10069799ejs.117.2023.06.01.00.26.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jun 2023 00:26:49 -0700 (PDT)
Message-ID: <dc1ac0f6-f982-fb5f-d26c-b6fabf4180d3@linaro.org>
Date:   Thu, 1 Jun 2023 09:26:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 03/15] dt-bindings: interconnect: split SC8180x to own
 schema
Content-Language: en-US
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230530162454.51708-1-vkoul@kernel.org>
 <20230530162454.51708-4-vkoul@kernel.org>
 <25e3ed2f-d691-1a80-e2ba-6c7413b7261a@linaro.org> <ZHhHhk/4BX53R1p/@matsya>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ZHhHhk/4BX53R1p/@matsya>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/06/2023 09:23, Vinod Koul wrote:
>>
>>> +
>>> +unevaluatedProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    interconnect-0 {
>>
>> Just "interconnect"
> 
> Nope. We have multiple virtual nodes here so interconnect-N would
> need to be done
> 

You don't have. You have only one node here.
Best regards,
Krzysztof

