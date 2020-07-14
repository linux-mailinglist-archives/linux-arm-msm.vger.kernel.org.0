Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21D6E21E6C2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2020 06:17:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725781AbgGNERO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Jul 2020 00:17:14 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:13522 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725768AbgGNERN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Jul 2020 00:17:13 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594700233; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Foat0KbYY6EOSlt1z9mAx4zGSNaBw/U4YiW8LDumGYA=;
 b=bhEFOsr0Fe4f/2LJPdXGt/zx5QxZhIPSdvEILXT/MIsZavUDk+Yl9jIKlicBKQ9KlvTM5bNS
 RxcvR6H4yLzwVe77vnMSrFCVCOXBmWHhteVqh4+Qmw+UJMcWZcpM1Dp4H+fPqLEs0XxvhZNj
 NaxBYtqp13XuUAdjihV9LvoDbos=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5f0d31c9ee6926bb4fb3cd99 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 14 Jul 2020 04:17:13
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 981F3C433A1; Tue, 14 Jul 2020 04:17:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: cang)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9DEABC433CA;
        Tue, 14 Jul 2020 04:17:11 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 14 Jul 2020 12:17:11 +0800
From:   Can Guo <cang@codeaurora.org>
To:     Bart Van Assche <bvanassche@acm.org>
Cc:     asutoshd@codeaurora.org, nguyenb@codeaurora.org,
        hongwus@codeaurora.org, rnayak@codeaurora.org,
        linux-scsi@vger.kernel.org, kernel-team@android.com,
        saravanak@google.com, salyzyn@google.com,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/4] ufs: ufs-qcom: Fix a few BUGs in func
 ufs_qcom_dump_dbg_regs()
In-Reply-To: <7b0f8a73-d49d-eb7d-defe-8e77a49064ae@acm.org>
References: <1594693693-22466-1-git-send-email-cang@codeaurora.org>
 <1594693693-22466-4-git-send-email-cang@codeaurora.org>
 <7b0f8a73-d49d-eb7d-defe-8e77a49064ae@acm.org>
Message-ID: <365144280b854f1130c0c3259198fc0b@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bart,

On 2020-07-14 11:47, Bart Van Assche wrote:
> On 2020-07-13 19:28, Can Guo wrote:
>> Dumping testbus registers needs to sleep a bit intermittently as there 
>> are
>> too many of them. Skip them for those contexts where sleep is not 
>> allowed.
>> 
>> Meanwhile, if ufs_qcom_dump_dbg_regs() calls ufs_qcom_testbus_config() 
>> from
>> ufshcd_suspend/resume and/or clk gate/ungate context, 
>> pm_runtime_get_sync()
>> and ufshcd_hold() will cause racing problems. Fix it by removing the
>> unnecessary calls of pm_runtime_get_sync() and ufshcd_hold().
>> 
>> Signed-off-by: Can Guo <cang@codeaurora.org>
>> ---
>>  drivers/scsi/ufs/ufs-qcom.c | 17 +++++++----------
>>  1 file changed, 7 insertions(+), 10 deletions(-)
>> 
>> diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
>> index 2e6ddb5..3743c17 100644
>> --- a/drivers/scsi/ufs/ufs-qcom.c
>> +++ b/drivers/scsi/ufs/ufs-qcom.c
>> @@ -1604,9 +1604,6 @@ int ufs_qcom_testbus_config(struct ufs_qcom_host 
>> *host)
>>  	 */
>>  	}
>>  	mask <<= offset;
>> -
>> -	pm_runtime_get_sync(host->hba->dev);
>> -	ufshcd_hold(host->hba, false);
>>  	ufshcd_rmwl(host->hba, TEST_BUS_SEL,
>>  		    (u32)host->testbus.select_major << 19,
>>  		    REG_UFS_CFG1);
>> @@ -1619,8 +1616,6 @@ int ufs_qcom_testbus_config(struct ufs_qcom_host 
>> *host)
>>  	 * committed before returning.
>>  	 */
>>  	mb();
>> -	ufshcd_release(host->hba);
>> -	pm_runtime_put_sync(host->hba->dev);
>> 
>>  	return 0;
>>  }
>> @@ -1658,11 +1653,13 @@ static void ufs_qcom_dump_dbg_regs(struct 
>> ufs_hba *hba)
>> 
>>  	/* sleep a bit intermittently as we are dumping too much data */
>>  	ufs_qcom_print_hw_debug_reg_all(hba, NULL, 
>> ufs_qcom_dump_regs_wrapper);
>> -	udelay(1000);
>> -	ufs_qcom_testbus_read(hba);
>> -	udelay(1000);
>> -	ufs_qcom_print_unipro_testbus(hba);
>> -	udelay(1000);
>> +	if (in_task()) {
>> +		udelay(1000);
>> +		ufs_qcom_testbus_read(hba);
>> +		udelay(1000);
>> +		ufs_qcom_print_unipro_testbus(hba);
>> +		udelay(1000);
>> +	}
>>  }
> 
> It is not clear to me how udelay() calls can help in code that takes 
> long
> since these functions use busy-waiting? Should the udelay() calls 
> perhaps
> be changed into cond_resched() calls?
> 
> Thanks,
> 
> Bart.

Maybe you are right, but this is not the purpose of this change. I am 
just
trying to make sure this func can be invoked from any contexts without
making troubles like schedule while atomic and/or race conditions.

Thanks,

Can Guo.
