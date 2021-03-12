Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E218338328
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Mar 2021 02:26:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231355AbhCLBZl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Mar 2021 20:25:41 -0500
Received: from z11.mailgun.us ([104.130.96.11]:19975 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229938AbhCLBZe (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Mar 2021 20:25:34 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1615512334; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Sw3XYq/LrqNLsdOODZEHoBFop8prnFWrf9gqcscm8q8=;
 b=ZoGFJCCB6vmBNdbi02NV+ILzMPYtItFj9HAvoc5+C1KoH3KlrXWnZGJSwHT8DTkSub/JuYAD
 C6QU/7caVDCxyskxZkwzsciYH9QmgILQuZsrMgCNc2iBOCwI8MVfidRm6pSlWvy2kT3f0QgA
 f3Lhld0W6wzzlc8HrL/42Upim1c=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 604ac2fc1de5dd7b9930fdd1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 12 Mar 2021 01:25:16
 GMT
Sender: cang=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 49087C43466; Fri, 12 Mar 2021 01:25:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: cang)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1F4C8C433CA;
        Fri, 12 Mar 2021 01:25:14 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 12 Mar 2021 09:25:14 +0800
From:   Can Guo <cang@codeaurora.org>
To:     Asutosh Das <asutoshd@codeaurora.org>
Cc:     martin.petersen@oracle.com, adrian.hunter@intel.com,
        linux-scsi@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Bean Huo <beanhuo@micron.com>,
        Nitin Rawat <nitirawa@codeaurora.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 2/2] ufs: sysfs: Resume the proper scsi device
In-Reply-To: <fb3b49a985cea12b4db39f00d920c82a7c8be468.1615500685.git.asutoshd@codeaurora.org>
References: <cover.1615500685.git.asutoshd@codeaurora.org>
 <fb3b49a985cea12b4db39f00d920c82a7c8be468.1615500685.git.asutoshd@codeaurora.org>
Message-ID: <c285d5d0b34c3375436724e43644efa5@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-03-12 06:19, Asutosh Das wrote:
> Resumes the actual scsi device the unit descriptor of which
> is being accessed instead of the hba alone.
> 
> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>

You lost my reviewed-by:

reviewed-by: Can Guo <cang@codeaurora.org>

