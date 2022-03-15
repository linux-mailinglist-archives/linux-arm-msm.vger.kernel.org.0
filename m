Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95F714D99F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Mar 2022 12:06:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347807AbiCOLH0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Mar 2022 07:07:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238189AbiCOLHZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Mar 2022 07:07:25 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD4FA4C40F
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Mar 2022 04:06:13 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id s29so10910920lfb.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Mar 2022 04:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=9vmesL8tOTRPsq7x8WZ8qHp+9N985sUYU62HU5s1DPA=;
        b=BQz08S24DAYEkT+IGa+4wb0s0YRhXdTsYew1zCHGf37CzbZ31CeF3U7REi3L0qixv5
         iPR6y/RZ4RDDbpfKNB6BAMCHic1HweR/g1tF8HMEnCqzcbe8bROLM1et/y7f7RRbB4Uq
         Ei2qd5z3v/cAmMfT//Ysh9JKDCP+DOxL5zUeSKTWpSfgUZAa+6b4KrHBPjJyodCePb6m
         AsLcZA/s5dxvbfY5GLmq7ARiIM9EepI9V6KJH2X+nuw97q6+y+JvrdqOytbdw6pPSyXN
         AHgoIYarjuDOm2kjxOrxVsJJhrVEmxaYYoaIITwxlJQpOro18grVOZNbaBl6zCHW5sKh
         bbyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=9vmesL8tOTRPsq7x8WZ8qHp+9N985sUYU62HU5s1DPA=;
        b=x7fQ4SYZYmVgkRuXdhjWVI5bJAJy5SL8d4NOPgJNBfFp8VmuyMTjj4c5HIHm7fEQ70
         plfaIjPBuXGnbuWZgJSHNvHa/B/xdOJ2+S0+OQiP0vVjbW/w8krrQSm9oSN/c9Eqihco
         MjJ0E7wEQYbdzmV3fAU7spY0Lt11JTV6UoS/L6CCHduVRbmVgQ0m8sl3Eow2K2yj3Klt
         Xp762SmfKoIuea3vRUsayQqWyWPED1IS1mUuGyLsJW25psaf5d7E7jWkCBntsVOjOeDU
         sD/kNF1jgoH/bNocmr4jhW2NXJU7NM+m2+CoSz2SeFnckPm6Y+eiwvylhAMNhjxRxiOY
         VzyA==
X-Gm-Message-State: AOAM533L3hy5FO8+E7n9scFwFfIb3GT+9obMjcGlPcQtG/SjHmnlmJWS
        pJhfP4mXq1fSuvoFeR0Kh+X+8A==
X-Google-Smtp-Source: ABdhPJxyt3QkgDtXyI4kP2W7KJlQ2wXPfgzvqLIRRezjetIp30y6HxhxKA7yf8bTgToSlJZiwxUtRw==
X-Received: by 2002:ac2:5f4d:0:b0:448:7d37:5838 with SMTP id 13-20020ac25f4d000000b004487d375838mr10542297lfz.419.1647342372262;
        Tue, 15 Mar 2022 04:06:12 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a24-20020a2eb558000000b0024805e1b758sm4077638ljn.25.2022.03.15.04.06.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Mar 2022 04:06:11 -0700 (PDT)
Message-ID: <f345e709-afb3-6078-3a3c-87cafd79cbee@linaro.org>
Date:   Tue, 15 Mar 2022 14:06:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2] pinctrl: qcom-pmic-gpio: Add support for pm8450
Content-Language: en-GB
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220315091106.613153-1-dmitry.baryshkov@linaro.org>
 <49d116ad-c853-8c15-83fb-ec4e418323ef@canonical.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <49d116ad-c853-8c15-83fb-ec4e418323ef@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 15/03/2022 13:33, Krzysztof Kozlowski wrote:
> On 15/03/2022 10:11, Dmitry Baryshkov wrote:
>> PM8450 provides 4 GPIOs. Add a compatible entry for this GPIO block.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>> Changes since v1:
>>   - Added dt-bindings entry to the pinctrl/qcom,pmic-gpio.yaml
> 
> This should be a separate patch.

Quoting Linus Wallej:
 > I am fine with bindings being fixed in the same patch for this type
 > of oneliners.

So, I added it to the same patch.

-- 
With best wishes
Dmitry
