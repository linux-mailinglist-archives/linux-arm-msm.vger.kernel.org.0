Return-Path: <linux-arm-msm+bounces-73076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F61DB52C75
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 11:01:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2FE1A3B49FA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 09:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8039D2E7165;
	Thu, 11 Sep 2025 09:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zUlU2w2s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497421D8DFB
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 09:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757581234; cv=none; b=bp969Z9LeAmeM1HcFMDo05XReySVnmShAicNhQzPhvWUpY4GURNHJlG85T3Q6jTMr0aCvoLr/uuNCdCnKDCO/yfS+20F3BlbPFgYemFG0hWWlTjSfRLzGfmQ6GHq+rhn1v5wcUKLdr0+oPZ9oG1YDb0Wr3RXtkQ3wLZHWaIh3/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757581234; c=relaxed/simple;
	bh=J6JRpUa9Jqmrc9CHAa6uRObdOcP9b5K+xnoxoo1FkLc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=dstCTjVkV8n4CdcuzBj6LE6HnwkEBGzePhYhGvIzjqgRx8O/7uze/S7iMjik5H+McAE4FVbNWAL2ixMssryaO3ehmw+187fR8hgWKgW3Zk/5nfDC2OCaeFzJzRRRUiDvcqy1a1ODCRjrXASGR+zFV6oPAjo7rGaIuaUmaV5sDsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zUlU2w2s; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3e07ffffb87so234874f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 02:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757581230; x=1758186030; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z7ZvTScnMNr1AH24k1ntK2IoMlTzS54Np2T1I7lMRD8=;
        b=zUlU2w2suIbqKwAYEKBSlpv/+pjNpZNVXZJVgdnyGxrEhu47LOv7cExdJC+04ze8Ww
         Ykkm9rP/dCmov0VBkEhhNOczf2lZH1ZulDBqx0OrixrLleBj1jFr9DHWsvTBVwg+ZtGW
         Wz2Oy/0S6fJidlTOsOrZ46d+kvtI9dhMM0H5SjRdktJPIG9RnYaODbjWC1r+/gXR2L/k
         oxuQBmm2slkSGSk+L5iPIpT1UI5srkcfKDcsILxW1I/8zcOVvEpzoqmsVdycK06H7R66
         S9To+/53KIU4I0gpwcDa0H43tWljknFTEzaYWAdGs8MPiK86vRHIgGQLAxpZetqAFvTk
         NA7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757581230; x=1758186030;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z7ZvTScnMNr1AH24k1ntK2IoMlTzS54Np2T1I7lMRD8=;
        b=g0AxMVFXfhbTMCPXzij9S81WKQRJLgxjldH9iyy6y5tbrqwicC4aqBEBKXcWDZX3RY
         jIQTRpJQD9cb0AQAPP3EGgrxhuAcrz00eAEUKY0OzD/OUNksZM0F9I7oXIfePXMKFGf1
         PtUrN6jFQ46B23NLf0As++WZfZT6lY6nqYoxoFNoiAtvZTn8Mt9cGWNQTs1H+8OMsyIW
         sqve3MGbCs9SGTAVuciO11MkDwOTCiTDlIgsa6u8lgwHQRihQ4CS5KA2faOiBw0D3NUy
         yFVyW5sKCENTBGXQjQT2uaxnnYq2C/h7wubZja6f2gqTPOEhOR3R2x8caxcPkTZ4/WI9
         EYYw==
X-Forwarded-Encrypted: i=1; AJvYcCV8Sklgn50jqPK6FcqxqBvBX5s0ftGrYuVFyAwp+QmBo/y0zmyDYp4r6LeHtcd2hXhMu93zu6rjNCQqrAob@vger.kernel.org
X-Gm-Message-State: AOJu0YwNWX+EQZ2DBMvM1TQKCfuIsPxyYdZILes23plPIwqRfDbFrrP9
	PRaWZLi11kxbDgYsdi//+df4VAsQEHFT3zBdCNZY192pYizhwDrzAcrnqMbYQ/O45Uk=
