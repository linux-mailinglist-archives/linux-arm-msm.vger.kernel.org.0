Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70802368E3F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Apr 2021 10:01:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230192AbhDWIC1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Apr 2021 04:02:27 -0400
Received: from mga07.intel.com ([134.134.136.100]:15111 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229456AbhDWICT (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Apr 2021 04:02:19 -0400
IronPort-SDR: OVcdnXO3ngviI+V/XSvKVrAQkYYU7pWf5QSHLvxSvLnPwkdX/0fjyUxvtXeudrUYeD9utkZWmd
 rrc2vOVgXrAQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9962"; a="259987375"
X-IronPort-AV: E=Sophos;i="5.82,245,1613462400"; 
   d="scan'208";a="259987375"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2021 01:01:33 -0700
IronPort-SDR: B+jDDshXQ4HBTrC8y4VRZeYWSWjvMI++V6PQCfLyHHJLNOkGn71O7KJZopWpcMb9PkP4ID4Z+g
 KE8SreohSb4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,245,1613462400"; 
   d="scan'208";a="453511686"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.174]) ([10.237.72.174])
  by FMSMGA003.fm.intel.com with ESMTP; 23 Apr 2021 01:01:26 -0700
Subject: Re: [PATCH v20 1/2] scsi: ufs: Enable power management for wlun
From:   Adrian Hunter <adrian.hunter@intel.com>
To:     "Asutosh Das (asd)" <asutoshd@codeaurora.org>, cang@codeaurora.org,
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
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <973e0bbb-ac2d-7196-2e25-37aee2b77b46@intel.com>
Date:   Fri, 23 Apr 2021 11:01:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <e6f3946a-dbe7-6b42-e43c-d3f8d705c732@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/04/21 9:18 am, Adrian Hunter wrote:
> On 23/04/21 7:23 am, Adrian Hunter wrote:
>> On 22/04/21 7:38 pm, Asutosh Das (asd) wrote:
>>> On 4/20/2021 12:42 AM, Adrian Hunter wrote:
>>>> On 20/04/21 7:15 am, Adrian Hunter wrote:
>>>>> On 20/04/21 12:53 am, Asutosh Das (asd) wrote:
>>>>>> On 4/19/2021 11:37 AM, Adrian Hunter wrote:
>>>>>>> On 16/04/21 10:49 pm, Asutosh Das wrote:
>>>>>>>>
>>>>>>>> Co-developed-by: Can Guo <cang@codeaurora.org>
>>>>>>>> Signed-off-by: Can Guo <cang@codeaurora.org>
>>>>>>>> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
>>>>>>>> ---
>>>>>>>
>>>>>>> I came across 3 issues while testing.  See comments below.
>>>>>>>
>>>>>> Hi Adrian
>>>>>> Thanks for the comments.
>>>>>>> <SNIP>
>>>>>>>
>>>>>>>> @@ -5794,7 +5839,7 @@ static void ufshcd_err_handling_unprepare(struct ufs_hba *hba)
>>>>>>>>        if (ufshcd_is_clkscaling_supported(hba))
>>>>>>>>            ufshcd_clk_scaling_suspend(hba, false);
>>>>>>>>        ufshcd_clear_ua_wluns(hba);
>>>>>>>
>>>>>>> ufshcd_clear_ua_wluns() deadlocks trying to clear UFS_UPIU_RPMB_WLUN
>>>>>>> if sdev_rpmb is suspended and sdev_ufs_device is suspending.
>>>>>>> e.g. ufshcd_wl_suspend() is waiting on host_sem while ufshcd_err_handler()
>>>>>>> is running, at which point sdev_rpmb has already suspended.
>>>>>>>
>>>>>> Umm, I didn't understand this deadlock.
>>>>>> When you say, sdev_rpmb is suspended, does it mean runtime_suspended?
>>>>>> sdev_ufs_device is suspending - this can't be runtime_suspending, while ufshcd_err_handling_unprepare is running.
>>>>>>
>>>>>> If you've a call-stack of this deadlock, please can you share it with me. I'll also try to reproduce this.
>>>>>
>>>>> Yes it is system suspend. sdev_rpmb has suspended, sdev_ufs_device is waiting on host_sem.
>>>>> ufshcd_err_handler() holds host_sem. ufshcd_clear_ua_wlun(UFS_UPIU_RPMB_WLUN) gets stuck.
>>>>> I will get some call-stacks.
>>>>
>>> Hi Adrian,
>>>
>>> Thanks for the call stacks.
>>> From the current information, I can't say for sure why it'd get stuck in blk_queue_enter().
>>
>> I presume SCSI is leaving the RPMB WLUN device runtime suspended and consequently the queue status is RPM_SUSPENDED
>>
>>>
>>> I tried reproducing this issue on my setup yesterday but couldn't.
>>> Here's what I did:
>>> 1. sdev_rpmb is RPM_SUSPENDED, checked before initiating system suspend
>>> 2. sdev_ufs_device is RPM_RESUMED
>>> 3. I triggered system suspend (echo mem > /sys/power/state) and scheduled the error handler from ufshcd_wl_suspend().
>>> 4. Waited until error handler ran and then ufshcd_wl_suspend() blocks on host_sem.
>>> 5. The ufshcd_clear_wa_wlun(UFS_UPIU_RPMB_WLUN) went through fine.
>>>
>>> Do you've some specific steps to reproduce this or a script, perhaps? If so, please can you share it with me. I will try again.
>>
>> I was using a device that gives occasional errors, but I will what see I can do.
> 
> I have attached 2 patches to reproduce the issue, and the test script I used.
> Note it is using down_timeout() so it doesn't lock up completely.
> The kernel messages are:
> 
> [   79.385456] ufshcd_wl_suspend: doing ufshcd_schedule_eh_work
> [   79.385511] ufshcd_wl_suspend: sleeping 1000 ms
> [   79.386916] ufshcd_err_handler: start
> [   79.386979] ufshcd_err_handler: got sem
> [   79.387053] ufshcd_err_handling_unprepare: start
> [   79.387302] ufshcd_clear_ua_wluns: before ufshcd_clear_ua_wlun(hba, UFS_UPIU_RPMB_WLUN)
> [   80.435878] ufshcd_wl_suspend: trying to get sem
> [   85.683876] ufshcd_wl_suspend: failed to get sem
> [   85.683993] ufs_device_wlun 0:0:0:49488: PM: failed to suspend async: error -22
> [   85.686901] ufshcd_clear_ua_wluns: after ufshcd_clear_ua_wlun(hba, UFS_UPIU_RPMB_WLUN), ret 0
> [   85.687025] ufshcd_err_handling_unprepare: finish
> [   85.687090] ufshcd_err_handler: finish 
> 
> 

