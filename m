Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1BF88420C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2019 04:03:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728660AbfHGCDF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Aug 2019 22:03:05 -0400
Received: from gateway24.websitewelcome.com ([192.185.51.162]:11644 "EHLO
        gateway24.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729070AbfHGCDE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Aug 2019 22:03:04 -0400
Received: from cm17.websitewelcome.com (cm17.websitewelcome.com [100.42.49.20])
        by gateway24.websitewelcome.com (Postfix) with ESMTP id 463EA673B
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Aug 2019 20:41:06 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id vAwshEH6d90onvAwsh4HvU; Tue, 06 Aug 2019 20:41:06 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=fxNHycYP3DpuP9hPItzM7DWS8QBjKsdrytCuN0L39Zc=; b=RfUDwtXkXMaufXND46Yc3IHGkQ
        xIWxN8yeqofaNOKtJRY4+J5KG9aDTwvZnoyeWub5lFKSO3wKuw2yIByuIvsIO2vTiMP2iYkMAYZ+P
        OY+Nzt/mfIs+V5FaZdspsw3/coQNKGAjODWFUfmkKDDu3TQ76eamoD6/JcsgBf8N7rkg9QToccxFM
        ERnivxiGup9ipJNFRQMLFtjhWIXfFP5f72wOAZdb359j6/AkEXVsjpSiw3DVVPyCST39d0f60XH9F
        ITjOLHzJ7ijpUMSIYC/ZH45kBFueUQr+Qxu4unvJ/2TUCxeRRU8dgo03j713KRF6TzjU9QFhOE75I
        658O703Q==;
Received: from [187.192.11.120] (port=56546 helo=[192.168.43.131])
        by gator4166.hostgator.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <gustavo@embeddedor.com>)
        id 1hvAwr-001g0b-NX; Tue, 06 Aug 2019 20:41:06 -0500
Subject: Re: [PATCH] soc: qcom: socinfo: Annotate switch cases with fall
 through
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20190807012457.16820-1-bjorn.andersson@linaro.org>
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Openpgp: preference=signencrypt
Autocrypt: addr=gustavo@embeddedor.com; keydata=
 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
 VtSixD1uOgytAP7RWS474w==
Message-ID: <a4ad9eda-40d1-da65-86fa-c082100d5b66@embeddedor.com>
Date:   Tue, 6 Aug 2019 20:40:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190807012457.16820-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.192.11.120
X-Source-L: No
X-Exim-ID: 1hvAwr-001g0b-NX
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.43.131]) [187.192.11.120]:56546
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 4
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 8/6/19 8:24 PM, Bjorn Andersson wrote:
> Introduce fall through annotations in the switch statements of
> socinfo_debugfs_init() to silence compiler warnings.
> 

This is enough to silence all the warnings:

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 855353bed19e..a39ea5061dc5 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -323,6 +323,7 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
                debugfs_create_x32("raw_device_number", 0400,
                                   qcom_socinfo->dbg_root,
                                   &qcom_socinfo->info.raw_device_num);
+               /* Fall through */
        case SOCINFO_VERSION(0, 11):
        case SOCINFO_VERSION(0, 10):
        case SOCINFO_VERSION(0, 9):
@@ -330,10 +331,12 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,

                debugfs_create_u32("foundry_id", 0400, qcom_socinfo->dbg_root,
                                   &qcom_socinfo->info.foundry_id);
+               /* Fall through */
        case SOCINFO_VERSION(0, 8):
        case SOCINFO_VERSION(0, 7):
                DEBUGFS_ADD(info, pmic_model);
                DEBUGFS_ADD(info, pmic_die_rev);
+               /* Fall through */
        case SOCINFO_VERSION(0, 6):
                qcom_socinfo->info.hw_plat_subtype =
                        __le32_to_cpu(info->hw_plat_subtype);
@@ -341,6 +344,7 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
                debugfs_create_u32("hardware_platform_subtype", 0400,
                                   qcom_socinfo->dbg_root,
                                   &qcom_socinfo->info.hw_plat_subtype);
+               /* Fall through */
        case SOCINFO_VERSION(0, 5):
                qcom_socinfo->info.accessory_chip =
                        __le32_to_cpu(info->accessory_chip);
@@ -348,23 +352,27 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
                debugfs_create_u32("accessory_chip", 0400,
                                   qcom_socinfo->dbg_root,
                                   &qcom_socinfo->info.accessory_chip);
