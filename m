Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2660C27BADF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Sep 2020 04:36:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727269AbgI2CgX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Sep 2020 22:36:23 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:15063 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727151AbgI2CgX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Sep 2020 22:36:23 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1601346982; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=xq3wf0X2ufcQl3gIMU5+oewCRuLye7B7HD/VCKzxjPM=;
 b=qSapUk+OYQKyQnW2w5BqRNSCt1yjFRqZts5gvBgSFLM6fBwuth6ju2Ed3L7NWnRr0mMqTsdR
 ggrdqAPzwPXgOWB8PLedb/srY+OAKynfXollR3LFxbv0hVsDabpmBtRID7q9NREwxGFgQAjE
 Z9iMLnIvpH4GA7r7UkW9yejPz8A=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5f729d8abe59ebabf3085ada (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 29 Sep 2020 02:35:54
 GMT
Sender: nguyenb=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8671BC43387; Tue, 29 Sep 2020 02:35:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: nguyenb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AD975C433C8;
        Tue, 29 Sep 2020 02:35:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 28 Sep 2020 19:35:52 -0700
From:   nguyenb@codeaurora.org
To:     cang@codeaurora.org, asutoshd@codeaurora.org,
        martin.petersen@oracle.com, linux-scsi@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Bean Huo <beanhuo@micron.com>,
        Bart Van Assche <bvanassche@acm.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] scsi: ufshcd: Properly set the device Icc Level
In-Reply-To: <5c9d6f76303bbe5188bf839b2ea5e5bf530e7281.1598923023.git.nguyenb@codeaurora.org>
References: <5c9d6f76303bbe5188bf839b2ea5e5bf530e7281.1598923023.git.nguyenb@codeaurora.org>
Message-ID: <0edf03ca16e2ee6e4ed8e5ac72752a94@codeaurora.org>
X-Sender: nguyenb@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-08-31 18:19, Bao D. Nguyen wrote:
> UFS version 3.0 and later devices require Vcc and Vccq power supplies
> with Vccq2 being optional. While earlier UFS version 2.0 and 2.1
> devices, the Vcc and Vccq2 are required with Vccq being optional.
> Check the required power supplies used by the device
> and set the device's supported Icc level properly.
> 
> Signed-off-by: Can Guo <cang@codeaurora.org>
> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
> Signed-off-by: Bao D. Nguyen <nguyenb@codeaurora.org>
> ---
>  drivers/scsi/ufs/ufshcd.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> index 06e2439..fdd1d3e 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -6845,8 +6845,9 @@ static u32
> ufshcd_find_max_sup_active_icc_level(struct ufs_hba *hba,
>  {
>  	u32 icc_level = 0;
> 
> -	if (!hba->vreg_info.vcc || !hba->vreg_info.vccq ||
> -						!hba->vreg_info.vccq2) {
> +	if (!hba->vreg_info.vcc ||
> +		(!hba->vreg_info.vccq && hba->dev_info.wspecversion >= 0x300) ||
> +		(!hba->vreg_info.vccq2 && hba->dev_info.wspecversion < 0x300)) {
>  		dev_err(hba->dev,
>  			"%s: Regulator capability was not set, actvIccLevel=%d",
>  							__func__, icc_level);

Hello,
Thank you for the comments on this change so far.
It's been idle for some time, so I would like to ping and see if there 
is any other comment.

Regards,
Bao

