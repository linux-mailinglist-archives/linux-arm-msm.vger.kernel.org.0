Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07CC3223303
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jul 2020 07:39:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725807AbgGQFjQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jul 2020 01:39:16 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:21033 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725300AbgGQFjQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jul 2020 01:39:16 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594964356; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=i8A0E8a2z78hKyFSZ9dVksXzxjSeAeTRmWqajuDnE6o=;
 b=BrQA8O66hLN5IcNoEBCSNwzRrIcrL4aiu6hSbJQ1aGfZxZTzgkeYI6w9qkBX3xzb4MUNoYT6
 2gTUpwZxkF7kK0W91VZrOiTQeLE0qiQK7iISqEIRC4F1zwM3Ms/ZOpcuSPapHcL2QajAtfRx
 Js6Vt2vGm7dPL0bAKIQxRKt3pBY=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n19.prod.us-east-1.postgun.com with SMTP id
 5f1136f003c8596cdb2b2151 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 17 Jul 2020 05:28:16
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 54654C433CB; Fri, 17 Jul 2020 05:28:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C465FC433C6;
        Fri, 17 Jul 2020 05:28:14 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 17 Jul 2020 10:58:14 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        evgreen@chromium.org, ohad@wizery.com,
        linux-remoteproc-owner@vger.kernel.org
Subject: Re: [PATCH 3/3] remoteproc: qcom_q6v5_mss: Update MBA log info
In-Reply-To: <20200717045935.GD2922385@builder.lan>
References: <20200716123630.21892-1-sibis@codeaurora.org>
 <20200716123630.21892-4-sibis@codeaurora.org>
 <20200717045935.GD2922385@builder.lan>
Message-ID: <24c1d9990fb393c4c04c26b416d70f82@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-07-17 10:29, Bjorn Andersson wrote:
> On Thu 16 Jul 05:36 PDT 2020, Sibi Sankar wrote:
> 
>> Update MBA text logs location/size in IMEM to aid tools extract
>> them after ramdump collection.
>> 
>> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
>> ---
>>  drivers/remoteproc/qcom_q6v5_mss.c | 3 +++
>>  1 file changed, 3 insertions(+)
>> 
>> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c 
>> b/drivers/remoteproc/qcom_q6v5_mss.c
>> index 4ddf084b2c6fc..539594ab955f1 100644
>> --- a/drivers/remoteproc/qcom_q6v5_mss.c
>> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
>> @@ -932,6 +932,9 @@ static int q6v5_mba_load(struct q6v5 *qproc)
>>  	if (ret)
>>  		goto reclaim_mba;
>> 
>> +	if (qproc->has_mba_logs)
>> +		qcom_pil_info_store("mba", qproc->mba_phys, MBA_LOG_SIZE);
> 
> Is there a reason why we don't unconditionally write this to the PIL
> info? And why it shouldn't be mba_size?

MBA text logs of size specified are the
only things extracted from MBA region by
the postmortem tools (the tool assumes
that the entire region is text). The MBA
log feature was only added to SC7180 MSS
firmware.

> 
> Regards,
> Bjorn
> 
>> +
>>  	ret = q6v5_rmb_mba_wait(qproc, 0, 5000);
>>  	if (ret == -ETIMEDOUT) {
>>  		dev_err(qproc->dev, "MBA boot timed out\n");
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum,
>> a Linux Foundation Collaborative Project
>> 

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