+               /* Fall through */
        case SOCINFO_VERSION(0, 4):
                qcom_socinfo->info.plat_ver = __le32_to_cpu(info->plat_ver);

                debugfs_create_u32("platform_version", 0400,
                                   qcom_socinfo->dbg_root,
                                   &qcom_socinfo->info.plat_ver);
+               /* Fall through */
        case SOCINFO_VERSION(0, 3):
                qcom_socinfo->info.hw_plat = __le32_to_cpu(info->hw_plat);

                debugfs_create_u32("hardware_platform", 0400,
                                   qcom_socinfo->dbg_root,
                                   &qcom_socinfo->info.hw_plat);
+               /* Fall through */
        case SOCINFO_VERSION(0, 2):
                qcom_socinfo->info.raw_ver  = __le32_to_cpu(info->raw_ver);

                debugfs_create_u32("raw_version", 0400, qcom_socinfo->dbg_root,
                                   &qcom_socinfo->info.raw_ver);
+               /* Fall through */
        case SOCINFO_VERSION(0, 1):
                DEBUGFS_ADD(info, build_id);
                break;

--
Gustavo


> Fixes: 9c84c1e78634 ("soc: qcom: socinfo: Expose custom attributes")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/soc/qcom/socinfo.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
> index 855353bed19e..f0ca9d7c7966 100644
> --- a/drivers/soc/qcom/socinfo.c
> +++ b/drivers/soc/qcom/socinfo.c
> @@ -323,17 +323,23 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
>  		debugfs_create_x32("raw_device_number", 0400,
>  				   qcom_socinfo->dbg_root,
>  				   &qcom_socinfo->info.raw_device_num);
> +		/* Fall through */
>  	case SOCINFO_VERSION(0, 11):
> +		/* Fall through */
>  	case SOCINFO_VERSION(0, 10):
> +		/* Fall through */
>  	case SOCINFO_VERSION(0, 9):
>  		qcom_socinfo->info.foundry_id = __le32_to_cpu(info->foundry_id);
>  
>  		debugfs_create_u32("foundry_id", 0400, qcom_socinfo->dbg_root,
>  				   &qcom_socinfo->info.foundry_id);
> +		/* Fall through */
>  	case SOCINFO_VERSION(0, 8):
> +		/* Fall through */
>  	case SOCINFO_VERSION(0, 7):
>  		DEBUGFS_ADD(info, pmic_model);
>  		DEBUGFS_ADD(info, pmic_die_rev);
> +		/* Fall through */
>  	case SOCINFO_VERSION(0, 6):
>  		qcom_socinfo->info.hw_plat_subtype =
>  			__le32_to_cpu(info->hw_plat_subtype);
> @@ -341,6 +347,7 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
>  		debugfs_create_u32("hardware_platform_subtype", 0400,
>  				   qcom_socinfo->dbg_root,
>  				   &qcom_socinfo->info.hw_plat_subtype);
> +		/* Fall through */
>  	case SOCINFO_VERSION(0, 5):
>  		qcom_socinfo->info.accessory_chip =
>  			__le32_to_cpu(info->accessory_chip);
> @@ -348,23 +355,27 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
>  		debugfs_create_u32("accessory_chip", 0400,
>  				   qcom_socinfo->dbg_root,
>  				   &qcom_socinfo->info.accessory_chip);
> +		/* Fall through */
>  	case SOCINFO_VERSION(0, 4):
>  		qcom_socinfo->info.plat_ver = __le32_to_cpu(info->plat_ver);
>  
>  		debugfs_create_u32("platform_version", 0400,
>  				   qcom_socinfo->dbg_root,
>  				   &qcom_socinfo->info.plat_ver);
> +		/* Fall through */
>  	case SOCINFO_VERSION(0, 3):
>  		qcom_socinfo->info.hw_plat = __le32_to_cpu(info->hw_plat);
>  
>  		debugfs_create_u32("hardware_platform", 0400,
>  				   qcom_socinfo->dbg_root,
>  				   &qcom_socinfo->info.hw_plat);
> +		/* Fall through */
>  	case SOCINFO_VERSION(0, 2):
>  		qcom_socinfo->info.raw_ver  = __le32_to_cpu(info->raw_ver);
>  
>  		debugfs_create_u32("raw_version", 0400, qcom_socinfo->dbg_root,
>  				   &qcom_socinfo->info.raw_ver);
> +		/* Fall through */
>  	case SOCINFO_VERSION(0, 1):
>  		DEBUGFS_ADD(info, build_id);
>  		break;
> 
