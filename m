Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F16DA54F85
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2019 15:02:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727227AbfFYNCS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jun 2019 09:02:18 -0400
Received: from mailout2.samsung.com ([203.254.224.25]:13503 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728507AbfFYNCS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jun 2019 09:02:18 -0400
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20190625130215epoutp028c446e38c9c30ae98345bf6d7262a837~rcqHXDTtQ2937429374epoutp02e
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2019 13:02:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20190625130215epoutp028c446e38c9c30ae98345bf6d7262a837~rcqHXDTtQ2937429374epoutp02e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1561467735;
        bh=1mfCW/D0RvA9qgVuTZWRRLeacuSFvpug25rw8ivnGkE=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=UDobX6GWkv6jtBcI5pdVOi3ojv1Z/LhJh6JK7gU1PMBLKMlVKAJaZt5k+BMA3QDGP
         xaa0VNa0sdi7+3s9FSHsudo/RexyOorTbh73BEX5QqoS0CBtUU0m7ceoGd0JIgxFhR
         M0EuOqS/r8CcRITeBoug3CbB6oOLepkmzbTDrCEw=
Received: from epsmges5p3new.samsung.com (unknown [182.195.42.75]) by
        epcas5p1.samsung.com (KnoxPortal) with ESMTP id
        20190625130214epcas5p1b5abed54d0f40c0dfa17e35ef4c14060~rcqHCuiRY0738707387epcas5p1o;
        Tue, 25 Jun 2019 13:02:14 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
        epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
        DC.CE.04067.65B121D5; Tue, 25 Jun 2019 22:02:14 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
        20190625130214epcas5p39bf94a9a6d46d83c9da55df0eb8e3df1~rcqGVA_o62450024500epcas5p3k;
        Tue, 25 Jun 2019 13:02:14 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190625130214epsmtrp25225908f950faabb0dd1de864cbbce03~rcqGUPivn0790407904epsmtrp2u;
        Tue, 25 Jun 2019 13:02:14 +0000 (GMT)
X-AuditID: b6c32a4b-7a3ff70000000fe3-f5-5d121b56fc76
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
        27.FF.03662.55B121D5; Tue, 25 Jun 2019 22:02:13 +0900 (KST)
Received: from [107.108.73.28] (unknown [107.108.73.28]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190625130212epsmtip2ef4a176364b84106f7faf62e3d3ebc4a~rcqEgAkIx0459504595epsmtip2U;
        Tue, 25 Jun 2019 13:02:12 +0000 (GMT)
Subject: Re: [PATCH v3 1/3] scsi: ufs: Introduce vops for resetting device
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Avri Altman <avri.altman@wdc.com>,
        Pedro Sousa <pedrom.sousa@synopsys.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-scsi@vger.kernel.org
From:   Alim Akhtar <alim.akhtar@samsung.com>
Message-ID: <ad1c2a2a-91d6-25ce-9dfb-3b386b572ee2@samsung.com>
Date:   Tue, 25 Jun 2019 18:11:24 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190608050450.12056-2-bjorn.andersson@linaro.org>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02SeUgUcRTH+83Mzo7iys/V8qWRsaWQkZYHDRQmXQzaBdGJlkNOarrrsuuR
        USHaqR2aVLa5aoIaJkWbeIuyLR5YZtqqiEHYFmlkpqslhuQ4Rv73ee993/v+3uPHkEqrzIOJ
        0yQJOg2foKIdqepX6303HvFURm5qaAxguz7NUuzIjJVmO5vHKLbI0iVjSwaqCTa3+Y2c7a0v
        oNns/lqaLe1/R7DlbXMEe7l1imKvNFnkoU5cZWEl4kwVN2huqK+R5nJKWhD38/MgxVU1TyJu
        0rSau9aSTRxkTjhuixYS4lIEnX9IlGPso8ZxpH2x4pzVWClPRyMuWciBARwE9l6bLAs5Mkrc
        gODtx3eLwQSCiXwbIQXTCNpr7xH/WqzfyiiRlbgJwag9QBJ9R5CXcx+JBVccBlmXByix4IaH
        57tvz8rFgMQ2BANzGQsqGm+ADw+qFsYqcAhYhnpokSnsDTXGaZnIy/Ex6K2qR5LGBToe2uan
        MowDDgVLXbKYJrE7DNqKCIm9oOZ7ASl6AS6RQ8ZT++Kzd0Fn5UtSYlcYbauSS+wBk2NNtDgT
        cDzcrA+U0hegtLCVkng7tLwvWLAl8Xp4Xu8vWTnDrVnxQmKnAq5fVUpqb8gcsy52ekJudrZM
        Yg76Mp4g6VYdCKbKjSgHrTEsWcywZBvDkm0M/52LEVWBVgpavTpG0AdrAzVCqp+eV+uTNTF+
        pxPVJrTw2XzDa5Gpa68ZYQapnBS/W3GkUsan6NPUZgQMqXJTlPLzKUU0n3Ze0CWe0iUnCHoz
        8mQolbvirswaocQxfJIQLwhaQfevSjAOHulIWx1z3H5mzxxx/tKv/N2r9ge3W7wy73np/qzr
        iP02PlrdLK9zcbsalHpoxnvLmi/OaXyUz/SOZUfnTmGfwsMnn5etvWOyJ9sL97Kk884Irc5p
        z1Z7XpixLjFYLe/5cdL6bLi7QvM4/LU2Pt1mqT17MWmf8auvObXb4J4V3bmj2HxARelj+c2+
        pE7P/wUN40LhaAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRmVeSWpSXmKPExsWy7bCSvG6otFCswcQWG4tzj3+zWLz8eZXN
        4vT+dywW84+cY7VYdGMbk8XE/WfZLS7vmsNm0X19B5vF0usXmSyWH//HZNFy7CuLReveI+wO
        PB5r5q1h9Ni0qpPN4861PWweExYdYPT4+PQWi8eW/Z8ZPT5vkvNoP9DNFMARxWWTkpqTWZZa
        pG+XwJUxe88HxoKNYhVX565hb2B8KdjFyMkhIWAicfX1MpYuRi4OIYHdjBLTNy5lgkhIS1zf
        OIEdwhaWWPnvOTtE0WtGiSXPtrKAJIQFvCS6Wm6AdYsIPGKUmHZjETOIwyzwBKhq2XuwKiGB
        k4wSf19GgNhsAtoSd6dvAVvBK2AnceTOJTYQm0VAVWL73G+sILaoQIREX9tsNogaQYmTM58A
        zeHg4BRwkDiysxQkzCxgJjFv80NmCFtc4taT+UwQtrzE9rdzmCcwCs1C0j0LScssJC2zkLQs
        YGRZxSiZWlCcm55bbFhglJdarlecmFtcmpeul5yfu4kRHIlaWjsYT5yIP8QowMGoxMO74IhA
        rBBrYllxZe4hRgkOZiUR3qWJQCHelMTKqtSi/Pii0pzU4kOM0hwsSuK88vnHIoUE0hNLUrNT
        UwtSi2CyTBycUg2MmbOjNdZNUNW5GNMxYY94V+OygKliNnuPCTj98emdlG3256x83kHNyc9v
        OWzdpu5xb3rCbq+7G2ucbih4T425wjfLcJHYlbVVyZvUtesmGDQG+c5ONVUWnLPsolra5w+z
        diaz5diKT+f0fxpTw3laM13s3qWGDK+vuqe/Cm96U9Ry8tKSi0+UlFiKMxINtZiLihMBZOtz
        EsACAAA=
X-CMS-MailID: 20190625130214epcas5p39bf94a9a6d46d83c9da55df0eb8e3df1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-CMS-RootMailID: 20190608050458epcas1p30f03f6d448eb962a6af56a4c0b021ef0
References: <20190608050450.12056-1-bjorn.andersson@linaro.org>
        <CGME20190608050458epcas1p30f03f6d448eb962a6af56a4c0b021ef0@epcas1p3.samsung.com>
        <20190608050450.12056-2-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,
Are you planning to address Bean's comment on patch#2 and want to 
re-spin this series?
I am ok with taking this patch as it is and take a Softreset patch as a 
separate patch.

On 6/8/19 10:34 AM, Bjorn Andersson wrote:
> Some UFS memory devices needs their reset line toggled in order to get
> them into a good state for initialization. Provide a new vops to allow
> the platform driver to implement this operation.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
feel free to add
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
> 
> Changes since v2:
> - New patch, to allow moving implementation to platform driver
> 
>   drivers/scsi/ufs/ufshcd.c | 6 ++++++
>   drivers/scsi/ufs/ufshcd.h | 8 ++++++++
>   2 files changed, 14 insertions(+)
> 
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> index 04d3686511c8..ee895a625456 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -6191,6 +6191,9 @@ static int ufshcd_reset_and_restore(struct ufs_hba *hba)
>   	int retries = MAX_HOST_RESET_RETRIES;
>   
>   	do {
> +		/* Reset the attached device */
> +		ufshcd_vops_device_reset(hba);
> +
>   		err = ufshcd_host_reset_and_restore(hba);
>   	} while (err && --retries);
>   
> @@ -8322,6 +8325,9 @@ int ufshcd_init(struct ufs_hba *hba, void __iomem *mmio_base, unsigned int irq)
>   		goto exit_gating;
>   	}
>   
> +	/* Reset the attached device */
> +	ufshcd_vops_device_reset(hba);
> +
>   	/* Host controller enable */
>   	err = ufshcd_hba_enable(hba);
>   	if (err) {
> diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
> index 994d73d03207..cd8139052ed6 100644
> --- a/drivers/scsi/ufs/ufshcd.h
> +++ b/drivers/scsi/ufs/ufshcd.h
> @@ -298,6 +298,7 @@ struct ufs_pwr_mode_info {
>    * @resume: called during host controller PM callback
>    * @dbg_register_dump: used to dump controller debug information
>    * @phy_initialization: used to initialize phys
> + * @device_reset: called to issue a reset pulse on the UFS device
>    */
>   struct ufs_hba_variant_ops {
>   	const char *name;
> @@ -326,6 +327,7 @@ struct ufs_hba_variant_ops {
>   	int     (*resume)(struct ufs_hba *, enum ufs_pm_op);
>   	void	(*dbg_register_dump)(struct ufs_hba *hba);
>   	int	(*phy_initialization)(struct ufs_hba *);
> +	void	(*device_reset)(struct ufs_hba *);
>   };
>   
>   /* clock gating state  */
> @@ -1045,6 +1047,12 @@ static inline void ufshcd_vops_dbg_register_dump(struct ufs_hba *hba)
>   		hba->vops->dbg_register_dump(hba);
>   }
>   
> +static inline void ufshcd_vops_device_reset(struct ufs_hba *hba)
> +{
> +	if (hba->vops && hba->vops->device_reset)
> +		hba->vops->device_reset(hba);
> +}
> +
>   extern struct ufs_pm_lvl_states ufs_pm_lvl_states[];
>   
>   /*
> 
