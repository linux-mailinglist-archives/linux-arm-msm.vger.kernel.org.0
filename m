Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43C7519F00E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2020 07:13:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725768AbgDFFNJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Apr 2020 01:13:09 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:22614 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726475AbgDFFNI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Apr 2020 01:13:08 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586149987; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=tANryGArsikEbRKGuh59UuK8NiPOtSWy4smmXqPMdlM=; b=xkBFUOtgjUy+BACJou/PX894I351QjyBPVfhQksEmEiUYAJXtTr/OncEVsYseYIvqZhdKwhX
 zKO321LQUA6I17qNClxa2s4hBQCUaLCa5bBvaum96/WJsyjrTeCZifD3xlW7Xc7zb7P52Klz
 hQEa2El08npmSdUQecgFEYQJuus=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8aba5a.7fdc353a9ed8-smtp-out-n05;
 Mon, 06 Apr 2020 05:12:58 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7911BC43637; Mon,  6 Apr 2020 05:12:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.43.137] (unknown [106.213.172.166])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 00075C433D2;
        Mon,  6 Apr 2020 05:12:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 00075C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v15 7/7] soc: qcom: rpmh-rsc: Allow using free WAKE TCS
 for active request
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
 <1585660782-23416-8-git-send-email-mkshah@codeaurora.org>
 <CAD=FV=X_JJWAb9BBkhWGZJ+jUvtO3ipf-OxFRYo38YY25cA42Q@mail.gmail.com>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <dd447c2a-c2b7-c40f-e3e9-27a9ba9614c7@codeaurora.org>
Date:   Mon, 6 Apr 2020 10:42:50 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=X_JJWAb9BBkhWGZJ+jUvtO3ipf-OxFRYo38YY25cA42Q@mail.gmail.com>
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
> On Tue, Mar 31, 2020 at 6:21 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>> When there are more than one WAKE TCS available and there is no dedicated
>> ACTIVE TCS available, invalidating all WAKE TCSes and waiting for current
>> transfer to complete in first WAKE TCS blocks using another free WAKE TCS
>> to complete current request.
>>
>> Remove rpmh_rsc_invalidate() to happen from tcs_write() when WAKE TCSes
>> is re-purposed to be used for Active mode. Clear only currently used
>> WAKE TCS's register configuration.
>>
>> Mark the caches as dirty so next time when rpmh_flush() is invoked it
>> can invalidate and program cached sleep and wake sets again.
> Comment above is no longer right now that you've removed the place
> that marks caches as dirty.
>
>
>> Fixes: 2de4b8d33eab (drivers: qcom: rpmh-rsc: allow active requests from wake TCS)
>> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
>> ---
>>   drivers/soc/qcom/rpmh-rsc.c | 23 +++++++++++------------
>>   1 file changed, 11 insertions(+), 12 deletions(-)
> Other than the comment nit:
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Thanks Doug for the review.

I will remove last paragraph from commit message.

Thanks,
Maulik

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
