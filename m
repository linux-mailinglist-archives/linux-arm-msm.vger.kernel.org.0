Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 734CC15888D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2020 04:09:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727806AbgBKDJ2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Feb 2020 22:09:28 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:22119 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727791AbgBKDJ2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Feb 2020 22:09:28 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1581390567; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=HsvS9IisJNr6LFW0Rz9Jhtw9mscMxCPE5oiz7HZbtQU=;
 b=kLBCUpkmUL1gxNy8GQKK5CUDeU4fKbQS+kxBHG7fBR3fwgavsuL94yBfj7r4Cf7FtrMGX9GW
 fDKR+ZgSAajLTS1EkJvCoU4jHyW/fJ46bQiByy887mGwq7049sJ/xMooiEo0YyL9NG/bNj+e
 XW0+VHPqGtB5MTQvkmlZcDFxyH8=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e421ae4.7f5080f63a40-smtp-out-n03;
 Tue, 11 Feb 2020 03:09:24 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A9208C4479C; Tue, 11 Feb 2020 03:09:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: hongwus)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AC3D3C43383;
        Tue, 11 Feb 2020 03:09:23 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 11 Feb 2020 11:09:23 +0800
From:   hongwus@codeaurora.org
To:     Can Guo <cang@codeaurora.org>
Cc:     asutoshd@codeaurora.org, nguyenb@codeaurora.org,
        rnayak@codeaurora.org, linux-scsi@vger.kernel.org,
        kernel-team@android.com, saravanak@google.com, salyzyn@google.com,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 3/7] scsi: ufs-qcom: Adjust bus bandwidth voting and
 unvoting
In-Reply-To: <1581388671-18078-4-git-send-email-cang@codeaurora.org>
References: <1581388671-18078-1-git-send-email-cang@codeaurora.org>
 <1581388671-18078-4-git-send-email-cang@codeaurora.org>
Message-ID: <c0fdc3e7f3457544c987d296c3a26e35@codeaurora.org>
X-Sender: hongwus@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Can,