> ---
>  drivers/scsi/ufs/ufs-sysfs.c | 30 +++++++++++++++++-------------
>  1 file changed, 17 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/scsi/ufs/ufs-sysfs.c 
> b/drivers/scsi/ufs/ufs-sysfs.c
> index acc54f5..3fc182b 100644
> --- a/drivers/scsi/ufs/ufs-sysfs.c
> +++ b/drivers/scsi/ufs/ufs-sysfs.c
> @@ -245,9 +245,9 @@ static ssize_t wb_on_store(struct device *dev,
> struct device_attribute *attr,
>  		goto out;
>  	}
> 
> -	pm_runtime_get_sync(hba->dev);
> +	scsi_autopm_get_device(hba->sdev_ufs_device);
>  	res = ufshcd_wb_ctrl(hba, wb_enable);
> -	pm_runtime_put_sync(hba->dev);
> +	scsi_autopm_put_device(hba->sdev_ufs_device);
>  out:
>  	up(&hba->host_sem);
>  	return res < 0 ? res : count;
> @@ -297,10 +297,10 @@ static ssize_t ufs_sysfs_read_desc_param(struct
> ufs_hba *hba,
>  		goto out;
>  	}
> 
> -	pm_runtime_get_sync(hba->dev);
> +	scsi_autopm_get_device(hba->sdev_ufs_device);
>  	ret = ufshcd_read_desc_param(hba, desc_id, desc_index,
>  				param_offset, desc_buf, param_size);
> -	pm_runtime_put_sync(hba->dev);
> +	scsi_autopm_put_device(hba->sdev_ufs_device);
>  	if (ret) {
>  		ret = -EINVAL;
>  		goto out;
> @@ -678,7 +678,7 @@ static ssize_t _name##_show(struct device 
> *dev,				\
>  		up(&hba->host_sem);					\
>  		return -ENOMEM;						\
>  	}								\
> -	pm_runtime_get_sync(hba->dev);					\
> +	scsi_autopm_get_device(hba->sdev_ufs_device);			\
>  	ret = ufshcd_query_descriptor_retry(hba,			\
>  		UPIU_QUERY_OPCODE_READ_DESC, QUERY_DESC_IDN_DEVICE,	\
>  		0, 0, desc_buf, &desc_len);				\
> @@ -695,7 +695,7 @@ static ssize_t _name##_show(struct device 
> *dev,				\
>  		goto out;						\
>  	ret = sysfs_emit(buf, "%s\n", desc_buf);			\
>  out:									\
> -	pm_runtime_put_sync(hba->dev);					\
> +	scsi_autopm_put_device(hba->sdev_ufs_device);			\
>  	kfree(desc_buf);						\
>  	up(&hba->host_sem);						\
>  	return ret;							\
> @@ -744,10 +744,10 @@ static ssize_t _name##_show(struct device 
> *dev,				\
>  	}								\
>  	if (ufshcd_is_wb_flags(QUERY_FLAG_IDN##_uname))			\
>  		index = ufshcd_wb_get_query_index(hba);			\
> -	pm_runtime_get_sync(hba->dev);					\
> +	scsi_autopm_get_device(hba->sdev_ufs_device);			\
>  	ret = ufshcd_query_flag(hba, UPIU_QUERY_OPCODE_READ_FLAG,	\
>  		QUERY_FLAG_IDN##_uname, index, &flag);			\
> -	pm_runtime_put_sync(hba->dev);					\
> +	scsi_autopm_put_device(hba->sdev_ufs_device);			\
>  	if (ret) {							\
>  		ret = -EINVAL;						\
>  		goto out;						\
> @@ -813,10 +813,10 @@ static ssize_t _name##_show(struct device 
> *dev,				\
>  	}								\
>  	if (ufshcd_is_wb_attrs(QUERY_ATTR_IDN##_uname))			\
>  		index = ufshcd_wb_get_query_index(hba);			\
> -	pm_runtime_get_sync(hba->dev);					\
> +	scsi_autopm_get_device(hba->sdev_ufs_device);			\
>  	ret = ufshcd_query_attr(hba, UPIU_QUERY_OPCODE_READ_ATTR,	\
>  		QUERY_ATTR_IDN##_uname, index, 0, &value);		\
> -	pm_runtime_put_sync(hba->dev);					\
> +	scsi_autopm_put_device(hba->sdev_ufs_device);			\
>  	if (ret) {							\
>  		ret = -EINVAL;						\
>  		goto out;						\
> @@ -899,11 +899,15 @@ static ssize_t _pname##_show(struct device 
> *dev,			\
>  	struct scsi_device *sdev = to_scsi_device(dev);			\
>  	struct ufs_hba *hba = shost_priv(sdev->host);			\
>  	u8 lun = ufshcd_scsi_to_upiu_lun(sdev->lun);			\
> +	int ret;							\
>  	if (!ufs_is_valid_unit_desc_lun(&hba->dev_info, lun,		\
>  				_duname##_DESC_PARAM##_puname))		\
>  		return -EINVAL;						\
> -	return ufs_sysfs_read_desc_param(hba, QUERY_DESC_IDN_##_duname,	\
> +	scsi_autopm_get_device(sdev);					\
> +	ret = ufs_sysfs_read_desc_param(hba, QUERY_DESC_IDN_##_duname,	\
>  		lun, _duname##_DESC_PARAM##_puname, buf, _size);	\
> +	scsi_autopm_put_device(sdev);					\
> +	return ret;							\
>  }									\
>  static DEVICE_ATTR_RO(_pname)
> 
> @@ -964,10 +968,10 @@ static ssize_t
> dyn_cap_needed_attribute_show(struct device *dev,
>  		goto out;
>  	}
> 
> -	pm_runtime_get_sync(hba->dev);
> +	scsi_autopm_get_device(hba->sdev_ufs_device);
>  	ret = ufshcd_query_attr(hba, UPIU_QUERY_OPCODE_READ_ATTR,
>  		QUERY_ATTR_IDN_DYN_CAP_NEEDED, lun, 0, &value);
> -	pm_runtime_put_sync(hba->dev);
> +	scsi_autopm_put_device(hba->sdev_ufs_device);
>  	if (ret) {
>  		ret = -EINVAL;
>  		goto out;
