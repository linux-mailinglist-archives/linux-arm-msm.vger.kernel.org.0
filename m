Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70BF015D6CF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2020 12:48:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728004AbgBNLs1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Feb 2020 06:48:27 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:41289 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728452AbgBNLs0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Feb 2020 06:48:26 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1581680906; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=dem2MPO59EVETxmr+ElZhIMQ9T5DDrU5ZkPlTSFmIs0=;
 b=tE4AUGn7bBEfiSQefam3pbS50NNz3MAl8vRQiJPlGvnYHn0RdOZX0qbeq0oT5F+gjVs7Rt3Q
 vE4E29kzyVVFhM6iKSXI6Bc+/N3nSG2TrHA8e1CC41zSgPbv+I/eJQ0xX9w8HBDmIakKiqe6
 GtV0iJ9EjqEseSxv5TCC9iUOxxQ=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e468905.7f5abdc3a6c0-smtp-out-n02;
 Fri, 14 Feb 2020 11:48:21 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1529AC4479C; Fri, 14 Feb 2020 11:48:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: gubbaven)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 52D0FC43383;
        Fri, 14 Feb 2020 11:48:20 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 14 Feb 2020 17:18:20 +0530
From:   gubbaven@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     johan.hedberg@gmail.com, marcel@holtmann.org, mka@chromium.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        robh@kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        tientzu@chromium.org, seanpaul@chromium.org, rjliao@codeaurora.org,
        yshavit@google.com
Subject: Re: [PATCH v3] Bluetooth: hci_qca: Bug fixes while collecting
 controller memory dump
In-Reply-To: <158164697600.184098.7937205486686028830@swboyd.mtv.corp.google.com>
References: <1581609364-21824-1-git-send-email-gubbaven@codeaurora.org>
 <158164697600.184098.7937205486686028830@swboyd.mtv.corp.google.com>
Message-ID: <d37ca6d9414720b2355d552fa8b68629@codeaurora.org>
X-Sender: gubbaven@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stephen,
On 2020-02-14 07:52, Stephen Boyd wrote:
> Quoting Venkata Lakshmi Narayana Gubba (2020-02-13 07:56:04)
>> This patch will fix the below issues
>>    1.Fixed race conditions while accessing memory dump state flags.
> 
> What sort of race condition?
[Venkat]:
To avoid race condition between qca_hw_error() and 
qca_controller_memdump() while accessing memory buffer, mutex is added.
In timeout scenario, qca_hw_error() frees memory dump buffers and 
qca_controller_memdump() might still access same memory buffers.
We can avoid this situation by using mutex.
> 
>>    2.Updated with actual context of timer in hci_memdump_timeout()
> 
> What does this mean?
[Venkat]:
I will update commit text and post in next patch set.
> 
>>    3.Updated injecting hardware error event if the dumps failed to 
>> receive.
>>    4.Once timeout is triggered, stopping the memory dump collections.
>> 
>> Possible scenarios while collecting memory dump:
>> 
>> Scenario 1:
>> 
>> Memdump event from firmware
>> Some number of memdump events with seq #
>> Hw error event
>> Reset
>> 
>> Scenario 2:
>> 
>> Memdump event from firmware
>> Some number of memdump events with seq #
>> Timeout schedules hw_error_event if hw error event is not received 
>> already
>> hw_error_event clears the memdump activity
>> reset
>> 
>> Scenario 3:
>> 
>> hw_error_event sends memdump command to firmware and waits for 
>> completion
>> Some number of memdump events with seq #
>> hw error event
>> reset
>> 
>> Fixes: d841502c79e3 ("Bluetooth: hci_qca: Collect controller memory 
>> dump during SSR")
>> Reported-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
>> Signed-off-by: Venkata Lakshmi Narayana Gubba 
>> <gubbaven@codeaurora.org>
>> ---
> [...]
>> @@ -1449,6 +1465,23 @@ static void qca_hw_error(struct hci_dev *hdev, 
>> u8 code)
>>                 bt_dev_info(hdev, "waiting for dump to complete");
>>                 qca_wait_for_dump_collection(hdev);
>>         }
>> +
>> +       if (qca->memdump_state != QCA_MEMDUMP_COLLECTED) {
>> +               bt_dev_err(hu->hdev, "clearing allocated memory due to 
>> memdump timeout");
>> +               mutex_lock(&qca->hci_memdump_lock);
> 
> Why is a mutex needed? Are crashes happening in parallel? It would be
> nice if the commit text mentioned why the mutex is added so that the
> reader doesn't have to figure it out.
> 
[Venkat]:Explained in above answer.
>> +               if (qca_memdump)
>> +                       memdump_buf = qca_memdump->memdump_buf_head;

Regards,
Lakshmi Narayana.
