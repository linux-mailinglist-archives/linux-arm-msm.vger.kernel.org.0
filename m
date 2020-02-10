Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 666CC1573BE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2020 12:56:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727481AbgBJL4Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Feb 2020 06:56:25 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:23958 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727363AbgBJL4Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Feb 2020 06:56:25 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1581335784; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: Cc: To: References:
 Subject: Sender; bh=msK0pnyL6OkobNKSG9pUtr6X/d0ixckiXExfRYSIcCI=; b=FrNwtwVdS1NCi2k0WuVv0hhrsXAkivhYvu0tpruwVZZ+ztXtSKViMMjqd/JP0YnyMwGNdnqX
 SQjvFs4I/OVc9OfHa+pQfmHOaT7TsUDgdCatURVWiO7b2NUYpTlQY1XtPCQty9IGBFDgiqbW
 Jfkmc9cSe7qxnL5rXPztWaHYh90=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e4144e6.7ff4d49b7b58-smtp-out-n01;
 Mon, 10 Feb 2020 11:56:22 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1BA03C4479C; Mon, 10 Feb 2020 11:56:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.252.218.68] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: gkohli)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CA6BBC43383;
        Mon, 10 Feb 2020 11:56:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CA6BBC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=gkohli@codeaurora.org
Subject: Query: Regarding Notifier chain callback debugging or profiling
References: <82d5b63e-4ae6-fb5f-8a1c-2d5755db2638@codeaurora.org>
To:     akpm@linux-foundation.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>, tglx@linutronix.de
Cc:     linux-arm-msm@vger.kernel.org, neeraju@codeaurora.org
From:   Gaurav Kohli <gkohli@codeaurora.org>
X-Forwarded-Message-Id: <82d5b63e-4ae6-fb5f-8a1c-2d5755db2638@codeaurora.org>
Message-ID: <6e077b43-6c9e-3f4e-e079-db438e36a4eb@codeaurora.org>
Date:   Mon, 10 Feb 2020 17:26:16 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <82d5b63e-4ae6-fb5f-8a1c-2d5755db2638@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

In Linux kernel, everywhere we are using notification chains to notify 
for any kernel events, But we don't have any debugging or profiling 
mechanism to know which callback is taking time or currently we are 
stuck on which call back(without dumps it is difficult to say for last 
problem)

Below are the few ways, which we can implement to profile callback on 
need basis:

1) Use trace event before and after callback:

static int notifier_call_chain(struct notifier_block **nl,
                                unsigned long val, void *v,
                                int nr_to_call, int *nr_calls)
{
         int ret = NOTIFY_DONE;
         struct notifier_block *nb, *next_nb;


+		trace_event for entry of callback
                 ret = nb->notifier_call(nb, val, v);
+		trace_event for exit of callback

         }
         return ret;
}

2) Or use pr_debug instead of trace_event

3) Both of the above approach has certain problems, like it will dump 
callback for each notifier chain, which might flood trace buffer or dmesg.

So we can use bool variable to control that and dump the required 
notification chain only.

Some thing like below we can use:

  struct srcu_notifier_head {
         struct mutex mutex;
         struct srcu_struct srcu;
         struct notifier_block __rcu *head;
+       bool debug_callback;
  };


  static int notifier_call_chain(struct notifier_block **nl,
                                unsigned long val, void *v,
-                              int nr_to_call, int *nr_calls)
+                              int nr_to_call, int *nr_calls, bool 
debug_callback)
  {
         int ret = NOTIFY_DONE;
         struct notifier_block *nb, *next_nb;
@@ -526,6 +526,7 @@ void srcu_init_notifier_head(struct 
srcu_notifier_head *nh)
         if (init_srcu_struct(&nh->srcu) < 0)
                 BUG();
         nh->head = NULL;
+       nh->debug_callback = false; -> by default it would be false for 
every notifier chain.

4) we can also think of something pre and post function, before and 
after each callback, And we can enable only for those who wants to profile.

Please let us what approach we can use, or please suggest some debugging 
mechanism for the same.

Regards
Gaurav

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center,
Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
