Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B5C8275BD4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Sep 2020 17:28:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726184AbgIWP23 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Sep 2020 11:28:29 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:14097 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726156AbgIWP22 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Sep 2020 11:28:28 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600874908; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=nWppJvhScqTXpOeJU60yF7RClrYnaWW3yaJPc9cdc34=; b=OMpt4c94/c2SqmynqmXhoOWGXqeZLOWYjNHwhgHwZJmQeVzCSvYB93NH004pTN+mTyNMViPt
 jPH47Aduj3fYwbUmyP2w7DYgm8HQNyaNjRZEF6SJplSYm3zkLOMXPQSiz0sMWaBpZLMMk3D0
 w/CosLNEp4cm+w/aQIDAU5i+a/o=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5f6b699315795ac4126b4ed0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 23 Sep 2020 15:28:19
 GMT
Sender: jhugo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A82AFC433FE; Wed, 23 Sep 2020 15:28:19 +0000 (UTC)
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6A975C433C8;
        Wed, 23 Sep 2020 15:28:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6A975C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH] bus: mhi: Add MHI PCI support
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>
Cc:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org,
        linux-arm-msm@vger.kernel.org
References: <1600868432-12438-1-git-send-email-loic.poulain@linaro.org>
 <20200923151709.GC40811@yoga>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <96f5107c-849d-8b5f-0473-555e4582bcdb@codeaurora.org>
Date:   Wed, 23 Sep 2020 09:28:17 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.1
MIME-Version: 1.0
In-Reply-To: <20200923151709.GC40811@yoga>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 9/23/2020 9:17 AM, Bjorn Andersson wrote:
> On Wed 23 Sep 08:40 CDT 2020, Loic Poulain wrote:
> 
>> This is a generic MHI-over-PCI controller driver for MHI only devices
>> such as QCOM modems. For now it supports registering of Qualcomm SDX55
>> based PCIe modules. The MHI channels have been extracted from mhi
>> downstream driver.
>>
>> This driver is easily extendable to support other MHI PCI devices like
>> different modem hw or OEM superset.
>>
>> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
>> ---
> [..]
>> diff --git a/drivers/bus/mhi/controllers/mhi_pci_common.c b/drivers/bus/mhi/controllers/mhi_pci_common.c
>> new file mode 100644
>> index 0000000..705b283
>> --- /dev/null
>> +++ b/drivers/bus/mhi/controllers/mhi_pci_common.c
> 
> ath11k is also "PCI" and "MHI" but this isn't "common" code for it, so
> perhaps "mhi_pci_generic.c" or "mhi_pci_modem.c"?

It occurs to me from seeing Bjorn's comment, GregKH had a pretty hard 
objection to creating a directory for the mhi_uci driver (more or less 
its pointless to have a directory for a single file, wait until there 
are a mess of files that need to be managed), and this patch is doing 
the same thing.  I would suggest dropping the "controllers" directory, 
and just putting this in the root mhi directory.

-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
