Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2938342091
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Mar 2021 16:09:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231126AbhCSPJP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Mar 2021 11:09:15 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:48583 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231186AbhCSPJB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Mar 2021 11:09:01 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1616166541; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=er9VP5xtbj1RcZoesk+6RSiuR+svOzZFsLimRNPx0Ig=; b=aBsGghurXDhczJOL5PzLNynwdB8pB3QR7JA4OYekcx9uvDzvzTeSCq5nOc3iQJPMuKdEuMdI
 bXhv8XGYERbTkscAJIMZfQuEGMToGC3wbmzbYQb8f4Y5/Jjt0RCDCMb5J8dGlEG4VljgEzpK
 pURiCVSK87SPuGJvAyTLCaJTV7I=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 6054be78c32ceb3a91998f7b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 19 Mar 2021 15:08:40
 GMT
Sender: asutoshd=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 564C2C4346A; Fri, 19 Mar 2021 15:08:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.8.168] (cpe-70-95-149-85.san.res.rr.com [70.95.149.85])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: asutoshd)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8A7E5C433C6;
        Fri, 19 Mar 2021 15:08:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8A7E5C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=asutoshd@codeaurora.org
Subject: Re: [PATCH v12 1/2] scsi: ufs: Enable power management for wlun
To:     Bart Van Assche <bvanassche@acm.org>, cang@codeaurora.org,
        martin.petersen@oracle.com, adrian.hunter@intel.com,
        linux-scsi@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Pedro Sousa <pedrom.sousa@synopsys.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Bean Huo <beanhuo@micron.com>,
        Kiwoong Kim <kwmad.kim@samsung.com>,
        Wei Yongjun <weiyongjun1@huawei.com>,
        Lee Jones <lee.jones@linaro.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Dinghao Liu <dinghao.liu@zju.edu.cn>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Jaegeuk Kim <jaegeuk@kernel.org>,
        Satya Tangirala <satyat@google.com>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" 
        <linux-samsung-soc@vger.kernel.org>,
        "moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..." 
        <linux-mediatek@lists.infradead.org>
References: <cover.1616113283.git.asutoshd@codeaurora.org>
 <56662082b6a17b448f40d87df7e52b45a5998c2a.1616113283.git.asutoshd@codeaurora.org>
 <e9dc046d-3a88-9802-df58-60209ea8484f@acm.org>
From:   "Asutosh Das (asd)" <asutoshd@codeaurora.org>
Message-ID: <45101050-83de-6488-7b17-271e0acea87b@codeaurora.org>
Date:   Fri, 19 Mar 2021 08:08:35 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <e9dc046d-3a88-9802-df58-60209ea8484f@acm.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 3/18/2021 8:12 PM, Bart Van Assche wrote:
> On 3/18/21 5:35 PM, Asutosh Das wrote:
>> During runtime-suspend of ufs host, the scsi devices are
>> already suspended and so are the queues associated with them.
>> But the ufs host sends SSU to wlun during its runtime-suspend.
>> During the process blk_queue_enter checks if the queue is not in
>> suspended state. If so, it waits for the queue to resume, and never
>> comes out of it.
>> The commit
>> (d55d15a33: scsi: block: Do not accept any requests while suspended)
>> adds the check if the queue is in suspended state in blk_queue_enter().
> 
Hi Bart,
Thanks for the review comments.

> What is the role of the WLUN during runtime suspend and why does a
> command need to be sent to the WLUN during runtime suspend? Although it
> is possible to derive this from the source code, please explain this in
> the patch description.
> 
Ok. Will explain it in the next version.

> What does the acronym SSU stand for? This doesn't seem like a commonly
> used kernel acronym to me so please expand that acronym.
>
START STOP UNIT.
Anyway, I'll expand it in the next version.

