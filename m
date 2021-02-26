Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 746B832645B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Feb 2021 15:49:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229946AbhBZOsq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Feb 2021 09:48:46 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:59208 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230144AbhBZOsp (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Feb 2021 09:48:45 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614350902; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=NEG83TkMHpRAWl3xgAzXyhzVCeSLiXGOQy7KRgVMUkY=; b=S05dslq9rbMPiYH9rOHrvGB6O9G5gSmvyqm57DTp5croieiZq0+LlSj6xhMOO2kubWO7xan1
 KTomegIXUdmhExXHnmYZ0vbG4W+kTBARykfqEpjb32tnDEWiLkdSVekjoGCp9p1kWTPuEJ3K
 D63LTubr4/5RpEOMxnXYTaFZmOE=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 60390a0bea39d1db6de0157d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 26 Feb 2021 14:47:39
 GMT
Sender: jhugo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 13690C433C6; Fri, 26 Feb 2021 14:47:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.226.59.216] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B0E5FC433C6;
        Fri, 26 Feb 2021 14:47:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B0E5FC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH v2] bus: mhi: core: Add unique qrtr node id support
To:     Gokul Sriram Palanisamy <gokulsri@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org,
        sricharan@codeaurora.org
References: <1614336169-31467-1-git-send-email-gokulsri@codeaurora.org>
 <1614336169-31467-2-git-send-email-gokulsri@codeaurora.org>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <41a9538c-be60-f98d-34ad-b028b2a83496@codeaurora.org>
Date:   Fri, 26 Feb 2021 07:47:37 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1614336169-31467-2-git-send-email-gokulsri@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2/26/2021 3:42 AM, Gokul Sriram Palanisamy wrote:
> On platforms with two or more identical mhi
> devices, qmi service will run with identical
> qrtr-node-id. Because of this identical ID,
> host qrtr-lookup cannot register more than one
> qmi service with identical node ID. Ultimately,
> only one qmi service will be avilable for the
> underlying drivers to communicate with.
> 
> On QCN9000, it implements a unique qrtr-node-id
> and qmi instance ID using a unique instance ID
> written to a debug register from host driver
> soon after SBL is loaded.
> 
> This change generates a unique instance ID from
> PCIe domain number and bus number, writes to the
> given debug register just after SBL is loaded so
> that it is available for FW when the QMI service
> is spawned.
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
> Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
> ---
>   drivers/bus/mhi/core/boot.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
> index c2546bf..5e5dad5 100644
> --- a/drivers/bus/mhi/core/boot.c
> +++ b/drivers/bus/mhi/core/boot.c
> @@ -16,8 +16,12 @@
>   #include <linux/random.h>
>   #include <linux/slab.h>
>   #include <linux/wait.h>
> +#include <linux/pci.h>
>   #include "internal.h"
>   
> +#define QRTR_INSTANCE_MASK	0x000000FF
> +#define QRTR_INSTANCE_SHIFT	0
> +
>   /* Setup RDDM vector table for RDDM transfer and program RXVEC */
>   void mhi_rddm_prepare(struct mhi_controller *mhi_cntrl,
>   		      struct image_info *img_info)
> @@ -391,6 +395,9 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>   	const struct firmware *firmware = NULL;
>   	struct image_info *image_info;
>   	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> +	struct pci_dev *pci_dev = to_pci_dev(mhi_cntrl->cntrl_dev);
> +	struct pci_bus *bus = pci_dev->bus;
> +	uint32_t instance;
>   	const char *fw_name;
>   	void *buf;
>   	dma_addr_t dma_addr;
> @@ -466,6 +473,13 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>   		return;
>   	}
>   
> +	instance = ((pci_domain_nr(bus) & 0xF) << 4) | (bus->number & 0xF);
> +	instance &= QRTR_INSTANCE_MASK;
> +
> +	mhi_write_reg_field(mhi_cntrl, mhi_cntrl->bhi,
> +			    BHI_ERRDBG2, QRTR_INSTANCE_MASK,
> +			    QRTR_INSTANCE_SHIFT, instance);
> +
>   	write_lock_irq(&mhi_cntrl->pm_lock);
>   	mhi_cntrl->dev_state = MHI_STATE_RESET;
>   	write_unlock_irq(&mhi_cntrl->pm_lock);
> 

NACK.  Please see my comments on v1.

-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
