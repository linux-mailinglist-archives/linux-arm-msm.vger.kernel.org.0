Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D541F2D150F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Dec 2020 16:49:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726508AbgLGPtO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Dec 2020 10:49:14 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:59403 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726035AbgLGPtN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Dec 2020 10:49:13 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1607356133; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=yfIr29znjaxl/Kon6uEhEZYUTVt+9GV1gRFOj+VtQN0=; b=TEDePMSzgHOipona1dabqFZdW6nh5tjxroi+drPY3JHcE1N5eBIKgKAJJNFRORG0WpAlUY0b
 fykx+q1nUjscgXqkN1OQANVaiBHhwlGeUgq/ZjoXgbw5i69qPQFJ0nXdj8Ksaq4qsKEfntfN
 QO3R9rblxIE/Lo4p4nHmk+0coLw=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-east-1.postgun.com with SMTP id
 5fce4ec76d3da25fa52de28d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 07 Dec 2020 15:48:23
 GMT
Sender: jhugo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8742DC43461; Mon,  7 Dec 2020 15:48:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [10.226.59.216] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A8EC1C433ED;
        Mon,  7 Dec 2020 15:48:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A8EC1C433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: The MHI interrupt handling issue
To:     Loic Poulain <loic.poulain@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>
References: <CAMZdPi-LHmeLXGDjsb3kEhXrrv2do5eJ=HrHOnS5r+DqtAwKcQ@mail.gmail.com>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <4098d0e6-4cb7-32ba-3b40-cfb0412bac6d@codeaurora.org>
Date:   Mon, 7 Dec 2020 08:48:20 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAMZdPi-LHmeLXGDjsb3kEhXrrv2do5eJ=HrHOnS5r+DqtAwKcQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/7/2020 6:20 AM, Loic Poulain wrote:
> Hi folks,
> 
> Before putting my hands into that, I wanted to expose a MHI interrupt
> problem, comments are welcome.
> 
> Currently, the hard IRQ handler for event rings do nothing except
> triggering a tasklet as bottom half that in turn will take care of
> retrieving buffer(s). That leads to have an unexpected high amount of
> interrupts when I perform throughput testing with mhi-net (though it
> applies for any mhi client driver).
> 
> The point is that usually, an hard interrupt handler is responsible
> for triggering the bottom half handler but also for
> clearing/suspending interrupt on device side. However, AFAIK, there is
> no such possibility in the MHI protocol. Since the interrupt is not

I think Linux side improvements would always be welcome, but have you 
looked at BEI and INTMODT?  They are features defined in the MHI spec 
for addressing interrupt storms.


> handled in the hard irq handler, it is triggered again once interrupt
> are re-enabled, and even during the tasklet execution... at the end,
> that makes a lot of unnecessary interrupts, that introduce latency and
> participate to system load...
> 
> I added some printk to highlight that issue:
> [11564.689202] mhi_irq_handler 55d32b8
> [11564.689485] mhi_irq_handler 55d32b8
> [11564.690011] mhi_irq_handler 55d32b8
> [11564.690397] [55d32b8] mhi_process_data_event_ring start
> [11564.690667] mhi_irq_handler 55d32b8
> [11564.690937] mhi_irq_handler 55d32b8
> [11564.691207] mhi_irq_handler 55d32b8
> [11564.691475] mhi_irq_handler 55d32b8
> [11564.692076] [55d32b8] mhi_process_data_event_ring done
> [...]
> 
> I see two solutions to fix that problem:
> - Manage events directly in the hard-irq handler (no more tasklet)
> - Use threaded IRQ with IRQF_ONESHOT flag, to keep interrupt masked
> until threaded handler has completed.
> 
> Regards,
> Loic
> 


-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
