Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F04C3B2716
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jun 2021 08:04:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230480AbhFXGGh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Jun 2021 02:06:37 -0400
Received: from mga18.intel.com ([134.134.136.126]:34627 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230257AbhFXGGg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Jun 2021 02:06:36 -0400
IronPort-SDR: VYtkb64WtBbdBilJQwiPRc1fNknPegPcxDVVPs9dWgzrGMH1vuUsZSV/3KWatFfMcf+b9v0Ltt
 qO8MFbgmofew==
X-IronPort-AV: E=McAfee;i="6200,9189,10024"; a="194703645"
X-IronPort-AV: E=Sophos;i="5.83,295,1616482800"; 
   d="scan'208";a="194703645"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2021 23:04:17 -0700
IronPort-SDR: /Akx3pg1VdnBcCCI9Vi8zXtNyOeGL4iI6cWzlDqgivkbb2uO6Fd17QG4TqxfQOdQyMa9IhubzW
 NFpZEm/OpDBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,295,1616482800"; 
   d="scan'208";a="406533408"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.79]) ([10.237.72.79])
  by orsmga006.jf.intel.com with ESMTP; 23 Jun 2021 23:04:12 -0700
Subject: Re: [PATCH v4 01/10] scsi: ufs: Rename flags pm_op_in_progress and
 is_sys_suspended
To:     Can Guo <cang@codeaurora.org>, Bart Van Assche <bvanassche@acm.org>
Cc:     asutoshd@codeaurora.org, nguyenb@codeaurora.org,
        hongwus@codeaurora.org, ziqichen@codeaurora.org,
        linux-scsi@vger.kernel.org, kernel-team@android.com,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Bean Huo <beanhuo@micron.com>,
        Jaegeuk Kim <jaegeuk@kernel.org>,
        Kiwoong Kim <kwmad.kim@samsung.com>,
        Satya Tangirala <satyat@google.com>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <1624433711-9339-1-git-send-email-cang@codeaurora.org>
 <1624433711-9339-2-git-send-email-cang@codeaurora.org>
 <1c5db457-ee87-2308-15f5-5dad49508f10@acm.org>
 <c7c5d95e-8a69-dfef-44ea-bfcadd6ea5d5@acm.org>
 <932ce816be805e4cca2c5beee8627918@codeaurora.org>
From:   Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <241b60e8-5d96-ddfd-58e4-e15f0a9dea91@intel.com>
Date:   Thu, 24 Jun 2021 09:04:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <932ce816be805e4cca2c5beee8627918@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/06/21 5:02 am, Can Guo wrote:
> Hi Bart,
> 
> On 2021-06-24 04:57, Bart Van Assche wrote:
>> On 6/23/21 1:05 PM, Bart Van Assche wrote:
>>> On 6/23/21 12:35 AM, Can Guo wrote:
>>>> Rename pm_op_in_progress and is_sys_suspended to wlu_pm_op_in_progress and
>>>> is_wlu_sys_suspended accordingly.
>>>
>>> My understanding is that power management operations must be submitted
>>> to one particular UFS WLUN (hba->sdev_ufs_device). That makes the "wlu_"
>>> part of the new names redundant. In other words, I like the current
>>> names better than the new names. Unless if I missed something, consider
>>> dropping this patch.
>>
>> Hi Can,
>>
>> Reviewing later patches in this series made me realize that there are
>> two families of suspend/resume functions. One family of functions
>> operates at the platform level while the other family operates at the
>> SCSI LUN level. My comments about the suspend/resume functions are as
>> follows:
>> - It seems redundant to me to have system suspend support at the SCSI
>>   LUN level (__ufshcd_wl_suspend(hba, UFS_SYSTEM_PM)) and also at the
>>   platform level. Since the platform device is a parent of the SCSI
>>   WLUN, can system suspend/resume support be left out from
>>   ufshcd_wl_pm_ops (or in other words, remove the .freeze and .thaw
>>   callbacks)? Do we really need two calls from the power management
>>   subsystem into the UFS driver for every system suspend and every
>>   system resume?
> 
> Asutosh and Adrian should be the right persons to answer this, since
> they've been working together on that huge change for 4 months -
> 
> https://lore.kernel.org/patchwork/patch/1417696/
> 
> In short, we need a dedicated suspend/resume ops for the UFS device
> W-LU because one cannot send requests (not even PM requests) after the
> device is runtime suspended - sending SSU cmds in hba suspend/resume
> cannot pass through blk_queue_enter() as SSU cmd is sent to the UFS
> device W-LU scsi device (by now it is runtime suspended) but not the
> hba device.

Yes it is quite normal to have different PM callbacks for different
devices (e.g. host controller and device controlled by host controller),
and SCSI effectively expects it that way now.

.freeze and .thaw are necessary for suspend-to-disk

> 
> Of course we can keep the old way and send the SSU cmd through a
> request queue without block layer PM initialized (hba->cmd_queue for
> example, by pointing cmd_queue->dev to the UFS device W-LU scsi device),
> but that would look like a hack.
> 
>> - Because of the device links (device_link_add()), the ufschd_wl_*()
>>   RPM callbacks are invoked after all LUNs have been suspended. I would
>>   appreciate it if the "ufshcd_wl_" prefix would be changed into
>>   "ufshcd_lun_" since that would make it more clear that these callbacks
>>   are associated with all LUNs and not only with the WLUN through which
>>   power management commands are submitted.
>>
> 
> Sure, we will do that later.
> 
> Thanks,
> 
> Can Guo.
> 
>> Thanks,
>>
>> Bart.