On 2020-02-11 10:37, Can Guo wrote:
> The bus bandwidth voting is required to be done before the bus clocks
> are enabled, and the unvoting is required to be done only after the bus
> clocks are disabled.
> 
> Signed-off-by: Can Guo <cang@codeaurora.org>
> Reviewed-by: Asutosh Das <asutoshd@codeaurora.org>
> ---
>  drivers/scsi/ufs/ufs-qcom.c | 78 
> ++++++++++++++++++++++++++++++---------------
>  1 file changed, 53 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
> index c69c29a1c..ded08fb 100644
> --- a/drivers/scsi/ufs/ufs-qcom.c
> +++ b/drivers/scsi/ufs/ufs-qcom.c
> @@ -38,7 +38,6 @@ enum {
> 
>  static struct ufs_qcom_host *ufs_qcom_hosts[MAX_UFS_QCOM_HOSTS];
> 
> -static int ufs_qcom_set_bus_vote(struct ufs_qcom_host *host, int 
> vote);
>  static void ufs_qcom_get_default_testbus_cfg(struct ufs_qcom_host 
> *host);
>  static int ufs_qcom_set_dme_vs_core_clk_ctrl_clear_div(struct ufs_hba 
> *hba,
>  						       u32 clk_cycles);
> @@ -674,7 +673,7 @@ static void ufs_qcom_get_speed_mode(struct
> ufs_pa_layer_attr *p, char *result)
>  	}
>  }
> 
> -static int ufs_qcom_set_bus_vote(struct ufs_qcom_host *host, int vote)
> +static int __ufs_qcom_set_bus_vote(struct ufs_qcom_host *host, int 
> vote)
>  {
>  	int err = 0;
> 
> @@ -705,7 +704,7 @@ static int ufs_qcom_update_bus_bw_vote(struct
> ufs_qcom_host *host)
> 
>  	vote = ufs_qcom_get_bus_vote(host, mode);
>  	if (vote >= 0)
> -		err = ufs_qcom_set_bus_vote(host, vote);
> +		err = __ufs_qcom_set_bus_vote(host, vote);
>  	else
>  		err = vote;
> 
> @@ -716,6 +715,35 @@ static int ufs_qcom_update_bus_bw_vote(struct
> ufs_qcom_host *host)
>  	return err;
>  }
> 
> +static int ufs_qcom_set_bus_vote(struct ufs_hba *hba, bool on)
> +{
> +	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> +	int vote, err;
> +
> +	/*
> +	 * In case ufs_qcom_init() is not yet done, simply ignore.
> +	 * This ufs_qcom_set_bus_vote() shall be called from
> +	 * ufs_qcom_init() after init is done.
> +	 */
> +	if (!host)
> +		return 0;
> +
> +	if (on) {
> +		vote = host->bus_vote.saved_vote;
> +		if (vote == host->bus_vote.min_bw_vote)
> +			ufs_qcom_update_bus_bw_vote(host);
> +	} else {
> +		vote = host->bus_vote.min_bw_vote;
> +	}
> +
> +	err = __ufs_qcom_set_bus_vote(host, vote);
> +	if (err)
> +		dev_err(hba->dev, "%s: set bus vote failed %d\n",
> +				 __func__, err);
> +
> +	return err;
> +}
> +
>  static ssize_t
>  show_ufs_to_mem_max_bus_bw(struct device *dev, struct device_attribute 
> *attr,
>  			char *buf)
> @@ -792,7 +820,7 @@ static int ufs_qcom_update_bus_bw_vote(struct
> ufs_qcom_host *host)
>  	return 0;
>  }
> 
> -static int ufs_qcom_set_bus_vote(struct ufs_qcom_host *host, int vote)
> +static int ufs_qcom_set_bus_vote(struct ufs_hba *host, bool on)
>  {
>  	return 0;
>  }
> @@ -1030,8 +1058,7 @@ static int ufs_qcom_setup_clocks(struct ufs_hba
> *hba, bool on,
>  				 enum ufs_notify_change_status status)
>  {
>  	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> -	int err;
> -	int vote = 0;
> +	int err = 0;
> 
>  	/*
>  	 * In case ufs_qcom_init() is not yet done, simply ignore.
> @@ -1041,28 +1068,28 @@ static int ufs_qcom_setup_clocks(struct
> ufs_hba *hba, bool on,
>  	if (!host)
>  		return 0;
> 
> -	if (on && (status == POST_CHANGE)) {
> -		/* enable the device ref clock for HS mode*/
> -		if (ufshcd_is_hs_mode(&hba->pwr_info))
> -			ufs_qcom_dev_ref_clk_ctrl(host, true);
> -		vote = host->bus_vote.saved_vote;
> -		if (vote == host->bus_vote.min_bw_vote)
> -			ufs_qcom_update_bus_bw_vote(host);
> -
> -	} else if (!on && (status == PRE_CHANGE)) {
> -		if (!ufs_qcom_is_link_active(hba)) {
> -			/* disable device ref_clk */
> -			ufs_qcom_dev_ref_clk_ctrl(host, false);
> +	switch(status) {
> +	case PRE_CHANGE:
> +		if (on) {
> +			err = ufs_qcom_set_bus_vote(hba, true);
> +		} else {
> +			if (!ufs_qcom_is_link_active(hba)) {
> +				/* disable device ref_clk */
> +				ufs_qcom_dev_ref_clk_ctrl(host, false);
> +			}
>  		}
> -
> -		vote = host->bus_vote.min_bw_vote;
> +		break;
> +	case POST_CHANGE:
> +		if (on) {
> +			/* enable the device ref clock for HS mode*/
> +			if (ufshcd_is_hs_mode(&hba->pwr_info))
> +				ufs_qcom_dev_ref_clk_ctrl(host, true);
> +		} else {
> +			err = ufs_qcom_set_bus_vote(hba, false);
> +		}
> +		break;
>  	}
> 
> -	err = ufs_qcom_set_bus_vote(host, vote);
> -	if (err)
> -		dev_err(hba->dev, "%s: set bus vote failed %d\n",
> -				__func__, err);
> -
>  	return err;
>  }
> 
> @@ -1238,6 +1265,7 @@ static int ufs_qcom_init(struct ufs_hba *hba)
>  	ufs_qcom_set_caps(hba);
>  	ufs_qcom_advertise_quirks(hba);
> 
> +	ufs_qcom_set_bus_vote(hba, true);
>  	ufs_qcom_setup_clocks(hba, true, POST_CHANGE);
> 
>  	if (hba->dev->id < MAX_UFS_QCOM_HOSTS)


   Please add space after switch.
+    switch(status) {
+    case PRE_CHANGE


Reviewed-by: Hongwu Su <hongwus@codeaurora.org>
