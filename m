Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EBEC628281
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Nov 2022 15:29:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236852AbiKNO3W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Nov 2022 09:29:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236681AbiKNO3S (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Nov 2022 09:29:18 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DCEC27910
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 06:29:17 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id h12so13395463ljg.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 06:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ISM2zgfFODgOmp1ORNBKTyWIoOceuUoP5SbXXBrjVKQ=;
        b=r/EOANfsM1yu7aewa3CIu//+iM7DNLZw+rmFTR9lM8c0SHAbDw8v4FJHej3t4Y6d1P
         x7agC5cqPOF25HgH7knNCn7uPJJLqAHTf9oWJkUkAKdCo83KKRPM93fkMK2DeihHzkGV
         S3qLAwWmSjdF/T4Sy75qtvOnf5kKK/Cebu/vlAgHYxl9XPGfFFq1M+bTBDFu5Wgf2YR2
         tbSA83i93fg27EGa81ZckoArsjLRhfLljkrL7HTcOaba/4QyFa1vRWBxOwXDqO6jbjir
         vKzBVJ/WJPXHN9RqfrASSeLr+jpAqWPvS0J6Od8aUTeuZrkyzUW0Z1i4i/Ku26lXDnlo
         J3TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ISM2zgfFODgOmp1ORNBKTyWIoOceuUoP5SbXXBrjVKQ=;
        b=qapLm3S6XnoAGsG9IB4LL/WAOtGEm0WMYtUYXA+V2g2OwshKqL/JACVniNQTVxL6mY
         DF13a243BBFojIA78V9bmkcbPXGyfi28p82uasiC1n0g4DRjecIyEHLkvplS90Xzqebd
         PuPYsoM3GyJnBtlzgb6Vf3VIaLtMs4vi5Hj9Yy59ikjoSxayaWRp1C5ykIi8WRZIqCkv
         b6QTACmXq5o/kunemEvct8k42Ioxfe04+K4N+aMYZo6ubyZXpj6LfN7GFP1vl2piaIBS
         izspFPygX0PrfTS22zqCXqUmPDEeNfxG34GbW7MVAsBjK6p4sOiLdsuTweTrfeLAILmD
         xzSQ==
X-Gm-Message-State: ANoB5pki95qZm67EPkigZdHggzqB9euprQIIS++wdYCrWxk2YViefzWS
        J021dHsHZgzblKktJQjncQ06iUYH4+Q3fo95
X-Google-Smtp-Source: AA0mqf6uIquyzVBR8m9radyhehrTdRZabFVp7GGP9WILxVY7lMG1w9i2PYOf77exohnuyJJNgfXqEA==
X-Received: by 2002:a2e:be23:0:b0:277:6fea:ac19 with SMTP id z35-20020a2ebe23000000b002776feaac19mr4402362ljq.83.1668436156025;
        Mon, 14 Nov 2022 06:29:16 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id m6-20020a056512114600b00498fe38ea0fsm1855066lfg.174.2022.11.14.06.29.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Nov 2022 06:29:15 -0800 (PST)
Message-ID: <ff619b48-e3de-7e70-aa38-b64cfb468932@linaro.org>
Date:   Mon, 14 Nov 2022 15:29:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 0/8] Add support for sm6115,4250 and OnePlus Nord N100
Content-Language: en-US
To:     Will Deacon <will@kernel.org>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     catalin.marinas@arm.com, kernel-team@android.com,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20221030094258.486428-1-iskren.chernev@gmail.com>
 <166843335275.2454481.8195401602727658140.b4-ty@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <166843335275.2454481.8195401602727658140.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/11/2022 15:20, Will Deacon wrote:
> On Sun, 30 Oct 2022 11:42:50 +0200, Iskren Chernev wrote:
>> Changes from v4
>> v4: https://lore.kernel.org/linux-arm-msm/20220919180618.1840194-1-iskren.chernev@gmail.com/
>> - rebase on next-20221028
>> - drop merged patches
>> - add unmerged patches from https://lore.kernel.org/linux-devicetree/20220815100952.23795-1-a39.skl@gmail.com/
>> - all in all, treat this as a resend
>>
>> [...]
> 
> Applied SMMU bindings to arm64 (for-joerg/arm-smmu/bindings), thanks!
> 
> [4/8] dt-bindings: arm-smmu: Add compatible for Qualcomm SM6115
>       https://git.kernel.org/arm64/c/728b22a57232
> [5/8] iommu/arm-smmu-qcom: Add SM6115 support
>       https://git.kernel.org/arm64/c/2fd6e1ad7e19


This has the same problem as QDR1000 - we want to stop extending this
table. Can we apply instead:
https://lore.kernel.org/all/20221102184420.534094-12-dmitry.baryshkov@linaro.org/

Best regards,
Krzysztof

