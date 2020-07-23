Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90A2522A61C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jul 2020 05:38:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387755AbgGWDiL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jul 2020 23:38:11 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:63787 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733155AbgGWDiL (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jul 2020 23:38:11 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595475490; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=6YpbNPayyumGwfyiflw7K8aKpehYKy6/dGMhIEqlhuw=;
 b=hn1PUNyndPRXnjfnF1dvW3po5q7SJNAQ97bhllU6hQy0GirCKjbGUo3r0fb/FXNBhvowAgD/
 Yc3tfXhZFVXCVmAt6KDnr9IUjpaZfJczEDJEJgQCCnSAB6iZo4FCDnK2uHd9Pc9bNa9wVEHL
 pYfQ5JDsmPEupqUMz2gSelnmcPU=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5f1906218e9b2c49c669995f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 23 Jul 2020 03:38:09
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CE49AC433CB; Thu, 23 Jul 2020 03:38:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: hongwus)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 44A1EC433C9;
        Thu, 23 Jul 2020 03:38:08 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 23 Jul 2020 11:38:08 +0800
From:   hongwus@codeaurora.org
To:     Can Guo <cang@codeaurora.org>
Cc:     asutoshd@codeaurora.org, nguyenb@codeaurora.org,
        rnayak@codeaurora.org, sh425.lee@samsung.com,
        linux-scsi@vger.kernel.org, kernel-team@android.com,
        saravanak@google.com, salyzyn@google.com,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/9] ufs: ufs-qcom: Fix race conditions caused by func
 ufs_qcom_testbus_config
In-Reply-To: <1595471649-25675-4-git-send-email-cang@codeaurora.org>
References: <1595471649-25675-1-git-send-email-cang@codeaurora.org>
 <1595471649-25675-4-git-send-email-cang@codeaurora.org>
Message-ID: <f8a94108c8d063336f844a812e59020e@codeaurora.org>
X-Sender: hongwus@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-07-23 10:34, Can Guo wrote:
> If ufs_qcom_dump_dbg_regs() calls ufs_qcom_testbus_config() from
> ufshcd_suspend/resume and/or clk gate/ungate context, 
> pm_runtime_get_sync()
> and ufshcd_hold() will cause racing problems. Fix this by removing the
> unnecessary calls of pm_runtime_get_sync() and ufshcd_hold().
> 
> Signed-off-by: Can Guo <cang@codeaurora.org>
> ---
>  drivers/scsi/ufs/ufs-qcom.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
> index 2e6ddb5..7da27ee 100644
> --- a/drivers/scsi/ufs/ufs-qcom.c
> +++ b/drivers/scsi/ufs/ufs-qcom.c
> @@ -1604,9 +1604,6 @@ int ufs_qcom_testbus_config(struct ufs_qcom_host 
> *host)
>  	 */
>  	}
>  	mask <<= offset;
> -
> -	pm_runtime_get_sync(host->hba->dev);
> -	ufshcd_hold(host->hba, false);
>  	ufshcd_rmwl(host->hba, TEST_BUS_SEL,
>  		    (u32)host->testbus.select_major << 19,
>  		    REG_UFS_CFG1);
> @@ -1619,8 +1616,6 @@ int ufs_qcom_testbus_config(struct ufs_qcom_host 
> *host)
>  	 * committed before returning.
>  	 */
>  	mb();
> -	ufshcd_release(host->hba);
> -	pm_runtime_put_sync(host->hba->dev);
> 
>  	return 0;
>  }


Reviewed-by: Hongwu Su <hongwus@codeaurora.org>
