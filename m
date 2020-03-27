Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9E001952B7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2020 09:23:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726335AbgC0IXt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Mar 2020 04:23:49 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:58311 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726106AbgC0IXt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Mar 2020 04:23:49 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585297429; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=ucvUfVE9bEnqsldfxSjExm37VB9VjR5Onas8L9QcKhA=; b=nUUgO7VKqeTp4NBvKfpLZxwCwrg7mYIs9OIAyK3KirI1HzayhRHwifTP4VETsC7+d4Eg0jWB
 tqz0rs8tslmkBjOdIM046+pUB0DIQAJ6S+50HZi8DBEDi+eeZKVBXnucVuKX74jr9UDpL4Ge
 eVJ0gS8WyxTfYdkSpDhiUYKaCl8=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e7db80e.7fb06cb65ab0-smtp-out-n02;
 Fri, 27 Mar 2020 08:23:42 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3F06EC44788; Fri, 27 Mar 2020 08:23:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.43.129] (unknown [106.222.5.69])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0A660C433F2;
        Fri, 27 Mar 2020 08:23:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0A660C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v14 3/6] soc: qcom: rpmh: Invalidate SLEEP and WAKE TCSes
 before flushing new data
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
References: <1585244270-637-1-git-send-email-mkshah@codeaurora.org>
 <1585244270-637-4-git-send-email-mkshah@codeaurora.org>
 <CAD=FV=Xwhz=N5dd5u2pYxKXyv5_PKhSZ5xZdvo+YXdk8THz_Wg@mail.gmail.com>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <8ca62b01-d6d2-94fa-d032-b4ec8912ed8e@codeaurora.org>
Date:   Fri, 27 Mar 2020 13:53:26 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=Xwhz=N5dd5u2pYxKXyv5_PKhSZ5xZdvo+YXdk8THz_Wg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 3/27/2020 12:01 AM, Doug Anderson wrote:
> Hi,
>
> On Thu, Mar 26, 2020 at 10:38 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>>  /**
>> - * rpmh_invalidate: Invalidate all sleep and active sets
>> - * sets.
>> + * rpmh_invalidate: Invalidate sleep and active sets in batch_cache
> s/and active/and wake/
>
> ...with that, feel free to add my Reviewed-by tag.
>
> -Doug

Thankd Doug for the review. I will update this in v15.

Thanks,
Maulik

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
