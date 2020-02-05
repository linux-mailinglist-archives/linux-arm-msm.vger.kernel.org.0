Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8FB291526C6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2020 08:20:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726386AbgBEHUQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Feb 2020 02:20:16 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:14426 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725793AbgBEHUQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Feb 2020 02:20:16 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1580887215; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=7DffYjVGVCcrqC/qHz0LpV46gTFSwzkl9c+dLx2G4uU=;
 b=kHTBbewSiNEWXCRhfYIP0Nd7T9OWbKHZJA5KBuBtmw8bZNZ5tw+9rM/XWMe8d1M/KuORL8+h
 a8rhl59/8hmB6h67jCCUp3WGwbI8Nzc85R0rPSIcPSdpZbhlRg1EJCi32irg3tbYVOa6hovE
 c3X9I2iY7oHlnuiSWgUDPTQp6Z0=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e3a6cab.7f4ebfd908f0-smtp-out-n02;
 Wed, 05 Feb 2020 07:20:11 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 94D74C447A1; Wed,  5 Feb 2020 07:20:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: hongwus)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C75AFC433CB;
        Wed,  5 Feb 2020 07:20:10 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 05 Feb 2020 15:20:10 +0800
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
Subject: Re: [PATCH v5 7/8] scsi: ufs-qcom: Delay specific time before gate
 ref clk
In-Reply-To: <1580721472-10784-8-git-send-email-cang@codeaurora.org>
References: <1580721472-10784-1-git-send-email-cang@codeaurora.org>
 <1580721472-10784-8-git-send-email-cang@codeaurora.org>
Message-ID: <537a8695bcadd7d5686a6b6e3c04f2af@codeaurora.org>
X-Sender: hongwus@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-02-03 17:17, Can Guo wrote:
> After enter hibern8, as UFS JEDEC ver 3.0 requires, a specific gating 
> wait
> time is required before disable the device reference clock. If it is 
> not
> specified, use the old delay.
> 
> Signed-off-by: Can Guo <cang@codeaurora.org>
> Reviewed-by: Asutosh Das <asutoshd@codeaurora.org>
> ---
>  drivers/scsi/ufs/ufs-qcom.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
> index 85d7c17..3b5b2d9 100644
> --- a/drivers/scsi/ufs/ufs-qcom.c
> +++ b/drivers/scsi/ufs/ufs-qcom.c
> @@ -833,6 +833,8 @@ static int ufs_qcom_bus_register(struct 
> ufs_qcom_host *host)
> 
>  static void ufs_qcom_dev_ref_clk_ctrl(struct ufs_qcom_host *host, bool 
> enable)
>  {
> +	unsigned long gating_wait;
> +
>  	if (host->dev_ref_clk_ctrl_mmio &&
>  	    (enable ^ host->is_dev_ref_clk_enabled)) {
>  		u32 temp = readl_relaxed(host->dev_ref_clk_ctrl_mmio);
> @@ -845,11 +847,16 @@ static void ufs_qcom_dev_ref_clk_ctrl(struct
> ufs_qcom_host *host, bool enable)
>  		/*
>  		 * If we are here to disable this clock it might be immediately
>  		 * after entering into hibern8 in which case we need to make
> -		 * sure that device ref_clk is active at least 1us after the
> +		 * sure that device ref_clk is active for specific time after
>  		 * hibern8 enter.
>  		 */
> -		if (!enable)
> -			udelay(1);
> +		if (!enable) {
> +			gating_wait = host->hba->dev_info.clk_gating_wait_us;
> +			if (!gating_wait)
> +				udelay(1);
> +			else
> +				usleep_range(gating_wait, gating_wait + 10);
> +		}
> 
>  		writel_relaxed(temp, host->dev_ref_clk_ctrl_mmio);


Reviewed-by: Hongwu Su <hongwus@codeaurora.org>
