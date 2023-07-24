Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B20375FC91
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jul 2023 18:53:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbjGXQxD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Jul 2023 12:53:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230355AbjGXQxC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Jul 2023 12:53:02 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B363B1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jul 2023 09:53:01 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-98df3dea907so723233866b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jul 2023 09:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690217580; x=1690822380;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+UA9sLTmCceaVH3djDwF4zW7p7bRxV+TYZsQs3yv4/4=;
        b=MTl3ovYe8e/zSYYq5Z7hdt4bZLg5Yxiber4StnfaAtiwGaiwcj/Txh2uJI15r0AboO
         QeRgSjFFt3Ak3fuOM/kOmdt1yX2tnlBHJkgY7lpSwWcqQQVaWRgnOeDvUZobe7Rrt1uY
         NP2LZsIsW2TJcD4Cokdpg/T6Hq7+FFJUomu4o/hWR9vldiyOExI0ma0wITcrVjZLGMMq
         bgmIIF2CIjuSTuEpDSWTx80SSz/nXonCzH+brqpjznu37lT/emP/ldBnzxGcfelId/DP
         JB+sLPomu9f5Biu9Cdi9Am3b0yvrE+g7VUEj5zHaNBw2NOePct6IkUzFOTsScgEOXSzO
         2J2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690217580; x=1690822380;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+UA9sLTmCceaVH3djDwF4zW7p7bRxV+TYZsQs3yv4/4=;
        b=VpQE0U2FdA1cqnks9FYB99XgEZ3pYA3XTUDIeWs0p0z9vruEvejWx+CEnUGueasesO
         witKo1Ts5hXp4UZIFNwY7wMlXVFYCpAspMhgPkkelj0SX+1ern95O1sXPXNFZ3ervUgt
         jYN5sulMZtAkrMGgiPt9rv9JzIc9ozj4AkxJGabeqDEEk53GlXXOd+JeY9j8VMUy+CeP
         nya2cgHpJ8u9TKpggzTeZxfjrhgmcXN7KZvdS3neUWn3fIeh7BEleK5VLq/xaDGrc+z4
         f6Qo9x/F4IF+JW2HQ916vyrWc2IinH9yN8Z0B7cefQXmtyL3LsHwE+BqYht+c/PJZzZ8
         zSKQ==
X-Gm-Message-State: ABy/qLa0wP+Tg7K5g5YXKeL0FGZHZo7AZ2LCj0UI9mZb2nUOJQ8HxLjP
        mDnU+jb1mRVe3WHKGzDWKsiB5A==
X-Google-Smtp-Source: APBJJlGVH4OaeaMwPLujZMBro9heN2RofqpqgrS3qBYBWGDrn2tWxQOmPBLEImp83ncwwd1ls9EkJA==
X-Received: by 2002:a17:906:106:b0:986:d833:3cf9 with SMTP id 6-20020a170906010600b00986d8333cf9mr9986138eje.39.1690217580052;
        Mon, 24 Jul 2023 09:53:00 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id a15-20020a1709062b0f00b0098ce63e36e9sm7028954ejg.16.2023.07.24.09.52.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 09:52:58 -0700 (PDT)
Message-ID: <58475de8-8636-d9e5-d91b-bb61f77d6cca@linaro.org>
Date:   Mon, 24 Jul 2023 18:52:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] arm64: dts: qcom: sm8150: Fix the I2C7 interrupt
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        qaz6750 <qaz6750@outlook.com>, andersson@kernel.org,
        agross@kernel.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <SY7P282MB3787F073ED6E860E820C6CDDB202A@SY7P282MB3787.AUSP282.PROD.OUTLOOK.COM>
 <898f8e84-de31-8147-ebb3-cef41f22868f@linaro.org>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <898f8e84-de31-8147-ebb3-cef41f22868f@linaro.org>
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

On 24/07/2023 18:29, Konrad Dybcio wrote:
> On 24.07.2023 18:21, qaz6750 wrote:
>> I2C6 and I2C7 use the same interrupts, which is incorrect.
>> In the downstream kernel, I2C7 has interrupts of 608 instead of 607.
>>
>> Signed-off-by: qaz6750 <qaz6750@outlook.com>
>> ---
> Fixes: 81bee6953b58 ("arm64: dts: qcom: sm8150: add i2c nodes")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

But we also need full name or known identity, not anonymous contribution.

Best regards,
Krzysztof

