Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47E671D802C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2020 19:31:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728355AbgERRbb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 May 2020 13:31:31 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:13585 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727006AbgERRbb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 May 2020 13:31:31 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589823091; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=QSSrzFNbEG3tmCT2karWtCRJnIeHXfmV1PvTWjMC/xc=;
 b=tzpeiWW1BGUUtEUq4tRpRYONfIJNOTx/CjNbuxDwJSuUb5VIYNc3ZF29C4Y76BD/qflBAphE
 8Fclm6y0oWZjkTz1XJZi+ZkgFXoeYxbKCft0Auwks7X2yIeSMzvvky5WyVfZNfWdy17j7kOQ
 F5iMDB6xlz+xSbNUkORemOU/HBQ=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ec2c664.7f51d3af67d8-smtp-out-n04;
 Mon, 18 May 2020 17:31:16 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E90B3C432C2; Mon, 18 May 2020 17:31:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2309FC433D2;
        Mon, 18 May 2020 17:31:13 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Mon, 18 May 2020 10:31:13 -0700
From:   bbhatt@codeaurora.org
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kernel-owner@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: core: Use current ee in intvec handler
In-Reply-To: <713dc189-561d-3c4a-f856-26d006524485@codeaurora.org>
References: <1589509049-14532-1-git-send-email-jhugo@codeaurora.org>
 <aab020af0372b11ff63ba4526aab0fdc@codeaurora.org>
 <713dc189-561d-3c4a-f856-26d006524485@codeaurora.org>
Message-ID: <9f19fb80d6cb410809efd27d27390709@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-05-17 12:38, Jeffrey Hugo wrote:
> On 5/15/2020 8:58 PM, bbhatt@codeaurora.org wrote:
>> On 2020-05-14 19:17, Jeffrey Hugo wrote:
>>> The intvec handler stores the caches ee in a local variable for use 
>>> in
>>> processing the intvec.  It should instead use the current ee which is
>>> read at the beginning of the intvec incase that the intvec is related 
>>> to
>>> an ee change.  Otherwise, the handler might make the wrong decision
>>> based on an incorrect ee.
>>> 
>>> Fixes: 3000f85b8f47 (bus: mhi: core: Add support for basic PM 
>>> operations)
>>> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
>>> ---
>>>  drivers/bus/mhi/core/main.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>> 
>>> diff --git a/drivers/bus/mhi/core/main.c 
>>> b/drivers/bus/mhi/core/main.c
>>> index 7272a5a..0a41fe5 100644
>>> --- a/drivers/bus/mhi/core/main.c
>>> +++ b/drivers/bus/mhi/core/main.c
>>> @@ -386,8 +386,8 @@ irqreturn_t mhi_intvec_threaded_handler(int
>>> irq_number, void *dev)
>>>      write_lock_irq(&mhi_cntrl->pm_lock);
>>>      if (MHI_REG_ACCESS_VALID(mhi_cntrl->pm_state)) {
>>>          state = mhi_get_mhi_state(mhi_cntrl);
>>> -        ee = mhi_cntrl->ee;
>>>          mhi_cntrl->ee = mhi_get_exec_env(mhi_cntrl);
>>> +        ee = mhi_cntrl->ee;
>>>      }
>>> 
>>>      if (state == MHI_STATE_SYS_ERR) {
>> Hi Jeff,
>> 
>> Let's hold off on this change for now please as we have some good set 
>> of
>> bug fixes and improvements coming in very soon. They're only pending 
>> post
>> to LKML.
> 
> Does that series of changes address the same issue this patch does,
> and are they going to be posted soon (ie this week)?
Yes.
