Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2339332665C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Feb 2021 18:33:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230135AbhBZRcg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Feb 2021 12:32:36 -0500
Received: from z11.mailgun.us ([104.130.96.11]:44564 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229586AbhBZRce (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Feb 2021 12:32:34 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614360732; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=M7HvRPiSZ2xSbCT1WOfPlcHl519+4Bp5gCcSHWi5Dtk=;
 b=CWYa2fTdKzsgUZNiAQsg0zhqbT8Z4ANtEZc5iUu8JVuv6RuQnKFppNVQFvkzqCUnWOT8m+Du
 /HUB4Eet2zk3R1qP9KyBhSOp+uJY3dos+utI8XOi/c7EDuaVlRuOewszj1RlJ5f0B/LA5qeC
 tNgeUxAjX7QK8HBSEepe5Z8mJHo=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 6039306d9e950d0db1367b46 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 26 Feb 2021 17:31:25
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7BE07C433CA; Fri, 26 Feb 2021 17:31:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 09078C433C6;
        Fri, 26 Feb 2021 17:31:23 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 26 Feb 2021 09:31:23 -0800
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jhugo@codeaurora.org, hemantk@codeaurora.org,
        sricharan@codeaurora.org
Subject: Re: [PATCH v2] bus: mhi: core: Add unique qrtr node id support
Organization: Qualcomm Innovation Center, Inc.
Reply-To: bbhatt@codeaurora.org
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <20210226145245.GB70936@thinkpad>
References: <1614336169-31467-1-git-send-email-gokulsri@codeaurora.org>
 <1614336169-31467-2-git-send-email-gokulsri@codeaurora.org>
 <20210226145245.GB70936@thinkpad>
Message-ID: <ee9edb7c59a20e5ea2af59de21e815ee@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-02-26 06:52 AM, Manivannan Sadhasivam wrote:
> On Fri, Feb 26, 2021 at 04:12:49PM +0530, Gokul Sriram Palanisamy 
> wrote:
>> On platforms with two or more identical mhi
>> devices, qmi service will run with identical
>> qrtr-node-id. Because of this identical ID,
>> host qrtr-lookup cannot register more than one
>> qmi service with identical node ID. Ultimately,
>> only one qmi service will be avilable for the
>> underlying drivers to communicate with.
>> 
>> On QCN9000, it implements a unique qrtr-node-id
>> and qmi instance ID using a unique instance ID
>> written to a debug register from host driver
>> soon after SBL is loaded.
>> 
>> This change generates a unique instance ID from
>> PCIe domain number and bus number, writes to the
>> given debug register just after SBL is loaded so
>> that it is available for FW when the QMI service
>> is spawned.
>> 
>> sample:
>> root@OpenWrt:/# qrtr-lookup
>>   Service Version Instance Node  Port
>>        15       1        0    8     1 Test service
>>        69       1        8    8     2 ATH10k WLAN firmware service
>>        15       1        0   24     1 Test service
>>        69       1       24   24     2 ATH10k WLAN firmware service
>> 
>> Here 8 and 24 on column 3 (QMI Instance ID)
>> and 4 (QRTR Node ID) are the node IDs that
>> is unique per mhi device.
>> 
>> Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
>> ---
>>  drivers/bus/mhi/core/boot.c | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>> 
>> diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
>> index c2546bf..5e5dad5 100644
>> --- a/drivers/bus/mhi/core/boot.c
>> +++ b/drivers/bus/mhi/core/boot.c
>> @@ -16,8 +16,12 @@
>>  #include <linux/random.h>
>>  #include <linux/slab.h>
>>  #include <linux/wait.h>
>> +#include <linux/pci.h>
>>  #include "internal.h"
>> 
>> +#define QRTR_INSTANCE_MASK	0x000000FF
>> +#define QRTR_INSTANCE_SHIFT	0
>> +
>>  /* Setup RDDM vector table for RDDM transfer and program RXVEC */
>>  void mhi_rddm_prepare(struct mhi_controller *mhi_cntrl,
>>  		      struct image_info *img_info)
>> @@ -391,6 +395,9 @@ void mhi_fw_load_handler(struct mhi_controller 
>> *mhi_cntrl)
>>  	const struct firmware *firmware = NULL;
>>  	struct image_info *image_info;
>>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
>> +	struct pci_dev *pci_dev = to_pci_dev(mhi_cntrl->cntrl_dev);
>> +	struct pci_bus *bus = pci_dev->bus;
>> +	uint32_t instance;
>>  	const char *fw_name;
>>  	void *buf;
>>  	dma_addr_t dma_addr;
>> @@ -466,6 +473,13 @@ void mhi_fw_load_handler(struct mhi_controller 
>> *mhi_cntrl)
>>  		return;
>>  	}
>> 
>> +	instance = ((pci_domain_nr(bus) & 0xF) << 4) | (bus->number & 0xF);
>> +	instance &= QRTR_INSTANCE_MASK;
>> +
>> +	mhi_write_reg_field(mhi_cntrl, mhi_cntrl->bhi,
>> +			    BHI_ERRDBG2, QRTR_INSTANCE_MASK,
>> +			    QRTR_INSTANCE_SHIFT, instance);
> 
> You cannot not do this in MHI stack. Why can't you do this in the MHI 
> controller
> specific to QCN9000? And btw, is QCN9000 supported in mainline?
> 
> Thanks,
> Mani
> 
>> +
>>  	write_lock_irq(&mhi_cntrl->pm_lock);
>>  	mhi_cntrl->dev_state = MHI_STATE_RESET;
>>  	write_unlock_irq(&mhi_cntrl->pm_lock);
>> --
>> 2.7.4
>> 

As others have stated, please refrain from adding protocol specific code 
(such as PCIe)
in the MHI core driver. Please have this change in your controller.

If there is access to BHI registers required prior to power up from MHI 
core, it is not
exposed right now. We can talk about how you can  achieve that, so you 
can do this write
in your controller after mhi_prepare_for_power_up().

Thanks,
Bhaumik
---
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
