Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA369228EE7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jul 2020 06:18:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726304AbgGVESG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jul 2020 00:18:06 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:24114 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726178AbgGVESG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jul 2020 00:18:06 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595391485; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=HflwZjnZ8ak7CEDTpPjoblMd8cEwbvkkZamXydjOQKM=;
 b=LMrqXZVLzYapDNUg+L3SRdVMpufHTxvWBwgQO3xxSrHyqr1GqjQSnzr9t/2QzD8W2SGh/Rxk
 wU1y+BJ23Ga4gbGTUKd9gUcImxaFYvUDc0KrvfR+OI29FolbTQclT8tujGRKdOIsjjabt3pR
 mFtvESnd5FlhPc8lKSBoZD8rr5M=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n16.prod.us-west-2.postgun.com with SMTP id
 5f17bdfd3dbcb593a9707216 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 22 Jul 2020 04:18:05
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8E05EC433C6; Wed, 22 Jul 2020 04:18:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DF0E4C433C9;
        Wed, 22 Jul 2020 04:18:03 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 22 Jul 2020 09:48:03 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        evgreen@chromium.org, ohad@wizery.com,
        linux-kernel-owner@vger.kernel.org
Subject: Re: [PATCH v2 1/2] remoteproc: qcom_q6v5_mss: Add modem debug policy
 support
In-Reply-To: <20200722035427.GQ388985@builder.lan>
References: <20200721112935.25716-1-sibis@codeaurora.org>
 <20200721112935.25716-2-sibis@codeaurora.org>
 <20200722035427.GQ388985@builder.lan>
Message-ID: <bc9af3437b823d9acbfebdeeffdad04c@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-07-22 09:24, Bjorn Andersson wrote:
> On Tue 21 Jul 04:29 PDT 2020, Sibi Sankar wrote:
> 
>> Add modem debug policy support which will enable coredumps and live
>> debug support when the msadp firmware is present on secure devices.
>> 
>> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
>> ---
>> 
>> v2:
>>  * Use request_firmware_direct [Bjorn]
>>  * Use Bjorn's template to show if debug policy is present
>>  * Add size check to prevent memcpy out of bounds [Bjorn]
>> 
>>  drivers/remoteproc/qcom_q6v5_mss.c | 16 +++++++++++++++-
>>  1 file changed, 15 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c 
>> b/drivers/remoteproc/qcom_q6v5_mss.c
>> index 0b6f260eb5349..49cd16e050533 100644
>> --- a/drivers/remoteproc/qcom_q6v5_mss.c
>> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
>> @@ -189,6 +189,7 @@ struct q6v5 {
>>  	phys_addr_t mba_phys;
>>  	void *mba_region;
>>  	size_t mba_size;
>> +	size_t dp_size;
>> 
>>  	phys_addr_t mpss_phys;
>>  	phys_addr_t mpss_reloc;
>> @@ -408,6 +409,14 @@ static int q6v5_xfer_mem_ownership(struct q6v5 
>> *qproc, int *current_perm,
>>  static int q6v5_load(struct rproc *rproc, const struct firmware *fw)
>>  {
>>  	struct q6v5 *qproc = rproc->priv;
>> +	const struct firmware *dp_fw;
>> +
>> +	if (!request_firmware_direct(&dp_fw, "msadp", qproc->dev) && 
>> fw->size <= SZ_1M &&
>> +	    (SZ_1M + dp_fw->size) <= qproc->mba_size) {
>> +		memcpy(qproc->mba_region + SZ_1M, dp_fw->data, dp_fw->size);
>> +		qproc->dp_size = dp_fw->size;
>> +		release_firmware(dp_fw);
> 
> If request_firmware_direct() succeeds, but return a firmware blob 
> bigger
> than mba_size - SZ_1M you won't get here and will end up leaking dp_fw.
> 
> Additionally, there really isn't a need for requesting the firmware in
> the first place if fw->size > SZ_1M.
> 
> So I think it's better if you break this out in it's own function where
> you don't need to squeeze everything into one or two conditionals.

I'll fix dp_fw leak and move it
to a new func. Thanks for the
review.

> 
> Regards,
> Bjorn
> 
>> +	}
>> 
>>  	memcpy(qproc->mba_region, fw->data, fw->size);
>> 
>> @@ -896,6 +905,10 @@ static int q6v5_mba_load(struct q6v5 *qproc)
>>  	}
>> 
>>  	writel(qproc->mba_phys, qproc->rmb_base + RMB_MBA_IMAGE_REG);
>> +	if (qproc->dp_size) {
>> +		writel(qproc->mba_phys + SZ_1M, qproc->rmb_base + 
>> RMB_PMI_CODE_START_REG);
>> +		writel(qproc->dp_size, qproc->rmb_base + RMB_PMI_CODE_LENGTH_REG);
>> +	}
>> 
>>  	ret = q6v5proc_reset(qproc);
>>  	if (ret)
>> @@ -1257,7 +1270,8 @@ static int q6v5_start(struct rproc *rproc)
>>  	if (ret)
>>  		return ret;
>> 
>> -	dev_info(qproc->dev, "MBA booted, loading mpss\n");
>> +	dev_info(qproc->dev, "MBA booted with%s debug policy, loading 
>> mpss\n",
>> +		 qproc->dp_size ? "" : "out");
>> 
>>  	ret = q6v5_mpss_load(qproc);
>>  	if (ret)
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum,
>> a Linux Foundation Collaborative Project
>> 

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
