Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47E52327CE7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 12:15:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231684AbhCALPf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 06:15:35 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:55265 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231473AbhCALPa (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 06:15:30 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614597309; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=+MIq16Ym9wWPNOeiUqUDLShHL7b+FQRIUIsXH27WoAs=; b=woos8iIyzlz1kmaItZ+Z9WXULpVUpzhcvJie0/Qhu/WxXhb87mhsTeK0H8XsgLv6Bq0nNTlC
 otHJ9mPCOzVY24WxuAFyb+/sPjxx8bMl7gOz+tY9nSHrKCx1pIRVReCQ1wqeaRWHcUsaGy+I
 5vmAyOwGNVquS2w0LLWtiBCDaNE=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 603ccc8f8f0d5ba6c593a35e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 01 Mar 2021 11:14:23
 GMT
Sender: kvalo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 84147C433CA; Mon,  1 Mar 2021 11:14:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from tynnyri.adurom.net (tynnyri.adurom.net [51.15.11.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kvalo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D52D2C433C6;
        Mon,  1 Mar 2021 11:14:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D52D2C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=kvalo@codeaurora.org
From:   Kalle Valo <kvalo@codeaurora.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Gokul Sriram Palanisamy <gokulsri@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jhugo@codeaurora.org, hemantk@codeaurora.org,
        sricharan@codeaurora.org, ath11k@lists.infradead.org
Subject: Re: [PATCH v2] bus: mhi: core: Add unique qrtr node id support
References: <1614336169-31467-1-git-send-email-gokulsri@codeaurora.org>
        <1614336169-31467-2-git-send-email-gokulsri@codeaurora.org>
        <20210226145245.GB70936@thinkpad>
Date:   Mon, 01 Mar 2021 13:14:14 +0200
In-Reply-To: <20210226145245.GB70936@thinkpad> (Manivannan Sadhasivam's
        message of "Fri, 26 Feb 2021 20:22:45 +0530")
Message-ID: <87k0qrceih.fsf@tynnyri.adurom.net>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

+ ath11k list

Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:

> On Fri, Feb 26, 2021 at 04:12:49PM +0530, Gokul Sriram Palanisamy wrote:
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
>> @@ -391,6 +395,9 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>>  	const struct firmware *firmware = NULL;
>>  	struct image_info *image_info;
>>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
>> +	struct pci_dev *pci_dev = to_pci_dev(mhi_cntrl->cntrl_dev);
>> +	struct pci_bus *bus = pci_dev->bus;
>> +	uint32_t instance;
>>  	const char *fw_name;
>>  	void *buf;
>>  	dma_addr_t dma_addr;
>> @@ -466,6 +473,13 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
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
> You cannot not do this in MHI stack. Why can't you do this in the MHI controller
> specific to QCN9000? And btw, is QCN9000 supported in mainline?

I'm not sure what QCN9000 means but I'm guessing it's QCN9074. We have
initial QCN9074 support in ath11k but there are some issues still so
it's not enabled by default (yet):

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=ath-next&id=4e80946197a83a6115e308334618449b77696d6a

And I suspect we have this same qrtr issue with any ath11k PCI device,
including QCA6390, so this is not a QCN9074 specific problem.

BTW Gokul, please always CC the ath11k list when submitting patches
which are related to ath11k.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
