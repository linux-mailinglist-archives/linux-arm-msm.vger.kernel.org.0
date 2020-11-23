Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1D132BFE0D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Nov 2020 02:26:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726630AbgKWB0A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 22 Nov 2020 20:26:00 -0500
Received: from z5.mailgun.us ([104.130.96.5]:24213 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726131AbgKWB0A (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 22 Nov 2020 20:26:00 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606094760; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=itDjw5PoXE9wLCf0hinarSHz0GqjMyDV2OjE5ZmvB2U=;
 b=nhbyVfXQlYHmlE7/7GwwXo9Ly/0lAZwSoQPe/FMmvoDsfDNOZSRjbOQKYRh0EzkdaTSSoi2V
 Z9RMJRIVfQP+nmMTPEaL4orEqLn+geuRBKp2OkjY3VvPiwxGurbHkXdiRfAYV0Q6i90ydPVe
 BQNw4+YazswVSjkYyJtgEJq0oVw=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5fbb0fa11dba509aaef3a446 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 23 Nov 2020 01:25:53
 GMT
Sender: cang=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AF40DC43462; Mon, 23 Nov 2020 01:25:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: cang)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DE792C433C6;
        Mon, 23 Nov 2020 01:25:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 23 Nov 2020 09:25:52 +0800
From:   Can Guo <cang@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Asutosh Das <asutoshd@codeaurora.org>,
        Bean Huo <beanhuo@micron.com>, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] scsi: ufs: Adjust logic in common ADAPT helper
In-Reply-To: <20201121044810.507288-1-bjorn.andersson@linaro.org>
References: <20201121044810.507288-1-bjorn.andersson@linaro.org>
Message-ID: <29141b56fe3a92a8f038ca6c4a117890@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-11-21 12:48, Bjorn Andersson wrote:
> The introduction of ufshcd_dme_configure_adapt() refactored out
> duplication from the Mediatek and Qualcomm drivers.
> 
> Both these implementations had the logic of:
>     gear_tx == UFS_HS_G4 => PA_INITIAL_ADAPT
>     gear_tx != UFS_HS_G4 => PA_NO_ADAPT
> 
> but now both implementations pass PA_INITIAL_ADAPT as "adapt_val" and 
> if
> gear_tx is not UFS_HS_G4 that is replaced with PA_INITIAL_ADAPT. In
> other words, it's PA_INITIAL_ADAPT in both above cases.
> 
> The result is that e.g. Qualcomm SM8150 has no longer functional UFS, 
> so
> adjust the logic to match the previous implementation.
> 
> Fixes: fc85a74e28fe ("scsi: ufs: Refactor ADAPT configuration 
> function")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Can Guo <cang@codeaurora.org>

> ---
>  drivers/scsi/ufs/ufshcd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> index 52e077aa3efe..13281c74cb4f 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -3618,7 +3618,7 @@ int ufshcd_dme_configure_adapt(struct ufs_hba 
> *hba,
>  	int ret;
> 
>  	if (agreed_gear != UFS_HS_G4)
> -		adapt_val = PA_INITIAL_ADAPT;
> +		adapt_val = PA_NO_ADAPT;
> 
>  	ret = ufshcd_dme_set(hba,
>  			     UIC_ARG_MIB(PA_TXHSADAPTTYPE),
