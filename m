Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66026326461
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Feb 2021 15:50:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230203AbhBZOtc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Feb 2021 09:49:32 -0500
Received: from z11.mailgun.us ([104.130.96.11]:25248 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229915AbhBZOtN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Feb 2021 09:49:13 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614350931; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=7f6oYZbS+4PmPt/CVutDJnDyMbGA+QS/Vt1PzOpRTeM=; b=JEb2oncAnU2eE51r0ssAEFoGa+BqHRmzkqON2Yh+q+Leghacjvvywa/nhX6FRjzD2V/Wrz4q
 gr8sxXUAhgXP34gB9owHaVnZJolU66AKHKCETh4tRChid+i48hBWaN4cSn2Rnt9by9l9x5Mq
 joJM/HIP8hGYiZo0VlKUHuOfC64=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 60390a3475e4458f0868585f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 26 Feb 2021 14:48:20
 GMT
Sender: jhugo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3C62EC43461; Fri, 26 Feb 2021 14:48:20 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [10.226.59.216] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 55A23C433C6;
        Fri, 26 Feb 2021 14:48:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 55A23C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH RFC v2] mhi: Enable unique QRTR node ID support
To:     Gokul Sriram Palanisamy <gokulsri@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org,
        sricharan@codeaurora.org
References: <1614336169-31467-1-git-send-email-gokulsri@codeaurora.org>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <838f49f6-ea8a-4c22-21f2-45721773bbc9@codeaurora.org>
Date:   Fri, 26 Feb 2021 07:48:18 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1614336169-31467-1-git-send-email-gokulsri@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2/26/2021 3:42 AM, Gokul Sriram Palanisamy wrote:
> On multi-mhi platforms, host WiFi driver and
> QMI test driver needs to differntiate between
> QMI packets received from multiple mhi devices.
> 
> With QCN9000 PCI cards, once SBL gets loaded, we
> utilize ERRDBG2 register to write a unique value
> per mhi device from device-tree that the device
> utilizes to set a unique QRTR node ID and
> instance ID for the QMI service. This helps QRTR
> stack in differenting the packets in a multi-mhi
> environment and can route them accordingly.
> 
> sample:
> root@OpenWrt:/# qrtr-lookup
>    Service Version Instance Node  Port
>         15       1        0    8     1 Test service
>         69       1        8    8     2 ATH10k WLAN firmware service
>         15       1        0   24     1 Test service
>         69       1       24   24     2 ATH10k WLAN firmware service
> 
> Here 8 and 24 on column 3 (QMI Instance ID)
> and 4 (QRTR Node ID) are the node IDs that
> is unique per mhi device.
> 
> Changes since v1:
>   - Addressed review comments by Jeffrey Hugo.

No, you didn't.  You fixed the DT comment, but didn't address the rest. 
  This gets a NACK from me.

> 
> Gokul Sriram Palanisamy (1):
>    bus: mhi: core: Add unique qrtr node id support
> 
>   drivers/bus/mhi/core/boot.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 


-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
