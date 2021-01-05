Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6EA82EA831
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jan 2021 11:07:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727768AbhAEKHG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 05:07:06 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:29959 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727766AbhAEKHF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 05:07:05 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1609841205; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=iPV4BBvWfxou0064ByS5t3TW4OLKrsUABLgZaf1wgpA=;
 b=NvhfNbclEIWqns0H/Jy+UcvyTp7P8bx+icqc8l3lmKJztLQkJUZIckIBk2SS/KQOpIZsG4pO
 1hu+3aQTlOrzQJ8o56mU36/tBfRVuyifZlaR5ktXhpanFIH3gFckZRGlmW4ERr5w4W6nla+X
 S43cYRqoxX3SBFWSaPD01I8iP5o=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-east-1.postgun.com with SMTP id
 5ff43a1700a8b472197ec8b6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 05 Jan 2021 10:06:15
 GMT
Sender: cang=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1939AC43461; Tue,  5 Jan 2021 10:06:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: cang)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 48748C433ED;
        Tue,  5 Jan 2021 10:06:12 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Tue, 05 Jan 2021 18:06:12 +0800
From:   Can Guo <cang@codeaurora.org>
To:     Adrian Hunter <adrian.hunter@intel.com>
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
Subject: Re: [PATCH RFC v4 1/1] scsi: ufs: Fix ufs power down/on specs
 violation
In-Reply-To: <a509d1ad-617d-8160-1dae-da0dbf19652c@intel.com>
References: <1608644981-46267-1-git-send-email-ziqichen@codeaurora.org>
 <e8980753-fa48-7862-e5ce-0d756d5d97a6@intel.com>
 <X/NkktFnWI48XNcp@builder.lan>
 <b82dd5f1-179c-6834-9d8f-88005b74ce51@intel.com>
 <ff2c3c4379cb8bc41580d5615b01f86a@codeaurora.org>
 <a509d1ad-617d-8160-1dae-da0dbf19652c@intel.com>
Message-ID: <bb0a37d5825eec1ec03a1ba1104fec86@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-01-05 15:33, Adrian Hunter wrote:
> On 5/01/21 9:28 am, Can Guo wrote:
>> On 2021-01-05 15:16, Adrian Hunter wrote:
>>> On 4/01/21 8:55 pm, Bjorn Andersson wrote:
>>>> On Mon 04 Jan 03:15 CST 2021, Adrian Hunter wrote:
>>>> 
>>>>> On 22/12/20 3:49 pm, Ziqi Chen wrote:
>>>>>> As per specs, e.g, JESD220E chapter 7.2, while powering
>>>>>> off/on the ufs device, RST_N signal and REF_CLK signal
>>>>>> should be between VSS(Ground) and VCCQ/VCCQ2.
>>>>>> 
>>>>>> To flexibly control device reset line, refactor the function
>>>>>> ufschd_vops_device_reset(sturct ufs_hba *hba) to ufshcd_
>>>>>> vops_device_reset(sturct ufs_hba *hba, bool asserted). The
>>>>>> new parameter "bool asserted" is used to separate device reset
>>>>>> line pulling down from pulling up.
>>>>> 
>>>>> This patch assumes the power is controlled by voltage regulators, 
>>>>> but
>>>>> for us
>>>>> it is controlled by firmware (ACPI), so it is not correct to change 
>>>>> RST_n
>>>>> for all host controllers as you are doing.
>>>>> 
>>>>> Also we might need to use a firmware interface for device reset, in 
>>>>> which
>>>>> case the 'asserted' value doe not make sense.
>>>>> 
>>>> 
>>>> Are you saying that the entire flip-flop-the-reset is a single 
>>>> firmware
>>>> operation in your case?
>>> 
>>> Yes
>>> 
>>>>                         If you look at the Mediatek driver, the
>>>> implementation of ufs_mtk_device_reset_ctrl() is a jump to firmware.
>>>> 
>>>> 
>>>> But perhaps "asserted" isn't the appropriate English word for saying
>>>> "the reset is in the resetting state"?
>>>> 
>>>> I just wanted to avoid the use of "high"/"lo" as if you look at the
>>>> Mediatek code they pass the expected line-level to the firmware, 
>>>> while
>>>> in the Qualcomm code we pass the logical state to the GPIO code 
>>>> which is
>>>> setup up as "active low" and thereby flip the meaning before hitting 
>>>> the
>>>> pad.
>>>> 
>>>>> Can we leave the device reset callback alone, and instead introduce 
>>>>> a new
>>>>> variant operation for setting RST_n to match voltage regulator 
>>>>> power
>>>>> changes?
>>>> 
>>>> Wouldn't this new function just have to look like the proposed 
>>>> patches?
>>>> In which case for existing platforms we'd have both?
>>>> 
>>>> How would you implement this, or would you simply skip implementing
>>>> this?
>>> 
>>> Functionally, doing a device reset is not the same as adjusting 
>>> signal
>>> levels to meet power up/off ramp requirements.  However, the issue is 
>>> that
>>> we do not use regulators, so the power is not necessarily being 
>>> changed at
>>> those points, and we definitely do not want to reset instead of 
>>> entering
>>> DeepSleep for example.
>>> 
>>> Off the top of my head, I imagine something like a callback called
>>> ufshcd_vops_prepare_power_ramp(hba, bool on) which is called only if
>>> hba->vreg_info->vcc is not NULL.
>> 
>> Hi Adrian,
>> 
>> I don't see you have the vops device_reset() implemented anywhere in
>> current code base, how is this change impacting you? Do I miss 
>> anything
>> or are you planning to push a change which implements device_reset() 
>> soon?
> 
> At some point, yes.

OK, then we don't even have to add a new vops, just go back to version 
#1 to
use ufshcd_vops_suspend() to control the device_reset. We took the hard 
way
because we wanted to fix it for all users.
