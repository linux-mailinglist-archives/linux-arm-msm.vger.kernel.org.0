Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47B692C443F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Nov 2020 16:45:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730781AbgKYPm2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Nov 2020 10:42:28 -0500
Received: from z5.mailgun.us ([104.130.96.5]:34495 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731069AbgKYPm1 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Nov 2020 10:42:27 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606318947; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=219viEJs80YinO7ZUyzR7p3xFE6xskCEF+OX+4JOFHs=; b=kU0n9FGxsBdWOCYjsNdUrI9nKa4soQXMW/+2mfXJh/hlFGJmnl1cVmrzsszj98CVCqvLoOSk
 30afva/6/ueP86ETPuQFhOn0TwPFj6vJDRFeS0bm46+lOCl87a7EeBmFAL1z/zB4iY2W8a8e
 SqA8UjTwrlfPY14c96rPQVK7XMI=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5fbe7b5ba5a29b56a1cd42f4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 25 Nov 2020 15:42:19
 GMT
Sender: jhugo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BC782C43220; Wed, 25 Nov 2020 15:42:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.226.59.216] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6742EC43463;
        Wed, 25 Nov 2020 15:42:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6742EC43463
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH] bus: mhi: core: Indexed MHI controller name
To:     Loic Poulain <loic.poulain@linaro.org>,
        manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org
References: <1606318983-24898-1-git-send-email-loic.poulain@linaro.org>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <1093835e-3ed6-5579-5fbe-39a6d8fbadaf@codeaurora.org>
Date:   Wed, 25 Nov 2020 08:42:16 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <1606318983-24898-1-git-send-email-loic.poulain@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/25/2020 8:43 AM, Loic Poulain wrote:
> Today the MHI controller name is simply cloned from the underlying
> bus device (its parent), that gives the following device structure
> for e.g. a MHI/PCI controller:
> devices/pci0000:00/0000:00:01.2/0000:02:00.0/0000:02:00.0
> devices/pci0000:00/0000:00:01.2/0000:02:00.0/0000:02:00.0/0000:02:00.0_IPCR
> ...
> 
> That's quite misleading/confusing and can cause device registering
> issues because of duplicate dev name (e.g. if a PCI device register
> two different MHI instances).
> 
> This patch changes MHI core to create indexed mhi controller names
> (mhi0, mhi1...) in the same way as other busses (i2c0, usb0...).
> 
> The previous example becomes:
> devices/pci0000:00/0000:00:01.2/0000:02:00.0/mhi0
> devices/pci0000:00/0000:00:01.2/0000:02:00.0/mhi0/mhi0_IPCR
> ...
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>


How does this change /sys/bus/mhi/devices/ ?

The point of having the bus name in the mhi device name is to give an 
easy way to correlate those devices back to the "root" device (I have a 
lot of users which do that).

Also, do we actually have some device that actually exposes multiple MHI 
interfaces?


-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