X-Gm-Gg: ASbGncuDQoDDmhlQZweg+lyVJTfISfVam6GGo9D0v+3I52GrpPCYGoB07SYWFu3PuR3
	+IX1h6/nP/TKFW7hA5WD3ZkogdQdMdtIQ8sFQuWypMsVwpMnjYSxifZzWUPft1Qa/ssHo71ROgh
	K2vCK9f8YXA3agqLOvHMKrfwDr9wOMLXwf8xo+pFYCjS/ihQybXrbOjy+MiVMbKJGe5lDv/Vk5l
	FVl7nCUAd4/JG3T68Imue/vQUDWzsD8j6wlzZDvFautTFEXfb0Yrx/KHf8q3Y3Rewbd4YQ2i09j
	R2cRsfmenx8cXGSs76esDsj/I7nyGECOD3zFXzVa2ec05d3H62EZJIconW7tWPiYamRErjv+t6g
	D6Ka9i86PJfOdU0bJ+Z2kfIe/dfc8DicwQmrw4A==
X-Google-Smtp-Source: AGHT+IEda48Vss7lyCEE2CSJvlNkx7dZSmRvauNmjJVS6GUI4lzbwbGCwGqB58JM6Y7mIk1wW74mpQ==
X-Received: by 2002:a05:6000:3101:b0:3e4:f194:2886 with SMTP id ffacd0b85a97d-3e642cadca2mr15196494f8f.19.1757581229312;
        Thu, 11 Sep 2025 02:00:29 -0700 (PDT)
Received: from localhost ([2a02:c7c:7259:a00:8a3c:25ae:f06c:6781])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607cd9fasm1619656f8f.35.2025.09.11.02.00.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 02:00:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Sep 2025 10:00:27 +0100
Message-Id: <DCPUJPHR8NUB.1SRB4D7ONSRBY@linaro.org>
Cc: <psodagud@quicinc.com>, <djaggi@quicinc.com>,
 <quic_msavaliy@quicinc.com>, <quic_vtanuku@quicinc.com>,
 <quic_arandive@quicinc.com>, <quic_mnaresh@quicinc.com>,
 <quic_shazhuss@quicinc.com>, <krzk@kernel.org>
Subject: Re: [PATCH v1] serial: qcom-geni: Fix pinctrl deadlock on runtime
 resume
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Praveen Talari" <praveen.talari@oss.qualcomm.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Jiri Slaby" <jirislaby@kernel.org>, "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>, "Praveen Talari"
 <quic_ptalari@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-serial@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20250908164532.2365969-1-praveen.talari@oss.qualcomm.com>
 <DCNLSFVPCKMV.K1UE3J3K6JQD@linaro.org>
 <DCOJFRU8KNFL.14VPXK9QZC9T4@linaro.org>
 <5b7b8c9f-48c5-45cd-8366-c8c048eaa757@oss.qualcomm.com>
In-Reply-To: <5b7b8c9f-48c5-45cd-8366-c8c048eaa757@oss.qualcomm.com>

Hi Praveen,

