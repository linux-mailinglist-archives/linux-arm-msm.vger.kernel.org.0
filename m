Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5870BE20E0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2019 18:47:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725860AbfJWQrR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Oct 2019 12:47:17 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:55582 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725887AbfJWQrR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Oct 2019 12:47:17 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id B562960DF8; Wed, 23 Oct 2019 16:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571849236;
        bh=4yOyFFubHSQ9A4eUC1YnKg7Z3r8l1kgCdVSXI5b4TLo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=jGBop7eu5StPxx2pdr0Lwpww1VtWGFrvhM5fXcaAOXO8981KaQM9OAwiSf2N6k9iR
         yUQMy/lgsQCQ6wWxci8UHDDXKWKbuMJZQOX5QocBul6iu/yFZ8lotPz6/xRoGPVCI3
         dxxaeg7qIUojwDvfrWD/EQdWwk9j2XuIOr+pbJbc=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 3811A60D95;
        Wed, 23 Oct 2019 16:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571849233;
        bh=4yOyFFubHSQ9A4eUC1YnKg7Z3r8l1kgCdVSXI5b4TLo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=n6PbH4LrMTTZ85k4t1ufgBf894XU0p6WMppYmAXo6iJp33MRWYZuDVBRwC7/tQQxt
         XFO1touKFIe4uNLMTXEO6T840Lyk4rq0aZr4Y0xQrFIIyn7IKAZ2BfnNIV1z6Kye2A
         p9YB4JukZpnKEdsxfeawdCfqcEb4KWD0eQubf3HU=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 23 Oct 2019 09:47:13 -0700
From:   asutoshd@codeaurora.org
To:     cang@codeaurora.org, rnayak@codeaurora.org, vinholikatti@gmail.com,
        jejb@linux.vnet.ibm.com, martin.petersen@oracle.com
Cc:     linux-scsi@vger.kernel.org, kernel-team@android.com,
        saravanak@google.com, salyzyn@google.com,
        Andy Gross <agross@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Pedro Sousa <pedrom.sousa@synopsys.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi-owner@vger.kernel.org
Subject: Re: [PATCH v2 2/2] scsi: ufs-qcom: enter and exit hibern8 during
 clock scaling
In-Reply-To: <1571848785-27698-2-git-send-email-asutoshd@codeaurora.org>
References: <1571848785-27698-1-git-send-email-asutoshd@codeaurora.org>
 <1571848785-27698-2-git-send-email-asutoshd@codeaurora.org>
Message-ID: <c5de4aac8672a2dd1b6048908da4a38e@codeaurora.org>
X-Sender: asutoshd@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-10-23 09:39, Asutosh Das wrote:
> Qualcomm controller needs to be in hibern8 before scaling clocks.
> This change puts the controller in hibern8 state before scaling
> and brings it out after scaling of clocks.
> 
> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
> ---
>  drivers/scsi/ufs/ufs-qcom.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
> index a5b7148..d117088 100644
> --- a/drivers/scsi/ufs/ufs-qcom.c
> +++ b/drivers/scsi/ufs/ufs-qcom.c
> @@ -1305,6 +1305,9 @@ static int ufs_qcom_clk_scale_notify(struct 
> ufs_hba *hba,
>  	int err = 0;
> 
>  	if (status == PRE_CHANGE) {
> +		err = ufshcd_uic_hibern8_enter(hba);
> +		if (err)
> +			return err;
>  		if (scale_up)
>  			err = ufs_qcom_clk_scale_up_pre_change(hba);
The error handling is not done here.

>  		else
> @@ -1324,6 +1327,7 @@ static int ufs_qcom_clk_scale_notify(struct 
> ufs_hba *hba,
>  				    dev_req_params->hs_rate,
>  				    false);
>  		ufs_qcom_update_bus_bw_vote(host);
> +		ufshcd_uic_hibern8_exit(hba);
>  	}
> 
>  out:

In the post-change condition as well, the error handling is not done.
On error, it should be brought out of hibernate.
I'll put up another change fixing that.

-asd
