Return-Path: <linux-arm-msm+bounces-73483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 42170B570C5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 08:58:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC75E1736CD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 06:58:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E701B2C029D;
	Mon, 15 Sep 2025 06:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CuWwz11g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4053F27935A
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 06:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757919499; cv=none; b=rcIXX7NoVCper/CnMiKBEoJikchcsVtOItzAjHv3hyagmdOkUns+zp8raBmLBdQLtDqFFMh5fpQFrPojBwXlPjFmInAF8kLTzyj4djzJzNiTMi3DW3UkwKKVfWmed+B2iF2xEgE7aC50gWH0PDdgxgmoPIzdqZyYey84z1tgf1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757919499; c=relaxed/simple;
	bh=I5DfocrXkqJBf4D7+aHwpE8cy+dFLuiZG7A+YUuPsGY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AMB+iVFEHS/1w4zdGfOP0iogMSwwqUFdHrdX+e8Q3D+PLzpbB393kBwKfwuTUCq3yxZ8Bgh8gJjJi2lqBnWFjI1CAKoHJYoN9h1Squ23+rYHafbADHXF1ikSFFMbhdnCsKpKM0wASFdqUo4Lkxabev0tzadZJ5uRXsvf6sEgzl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CuWwz11g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58EMWRe1022271
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 06:58:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	InJ3rHVr5UsjmSjw3cCHgxH6EbKDyWRISV/DMqHuDE4=; b=CuWwz11gnOQg8ieG
	7LfJ0HZ1zhpSyPla5UyXIrZ+yPapujcud6dkWAijz5KiEo94zEzgSRTWhIu6lduK
	l9O8OtgHodW9kUH/zI2gQt6sRNwOkDxA6gq3UL9E9P9BCoQ4aLswWfWZjysZGUcO
	CDTde49mLssrJIL+lM66sjw8anJSuI60bmbTzc4IbvyZ/viN1LOIQ3onudbNV69F
	Wmt6qjEbqFdqGifO47ZGzaX78/aO/Oa/GuiQy5Vurf4ex2TMmBV4eFDopMkldWMp
	WeFaD5Y36MuVNIzzHucomThHbQzp/U9fsPRpDVKlpLa0RdPgSiKxlOvnlxmMn+hb
	PD6EdQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4950pv3t49-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 06:58:15 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b47630f9aa7so2799384a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Sep 2025 23:58:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757919494; x=1758524294;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=InJ3rHVr5UsjmSjw3cCHgxH6EbKDyWRISV/DMqHuDE4=;
        b=RCjh8wtEn67TSeMjcuICxUnmleKIu75oN613WfUX1C89aFmIPVz6yXNKWExUI2MouA
         Yfu/3rDuAGo6tCunwqoxVP6lNBU2ixTG8fR6nVWmXj7MTeZNpt1ODIj1KtCEjuEwydqp
         /NB3PWTn94ibq2T3hFjrQ4LP6eUEMEVCp8lMBaRIlG07OA3aXnhC8wxGd8C3CnjDisCS
         +Syqh1uBcRz38RVjUs6nkDjI6z3n1Vn7hBpzkoKy2nMnxhyb+h/dsisvbpv9shN7VYq2
         Bs54qrjtwei53TXNvJcjHJQLMzBkLHQnYOF5N+rZu1Ob1iVQwERwJC9VYngvbGqbXpRM
         IGLw==
X-Forwarded-Encrypted: i=1; AJvYcCWRlFTNXMwoG7M5OmkdbBxHSg4qcdqoYlU/PmmOhg+tA3d3S8k/rp3nWIt5o40EYBGBFDK99rvfaHDkAo68@vger.kernel.org
X-Gm-Message-State: AOJu0YzjdMph7C45DQMyNYI5yNIz0cuzC+i6ha4V7URg6uqArcjv5DmV
	87EEI1X/ZSPex6vENzMSs/KDV0LHrV19Y+n8SclPrZLoZrDxUscvvucXJVisAIjJRTVVeTtz78K
	0ak9HBAMUnnlDFGdaGSd1rtI749mbCEtoYGRktvAABGSLAqgDbqlek/qzdsGWNgN4SONu
