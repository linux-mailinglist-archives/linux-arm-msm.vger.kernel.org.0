Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2E9036279D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Apr 2021 20:22:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244728AbhDPSWY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Apr 2021 14:22:24 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:19290 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244671AbhDPSWY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Apr 2021 14:22:24 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1618597319; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=kVxxHWGXgfHGZWYXemFNetuQ9QkDGOKq4KF+Razehig=; b=GD1Jh4rIZ20pgrmw1hDn47zqXQhgrltKEqsZy4nQIR+KNbqz2ui5VzKMjCkSWd0Ed5e50azy
 SJZoA4dI9h2uCQYu3cH+cEaD/w/Xz3tPXDNx7Nh8ttk7y3CcAKdBzZNYr2iKrzRBnv6fzE2y
 elb3M9x+Si1/G3Of3ovjiBNKc9g=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 6079d5c12cc44d3aeadb8f58 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 16 Apr 2021 18:21:53
 GMT
Sender: asutoshd=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2E69BC43465; Fri, 16 Apr 2021 18:21:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.8.168] (cpe-70-95-149-85.san.res.rr.com [70.95.149.85])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: asutoshd)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3F772C433CA;
        Fri, 16 Apr 2021 18:21:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3F772C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=asutoshd@codeaurora.org
Subject: Re: [PATCH v18 1/2] scsi: ufs: Enable power management for wlun
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
        Lee Jones <lee.jones@linaro.org>,
        Bean Huo <beanhuo@micron.com>,
        Kiwoong Kim <kwmad.kim@samsung.com>,
        Yue Hu <huyue2@yulong.com>,
        Wei Yongjun <weiyongjun1@huawei.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Dinghao Liu <dinghao.liu@zju.edu.cn>,
        Jaegeuk Kim <jaegeuk@kernel.org>,
        Satya Tangirala <satyat@google.com>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" 
        <linux-samsung-soc@vger.kernel.org>,
        "moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..." 
        <linux-mediatek@lists.infradead.org>
References: <cover.1618426513.git.asutoshd@codeaurora.org>
 <d1a6af736730b9d79f977100286c5d9325546ac2.1618426513.git.asutoshd@codeaurora.org>
 <f111e363-c709-fe3c-65da-450c9e9e3408@acm.org>
From:   "Asutosh Das (asd)" <asutoshd@codeaurora.org>
Message-ID: <9ae35c14-f8aa-a181-2259-2d32bd2c1f07@codeaurora.org>
Date:   Fri, 16 Apr 2021 11:21:48 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <f111e363-c709-fe3c-65da-450c9e9e3408@acm.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 4/15/2021 4:11 PM, Bart Van Assche wrote:
> On 4/14/21 11:58 AM, Asutosh Das wrote:
>> [ ... ]
> 
Hi Bart,
Thanks for the comments. I will fix the comments in the next version.

> The following code is executed before ufshcd_async_scan() is called:
> 
> 	dev = hba->dev;
> 	[ ... ]
> 	/* Hold auto suspend until async scan completes */
> 	pm_runtime_get_sync(dev);
> 
That would only keep the hba runtime resumed. At this point of time the 
luns are not detected yet.
> and the following code occurs in ufshcd_add_lus():
> 
> 	pm_runtime_put_sync(hba->dev);
> 
> Isn't that sufficient to postpone enabling of runtime PM until LUN
> scanning has finished? Or in other words, is adding a
> pm_runtime_get_noresume() call in ufshcd_slave_configure() really necessary?
> 
Yes, because the supplier (device wlun) may be suspended otherwise in 
scsi_sysfs_add_sdev().
>> @@ -4979,15 +5035,9 @@ ufshcd_transfer_rsp_status(struct ufs_hba *hba, struct ufshcd_lrb *lrbp)
>>   			 */
>>   			if (!hba->pm_op_in_progress &&
>>   			    !ufshcd_eh_in_progress(hba) &&
>> -			    ufshcd_is_exception_event(lrbp->ucd_rsp_ptr) &&
>> -			    schedule_work(&hba->eeh_work)) {
>> -				/*
>> -				 * Prevent suspend once eeh_work is scheduled
>> -				 * to avoid deadlock between ufshcd_suspend
>> -				 * and exception event handler.
>> -				 */
>> -				pm_runtime_get_noresume(hba->dev);
>> -			}
>> +			    ufshcd_is_exception_event(lrbp->ucd_rsp_ptr))
>> +				/* Flushed in suspend */
>> +				schedule_work(&hba->eeh_work);
> 
> What makes it safe to leave out the above pm_runtime_get_noresume() call?
> 
The __ufshcd_wl_suspend() would flush this work so that it doesn't run 
after suspend.
> Thanks,
> 
> Bart.
> 


-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
Linux Foundation Collaborative Project
