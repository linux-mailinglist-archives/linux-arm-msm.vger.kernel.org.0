Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2262D41B524
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 19:30:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242083AbhI1RcN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 13:32:13 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:25238 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242081AbhI1RcL (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 13:32:11 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1632850232; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Lu/WTpMvwg4jnja38XQYqTJ4WyLbF7FcUTVzra8gO/Q=;
 b=p+Qc8ZPgBkuDQ7Jed0Tantb/jTD6rvp8n8K5rhReq3n/vTc1iwlW5qrV2DPEqD6O2yZRPCW+
 62445yittxYdPIKfuaUJEeSay5kvWswd3JArChwoTzgPUzMPCbalB1oyavNqiCu09i/RAQzj
 2GdMpMuxtlp8OUp+AiIryW0xIFM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 61535120a5a9bab6e8d1cd70 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 28 Sep 2021 17:30:08
 GMT
Sender: nguyenb=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 348D6C4361A; Tue, 28 Sep 2021 17:30:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: nguyenb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3380FC4360C;
        Tue, 28 Sep 2021 17:30:06 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 28 Sep 2021 10:30:06 -0700
From:   nguyenb@codeaurora.org
To:     Alim Akhtar <alim.akhtar@samsung.com>
Cc:     cang@codeaurora.org, asutoshd@codeaurora.org,
        martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, 'Avri Altman' <avri.altman@wdc.com>,
        "'James E.J. Bottomley'" <jejb@linux.ibm.com>,
        'Bean Huo' <beanhuo@micron.com>,
        'Stanley Chu' <stanley.chu@mediatek.com>,
        'Bart Van Assche' <bvanassche@acm.org>,
        'Jaegeuk Kim' <jaegeuk@kernel.org>,
        'Adrian Hunter' <adrian.hunter@intel.com>,
        'Keoseong Park' <keosung.park@samsung.com>,
        'open list' <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 1/2] scsi: ufs: export hibern8 entry and exit
In-Reply-To: <000701d7b42b$3cc69680$b653c380$@samsung.com>
References: <cover.1632171047.git.nguyenb@codeaurora.org>
 <CGME20210920210820epcas5p3255a53f0d25000310e401305795017e8@epcas5p3.samsung.com>
 <70c5376129f902b6b3e9940ea3b10f147bf18a10.1632171047.git.nguyenb@codeaurora.org>
 <000701d7b42b$3cc69680$b653c380$@samsung.com>
Message-ID: <16df2ef1db49e3afc3235878fb13c3da@codeaurora.org>
X-Sender: nguyenb@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-09-27 22:39, Alim Akhtar wrote:
> Hi Bao
> 
>> -----Original Message-----
>> From: nguyenb=codeaurora.org@mg.codeaurora.org
>> [mailto:nguyenb=codeaurora.org@mg.codeaurora.org] On Behalf Of Bao D.
>> Nguyen
>> Sent: Tuesday, September 21, 2021 2:38 AM
>> To: cang@codeaurora.org; asutoshd@codeaurora.org;
>> martin.petersen@oracle.com; linux-scsi@vger.kernel.org
>> Cc: linux-arm-msm@vger.kernel.org; Bao D . Nguyen
>> <nguyenb@codeaurora.org>; Alim Akhtar <alim.akhtar@samsung.com>; Avri
>> Altman <avri.altman@wdc.com>; James E.J. Bottomley 
>> <jejb@linux.ibm.com>;
>> Bean Huo <beanhuo@micron.com>; Stanley Chu <stanley.chu@mediatek.com>;
>> Bart Van Assche <bvanassche@acm.org>; Jaegeuk Kim 
>> <jaegeuk@kernel.org>;
>> Adrian Hunter <adrian.hunter@intel.com>; Keoseong Park
>> <keosung.park@samsung.com>; open list <linux-kernel@vger.kernel.org>
>> Subject: [PATCH v1 1/2] scsi: ufs: export hibern8 entry and exit
>> 
>> From: Asutosh Das <asutoshd@codeaurora.org>
>> 
>> Qualcomm controllers need to be in hibern8 before scaling up or down 
>> the
>> clocks. Hence, export the hibern8 entry and exit functions.
>> 
>> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
>> Signed-off-by: Bao D. Nguyen <nguyenb@codeaurora.org>
>> ---
>> drivers/scsi/ufs/ufshcd.c | 4 ++--
>> drivers/scsi/ufs/ufshcd.h | 2 ++
>> 2 files changed, 4 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c 
>> index
>> 3841ab49..f3aad32 100644
>> --- a/drivers/scsi/ufs/ufshcd.c
>> +++ b/drivers/scsi/ufs/ufshcd.c
>> @@ -227,7 +227,6 @@ static void ufshcd_hba_exit(struct ufs_hba *hba);
> static
>> int ufshcd_clear_ua_wluns(struct ufs_hba *hba);  static int
>> ufshcd_probe_hba(struct ufs_hba *hba, bool async);  static int
>> ufshcd_setup_clocks(struct ufs_hba *hba, bool on); -static int
>> ufshcd_uic_hibern8_enter(struct ufs_hba *hba);  static inline void
>> ufshcd_add_delay_before_dme_cmd(struct ufs_hba *hba);  static int
>> ufshcd_host_reset_and_restore(struct ufs_hba *hba);  static void
>> ufshcd_resume_clkscaling(struct ufs_hba *hba); @@ -4116,7 +4115,7 @@ 
>> int
>> ufshcd_link_recovery(struct ufs_hba *hba)  }
>> EXPORT_SYMBOL_GPL(ufshcd_link_recovery);
>> 
>> -static int ufshcd_uic_hibern8_enter(struct ufs_hba *hba)
>> +int ufshcd_uic_hibern8_enter(struct ufs_hba *hba)
>> {
>> 	int ret;
>> 	struct uic_command uic_cmd = {0};
>> @@ -4138,6 +4137,7 @@ static int ufshcd_uic_hibern8_enter(struct 
>> ufs_hba
>> *hba)
>> 
>> 	return ret;
>> }
>> +EXPORT_SYMBOL_GPL(ufshcd_uic_hibern8_enter);
>> 
>> int ufshcd_uic_hibern8_exit(struct ufs_hba *hba)  { diff --git
>> a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h index
> 52ea6f3..0cc55a2
>> 100644
>> --- a/drivers/scsi/ufs/ufshcd.h
>> +++ b/drivers/scsi/ufs/ufshcd.h
>> @@ -1397,4 +1397,6 @@ static inline int ufshcd_rpmb_rpm_put(struct 
>> ufs_hba
>> *hba)
>> 	return pm_runtime_put(&hba->sdev_rpmb->sdev_gendev);
>> }
>> 
>> +int ufshcd_uic_hibern8_enter(struct ufs_hba *hba); int
>> +ufshcd_uic_hibern8_exit(struct ufs_hba *hba);
> 
> This will add ufshcd_uic_hibern8_exit() twice, it is already add by
> commit: 9d19bf7ad168a8: scsi: ufs: export some functions for vendor 
> usage
Thank you, Alim. I have corrected this in Patch V2.

> 
> Also move ufshcd_uic_hibern8_enter() before _earlier_
> ufshcd_uic_hibern8_exit() declaration.
Yes, I have addressed this in the Patch V2. Please review.
Thank you.

> 
>> #endif /* End of Header */
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum,
> a
>> Linux Foundation Collaborative Project