X-Gm-Gg: ASbGncv3nwhLdsJGRMxw9oplu21TZg7Fgrie+GQ+nM7Pp7LAG/eEJiD23eMvlZ9tkfk
	ZoydJ/VtZ2xq2UAEZEBijW7ywP78oVc2X5qaRDy4W7H5oejow0iGCnqRjSbvS9c4akbyHqZReG5
	iS2aZ/Yv10R8X1tDMMufckW3qf1tIUweRyikY4OYI7ocEF11ffMchdBKsGRPvOdrp2ZJP5QjRpR
	WPg0vuz9SMbXUAA+VyBVe0stK0mAwwCKJ9dpafvTfMKHpnRBVW+zHplXYed41TjIDbpUzbPW+vN
	ul44XYVha2sejjXhP2NFWa/eUdEYdLG+8dyj9OLm2rVTUFhlFV7BpIMQcjqJuzwOH5n7zTPM
X-Received: by 2002:a05:6a20:4305:b0:24a:b9e:4a61 with SMTP id adf61e73a8af0-2602bb59c12mr14572662637.28.1757919493699;
        Sun, 14 Sep 2025 23:58:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtlBsH/SNWSTbTRxp/GrkpLtHOa25wQJSw2D0oPkqGDUwg2u6T5e/VET60376PZwGt1U6C7A==
X-Received: by 2002:a05:6a20:4305:b0:24a:b9e:4a61 with SMTP id adf61e73a8af0-2602bb59c12mr14572628637.28.1757919493129;
        Sun, 14 Sep 2025 23:58:13 -0700 (PDT)
Received: from [10.218.32.171] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32df315f9dfsm8836976a91.21.2025.09.14.23.58.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Sep 2025 23:58:12 -0700 (PDT)
Message-ID: <2c5fd01a-543b-4108-ac54-80d1d87b65a3@oss.qualcomm.com>
Date: Mon, 15 Sep 2025 12:28:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] serial: qcom-geni: Fix pinctrl deadlock on runtime
 resume
To: Alexey Klimov <alexey.klimov@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Praveen Talari <quic_ptalari@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org
Cc: psodagud@quicinc.com, djaggi@quicinc.com, quic_msavaliy@quicinc.com,
        quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
        quic_mnaresh@quicinc.com, quic_shazhuss@quicinc.com, krzk@kernel.org
References: <20250908164532.2365969-1-praveen.talari@oss.qualcomm.com>
 <DCNLSFVPCKMV.K1UE3J3K6JQD@linaro.org>
 <DCOJFRU8KNFL.14VPXK9QZC9T4@linaro.org>
 <5b7b8c9f-48c5-45cd-8366-c8c048eaa757@oss.qualcomm.com>
 <DCPUJPHR8NUB.1SRB4D7ONSRBY@linaro.org>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <DCPUJPHR8NUB.1SRB4D7ONSRBY@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: JcGshjDCb5C8fpn-bOABrkCZH7WmRoSn
X-Authority-Analysis: v=2.4 cv=PsWTbxM3 c=1 sm=1 tr=0 ts=68c7b907 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=uZgilqiBXvIimX_9nf4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: JcGshjDCb5C8fpn-bOABrkCZH7WmRoSn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAyOSBTYWx0ZWRfXyzbQnHuYHA7Y
 EX8o/2e9y1XEll7wNL/G2zAs/8x2Jy5WWjiorwCvta0vFNGvFQcttzyDktwf2+iYUcxK4eroebw
 fyHWDqsxh/83vz+alWzqtOdOm7q9fy9DReGp8vykYzu1PxY/h8mxiCDpCKdHtEQdG08u6QJaFwr
 t3Bcn0zoFmmyDMB2ovjRB/wSksucVFWWMeQVUVcikTzaaBYbQmmrcWuKl7OFNUUVGoB9hjDYFdD
 ZH7JgVwb4WeXzfI123cyfZRJAclHHf/WkT5zjkDIg0q23bi0DEQ5aOahHiaf8OTiTk1Epba32xf
 3mhr+ghqQ9NlzdYklUtx0xYCvraVDU83FZy4rPEEk1yWTd5loo0K062CUHM0jKzxRxq99mcSZFs
 b//smPRC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_03,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130029

Hi Alexey,

Really appreciate you waiting!

