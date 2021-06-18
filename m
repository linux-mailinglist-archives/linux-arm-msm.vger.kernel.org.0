Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F4783AD0F0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jun 2021 19:06:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232406AbhFRRI7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Jun 2021 13:08:59 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:49042 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231478AbhFRRI6 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Jun 2021 13:08:58 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1624036008; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=AheiMetiBmenXcPfXq7qxPpbL4c0SjGL6/bf+pWs2mc=;
 b=mng/HL6H2lC/K+IrnU9JN1qXj42zKWYH83ni21HCvKI9v5PLlD+imRQxJWSnoGGQJ38ej8F6
 isobaim14xMr3bCJj+sknVutZJBcD8I6W+suI7LtNQeY14eLDNLqnH/zc2eyQT5GYMMHTvmy
 /UF0jmBj+K/ExAfaCdO4xyKqVIc=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 60ccd296b7e6c05f95499df4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 18 Jun 2021 17:06:30
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 27CFEC43217; Fri, 18 Jun 2021 17:06:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0CF1FC433D3;
        Fri, 18 Jun 2021 17:06:28 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 18 Jun 2021 10:06:28 -0700
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        carl.yin@quectel.com, naveen.kumar@quectel.com,
        loic.poulain@linaro.org
Subject: Re: [PATCH] bus: mhi: pci_generic: Apply no-op for wake using inband
 wake support flag
Organization: Qualcomm Innovation Center, Inc.
Reply-To: bbhatt@codeaurora.org
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <20210618065249.GN3682@workstation>
References: <1623954233-32092-1-git-send-email-bbhatt@codeaurora.org>
 <20210618065249.GN3682@workstation>
Message-ID: <83d12d5cc46ef7fda12caf7e3bdfddd1@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mani,
On 2021-06-17 11:52 PM, Manivannan Sadhasivam wrote:
> On Thu, Jun 17, 2021 at 11:23:53AM -0700, Bhaumik Bhatt wrote:
>> Devices such as SDX24 do not have the provision for inband wake
>> doorbell in the form of channel 127. Newer devices such as SDX55
>> or SDX65 have it by default. Ensure the functionality is used
>> based on this such that device wake stays held when a client
>> driver uses mhi_device_get() API or the equivalent debugfs entry.
>> 
>> Fixes: e3e5e6508fc1 ("bus: mhi: pci_generic: No-Op for device_wake 
>> operations")
>> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
>> ---
>>  drivers/bus/mhi/pci_generic.c | 26 ++++++++++++++++++--------
>>  1 file changed, 18 insertions(+), 8 deletions(-)
>> 
>> diff --git a/drivers/bus/mhi/pci_generic.c 
>> b/drivers/bus/mhi/pci_generic.c
>> index d84b743..31360a2 100644
>> --- a/drivers/bus/mhi/pci_generic.c
>> +++ b/drivers/bus/mhi/pci_generic.c
>> @@ -32,6 +32,7 @@
>>   * @edl: emergency download mode firmware path (if any)
>>   * @bar_num: PCI base address register to use for MHI MMIO register 
>> space
>>   * @dma_data_width: DMA transfer word size (32 or 64 bits)
>> + * @no_inband_wake: Devices without inband wake support (such as 
>> sdx24)
> 
> I'd rather like this field to be "inband_wake" and set to false/true
> based on the capability of the devices. Rest looks good.
> 
> Thanks,
> Mani
> 
I should have known this was coming :)

Can I use sideband_wake instead of no_inband_wake and leave the booleans 
as is?
By default, inband_wake will have to be true for any and all devices 
moving
forward.

