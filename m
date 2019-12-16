Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DA631219A9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2019 20:06:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726858AbfLPTEX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Dec 2019 14:04:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:59832 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726390AbfLPTEX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Dec 2019 14:04:23 -0500
Received: from localhost (unknown [122.182.192.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3CF892064B;
        Mon, 16 Dec 2019 19:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576523062;
        bh=n2niy3GX1/9dWzk5LJO7Idaltrdy2g6TUiU7ytqHdg4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GrLm1kH8cGzprX5bRAdC9IFHf9PwgtB3rDM9Y1Rh4KyynOYRUxfFrdcO29vCOgCfS
         S14SXrlvWYR1u/7RD/9MEzzKGP8YrjBDnYATHx8f8RDGUaSe7IQR9yNwwfN3hJH8Tj
         MPM1KdIkBgL+6AY5w0e50P3IClgXBBcMGsxm00ao=
Date:   Tue, 17 Dec 2019 00:34:15 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Can Guo <cang@codeaurora.org>
Cc:     asutoshd@codeaurora.org, nguyenb@codeaurora.org,
        rnayak@codeaurora.org, linux-scsi@vger.kernel.org,
        kernel-team@android.com, saravanak@google.com, salyzyn@google.com,
        Andy Gross <agross@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Pedro Sousa <pedrom.sousa@synopsys.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 2/7] scsi: ufs-qcom: Add reset control support for
 host controller
Message-ID: <20191216190415.GL2536@vkoul-mobl>
References: <1573798172-20534-1-git-send-email-cang@codeaurora.org>
 <1573798172-20534-3-git-send-email-cang@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1573798172-20534-3-git-send-email-cang@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Can,

On 14-11-19, 22:09, Can Guo wrote:
> Add reset control for host controller so that host controller can be reset
> as required in its power up sequence.

I am seeing a regression on UFS on SM8150-mtp with this patch. I think
Jeff is seeing same one lenove laptop on 8998.

845 does not seem to have this issue and only thing I can see is that on
sm8150 and 8998 we define reset as:

                        resets = <&gcc GCC_UFS_BCR>;
                        reset-names = "rst";

Thanks

> 
> Signed-off-by: Can Guo <cang@codeaurora.org>
> ---
>  drivers/scsi/ufs/ufs-qcom.c | 53 +++++++++++++++++++++++++++++++++++++++++++++
>  drivers/scsi/ufs/ufs-qcom.h |  3 +++
>  2 files changed, 56 insertions(+)
> 
> diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
> index a5b7148..c69c29a1c 100644
> --- a/drivers/scsi/ufs/ufs-qcom.c
> +++ b/drivers/scsi/ufs/ufs-qcom.c
> @@ -246,6 +246,44 @@ static void ufs_qcom_select_unipro_mode(struct ufs_qcom_host *host)
>  	mb();
>  }
>  
> +/**
> + * ufs_qcom_host_reset - reset host controller and PHY
> + */
> +static int ufs_qcom_host_reset(struct ufs_hba *hba)
> +{
> +	int ret = 0;
> +	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> +
> +	if (!host->core_reset) {
> +		dev_warn(hba->dev, "%s: reset control not set\n", __func__);
> +		goto out;
> +	}
> +
> +	ret = reset_control_assert(host->core_reset);
> +	if (ret) {
> +		dev_err(hba->dev, "%s: core_reset assert failed, err = %d\n",
> +				 __func__, ret);
> +		goto out;
> +	}
> +
> +	/*
> +	 * The hardware requirement for delay between assert/deassert
> +	 * is at least 3-4 sleep clock (32.7KHz) cycles, which comes to
> +	 * ~125us (4/32768). To be on the safe side add 200us delay.
> +	 */
> +	usleep_range(200, 210);
> +
> +	ret = reset_control_deassert(host->core_reset);
> +	if (ret)
> +		dev_err(hba->dev, "%s: core_reset deassert failed, err = %d\n",
> +				 __func__, ret);
> +
> +	usleep_range(1000, 1100);
> +
> +out:
> +	return ret;
> +}
> +
>  static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)
>  {
>  	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> @@ -254,6 +292,12 @@ static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)
>  	bool is_rate_B = (UFS_QCOM_LIMIT_HS_RATE == PA_HS_MODE_B)
>  							? true : false;
>  
> +	/* Reset UFS Host Controller and PHY */
> +	ret = ufs_qcom_host_reset(hba);
> +	if (ret)
> +		dev_warn(hba->dev, "%s: host reset returned %d\n",
> +				  __func__, ret);
> +
>  	if (is_rate_B)
>  		phy_set_mode(phy, PHY_MODE_UFS_HS_B);
>  
> @@ -1101,6 +1145,15 @@ static int ufs_qcom_init(struct ufs_hba *hba)
>  	host->hba = hba;
>  	ufshcd_set_variant(hba, host);
>  
> +	/* Setup the reset control of HCI */
> +	host->core_reset = devm_reset_control_get(hba->dev, "rst");
> +	if (IS_ERR(host->core_reset)) {
> +		err = PTR_ERR(host->core_reset);
> +		dev_warn(dev, "Failed to get reset control %d\n", err);
> +		host->core_reset = NULL;
> +		err = 0;
> +	}
> +
>  	/* Fire up the reset controller. Failure here is non-fatal. */
>  	host->rcdev.of_node = dev->of_node;
>  	host->rcdev.ops = &ufs_qcom_reset_ops;
> diff --git a/drivers/scsi/ufs/ufs-qcom.h b/drivers/scsi/ufs/ufs-qcom.h
> index d401f17..2d95e7c 100644
> --- a/drivers/scsi/ufs/ufs-qcom.h
> +++ b/drivers/scsi/ufs/ufs-qcom.h
> @@ -6,6 +6,7 @@
>  #define UFS_QCOM_H_
>  
>  #include <linux/reset-controller.h>
> +#include <linux/reset.h>
>  
>  #define MAX_UFS_QCOM_HOSTS	1
>  #define MAX_U32                 (~(u32)0)
> @@ -233,6 +234,8 @@ struct ufs_qcom_host {
>  	u32 dbg_print_en;
>  	struct ufs_qcom_testbus testbus;
>  
> +	/* Reset control of HCI */
> +	struct reset_control *core_reset;
>  	struct reset_controller_dev rcdev;
>  
>  	struct gpio_desc *device_reset;
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project

-- 
~Vinod
