Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D5841524C1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2020 03:17:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727714AbgBECRH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Feb 2020 21:17:07 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:54285 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727140AbgBECRH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Feb 2020 21:17:07 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1580869026; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=akJYwzCLbXwxHJd1f8VdXmC7moR+0lxrjFJgFgP3xb8=; b=LWBK3zEVRIz7WyAxr5AfV5Rx1yl0aVDCPaBFJVG+8GHO3e0XPIALycBv2dWyFH/z1k38Omcf
 lQ5UEwoO6ybjcv1YlKxo2T/iighvPvVUgBEMB0X2GdCcwURRUJYoO3sQzhvBhsrgwOfVo1XR
 cWED0iMPedELYvUY/3M56JvvXkA=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e3a25a2.7effbbc058b8-smtp-out-n02;
 Wed, 05 Feb 2020 02:17:06 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DC71DC447A3; Wed,  5 Feb 2020 02:17:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.71.154.194] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: asutoshd)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 208A9C43383;
        Wed,  5 Feb 2020 02:17:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 208A9C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=asutoshd@codeaurora.org
Subject: Re: [PATCH v5 4/8] scsi: ufs-qcom: Adjust bus bandwidth voting and
 unvoting
To:     Can Guo <cang@codeaurora.org>, nguyenb@codeaurora.org,
        hongwus@codeaurora.org, rnayak@codeaurora.org,
        linux-scsi@vger.kernel.org, kernel-team@android.com,
        saravanak@google.com, salyzyn@google.com
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <1580721472-10784-1-git-send-email-cang@codeaurora.org>
 <1580721472-10784-5-git-send-email-cang@codeaurora.org>
From:   "Asutosh Das (asd)" <asutoshd@codeaurora.org>
Message-ID: <ca9e97dc-0328-884e-0236-91c9f9ea9f41@codeaurora.org>
Date:   Tue, 4 Feb 2020 18:17:01 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <1580721472-10784-5-git-send-email-cang@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2/3/2020 1:17 AM, Can Guo wrote:
> The bus bandwidth voting is required to be done before the bus clocks
> are enabled, and the unvoting is required to be done only after the bus
> clocks are disabled.
> 
> Signed-off-by: Can Guo <cang@codeaurora.org>
> ---

Reviewed-by: Asutosh Das <asutoshd@codeaurora.org>

>   drivers/scsi/ufs/ufs-qcom.c | 57 +++++++++++++++++++++++++++++++--------------
>   1 file changed, 39 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
> index c69c29a1c..85d7c17 100644
> --- a/drivers/scsi/ufs/ufs-qcom.c
> +++ b/drivers/scsi/ufs/ufs-qcom.c
> @@ -38,7 +38,6 @@ enum {
>   
>   static struct ufs_qcom_host *ufs_qcom_hosts[MAX_UFS_QCOM_HOSTS];
>   
> -static int ufs_qcom_set_bus_vote(struct ufs_qcom_host *host, int vote);
>   static void ufs_qcom_get_default_testbus_cfg(struct ufs_qcom_host *host);
>   static int ufs_qcom_set_dme_vs_core_clk_ctrl_clear_div(struct ufs_hba *hba,
>   						       u32 clk_cycles);
> @@ -674,7 +673,7 @@ static void ufs_qcom_get_speed_mode(struct ufs_pa_layer_attr *p, char *result)
>   	}
>   }
>   
> -static int ufs_qcom_set_bus_vote(struct ufs_qcom_host *host, int vote)
> +static int __ufs_qcom_set_bus_vote(struct ufs_qcom_host *host, int vote)
>   {
>   	int err = 0;
>   
> @@ -705,7 +704,7 @@ static int ufs_qcom_update_bus_bw_vote(struct ufs_qcom_host *host)
>   
>   	vote = ufs_qcom_get_bus_vote(host, mode);
>   	if (vote >= 0)
> -		err = ufs_qcom_set_bus_vote(host, vote);
> +		err = __ufs_qcom_set_bus_vote(host, vote);
>   	else
>   		err = vote;
>   
> @@ -716,6 +715,35 @@ static int ufs_qcom_update_bus_bw_vote(struct ufs_qcom_host *host)
>   	return err;
>   }
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
>   static ssize_t
>   show_ufs_to_mem_max_bus_bw(struct device *dev, struct device_attribute *attr,
>   			char *buf)
> @@ -792,7 +820,7 @@ static int ufs_qcom_update_bus_bw_vote(struct ufs_qcom_host *host)
>   	return 0;
>   }
>   
> -static int ufs_qcom_set_bus_vote(struct ufs_qcom_host *host, int vote)
> +static int ufs_qcom_set_bus_vote(struct ufs_hba *host, bool on)
>   {
>   	return 0;
>   }
> @@ -1030,8 +1058,7 @@ static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
>   				 enum ufs_notify_change_status status)
>   {
>   	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> -	int err;
> -	int vote = 0;
> +	int err = 0;
>   
>   	/*
>   	 * In case ufs_qcom_init() is not yet done, simply ignore.
> @@ -1041,28 +1068,21 @@ static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
>   	if (!host)
>   		return 0;
>   
> -	if (on && (status == POST_CHANGE)) {
> +	if (on && (status == PRE_CHANGE)) {
> +		err = ufs_qcom_set_bus_vote(hba, true);
> +	} else if (on && (status == POST_CHANGE)) {
>   		/* enable the device ref clock for HS mode*/
>   		if (ufshcd_is_hs_mode(&hba->pwr_info))
>   			ufs_qcom_dev_ref_clk_ctrl(host, true);
> -		vote = host->bus_vote.saved_vote;
> -		if (vote == host->bus_vote.min_bw_vote)
> -			ufs_qcom_update_bus_bw_vote(host);
> -
>   	} else if (!on && (status == PRE_CHANGE)) {
>   		if (!ufs_qcom_is_link_active(hba)) {
>   			/* disable device ref_clk */
>   			ufs_qcom_dev_ref_clk_ctrl(host, false);
>   		}
> -
> -		vote = host->bus_vote.min_bw_vote;
> +	} else if (!on && (status == POST_CHANGE)) {
> +		err = ufs_qcom_set_bus_vote(hba, false);
>   	}
>   
> -	err = ufs_qcom_set_bus_vote(host, vote);
> -	if (err)
> -		dev_err(hba->dev, "%s: set bus vote failed %d\n",
> -				__func__, err);
> -
>   	return err;
>   }
>   
> @@ -1238,6 +1258,7 @@ static int ufs_qcom_init(struct ufs_hba *hba)
>   	ufs_qcom_set_caps(hba);
>   	ufs_qcom_advertise_quirks(hba);
>   
> +	ufs_qcom_set_bus_vote(hba, true);
>   	ufs_qcom_setup_clocks(hba, true, POST_CHANGE);
>   
>   	if (hba->dev->id < MAX_UFS_QCOM_HOSTS)
> 


-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
Linux Foundation Collaborative Project
