Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E4E215ADFC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2020 18:04:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728624AbgBLREj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Feb 2020 12:04:39 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:38928 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727960AbgBLREi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Feb 2020 12:04:38 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1581527078; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=1db+ymtXm5ZOsHNHHCA3Y5/L6QAZrcF4lOpLSvkECPQ=;
 b=DQ6cVU1HXKqUq6+78bWcBvMFOYM2k9HDj5D2XkC1Tfeyuxut7uFzR2WdOrCaRbxdmbp/8DKZ
 eMK0+cC5+PXZu5kiFXjRo0rlpXRxy2s9QyH9EdJeZLSuhKGGcmsCM0OyuNcBo6jkwXZFANjZ
 4O7McJPjwyMVLcTfo3azV2UC814=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e443022.7f6c02d759d0-smtp-out-n02;
 Wed, 12 Feb 2020 17:04:34 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8A793C433A2; Wed, 12 Feb 2020 17:04:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: asutoshd)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5402BC43383;
        Wed, 12 Feb 2020 17:04:31 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 12 Feb 2020 09:04:31 -0800
From:   asutoshd@codeaurora.org
To:     Can Guo <cang@codeaurora.org>
Cc:     nguyenb@codeaurora.org, hongwus@codeaurora.org,
        rnayak@codeaurora.org, linux-scsi@vger.kernel.org,
        kernel-team@android.com, saravanak@google.com, salyzyn@google.com,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pedro Sousa <sousa@synopsys.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi-owner@vger.kernel.org
Subject: Re: [PATCH v1 2/2] scsi: ufs: Select INITIAL ADAPT type for HS Gear4
In-Reply-To: <1581485910-8307-3-git-send-email-cang@codeaurora.org>
References: <1581485910-8307-1-git-send-email-cang@codeaurora.org>
 <1581485910-8307-3-git-send-email-cang@codeaurora.org>
Message-ID: <ac3f68fa7f0dd3de567cc321eb5c5026@codeaurora.org>
X-Sender: asutoshd@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-02-11 21:38, Can Guo wrote:
> ADAPT is added specifically for HS Gear4 mode only, select INITIAL 
> ADAPT
> before do power mode change to G4 and select NO ADAPT before switch to
> non-G4 modes.
> 
> Signed-off-by: Can Guo <cang@codeaurora.org>
> ---

Reviewed-by:  Asutosh Das <asutoshd@codeaurora.org>

>  drivers/scsi/ufs/ufs-qcom.c | 14 ++++++++++++++
>  drivers/scsi/ufs/unipro.h   |  7 +++++++
>  2 files changed, 21 insertions(+)
> 
> diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
> index d593523..6a905bb 100644
> --- a/drivers/scsi/ufs/ufs-qcom.c
> +++ b/drivers/scsi/ufs/ufs-qcom.c
> @@ -942,6 +942,20 @@ static int ufs_qcom_pwr_change_notify(struct 
> ufs_hba *hba,
>  		if (!ufshcd_is_hs_mode(&hba->pwr_info) &&
>  			ufshcd_is_hs_mode(dev_req_params))
>  			ufs_qcom_dev_ref_clk_ctrl(host, true);
> +
> +		if (host->hw_ver.major >= 0x4) {
> +			if (dev_req_params->gear_tx == UFS_HS_G4) {
> +				/* INITIAL ADAPT */
> +				ufshcd_dme_set(hba,
> +					       UIC_ARG_MIB(PA_TXHSADAPTTYPE),
> +					       PA_INITIAL_ADAPT);
> +			} else {
> +				/* NO ADAPT */
> +				ufshcd_dme_set(hba,
> +					       UIC_ARG_MIB(PA_TXHSADAPTTYPE),
> +					       PA_NO_ADAPT);
> +			}
> +		}
>  		break;
>  	case POST_CHANGE:
>  		if (ufs_qcom_cfg_timers(hba, dev_req_params->gear_rx,
> diff --git a/drivers/scsi/ufs/unipro.h b/drivers/scsi/ufs/unipro.h
> index 3dc4d8b..766d551 100644
> --- a/drivers/scsi/ufs/unipro.h
> +++ b/drivers/scsi/ufs/unipro.h
> @@ -146,6 +146,12 @@
>  #define PA_SLEEPNOCONFIGTIME	0x15A2
>  #define PA_STALLNOCONFIGTIME	0x15A3
>  #define PA_SAVECONFIGTIME	0x15A4
> +#define PA_TXHSADAPTTYPE       0x15D4
> +
> +/* Adpat type for PA_TXHSADAPTTYPE attribute */
> +#define PA_REFRESH_ADAPT       0x00
> +#define PA_INITIAL_ADAPT       0x01
> +#define PA_NO_ADAPT            0x03
> 
>  #define PA_TACTIVATE_TIME_UNIT_US	10
>  #define PA_HIBERN8_TIME_UNIT_US		100
> @@ -203,6 +209,7 @@ enum ufs_hs_gear_tag {
>  	UFS_HS_G1,		/* HS Gear 1 (default for reset) */
>  	UFS_HS_G2,		/* HS Gear 2 */
>  	UFS_HS_G3,		/* HS Gear 3 */
> +	UFS_HS_G4,		/* HS Gear 4 */
>  };
> 
>  enum ufs_unipro_ver {
