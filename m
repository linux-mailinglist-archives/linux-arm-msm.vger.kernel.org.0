Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C79819EFFB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2020 06:51:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726408AbgDFEvk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Apr 2020 00:51:40 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:55958 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726436AbgDFEvj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Apr 2020 00:51:39 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586148699; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=XqOVPv1elEVhl7owP6ToQ1u/b9NrcPBlIL+fC4WITPo=; b=pkCOsdn2TSmh7/tNWGBE7UoXVYxF4PrEqyTtOIq+K4PG55ybQOtb4lOhb+2C9bLQpdCPvzgu
 RGZ7pooOfp5chinUPZGrUNMq03qsHSKrIX4a150hFqP6IW96rLI6cqMl6rO+4RLjuWhZflQe
 HrURlyIMn/v+v9y3Y/uGdQvGjNA=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8ab559.7fee662c65e0-smtp-out-n02;
 Mon, 06 Apr 2020 04:51:37 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4D254C43637; Mon,  6 Apr 2020 04:51:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.43.137] (unknown [106.213.172.166])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 12DA5C433F2;
        Mon,  6 Apr 2020 04:51:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 12DA5C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v15 5/7] soc: qcom: rpmh: Invoke rpmh_flush() for dirty
 caches
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
 <1585660782-23416-6-git-send-email-mkshah@codeaurora.org>
 <CAD=FV=XMwRFcNqgAKnTyYc85xgsrWSzs7Q_4nC2kOzpE=YJaUQ@mail.gmail.com>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <bc553806-d6b3-c81a-a0d2-afee3041a2c0@codeaurora.org>
Date:   Mon, 6 Apr 2020 10:21:28 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=XMwRFcNqgAKnTyYc85xgsrWSzs7Q_4nC2kOzpE=YJaUQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 4/3/2020 1:43 AM, Doug Anderson wrote:
> Hi,
>
> On Tue, Mar 31, 2020 at 6:20 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>> +/**
>> + * rpmh_rsc_ctrlr_is_busy: Check if any of the AMCs are busy.
> nit: this is still not quite kerneldoc format.  Specifically, the
> above should be:
>
> * rpmh_rsc_ctrlr_is_busy() - Check if any of the AMCs are busy
>
> You may think I'm being nit picky, but try running:
>
> scripts/kernel-doc -rst drivers/soc/qcom/rpmh-rsc.c
>
> Now search the output for "Check if any of the AMCs are busy".  It
> won't be there as you have formatted it.  If you fix it to the proper
> format then it shows up.  I'm not saying that you should fix up all
> functions at once but if you're adding new functions why not make them
> compliant?
>
>
> Other than the kerneldoc nitpick which could happen later in a cleanup
> series for the whole driver at once, this patch looks fine to me now.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Thanks for the review Doug.

I will fix this in v16 to update as per kernel doc format.

Thanks,
Maulik

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
