Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA36222FF7F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jul 2020 04:21:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726362AbgG1CVn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jul 2020 22:21:43 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:34259 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726315AbgG1CVm (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jul 2020 22:21:42 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595902901; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Nd3Ki8cCx7FejuxD0mDfmmNE6PX98h/D7XuxA2n5jFE=;
 b=IMUXWR0rUY4F6oaOCrbH87DUs/P892xXoVgf6dl4k9cmL/Kf3+PV+ySPXzKH+DkIwJY9lGHe
 /MBZCNuGrYedEPONLKq2+kCBxiUap5J05mwt52k+rmyudrjKmvPnfOZmYHBfEPg+rb1m5k5l
 yuYatwZysT/UbDMHpFGOgtcmzCg=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5f1f8bb536e6de324e42f610 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 28 Jul 2020 02:21:41
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D132FC433CB; Tue, 28 Jul 2020 02:21:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: cang)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B9333C433C6;
        Tue, 28 Jul 2020 02:21:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 28 Jul 2020 10:21:38 +0800
From:   Can Guo <cang@codeaurora.org>
To:     Avri Altman <Avri.Altman@wdc.com>
Cc:     asutoshd@codeaurora.org, nguyenb@codeaurora.org,
        hongwus@codeaurora.org, rnayak@codeaurora.org,
        sh425.lee@samsung.com, linux-scsi@vger.kernel.org,
        kernel-team@android.com, saravanak@google.com, salyzyn@google.com,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 3/8] scsi: ufs-qcom: Fix schedule while atomic error in
 ufs_qcom_dump_dbg_regs
In-Reply-To: <SN6PR04MB4640F4CEAB7F5FFA51648B6CFC720@SN6PR04MB4640.namprd04.prod.outlook.com>
References: <1595504787-19429-1-git-send-email-cang@codeaurora.org>
 <1595504787-19429-4-git-send-email-cang@codeaurora.org>
 <SN6PR04MB4640F4CEAB7F5FFA51648B6CFC720@SN6PR04MB4640.namprd04.prod.outlook.com>
Message-ID: <e828fd80f3fe9d0f64a5629eebd5a345@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Avri,

On 2020-07-27 21:05, Avri Altman wrote:
>> Dumping testbus registers needs to sleep a bit intermittently as there 
>> are
>> too many of them. Skip them for those contexts where sleep is not 
>> allowed.
>> 
>> Signed-off-by: Can Guo <cang@codeaurora.org>
>> ---
>>  drivers/scsi/ufs/ufs-qcom.c | 15 +++++++++------
>>  1 file changed, 9 insertions(+), 6 deletions(-)
>> 
>> diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
>> index 7da27ee..7831b2b 100644
>> --- a/drivers/scsi/ufs/ufs-qcom.c
>> +++ b/drivers/scsi/ufs/ufs-qcom.c
>> @@ -1651,13 +1651,16 @@ static void ufs_qcom_dump_dbg_regs(struct
>> ufs_hba *hba)
>>         ufshcd_dump_regs(hba, REG_UFS_SYS1CLK_1US, 16 * 4,
>>                          "HCI Vendor Specific Registers ");
>> 
>> -       /* sleep a bit intermittently as we are dumping too much data 
>> */
>>         ufs_qcom_print_hw_debug_reg_all(hba, NULL,
>> ufs_qcom_dump_regs_wrapper);
>> -       udelay(1000);
>> -       ufs_qcom_testbus_read(hba);
>> -       udelay(1000);
>> -       ufs_qcom_print_unipro_testbus(hba);
>> -       udelay(1000);
>> +
>> +       if (in_task()) {
>> +               /* sleep a bit intermittently as we are dumping too 
>> much data */
>> +               usleep_range(1000, 1100);
>> +               ufs_qcom_testbus_read(hba);
>> +               usleep_range(1000, 1100);
>> +               ufs_qcom_print_unipro_testbus(hba);
>> +               usleep_range(1000, 1100);
>> +       }
>>  }
> How about moving the intermittent sleep out of the check if preemption
> is disabled?
> And maybe then you need to switch back to uedlay?

I will just remove all the testbus prints in next version to save us 
time here.

Thanks,

Can Guo.
