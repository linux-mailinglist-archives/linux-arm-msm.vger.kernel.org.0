Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C85E0368D08
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Apr 2021 08:19:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240604AbhDWGTe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Apr 2021 02:19:34 -0400
Received: from mga14.intel.com ([192.55.52.115]:47176 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230186AbhDWGTe (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Apr 2021 02:19:34 -0400
IronPort-SDR: lrb0xDSwsa+SlFyJn4zbiZiSnNOCxRBm2Lk2U3QqcTm7GXpH4jLUR1XcjqnZAemNVdym3hUV6P
 7Gu90seL5eYQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9962"; a="195579893"
X-IronPort-AV: E=Sophos;i="5.82,245,1613462400"; 
   d="sh'?scan'208";a="195579893"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2021 23:18:39 -0700
IronPort-SDR: bmF5rMhax5UsfCfuXsR+WtF/+hC1qZ8tIECp2g9EdfE1RDP89vdd5U00a9aiOn4ATWINff9pGE
 By4cxST700Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,245,1613462400"; 
   d="sh'?scan'208";a="453490370"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.174]) ([10.237.72.174])
  by FMSMGA003.fm.intel.com with ESMTP; 22 Apr 2021 23:18:33 -0700
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
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <e6f3946a-dbe7-6b42-e43c-d3f8d705c732@intel.com>
Date:   Fri, 23 Apr 2021 09:18:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <efe71230-5b6a-22a8-1aef-f1cae046df22@intel.com>
Content-Type: multipart/mixed;
 boundary="------------981C9E5714D524CD5F716EAD"
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is a multi-part message in MIME format.
--------------981C9E5714D524CD5F716EAD
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 23/04/21 7:23 am, Adrian Hunter wrote:
> On 22/04/21 7:38 pm, Asutosh Das (asd) wrote:
>> On 4/20/2021 12:42 AM, Adrian Hunter wrote:
>>> On 20/04/21 7:15 am, Adrian Hunter wrote:
>>>> On 20/04/21 12:53 am, Asutosh Das (asd) wrote:
>>>>> On 4/19/2021 11:37 AM, Adrian Hunter wrote:
>>>>>> On 16/04/21 10:49 pm, Asutosh Das wrote:
>>>>>>>
>>>>>>> Co-developed-by: Can Guo <cang@codeaurora.org>
>>>>>>> Signed-off-by: Can Guo <cang@codeaurora.org>
>>>>>>> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
>>>>>>> ---
>>>>>>
>>>>>> I came across 3 issues while testing.  See comments below.
>>>>>>
>>>>> Hi Adrian
>>>>> Thanks for the comments.
>>>>>> <SNIP>
>>>>>>
>>>>>>> @@ -5794,7 +5839,7 @@ static void ufshcd_err_handling_unprepare(struct ufs_hba *hba)
>>>>>>>        if (ufshcd_is_clkscaling_supported(hba))
>>>>>>>            ufshcd_clk_scaling_suspend(hba, false);
>>>>>>>        ufshcd_clear_ua_wluns(hba);
>>>>>>
>>>>>> ufshcd_clear_ua_wluns() deadlocks trying to clear UFS_UPIU_RPMB_WLUN
>>>>>> if sdev_rpmb is suspended and sdev_ufs_device is suspending.
>>>>>> e.g. ufshcd_wl_suspend() is waiting on host_sem while ufshcd_err_handler()
>>>>>> is running, at which point sdev_rpmb has already suspended.
>>>>>>
>>>>> Umm, I didn't understand this deadlock.
>>>>> When you say, sdev_rpmb is suspended, does it mean runtime_suspended?
>>>>> sdev_ufs_device is suspending - this can't be runtime_suspending, while ufshcd_err_handling_unprepare is running.
>>>>>
>>>>> If you've a call-stack of this deadlock, please can you share it with me. I'll also try to reproduce this.
>>>>
>>>> Yes it is system suspend. sdev_rpmb has suspended, sdev_ufs_device is waiting on host_sem.
>>>> ufshcd_err_handler() holds host_sem. ufshcd_clear_ua_wlun(UFS_UPIU_RPMB_WLUN) gets stuck.
>>>> I will get some call-stacks.
>>>
>> Hi Adrian,
>>
>> Thanks for the call stacks.
>> From the current information, I can't say for sure why it'd get stuck in blk_queue_enter().
> 
> I presume SCSI is leaving the RPMB WLUN device runtime suspended and consequently the queue status is RPM_SUSPENDED
> 
>>
>> I tried reproducing this issue on my setup yesterday but couldn't.
>> Here's what I did:
>> 1. sdev_rpmb is RPM_SUSPENDED, checked before initiating system suspend
>> 2. sdev_ufs_device is RPM_RESUMED
>> 3. I triggered system suspend (echo mem > /sys/power/state) and scheduled the error handler from ufshcd_wl_suspend().
>> 4. Waited until error handler ran and then ufshcd_wl_suspend() blocks on host_sem.
>> 5. The ufshcd_clear_wa_wlun(UFS_UPIU_RPMB_WLUN) went through fine.
>>
>> Do you've some specific steps to reproduce this or a script, perhaps? If so, please can you share it with me. I will try again.
> 
> I was using a device that gives occasional errors, but I will what see I can do.

