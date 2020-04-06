Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC16219EFF9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2020 06:49:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726050AbgDFEtt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Apr 2020 00:49:49 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:42682 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726408AbgDFEtt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Apr 2020 00:49:49 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586148588; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=c8in8o1Y8AE7z/tRhR0QEEwIcI3MUdyPgdaIe0fz8XQ=; b=RH18Q5POB3G1i9dxjScpIWH3zC+Eiki3JewAYBRXAdT0fxSw7XgZ0hCIwel/RfGUAFgteLVQ
 OTkq+8kKrTJyg5sKt3OVmXzlohpPUs7hUeRyBU82a0+N58ePIRzgL5XKKsCUoVhVy7Q5XJ2y
 LuTSyHX1sdJz6/vNJHER0wzkMyk=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8ab4de.7f4c5b0e2228-smtp-out-n02;
 Mon, 06 Apr 2020 04:49:34 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 19366C43637; Mon,  6 Apr 2020 04:49:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.43.137] (unknown [106.213.172.166])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 70FC4C433F2;
        Mon,  6 Apr 2020 04:49:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 70FC4C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v15 4/7] soc: qcom: rpmh-rsc: Save base address of drv
To:     Doug Anderson <dianders@chromium.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>, lsrao@codeaurora.org
References: <1585660782-23416-1-git-send-email-mkshah@codeaurora.org>
 <1585660782-23416-5-git-send-email-mkshah@codeaurora.org>
 <CAD=FV=X1t5bxgDqg5uPz4NrxfFMSCrGVwMgtnE5snDu330s78Q@mail.gmail.com>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <7fd2b098-0ad2-accc-a149-77680aeb4411@codeaurora.org>
Date:   Mon, 6 Apr 2020 10:19:23 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=X1t5bxgDqg5uPz4NrxfFMSCrGVwMgtnE5snDu330s78Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 4/2/2020 10:30 PM, Doug Anderson wrote:
> Hi,
>
> On Tue, Mar 31, 2020 at 6:20 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>> Add changes to save drv's base address for rsc. This is
>> used to read drv's configuration such as solver mode is
>> supported or to write into drv's registers.
>>
>> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
>> ---
>>   drivers/soc/qcom/rpmh-internal.h |  2 ++
>>   drivers/soc/qcom/rpmh-rsc.c      | 11 +++++------
>>   2 files changed, 7 insertions(+), 6 deletions(-)
> I still see no usage of "drv->base" outside of the probe function even
> after applying your whole patch series.  That implies that it can just
> stay as a local variable.
>
> If you have a later patch series that needs "drv->base" in some other
> RPMH function then this patch should be moved to the front of that
> series.  Until then it feels like it should be dropped.
>
>
> -Doug

Okay, i will drop this and keep base local to probe only for now.

Thanks,
Maulik

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
