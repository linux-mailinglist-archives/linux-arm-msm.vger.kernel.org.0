Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D57037938CC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Sep 2023 11:48:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237686AbjIFJsT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Sep 2023 05:48:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237610AbjIFJsR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Sep 2023 05:48:17 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4089E171A
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Sep 2023 02:48:13 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-99de884ad25so534333566b.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Sep 2023 02:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693993692; x=1694598492; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7l5e5jrLFPB+I4LFDv0nRUzADbay4Tp8MYv24l9aPn0=;
        b=gxVkiS0qn7uDPCgbycl4OytEnvWXMuY2uJwnd1NXzTVgn327YEAXHwIH36xFj6Qwnx
         goHrNI5lnwUEHYSoupabu/NptU82EwHWSo2Rc3VJPweuC/lDvlSjtXE1nimtGeRjHvAL
         PM4PT9O9LgBpNXHFMX+HoxfZyKrU2Ubq/ecncl4oJ2YFS6s11ve6ld9PQV42wsf4LmBB
         TQgqkCd44hkGsH7zfoOFAvXqX0qhnPK9hLaRcWNXwf7oJjjgACikrN0cFgLR5+rAbnGc
         v3KFivwEkzeGcHdnJuQQS0FCxoR/Pq4HfZhGnuebTiEeC5iCAdj8uZr61dyTzhWSF7ot
         ufng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693993692; x=1694598492;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7l5e5jrLFPB+I4LFDv0nRUzADbay4Tp8MYv24l9aPn0=;
        b=GJRbpdzeDGLwPgiXqhg7enwtu/j1gH76NSbNFjId0BtyaFfbbmQgMA6jy043kItPtG
         UMrDVzok8h1TuzG0dR9YB0pP5dAgS3LsJtsU5iY9hcEE3op4IHRCUI8tm6f/Byqlppdb
         7Dvr3gqgqNxbzkKXrZ/aZyTXMJSmWTqLY1cssLMrpacnj+r3s6NSLRTabRHpYpfAvxbF
         WT1cVq8NRQA6n7guBFXxuGrQfyorPV1esU7sRreF+3yLQ1ypyfABSpAnpDaTge77D3vS
         T4OolYTEI7/s/bgPUk07ICraB0+rcib9qf08tqe0pVy0PK0aaqQebAB7bNmNQtbaKXqR
         Lj0w==
X-Gm-Message-State: AOJu0YyzQ3KJYp5m36ib8VXqpYVs0zzOJHLnZJS9ByOzX/tecI9pQHc1
        VkSmzYI0XP5gQXYnXV+lPrPqPQ==
X-Google-Smtp-Source: AGHT+IF5SVq/Lc90motqQuAQR3TsxE76OkjJENkCNUVAmo760B595MKCYdCqPwQTmQzogj2343lTUg==
X-Received: by 2002:a17:907:3f99:b0:9a5:cab0:b061 with SMTP id hr25-20020a1709073f9900b009a5cab0b061mr1898538ejc.51.1693993691683;
        Wed, 06 Sep 2023 02:48:11 -0700 (PDT)
Received: from [192.168.37.154] (178235177204.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.204])
        by smtp.gmail.com with ESMTPSA id hb26-20020a170906b89a00b009931a3adf64sm8948845ejb.17.2023.09.06.02.48.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 02:48:11 -0700 (PDT)
Message-ID: <9848b712-e06e-4333-a260-928832962746@linaro.org>
Date:   Wed, 6 Sep 2023 11:48:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/12] arm64: dts: qcom: sm6125-sprout: drop incorrect UFS
 phy max current
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230905161920.252013-1-krzysztof.kozlowski@linaro.org>
 <20230905161920.252013-2-krzysztof.kozlowski@linaro.org>
 <e5c218a6-5b71-4887-b79a-9fd2dfb85009@linaro.org>
 <2104ccc8-8d71-f867-f3e1-2d4d02acb8ca@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <2104ccc8-8d71-f867-f3e1-2d4d02acb8ca@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 6.09.2023 11:45, Krzysztof Kozlowski wrote:
> On 06/09/2023 11:40, Konrad Dybcio wrote:
>> On 5.09.2023 18:19, Krzysztof Kozlowski wrote:
>>> Neither bindings nor UFS phy driver use properties like
>>> 'vdda-phy-max-microamp' and 'vdda-pll-max-microamp':
>>>
>>>   sm6125-xiaomi-laurel-sprout.dtb: phy@4807000: 'vdda-phy-max-microamp', 'vdda-pll-max-microamp' do not match any of the regexes: 'pinctrl-[0-9]+'
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> ---
>> ufshcd_populate_vreg uses this, but looks like nobody added it
>> to bindings.
> 
> That's UFS controller, not phy. I do not see any usage of it in the phy.
Oh right..

Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