On 9/11/2025 2:30 PM, Alexey Klimov wrote:
> Hi Praveen,
> 
> On Thu Sep 11, 2025 at 9:34 AM BST, Praveen Talari wrote:
>> Hi Alexy,
>>
>> Thank you for update.
>>
>> On 9/10/2025 1:35 AM, Alexey Klimov wrote:
>>>
>>> (adding Krzysztof to c/c)
>>>
>>> On Mon Sep 8, 2025 at 6:43 PM BST, Alexey Klimov wrote:
>>>> On Mon Sep 8, 2025 at 5:45 PM BST, Praveen Talari wrote:
>>>>> A deadlock is observed in the qcom_geni_serial driver during runtime
>>>>> resume. This occurs when the pinctrl subsystem reconfigures device pins
>>>>> via msm_pinmux_set_mux() while the serial device's interrupt is an
>>>>> active wakeup source. msm_pinmux_set_mux() calls disable_irq() or
>>>>> __synchronize_irq(), conflicting with the active wakeup state and
>>>>> causing the IRQ thread to enter an uninterruptible (D-state) sleep,
>>>>> leading to system instability.
>>>>>
>>>>> The critical call trace leading to the deadlock is:
>>>>>
>>>>>       Call trace:
>>>>>       __switch_to+0xe0/0x120
>>>>>       __schedule+0x39c/0x978
>>>>>       schedule+0x5c/0xf8
>>>>>       __synchronize_irq+0x88/0xb4
>>>>>       disable_irq+0x3c/0x4c
>>>>>       msm_pinmux_set_mux+0x508/0x644
>>>>>       pinmux_enable_setting+0x190/0x2dc
>>>>>       pinctrl_commit_state+0x13c/0x208
>>>>>       pinctrl_pm_select_default_state+0x4c/0xa4
>>>>>       geni_se_resources_on+0xe8/0x154
>>>>>       qcom_geni_serial_runtime_resume+0x4c/0x88
>>>>>       pm_generic_runtime_resume+0x2c/0x44
>>>>>       __genpd_runtime_resume+0x30/0x80
>>>>>       genpd_runtime_resume+0x114/0x29c
>>>>>       __rpm_callback+0x48/0x1d8
>>>>>       rpm_callback+0x6c/0x78
>>>>>       rpm_resume+0x530/0x750
>>>>>       __pm_runtime_resume+0x50/0x94
>>>>>       handle_threaded_wake_irq+0x30/0x94
>>>>>       irq_thread_fn+0x2c/xa8
>>>>>       irq_thread+0x160/x248
>>>>>       kthread+0x110/x114
>>>>>       ret_from_fork+0x10/x20
>>>>>
>>>>> To resolve this, explicitly manage the wakeup IRQ state within the
>>>>> runtime suspend/resume callbacks. In the runtime resume callback, call
>>>>> disable_irq_wake() before enabling resources. This preemptively
>>>>> removes the "wakeup" capability from the IRQ, allowing subsequent
>>>>> interrupt management calls to proceed without conflict. An error path
>>>>> re-enables the wakeup IRQ if resource enablement fails.
>>>>>
>>>>> Conversely, in runtime suspend, call enable_irq_wake() after resources
>>>>> are disabled. This ensures the interrupt is configured as a wakeup
>>>>> source only once the device has fully entered its low-power state. An
>>>>> error path handles disabling the wakeup IRQ if the suspend operation
>>>>> fails.
>>>>>
>>>>> Fixes: 1afa70632c39 ("serial: qcom-geni: Enable PM runtime for serial driver")
>>>>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>>>>
>>>> You forgot:
>>>>
>>>> Reported-by: Alexey Klimov <alexey.klimov@linaro.org>
>>>>
>>>> Also, not sure where this change will go, via Greg or Jiri, but ideally
>>>> this should be picked for current -rc cycle since regression is
>>>> introduced during latest merge window.
>>>>
>>>> I also would like to test it on qrb2210 rb1 where this regression is
>>>> reproduciable.
>>>
>>> It doesn't seem that it fixes the regression on RB1 board:
>>>
>>>    INFO: task kworker/u16:3:50 blocked for more than 120 seconds.
>>>          Not tainted 6.17.0-rc5-00018-g9dd1835ecda5-dirty #13
>>>    "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
>>>    task:kworker/u16:3   state:D stack:0     pid:50    tgid:50    ppid:2      task_flags:0x4208060 flags:0x00000010
>>>    Workqueue: async async_run_entry_fn
>>>    Call trace:
>>>     __switch_to+0xf0/0x1c0 (T)
>>>     __schedule+0x358/0x99c
>>>     schedule+0x34/0x11c
>>>     rpm_resume+0x17c/0x6a0
>>>     rpm_resume+0x2c4/0x6a0
>>>     rpm_resume+0x2c4/0x6a0
>>>     rpm_resume+0x2c4/0x6a0
>>>     __pm_runtime_resume+0x50/0x9c
>>>     __driver_probe_device+0x58/0x120
>>>     driver_probe_device+0x3c/0x154
>>>     __driver_attach_async_helper+0x4c/0xc0
>>>     async_run_entry_fn+0x34/0xe0
>>>     process_one_work+0x148/0x284
>>>     worker_thread+0x2c4/0x3e0
>>>     kthread+0x12c/0x210
>>>     ret_from_fork+0x10/0x20
>>>    INFO: task irq/92-4a8c000.:79 blocked for more than 120 seconds.
>>>          Not tainted 6.17.0-rc5-00018-g9dd1835ecda5-dirty #13
>>>    "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
>>>    task:irq/92-4a8c000. state:D stack:0     pid:79    tgid:79    ppid:2      task_flags:0x208040 flags:0x00000010
>>>    Call trace:
>>>     __switch_to+0xf0/0x1c0 (T)
>>>     __schedule+0x358/0x99c
>>>     schedule+0x34/0x11c
>>>     __synchronize_irq+0x90/0xcc
>>>     disable_irq+0x3c/0x4c
>>>     msm_pinmux_set_mux+0x3b4/0x45c
>>>     pinmux_enable_setting+0x1fc/0x2d8
>>>     pinctrl_commit_state+0xa0/0x260
>>>     pinctrl_pm_select_default_state+0x4c/0xa0
>>>     geni_se_resources_on+0xe8/0x154
>>>     geni_serial_resource_state+0x8c/0xbc
>>>     qcom_geni_serial_runtime_resume+0x3c/0x88
>>>     pm_generic_runtime_resume+0x2c/0x44
>>>     __rpm_callback+0x48/0x1e0
>>>     rpm_callback+0x74/0x80
>>>     rpm_resume+0x3bc/0x6a0
>>>     __pm_runtime_resume+0x50/0x9c
>>>     handle_threaded_wake_irq+0x30/0x80
>>>     irq_thread_fn+0x2c/0xb0
>>>     irq_thread+0x170/0x334
>>>     kthread+0x12c/0x210
>>>     ret_from_fork+0x10/0x20
>>
>> I can see call stack is mostly similar for yours and mine but not
>> completely at initial calls.
>>
>> Yours dump:
>>   >    qcom_geni_serial_runtime_resume+0x3c/0x88
>>   >    pm_generic_runtime_resume+0x2c/0x44
>>   >    __rpm_callback+0x48/0x1e0
>>   >    rpm_callback+0x74/0x80
>>   >    rpm_resume+0x3bc/0x6a0
>>   >    __pm_runtime_resume+0x50/0x9c
>>   >    handle_threaded_wake_irq+0x30/0x80
>>
>> Mine:
>>   >>>      qcom_geni_serial_runtime_resume+0x4c/0x88
>>   >>>      pm_generic_runtime_resume+0x2c/0x44
>>   >>>      __genpd_runtime_resume+0x30/0x80
>>   >>>      genpd_runtime_resume+0x114/0x29c
>>   >>>      __rpm_callback+0x48/0x1d8
>>   >>>      rpm_callback+0x6c/0x78
>>   >>>      rpm_resume+0x530/0x750
>>
>>
>> Can you please share what is DT file for this Board if possible?
>> is there any usecase enabled on this SE instance?
> 
> Well, yeah, sorry, I didn't really compared backtraces line to line and
> behaviour was exactly the same. I thought that the purpose was to fix
> the regression reported earlier.
> 
> RB1 main dts files are qrb2210-rb1.dts and qcm2290.dtsi.
> 
> The similar board RB2 uses qrb4210-rb2.dts and sm4250.dtsi+sm6115.dtsi,
> it is worth checking it as well.
> For testing here I didn't use anything extra (the only change was wifi fix
> from Loic); I tested -master and linux-next usually.
> 
> If you can tell me what is SE instance I may be able to answer. But
> as far as I know it is not a part of any infrastructure or CI machinery.
> I just boot the board and see if it works, if it does then I rebuild and
> test my changes (audio).

I'm actively working on this and experimenting various scenarios with 
wakeup. I’ll share the updated patch as soon as possible.

Should we include fix in V2 or new version(V1) if the fix originates 
from a different subsystem(pinctrol)?

Thanks,
Praveen Talari
> 
> Best regards,
> Alexey
> 

