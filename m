Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFCB15066F0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Apr 2022 10:30:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350015AbiDSIdF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Apr 2022 04:33:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350020AbiDSIdD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Apr 2022 04:33:03 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 404C311C19
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 01:30:18 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id n126-20020a1c2784000000b0038e8af3e788so974186wmn.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 01:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=wNAms02fU/DimVrfhg8EYqOCbckD23rBtgs+Z07+oMA=;
        b=BxJyCp3wXWkOA1hl3vs0xC9W4QhZYqlq+J/j9fis/VOaRV1FshGHhcLjdXs3xc6O3u
         8epBpXfmxI4HsBBelne5iB1fN4a+utK6izOpLdq3+gRi2rxoVHwS/VnipvUnKGnloGgK
         19QfESbbndwGNyj7/j6EM+0iki0Gp1cAv5qOb68ggKMCwGiWu2AxF/1k649B6n14FUkp
         kqxTSltIEVUtk8x9Ej6o/jxsFQXc+5WJ883Cc89C2NBd9BSH6FtJ8tB/KRPxgrMB3Z3r
         WI4Eu7q9aT0GmrE8NUsDi90FBs3F7UBE14H2hH/OBGW3qndoiEH5isSzHIJdAW3rqXl1
         fkLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=wNAms02fU/DimVrfhg8EYqOCbckD23rBtgs+Z07+oMA=;
        b=mJuHeLwVnzxCg6/RUyxgijRbxhUym4ZemLTpVRwKXzYY6wPVUdMPOAPTzIHujtDJBA
         WB2211Xp/iiTgnMvPC08a31sGFtCW4hAAjTOlYfmTtHToJx4PWBLjFi/hd5wfIG1bMh3
         8+48k9dW1D5DAaPj4zCfpmQKt48xjY12F0yEcXSo339HQaTBbCLaIsFVtGB9HVrcLWhe
         tVdRrEsQslB0epvpNdmUZJZD4YXNZJrlxq5scRvoqp51lqttEbkfqHAdSVuJz9Qy44Jp
         UWRS5ZtZ/FcKPEgzb9VgSixrVO0+veyS7BuowoZ5uqdAph8+HF4bhlvbo+ZM3vJqbkF+
         XHQg==
X-Gm-Message-State: AOAM531jYTFKDEGCp41toItSX2nb/41mbT4Mu/GzPOEkUrkS53SLpWft
        T3+QaN1qB6NFey993coMfkDfrohN9m/mgQ==
X-Google-Smtp-Source: ABdhPJwMsilBCewGCYGQ0FCerUqmYdNZGETHfGxyZiIOJCvf4wO4CzBN9CRNNZmFYV2+EsaO1b5A4Q==
X-Received: by 2002:a1c:f30b:0:b0:37b:b5de:c804 with SMTP id q11-20020a1cf30b000000b0037bb5dec804mr18758366wmq.166.1650357016829;
        Tue, 19 Apr 2022 01:30:16 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id bg8-20020a05600c3c8800b0038e4c5967besm16130396wmb.3.2022.04.19.01.30.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Apr 2022 01:30:16 -0700 (PDT)
Message-ID: <f3d50cd9-6b41-a5df-0ccb-b4d02ae5c66a@linaro.org>
Date:   Tue, 19 Apr 2022 09:30:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v1 2/4] arm64: dts: Add msm8939 SoC
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     shawn.guo@linaro.org, jun.nie@linaro.org, benl@squareup.com,
        jwillcox@squareup.com, jgates@squareup.com, mchen@squareup.com,
        zac@squareup.com, Leo Yan <leo.yan@linaro.org>
References: <20220419010903.3109514-1-bryan.odonoghue@linaro.org>
 <20220419010903.3109514-3-bryan.odonoghue@linaro.org>
 <737d44a9-56ba-846e-24ad-36b2da52d2d7@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <737d44a9-56ba-846e-24ad-36b2da52d2d7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/04/2022 08:33, Krzysztof Kozlowski wrote:
> tx/rx. Please rebase on recent linux-next and run `make dtbs_check` and
> fix all the errors.

I did do that, it didn't throw up any errors.

Must have done it wrong

Thanks for the review
