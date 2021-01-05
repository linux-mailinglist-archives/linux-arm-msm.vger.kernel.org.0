Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 121C72EA5FF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jan 2021 08:35:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725894AbhAEHeY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 02:34:24 -0500
Received: from mga11.intel.com ([192.55.52.93]:55843 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725822AbhAEHeY (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 02:34:24 -0500
IronPort-SDR: SInopDdxeDtLzkVQCTkZos2buFLX17jMlP0bA4fiLaAeifpgSh+8w6ePBsUfWAGyubeVFHCqKp
 FmeIulLuglGg==
X-IronPort-AV: E=McAfee;i="6000,8403,9854"; a="173555946"
X-IronPort-AV: E=Sophos;i="5.78,476,1599548400"; 
   d="scan'208";a="173555946"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2021 23:33:44 -0800
IronPort-SDR: UxgStSIfqJrtaRejgRdQZElqt6gDSXZmA90ekirnF/Kh0JhEYyRaLS6yVcGB0Ww4TSJVzczTC9
 LvxGLwNG0JhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,476,1599548400"; 
   d="scan'208";a="462213936"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.94]) ([10.237.72.94])
  by fmsmga001.fm.intel.com with ESMTP; 04 Jan 2021 23:33:36 -0800
Subject: Re: [PATCH RFC v4 1/1] scsi: ufs: Fix ufs power down/on specs
 violation
To:     Can Guo <cang@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ziqi Chen <ziqichen@codeaurora.org>, asutoshd@codeaurora.org,
        nguyenb@codeaurora.org, hongwus@codeaurora.org,
        rnayak@codeaurora.org, vinholikatti@gmail.com,
        jejb@linux.vnet.ibm.com, martin.petersen@oracle.com,
        linux-scsi@vger.kernel.org, kernel-team@android.com,
        saravanak@google.com, salyzyn@google.com, kwmad.kim@samsung.com,
        stanley.chu@mediatek.com, Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Andy Gross <agross@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Bean Huo <beanhuo@micron.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Satya Tangirala <satyat@google.com>,
        "moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..." 
        <linux-mediatek@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>
References: <1608644981-46267-1-git-send-email-ziqichen@codeaurora.org>
 <e8980753-fa48-7862-e5ce-0d756d5d97a6@intel.com>
 <X/NkktFnWI48XNcp@builder.lan>
 <b82dd5f1-179c-6834-9d8f-88005b74ce51@intel.com>
 <ff2c3c4379cb8bc41580d5615b01f86a@codeaurora.org>
From:   Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <a509d1ad-617d-8160-1dae-da0dbf19652c@intel.com>
Date:   Tue, 5 Jan 2021 09:33:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <ff2c3c4379cb8bc41580d5615b01f86a@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5/01/21 9:28 am, Can Guo wrote:
> On 2021-01-05 15:16, Adrian Hunter wrote:
>> On 4/01/21 8:55 pm, Bjorn Andersson wrote:
>>> On Mon 04 Jan 03:15 CST 2021, Adrian Hunter wrote:
>>>
>>>> On 22/12/20 3:49 pm, Ziqi Chen wrote:
>>>>> As per specs, e.g, JESD220E chapter 7.2, while powering
>>>>> off/on the ufs device, RST_N signal and REF_CLK signal
>>>>> should be between VSS(Ground) and VCCQ/VCCQ2.
>>>>>
>>>>> To flexibly control device reset line, refactor the function
>>>>> ufschd_vops_device_reset(sturct ufs_hba *hba) to ufshcd_
>>>>> vops_device_reset(sturct ufs_hba *hba, bool asserted). The
>>>>> new parameter "bool asserted" is used to separate device reset
>>>>> line pulling down from pulling up.
>>>>
>>>> This patch assumes the power is controlled by voltage regulators, but
>>>> for us
>>>> it is controlled by firmware (ACPI), so it is not correct to change RST_n
>>>> for all host controllers as you are doing.
>>>>
>>>> Also we might need to use a firmware interface for device reset, in which
>>>> case the 'asserted' value doe not make sense.
>>>>
>>>
>>> Are you saying that the entire flip-flop-the-reset is a single firmware
>>> operation in your case?
>>
>> Yes
>>
>>>                         If you look at the Mediatek driver, the
>>> implementation of ufs_mtk_device_reset_ctrl() is a jump to firmware.
>>>
>>>
>>> But perhaps "asserted" isn't the appropriate English word for saying
>>> "the reset is in the resetting state"?
>>>
>>> I just wanted to avoid the use of "high"/"lo" as if you look at the
>>> Mediatek code they pass the expected line-level to the firmware, while
>>> in the Qualcomm code we pass the logical state to the GPIO code which is
>>> setup up as "active low" and thereby flip the meaning before hitting the
>>> pad.
>>>
>>>> Can we leave the device reset callback alone, and instead introduce a new
>>>> variant operation for setting RST_n to match voltage regulator power
>>>> changes?
>>>
>>> Wouldn't this new function just have to look like the proposed patches?
>>> In which case for existing platforms we'd have both?
>>>
>>> How would you implement this, or would you simply skip implementing
>>> this?
>>
>> Functionally, doing a device reset is not the same as adjusting signal
>> levels to meet power up/off ramp requirements.  However, the issue is that
>> we do not use regulators, so the power is not necessarily being changed at
>> those points, and we definitely do not want to reset instead of entering
>> DeepSleep for example.
>>
>> Off the top of my head, I imagine something like a callback called
>> ufshcd_vops_prepare_power_ramp(hba, bool on) which is called only if
>> hba->vreg_info->vcc is not NULL.
> 
> Hi Adrian,
> 
> I don't see you have the vops device_reset() implemented anywhere in
> current code base, how is this change impacting you? Do I miss anything
> or are you planning to push a change which implements device_reset() soon?

At some point, yes.