Please let me know your preference.
>>   */
>>  struct mhi_pci_dev_info {
>>  	const struct mhi_controller_config *config;
>> @@ -40,6 +41,7 @@ struct mhi_pci_dev_info {
>>  	const char *edl;
>>  	unsigned int bar_num;
>>  	unsigned int dma_data_width;
>> +	bool no_inband_wake;
>>  };
>> 
>>  #define MHI_CHANNEL_CONFIG_UL(ch_num, ch_name, el_count, ev_ring) \
>> @@ -242,7 +244,8 @@ static const struct mhi_pci_dev_info 
>> mhi_qcom_sdx65_info = {
>>  	.edl = "qcom/sdx65m/edl.mbn",
>>  	.config = &modem_qcom_v1_mhiv_config,
>>  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
>> -	.dma_data_width = 32
>> +	.dma_data_width = 32,
>> +	.no_inband_wake = false
>>  };
>> 
>>  static const struct mhi_pci_dev_info mhi_qcom_sdx55_info = {
>> @@ -251,7 +254,8 @@ static const struct mhi_pci_dev_info 
>> mhi_qcom_sdx55_info = {
>>  	.edl = "qcom/sdx55m/edl.mbn",
>>  	.config = &modem_qcom_v1_mhiv_config,
>>  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
>> -	.dma_data_width = 32
>> +	.dma_data_width = 32,
>> +	.no_inband_wake = false
>>  };
>> 
>>  static const struct mhi_pci_dev_info mhi_qcom_sdx24_info = {
>> @@ -259,7 +263,8 @@ static const struct mhi_pci_dev_info 
>> mhi_qcom_sdx24_info = {
>>  	.edl = "qcom/prog_firehose_sdx24.mbn",
>>  	.config = &modem_qcom_v1_mhiv_config,
>>  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
>> -	.dma_data_width = 32
>> +	.dma_data_width = 32,
>> +	.no_inband_wake = true
>>  };
>> 
>>  static const struct mhi_channel_config mhi_quectel_em1xx_channels[] = 
>> {
>> @@ -301,7 +306,8 @@ static const struct mhi_pci_dev_info 
>> mhi_quectel_em1xx_info = {
>>  	.edl = "qcom/prog_firehose_sdx24.mbn",
>>  	.config = &modem_quectel_em1xx_config,
>>  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
>> -	.dma_data_width = 32
>> +	.dma_data_width = 32,
>> +	.no_inband_wake = true
>>  };
>> 
>>  static const struct mhi_channel_config mhi_foxconn_sdx55_channels[] = 
>> {
>> @@ -339,7 +345,8 @@ static const struct mhi_pci_dev_info 
>> mhi_foxconn_sdx55_info = {
>>  	.edl = "qcom/sdx55m/edl.mbn",
>>  	.config = &modem_foxconn_sdx55_config,
>>  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
>> -	.dma_data_width = 32
>> +	.dma_data_width = 32,
>> +	.no_inband_wake = false
>>  };
>> 
>>  static const struct pci_device_id mhi_pci_id_table[] = {
>> @@ -640,9 +647,12 @@ static int mhi_pci_probe(struct pci_dev *pdev, 
>> const struct pci_device_id *id)
>>  	mhi_cntrl->status_cb = mhi_pci_status_cb;
>>  	mhi_cntrl->runtime_get = mhi_pci_runtime_get;
>>  	mhi_cntrl->runtime_put = mhi_pci_runtime_put;
>> -	mhi_cntrl->wake_get = mhi_pci_wake_get_nop;
>> -	mhi_cntrl->wake_put = mhi_pci_wake_put_nop;
>> -	mhi_cntrl->wake_toggle = mhi_pci_wake_toggle_nop;
>> +
>> +	if (info->no_inband_wake) {
>> +		mhi_cntrl->wake_get = mhi_pci_wake_get_nop;
>> +		mhi_cntrl->wake_put = mhi_pci_wake_put_nop;
>> +		mhi_cntrl->wake_toggle = mhi_pci_wake_toggle_nop;
>> +	}
>> 
>>  	err = mhi_pci_claim(mhi_cntrl, info->bar_num, 
>> DMA_BIT_MASK(info->dma_data_width));
>>  	if (err)
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum,
>> a Linux Foundation Collaborative Project
>> 

Thanks,
Bhaumik
---
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
