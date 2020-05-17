Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C4861D6C70
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2020 21:39:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726269AbgEQTis (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 May 2020 15:38:48 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:46524 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726693AbgEQTis (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 May 2020 15:38:48 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589744327; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=0O8z3VVrmPj5u81vYKpNmSGfVT78wO0SwTwsfqos8a0=; b=QmHxiJwOZhErdTQ1HxWofAsjncNsAdwAmaWy1MDHdPmr3OIOVwOdxAk0OgHFd1rTr0BITbZA
 aLUdw5lRJ4+9wu+28+Sv2wKxjjD5YkhRT81+UHDnoHvjstxv3VJDAUwQarHxJ7X3JCCUUxJx
 rH3Y/G3c02JKVV5zldPwqHKz31w=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ec192b8.7f844379cf80-smtp-out-n03;
 Sun, 17 May 2020 19:38:32 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6DE4AC433F2; Sun, 17 May 2020 19:38:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7EFF3C432C2;
        Sun, 17 May 2020 19:38:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7EFF3C432C2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH] bus: mhi: core: Use current ee in intvec handler
To:     bbhatt@codeaurora.org
Cc:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kernel-owner@vger.kernel.org
References: <1589509049-14532-1-git-send-email-jhugo@codeaurora.org>
 <aab020af0372b11ff63ba4526aab0fdc@codeaurora.org>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <713dc189-561d-3c4a-f856-26d006524485@codeaurora.org>
Date:   Sun, 17 May 2020 13:38:30 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <aab020af0372b11ff63ba4526aab0fdc@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5/15/2020 8:58 PM, bbhatt@codeaurora.org wrote:
> On 2020-05-14 19:17, Jeffrey Hugo wrote:
>> The intvec handler stores the caches ee in a local variable for use in
>> processing the intvec.  It should instead use the current ee which is
>> read at the beginning of the intvec incase that the intvec is related to
>> an ee change.  Otherwise, the handler might make the wrong decision
>> based on an incorrect ee.
>>
>> Fixes: 3000f85b8f47 (bus: mhi: core: Add support for basic PM operations)
>> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
>> ---
>>  drivers/bus/mhi/core/main.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
>> index 7272a5a..0a41fe5 100644
>> --- a/drivers/bus/mhi/core/main.c
>> +++ b/drivers/bus/mhi/core/main.c
>> @@ -386,8 +386,8 @@ irqreturn_t mhi_intvec_threaded_handler(int
>> irq_number, void *dev)
>>      write_lock_irq(&mhi_cntrl->pm_lock);
>>      if (MHI_REG_ACCESS_VALID(mhi_cntrl->pm_state)) {
>>          state = mhi_get_mhi_state(mhi_cntrl);
>> -        ee = mhi_cntrl->ee;
>>          mhi_cntrl->ee = mhi_get_exec_env(mhi_cntrl);
>> +        ee = mhi_cntrl->ee;
>>      }
>>
>>      if (state == MHI_STATE_SYS_ERR) {
> Hi Jeff,
> 
> Let's hold off on this change for now please as we have some good set of
> bug fixes and improvements coming in very soon. They're only pending post
> to LKML.

Does that series of changes address the same issue this patch does, and 
are they going to be posted soon (ie this week)?

-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
