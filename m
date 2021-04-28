Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DED7136E1CB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Apr 2021 01:02:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232833AbhD1Wh3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Apr 2021 18:37:29 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:48500 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232065AbhD1Wh2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Apr 2021 18:37:28 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1619649402; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=Xb7vwUQl8DLEO6JxFmpIkRnwlm9MR4Bo/2o5euFDiQs=; b=Y+XzYSiNpnsidhliJsEiVpzhTNUexu0UbP+fl1JLeZomMKRKGU25OoBWpV1pIXcIe9sAl8th
 rDctYV4c5YJtUPWhSNkbdalwGg8QY8byGKmJXKYpsh8j03jozUeR2aezjlxT5Aml0hTN+QFo
 vggYBi1Ln0sTz3/Rk3h3kI9BzW0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 6089e376f34440a9d43d95b2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 28 Apr 2021 22:36:38
 GMT
Sender: subbaram=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 586EDC433F1; Wed, 28 Apr 2021 22:36:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [10.46.162.93] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: subbaram)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A0308C4338A;
        Wed, 28 Apr 2021 22:36:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A0308C4338A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=subbaram@codeaurora.org
Subject: Re: [PATCH 0/2] Add QCOM PMIC PWM driver
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     aghayal@codeaurora.org, collinsd@codeaurora.org,
        fenglinw@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210428155422.GL1908499@yoga>
 <1619635777-2872-1-git-send-email-subbaram@codeaurora.org>
 <20210428200650.GM1908499@yoga>
From:   Subbaraman Narayanamurthy <subbaram@codeaurora.org>
Message-ID: <32125f08-009d-7e41-bbb9-ecc9f5da21ca@codeaurora.org>
Date:   Wed, 28 Apr 2021 15:36:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210428200650.GM1908499@yoga>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 4/28/21 1:06 PM, Bjorn Andersson wrote:
> On Wed 28 Apr 13:49 CDT 2021, Subbaraman Narayanamurthy wrote:
>
>>>> Add PWM driver to support PWM modules inside QCOM PMIC chips which are accessed
>>>> through SPMI bus. Normally, there would be multiple PWM modules with adjacent
>>>> address spaces present in one PMIC chip, and each PWM module has 0x100 size of
>>>> address space. With this driver, a pwm_chip with multiple pwm_device individuals
>>>> is created, and each pwm_device individual is corresponding to one PWM module.
>>>>
>>> Exposing this as individual pwm_chips will prevent us from enabling the
>>> LED related use cases (patterns and multicolor) that most versions of
>>> the hardware support.
>>> I proposed [1] a while ago and think this is a better approach. I'll
>>> take some time to respin this and send out the next version.
>>> [1] https://lore.kernel.org/linux-arm-msm/20201021201224.3430546-1-bjorn.andersson@linaro.org/
>> Hi Bjorn,
>> Yes, we came across this patch series but this driver (leds-qcom-lpg) is a
>> combo one which provides support only for RGB LEDs (or TRI_LED module) along
>> with PWM/LPG channels allocated for it. Say, if we've additional PWM channels
>> on the same PMIC (that provides user-interface support) or another PMIC
>> (non user-interface) that has multiple PWM channels that are not used for LED
>> notifications, it would be good to have a separate PWM driver to support such
>> channels IMHO. There are couple of use cases we've come across recently.
>>
>> 1. Using a PWM channel for controlling external LCD backlight controller
>> 2. Using a PWM channel for controlling a haptics actuator
>>
> The LPG driver, as it's currently written, support using each channel as
> a LED, part of a multicolor LED or as a pwm_chip. It's been tested on
> pm8916 (which doesn't have triled or the lut), pm*8994, pmi8996 and
> pm8150* in various combinations.
Thanks for the confirmation. I must have looked at your earlier patchset which only was registering with LED class framework and not having support to register with PWM framework for the channels that're not used for LEDs.
> In particular the PWM-only modes that you describe here is how the
> driver has been used on db410c, for driving the "backlight GPIO" in the
> low-speed connector.
Yes, that should cover the use cases I was mentioning. We will look into your patch series to see if it can support our requirements.
> Regards,
> Bjorn


-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project

