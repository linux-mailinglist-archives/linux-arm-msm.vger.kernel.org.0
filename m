Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3430758F900
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Aug 2022 10:27:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234418AbiHKI06 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Aug 2022 04:26:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234453AbiHKI05 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Aug 2022 04:26:57 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37F2C9018F
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Aug 2022 01:26:56 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id z20so18601062ljq.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Aug 2022 01:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=aFp18g3W0LGsukVneJEK/1E3oiiot3UTXvd9sFAT8nw=;
        b=FqWcBq881TMTPntLfTmspF/MO4q8vssSHi7sEwMMId7K8gaHZO7iDS19GycjfK/9eX
         cFkAyPoL+ZxgFs9dY8+KnKf6KghP2eQzh3/5e6CQ/yNuLXuxNR9SPKZrpjiyncVvDb3O
         XXeumafKovUw/dYZQxYK5tO0Uaaw87e+2IHMLlXkYC2LEPH0U3H7RPvoAztqsE04Q7FO
         Mf+k14XGfUr4CH3epxKAHe8GlAmmds9FGDbUI0nJLOb1IsNlO9dOjdxiEQQeUqdAQup0
         8VNiPpAsjtTUvBYLnnqxgnUTB3eLW0jqoT030lVtBRxB3+Ebqa1AV3PA1it84KPPmRUC
         l0Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=aFp18g3W0LGsukVneJEK/1E3oiiot3UTXvd9sFAT8nw=;
        b=AyJq6ntiN9GAbi+pjG/FxcBB9NfjVNdi30PDA/c9NesrEuwzHBONgoP40O+SkOzspF
         gv5zVW8iDwkjcnjD/arShxosTdHUj0S3MMx++1W7xC8WBD0pUyJmU6Et+5hApi7VxDFR
         gXfrFSc+drIHkJGboGQW2uLOgu6j14JlZL71kJKleXRupyV0gyAV/4VaWz6HKj4arn4m
         eh6dzlb6raRlwmVX7dXWFIsVwtIEHmmkoFMJOzBDQQHadKSOECkCVvS5Uovyy4OJph5m
         c8fLzTyWNz0nLTooMt6QrmYMRjMug5Jz+c5KykZJBDOiI6P5JPfeGp2B5U8GjROFJBAK
         Xndg==
X-Gm-Message-State: ACgBeo1rOR83BAOYLnZCGBRMAWCPk6IQ07333ZceqwgLkGGK7Cmea2RU
        /AF0gXHdN7xeXfv9giwJyq6OmQ==
X-Google-Smtp-Source: AA6agR7WKZFo0Gd0CrwW+kQqeYyEuLnmEdTMd3As+yvfv/ebcpxDY62N1UnBLOwwuNPgfwQgBjnxwg==
X-Received: by 2002:a05:651c:154b:b0:25e:c73d:a786 with SMTP id y11-20020a05651c154b00b0025ec73da786mr7507173ljp.397.1660206414645;
        Thu, 11 Aug 2022 01:26:54 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id t5-20020a05651c204500b0025e08d58e75sm720412ljo.133.2022.08.11.01.26.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Aug 2022 01:26:54 -0700 (PDT)
Message-ID: <1cbb9946-2171-46ee-be6d-84b914ecc47f@linaro.org>
Date:   Thu, 11 Aug 2022 11:26:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/3] dt-bindings: display/msm: Add binding for SC8280XP
 MDSS
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220811040121.3775613-1-bjorn.andersson@linaro.org>
 <20220811040121.3775613-2-bjorn.andersson@linaro.org>
 <db9b74f9-1f65-5b88-1c81-0a3fd6dcf9a6@linaro.org>
 <74afb676-4a85-7a8e-f7ea-20d8a0967d7d@linaro.org>
In-Reply-To: <74afb676-4a85-7a8e-f7ea-20d8a0967d7d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/08/2022 11:04, Krzysztof Kozlowski wrote:
>>
>> additionalProperties:false on this level
>>
>> which will point to missing properties (e.g. opp-table)
> 
> I'll fix existing bindings which have similar issue.

Hm, I think Dmitry is already working on this:
https://lore.kernel.org/all/20220710090040.35193-5-dmitry.baryshkov@linaro.org/
so your patches should be on top of his.


Best regards,
Krzysztof
