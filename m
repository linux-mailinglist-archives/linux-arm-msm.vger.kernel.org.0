Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 666DC1A2197
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2020 14:20:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727469AbgDHMUT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Apr 2020 08:20:19 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:58590 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726769AbgDHMUT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Apr 2020 08:20:19 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586348419; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=uxrIDtB/jOhAPmjTIB8iD89D5eovr0qySBws36IDfuc=;
 b=FqJ9QSgPxd6ABq7cWHKNi+dsZ/xZVDbAUbWKVJEdpppJKTy9TR4v9lQAHm2llXZbTofWkHuT
 4c87kflP7wrEecxli9r/SBhM7AI15SWYwI7PJNMju64IbjMwlupTLe8MELB5Eih891/t95HG
 aNjiWIjKHq/M+ZfLZowvYepyZfI=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8dc180.7f33284917d8-smtp-out-n01;
 Wed, 08 Apr 2020 12:20:16 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 03244C433BA; Wed,  8 Apr 2020 12:20:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0F445C433F2;
        Wed,  8 Apr 2020 12:20:14 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 08 Apr 2020 17:50:14 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, ohad@wizery.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        evgreen@chromium.org, linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH] remoteproc: qcom_q6v5_mss: map/unmap mpss region
 before/after use
In-Reply-To: <20200408021026.GP20625@builder.lan>
References: <20200317191918.4123-1-sibis@codeaurora.org>
 <20200408021026.GP20625@builder.lan>
Message-ID: <940b74388c744ef5bbfcf15709c4ae05@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Bjorn,
Thanks for review!

On 2020-04-08 07:40, Bjorn Andersson wrote:
> On Tue 17 Mar 12:19 PDT 2020, Sibi Sankar wrote:
> 
>> The application processor accessing the mpss region when the Q6 modem
>> is running will lead to an XPU violation. Fix this by un-mapping the
>> mpss region post copy during processor out of reset sequence and
>> coredumps.
>> 
> 
> Does this problem not apply to the "mba" region?

For mba region, memcpy is expected
to be completed before bringing
the Q6 out of reset. Downstream they
seem to use a wmb() to accomplish
this. Since we havn't observed any
issues until now, we can defer adding
any fixes related to mba region.

> 
>> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
>> ---
>>  drivers/remoteproc/qcom_q6v5_mss.c | 53 
>> ++++++++++++++++--------------
>>  1 file changed, 29 insertions(+), 24 deletions(-)
>> 
>> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c 
>> b/drivers/remoteproc/qcom_q6v5_mss.c
>> index ce49c3236ff7c..b1ad4de179019 100644
>> --- a/drivers/remoteproc/qcom_q6v5_mss.c
>> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
>> @@ -196,7 +196,6 @@ struct q6v5 {
>> 
>>  	phys_addr_t mpss_phys;
>>  	phys_addr_t mpss_reloc;
>> -	void *mpss_region;
>>  	size_t mpss_size;
>> 
>>  	struct qcom_rproc_glink glink_subdev;
>> @@ -1061,6 +1060,18 @@ static int q6v5_reload_mba(struct rproc *rproc)
>>  	return ret;
>>  }
>> 
>> +static void *q6v5_da_to_va(struct rproc *rproc, u64 da, size_t len)
>> +{
>> +	struct q6v5 *qproc = rproc->priv;
>> +	int offset;
>> +
>> +	offset = da - qproc->mpss_reloc;
>> +	if (offset < 0 || offset + len > qproc->mpss_size)
>> +		return NULL;
>> +
>> +	return devm_ioremap_wc(qproc->dev, qproc->mpss_phys + offset, len);
> 
> This function isn't expected to have side effects.

unfortunately doing ioremap/iounmap
for the entire region isn't sufficient,
while testing I found per region remap
/unmap was required i.e after we moved to
away from the validating the entire blog
in a single pass.

Now with the mpss_region out of the picture
da_to_va really made no sense without having
ioremap function in it. Let me know what you
think.

> 
> So I think you should add the ioremap/iounmap to the beginning/end of
> mpss_load and the dump_segment directly instead.
> 
>> +}
>> +
>>  static int q6v5_mpss_load(struct q6v5 *qproc)
>>  {
>>  	const struct elf32_phdr *phdrs;
>> @@ -1156,7 +1167,11 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
>>  			goto release_firmware;
>>  		}
>> 
>> -		ptr = qproc->mpss_region + offset;
>> +		ptr = q6v5_da_to_va(qproc->rproc, phdr->p_paddr, phdr->p_memsz);
> 
> rproc_da_to_va() here.

