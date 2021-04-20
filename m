Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB8E2365135
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Apr 2021 06:16:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229507AbhDTEPy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Apr 2021 00:15:54 -0400
Received: from mga07.intel.com ([134.134.136.100]:57516 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229594AbhDTEPw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Apr 2021 00:15:52 -0400
IronPort-SDR: yKZ0xjNLquz34LfCYWwfZ788qQnTaafP5DdJy7QBveY6WfJX+pqQYB+0SftJ+0oYdwXp+d8iU5
 hq2DrkL7raDg==
X-IronPort-AV: E=McAfee;i="6200,9189,9959"; a="259396549"
X-IronPort-AV: E=Sophos;i="5.82,236,1613462400"; 
   d="scan'208";a="259396549"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2021 21:15:16 -0700
IronPort-SDR: 6rAbk6FueexjTrFKkwcckZGJwZ+VFfmCi4dOdTEvAZsYOeRXNbxB+x28s3fHPtKOddNihST939
 DqZQceaPM7zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,236,1613462400"; 
   d="scan'208";a="420249358"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.174]) ([10.237.72.174])
  by fmsmga008.fm.intel.com with ESMTP; 19 Apr 2021 21:15:09 -0700
Subject: Re: [PATCH v20 1/2] scsi: ufs: Enable power management for wlun
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
From:   Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <90809796-1c32-3709-13d3-65e4d5c387cc@intel.com>
Date:   Tue, 20 Apr 2021 07:15:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <07e3ea07-e1c3-7b8c-e398-8b008f873e6d@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/04/21 12:53 am, Asutosh Das (asd) wrote:
> On 4/19/2021 11:37 AM, Adrian Hunter wrote:
>> On 16/04/21 10:49 pm, Asutosh Das wrote:
>>>
>>> Co-developed-by: Can Guo <cang@codeaurora.org>
>>> Signed-off-by: Can Guo <cang@codeaurora.org>
>>> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
>>> ---
>>
>> I came across 3 issues while testing.  See comments below.
>>
> Hi Adrian
> Thanks for the comments.
>> <SNIP>
>>
>>> @@ -5794,7 +5839,7 @@ static void ufshcd_err_handling_unprepare(struct ufs_hba *hba)
>>>       if (ufshcd_is_clkscaling_supported(hba))
>>>           ufshcd_clk_scaling_suspend(hba, false);
>>>       ufshcd_clear_ua_wluns(hba);
>>
>> ufshcd_clear_ua_wluns() deadlocks trying to clear UFS_UPIU_RPMB_WLUN
>> if sdev_rpmb is suspended and sdev_ufs_device is suspending.
>> e.g. ufshcd_wl_suspend() is waiting on host_sem while ufshcd_err_handler()
>> is running, at which point sdev_rpmb has already suspended.
>>
> Umm, I didn't understand this deadlock.
> When you say, sdev_rpmb is suspended, does it mean runtime_suspended?
> sdev_ufs_device is suspending - this can't be runtime_suspending, while ufshcd_err_handling_unprepare is running.
> 
> If you've a call-stack of this deadlock, please can you share it with me. I'll also try to reproduce this.

Yes it is system suspend. sdev_rpmb has suspended, sdev_ufs_device is waiting on host_sem.
ufshcd_err_handler() holds host_sem. ufshcd_clear_ua_wlun(UFS_UPIU_RPMB_WLUN) gets stuck.
I will get some call-stacks.

> 
> I'll address the other comments in the next version.
> 
> 
> Thank you!
> 
>>> -    pm_runtime_put(hba->dev);
>>> +    ufshcd_rpm_put(hba);
>>>   }
>>
>> <SNIP>
>>
>>> +void ufshcd_resume_complete(struct device *dev)
>>> +{
> 

