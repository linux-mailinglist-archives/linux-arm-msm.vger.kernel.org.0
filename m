Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EB3C2F960D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jan 2021 00:04:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730262AbhAQXEV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 Jan 2021 18:04:21 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:50310 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728237AbhAQXET (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 Jan 2021 18:04:19 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1610924638; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: References: Cc: To:
 Subject: From: Sender; bh=2RtPblk3uLge3eG94olthgEo0MZHJLfj9TAIfc/5g38=;
 b=S4cgG9TFPqjR3LEJRT5sQCPSAvI1poO5HbQSLDzvo1MKMIIju+PxlhLJbzBEa9K6IeO46cw8
 sIDoVtxQl8lpwSwbMl4SUuC61fB9U8AdvbWXTRDmc79z+u+M9GoiRQS9wt64P09RfKCDDiAd
 F+/u/7pbt5aKczUW1JrSIXAsXWU=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-east-1.postgun.com with SMTP id
 6004c23e8a0374a501c39090 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sun, 17 Jan 2021 23:03:26
 GMT
Sender: sidgup=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 61A50C43463; Sun, 17 Jan 2021 23:03:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.1.10] (cpe-75-83-25-192.socal.res.rr.com [75.83.25.192])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sidgup)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 88856C433ED;
        Sun, 17 Jan 2021 23:03:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 88856C433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sidgup@codeaurora.org
From:   Siddharth Gupta <sidgup@codeaurora.org>
Subject: Re: [PATCH 3/3] soc: qcom: mdt_loader: Read hash from firmware blob
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, ohad@wizery.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        psodagud@codeaurora.org, rishabhb@codeaurora.org
References: <1609968211-7579-1-git-send-email-sidgup@codeaurora.org>
 <1609968211-7579-4-git-send-email-sidgup@codeaurora.org>
 <X/elgO+66ibjeL+3@builder.lan>
 <ec2a7223-d785-a9f3-d864-3c03e4965be5@codeaurora.org>
 <YACDYu/qaYPyfKqS@builder.lan>
