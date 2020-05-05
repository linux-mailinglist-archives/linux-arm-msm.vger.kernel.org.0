Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54E831C5704
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2020 15:33:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729106AbgEENdG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 May 2020 09:33:06 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:33015 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728608AbgEENdG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 May 2020 09:33:06 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588685585; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=QcmfgsQD27LgfznHzlYFE46yv5/bgTnf9gu//wV7tH8=; b=SnDImdQV+qbCysie8WwfijdO5UU2kxIu1qqeaA+i5n/vhGS+4sI4Yzd9XraYFSofNST2Nqva
 GtzjCxTHttsZsww3mBMsbtk+dvMhuhTlL0EPqx9oBy4nZ1hEp0uQU9aPx6HqJU0Xpr370gJJ
 OOyRldKqGv1NpKP7xn7d2WwVa+E=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eb16b06.7f19bd6afc70-smtp-out-n04;
 Tue, 05 May 2020 13:32:54 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2D324C433BA; Tue,  5 May 2020 13:32:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from [10.131.199.84] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 68929C433F2;
        Tue,  5 May 2020 13:32:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 68929C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH v3 09/17] mmc: sdhci-msm: Fix error handling for
 dev_pm_opp_of_add_table()
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Pradeep P V K <ppvk@codeaurora.org>,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
References: <1588080785-6812-1-git-send-email-rnayak@codeaurora.org>
 <1588080785-6812-10-git-send-email-rnayak@codeaurora.org>
 <CAPDyKFrGQvcCB1wfv=iqk66uja3faMRF1gGMSE2VhB8gJcO=sg@mail.gmail.com>
 <15efa375-cf1e-b793-1d3e-29ca0a547522@codeaurora.org>
 <CAPDyKFoaJTXq2qN+HXoSUovun9+4gzLeVJ-88FKbZCSCKjByLw@mail.gmail.com>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <fae2c6ba-62f0-7f35-5f71-b690532963f3@codeaurora.org>
Date:   Tue, 5 May 2020 19:02:47 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAPDyKFoaJTXq2qN+HXoSUovun9+4gzLeVJ-88FKbZCSCKjByLw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 5/5/2020 5:03 PM, Ulf Hansson wrote:
> On Wed, 29 Apr 2020 at 16:09, Rajendra Nayak <rnayak@codeaurora.org> wrote:
>>
>>
>> On 4/28/2020 11:59 PM, Ulf Hansson wrote:
>>> On Tue, 28 Apr 2020 at 15:39, Rajendra Nayak <rnayak@codeaurora.org> wrote:
>>>>
>>>> Even though specifying OPP's in device tree is optional, ignoring all errors
>>>> reported by dev_pm_opp_of_add_table() means we can't distinguish between a
>>>> missing OPP table and a wrong/buggy OPP table. While missing OPP table
>>>> (dev_pm_opp_of_add_table() returns a -ENODEV in such case) can be ignored,
>>>> a wrong/buggy OPP table in device tree should make the driver error out.
>>>>
>>>> while we fix that, lets also fix the variable names for opp/opp_table to
>>>> avoid confusion and name them opp_table/has_opp_table instead.
>>>>
>>>> Suggested-by: Matthias Kaehlcke <matthias@chromium.org>
>>>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>>>> Cc: Ulf Hansson <ulf.hansson@linaro.org>
>>>> Cc: Pradeep P V K <ppvk@codeaurora.org>
>>>> Cc: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
>>>> Cc: linux-mmc@vger.kernel.org
>>>
>>> Is this a standalone patch that I queue up via my mmc tree?
>>
>> Hi Ulf, yes, its a standalone patch which applies on top of the one
>> you already have in your tree. No other dependencies.
> 
> Thanks for confirming! Perhaps next time you could add this
> information as part of a description to the patch (where we usually
> add patch version information).
> 
> Anyway, applied for next!

Thanks Ulf, I should have sent this out as a standalone patch instead of including
it with the reset of the series, which caused the confusion. Sorry about that :/

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
