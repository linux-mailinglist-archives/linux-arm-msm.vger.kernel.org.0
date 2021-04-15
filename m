Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C11B53615E3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Apr 2021 01:12:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235285AbhDOXLv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Apr 2021 19:11:51 -0400
Received: from mail-pf1-f176.google.com ([209.85.210.176]:45965 "EHLO
        mail-pf1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234961AbhDOXLu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Apr 2021 19:11:50 -0400
Received: by mail-pf1-f176.google.com with SMTP id i190so17081259pfc.12;
        Thu, 15 Apr 2021 16:11:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rNjHSpqMp6OHOOifvMxrtpdA3iLbXLeekducnpNQE7w=;
        b=MiSRwqvEqdl2VlZWjyVzbbS56nB2Q07WumuToSc0YC6/+CAqoucl2q6hG28HoV/X0u
         HwYBrDp0C8IraA4Z/vkygnzGqGMNDiXH2e8piAJ+X74i9n86LZ4yG5+twIiL4twhSBOJ
         sysNKprGW2kAJ/j+s9QbywkG3e4ulDCwVsQ9lmkQkL/hlC0WDwFvsj8e/oAaVtTiAkuk
         /1cOmW9fHBXrOPYiwlRzlX5nftl8Q9Jt4vcalMoJTD2xpjnH7DoHWq2E7EqlxgXAkiGe
         u5xNi+zcaOujswyBYebqTMe783EN9HuCRPueLsO8mGO8yT1D30Gc26nZSOBKh/UHQg78
         4cAA==
X-Gm-Message-State: AOAM530+q/hUfG/ZFbV/cGSiJ+hH7SdAnhteP3qTZQef4/jRHREnAUHU
        C/plhRE9JjPLJRYptZqt7zI=
X-Google-Smtp-Source: ABdhPJy84p+UP8x2TOnFbzVUyWQ0RVl+Q/N1HMNE6piAjW8rXbWFlCGcJH7JyP2QKJDL0IWfjfed+w==
X-Received: by 2002:a63:7c59:: with SMTP id l25mr5632368pgn.224.1618528286855;
        Thu, 15 Apr 2021 16:11:26 -0700 (PDT)
Received: from ?IPv6:2601:647:4000:d7:f031:1d3a:7e95:2876? ([2601:647:4000:d7:f031:1d3a:7e95:2876])
        by smtp.gmail.com with ESMTPSA id z23sm3375309pjh.45.2021.04.15.16.11.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Apr 2021 16:11:25 -0700 (PDT)
Subject: Re: [PATCH v18 1/2] scsi: ufs: Enable power management for wlun
To:     Asutosh Das <asutoshd@codeaurora.org>, cang@codeaurora.org,
        martin.petersen@oracle.com, adrian.hunter@intel.com,
        linux-scsi@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Pedro Sousa <pedrom.sousa@synopsys.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Bean Huo <beanhuo@micron.com>,
        Kiwoong Kim <kwmad.kim@samsung.com>,
        Yue Hu <huyue2@yulong.com>,
        Wei Yongjun <weiyongjun1@huawei.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Dinghao Liu <dinghao.liu@zju.edu.cn>,
        Jaegeuk Kim <jaegeuk@kernel.org>,
        Satya Tangirala <satyat@google.com>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" 
        <linux-samsung-soc@vger.kernel.org>,
        "moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..." 
        <linux-mediatek@lists.infradead.org>
References: <cover.1618426513.git.asutoshd@codeaurora.org>
 <d1a6af736730b9d79f977100286c5d9325546ac2.1618426513.git.asutoshd@codeaurora.org>
From:   Bart Van Assche <bvanassche@acm.org>
Message-ID: <f111e363-c709-fe3c-65da-450c9e9e3408@acm.org>
Date:   Thu, 15 Apr 2021 16:11:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <d1a6af736730b9d79f977100286c5d9325546ac2.1618426513.git.asutoshd@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 4/14/21 11:58 AM, Asutosh Das wrote:
> [ ... ]

Patches sent to the SCSI mailing list should not have a "scsi: " prefix
in the subject. That prefix is inserted before any SCSI patches go into
Martin's tree.

> diff --git a/drivers/scsi/ufs/cdns-pltfrm.c b/drivers/scsi/ufs/cdns-pltfrm.c
> index 13d9204..b9105e4 100644
> --- a/drivers/scsi/ufs/cdns-pltfrm.c
> +++ b/drivers/scsi/ufs/cdns-pltfrm.c
> @@ -323,6 +323,8 @@ static const struct dev_pm_ops cdns_ufs_dev_pm_ops = {
>  	.runtime_suspend = ufshcd_pltfrm_runtime_suspend,
>  	.runtime_resume  = ufshcd_pltfrm_runtime_resume,
>  	.runtime_idle    = ufshcd_pltfrm_runtime_idle,
> +	.prepare	 = ufshcd_suspend_prepare,
> +	.complete	= ufshcd_resume_complete,
>  };
>  
>  static struct platform_driver cdns_ufs_pltfrm_driver = {
> diff --git a/drivers/scsi/ufs/tc-dwc-g210-pci.c b/drivers/scsi/ufs/tc-dwc-g210-pci.c
> index 67a6a61..b01db12 100644
> --- a/drivers/scsi/ufs/tc-dwc-g210-pci.c
> +++ b/drivers/scsi/ufs/tc-dwc-g210-pci.c
> @@ -148,6 +148,8 @@ static const struct dev_pm_ops tc_dwc_g210_pci_pm_ops = {
>  	.runtime_suspend = tc_dwc_g210_pci_runtime_suspend,
>  	.runtime_resume  = tc_dwc_g210_pci_runtime_resume,
>  	.runtime_idle    = tc_dwc_g210_pci_runtime_idle,
> +	.prepare	 = ufshcd_suspend_prepare,
> +	.complete	= ufshcd_resume_complete,
>  };

[ ... ]

> --- a/drivers/scsi/ufs/ufs-exynos.c
> +++ b/drivers/scsi/ufs/ufs-exynos.c
> @@ -1267,6 +1267,8 @@ static const struct dev_pm_ops exynos_ufs_pm_ops = {
>  	.runtime_suspend = ufshcd_pltfrm_runtime_suspend,
>  	.runtime_resume  = ufshcd_pltfrm_runtime_resume,
>  	.runtime_idle    = ufshcd_pltfrm_runtime_idle,
> +	.prepare	 = ufshcd_suspend_prepare,
> +	.complete	= ufshcd_resume_complete,
>  };
>  
>  static struct platform_driver exynos_ufs_pltform = {
> diff --git a/drivers/scsi/ufs/ufs-hisi.c b/drivers/scsi/ufs/ufs-hisi.c
> index 0aa5813..d463b44 100644
> --- a/drivers/scsi/ufs/ufs-hisi.c
> +++ b/drivers/scsi/ufs/ufs-hisi.c
> @@ -574,6 +574,8 @@ static const struct dev_pm_ops ufs_hisi_pm_ops = {
>  	.runtime_suspend = ufshcd_pltfrm_runtime_suspend,
>  	.runtime_resume  = ufshcd_pltfrm_runtime_resume,
>  	.runtime_idle    = ufshcd_pltfrm_runtime_idle,
> +	.prepare	 = ufshcd_suspend_prepare,
> +	.complete	= ufshcd_resume_complete,
>  };

A minor comment about source code formatting: please make sure that the
equality signs are aligned in struct dev_pm_ops definitions.

> +static inline bool is_rpmb_wlun(struct scsi_device *sdev)
> +{
> +	return (sdev->lun == ufshcd_upiu_wlun_to_scsi_wlun(UFS_UPIU_RPMB_WLUN));
> +}
> +
> +static inline bool is_device_wlun(struct scsi_device *sdev)
> +{
> +	return (sdev->lun ==
> +		ufshcd_upiu_wlun_to_scsi_wlun(UFS_UPIU_UFS_DEVICE_WLUN));
> +}

The Linux kernel coding style requires not to surround expressions with
parentheses in return statements.

>  /**
> + * ufshcd_setup_links - associate link b/w device wlun and other luns
> + * @sdev: pointer to SCSI device
> + * @hba: pointer to ufs hba
> + */
> +static void ufshcd_setup_links(struct ufs_hba *hba, struct scsi_device *sdev)
> +{
> +	struct device_link *link;
> +
> +	/*
> +	 * device wlun is the supplier & rest of the luns are consumers
> +	 * This ensures that device wlun suspends after all other luns.
> +	 */
> +	if (hba->sdev_ufs_device) {
> +		link = device_link_add(&sdev->sdev_gendev,
> +				       &hba->sdev_ufs_device->sdev_gendev,
> +				       DL_FLAG_PM_RUNTIME|DL_FLAG_RPM_ACTIVE);
> +		if (!link) {
> +			dev_err(&sdev->sdev_gendev, "Failed establishing link - %s\n",
> +				dev_name(&hba->sdev_ufs_device->sdev_gendev));
> +			return;
> +		}
> +		hba->luns_avail--;
> +		/* Ignore REPORT_LUN wlun probing */
> +		if (hba->luns_avail == 1) {
> +			ufshcd_rpm_put(hba);
> +			return;
> +		}
> +	} else {
> +		/* device wlun is probed */
> +		hba->luns_avail--;
> +	}
> +}

Please add a comment that explains that it is assumed that the WLUNs are
scanned before the other LUNs.

> @@ -4862,8 +4913,13 @@ static int ufshcd_slave_configure(struct scsi_device *sdev)
>  	blk_queue_update_dma_pad(q, PRDT_DATA_BYTE_COUNT_PAD - 1);
>  	if (hba->quirks & UFSHCD_QUIRK_ALIGN_SG_WITH_PAGE_SIZE)
>  		blk_queue_update_dma_alignment(q, PAGE_SIZE - 1);
> -
> -	if (ufshcd_is_rpm_autosuspend_allowed(hba))
> +	/*
> +	 * Block runtime-pm until all consumers are added.
> +	 * Refer ufshcd_setup_links().
> +	 */
> +	if (is_device_wlun(sdev))
> +		pm_runtime_get_noresume(&sdev->sdev_gendev);
> +	else if (ufshcd_is_rpm_autosuspend_allowed(hba))
>  		sdev->rpm_autosuspend = 1;
>  
>  	ufshcd_crypto_setup_rq_keyslot_manager(hba, q);

The following code is executed before ufshcd_async_scan() is called:

	dev = hba->dev;
	[ ... ]
	/* Hold auto suspend until async scan completes */
	pm_runtime_get_sync(dev);

and the following code occurs in ufshcd_add_lus():

	pm_runtime_put_sync(hba->dev);

Isn't that sufficient to postpone enabling of runtime PM until LUN
scanning has finished? Or in other words, is adding a
pm_runtime_get_noresume() call in ufshcd_slave_configure() really necessary?

> @@ -4979,15 +5035,9 @@ ufshcd_transfer_rsp_status(struct ufs_hba *hba, struct ufshcd_lrb *lrbp)
>  			 */
>  			if (!hba->pm_op_in_progress &&
>  			    !ufshcd_eh_in_progress(hba) &&
> -			    ufshcd_is_exception_event(lrbp->ucd_rsp_ptr) &&
> -			    schedule_work(&hba->eeh_work)) {
> -				/*
> -				 * Prevent suspend once eeh_work is scheduled
> -				 * to avoid deadlock between ufshcd_suspend
> -				 * and exception event handler.
> -				 */
> -				pm_runtime_get_noresume(hba->dev);
> -			}
> +			    ufshcd_is_exception_event(lrbp->ucd_rsp_ptr))
> +				/* Flushed in suspend */
> +				schedule_work(&hba->eeh_work);

What makes it safe to leave out the above pm_runtime_get_noresume() call?

Thanks,

Bart.