sure

> 
>> +		if (!ptr) {
>> +			dev_err(qproc->dev, "failed to map memory\n");
> 
> Now this will be able to fail, so you should add this error handling
> snippet, just with a slightly different message.

sure

> 
>> +			goto release_firmware;
>> +		}
>> 
>>  		if (phdr->p_filesz && phdr->p_offset < fw->size) {
>>  			/* Firmware is large enough to be non-split */
>> @@ -1165,6 +1180,7 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
>>  					"failed to load segment %d from truncated file %s\n",
>>  					i, fw_name);
>>  				ret = -EINVAL;
>> +				devm_iounmap(qproc->dev, ptr);
>>  				goto release_firmware;
>>  			}
>> 
>> @@ -1175,6 +1191,7 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
>>  			ret = request_firmware(&seg_fw, fw_name, qproc->dev);
>>  			if (ret) {
>>  				dev_err(qproc->dev, "failed to load %s\n", fw_name);
>> +				devm_iounmap(qproc->dev, ptr);
>>  				goto release_firmware;
>>  			}
>> 
>> @@ -1187,6 +1204,7 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
>>  			memset(ptr + phdr->p_filesz, 0,
>>  			       phdr->p_memsz - phdr->p_filesz);
>>  		}
>> +		devm_iounmap(qproc->dev, ptr);
> 
> Move this to the end an unmap the entire thing.
> 
> And generally, please avoid devm for things where you manually unmap.

will take care of ^^ in the next re-spin.

> 
> Regards,
> Bjorn
> 
>>  		size += phdr->p_memsz;
>> 
>>  		code_length = readl(qproc->rmb_base + RMB_PMI_CODE_LENGTH_REG);
>> @@ -1236,7 +1254,7 @@ static void qcom_q6v5_dump_segment(struct rproc 
>> *rproc,
>>  	int ret = 0;
>>  	struct q6v5 *qproc = rproc->priv;
>>  	unsigned long mask = BIT((unsigned long)segment->priv);
>> -	void *ptr = rproc_da_to_va(rproc, segment->da, segment->size);
>> +	void *ptr = NULL;
>> 
>>  	/* Unlock mba before copying segments */
>>  	if (!qproc->dump_mba_loaded) {
>> @@ -1250,10 +1268,15 @@ static void qcom_q6v5_dump_segment(struct 
>> rproc *rproc,
>>  		}
>>  	}
>> 
>> -	if (!ptr || ret)
>> -		memset(dest, 0xff, segment->size);
>> -	else
>> +	if (!ret)
>> +		ptr = rproc_da_to_va(rproc, segment->da, segment->size);
>> +
>> +	if (ptr) {
>>  		memcpy(dest, ptr, segment->size);
>> +		devm_iounmap(qproc->dev, ptr);
>> +	} else {
>> +		memset(dest, 0xff, segment->size);
>> +	}
>> 
>>  	qproc->dump_segment_mask |= mask;
>> 
>> @@ -1327,18 +1350,6 @@ static int q6v5_stop(struct rproc *rproc)
>>  	return 0;
>>  }
>> 
>> -static void *q6v5_da_to_va(struct rproc *rproc, u64 da, size_t len)
>> -{
>> -	struct q6v5 *qproc = rproc->priv;
>> -	int offset;
>> -
>> -	offset = da - qproc->mpss_reloc;
>> -	if (offset < 0 || offset + len > qproc->mpss_size)
>> -		return NULL;
>> -
>> -	return qproc->mpss_region + offset;
>> -}
>> -
>>  static int qcom_q6v5_register_dump_segments(struct rproc *rproc,
>>  					    const struct firmware *mba_fw)
>>  {
>> @@ -1595,12 +1606,6 @@ static int q6v5_alloc_memory_region(struct q6v5 
>> *qproc)
>> 
>>  	qproc->mpss_phys = qproc->mpss_reloc = r.start;
>>  	qproc->mpss_size = resource_size(&r);
>> -	qproc->mpss_region = devm_ioremap_wc(qproc->dev, qproc->mpss_phys, 
>> qproc->mpss_size);
>> -	if (!qproc->mpss_region) {
>> -		dev_err(qproc->dev, "unable to map memory region: %pa+%zx\n",
>> -			&r.start, qproc->mpss_size);
>> -		return -EBUSY;
>> -	}
>> 
>>  	return 0;
>>  }
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum,
>> a Linux Foundation Collaborative Project

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
