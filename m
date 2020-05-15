Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8AE21D4467
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2020 06:23:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726504AbgEOEXm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 May 2020 00:23:42 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:15879 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726198AbgEOEXm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 May 2020 00:23:42 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589516622; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=fcotPRDneqlOpcVfqWQi9yd9jerMS3v05oGvbu+gO4g=; b=pMcZxToOFz4u03HHw/OsiFGBiWlXyydeVEI3DrZ0xoEWve0yIVuDUILmVu02oLncUt2IERlm
 Hca7vONhh2lcRpRRDBZg/pm6lOB1/p6PYeEWo71Fl4F+vRBZfFtUHryfc0M9lkTjtdcx+jrV
 XwD4EQ44MzUJE08VBMTQoqDj3zE=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5ebe193daefa5a01ccbdc2fe (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 15 May 2020 04:23:25
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AF71EC432C2; Fri, 15 May 2020 04:23:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from [192.168.1.7] (unknown [122.169.155.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mgautam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5F58FC433D2;
        Fri, 15 May 2020 04:23:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5F58FC433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mgautam@codeaurora.org
Subject: Re: [PATCH v7 2/4] usb: dwc3: qcom: Add interconnect support in dwc3
 driver
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        Georgi Djakov <georgi.djakov@linaro.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>,
        Felipe Balbi <balbi@kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "open list:ULTRA-WIDEBAND (UWB) SUBSYSTEM:" 
        <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
References: <1585718145-29537-1-git-send-email-sanm@codeaurora.org>
 <1585718145-29537-3-git-send-email-sanm@codeaurora.org>
 <878shu4uwk.fsf@kernel.org> <875zcy4uuj.fsf@kernel.org>
 <20200514171352.GP4525@google.com>
 <abbc3f8c-c8c9-c189-735e-f8058dab3e40@linaro.org>
 <CAKohpon+JBpV3fC7j=rhc1R4gi_mVG6teBDrE8Yryd4QXfw9bw@mail.gmail.com>
From:   Manu Gautam <mgautam@codeaurora.org>
Message-ID: <20a2adc5-4153-1447-0542-908b7996c187@codeaurora.org>
Date:   Fri, 15 May 2020 09:53:15 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAKohpon+JBpV3fC7j=rhc1R4gi_mVG6teBDrE8Yryd4QXfw9bw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 5/15/2020 9:27 AM, Viresh Kumar wrote:
> On Fri, 15 May 2020 at 02:33, Georgi Djakov <georgi.djakov@linaro.org> wrote:
>
>> ---8<---
>> diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
>> index 206caa0ea1c6..6661788b1a76 100644
>> --- a/drivers/usb/dwc3/Kconfig
>> +++ b/drivers/usb/dwc3/Kconfig
>> @@ -129,6 +129,7 @@ config USB_DWC3_QCOM
>>         tristate "Qualcomm Platform"
>>         depends on ARCH_QCOM || COMPILE_TEST
>>         depends on EXTCON || !EXTCON
>> +       depends on INTERCONNECT || !INTERCONNECT
> Again, as I said yesterday. This looks incorrect and may not fix the problem..
>
> With this we will be able to select USB_DWC3_QCOM even when INTERCONNECT=m.

DWC3_QCOM in that case would be 'm' if INTERCONNECT =m and
that should be fine?


> What we perhaps need here is:
> depends on INTERCONNECT != m
>
> --
> viresh

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

