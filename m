Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29F792ADFB3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Nov 2020 20:34:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732783AbgKJTdv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Nov 2020 14:33:51 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:54756 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731630AbgKJTdu (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Nov 2020 14:33:50 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1605036829; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=K/tppd3bkuiYCDHVg8Y7XcR4PfStm54/pkeuQmDqRgk=; b=WrC3/J5X2EdPaYy3/LYMaXv+mzM6Atd7tLNwhfG3qg+L6VCw5/NysPHASdazKg3ZKilSAoz7
 IhW++zP0GNTSgBX0IThU+z5k35ZI+uwSsELYlZhBQL6kLucgZ5/03Zj9GZT8xzy17kW3Fe8S
 H3CaMikbA6AiReE/P6VxBpf6N9Y=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5faaeb1cd6d93bf0e96dfae6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 10 Nov 2020 19:33:48
 GMT
Sender: jhugo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F0C7AC4345B; Tue, 10 Nov 2020 19:33:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.226.59.216] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1F029C433AD;
        Tue, 10 Nov 2020 19:33:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1F029C433AD
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH] pinctrl: qcom: Fix msm9853 Kconfig entry to depend on,
 not select PINCTRL_MSM
To:     John Stultz <john.stultz@linaro.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Prasad Sodagudi <psodagud@codeaurora.org>,
        Vladimir Lypak <junak.pub@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
References: <20201110190054.20517-1-john.stultz@linaro.org>
 <19b7b301-3460-7ece-21d3-59cd7490c8ed@codeaurora.org>
 <CALAqxLWQua4UWwXomOin5OdizevvY2F=rMExyDbB3o8h5F731Q@mail.gmail.com>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <25cf555d-113c-28bc-7776-047e4a412fdb@codeaurora.org>
Date:   Tue, 10 Nov 2020 12:33:43 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.3
MIME-Version: 1.0
In-Reply-To: <CALAqxLWQua4UWwXomOin5OdizevvY2F=rMExyDbB3o8h5F731Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/10/2020 12:32 PM, John Stultz wrote:
> On Tue, Nov 10, 2020 at 11:29 AM Jeffrey Hugo <jhugo@codeaurora.org> wrote:
>>
>> On 11/10/2020 12:00 PM, John Stultz wrote:
>>> One fixup following my patch commit be117ca32261 ("pinctrl:
>>> qcom: Kconfig: Rework PINCTRL_MSM to be a depenency rather then
>>> a selected config") being queued in LinusW's tree, as a new
>>> config entry was added for the msm9853 that also needs the
>>> change.
>>>
>>> Applies to LinusW's pinctrl devel tree.
>>>
>>> Cc: Andy Gross <agross@kernel.org>
>>> Cc: Prasad Sodagudi <psodagud@codeaurora.org>
>>> Cc: Vladimir Lypak <junak.pub@gmail.com>
>>> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
>>> Cc: Linus Walleij <linus.walleij@linaro.org>
>>> Cc: linux-arm-msm@vger.kernel.org
>>> Cc: linux-gpio@vger.kernel.org
>>> Signed-off-by: John Stultz <john.stultz@linaro.org>
>>> ---
>>>    drivers/pinctrl/qcom/Kconfig | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
>>> index 8bdf878fe970c..cf56e029cd9c7 100644
>>> --- a/drivers/pinctrl/qcom/Kconfig
>>> +++ b/drivers/pinctrl/qcom/Kconfig
>>> @@ -115,7 +115,7 @@ config PINCTRL_MSM8916
>>>    config PINCTRL_MSM8953
>>>        tristate "Qualcomm 8953 pin controller driver"
>>>        depends on GPIOLIB && OF
>>> -     select PINCTRL_MSM
>>> +     depends on PINCTRL_MSM
>>>        help
>>>          This is the pinctrl, pinmux, pinconf and gpiolib driver for the
>>>          Qualcomm TLMM block found on the Qualcomm MSM8953 platform.
>>>
>>
>> Subject should indicate msm8953, no?
>>
> 
> Sorry, I'm confused. :)
> The subject is "pinctrl: qcom: Fix msm9853 Kconfig..." is there
> something more specific you are suggesting?

Yes, that is the current subject.  Yet you are changing a Kconfig for 
msm8953.

msm9853 != msm8953

Infact I'm not sure msm9853 is something that actually exists....

-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
