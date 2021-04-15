Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05CE8360586
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Apr 2021 11:21:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231750AbhDOJWE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Apr 2021 05:22:04 -0400
Received: from mga17.intel.com ([192.55.52.151]:46474 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229820AbhDOJWD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Apr 2021 05:22:03 -0400
IronPort-SDR: oqLR66sH+cviQYuhlNe4FO0qLFlqha2OtGvRudzhYW0zocCubf34i+dyHRfIIcBams0KqNrQ8z
 qyZ4v5Ro674Q==
X-IronPort-AV: E=McAfee;i="6200,9189,9954"; a="174926946"
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; 
   d="scan'208";a="174926946"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2021 02:21:40 -0700
IronPort-SDR: YpGFh5zppOvLRwYDx84dLt90viOBgvXkM7UaUKbkrrtSVnAHS6Tki5xmNP9Nvb7tspJWCqMocc
 g6LNY7Ja5e0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; 
   d="scan'208";a="382671581"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.174]) ([10.237.72.174])
  by orsmga003.jf.intel.com with ESMTP; 15 Apr 2021 02:21:35 -0700
Subject: Re: [PATCH v18 2/2] ufs: sysfs: Resume the proper scsi device
To:     Asutosh Das <asutoshd@codeaurora.org>, cang@codeaurora.org,
        martin.petersen@oracle.com, linux-scsi@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Bean Huo <beanhuo@micron.com>, Yue Hu <huyue2@yulong.com>,
        open list <linux-kernel@vger.kernel.org>
References: <cover.1618426513.git.asutoshd@codeaurora.org>
 <4745814f5fa37d49e969c2ffb1b4df401dbc98e7.1618426513.git.asutoshd@codeaurora.org>
From:   Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <3e88725f-166d-114b-506d-17a41c2a5c72@intel.com>
Date:   Thu, 15 Apr 2021 12:21:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <4745814f5fa37d49e969c2ffb1b4df401dbc98e7.1618426513.git.asutoshd@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/04/21 9:58 pm, Asutosh Das wrote:
> Resumes the actual scsi device the unit descriptor of which
> is being accessed instead of the hba alone.
> 
> Reviewed-by: Can Guo <cang@codeaurora.org>
> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>

Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
>  drivers/scsi/ufs/ufs-sysfs.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/scsi/ufs/ufs-sysfs.c b/drivers/scsi/ufs/ufs-sysfs.c
> index d7c3cff..4d9d4d8 100644
> --- a/drivers/scsi/ufs/ufs-sysfs.c
> +++ b/drivers/scsi/ufs/ufs-sysfs.c
> @@ -245,9 +245,9 @@ static ssize_t wb_on_store(struct device *dev, struct device_attribute *attr,
>  		goto out;
>  	}
>  
> -	pm_runtime_get_sync(hba->dev);
> +	ufshcd_rpm_get_sync(hba);
>  	res = ufshcd_wb_toggle(hba, wb_enable);
> -	pm_runtime_put_sync(hba->dev);
> +	ufshcd_rpm_put_sync(hba);
>  out:
>  	up(&hba->host_sem);
>  	return res < 0 ? res : count;
> @@ -297,10 +297,10 @@ static ssize_t ufs_sysfs_read_desc_param(struct ufs_hba *hba,
>  		goto out;
>  	}
>  
> -	pm_runtime_get_sync(hba->dev);
> +	ufshcd_rpm_get_sync(hba);
>  	ret = ufshcd_read_desc_param(hba, desc_id, desc_index,
>  				param_offset, desc_buf, param_size);
> -	pm_runtime_put_sync(hba->dev);
> +	ufshcd_rpm_put_sync(hba);
>  	if (ret) {
>  		ret = -EINVAL;
>  		goto out;
> @@ -678,7 +678,7 @@ static ssize_t _name##_show(struct device *dev,				\
>  		up(&hba->host_sem);					\
>  		return -ENOMEM;						\
>  	}								\
> -	pm_runtime_get_sync(hba->dev);					\
> +	ufshcd_rpm_get_sync(hba);					\
>  	ret = ufshcd_query_descriptor_retry(hba,			\
>  		UPIU_QUERY_OPCODE_READ_DESC, QUERY_DESC_IDN_DEVICE,	\
>  		0, 0, desc_buf, &desc_len);				\
> @@ -695,7 +695,7 @@ static ssize_t _name##_show(struct device *dev,				\
>  		goto out;						\
>  	ret = sysfs_emit(buf, "%s\n", desc_buf);			\
>  out:									\
> -	pm_runtime_put_sync(hba->dev);					\
> +	ufshcd_rpm_put_sync(hba);					\
>  	kfree(desc_buf);						\
>  	up(&hba->host_sem);						\
>  	return ret;							\
> @@ -744,10 +744,10 @@ static ssize_t _name##_show(struct device *dev,				\
>  	}								\
>  	if (ufshcd_is_wb_flags(QUERY_FLAG_IDN##_uname))			\
>  		index = ufshcd_wb_get_query_index(hba);			\
> -	pm_runtime_get_sync(hba->dev);					\
> +	ufshcd_rpm_get_sync(hba);					\
>  	ret = ufshcd_query_flag(hba, UPIU_QUERY_OPCODE_READ_FLAG,	\
>  		QUERY_FLAG_IDN##_uname, index, &flag);			\
> -	pm_runtime_put_sync(hba->dev);					\
> +	ufshcd_rpm_put_sync(hba);					\
>  	if (ret) {							\
>  		ret = -EINVAL;						\
>  		goto out;						\
> @@ -813,10 +813,10 @@ static ssize_t _name##_show(struct device *dev,				\
>  	}								\
>  	if (ufshcd_is_wb_attrs(QUERY_ATTR_IDN##_uname))			\
>  		index = ufshcd_wb_get_query_index(hba);			\
> -	pm_runtime_get_sync(hba->dev);					\
> +	ufshcd_rpm_get_sync(hba);					\
>  	ret = ufshcd_query_attr(hba, UPIU_QUERY_OPCODE_READ_ATTR,	\
>  		QUERY_ATTR_IDN##_uname, index, 0, &value);		\
> -	pm_runtime_put_sync(hba->dev);					\
> +	ufshcd_rpm_put_sync(hba);					\
>  	if (ret) {							\
>  		ret = -EINVAL;						\
>  		goto out;						\
> @@ -964,10 +964,10 @@ static ssize_t dyn_cap_needed_attribute_show(struct device *dev,
>  		goto out;
>  	}
>  
> -	pm_runtime_get_sync(hba->dev);
> +	ufshcd_rpm_get_sync(hba);
>  	ret = ufshcd_query_attr(hba, UPIU_QUERY_OPCODE_READ_ATTR,
>  		QUERY_ATTR_IDN_DYN_CAP_NEEDED, lun, 0, &value);
> -	pm_runtime_put_sync(hba->dev);
> +	ufshcd_rpm_put_sync(hba);
>  	if (ret) {
>  		ret = -EINVAL;
>  		goto out;
> 

