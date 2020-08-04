Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14EC523BC02
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Aug 2020 16:25:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728616AbgHDOZm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Aug 2020 10:25:42 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:40300 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729064AbgHDOZd (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Aug 2020 10:25:33 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1596551131; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: References: Cc: To: From:
 Subject: Sender; bh=ykfrIBYjPSVeXGrw23AhWHmjOLWaPxQlMmSQFdAOaNE=; b=jmAOxXS8Yg9wPpBhW8fFHMdbybvPDMZdp1e0WPltmIMs1Ydqv8ERfZHR9O9fSAQrN1uGZ27L
 GF3ORDkwXILzuzwewfoWqc8cU3RDrm7Jqkk9TE0/goT/bJi2MfxYRP6lDWl0rtXrDTU4C/po
 5MrRRTjwnllkh/F9s4smktc7WCo=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n15.prod.us-east-1.postgun.com with SMTP id
 5f296fda14acd1952bb3d023 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 04 Aug 2020 14:25:30
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AE730C4339C; Tue,  4 Aug 2020 14:25:29 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.4] (unknown [223.230.47.40])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: gkohli)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CE73BC433CA;
        Tue,  4 Aug 2020 14:25:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CE73BC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=gkohli@codeaurora.org
Subject: Re: [PATCH] nvmem: core: add support to NVMEM_NO_SYSFS_ENTRY
From:   Gaurav Kohli <gkohli@codeaurora.org>
To:     will@kernel.org, linux-arm-kernel@lists.infradead.org,
        maz@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        neeraju@codeaurora.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
References: <1596550484-11029-1-git-send-email-gkohli@codeaurora.org>
 <1596550484-11029-2-git-send-email-gkohli@codeaurora.org>
Message-ID: <8004ec2b-5efd-7c74-83e6-c4c41fe896c0@codeaurora.org>
Date:   Tue, 4 Aug 2020 19:55:23 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1596550484-11029-2-git-send-email-gkohli@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Please ignore this patch, some problem in my git send mail.
Apologies for the spam.


On 8/4/2020 7:44 PM, Gaurav Kohli wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> Some users might not want to expose nvmem entry to sysfs and
> only intend to use kernel interface so add such provision.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>    Documentation/ABI/stable/sysfs-bus-nvmem |  2 ++
>    drivers/nvmem/Kconfig                    |  5 +++++
>    drivers/nvmem/core.c                     | 11 ++++++-----
>    3 files changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/ABI/stable/sysfs-bus-nvmem
> b/Documentation/ABI/stable/sysfs-bus-nvmem
> index 5923ab4620c5..12aab0a85fea 100644
> --- a/Documentation/ABI/stable/sysfs-bus-nvmem
> +++ b/Documentation/ABI/stable/sysfs-bus-nvmem
> @@ -6,6 +6,8 @@ Description:
>    		This file allows user to read/write the raw NVMEM contents.
>    		Permissions for write to this file depends on the nvmem
>    		provider configuration.
> +		Note: This file is not present if CONFIG_NVMEM_NO_SYSFS_ENTRY
> +		is enabled
> 
>    		ex:
>    		hexdump /sys/bus/nvmem/devices/qfprom0/nvmem
> diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> index 0a7a470ee859..6ab3276d287c 100644
> --- a/drivers/nvmem/Kconfig
> +++ b/drivers/nvmem/Kconfig
> @@ -192,4 +192,9 @@ config SC27XX_EFUSE
>    	  This driver can also be built as a module. If so, the module
>    	  will be called nvmem-sc27xx-efuse.
> 
> +config NVMEM_NO_SYSFS_ENTRY
> +	bool "No nvmem sysfs entry"
> +
> +	help
> +	  Say Yes if you do not want to add nvmem entry to sysfs.
>    endif
> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> index b9a0270883a0..c70f183fe379 100644
> --- a/drivers/nvmem/core.c
> +++ b/drivers/nvmem/core.c
> @@ -216,7 +216,7 @@ static const struct attribute_group
> nvmem_bin_rw_group = {
> 	.attrs		= nvmem_attrs,
>    };
> 
> -static const struct attribute_group *nvmem_rw_dev_groups[] = {
> +static const __maybe_unused struct attribute_group
> *nvmem_rw_dev_groups[] = {
>    	&nvmem_bin_rw_group,
>    	NULL,
>    };
> @@ -240,7 +240,7 @@ static const struct attribute_group
> nvmem_bin_ro_group = {
>    	.attrs		= nvmem_attrs,
>    };
> 
> -static const struct attribute_group *nvmem_ro_dev_groups[] = {
> +static const __maybe_unused struct attribute_group
> *nvmem_ro_dev_groups[] = {
>    	&nvmem_bin_ro_group,
>    	NULL,
>    };
> @@ -265,7 +265,7 @@ static const struct attribute_group
> nvmem_bin_rw_root_group = {
>    	.attrs		= nvmem_attrs,
>    };
> 
> -static const struct attribute_group *nvmem_rw_root_dev_groups[] = {
> +static const __maybe_unused struct attribute_group
> *nvmem_rw_root_dev_groups[] = {
>    	&nvmem_bin_rw_root_group,
>    	NULL,
>    };
> @@ -289,7 +289,7 @@ static const struct attribute_group
> nvmem_bin_ro_root_group = {
>    	.attrs		= nvmem_attrs,
>    };
> 
> -static const struct attribute_group *nvmem_ro_root_dev_groups[] = {
> +static const __maybe_unused struct attribute_group
> *nvmem_ro_root_dev_groups[] = {
>    	&nvmem_bin_ro_root_group,
>    	NULL,
>    };
> @@ -688,6 +688,7 @@ struct nvmem_device *nvmem_register(const struct
> nvmem_config *config)
>    	nvmem->read_only = device_property_present(config->dev, "read-only") |
>    			   config->read_only;
> 
> +#if !defined(CONFIG_NVMEM_NO_SYSFS_ENTRY)
>    	if (config->root_only)
>    		nvmem->dev.groups = nvmem->read_only ?
>    			nvmem_ro_root_dev_groups :
> @@ -696,7 +697,7 @@ struct nvmem_device *nvmem_register(const struct
> nvmem_config *config)
>    		nvmem->dev.groups = nvmem->read_only ?
>    			nvmem_ro_dev_groups :
>    			nvmem_rw_dev_groups;
> -
> +#endif
>    	device_initialize(&nvmem->dev);
> 
>    	dev_dbg(&nvmem->dev, "Registering nvmem device %s\n", config->name);
> 

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center,
Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
