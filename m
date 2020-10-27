Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F07829A280
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Oct 2020 03:06:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504342AbgJ0CGL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Oct 2020 22:06:11 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:15515 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2504353AbgJ0CGJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Oct 2020 22:06:09 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1603764368; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=GxlUBsgWpRmzq1zbsPQ+RSymFtnjB5bpOntoDLsD6lY=;
 b=PULxzDgyCoJuoz6kk1wDahiLsZrHDL75Wa84UIombhrDtOHlbkQPe1dk4wqlO8HFMF5ZqqST
 RGGpMNWF+bJNdp5a6sDmKheHXTB12XGIS4mU0Dif7dU/MY0bPErF6jCYr6j2C94UU9qbr3wz
 Bc5pza3ILZkQL75xVI8i8sG6sxU=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5f97808e1e4642bf75eebb4f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 27 Oct 2020 02:06:06
 GMT
Sender: cang=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AF996C433FE; Tue, 27 Oct 2020 02:06:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: cang)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0400DC433C9;
        Tue, 27 Oct 2020 02:06:04 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 27 Oct 2020 10:06:04 +0800
From:   Can Guo <cang@codeaurora.org>
To:     Asutosh Das <asutoshd@codeaurora.org>
Cc:     martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] ufs: qcom: Enable aggressive power collapse for
 ufs hba
In-Reply-To: <0716681006075e9eebbf0decd28505824e22d637.1603754932.git.asutoshd@codeaurora.org>
References: <ce0a3be9c685506803597fb770e37c099ae27232.1603754932.git.asutoshd@codeaurora.org>
 <0716681006075e9eebbf0decd28505824e22d637.1603754932.git.asutoshd@codeaurora.org>
Message-ID: <8f03a3a7a4209d2e1dfb07c6981a6ec6@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-10-27 07:30, Asutosh Das wrote:
> Enabling this capability to let hba power-collapse
> more often to save power.
> 
> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>

Reviewed-by: Can Guo <cang@codeaurora.org>

> ---
>  drivers/scsi/ufs/ufs-qcom.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
> index f9d6ef3..9a19c6d 100644
> --- a/drivers/scsi/ufs/ufs-qcom.c
> +++ b/drivers/scsi/ufs/ufs-qcom.c
> @@ -863,6 +863,7 @@ static void ufs_qcom_set_caps(struct ufs_hba *hba)
>  	hba->caps |= UFSHCD_CAP_AUTO_BKOPS_SUSPEND;
>  	hba->caps |= UFSHCD_CAP_WB_EN;
>  	hba->caps |= UFSHCD_CAP_CRYPTO;
> +	hba->caps |= UFSHCD_CAP_AGGR_POWER_COLLAPSE;
> 
>  	if (host->hw_ver.major >= 0x2) {
>  		host->caps = UFS_QCOM_CAP_QUNIPRO |
