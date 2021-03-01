Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7667328DE0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 20:19:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241279AbhCATSz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 14:18:55 -0500
Received: from mga17.intel.com ([192.55.52.151]:64757 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241003AbhCATQX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 14:16:23 -0500
IronPort-SDR: GsTuTHm/5rWl3aL4agKeKtchqZauU35HTE88xwdsskHBeJaD8FYmrAvBWElWr1EGcAmyZsGoKI
 1rADKJnWZaiQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="166449034"
X-IronPort-AV: E=Sophos;i="5.81,215,1610438400"; 
   d="scan'208";a="166449034"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2021 11:12:48 -0800
IronPort-SDR: IZHeAmha3J9FNGeaDMx1ISJgDn1JHd6fmIBKO6IXMHwxa3XdT+30OgfhOr/VVZJb8UIdH4/w7G
 turhYFrDusDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,215,1610438400"; 
   d="scan'208";a="585603646"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.76]) ([10.237.72.76])
  by orsmga005.jf.intel.com with ESMTP; 01 Mar 2021 11:12:42 -0800
Subject: Re: [PATCH v8 1/2] scsi: ufs: Enable power management for wlun
To:     Asutosh Das <asutoshd@codeaurora.org>
Cc:     cang@codeaurora.org, martin.petersen@oracle.com,
        linux-scsi@vger.kernel.org, linux-arm-msm@vger.kernel.org,
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
        Kiwoong Kim <kwmad.kim@samsung.com>,
        Bean Huo <beanhuo@micron.com>,
        Lee Jones <lee.jones@linaro.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Wei Yongjun <weiyongjun1@huawei.com>,
        Jaegeuk Kim <jaegeuk@kernel.org>,
        Satya Tangirala <satyat@google.com>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" 
        <linux-samsung-soc@vger.kernel.org>,
        "moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..." 
        <linux-mediatek@lists.infradead.org>
References: <cover.1614295674.git.asutoshd@codeaurora.org>
 <c861385023f8592a63e3edf8119af89511741c9a.1614295674.git.asutoshd@codeaurora.org>
 <e10cd03d-12cd-3d73-b9ed-a542e0b2b83c@intel.com>
 <20210301181014.GF12147@stor-presley.qualcomm.com>
From:   Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <3b085cd7-529f-51b8-6a2f-6aa397e1acd3@intel.com>
Date:   Mon, 1 Mar 2021 21:12:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210301181014.GF12147@stor-presley.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 1/03/21 8:10 pm, Asutosh Das wrote:
> On Mon, Mar 01 2021 at 05:23 -0800, Adrian Hunter wrote:
>> On 26/02/21 1:37 am, Asutosh Das wrote:
>>> @@ -8901,43 +9125,14 @@ static int ufshcd_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>>>              goto vendor_suspend;
>>>      }
>>
>> The ufshcd_reset_and_restore() in ufshcd_resume() will also change the power
>> mode of the UFS device to active.  Until the UFS device is also resumed and
>> then suspended, it will not return to a low power mode.
>>
>>
> Umm, sorry, I didn't understand this comment.
> Say, the UFS device was reset in ufshcd_reset_and_restore() it'd be a hardware
> reset and the UFS device would move to Powered On mode and then to Active power
> mode, when it is ready to begin initialization. And from this state it should
> move to all other legal states.
> Before entering system suspend ufshcd_system_suspend(), the ufs device is
> runtime resumed in ufshcd_suspend_prepare().
> 
> Please can you explain a bit more on this issue that you see?

Say you runtime resume the host controller, and
ufshcd_reset_and_restore() makes the UFS device active,
but the UFS device is still runtime suspended.


Example:

Add a debugfs file to show the current power mode:

diff --git a/drivers/scsi/ufs/ufs-debugfs.c b/drivers/scsi/ufs/ufs-debugfs.c
index dee98dc72d29..700b88df0866 100644
--- a/drivers/scsi/ufs/ufs-debugfs.c
+++ b/drivers/scsi/ufs/ufs-debugfs.c
@@ -48,6 +48,7 @@ void ufs_debugfs_hba_init(struct ufs_hba *hba)
 {
        hba->debugfs_root = debugfs_create_dir(dev_name(hba->dev), ufs_debugfs_root);
        debugfs_create_file("stats", 0400, hba->debugfs_root, hba, &ufs_debugfs_stats_fops);
+       debugfs_create_u32("curr_dev_pwr_mode", 0400, hba->debugfs_root, (u32 *)&hba->curr_dev_pwr_mode);
 }

 void ufs_debugfs_hba_exit(struct ufs_hba *hba)


# grep -H . /sys/bus/pci/drivers/ufshcd/0000\:00\:12.5/rpm*
/sys/bus/pci/drivers/ufshcd/0000:00:12.5/rpm_lvl:6
/sys/bus/pci/drivers/ufshcd/0000:00:12.5/rpm_target_dev_state:DEEPSLEEP
/sys/bus/pci/drivers/ufshcd/0000:00:12.5/rpm_target_link_state:OFF
# cat /sys/kernel/debug/ufshcd/0000\:00\:12.5/curr_dev_pwr_mode
4
# echo on > /sys/devices/pci0000:00/0000:00:12.5/power/control
# cat /sys/kernel/debug/ufshcd/0000\:00\:12.5/curr_dev_pwr_mode
1
# grep -H . /sys/bus/pci/drivers/ufshcd/0000\:00\:12.5/host*/target*/*/power/runtime_status
/sys/bus/pci/drivers/ufshcd/0000:00:12.5/host1/target1:0:0/1:0:0:0/power/runtime_status:suspended
/sys/bus/pci/drivers/ufshcd/0000:00:12.5/host1/target1:0:0/1:0:0:49456/power/runtime_status:suspended
/sys/bus/pci/drivers/ufshcd/0000:00:12.5/host1/target1:0:0/1:0:0:49476/power/runtime_status:suspended
/sys/bus/pci/drivers/ufshcd/0000:00:12.5/host1/target1:0:0/1:0:0:49488/power/runtime_status:suspended

So UFS devices is runtime suspended and should in DeepSleep, but it is active.
