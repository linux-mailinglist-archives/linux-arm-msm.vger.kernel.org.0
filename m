Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F07331790FE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2020 14:12:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388021AbgCDNMV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Mar 2020 08:12:21 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:45800 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387992AbgCDNMV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Mar 2020 08:12:21 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583327541; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=ZwXdsbHaxrkcUsXQf1QG7Fhh4a45XXcmUJXcVDM57ho=; b=t4tPB8OliRbuzAVZwrWfIO6fcTCEqUVk8oBaMpVCJV92cSJPMpYjWx3DCEWychW8ZXCQy07J
 NNgj4v4AGCiIVNDQRm9g+2CX/0LsnFDxzbcIq3ZhUliTAHa2zdy434Uk4yXJxraFZ8BZBqeC
 mVdq5PsFPUZBLIzpcLzw/QPp/UQ=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e5fa92c.7f4ace769880-smtp-out-n01;
 Wed, 04 Mar 2020 13:12:12 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AC190C4479C; Wed,  4 Mar 2020 13:12:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.206.25.140] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vbadigan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D9CFBC43383;
        Wed,  4 Mar 2020 13:12:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D9CFBC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=vbadigan@codeaurora.org
Subject: Re: [PATCH] mmc: cqhci: Update cqhci memory ioresource name
To:     Adrian Hunter <adrian.hunter@intel.com>, ulf.hansson@linaro.org
Cc:     linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dianders@google.com,
        mka@chromium.org, Ritesh Harjani <riteshh@codeaurora.org>,
        Asutosh Das <asutoshd@codeaurora.org>
References: <1583323250-23596-1-git-send-email-vbadigan@codeaurora.org>
 <e1bd6b82-01d1-ce71-d170-a891a18b8141@intel.com>
From:   Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Message-ID: <5d19b5a1-3a1a-9366-fde2-ea0c0ee85dd6@codeaurora.org>
Date:   Wed, 4 Mar 2020 18:42:06 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <e1bd6b82-01d1-ce71-d170-a891a18b8141@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 3/4/2020 5:53 PM, Adrian Hunter wrote:
> On 4/03/20 2:00 pm, Veerabhadrarao Badiganti wrote:
>> Update cqhci memory ioresource name from cqhci_mem to cqhci since
>> suffix _mem is redundant.
> Which is OK only because sdhci-msm is the only caller of cqhci_pltfm_init(),
> right?  So no one else could be using "cqhci_mem"? Some more explanation is
> needed here.

Right, only qcom cqhci solution is making use of it.

I did a grep in dt and find no other vendor is using it.

Sure. Will update commit text.

>> Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
>> ---
>> Corresponding binding change:
>> https://lore.kernel.org/linux-arm-msm/1582545470-11530-1-git-send-email-vbadigan@codeaurora.org/
>> ---
>>   drivers/mmc/host/cqhci.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/mmc/host/cqhci.c b/drivers/mmc/host/cqhci.c
>> index e2ea2c4..e24b8ff 100644
>> --- a/drivers/mmc/host/cqhci.c
>> +++ b/drivers/mmc/host/cqhci.c
>> @@ -1077,7 +1077,7 @@ struct cqhci_host *cqhci_pltfm_init(struct platform_device *pdev)
>>   
>>   	/* check and setup CMDQ interface */
>>   	cqhci_memres = platform_get_resource_byname(pdev, IORESOURCE_MEM,
>> -						   "cqhci_mem");
>> +						   "cqhci");
>>   	if (!cqhci_memres) {
>>   		dev_dbg(&pdev->dev, "CMDQ not supported\n");
>>   		return ERR_PTR(-EINVAL);
>>