Message-ID: <5efad446-cf46-02b3-461d-a67e12a4b1c0@codeaurora.org>
Date:   Sun, 17 Jan 2021 15:03:22 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <YACDYu/qaYPyfKqS@builder.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 1/14/2021 9:46 AM, Bjorn Andersson wrote:
> On Wed 13 Jan 17:01 CST 2021, Siddharth Gupta wrote:
>
>> On 1/7/2021 4:21 PM, Bjorn Andersson wrote:
>>> On Wed 06 Jan 15:23 CST 2021, Siddharth Gupta wrote:
>>>
>>>> Since the split elf blobs will always contain the hash segment, we rely on
>>> I think it will sounds better if we add "should" in "we should rely on..."
>> Sure
>>>> the blob file to get the hash rather than assume that it will be present in
>>>> the mdt file. This change uses the hash index to read the appropriate elf
>>>> blob to get the hash segment.
>>>>
>>>> Signed-off-by: Siddharth Gupta<sidgup@codeaurora.org>
>>>> ---
>>>>    drivers/remoteproc/qcom_q6v5_mss.c  |  4 ++--
>>>>    drivers/soc/qcom/mdt_loader.c       | 38 +++++++++++++++++++++++++++----------
>>>>    include/linux/soc/qcom/mdt_loader.h |  3 ++-
>>>>    3 files changed, 32 insertions(+), 13 deletions(-)
>>>>
>>>> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
>>>> index 66106ba..74c0229 100644
>>>> --- a/drivers/remoteproc/qcom_q6v5_mss.c
>>>> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
>>>> @@ -4,7 +4,7 @@
>>>>     *
>>>>     * Copyright (C) 2016 Linaro Ltd.
>>>>     * Copyright (C) 2014 Sony Mobile Communications AB
>>>> - * Copyright (c) 2012-2013, The Linux Foundation. All rights reserved.
>>>> + * Copyright (c) 2012-2013, 2020 The Linux Foundation. All rights reserved.
>>>>     */
>>>>    #include <linux/clk.h>
>>>> @@ -828,7 +828,7 @@ static int q6v5_mpss_init_image(struct q6v5 *qproc, const struct firmware *fw)
>>>>    	void *ptr;
>>>>    	int ret;
>>>> -	metadata = qcom_mdt_read_metadata(fw, &size);
>>>> +	metadata = qcom_mdt_read_metadata(qproc->dev, fw, qproc->hexagon_mdt_image, &size);
>>>>    	if (IS_ERR(metadata))
>>>>    		return PTR_ERR(metadata);
>>>> diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
>>>> index c9bbd8c..6876c0b 100644
>>>> --- a/drivers/soc/qcom/mdt_loader.c
>>>> +++ b/drivers/soc/qcom/mdt_loader.c
>>>> @@ -103,15 +103,18 @@ EXPORT_SYMBOL_GPL(qcom_mdt_get_size);
>>>>     *
>>>>     * Return: pointer to data, or ERR_PTR()
>>>>     */
>>>> -void *qcom_mdt_read_metadata(const struct firmware *fw, size_t *data_len)
>>>> +void *qcom_mdt_read_metadata(struct device *dev, const struct firmware *fw, const char *firmware,
>>>> +			     size_t *data_len)
>>>>    {
>>>>    	const struct elf32_phdr *phdrs;
>>>>    	const struct elf32_hdr *ehdr;
>>>> -	size_t hash_offset;
>>>> +	const struct firmware *seg_fw;
>>>>    	size_t hash_index;
>>>>    	size_t hash_size;
>>>>    	size_t ehdr_size;
>>>> +	char *fw_name;
>>>>    	void *data;
>>>> +	int ret;
>>>>    	ehdr = (struct elf32_hdr *)fw->data;
>>>>    	phdrs = (struct elf32_phdr *)(ehdr + 1);
>>>> @@ -137,14 +140,29 @@ void *qcom_mdt_read_metadata(const struct firmware *fw, size_t *data_len)
>>>>    	if (!data)
>>>>    		return ERR_PTR(-ENOMEM);
>>>> -	/* Is the header and hash already packed */
>>>> -	if (qcom_mdt_bins_are_split(fw))
>>>> -		hash_offset = phdrs[0].p_filesz;
>>>> -	else
>>>> -		hash_offset = phdrs[hash_index].p_offset;
>>>> -
>>>> +	/* copy elf header */
>>>>    	memcpy(data, fw->data, ehdr_size);
>>>> -	memcpy(data + ehdr_size, fw->data + hash_offset, hash_size);
>>>> +
>>> This seems to duplicates parts of the loop in __qcom_mdt_load(), how
>>> about breaking this out to a separate
>>>
>>> static int mdt_load_segment(struct device *dev, const struct firmware *fw,
>>> 			    int idx, void *buf, size_t len, bool is_split)
>>>
>>> Which either just memcpy from @fw or does the filename and loading
>>> dance, based on @is_split?
>> Since mdt_load_segment won't know the name of the firmware without a global
>> variable
>> (which in turn will make it non-reentrant), the idea of creating such a
>> function and not passing
>> the actual name of the firmware seemed wrong.
>>
> Wouldn't you be able to pass "firmware" as an argument to the
> load_segment function?
We can, which is what I guess you meant in the first place. What I thought
was that if we are creating something like mdt_load_segments passing
"firmware.mdt" with the index instead of "firmware.b<index>" seemed
kind of wrong, but I guess that is just a matter of the naming convention.
>> If we want to pass the firmware name in this function the code size will be
>> more or equal to
>> what we started with. If that is not a problem I can make the changes.
>>
> Perhaps I'm missing something here, I do expect that you would end with
> code similar to the hunk you add here. But in doing so we should be able
> to reuse that in the __qcom_mdt_load(). Or am I too optimistic?
>
> (In particular I'm not fond of the fw_name dance and doing it twice is
> worse)
If I am creating the firmware name inside this function then we should 
definitely
see a code reduction. I'll make the changes and push the new patchset soon.

Thanks,
Sid
>
> Regards,
> Bjorn
>
>> Thanks,
>> Sid
>>> Regards,
>>> Bjorn
>>>
>>>> +	if (qcom_mdt_bins_are_split(fw)) {
>>>> +		fw_name = kstrdup(firmware, GFP_KERNEL);
>>>> +		if (!fw_name) {
>>>> +			kfree(data);
>>>> +			return ERR_PTR(-ENOMEM);
>>>> +		}
>>>> +		snprintf(fw_name + strlen(fw_name) - 3, 4, "b%02d", hash_index);
>>>> +
>>>> +		ret = request_firmware_into_buf(&seg_fw, fw_name, dev, data + ehdr_size, hash_size);
>>>> +		kfree(fw_name);
>>>> +
>>>> +		if (ret) {
>>>> +			kfree(data);
>>>> +			return ERR_PTR(ret);
>>>> +		}
>>>> +
>>>> +		release_firmware(seg_fw);
>>>> +	} else {
>>>> +		memcpy(data + ehdr_size, fw->data + phdrs[hash_index].p_offset, hash_size);
>>>> +	}
>>>>    	*data_len = ehdr_size + hash_size;
>>>> @@ -191,7 +209,7 @@ static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
>>>>    		return -ENOMEM;
>>>>    	if (pas_init) {
>>>> -		metadata = qcom_mdt_read_metadata(fw, &metadata_len);
>>>> +		metadata = qcom_mdt_read_metadata(dev, fw, firmware, &metadata_len);
>>>>    		if (IS_ERR(metadata)) {
>>>>    			ret = PTR_ERR(metadata);
>>>>    			goto out;
>>>> diff --git a/include/linux/soc/qcom/mdt_loader.h b/include/linux/soc/qcom/mdt_loader.h
>>>> index e600bae..04ba5e8 100644
>>>> --- a/include/linux/soc/qcom/mdt_loader.h
>>>> +++ b/include/linux/soc/qcom/mdt_loader.h
>>>> @@ -21,6 +21,7 @@ int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
>>>>    			  const char *fw_name, int pas_id, void *mem_region,
>>>>    			  phys_addr_t mem_phys, size_t mem_size,
>>>>    			  phys_addr_t *reloc_base);
>>>> -void *qcom_mdt_read_metadata(const struct firmware *fw, size_t *data_len);
>>>> +void *qcom_mdt_read_metadata(struct device *dev, const struct firmware *fw, const char *firmware,
>>>> +			     size_t *data_len);
>>>>    #endif
>>>> -- 
>>>> Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>>>> a Linux Foundation Collaborative Project
>>>>
