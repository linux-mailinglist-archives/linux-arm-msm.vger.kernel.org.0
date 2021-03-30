Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38AB734E51A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Mar 2021 12:08:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231154AbhC3KIK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Mar 2021 06:08:10 -0400
Received: from mga11.intel.com ([192.55.52.93]:1466 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229633AbhC3KHk (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Mar 2021 06:07:40 -0400
IronPort-SDR: oVjyYtCk5hEBv/IypZkFqFkkxV7TObWrkP9Q2yLHpSLLkR5QAIngNoBVRm8GqhUubkI+F69gIk
 2zSxDpsBu1fw==
X-IronPort-AV: E=McAfee;i="6000,8403,9938"; a="188469646"
X-IronPort-AV: E=Sophos;i="5.81,290,1610438400"; 
   d="scan'208";a="188469646"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2021 03:07:39 -0700
IronPort-SDR: 49nci7WYK3KsrT0bQhPoZy9Z7uXBIPW9nzNysWInPEco8HbQavci97XkTKViGofTnQh1D074bt
 Iqo+5e81i6Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,290,1610438400"; 
   d="scan'208";a="378442373"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.174]) ([10.237.72.174])
  by orsmga006.jf.intel.com with ESMTP; 30 Mar 2021 03:07:36 -0700
Subject: Re: [PATCH v13 0/2] Enable power management for ufs wlun
To:     "Asutosh Das (asd)" <asutoshd@codeaurora.org>, cang@codeaurora.org,
        martin.petersen@oracle.com, linux-scsi@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>
References: <cover.1616633712.git.asutoshd@codeaurora.org>
 <e2aec2ba-b0ed-a478-7c01-1784f755a805@codeaurora.org>
From:   Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <f9b27a18-777b-10db-71ab-90f29f79bffc@intel.com>
Date:   Tue, 30 Mar 2021 13:07:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <e2aec2ba-b0ed-a478-7c01-1784f755a805@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/03/21 1:48 am, Asutosh Das (asd) wrote:
> On 3/24/2021 6:39 PM, Asutosh Das wrote:
>> This patch attempts to fix a deadlock in ufs while sending SSU.
>> Recently, blk_queue_enter() added a check to not process requests if the
>> queue is suspended. That leads to a resume of the associated device which
>> is suspended. In ufs, that device is ufs device wlun and it's parent is
>> ufs_hba. This resume tries to resume ufs device wlun which in turn tries
>> to resume ufs_hba, which is already in the process of suspending, thus
>> causing a deadlock.
>>
>> This patch takes care of:
>> * Suspending the ufs device lun only after all other luns are suspended
>> * Sending SSU during ufs device wlun suspend
>> * Clearing uac for rpmb and ufs device wlun
>> * Not sending commands to the device during host suspend
>>
>> v12 -> v13:
>> - Addressed Adrian's comments
>>    * Paired pm_runtime_get_noresume() with pm_runtime_put()
>>    * no rpm_autosuspend for ufs device wlun
>>    * Moved runtime-pm init functionality to ufshcd_wl_probe()
>> - Addressed Bart's comments
>>    * Expanded abbrevs in commit message
>>
> 
> Hi Adrian
> I did a limited testing on your fix in the pm framework along with this v13 patchset. I couldn't reproduce the issue.
> 
> I'd appreciate if you can please take a look at the v13 changes.
> If all looks good in that, I'd do an extensive testing.

I made a couple of comments on the patch, but nothing major.
