Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B4195EF4DF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Sep 2022 14:00:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235198AbiI2MAB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Sep 2022 08:00:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235484AbiI2L7z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Sep 2022 07:59:55 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BBFB101CA
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 04:59:53 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id x18so1825877wrm.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 04:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date;
        bh=dUJSDU18CYMRaGiSwsSx0be26VdLB2sB4pmCGCZ1IG8=;
        b=gfZLQB37F/ECpiUTEE8nEiJ2ocsiIimYEgyMYu3pK6czkZ5QdczYpdFtLKhvfvhvOz
         Tn6T3q8mjioWtK17djtkQuE7zbz7j5h9rrdNk9L/sw/Il0sZ3ixTBx6Q7dOWLb9siC1/
         hP76CTuydLQuQ/bIzpRWqnCjCuMuMxFUzhNAiuQQHWK110LYZld6UOw9/xetGEA0GiRm
         avaKhLDoVAPfezd3dNoJopyRkwPc8tT3nobuLnATM/ikj3dj1hFlA5SxcBUqrjtXJU/T
         7Q7ZAPFj2Ijgs51r+mQ20RoRVa7ULENXM9zsw+gDhY0JWwSQsY8ZvfsrJ67IQ9rLuqSh
         rHMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=dUJSDU18CYMRaGiSwsSx0be26VdLB2sB4pmCGCZ1IG8=;
        b=MMXkKqChhjvw0yetq4xUW2MHZHRQwbTv/ePu6hiRevCqpp8x+21ZgtxQuWRxgLDLVH
         oULcE6TcW1181tPTEuq/i7lSNao3lKQnx3bc4YnOJ581xDyxWddIfloTJCss2QG20PUj
         fgmZsNy4hqmM+cxZCRMlH54px8uLS/du99uO4FwnNrTzCH5/2feMnRW6fdjwkwAfIYVu
         PhUcjqavfRRb/e919cJUli6xdgF/wTrnASnHjCnG9JlTKSXHBDIo47XZLFd0kRJ/FaHi
         dX117lztGS+4iN1uw7J2Y7nIdLFhZzgQdYQeBhWclRSC6R6gX0RdT1aPqqWi7JA/Tnu4
         f5XA==
X-Gm-Message-State: ACrzQf3u4xs2SwDGiF3iqlSiXEcAd5KxjWQsMcDMg4599prKTDO1b9l/
        M6O3msOPr2UrFexkgghIg+yzuA==
X-Google-Smtp-Source: AMsMyM5cAPD48p7fBfvz6VufLlQU5vLDMODK8UJznutNylTtmYB0V/mkXII3h//CZtHgtgBAo11pvA==
X-Received: by 2002:adf:f482:0:b0:22c:c0f3:f067 with SMTP id l2-20020adff482000000b0022cc0f3f067mr1953249wro.517.1664452791959;
        Thu, 29 Sep 2022 04:59:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:1f17:3ea3:4e46:dff? ([2a01:e0a:982:cbb0:1f17:3ea3:4e46:dff])
        by smtp.gmail.com with ESMTPSA id iv16-20020a05600c549000b003b4c40378casm4673941wmb.39.2022.09.29.04.59.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Sep 2022 04:59:51 -0700 (PDT)
Message-ID: <3fa19362-118b-232e-0baf-ee365fa2f2e2@linaro.org>
Date:   Thu, 29 Sep 2022 13:59:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 5/7] arm: dts: qcom: mdm9615: remove invalid pmic
 subnodes compatibles
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20220928-mdm9615-dt-schema-fixes-v1-0-b6e63a7df1e8@linaro.org>
 <20220928-mdm9615-dt-schema-fixes-v1-5-b6e63a7df1e8@linaro.org>
 <0636d53f-508f-8a86-0973-2641c9020622@linaro.org>
 <6ed642ea-424d-49ed-eb30-e09588720373@linaro.org>
 <1a3c6766-9be5-1e55-95eb-bc9656e5c9a3@linaro.org>
 <7f8572ab-ff97-54bd-a5f3-fe0e179ee48e@linaro.org>
 <84cb8941-eb15-1bbf-59b7-bbcd6c15c30d@linaro.org>
 <07405d0d-8534-6470-21d1-26b85dbd7de0@linaro.org>
 <f54377f0-a152-9367-1b06-f49df7466282@linaro.org>
Reply-To: neil.armstrong@linaro.org
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <f54377f0-a152-9367-1b06-f49df7466282@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29/09/2022 13:47, Krzysztof Kozlowski wrote:
> On 29/09/2022 13:39, Neil Armstrong wrote:
>>>>> The DTS looks correct unless you have some real argument that it is not.
>>>>>
>>>>> How this should be fixed? First, drop bogus entries from drivers, then
>>>>> document proper compatibles.
>>>>
>>>> What do you mean ? There's no point to keep the PM8921 compatibles, the gpio
>>>
>>> I asked at beginning - why? Why there is no point to keep them?
>>
>> Because the HW is an PM8018 and the addition of the PM8921 was for policy/organization/struggling-to-make-dt-merged-before-clear-dt-policy/...
>> so you say I should modify the Bindings to reflect the actual "pm8018", "pm8921" situation instead of changing the DT even if incorrect ?
> 
> Yes, this is what I already wrote:
> 
> "How this should be fixed? First, drop bogus entries from drivers, then
> document proper compatibles."
> 
>>>> and PMIC bindings already enforces to only have the PM8018 compatible.
>>>
>>> That is just partial argument because binding does not match DTS. So
>>> something is not correct. Why do you assume bindings are correct?
>>
>> Because bindings accurately reflects HW and DT doesn't.
> 
> That's not really an answer... Bindings are correct because they are
> correct? What is exactly correct in the bindings? How they reflect the
> HW in a proper way, while DTS does not?
> 
> Or let's focus on actual hardware - what are the properties of the
> hardware which indicate that DTS is wrong?

The actual PMIC is an PM8018

> 
> Best regards,
> Krzysztof
> 

Neil
