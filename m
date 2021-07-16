Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80C6F3CBAE1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jul 2021 19:02:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230346AbhGPRFG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Jul 2021 13:05:06 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:45162 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230256AbhGPRFF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Jul 2021 13:05:05 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1626454931; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=mEEK8vn8jUWHmrafJI5v9opupcLU0cBJfG6/Je3wKtE=; b=hMq2xdY6QkvgV0KkbA9oRBGLZE0uVN0s1oPVfAnQKdHQU5zJJrI/mWO71SHVXNX8zfJWLyR1
 qUznx2+Xd0E/1jQTc95UHoKI1yzSdJQT8kTs+l9qTvI26Aw5jZNgNW7VuBm6XY+S8bUs0kaA
 f1nV4gJi3US3AXPhmkVzbQz5WTM=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 60f1bb611d1afe585ebda6f7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 16 Jul 2021 17:01:21
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9E573C43460; Fri, 16 Jul 2021 17:01:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.79.43.230] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 81BA3C433F1;
        Fri, 16 Jul 2021 17:01:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 81BA3C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sibis@codeaurora.org
Subject: Re: [PATCH v2 3/3] soc: qcom: aoss: Add generic compatible
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210709174142.1274554-1-bjorn.andersson@linaro.org>
 <20210709174142.1274554-4-bjorn.andersson@linaro.org>
From:   Sibi Sankar <sibis@codeaurora.org>
Message-ID: <c3976c8d-c1ba-71b6-12ca-4de5649d9157@codeaurora.org>
Date:   Fri, 16 Jul 2021 22:31:08 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210709174142.1274554-4-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 7/9/21 11:11 PM, Bjorn Andersson wrote:
> It seems we don't need platform specific implementation for the AOSS
> QMP, so let's introduce a generic compatible to avoid having to update
> the driver for each platform.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Sibi Sankar <sibis@codeaurora.org>
Tested-by: Sibi Sankar <sibis@codeaurora.org>

> ---
> 
> Changes since v1:
> - None
> 
>   drivers/soc/qcom/qcom_aoss.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/soc/qcom/qcom_aoss.c b/drivers/soc/qcom/qcom_aoss.c
> index 934fcc4d2b05..92a1af70a649 100644
> --- a/drivers/soc/qcom/qcom_aoss.c
> +++ b/drivers/soc/qcom/qcom_aoss.c
> @@ -602,6 +602,7 @@ static const struct of_device_id qmp_dt_match[] = {
>   	{ .compatible = "qcom,sm8150-aoss-qmp", },
>   	{ .compatible = "qcom,sm8250-aoss-qmp", },
>   	{ .compatible = "qcom,sm8350-aoss-qmp", },
> +	{ .compatible = "qcom,aoss-qmp", },
>   	{}
>   };
>   MODULE_DEVICE_TABLE(of, qmp_dt_match);
> 

-- 
Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc, is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