On Thu Sep 11, 2025 at 9:34 AM BST, Praveen Talari wrote:
> Hi Alexy,
>
> Thank you for update.
>
> On 9/10/2025 1:35 AM, Alexey Klimov wrote:
>>=20
>> (adding Krzysztof to c/c)
>>=20
>> On Mon Sep 8, 2025 at 6:43 PM BST, Alexey Klimov wrote:
>>> On Mon Sep 8, 2025 at 5:45 PM BST, Praveen Talari wrote:
>>>> A deadlock is observed in the qcom_geni_serial driver during runtime
>>>> resume. This occurs when the pinctrl subsystem reconfigures device pin=
s
>>>> via msm_pinmux_set_mux() while the serial device's interrupt is an
>>>> active wakeup source. msm_pinmux_set_mux() calls disable_irq() or
>>>> __synchronize_irq(), conflicting with the active wakeup state and
>>>> causing the IRQ thread to enter an uninterruptible (D-state) sleep,
>>>> leading to system instability.
>>>>
>>>> The critical call trace leading to the deadlock is:
>>>>
>>>>      Call trace:
>>>>      __switch_to+0xe0/0x120
>>>>      __schedule+0x39c/0x978
>>>>      schedule+0x5c/0xf8
>>>>      __synchronize_irq+0x88/0xb4
>>>>      disable_irq+0x3c/0x4c
>>>>      msm_pinmux_set_mux+0x508/0x644
>>>>      pinmux_enable_setting+0x190/0x2dc
>>>>      pinctrl_commit_state+0x13c/0x208
>>>>      pinctrl_pm_select_default_state+0x4c/0xa4
>>>>      geni_se_resources_on+0xe8/0x154
>>>>      qcom_geni_serial_runtime_resume+0x4c/0x88
>>>>      pm_generic_runtime_resume+0x2c/0x44
>>>>      __genpd_runtime_resume+0x30/0x80
>>>>      genpd_runtime_resume+0x114/0x29c
>>>>      __rpm_callback+0x48/0x1d8
>>>>      rpm_callback+0x6c/0x78
>>>>      rpm_resume+0x530/0x750
>>>>      __pm_runtime_resume+0x50/0x94
>>>>      handle_threaded_wake_irq+0x30/0x94
>>>>      irq_thread_fn+0x2c/xa8
>>>>      irq_thread+0x160/x248
>>>>      kthread+0x110/x114
>>>>      ret_from_fork+0x10/x20
>>>>
>>>> To resolve this, explicitly manage the wakeup IRQ state within the
>>>> runtime suspend/resume callbacks. In the runtime resume callback, call
>>>> disable_irq_wake() before enabling resources. This preemptively
>>>> removes the "wakeup" capability from the IRQ, allowing subsequent
>>>> interrupt management calls to proceed without conflict. An error path
>>>> re-enables the wakeup IRQ if resource enablement fails.
>>>>
>>>> Conversely, in runtime suspend, call enable_irq_wake() after resources
>>>> are disabled. This ensures the interrupt is configured as a wakeup
>>>> source only once the device has fully entered its low-power state. An
>>>> error path handles disabling the wakeup IRQ if the suspend operation
>>>> fails.
>>>>
>>>> Fixes: 1afa70632c39 ("serial: qcom-geni: Enable PM runtime for serial =
driver")
>>>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>>>
>>> You forgot:
>>>
>>> Reported-by: Alexey Klimov <alexey.klimov@linaro.org>
>>>
>>> Also, not sure where this change will go, via Greg or Jiri, but ideally
>>> this should be picked for current -rc cycle since regression is
>>> introduced during latest merge window.
>>>
>>> I also would like to test it on qrb2210 rb1 where this regression is
>>> reproduciable.
>>=20
>> It doesn't seem that it fixes the regression on RB1 board:
>>=20
>>   INFO: task kworker/u16:3:50 blocked for more than 120 seconds.
>>         Not tainted 6.17.0-rc5-00018-g9dd1835ecda5-dirty #13
>>   "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this messa=
ge.
>>   task:kworker/u16:3   state:D stack:0     pid:50    tgid:50    ppid:2  =
    task_flags:0x4208060 flags:0x00000010
>>   Workqueue: async async_run_entry_fn
>>   Call trace:
>>    __switch_to+0xf0/0x1c0 (T)
>>    __schedule+0x358/0x99c
>>    schedule+0x34/0x11c
>>    rpm_resume+0x17c/0x6a0
>>    rpm_resume+0x2c4/0x6a0
>>    rpm_resume+0x2c4/0x6a0
>>    rpm_resume+0x2c4/0x6a0
>>    __pm_runtime_resume+0x50/0x9c
>>    __driver_probe_device+0x58/0x120
>>    driver_probe_device+0x3c/0x154
>>    __driver_attach_async_helper+0x4c/0xc0
>>    async_run_entry_fn+0x34/0xe0
>>    process_one_work+0x148/0x284
>>    worker_thread+0x2c4/0x3e0
>>    kthread+0x12c/0x210
>>    ret_from_fork+0x10/0x20
>>   INFO: task irq/92-4a8c000.:79 blocked for more than 120 seconds.
>>         Not tainted 6.17.0-rc5-00018-g9dd1835ecda5-dirty #13
>>   "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this messa=
ge.
>>   task:irq/92-4a8c000. state:D stack:0     pid:79    tgid:79    ppid:2  =
    task_flags:0x208040 flags:0x00000010
>>   Call trace:
>>    __switch_to+0xf0/0x1c0 (T)
>>    __schedule+0x358/0x99c
>>    schedule+0x34/0x11c
>>    __synchronize_irq+0x90/0xcc
>>    disable_irq+0x3c/0x4c
>>    msm_pinmux_set_mux+0x3b4/0x45c
>>    pinmux_enable_setting+0x1fc/0x2d8
>>    pinctrl_commit_state+0xa0/0x260
>>    pinctrl_pm_select_default_state+0x4c/0xa0
>>    geni_se_resources_on+0xe8/0x154
>>    geni_serial_resource_state+0x8c/0xbc
>>    qcom_geni_serial_runtime_resume+0x3c/0x88
>>    pm_generic_runtime_resume+0x2c/0x44
>>    __rpm_callback+0x48/0x1e0
>>    rpm_callback+0x74/0x80
>>    rpm_resume+0x3bc/0x6a0
>>    __pm_runtime_resume+0x50/0x9c
>>    handle_threaded_wake_irq+0x30/0x80
>>    irq_thread_fn+0x2c/0xb0
>>    irq_thread+0x170/0x334
>>    kthread+0x12c/0x210
>>    ret_from_fork+0x10/0x20
>
> I can see call stack is mostly similar for yours and mine but not=20
> completely at initial calls.
>
> Yours dump:
>  >    qcom_geni_serial_runtime_resume+0x3c/0x88
>  >    pm_generic_runtime_resume+0x2c/0x44
>  >    __rpm_callback+0x48/0x1e0
>  >    rpm_callback+0x74/0x80
>  >    rpm_resume+0x3bc/0x6a0
>  >    __pm_runtime_resume+0x50/0x9c
>  >    handle_threaded_wake_irq+0x30/0x80
>
> Mine:
>  >>>      qcom_geni_serial_runtime_resume+0x4c/0x88
>  >>>      pm_generic_runtime_resume+0x2c/0x44
>  >>>      __genpd_runtime_resume+0x30/0x80
>  >>>      genpd_runtime_resume+0x114/0x29c
>  >>>      __rpm_callback+0x48/0x1d8
>  >>>      rpm_callback+0x6c/0x78
>  >>>      rpm_resume+0x530/0x750
>
>
> Can you please share what is DT file for this Board if possible?
> is there any usecase enabled on this SE instance?

Well, yeah, sorry, I didn't really compared backtraces line to line and
behaviour was exactly the same. I thought that the purpose was to fix
the regression reported earlier.

RB1 main dts files are qrb2210-rb1.dts and qcm2290.dtsi.

The similar board RB2 uses qrb4210-rb2.dts and sm4250.dtsi+sm6115.dtsi,
it is worth checking it as well.
For testing here I didn't use anything extra (the only change was wifi fix
from Loic); I tested -master and linux-next usually.

If you can tell me what is SE instance I may be able to answer. But
as far as I know it is not a part of any infrastructure or CI machinery.
I just boot the board and see if it works, if it does then I rebuild and
test my changes (audio).

Best regards,
Alexey