>> Fix this by registering ufs device wlun as a scsi driver and
>> registering it for block runtime-pm. Also make this as a
>> supplier for all other luns. That way, this device wlun
>> suspends after all the consumers and resumes after
>> hba resumes.
> 
> That's an interesting solution.
> 
>> -void __exit ufs_debugfs_exit(void)
>> +void ufs_debugfs_exit(void)
> 
> Is the above change related to the rest of this patch?
> 
Yes, it's used to handle an error in ufshcd_core_init() function.

>>   static struct platform_driver ufs_qcom_pltform = {
>> diff --git a/drivers/scsi/ufs/ufs_bsg.c b/drivers/scsi/ufs/ufs_bsg.c
>> index 5b2bc1a..cbb5a90 100644
>> --- a/drivers/scsi/ufs/ufs_bsg.c
>> +++ b/drivers/scsi/ufs/ufs_bsg.c
>> @@ -97,7 +97,7 @@ static int ufs_bsg_request(struct bsg_job *job)
>>   
>>   	bsg_reply->reply_payload_rcv_len = 0;
>>   
>> -	pm_runtime_get_sync(hba->dev);
>> +	scsi_autopm_get_device(hba->sdev_ufs_device);
> 
> Can the pm_runtime_get_sync() to scsi_autopm_get_device() changes be
> moved into a separate patch?
>
I guess so. But then this patch would have issues when used independently.

>> +static inline bool is_rpmb_wlun(struct scsi_device *sdev)
>> +{
>> +	return (sdev->lun == ufshcd_upiu_wlun_to_scsi_wlun(UFS_UPIU_RPMB_WLUN));
>> +}
> 
> Has this patch been verified with checkpatch? Checkpatch should have
> reported the following for the above code:
> 
> 	return is not a function, parentheses are not required
> 
Yes, it has been verified. But I didn't see any error reports.
Below is the o/p of checkpatch:

$ ./scripts/checkpatch.pl /tmp/up/ufs-pm-v12/*
------------------------------------------
/tmp/up/ufs-pm-v12/0000-cover-letter.patch
------------------------------------------
WARNING: Possible unwrapped commit description (prefer a maximum 75 
chars per line)
#107:
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a 
Linux Foundation Collaborative Project.

total: 0 errors, 1 warnings, 0 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
       mechanically convert to the typical style using --fix or 
--fix-inplace.

/tmp/up/ufs-pm-v12/0000-cover-letter.patch has style problems, please 
review.
-----------------------------------------------------------------------
/tmp/up/ufs-pm-v12/0001-scsi-ufs-Enable-power-management-for-wlun.patch
-----------------------------------------------------------------------
total: 0 errors, 0 warnings, 1180 lines checked

/tmp/up/ufs-pm-v12/0001-scsi-ufs-Enable-power-management-for-wlun.patch 
has no obvious style problems and is ready for submission.
---------------------------------------------------------------------
/tmp/up/ufs-pm-v12/0002-ufs-sysfs-Resume-the-proper-scsi-device.patch
---------------------------------------------------------------------
total: 0 errors, 0 warnings, 91 lines checked

/tmp/up/ufs-pm-v12/0002-ufs-sysfs-Resume-the-proper-scsi-device.patch 
has no obvious style problems and is ready for submission.

NOTE: If any of the errors are false positives, please report
       them to the maintainer, see CHECKPATCH in MAINTAINERS.


>> +static inline bool is_device_wlun(struct scsi_device *sdev)
>> +{
>> +	return (sdev->lun ==
>> +		ufshcd_upiu_wlun_to_scsi_wlun(UFS_UPIU_UFS_DEVICE_WLUN));
>> +}
> 
> Same comment here.
> 
>>   		/*
>> -		 * Don't assume anything of pm_runtime_get_sync(), if
>> +		 * Don't assume anything of resume, if
>>   		 * resume fails, irq and clocks can be OFF, and powers
>>   		 * can be OFF or in LPM.
>>   		 */
> 
> Please make better use of the horizontal space in the above comment by
> making comment lines longer.
> 
Ok Sure.

> Thanks,
> 
> Bart.
> 

-asd

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
Linux Foundation Collaborative Project