I have attached 2 patches to reproduce the issue, and the test script I used.
Note it is using down_timeout() so it doesn't lock up completely.
The kernel messages are:

[   79.385456] ufshcd_wl_suspend: doing ufshcd_schedule_eh_work
[   79.385511] ufshcd_wl_suspend: sleeping 1000 ms
[   79.386916] ufshcd_err_handler: start
[   79.386979] ufshcd_err_handler: got sem
[   79.387053] ufshcd_err_handling_unprepare: start
[   79.387302] ufshcd_clear_ua_wluns: before ufshcd_clear_ua_wlun(hba, UFS_UPIU_RPMB_WLUN)
[   80.435878] ufshcd_wl_suspend: trying to get sem
[   85.683876] ufshcd_wl_suspend: failed to get sem
[   85.683993] ufs_device_wlun 0:0:0:49488: PM: failed to suspend async: error -22
[   85.686901] ufshcd_clear_ua_wluns: after ufshcd_clear_ua_wlun(hba, UFS_UPIU_RPMB_WLUN), ret 0
[   85.687025] ufshcd_err_handling_unprepare: finish
[   85.687090] ufshcd_err_handler: finish 



--------------981C9E5714D524CD5F716EAD
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-changes-suggested-since-v20.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-changes-suggested-since-v20.patch"

