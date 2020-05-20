Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20D4D1DBA57
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2020 18:55:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726436AbgETQz4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 May 2020 12:55:56 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:30983 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726566AbgETQz4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 May 2020 12:55:56 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589993755; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=fPU9FrcmOGKQPbx+xpLCEeVLHsVWTWvsU+CO+NzO6BM=; b=iS75Jwd/Gi6/fkg2xgecLo2hO7Z2pWuzaq12M0jhh5WdXXLNutyazruLoWgSOnqRSXAN8q5G
 XPdmHxb53KJAMWIBYz0SntGIL+XIObfamb5b6jNxK6q0ciE2SwUjyQtIz8zPLNS/eoqyctMf
 XFBF+goVe/cnQCtFfe9rcaR+X/w=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ec56112.7f64ed020f48-smtp-out-n02;
 Wed, 20 May 2020 16:55:46 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6C3C7C43391; Wed, 20 May 2020 16:55:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.8.176] (cpe-70-95-149-85.san.res.rr.com [70.95.149.85])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: asutoshd)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5BE96C433C6;
        Wed, 20 May 2020 16:55:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5BE96C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=asutoshd@codeaurora.org
Subject: Re: [PATCH v3 2/2] scsi: ufs-qcom: enter and exit hibern8 during
 clock scaling
To:     Pedro Sousa <PedroM.Sousa@synopsys.com>,
        "cang@codeaurora.org" <cang@codeaurora.org>,
        "rnayak@codeaurora.org" <rnayak@codeaurora.org>,
        "vinholikatti@gmail.com" <vinholikatti@gmail.com>,
        "jejb@linux.vnet.ibm.com" <jejb@linux.vnet.ibm.com>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>
Cc:     "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "kernel-team@android.com" <kernel-team@android.com>,
        "saravanak@google.com" <saravanak@google.com>,
        "salyzyn@google.com" <salyzyn@google.com>,
        Andy Gross <agross@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <1571849351-819-1-git-send-email-asutoshd@codeaurora.org>
 <1571849351-819-2-git-send-email-asutoshd@codeaurora.org>
 <MN2PR12MB31675521623C9AFEA87B6076CC740@MN2PR12MB3167.namprd12.prod.outlook.com>
From:   "Asutosh Das (asd)" <asutoshd@codeaurora.org>
Message-ID: <06fbd425-3815-690a-22bc-a362c5deca6d@codeaurora.org>
Date:   Wed, 20 May 2020 09:55:43 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <MN2PR12MB31675521623C9AFEA87B6076CC740@MN2PR12MB3167.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Pedro,

On 11/11/2019 7:54 AM, Pedro Sousa wrote:
> Hi Asutosh,
> 
> Please check comments.
Sorry for missing out on this and thanks for your review.

> 
> -----Original Message-----
> From: Asutosh Das <asutoshd@codeaurora.org>
> Sent: Wednesday, October 23, 2019 5:49 PM
> To: cang@codeaurora.org; rnayak@codeaurora.org; vinholikatti@gmail.com; jejb@linux.vnet.ibm.com; martin.petersen@oracle.com
> Cc: linux-scsi@vger.kernel.org; kernel-team@android.com; saravanak@google.com; salyzyn@google.com; Asutosh Das <asutoshd@codeaurora.org>; Andy Gross <agross@kernel.org>; Alim Akhtar <alim.akhtar@samsung.com>; Avri Altman <avri.altman@wdc.com>; Pedro Sousa <pedrom.sousa@synopsys.com>; James E.J. Bottomley <jejb@linux.ibm.com>; open list:ARM/QUALCOMM SUPPORT <linux-arm-msm@vger.kernel.org>; open list <linux-kernel@vger.kernel.org>
> Subject: [PATCH v3 2/2] scsi: ufs-qcom: enter and exit hibern8 during clock scaling
> 
> Qualcomm controller needs to be in hibern8 before scaling clocks.
> This change puts the controller in hibern8 state before scaling
> and brings it out after scaling of clocks.
> 
> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
> ---
>   drivers/scsi/ufs/ufs-qcom.c | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
> index a5b7148..55b1de5 100644
> --- a/drivers/scsi/ufs/ufs-qcom.c
> +++ b/drivers/scsi/ufs/ufs-qcom.c
> @@ -1305,18 +1305,27 @@ static int ufs_qcom_clk_scale_notify(struct ufs_hba *hba,
>   	int err = 0;
>   
>   	if (status == PRE_CHANGE) {
> +		err = ufshcd_uic_hibern8_enter(hba);
> +		if (err)
> +			return err;
>   		if (scale_up)
>   			err = ufs_qcom_clk_scale_up_pre_change(hba);
>   		else
>   			err = ufs_qcom_clk_scale_down_pre_change(hba);
> +		if (err)
> +			ufshcd_uic_hibern8_exit(hba);
> +
>   	} else {
>   		if (scale_up)
>   			err = ufs_qcom_clk_scale_up_post_change(hba);
>   		else
>   			err = ufs_qcom_clk_scale_down_post_change(hba);
>   
> -		if (err || !dev_req_params)
> +
> +		if (err || !dev_req_params) {
> +			ufshcd_uic_hibern8_exit(hba);
>   			goto out;
> +		}
>   
>   		ufs_qcom_cfg_timers(hba,
>   				    dev_req_params->gear_rx,
> @@ -1324,6 +1333,7 @@ static int ufs_qcom_clk_scale_notify(struct ufs_hba *hba,
>   				    dev_req_params->hs_rate,
>   				    false);
>   		ufs_qcom_update_bus_bw_vote(host);
> +		ufshcd_uic_hibern8_exit(hba);
> 
> Here you are creating the possibility of returning a success even if hibern8 exit fails.
> If hibern8 exit fails the ufs recovery will be triggered and "err" variable will not get updated
> in this function, how is this handled? Did you tested this possibility?
> 
>   	}
>   
>   out:
> 


Yes - I agree with your comment. The error should be propagated from 
this function correctly to the caller. I'll push another version.

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
Linux Foundation Collaborative Project
