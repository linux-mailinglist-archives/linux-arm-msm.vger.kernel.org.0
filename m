Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7280C2301C4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jul 2020 07:32:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726631AbgG1FcR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jul 2020 01:32:17 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:49386 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726245AbgG1FcR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jul 2020 01:32:17 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595914336; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=AGgIwDCiB5b28ItgH/sAXlvyffIT5/nijh9m34NzZuY=;
 b=JFWcDIKIg5rpux5fFXOIIml7S2V2CnBbdI72hdjbInFgV2jitCG834sopie7BLFMn8fOwrAN
 seK6HTxQbl9XrNJUjVVhJ3c/W36j/bQY1P8CpDk41mPNoQ3ZX8SLignuIjP6bFFeUexID6RL
 u6AaD65l0Zw6JEAbvnU8NoQQNG0=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n13.prod.us-west-2.postgun.com with SMTP id
 5f1fb85a634c4259e3281645 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 28 Jul 2020 05:32:10
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 64731C433AD; Tue, 28 Jul 2020 05:32:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: hongwus)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 791EDC433C6;
        Tue, 28 Jul 2020 05:32:09 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 28 Jul 2020 13:32:09 +0800
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
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi-owner@vger.kernel.org
Subject: Re: [PATCH v7 3/8] scsi: ufs-qcom: Remove testbus dump in
 ufs_qcom_dump_dbg_regs
In-Reply-To: <1595912460-8860-4-git-send-email-cang@codeaurora.org>
References: <1595912460-8860-1-git-send-email-cang@codeaurora.org>
 <1595912460-8860-4-git-send-email-cang@codeaurora.org>
Message-ID: <8121784a3019723997a16cc6791e5e5a@codeaurora.org>
X-Sender: hongwus@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-07-28 13:00, Can Guo wrote:
> Dumping testbus registers is heavy enough to cause stability issues
> sometime, just remove them as of now.
> 
> Signed-off-by: Can Guo <cang@codeaurora.org>
> ---
>  drivers/scsi/ufs/ufs-qcom.c | 32 --------------------------------
>  1 file changed, 32 deletions(-)
> 
> diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
> index 7da27ee..96e0999 100644
> --- a/drivers/scsi/ufs/ufs-qcom.c
> +++ b/drivers/scsi/ufs/ufs-qcom.c
> @@ -1620,44 +1620,12 @@ int ufs_qcom_testbus_config(struct 
> ufs_qcom_host *host)
>  	return 0;
>  }
> 
> -static void ufs_qcom_testbus_read(struct ufs_hba *hba)
> -{
> -	ufshcd_dump_regs(hba, UFS_TEST_BUS, 4, "UFS_TEST_BUS ");
> -}
> -
> -static void ufs_qcom_print_unipro_testbus(struct ufs_hba *hba)
> -{
> -	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> -	u32 *testbus = NULL;
> -	int i, nminor = 256, testbus_len = nminor * sizeof(u32);
> -
> -	testbus = kmalloc(testbus_len, GFP_KERNEL);
> -	if (!testbus)
> -		return;
> -
> -	host->testbus.select_major = TSTBUS_UNIPRO;
> -	for (i = 0; i < nminor; i++) {
> -		host->testbus.select_minor = i;
> -		ufs_qcom_testbus_config(host);
> -		testbus[i] = ufshcd_readl(hba, UFS_TEST_BUS);
> -	}
> -	print_hex_dump(KERN_ERR, "UNIPRO_TEST_BUS ", DUMP_PREFIX_OFFSET,
> -			16, 4, testbus, testbus_len, false);
> -	kfree(testbus);
> -}
> -
>  static void ufs_qcom_dump_dbg_regs(struct ufs_hba *hba)
>  {
>  	ufshcd_dump_regs(hba, REG_UFS_SYS1CLK_1US, 16 * 4,
>  			 "HCI Vendor Specific Registers ");
> 
> -	/* sleep a bit intermittently as we are dumping too much data */
>  	ufs_qcom_print_hw_debug_reg_all(hba, NULL, 
> ufs_qcom_dump_regs_wrapper);
> -	udelay(1000);
> -	ufs_qcom_testbus_read(hba);
> -	udelay(1000);
> -	ufs_qcom_print_unipro_testbus(hba);
> -	udelay(1000);
>  }
> 
>  /**

Reviewed-by: Hongwu Su <hongwus@codeaurora.org>