>From c21ea993b28bec894f96c0c7b387f9688b01900f Mon Sep 17 00:00:00 2001
From: Adrian Hunter <adrian.hunter@intel.com>
Date: Tue, 20 Apr 2021 14:33:03 +0300
Subject: [PATCH 1/2] changes suggested since v20

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/scsi/ufs/ufshcd.c | 50 ++++++++++-----------------------------
 drivers/scsi/ufs/ufshcd.h |  1 +
 2 files changed, 14 insertions(+), 37 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index eb36f753469d..5be5b2472db0 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -5844,7 +5844,7 @@ static void ufshcd_err_handling_unprepare(struct ufs_hba *hba)
 
 static inline bool ufshcd_err_handling_should_stop(struct ufs_hba *hba)
 {
-	return (!hba->is_powered || hba->shutting_down ||
+	return (!hba->is_powered || hba->shutting_down || !hba->sdev_ufs_device ||
 		hba->ufshcd_state == UFSHCD_STATE_ERROR ||
 		(!(hba->saved_err || hba->saved_uic_err || hba->force_reset ||
 		   ufshcd_is_link_broken(hba))));
@@ -9572,51 +9572,27 @@ void ufshcd_resume_complete(struct device *dev)
 {
 	struct ufs_hba *hba = dev_get_drvdata(dev);
 
-	ufshcd_rpm_put(hba);
+	if (hba->complete_put) {
+		hba->complete_put = false;
+		ufshcd_rpm_put(hba);
+	}
 }
 EXPORT_SYMBOL_GPL(ufshcd_resume_complete);
 
 int ufshcd_suspend_prepare(struct device *dev)
 {
 	struct ufs_hba *hba = dev_get_drvdata(dev);
-	struct device *ufs_dev = &hba->sdev_ufs_device->sdev_gendev;
-	enum ufs_dev_pwr_mode spm_pwr_mode;
-	enum uic_link_state spm_link_state;
-	unsigned long flags;
-	bool rpm_state_ok;
-
-	/*
-	 * SCSI assumes that runtime-pm and system-pm for scsi drivers
-	 * are same. And it doesn't wake up the device for system-suspend
-	 * if it's runtime suspended. But ufs doesn't follow that.
-	 * The rpm-lvl and spm-lvl can be different in ufs.
-	 * However, if the current_{pwr_mode, link_state} is same as the
-	 * desired_{pwr_mode, link_state}, there's no need to rpm resume
-	 * the device.
-	 * Refer ufshcd_resume_complete()
-	 */
-	pm_runtime_get_noresume(ufs_dev);
-
-	spin_lock_irqsave(&ufs_dev->power.lock, flags);
-
-	spm_pwr_mode = ufs_get_pm_lvl_to_dev_pwr_mode(hba->spm_lvl);
-	spm_link_state = ufs_get_pm_lvl_to_link_pwr_state(hba->spm_lvl);
-
-	rpm_state_ok = pm_runtime_suspended(ufs_dev) &&
-		hba->curr_dev_pwr_mode == spm_pwr_mode &&
-		hba->uic_link_state == spm_link_state &&
-		!hba->dev_info.b_rpm_dev_flush_capable;
-
-	spin_unlock_irqrestore(&ufs_dev->power.lock, flags);
+	int ret;
 
-	if (!rpm_state_ok) {
-		int ret = pm_runtime_resume(ufs_dev);
+	if (!hba->sdev_ufs_device)
+		return 0;
 
-		if (ret < 0 && ret != -EACCES) {
-			pm_runtime_put(ufs_dev);
-			return ret;
-		}
+	ret = ufshcd_rpm_get_sync(hba);
+	if (ret < 0 && ret != -EACCES) {
+		ufshcd_rpm_put(hba);
+		return ret;
 	}
+	hba->complete_put = true;
 	return 0;
 }
 EXPORT_SYMBOL_GPL(ufshcd_suspend_prepare);
diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
index 3a8dc0dfae05..fd5be083e168 100644
--- a/drivers/scsi/ufs/ufshcd.h
+++ b/drivers/scsi/ufs/ufshcd.h
@@ -850,6 +850,7 @@ struct ufs_hba {
 	u32 debugfs_ee_rate_limit_ms;
 #endif
 	u32 luns_avail;
+	bool complete_put;
 };
 
 /* Returns true if clocks can be gated. Otherwise false */
-- 
2.25.1


--------------981C9E5714D524CD5F716EAD
Content-Type: text/x-patch; charset=UTF-8;
 name="0002-instrumentation-to-reproduce-issue.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0002-instrumentation-to-reproduce-issue.patch"

>From 2b9aae51ac5b1f1b13fdab5570dceefbbdc9682b Mon Sep 17 00:00:00 2001
From: Adrian Hunter <adrian.hunter@intel.com>
Date: Fri, 23 Apr 2021 08:56:18 +0300
Subject: [PATCH 2/2] instrumentation to reproduce issue

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/scsi/ufs/ufshcd.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 5be5b2472db0..32fc4e3991ff 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -5834,12 +5834,14 @@ static void ufshcd_err_handling_prepare(struct ufs_hba *hba)
 
 static void ufshcd_err_handling_unprepare(struct ufs_hba *hba)
 {
+	pr_err("%s: start\n", __func__);
 	ufshcd_scsi_unblock_requests(hba);
 	ufshcd_release(hba);
 	if (ufshcd_is_clkscaling_supported(hba))
 		ufshcd_clk_scaling_suspend(hba, false);
 	ufshcd_clear_ua_wluns(hba);
 	ufshcd_rpm_put(hba);
+	pr_err("%s: finish\n", __func__);
 }
 
 static inline bool ufshcd_err_handling_should_stop(struct ufs_hba *hba)
@@ -5919,11 +5921,14 @@ static void ufshcd_err_handler(struct work_struct *work)
 	int tag;
 	bool needs_reset = false, needs_restore = false;
 
+	pr_err("%s: start\n", __func__);
+
 	hba = container_of(work, struct ufs_hba, eh_work);
 
 	down(&hba->host_sem);
+	pr_err("%s: got sem\n", __func__);
 	spin_lock_irqsave(hba->host->host_lock, flags);
-	if (ufshcd_err_handling_should_stop(hba)) {
+	if (0 && ufshcd_err_handling_should_stop(hba)) {
 		if (hba->ufshcd_state != UFSHCD_STATE_ERROR)
 			hba->ufshcd_state = UFSHCD_STATE_OPERATIONAL;
 		spin_unlock_irqrestore(hba->host->host_lock, flags);
@@ -6095,6 +6100,7 @@ static void ufshcd_err_handler(struct work_struct *work)
 	ufshcd_clear_eh_in_progress(hba);
 	spin_unlock_irqrestore(hba->host->host_lock, flags);
 	ufshcd_err_handling_unprepare(hba);
+	pr_err("%s: finish\n", __func__);
 	up(&hba->host_sem);
 }
 
@@ -7872,12 +7878,15 @@ static int ufshcd_clear_ua_wluns(struct ufs_hba *hba)
 {
 	int ret = 0;
 
-	if (!hba->wlun_dev_clr_ua)
+	if (0 && !hba->wlun_dev_clr_ua)
 		goto out;
 
 	ret = ufshcd_clear_ua_wlun(hba, UFS_UPIU_UFS_DEVICE_WLUN);
-	if (!ret)
+	if (!ret) {
+		pr_err("%s: before ufshcd_clear_ua_wlun(hba, UFS_UPIU_RPMB_WLUN)\n", __func__);
 		ret = ufshcd_clear_ua_wlun(hba, UFS_UPIU_RPMB_WLUN);
+		pr_err("%s: after ufshcd_clear_ua_wlun(hba, UFS_UPIU_RPMB_WLUN), ret %d\n", __func__, ret);
+	}
 	if (!ret)
 		hba->wlun_dev_clr_ua = false;
 out:
@@ -8983,7 +8992,16 @@ static int ufshcd_wl_suspend(struct device *dev)
 	ktime_t start = ktime_get();
 
 	hba = shost_priv(sdev->host);
-	down(&hba->host_sem);
+	pr_err("%s: doing ufshcd_schedule_eh_work\n", __func__);
+	ufshcd_schedule_eh_work(hba);
+	pr_err("%s: sleeping 1000 ms\n", __func__);
+	msleep(1000);
+	pr_err("%s: trying to get sem\n", __func__);
+	if (down_timeout(&hba->host_sem, msecs_to_jiffies(5000))) {
+		pr_err("%s: failed to get sem\n", __func__);
+		return -EINVAL;
+	}
+	pr_err("%s: got sem\n", __func__);
 
 	if (pm_runtime_suspended(dev))
 		goto out;
-- 
2.25.1


--------------981C9E5714D524CD5F716EAD
Content-Type: application/x-shellscript;
 name="go.sh"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="go.sh"

IyEvYmluL3NoCgpzZXQgLXgKCmVjaG8gMCA+IC9zeXMvYnVzL3BjaS9kcml2ZXJzL3Vmc2hj
ZC8wMDAwOjAwOjEyLjUvc3BtX2x2bAplY2hvIDAgPiAvc3lzL2J1cy9wY2kvZHJpdmVycy91
ZnNoY2QvMDAwMDowMDoxMi41L3JwbV9sdmwKCmRkIGlmPS9kZXYvc2RhIG9mPS9kZXYvbnVs
bCBicz00MDk2IGNvdW50PTEgJgoKc2xlZXAgMwoKZWNobyAwID4gL3N5cy9tb2R1bGUvcHJp
bnRrL3BhcmFtZXRlcnMvY29uc29sZV9zdXNwZW5kCgplY2hvIHBsYXRmb3JtID4gL3N5cy9w
b3dlci9wbV90ZXN0IAoKZWNobyBmcmVlemUgPiAvc3lzL3Bvd2VyL3N0YXRlCg==
--------------981C9E5714D524CD5F716EAD--
