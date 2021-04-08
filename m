Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CAA9358141
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 13:02:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230344AbhDHLCc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Apr 2021 07:02:32 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:61989 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229803AbhDHLCc (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Apr 2021 07:02:32 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617879741; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=EBCTzcCpiezgLCr+xr3ZuWx+g0smdSsuogy2SblDCSc=; b=O+ULg8IoDhOcdr1VR2d13nPdKBLFG2yFUU9IzwsxjYfdU6Qs9Z+5X4i6zv6+Iajs7WY2cGFr
 F5YH+YCk6muMw2cXb7wEHLpK/2EmGg4HfsQ2/wo0oeL480kvQzcvKCrFRKYwCwuI108w+vfr
 D27hPP5byBppG+ZbAPFSbhpeiTI=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 606ee29874f773a6640f5451 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 08 Apr 2021 11:01:44
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6D557C43461; Thu,  8 Apr 2021 11:01:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [10.79.43.230] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6F994C433ED;
        Thu,  8 Apr 2021 11:01:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6F994C433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sibis@codeaurora.org
Subject: Re: [PATCH] soc: qcom: mdt_loader: Detect truncated read of segments
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Siddharth Gupta <sidgup@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210107232526.716989-1-bjorn.andersson@linaro.org>
From:   Sibi Sankar <sibis@codeaurora.org>
Message-ID: <b26cbf35-0500-1e79-9de8-de447a69f78f@codeaurora.org>
Date:   Thu, 8 Apr 2021 16:31:23 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210107232526.716989-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Hey Bjorn,

Thanks for the patch!

On 1/8/21 4:55 AM, Bjorn Andersson wrote:
> Given that no validation of how much data the firmware loader read in
> for a given segment truncated segment files would best case result in a
> hash verification failure, without any indication of what went wrong.
> 
> Improve this by validating that the firmware loader did return the
> amount of data requested.
> 
> Fixes: 445c2410a449 ("soc: qcom: mdt_loader: Use request_firmware_into_buf()")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>   drivers/soc/qcom/mdt_loader.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
> index 24cd193dec55..e01d18e9ad2b 100644
> --- a/drivers/soc/qcom/mdt_loader.c
> +++ b/drivers/soc/qcom/mdt_loader.c
> @@ -253,6 +253,14 @@ static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
>   				break;
>   			}
>   
> +			if (seg_fw->size != phdr->p_filesz) {
> +				dev_err(dev,
> +					"failed to load segment %d from truncated file %s\n",
> +					i, fw_name);
> +				ret = -EINVAL;
> +				break;

seg_fw has to be released on error condition as well.
With ^^ fixed you can have my R-b.

Reviewed-by: Sibi Sankar <sibis@codeaurora.org>

> +			}
> +
>   			release_firmware(seg_fw);
>   		}
>   
> 

-- 
Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc, is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
