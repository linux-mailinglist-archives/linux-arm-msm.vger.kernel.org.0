Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D31B1209CBF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2020 12:23:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403988AbgFYKXO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jun 2020 06:23:14 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:15265 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2403969AbgFYKW4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jun 2020 06:22:56 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1593080573; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=Xq2c2do+r42+PyhioAtT6iJwdx8izQbaCqjpi5nU0bg=; b=AiCb9QHgnGPo0yUK0dG0wtHG/cYseItcBQ4dmSmDNRggP4Z8vnQ9OwF9yJTD7jWNEJKg7+ZA
 Hbz9Cof2CyLXk5enPXatmhK06F6MP2iQl6KBrq5KMnRo0xJijRTlMPoXOvqhcX3mf71ikLwV
 kklWBTecINftcOw7LpYWARND9HE=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n12.prod.us-east-1.postgun.com with SMTP id
 5ef47ae9356bcc26ab9af454 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 25 Jun 2020 10:22:33
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 00028C433CB; Thu, 25 Jun 2020 10:22:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.29.129] (unknown [49.36.69.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 39588C433C8;
        Thu, 25 Jun 2020 10:22:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 39588C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH] soc: qcom: rpmh: Remove serialization of TCS commands
To:     Doug Anderson <dianders@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Srinivas Rao L <lsrao@codeaurora.org>
References: <1590749507-1440-1-git-send-email-mkshah@codeaurora.org>
 <CAD=FV=VccaN-65KT+PEL9z-Hrp2kriQHmdOywK0chcL6c4sA=w@mail.gmail.com>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <c9e32a49-2642-b3e4-3fe7-1b40781d2577@codeaurora.org>
Date:   Thu, 25 Jun 2020 15:52:26 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=VccaN-65KT+PEL9z-Hrp2kriQHmdOywK0chcL6c4sA=w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 6/19/2020 9:57 AM, Doug Anderson wrote:
> Hi,
>
> On Fri, May 29, 2020 at 3:52 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>> From: Lina Iyer <ilina@codeaurora.org>
>>
>> Requests sent to RPMH can be sent as fire-n-forget or response required,
>> with the latter ensuring the command has been completed by the hardware
>> accelerator. Commands in a request with tcs_cmd::wait set, would ensure
>> that those select commands are sent as response required, even though
>> the actual TCS request may be fire-n-forget.
>>
>> Also, commands with .wait flag were also guaranteed to be complete
>> before the following command in the TCS is sent. This means that the
>> next command of the same request blocked until the current request is
>> completed. This could mean waiting for a voltage to settle or series of
>> NOCs be configured before the next command is sent. But drivers using
>> this feature have never cared about the serialization aspect. By not
>> enforcing the serialization we can allow the hardware to run in parallel
>> improving the performance.
>>
>> Let's clarify the usage of this member in the tcs_cmd structure to mean
>> only completion and not serialization. This should also improve the
>> performance of bus requests where changes could happen in parallel.
>> Also, CPU resume from deep idle may see benefits from certain wake
>> requests.
>>
>> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> You are posting the patch and so you need your SoB too.
sure, i will add and re-spin.
>
>
>> ---
>>   drivers/soc/qcom/rpmh-rsc.c | 19 ++++++++-----------
>>   include/soc/qcom/tcs.h      |  5 +++--
>>   2 files changed, 11 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
>> index 076fd27..d99e639 100644
>> --- a/drivers/soc/qcom/rpmh-rsc.c
>> +++ b/drivers/soc/qcom/rpmh-rsc.c
>> @@ -413,8 +413,7 @@ static irqreturn_t tcs_tx_done(int irq, void *p)
>>                          cmd = &req->cmds[j];
>>                          sts = read_tcs_cmd(drv, RSC_DRV_CMD_STATUS, i, j);
>>                          if (!(sts & CMD_STATUS_ISSUED) ||
>> -                          ((req->wait_for_compl || cmd->wait) &&
>> -                          !(sts & CMD_STATUS_COMPL))) {
>> +                          (cmd->wait && !(sts & CMD_STATUS_COMPL))) {
> I don't quite understand this part of the change.  Why don't you need
> to check "req->wait_for_compl" anymore?  You are still setting
> "CMD_MSGID_RESP_REQ" if "req->wait_for_compl" is set and none of the
> code in your patch actually sets "cmd->wait" (unlike what's implied in
> your change to the header file).  Maybe some previous version of the
> patch _was_ actually setting "cmd->wait" and when you stopped doing
> that you forgot to restore this part of the change?
TCS cmd->wait, will be set by the callers of rpmh APIs. We don't set in 
our driver.
>
>
>>                                  pr_err("Incomplete request: %s: addr=%#x data=%#x",
>>                                         drv->name, cmd->addr, cmd->data);
>>                                  err = -EIO;
>> @@ -433,7 +432,6 @@ static irqreturn_t tcs_tx_done(int irq, void *p)
>>   skip:
>>                  /* Reclaim the TCS */
>>                  write_tcs_reg(drv, RSC_DRV_CMD_ENABLE, i, 0);
>> -               write_tcs_reg(drv, RSC_DRV_CMD_WAIT_FOR_CMPL, i, 0);
> Should you also be removing the write to RSC_DRV_CMD_WAIT_FOR_CMPL in
> both tcs_write() and tcs_invalidate()?  Those are the only two places
> left that set this register and they both always set it to 0.
Thanks for pointing this, yes both of these places it can be removed.
>
>
>>                  writel_relaxed(BIT(i), drv->tcs_base + RSC_DRV_IRQ_CLEAR);
>>                  spin_lock(&drv->lock);
>>                  clear_bit(i, drv->tcs_in_use);
>> @@ -465,23 +463,23 @@ static irqreturn_t tcs_tx_done(int irq, void *p)
>>   static void __tcs_buffer_write(struct rsc_drv *drv, int tcs_id, int cmd_id,
>>                                 const struct tcs_request *msg)
>>   {
>> -       u32 msgid, cmd_msgid;
>> +       u32 msgid;
>> +       u32 cmd_msgid = CMD_MSGID_LEN | CMD_MSGID_WRITE;
>>          u32 cmd_enable = 0;
>> -       u32 cmd_complete;
>>          struct tcs_cmd *cmd;
>>          int i, j;
>>
>> -       cmd_msgid = CMD_MSGID_LEN;
>> +       /* Convert all commands to RR when the request has wait_for_compl set */
>>          cmd_msgid |= msg->wait_for_compl ? CMD_MSGID_RESP_REQ : 0;
>> -       cmd_msgid |= CMD_MSGID_WRITE;
>> -
>> -       cmd_complete = read_tcs_reg(drv, RSC_DRV_CMD_WAIT_FOR_CMPL, tcs_id);
>>
>>          for (i = 0, j = cmd_id; i < msg->num_cmds; i++, j++) {
>>                  cmd = &msg->cmds[i];
>>                  cmd_enable |= BIT(j);
>> -               cmd_complete |= cmd->wait << j;
>>                  msgid = cmd_msgid;
>> +               /*
>> +                * Additionally, if the cmd->wait is set, make the command
>> +                * response reqd even if the overall request was fire-n-forget.
>> +                */
>>                  msgid |= cmd->wait ? CMD_MSGID_RESP_REQ : 0;
>>
>>                  write_tcs_cmd(drv, RSC_DRV_CMD_MSGID, tcs_id, j, msgid);
>> @@ -490,7 +488,6 @@ static void __tcs_buffer_write(struct rsc_drv *drv, int tcs_id, int cmd_id,
>>                  trace_rpmh_send_msg_rcuidle(drv, tcs_id, j, msgid, cmd);
>>          }
>>
>> -       write_tcs_reg(drv, RSC_DRV_CMD_WAIT_FOR_CMPL, tcs_id, cmd_complete);
>>          cmd_enable |= read_tcs_reg(drv, RSC_DRV_CMD_ENABLE, tcs_id);
>>          write_tcs_reg(drv, RSC_DRV_CMD_ENABLE, tcs_id, cmd_enable);
>>   }
>> diff --git a/include/soc/qcom/tcs.h b/include/soc/qcom/tcs.h
>> index 7a2a055..d1c87fd 100644
>> --- a/include/soc/qcom/tcs.h
>> +++ b/include/soc/qcom/tcs.h
>> @@ -1,6 +1,6 @@
>>   /* SPDX-License-Identifier: GPL-2.0 */
>>   /*
>> - * Copyright (c) 2016-2019, The Linux Foundation. All rights reserved.
>> + * Copyright (c) 2016-2020, The Linux Foundation. All rights reserved.
>>    */
>>
>>   #ifndef __SOC_QCOM_TCS_H__
>> @@ -30,7 +30,7 @@ enum rpmh_state {
>>    *
>>    * @addr: the address of the resource slv_id:18:16 | offset:0:15
>>    * @data: the resource state request
>> - * @wait: wait for this request to be complete before sending the next
>> + * @wait: Ensure that this command is complete before returning
> I have a hard time understanding what you're trying to convey here.
> Do we even need the "wait" in this structure?
Yes we need.
>
> When you call rpmh_write() we use DEFINE_RPMH_MSG_ONSTACK which sets
> "wait_for_compl", right?
Right.
>
> ...so I guess you're expecting this to be used for rpmh_write_async()?
Correct and also for rpmh_write_batch().
>   ...but we never wait in that case, do we?

tcs cmd->wait will be set by callers of rpmh API.

>
> ...or are you expecting rpmh_write_batch() to take advantage of this somehow?

Yes.

Lets me take an example,

a caller is sending below data in rpmh_write_batch()

CMD0: addr=a, data=x, wait=0,
CMD1: addr=b, data=y, wait=1,
CMD2: addr=c, data=z, wait=0,

now __tcs_buffer_write()  with current code is setting two things,

1. serialize sending the commands (by setting RSC_DRV_CMD_WAIT_FOR_CMPL 
for CMD1)
This ensured that CMD1 is waited to complete before triggering any new 
command (CMD2 of TCS) to the HW.

2. wait for completion of commands before returning (by setting 
CMD_MSGID_RESP_REQ for CMD1)
This ensured that CMD1 is complete before generating completion interrupt.

This patch drops serialization part (1), so that all the commands can be 
triggered at once and can parallelly be finished.
if wait=1 is set for some command, the completion interrupt will be 
generated once those commands are complete in HW.
>
>
>>    */
>>   struct tcs_cmd {
>>          u32 addr;
>> @@ -43,6 +43,7 @@ struct tcs_cmd {
>>    *
>>    * @state:          state for the request.
>>    * @wait_for_compl: wait until we get a response from the h/w accelerator
>> + *                  (sets the cmd->wait for all commmands in the request)
> s/commmands/scommands
>
> Also: I don't think this actually goes and modifies "cmd->wait" for
> all the commands in the request, does it?  Maybe say "same as setting
> cmd->wait for all the commands in the request"?
ok, i will update in next revision.
>
>
> -Doug

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

