Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BBB32DF832
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Dec 2020 05:19:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725785AbgLUET2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 20 Dec 2020 23:19:28 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:20753 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725308AbgLUET2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 20 Dec 2020 23:19:28 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1608524349; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=HtTA0h+2QaseQndGgzLFJv+a6WB+K2zR6Dk09vehWqg=;
 b=Kzn8lVrZ/QefEW4TuDdurd/qLV8REANemfP+AR6Vm8l6Gqt0yezEiqwsOhgr2xvaXfBPIPR5
 2BecPUAOE3COISGzlmPgYER3fDUB8xsr43BdYQBYpiHtQcA6su5nWJAoESuWzCllMIpTO5KN
 dyR0OUyvM534MbMLhz3IuET9dUk=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-east-1.postgun.com with SMTP id
 5fe022217549779c5b60bfb3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 21 Dec 2020 04:18:41
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 69CB2C433CA; Mon, 21 Dec 2020 04:18:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 48513C433CA;
        Mon, 21 Dec 2020 04:18:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 21 Dec 2020 09:48:39 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] soc: qcom: socinfo: Open read access to all for debugfs
In-Reply-To: <20201216071926.3147108-1-swboyd@chromium.org>
References: <20201216071926.3147108-1-swboyd@chromium.org>
Message-ID: <c628612f7931c49767349a325c979b3b@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-12-16 12:49, Stephen Boyd wrote:
> There doesn't seem to be any reason to limit this to only root user
> readable. Let's make it readable by all so that random programs can
> read the debugfs files in here instead of just root. The information is
> just that, informational, so this is fine.
> 
> Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/soc/qcom/socinfo.c | 40 +++++++++++++++++++-------------------
>  1 file changed, 20 insertions(+), 20 deletions(-)
> 

Reviewed-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>

> diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
> index b44ede48decc..4e4946d9e4ab 100644
> --- a/drivers/soc/qcom/socinfo.c
> +++ b/drivers/soc/qcom/socinfo.c
> @@ -258,7 +258,7 @@ static const struct file_operations qcom_ ##name##
> _ops = {		\
>  }
> 
>  #define DEBUGFS_ADD(info, name)						\
> -	debugfs_create_file(__stringify(name), 0400,			\
> +	debugfs_create_file(__stringify(name), 0444,			\
>  			    qcom_socinfo->dbg_root,			\
>  			    info, &qcom_ ##name## _ops)
> 
> @@ -349,14 +349,14 @@ static void socinfo_debugfs_init(struct
> qcom_socinfo *qcom_socinfo,
> 
>  	qcom_socinfo->info.fmt = __le32_to_cpu(info->fmt);
> 
> -	debugfs_create_x32("info_fmt", 0400, qcom_socinfo->dbg_root,
> +	debugfs_create_x32("info_fmt", 0444, qcom_socinfo->dbg_root,
>  			   &qcom_socinfo->info.fmt);
> 
>  	switch (qcom_socinfo->info.fmt) {
>  	case SOCINFO_VERSION(0, 15):
>  		qcom_socinfo->info.nmodem_supported = 
> __le32_to_cpu(info->nmodem_supported);
> 
> -		debugfs_create_u32("nmodem_supported", 0400, qcom_socinfo->dbg_root,
> +		debugfs_create_u32("nmodem_supported", 0444, qcom_socinfo->dbg_root,
>  				   &qcom_socinfo->info.nmodem_supported);
>  		fallthrough;
>  	case SOCINFO_VERSION(0, 14):
> @@ -365,19 +365,19 @@ static void socinfo_debugfs_init(struct
> qcom_socinfo *qcom_socinfo,
>  		qcom_socinfo->info.num_defective_parts =
> __le32_to_cpu(info->num_defective_parts);
>  		qcom_socinfo->info.ndefective_parts_array_offset =
> __le32_to_cpu(info->ndefective_parts_array_offset);
> 
> -		debugfs_create_u32("num_clusters", 0400, qcom_socinfo->dbg_root,
> +		debugfs_create_u32("num_clusters", 0444, qcom_socinfo->dbg_root,
>  				   &qcom_socinfo->info.num_clusters);
> -		debugfs_create_u32("ncluster_array_offset", 0400, 
> qcom_socinfo->dbg_root,
> +		debugfs_create_u32("ncluster_array_offset", 0444, 
> qcom_socinfo->dbg_root,
>  				   &qcom_socinfo->info.ncluster_array_offset);
> -		debugfs_create_u32("num_defective_parts", 0400, 
> qcom_socinfo->dbg_root,
> +		debugfs_create_u32("num_defective_parts", 0444, 
> qcom_socinfo->dbg_root,
>  				   &qcom_socinfo->info.num_defective_parts);
> -		debugfs_create_u32("ndefective_parts_array_offset", 0400,
> qcom_socinfo->dbg_root,
> +		debugfs_create_u32("ndefective_parts_array_offset", 0444,
> qcom_socinfo->dbg_root,
>  				   &qcom_socinfo->info.ndefective_parts_array_offset);
>  		fallthrough;
>  	case SOCINFO_VERSION(0, 13):
>  		qcom_socinfo->info.nproduct_id = __le32_to_cpu(info->nproduct_id);
> 
> -		debugfs_create_u32("nproduct_id", 0400, qcom_socinfo->dbg_root,
> +		debugfs_create_u32("nproduct_id", 0444, qcom_socinfo->dbg_root,
>  				   &qcom_socinfo->info.nproduct_id);
>  		DEBUGFS_ADD(info, chip_id);
>  		fallthrough;
> @@ -389,12 +389,12 @@ static void socinfo_debugfs_init(struct
> qcom_socinfo *qcom_socinfo,
>  		qcom_socinfo->info.raw_device_num =
>  			__le32_to_cpu(info->raw_device_num);
> 
> -		debugfs_create_x32("chip_family", 0400, qcom_socinfo->dbg_root,
> +		debugfs_create_x32("chip_family", 0444, qcom_socinfo->dbg_root,
>  				   &qcom_socinfo->info.chip_family);
> -		debugfs_create_x32("raw_device_family", 0400,
> +		debugfs_create_x32("raw_device_family", 0444,
>  				   qcom_socinfo->dbg_root,
>  				   &qcom_socinfo->info.raw_device_family);
> -		debugfs_create_x32("raw_device_number", 0400,
> +		debugfs_create_x32("raw_device_number", 0444,
>  				   qcom_socinfo->dbg_root,
>  				   &qcom_socinfo->info.raw_device_num);
>  		fallthrough;
> @@ -403,7 +403,7 @@ static void socinfo_debugfs_init(struct
> qcom_socinfo *qcom_socinfo,
>  	case SOCINFO_VERSION(0, 9):
>  		qcom_socinfo->info.foundry_id = __le32_to_cpu(info->foundry_id);
> 
> -		debugfs_create_u32("foundry_id", 0400, qcom_socinfo->dbg_root,
> +		debugfs_create_u32("foundry_id", 0444, qcom_socinfo->dbg_root,
>  				   &qcom_socinfo->info.foundry_id);
>  		fallthrough;
>  	case SOCINFO_VERSION(0, 8):
> @@ -415,7 +415,7 @@ static void socinfo_debugfs_init(struct
> qcom_socinfo *qcom_socinfo,
>  		qcom_socinfo->info.hw_plat_subtype =
>  			__le32_to_cpu(info->hw_plat_subtype);
> 
> -		debugfs_create_u32("hardware_platform_subtype", 0400,
> +		debugfs_create_u32("hardware_platform_subtype", 0444,
>  				   qcom_socinfo->dbg_root,
>  				   &qcom_socinfo->info.hw_plat_subtype);
>  		fallthrough;
> @@ -423,28 +423,28 @@ static void socinfo_debugfs_init(struct
> qcom_socinfo *qcom_socinfo,
>  		qcom_socinfo->info.accessory_chip =
>  			__le32_to_cpu(info->accessory_chip);
> 
> -		debugfs_create_u32("accessory_chip", 0400,
> +		debugfs_create_u32("accessory_chip", 0444,
>  				   qcom_socinfo->dbg_root,
>  				   &qcom_socinfo->info.accessory_chip);
>  		fallthrough;
>  	case SOCINFO_VERSION(0, 4):
>  		qcom_socinfo->info.plat_ver = __le32_to_cpu(info->plat_ver);
> 
> -		debugfs_create_u32("platform_version", 0400,
> +		debugfs_create_u32("platform_version", 0444,
>  				   qcom_socinfo->dbg_root,
>  				   &qcom_socinfo->info.plat_ver);
>  		fallthrough;
>  	case SOCINFO_VERSION(0, 3):
>  		qcom_socinfo->info.hw_plat = __le32_to_cpu(info->hw_plat);
> 
> -		debugfs_create_u32("hardware_platform", 0400,
> +		debugfs_create_u32("hardware_platform", 0444,
>  				   qcom_socinfo->dbg_root,
>  				   &qcom_socinfo->info.hw_plat);
>  		fallthrough;
>  	case SOCINFO_VERSION(0, 2):
>  		qcom_socinfo->info.raw_ver  = __le32_to_cpu(info->raw_ver);
> 
> -		debugfs_create_u32("raw_version", 0400, qcom_socinfo->dbg_root,
> +		debugfs_create_u32("raw_version", 0444, qcom_socinfo->dbg_root,
>  				   &qcom_socinfo->info.raw_ver);
>  		fallthrough;
>  	case SOCINFO_VERSION(0, 1):
> @@ -461,11 +461,11 @@ static void socinfo_debugfs_init(struct
> qcom_socinfo *qcom_socinfo,
> 
>  		dentry = debugfs_create_dir(socinfo_image_names[i],
>  					    qcom_socinfo->dbg_root);
> -		debugfs_create_file("name", 0400, dentry, &versions[i],
> +		debugfs_create_file("name", 0444, dentry, &versions[i],
>  				    &qcom_image_name_ops);
> -		debugfs_create_file("variant", 0400, dentry, &versions[i],
> +		debugfs_create_file("variant", 0444, dentry, &versions[i],
>  				    &qcom_image_variant_ops);
> -		debugfs_create_file("oem", 0400, dentry, &versions[i],
> +		debugfs_create_file("oem", 0444, dentry, &versions[i],
>  				    &qcom_image_oem_ops);
>  	}
>  }
> 
> base-commit: 2c85ebc57b3e1817b6ce1a6b703928e113a90442

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
