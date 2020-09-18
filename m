Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA33B26FFD1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Sep 2020 16:28:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726199AbgIRO2J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Sep 2020 10:28:09 -0400
Received: from m42-11.mailgun.net ([69.72.42.11]:40243 "EHLO
        m42-11.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726126AbgIRO2I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Sep 2020 10:28:08 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600439288; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=b9Wia7dfYXLkGUte/zN7mU8JI79/XCIzrellxwhgVoo=; b=WL2HA5CnPV7jkwJW1YtsveLqbP2+XEqMrvG5lFir7IrrFe6I6MIEzH8lDh5mN7bRsnPAuHSa
 nCxohD9zHe9Vv0SavWWNXoxV/9csCqYm5tfiG8dtw9Atcjao834Ijj9GsXCjPOza/g0FNDm/
 8aUS6Y+8vArTo11/f+v2GRROg6A=
X-Mailgun-Sending-Ip: 69.72.42.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5f64c3d5f1e3eb89c7c02471 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 18 Sep 2020 14:27:33
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 70332C433F1; Fri, 18 Sep 2020 14:27:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
        version=3.4.0
Received: from [10.226.59.216] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 73698C433CA;
        Fri, 18 Sep 2020 14:27:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 73698C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH v1 1/3] bus: mhi: core: Remove warnings for missing
 MODULE_LICENSE()
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>,
        manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        linux-kernel@vger.kernel.org
References: <1600381176-37604-1-git-send-email-bbhatt@codeaurora.org>
 <1600381176-37604-2-git-send-email-bbhatt@codeaurora.org>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <6f7b6be3-f52d-b082-6065-c75e3d89d252@codeaurora.org>
Date:   Fri, 18 Sep 2020 08:27:30 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.1
MIME-Version: 1.0
In-Reply-To: <1600381176-37604-2-git-send-email-bbhatt@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 9/17/2020 4:19 PM, Bhaumik Bhatt wrote:
> When building MHI as a module, missing MODULE_LICENSE() warnings
> are seen. Avoid them by adding the license and description
> information for the files where the warnings are seen.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> ---
>   drivers/bus/mhi/core/boot.c | 3 +++
>   drivers/bus/mhi/core/main.c | 3 +++
>   drivers/bus/mhi/core/pm.c   | 3 +++
>   3 files changed, 9 insertions(+)
> 
> diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
> index 24422f5..78140cc 100644
> --- a/drivers/bus/mhi/core/boot.c
> +++ b/drivers/bus/mhi/core/boot.c
> @@ -523,3 +523,6 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>   error_alloc_fw_table:
>   	release_firmware(firmware);
>   }
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("MHI Host Interface");
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index 2cff5dd..172026f 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -1533,3 +1533,6 @@ int mhi_poll(struct mhi_device *mhi_dev, u32 budget)
>   	return ret;
>   }
>   EXPORT_SYMBOL_GPL(mhi_poll);
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("MHI Host Interface");
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index ce4d969..72c3dbc 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -1150,3 +1150,6 @@ void mhi_device_put(struct mhi_device *mhi_dev)
>   	read_unlock_bh(&mhi_cntrl->pm_lock);
>   }
>   EXPORT_SYMBOL_GPL(mhi_device_put);
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("MHI Host Interface");
> 

I would expect you only need to add the MODULE_* once per module, in 
which case main.c is probably the only place that needs it.

-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