I think we also need to runtime resume RPMB WLUN before system suspend.
e.g.

+static int ufshcd_rpmb_rpm_get_sync(struct ufs_hba *hba)
+{
+	return pm_runtime_get_sync(&hba->sdev_rpmb->sdev_gendev);
+}
+
+static int ufshcd_rpmb_rpm_put(struct ufs_hba *hba)
+{
+	return pm_runtime_put(&hba->sdev_rpmb->sdev_gendev);
+}
+
 void ufshcd_resume_complete(struct device *dev)
 {
 	struct ufs_hba *hba = dev_get_drvdata(dev);
 
+	if (hba->rpmb_complete_put) {
+		hba->rpmb_complete_put = false;
+		ufshcd_rpmb_rpm_put(hba);
+	}
 	if (hba->complete_put) {
 		hba->complete_put = false;
 		ufshcd_rpm_put(hba);
@@ -9611,6 +9625,11 @@ int ufshcd_suspend_prepare(struct device *dev)
 		return ret;
 	}
 	hba->complete_put = true;
+
+	if (hba->sdev_rpmb) {
+		ufshcd_rpmb_rpm_get_sync(hba);
+		hba->rpmb_complete_put = true;
+	}
 	return 0;
 }

That also avoids another issue: if RPMB WLUN is runtime suspended at system resume, we have to skip clearing UAC, but SCSI PM will force the runtime status to RPM_ACTIVE after system resume, so the UAC never gets cleared in that case.

Furthermore, it seems better not to report errors from RPMB resume and instead let the error handler sort it out.
So, with the above change, we can simplify a bit:

-static int ufshcd_rpmb_runtime_resume(struct device *dev)
-{
-	struct ufs_hba *hba = wlun_dev_to_hba(dev);
-
-	if (hba->sdev_rpmb)
-		return ufshcd_clear_rpmb_uac(hba);
-	return 0;
-}
-
 static int ufshcd_rpmb_resume(struct device *dev)
 {
 	struct ufs_hba *hba = wlun_dev_to_hba(dev);
 
-	if (hba->sdev_rpmb && !pm_runtime_suspended(dev))
-		return ufshcd_clear_rpmb_uac(hba);
+	if (hba->sdev_rpmb)
+		ufshcd_clear_rpmb_uac(hba);
 	return 0;
 }
 
 static const struct dev_pm_ops ufs_rpmb_pm_ops = {
-	SET_RUNTIME_PM_OPS(NULL, ufshcd_rpmb_runtime_resume, NULL)
+	SET_RUNTIME_PM_OPS(NULL, ufshcd_rpmb_resume, NULL)
 	SET_SYSTEM_SLEEP_PM_OPS(NULL, ufshcd_rpmb_resume)
 };


