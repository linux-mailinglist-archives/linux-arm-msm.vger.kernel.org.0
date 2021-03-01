Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95862328B3B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 19:34:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235936AbhCASb1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 13:31:27 -0500
Received: from z11.mailgun.us ([104.130.96.11]:34354 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237469AbhCAS1i (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 13:27:38 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614623232; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=CVrOgUIAawHnEvCewO0kKDdh1FuzFvcgVnx0rAYY4I0=; b=hrk7/4azar1nvHcFuIC0L5VTpuY1tL8e1RV9LdA4G1eOuKM79Zse4d0dpSbwNOxUqXzien5H
 ChT36ZOQ2CBFF6zXBIk/CVLRV775vEX+3lABXYlGTnXMCKS43vWzWWh9KNdvn536nGD8WDgM
 158BxOiQ7CQl/fQ9oRlOgXHP+S8=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 603d31df9d2570c9fed12fd0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 01 Mar 2021 18:26:39
 GMT
Sender: kvalo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 25D57C43462; Mon,  1 Mar 2021 18:26:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi [88.114.240.156])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kvalo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 51884C433C6;
        Mon,  1 Mar 2021 18:26:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 51884C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=kvalo@codeaurora.org
From:   Kalle Valo <kvalo@codeaurora.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     jhugo@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gokul Sriram Palanisamy <gokulsri@codeaurora.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        hemantk@codeaurora.org, sricharan@codeaurora.org,
        ath11k@lists.infradead.org
Subject: Re: [PATCH v2] bus: mhi: core: Add unique qrtr node id support
References: <1614336169-31467-1-git-send-email-gokulsri@codeaurora.org>
        <1614336169-31467-2-git-send-email-gokulsri@codeaurora.org>
        <20210226145245.GB70936@thinkpad> <87k0qrceih.fsf@tynnyri.adurom.net>
        <10e511e8dfa8d393ec4c4765668fe229@codeaurora.org>
Date:   Mon, 01 Mar 2021 20:26:34 +0200
In-Reply-To: <10e511e8dfa8d393ec4c4765668fe229@codeaurora.org> (Bhaumik
        Bhatt's message of "Mon, 01 Mar 2021 10:17:10 -0800")
Message-ID: <87o8g291d1.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Bhaumik Bhatt <bbhatt@codeaurora.org> writes:

> On 2021-03-01 03:14 AM, Kalle Valo wrote:
>> + ath11k list
>>
>> Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:
>>
>>> On Fri, Feb 26, 2021 at 04:12:49PM +0530, Gokul Sriram Palanisamy
>>> wrote:
>>>> On platforms with two or more identical mhi
>>>> devices, qmi service will run with identical
>>>> qrtr-node-id. Because of this identical ID,
>>>> host qrtr-lookup cannot register more than one
>>>> qmi service with identical node ID. Ultimately,
>>>> only one qmi service will be avilable for the
>>>> underlying drivers to communicate with.
>>>>
>>>> On QCN9000, it implements a unique qrtr-node-id
>>>> and qmi instance ID using a unique instance ID
>>>> written to a debug register from host driver
>>>> soon after SBL is loaded.
>>>>
>>>> This change generates a unique instance ID from
>>>> PCIe domain number and bus number, writes to the
>>>> given debug register just after SBL is loaded so
>>>> that it is available for FW when the QMI service
>>>> is spawned.
>>>>
>>>> sample:
>>>> root@OpenWrt:/# qrtr-lookup
>>>>   Service Version Instance Node  Port
>>>>        15       1        0    8     1 Test service
>>>>        69       1        8    8     2 ATH10k WLAN firmware service
>>>>        15       1        0   24     1 Test service
>>>>        69       1       24   24     2 ATH10k WLAN firmware service
>>>>
>>>> Here 8 and 24 on column 3 (QMI Instance ID)
>>>> and 4 (QRTR Node ID) are the node IDs that
>>>> is unique per mhi device.
>>>>
>>>> Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
>>>> ---
>>>>  drivers/bus/mhi/core/boot.c | 14 ++++++++++++++
>>>>  1 file changed, 14 insertions(+)
>>>>
>>>> diff --git a/drivers/bus/mhi/core/boot.c
>>>> b/drivers/bus/mhi/core/boot.c
>>>> index c2546bf..5e5dad5 100644
>>>> --- a/drivers/bus/mhi/core/boot.c
>>>> +++ b/drivers/bus/mhi/core/boot.c
>>>> @@ -16,8 +16,12 @@
>>>>  #include <linux/random.h>
>>>>  #include <linux/slab.h>
>>>>  #include <linux/wait.h>
>>>> +#include <linux/pci.h>
>>>>  #include "internal.h"
>>>>
>>>> +#define QRTR_INSTANCE_MASK	0x000000FF
>>>> +#define QRTR_INSTANCE_SHIFT	0
>>>> +
>>>>  /* Setup RDDM vector table for RDDM transfer and program RXVEC */
>>>>  void mhi_rddm_prepare(struct mhi_controller *mhi_cntrl,
>>>>  		      struct image_info *img_info)
>>>> @@ -391,6 +395,9 @@ void mhi_fw_load_handler(struct mhi_controller
>>>> *mhi_cntrl)
>>>>  	const struct firmware *firmware = NULL;
>>>>  	struct image_info *image_info;
>>>>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
>>>> +	struct pci_dev *pci_dev = to_pci_dev(mhi_cntrl->cntrl_dev);
>>>> +	struct pci_bus *bus = pci_dev->bus;
>>>> +	uint32_t instance;
>>>>  	const char *fw_name;
>>>>  	void *buf;
>>>>  	dma_addr_t dma_addr;
>>>> @@ -466,6 +473,13 @@ void mhi_fw_load_handler(struct
>>>> mhi_controller *mhi_cntrl)
>>>>  		return;
>>>>  	}
>>>>
>>>> +	instance = ((pci_domain_nr(bus) & 0xF) << 4) | (bus->number & 0xF);
>>>> +	instance &= QRTR_INSTANCE_MASK;
>>>> +
>>>> +	mhi_write_reg_field(mhi_cntrl, mhi_cntrl->bhi,
>>>> +			    BHI_ERRDBG2, QRTR_INSTANCE_MASK,
>>>> +			    QRTR_INSTANCE_SHIFT, instance);
>>>
>>> You cannot not do this in MHI stack. Why can't you do this in the
>>> MHI controller
>>> specific to QCN9000? And btw, is QCN9000 supported in mainline?
>>
>> I'm not sure what QCN9000 means but I'm guessing it's QCN9074. We have
>> initial QCN9074 support in ath11k but there are some issues still so
>> it's not enabled by default (yet):
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=ath-next&id=4e80946197a83a6115e308334618449b77696d6a
>>
>> And I suspect we have this same qrtr issue with any ath11k PCI device,
>> including QCA6390, so this is not a QCN9074 specific problem.
>>
>> BTW Gokul, please always CC the ath11k list when submitting patches
>> which are related to ath11k.
>
> QRTR sits on top of MHI so shouldn't this be handled outside of MHI
> after MHI is operational? We cannot allow PCI code in MHI core driver
> but this can be handled pre or post MHI power-up in whatever way you
> desire that does not have to directly involve MHI.

Sure, makes sense. I was just replying to Mani's question about status
of QCN9000 upstream support.

So should we handle this within ath11k, is that the right approach? I
also suspect that for QCN9074 and QCA6390 we have to do this a bit
differently, so it would be easier to handle the differences between
devices (and firmware versions) inside ath11k.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
