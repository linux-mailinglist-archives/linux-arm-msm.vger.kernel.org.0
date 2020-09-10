Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A89A2639B1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Sep 2020 04:00:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730401AbgIJCAS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Sep 2020 22:00:18 -0400
Received: from a27-56.smtp-out.us-west-2.amazonses.com ([54.240.27.56]:47372
        "EHLO a27-56.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730085AbgIJBu7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Sep 2020 21:50:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599701327;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
        bh=hq2qlkdV42iGEc13LOvCdrQppZ9s1QRk5yIifv+RCMM=;
        b=Gtp1ylcYQEVffdmQtrBdvWH6cosDN3shEHQfkw+bgx6Ro5QhyXrBcKyC6pfcTNz7
        rbWuLo5VnItBdXEcxunj6/g5YpDAfomy7BtiaoKPUz9DvOi2xjgHYocsnW22TrXjhHr
        dSvdRA2fjmc/VHb4sFdWZQDwPKZKZz0Q5UUVslmY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599701327;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:Feedback-ID;
        bh=hq2qlkdV42iGEc13LOvCdrQppZ9s1QRk5yIifv+RCMM=;
        b=hAdnamzqH6Sz+WfF7VgwmYHYvbw8SovftoShQbKOecaXxjmJ86e9F/RKtxRZwU1P
        NW+MtO0G19y10UU3IsUpdE/08HbqIAC/ylBbSphW09uXjZ84qij0WM3BkyYQiqcJZHg
        ckryzDCljEw96cyUVjwPAfgjKCHaoXzzid3Oqzps=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 10 Sep 2020 01:28:47 +0000
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
Message-ID: <0101017475a11c06-5e39bfe2-d5ca-4eba-957e-339f317f8b55-000000@us-west-2.amazonses.com>
X-Sender: nguyenb@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-SES-Outgoing: 2020.09.10-54.240.27.56
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
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

Hello, please help review the change and comment if any.

Thanks!
Bao
