Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 285A46A3C42
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Feb 2023 09:20:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229673AbjB0IUb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Feb 2023 03:20:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229760AbjB0IU3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Feb 2023 03:20:29 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9706B1C7EC
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Feb 2023 00:20:21 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id t25-20020a1c7719000000b003eb052cc5ccso6035261wmi.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Feb 2023 00:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sgK47vU7M/FXf5KOx8h7f4IonnbqfcBQOVvVSN/z9lo=;
        b=J8V2I8Q60dLZRgPy7qe8A8Hm7sA4fZ6yHcbD/P60ufmG/cwbSQCUFpAkAMxWnlFIbl
         /EJzAa5gn95QqoIaI1XwgWKX5jTl9yKygU52YR74mFFhbRAVyPFkq6TeX4T4GM70JmTG
         8wuXtlxeZBkUm/WM0HNAxwQ/8dUG/Rnbu1WxSls5b5SB4ZnQxAnpfb4g839sl/gzL9eC
         9SUoy9l+6rHmg8YTVYnZY7JwCsLTJoeTpkNM8cFOzueYag4kCRhQyaXoGSXVEfzWypZ3
         X8BD0zba2NFjbIqpLVnLz+zIMYLDY1z/TGrEHa4mquM9qTnTAtgcWGBq6zzqyWEAq70h
         8O9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sgK47vU7M/FXf5KOx8h7f4IonnbqfcBQOVvVSN/z9lo=;
        b=efTOFtZKDFR0/eP86manOZzj+n0PPO53wI2iQng2wPT4p4GetneASnbhQ2muiAmf1u
         Yly1hdeqdsIFOJRTmIHJQ/U8HYn+8XndVBmuUmWHya1fLZe7g6Yoe4V9fQy4dGvs8JB3
         WgpjpwvQrvxMh9J9I+vk8iEeapfDH4vNiArb+22z3GjJDE0weFngZx4eFQv5PbgI/+gE
         LNaI/EwGnqCnDzZv70aRUNnrtSgWdQXVZAKp7KrTmNn2MsnT7AC/rrc3WDIU5PJ8u8nc
         hOgZONtU2XJqP7kbD/GXhiM5JSPJzD6Y1DbF2iw3nUaNYl+293uWp5KE0AJqt/scv2m8
         Y3hw==
X-Gm-Message-State: AO0yUKUiyangYUvHeEV+wHruxuCV4pF/1D5VEeplyAsGKTavEszcewWh
        7UI4iziBTRbNdC9wYHiitCR8ruFo7+2Co1HD
X-Google-Smtp-Source: AK7set9cPHVbEu8EUdjI72LwaZCCDu8CLFgqAKbLBKJZh1rXsAXVHPkewM5OFSN0jcQJmuRen2Rgcw==
X-Received: by 2002:a05:600c:3b9e:b0:3ea:f6c4:5f26 with SMTP id n30-20020a05600c3b9e00b003eaf6c45f26mr8942432wms.17.1677486020060;
        Mon, 27 Feb 2023 00:20:20 -0800 (PST)
Received: from [192.168.7.111] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id p20-20020a05600c359400b003daf7721bb3sm12558791wmq.12.2023.02.27.00.20.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 00:20:19 -0800 (PST)
Message-ID: <686851a5-1a47-50b2-d925-51c967f21f4d@linaro.org>
Date:   Mon, 27 Feb 2023 09:20:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v3] dt-bindings: arm-smmu: Add compatible for SM8550 SoC
Content-Language: en-US
To:     Will Deacon <will@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        Robin Murphy <robin.murphy@arm.com>,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Joerg Roedel <joro@8bytes.org>
References: <20230207-topic-sm8550-upstream-smmu-bindings-v3-1-cb15a7123cfe@linaro.org>
 <bb6f65a0-a4af-c9e6-ddc8-6ff06452c9dc@linaro.org>
 <20230221091024.GA26703@willie-the-truck>
Organization: Linaro Developer Services
In-Reply-To: <20230221091024.GA26703@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 21/02/2023 10:10, Will Deacon wrote:
> On Wed, Feb 15, 2023 at 10:26:39AM +0100, Neil Armstrong wrote:
>> On 08/02/2023 10:13, neil.armstrong@linaro.org wrote:
>>> From: Abel Vesa <abel.vesa@linaro.org>
>>>
>>> Add the SoC specific compatible for SM8550 implementing
>>> arm,mmu-500.
>>>
>>> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---
>>> Changes in v3:
>>> - update allOf:if: for disallowing clocks
>>> - Link to v2: https://lore.kernel.org/r/20230207-topic-sm8550-upstream-smmu-bindings-v2-1-680cbfae6dac@linaro.org
>>>
>>> Changes in v2:
>>> - Rebased on new bindings using qcom,smmu-500 & arm,mmu-500
>>> - Dropped driver changes since we rely on qcom,smmu-500 fallback
>>> - Link to v1: https://lore.kernel.org/all/20221116114001.2669003-1-abel.vesa@linaro.org/
>>> ---
>>>    Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
>>>    1 file changed, 2 insertions(+)
>>
>> Do you think you can pick this patch for v6.3 ?
> 
> This is 6.4 material now (I sent my SMMU pull request for 6.3 weeks ago
> [1]).

Thanks!
Neil

> 
> Will
> 
> [1] https://lore.kernel.org/linux-iommu/20230124142957.GA26873@willie-the-truck/

