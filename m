Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53BD12232C3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jul 2020 07:08:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725922AbgGQFHg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jul 2020 01:07:36 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:64722 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725300AbgGQFHg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jul 2020 01:07:36 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594962455; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=X5BaP4NyQfI2naFIt5otfZ99CC+9Jy2wAJD8Qo0dYTM=;
 b=BdvqYu465btnKgbd1pczkeHKvlhgqcGXkJiEK8pdUxb0dZvrBX0Ti5/G1+8HgtyY/KLr93nB
 ryIKcxW6cGm72Ch/UBuczupCxMDricad40iYQDWvNrx/VqJvjtE2/edDd4aMkTB0Pz5+7iga
 B3uCmFpGPm82Kyg/dAeXeJ8hZQE=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n17.prod.us-east-1.postgun.com with SMTP id
 5f113215e3bee1251055db24 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 17 Jul 2020 05:07:33
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8F70EC43391; Fri, 17 Jul 2020 05:07:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E7876C433C9;
        Fri, 17 Jul 2020 05:07:31 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 17 Jul 2020 10:37:31 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        evgreen@chromium.org, ohad@wizery.com
Subject: Re: [PATCH 1/3] remoteproc: qcom_q6v5_mss: Add modem debug policy
 support
In-Reply-To: <20200717044133.GB2922385@builder.lan>
References: <20200716123630.21892-1-sibis@codeaurora.org>
 <20200716123630.21892-2-sibis@codeaurora.org>
 <20200717044133.GB2922385@builder.lan>
Message-ID: <954fa575f198603b7d8846051d769c61@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Bjorn,
Thanks for taking time to review
the series.

On 2020-07-17 10:11, Bjorn Andersson wrote:
> On Thu 16 Jul 05:36 PDT 2020, Sibi Sankar wrote:
> 
>> Add modem debug policy support which will enable coredumps and live
>> debug support when the msadp firmware is present on secure devices.
>> 
>> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
>> ---
>>  drivers/remoteproc/qcom_q6v5_mss.c | 15 ++++++++++++++-
>>  1 file changed, 14 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c 
>> b/drivers/remoteproc/qcom_q6v5_mss.c
>> index 13c6d5a72a831..95e21ed607cb9 100644
>> --- a/drivers/remoteproc/qcom_q6v5_mss.c
>> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
>> @@ -187,6 +187,7 @@ struct q6v5 {
>>  	phys_addr_t mba_phys;
>>  	void *mba_region;
>>  	size_t mba_size;
>> +	size_t dp_size;
>> 
>>  	phys_addr_t mpss_phys;
>>  	phys_addr_t mpss_reloc;
>> @@ -406,6 +407,13 @@ static int q6v5_xfer_mem_ownership(struct q6v5 
>> *qproc, int *current_perm,
>>  static int q6v5_load(struct rproc *rproc, const struct firmware *fw)
>>  {
>>  	struct q6v5 *qproc = rproc->priv;
>> +	const struct firmware *dp_fw;
>> +
>> +	if (!request_firmware(&dp_fw, "msadp", qproc->dev) && fw->size <= 
>> SZ_1M) {
> 
> Can we change this to a request_firmware_direct() to avoid the fact 
> that
> as written here devices lacking this file will pause here for 60 
> seconds
> waiting for userspace to assist in loading it (which at least none of 
> my
> systems do).
> 
> I also think that while it's nice to check that fw->size <= SZ_1M, to
> avoid overwriting the tail of it, you should check that SZ_1M +
> dp_fw->size < mba_size. To ensure that the memcpy doesn't go out of
> bounds.

Sure I'll get ^^ done in the
next re-spin.

> 
>> +		memcpy(qproc->mba_region + SZ_1M, dp_fw->data, dp_fw->size);
>> +		qproc->dp_size = dp_fw->size;
>> +		release_firmware(dp_fw);
>> +	}
>> 
>>  	memcpy(qproc->mba_region, fw->data, fw->size);
>> 
>> @@ -896,6 +904,10 @@ static int q6v5_mba_load(struct q6v5 *qproc)
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
>> @@ -1258,7 +1270,8 @@ static int q6v5_start(struct rproc *rproc)
>>  	if (ret)
>>  		return ret;
>> 
>> -	dev_info(qproc->dev, "MBA booted, loading mpss\n");
>> +	dev_info(qproc->dev, "MBA booted, debug policy %s, loading mpss\n",
>> +		 qproc->dp_size ? "enabled" : "disabled");
> 
> "MBA booted with%s debug policy, loading mpss\n", qproc->dp_size ? "" : 
> "out"
> 
> Please.

Sure I'll use your template instead.

> 
> Regards,
> Bjorn
> 
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
