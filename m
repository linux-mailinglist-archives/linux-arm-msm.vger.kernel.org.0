Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3644715C1F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 May 2023 12:45:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231691AbjE3Kpt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 May 2023 06:45:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231695AbjE3Kpc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 May 2023 06:45:32 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7580619F
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 03:45:13 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-9741caaf9d4so101324566b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 03:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685443512; x=1688035512;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZVwdZi18tOx4F5EpOQikJaJC+N1FG0YCZmCcPhomPHk=;
        b=S73mFiWbxirjBnXaVpi44ZylcB1rk2ju47gQOmZCRxQN2+s/sqVV1D8hvtUrluFh6E
         no9M/snhG8IGrnRjrp/0xLZxudsQlPuvOzuHvd6vBtx2b5F5l1Szqih9fBYKrBVG1v7U
         lpyV9KLdT4b8zcRvAjcdbvA9YuzHeVxK0SSiTx2LfKVerRUEZBhuAIyQn9Wewc7oGq8v
         qg6nkPqS67PIzeqbmPQU8BlGbbmOfLOx9xTCXFfNPCojYzzzenV/f+Yy1FlbU8C2V0ZS
         uFqTcCVCsSf+3x+VWGzFUnCDVvsrIA9qbSooaz8Vi37COFaDiRwwXAljEV0iT5P/kk50
         swJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685443512; x=1688035512;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZVwdZi18tOx4F5EpOQikJaJC+N1FG0YCZmCcPhomPHk=;
        b=avaWSouU27KWAb5LbynDwqQzor4Z7REmpirxzc1YAvPvxA0bqG2Ki2DomB9dFKMGXp
         6bn6qtiGM4kxWyce8IMfL5Gf2+G/ZG2vNUo6x4F7SbVJWYbPZGte26Q4I8C9UJUUCTHC
         c+rbmkifq7BkXsowXcABqxKlCvqMCZoE+fmmGK1xflnFabtQbCu1p13Su8Q7W/z5bPdo
         i6i5OuylcCQeOPbQbumbhqkqFs2CJrEn7e+58X7EaHnE/vlPHwfQD8jdpYWdKpZvfdQZ
         Oe2vBlLFK7J5i82w+9T0f/l8wGx7cPQcMI0j72GdyNNn2m4dInon1gaRm/yDN7m0CTFp
         WiGA==
X-Gm-Message-State: AC+VfDzhQOu/8lZRoF8GGJSX1glwKVJtZ2twd4n63nQ6niTFKcXsNS0Q
        LgsEEV11zZDaBqKWhe/MICxexA==
X-Google-Smtp-Source: ACHHUZ5uBamxXB8i6XT3BS/ZYvZ++f/DXv7dyXHtwOOk5zHSIIHgpWmLsU4LBbiyiCdthKlAqh1erw==
X-Received: by 2002:a17:907:7d94:b0:973:e184:e0fd with SMTP id oz20-20020a1709077d9400b00973e184e0fdmr1899181ejc.70.1685443511792;
        Tue, 30 May 2023 03:45:11 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id o2-20020a1709062e8200b0094f698073e0sm7040396eji.123.2023.05.30.03.45.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 03:45:11 -0700 (PDT)
Message-ID: <30832bc4-c5b9-9131-2450-3522197ee05d@linaro.org>
Date:   Tue, 30 May 2023 12:45:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 01/11] dt-bindings: remoteproc: qcom: Add support for
 multipd model
Content-Language: en-US
To:     Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jassisinghbrar@gmail.com, mathieu.poirier@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, quic_gurus@quicinc.com,
        loic.poulain@linaro.org, quic_eberman@quicinc.com,
        robimarko@gmail.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     quic_srichara@quicinc.com, quic_gokulsri@quicinc.com,
        quic_sjaganat@quicinc.com, quic_kathirav@quicinc.com,
        quic_arajkuma@quicinc.com, quic_anusha@quicinc.com,
        quic_poovendh@quicinc.com
References: <1678164097-13247-1-git-send-email-quic_mmanikan@quicinc.com>
 <1678164097-13247-2-git-send-email-quic_mmanikan@quicinc.com>
 <38a5a268-7d8a-6e61-4272-8e9155df0034@linaro.org>
 <790496d7-98dc-c92e-dedc-1c89395a1ad8@quicinc.com>
 <4669eed6-b76c-8e68-74b1-36ea52a4bd5b@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <4669eed6-b76c-8e68-74b1-36ea52a4bd5b@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/05/2023 19:22, Manikanta Mylavarapu wrote:
>>>
>> It's not required. I am going to remove it.
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +  interrupts-extended:
>>>
>>> Instead interrupts
>>>
>> Sure. I will use 'interrupts'.
>>
> Please discard my previous reply. Here i couldn't able to use 
> 'interrupts' because i am using interrupts from two different interrupt 
> controllers. Sorry for previous wrong reply.

The bindings still should have interrupts. I did not comment on DTS, but
on bindings. interrupts imply (or allow) interrupts-extended.


Best regards,
Krzysztof

