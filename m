Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDDD4369D85
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Apr 2021 01:44:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232508AbhDWXpL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Apr 2021 19:45:11 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:53778 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229718AbhDWXpJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Apr 2021 19:45:09 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1619221472; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=1rAl4/SGpigHk/EP46KWRcz1cpKU6hDAhQ42+J5NZgM=; b=AM2+gIq8vSPxCgpWDjC0NRVHT2Hgv2zNf5cBhI7rOimIHtpau/uoGcqOezGH2UD1DSMpJGlD
 XQPeZr7rZYdORMWI1SccDOdk5kESOac6UKo205bWkovZGPp42QeSbPZlNBl62ojlLi0BMWt9
 CjDZoog6n/AV3LGRaePqPTKBlf8=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 60835bde215b831afb965f69 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 23 Apr 2021 23:44:30
 GMT
Sender: asutoshd=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 27212C43145; Fri, 23 Apr 2021 23:44:29 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.8.168] (cpe-70-95-149-85.san.res.rr.com [70.95.149.85])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: asutoshd)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 40434C433D3;
        Fri, 23 Apr 2021 23:44:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 40434C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=asutoshd@codeaurora.org
Subject: Re: [PATCH v20 1/2] scsi: ufs: Enable power management for wlun
To:     Adrian Hunter <adrian.hunter@intel.com>, cang@codeaurora.org,
        martin.petersen@oracle.com, linux-scsi@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
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
        Colin Ian King <colin.king@canonical.com>,
        Wei Yongjun <weiyongjun1@huawei.com>,
        Yue Hu <huyue2@yulong.com>,
        Bart van Assche <bvanassche@acm.org>,
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
References: <cover.1618600985.git.asutoshd@codeaurora.org>
 <d660b8d4e1fb192810abd09a8ff0ef4d9f6b96cd.1618600985.git.asutoshd@codeaurora.org>
 <fdadd467-b613-d800-18c5-be064396fd10@intel.com>
 <07e3ea07-e1c3-7b8c-e398-8b008f873e6d@codeaurora.org>
 <90809796-1c32-3709-13d3-65e4d5c387cc@intel.com>
 <1bc4a73e-b22a-6bad-2583-3a0ffa979414@intel.com>
 <651f5d8a-5ab7-77dd-3fed-05feb3fd3e1a@codeaurora.org>
 <efe71230-5b6a-22a8-1aef-f1cae046df22@intel.com>
 <e6f3946a-dbe7-6b42-e43c-d3f8d705c732@intel.com>
 <973e0bbb-ac2d-7196-2e25-37aee2b77b46@intel.com>
From:   "Asutosh Das (asd)" <asutoshd@codeaurora.org>
Message-ID: <a71d6ac3-0dc6-4fa8-3643-6d3473d08797@codeaurora.org>
Date:   Fri, 23 Apr 2021 16:44:26 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <973e0bbb-ac2d-7196-2e25-37aee2b77b46@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 4/23/2021 1:01 AM, Adrian Hunter wrote:
>>
>>
> 

Hi Adrian,
Thanks for the help.
I made the changes and tried to reproduce it.
My setup becomes non-responsive and resets.
I don't think it's related to this issue though.

I hadn't set rpm_lvl and spm_lvl to 0 while testing the other day.
Setting those to 0, it proceeds further and now it becomes unresponsive. 
So I still don't clearly see the issue that you're seeing. However, I'd 
make the suggested changes and push it in next version.

> I think we also need to runtime resume RPMB WLUN before system suspend.
> e.g.
> 
> +static int ufshcd_rpmb_rpm_get_sync(struct ufs_hba *hba)
> +{
> +	return pm_runtime_get_sync(&hba->sdev_rpmb->sdev_gendev);
> +}
> +
> +static int ufshcd_rpmb_rpm_put(struct ufs_hba *hba)
> +{
> +	return pm_runtime_put(&hba->sdev_rpmb->sdev_gendev);
> +}
> +
>   void ufshcd_resume_complete(struct device *dev)
>   {
>   	struct ufs_hba *hba = dev_get_drvdata(dev);
>   
> +	if (hba->rpmb_complete_put) {
> +		hba->rpmb_complete_put = false;
> +		ufshcd_rpmb_rpm_put(hba);
> +	}
>   	if (hba->complete_put) {
>   		hba->complete_put = false;
>   		ufshcd_rpm_put(hba);
> @@ -9611,6 +9625,11 @@ int ufshcd_suspend_prepare(struct device *dev)
>   		return ret;
>   	}
>   	hba->complete_put = true;
> +
> +	if (hba->sdev_rpmb) {
> +		ufshcd_rpmb_rpm_get_sync(hba);
> +		hba->rpmb_complete_put = true;
> +	}
>   	return 0;
>   }
> 
> That also avoids another issue: if RPMB WLUN is runtime suspended at system resume, we have to skip clearing UAC, but SCSI PM will force the runtime status to RPM_ACTIVE after system resume, so the UAC never gets cleared in that case.
> 
> Furthermore, it seems better not to report errors from RPMB resume and instead let the error handler sort it out.
> So, with the above change, we can simplify a bit:
> 
> -static int ufshcd_rpmb_runtime_resume(struct device *dev)
> -{
> -	struct ufs_hba *hba = wlun_dev_to_hba(dev);
> -
> -	if (hba->sdev_rpmb)
> -		return ufshcd_clear_rpmb_uac(hba);
> -	return 0;
> -}
> -
>   static int ufshcd_rpmb_resume(struct device *dev)
>   {
>   	struct ufs_hba *hba = wlun_dev_to_hba(dev);
>   
> -	if (hba->sdev_rpmb && !pm_runtime_suspended(dev))
> -		return ufshcd_clear_rpmb_uac(hba);
> +	if (hba->sdev_rpmb)
> +		ufshcd_clear_rpmb_uac(hba);
>   	return 0;
>   }
>   
>   static const struct dev_pm_ops ufs_rpmb_pm_ops = {
> -	SET_RUNTIME_PM_OPS(NULL, ufshcd_rpmb_runtime_resume, NULL)
> +	SET_RUNTIME_PM_OPS(NULL, ufshcd_rpmb_resume, NULL)
>   	SET_SYSTEM_SLEEP_PM_OPS(NULL, ufshcd_rpmb_resume)
>   };
> 
> 


-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
Linux Foundation Collaborative Project
