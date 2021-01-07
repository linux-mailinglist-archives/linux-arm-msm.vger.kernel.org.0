Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D56E82ECBCC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Jan 2021 09:39:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726915AbhAGIi5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Jan 2021 03:38:57 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:53031 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726338AbhAGIi5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Jan 2021 03:38:57 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1610008718; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=DbRjArTSerMJL/6H69dAmMZAuylzmFnWCTAs/XAJGxM=; b=EqSs6go8x97KMb3wNmxCYWn+QAOaDiJvexy3K21/HYgmLHgWfa79It3abWKkEVB2FnFAsKqs
 3fBBiF7tt6OWdK5x1P4r3kUkAYoNgj5ieKWPkhRw+A74ryEQnvMFu6dWuSRruOVAOXGAKEf7
 kllynTMtYawzUgUEElyO4U/RY3w=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-east-1.postgun.com with SMTP id
 5ff6c86826530504c40a6289 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 07 Jan 2021 08:38:00
 GMT
Sender: mkshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7C422C433C6; Thu,  7 Jan 2021 08:37:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.29.129] (unknown [49.36.65.173])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A3070C433CA;
        Thu,  7 Jan 2021 08:37:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A3070C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v2] soc: qcom: rpmh: Remove serialization of TCS commands
To:     Doug Anderson <dianders@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Srinivas Rao L <lsrao@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>
References: <1606203086-31218-1-git-send-email-mkshah@codeaurora.org>
 <CAD=FV=V60zVYkFGQvAu6qfpumBL6+fm_9ziRCSiN7Um7+ra6zw@mail.gmail.com>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <e74ed5ba-8b5f-638a-62f5-19eb2501ce1a@codeaurora.org>
Date:   Thu, 7 Jan 2021 14:07:52 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=V60zVYkFGQvAu6qfpumBL6+fm_9ziRCSiN7Um7+ra6zw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Doug,

On 12/4/2020 3:14 AM, Doug Anderson wrote:
> Hi,
>
> On Mon, Nov 23, 2020 at 11:32 PM Maulik Shah <mkshah@codeaurora.org> wrote:
>> @@ -423,8 +422,7 @@ static irqreturn_t tcs_tx_done(int irq, void *p)
>>                          cmd = &req->cmds[j];
>>                          sts = read_tcs_cmd(drv, RSC_DRV_CMD_STATUS, i, j);
>>                          if (!(sts & CMD_STATUS_ISSUED) ||
>> -                          ((req->wait_for_compl || cmd->wait) &&
>> -                          !(sts & CMD_STATUS_COMPL))) {
>> +                          (cmd->wait && !(sts & CMD_STATUS_COMPL))) {
>>                                  pr_err("Incomplete request: %s: addr=%#x data=%#x",
>>                                         drv->name, cmd->addr, cmd->data);
>>                                  err = -EIO;
> In my review of v1 all those months ago, the way we left things was
> that I disagreed with this part of the patch, and I still do.  I think
> you should leave things the way they were in tcs_tx_done().  Copying
> my un-responded-to comments from v1 here for you:
>
> In your patch in __tcs_buffer_write(), if "wait_for_compl" is set then
> "CMD_MSGID_RESP_REQ" will be added for every message in the request,
> right?  That's because you have this bit of code:
>
> /* Convert all commands to RR when the request has wait_for_compl set */
> cmd_msgid |= msg->wait_for_compl ? CMD_MSGID_RESP_REQ : 0;
>
> That means that if _either_ "cmd->wait" or "req->wait_for_compl" is
> set then you expect the "sts" to have "CMD_STATUS_COMPL", right?
> That's exactly the code that used to be there.
>
> Said another way, if "req->wait_for_compl" was set then it's an error
> if any of our commands are missing the "CMD_STATUS_COMPL" bit, right?
>
>
>> @@ -30,7 +30,7 @@ enum rpmh_state {
>>    *
>>    * @addr: the address of the resource slv_id:18:16 | offset:0:15
>>    * @data: the resource state request
>> - * @wait: wait for this request to be complete before sending the next
>> + * @wait: ensure that this command is complete before returning
> In my response to v1 I suggested that a comment would be nice here.
> Something akin to:
>
> Setting "wait" here only makes sense in the batch case for active-only
> transfers.
>
> This is because:
> * rpmh_write_async() - There's no callback and rpmh_write_async()
> doesn't set the "completion" to anything so there's nobody that cares
> at all
>
> * DEFINE_RPMH_MSG_ONSTACK - always sets wait_for_compl.
>
> -Doug

Addressed both comments and sent v3.

Thanks,
Maulik

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

