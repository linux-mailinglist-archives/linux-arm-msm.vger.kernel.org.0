Return-Path: <linux-arm-msm+bounces-73596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A931FB57ED8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 16:25:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 49BA81899FB0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 14:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94234324B1E;
	Mon, 15 Sep 2025 14:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="inVdlhlZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B617130BF6D
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 14:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757946325; cv=none; b=Lce2sytWLiDifiGjaaLx8/glju1w6BFT2eE0JNJn90fddFnSyzni418K7IlNJisN160uMGaJCRma88GsSG6Fg+tRDaUvvRPZKikgoknL4XeP9l+nC1m/OSFllvTlOgl3wvRGCCxyy/y384xljE5pTveIo01nhPrJRXceLd0WUzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757946325; c=relaxed/simple;
	bh=VRJmU+3Z0Ji8Ytd0OifcCVdCAJW+EyU4ZhcjTZpgSu0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hv8GIOzsXa8qxPE4xWr1KRN8X4P58NUzFLbfM9ra8D0fpy8HK/OfbtzDYVKcyIzZaZ6CI9HIzHzWfiY1wtiWln2w5DvgVdBJYbLtd19u0WJeyk8QkVG4nFiAqySUlYFwwb8uthlR773777QJDFfk+k57R25MQNTXSKK84zfdxvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=inVdlhlZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58FEBZsl014033
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 14:25:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5izw87yptpP/XObnBkQgmPZEGVfJ4L4P4qGMCF58Bqo=; b=inVdlhlZoch48y8V
	Dbp9UOiLvMHxY/9sFGJLiWkCr2t8Nyw3UJVUzEWIQkESk2YE6G7kO8KnNw+pP5mu
	aAhC3dXqJ1AIsWUn8bKLOPsZqjRxkn0/bbEzBIgiVO75vozJHOsgpl6fnw1slG6Q
	ceIAH3IL6Ik9xAm5DJbU0sbK/ixCHyVlxxkBipNaHmDXe++e7WHY3+94epXirbnv
	ycbgsSqiJz9n079R/wDzOCTbAMBz9b7sRstcymiy52enDxHDpPWvdxbtw0lOfYQm
	XpW06RtZTJ40PJ7vv7ZtjGxNZwqNg5LEPbe5T5VpZNc17udvOUTBrw1dXWIgkxcJ
	fxW1Vg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494wyr5g93-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 14:25:22 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b4dfb96c99dso2790143a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 07:25:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757946321; x=1758551121;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5izw87yptpP/XObnBkQgmPZEGVfJ4L4P4qGMCF58Bqo=;
        b=eJ+CiR7U6PXnWHv7O6wcpgB9F6FM7fx5+hZsgJSokR8KhVy4S17BgWuDf/gbF8IbxL
         nzWgYOAkWjfl4sI3J/yZumy0yh8ysT0xeMhB65qTolspv77j4spPUeaBhFr2PFZX5GQ5
         +u13HePLNlXb0PwQLPqZ91oFsY3zg3+Js2lqhZ0wJfPWFqIKLpGOLen3Kfl58hMIjYQs
         WFf+TWwmsOggR81weahMdvnquMeEEno39b3rCb0lm7u9nzvYuOcQMTG5W6C74kGQ5SIr
         lEsc2O3vBVvHbji4iqlBoDjqii0BTa4JGp4Zph1k23dMrRXemGl/sMCkgPZCqKb2dMwZ
         G/Hg==
X-Forwarded-Encrypted: i=1; AJvYcCVYxkWfNMp62tw12SeNA3UB1y/LOb1uhTsIg5/BvBKDOyMlNuPhTj/Hwfl3LYaScRYo1vT16sPO2ujhbH1t@vger.kernel.org
X-Gm-Message-State: AOJu0YxGy85r71ZIxh2E9zBHNykHj2wLIjN04QV+CfMRHJ+cktrY3ASK
	puK19qPlGCblufY3u/LuBURinLCA9gIA3YhATu2TswrVM1S43z5f2kjGk8/akJfCsBdJpVK0u9b
	9uM6HKsglJ+kBgz/vTJbno4RB0q4yImlcWIFp0HQb7cqG/OxZYLTebk79uOuP5glsBf+Z
X-Gm-Gg: ASbGnctkju7VgTjw2T+ooYFGWb2UpDp7b6YqrrnosM5+8LouK2oqxGizazb7J7ZmGgF
	22kPpT0ajZ7XXl3bK8GvpDvCTqzTgPkltVimSi9tuXZrsufoLe33OF0+BQQnX9rTUgHpJzqol+q
	6vUNiKDCIo0G51tR8A8fBwVHBEppTZ9NQsfyO8dh197b3FeSuDq9B9NiCGbwqA6aJINxEn54HE3
	6tN3gVLKbCiQ8wszRzu/A4Fs1eJyjMd6Cqn52YD3o/T2obdBW41qR+UqYRF865FZyKGJOM+vCpN
	bqP8W92nQhHPRmeQKHH09GD4xFV+lzTUU5mkThmZ25mTf1TeNjMW9cZhY1OaBWSHbG3rbyY=
X-Received: by 2002:a17:902:f788:b0:267:99bf:6724 with SMTP id d9443c01a7336-26799bf6b55mr27467995ad.31.1757946321005;
        Mon, 15 Sep 2025 07:25:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVopEJxZmQBHqpYtqqiv3HdtWoLiJQP97ogG4ITqijKQjfqCkXb3yEbY1lb5VyRKyTIFWuAQ==
X-Received: by 2002:a17:902:f788:b0:267:99bf:6724 with SMTP id d9443c01a7336-26799bf6b55mr27467245ad.31.1757946320335;
        Mon, 15 Sep 2025 07:25:20 -0700 (PDT)
Received: from [192.168.1.7] ([49.204.104.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-26263a76cd4sm64322145ad.31.2025.09.15.07.25.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 07:25:19 -0700 (PDT)
Message-ID: <cb96f3cd-7427-4644-b7ca-26b763867db4@oss.qualcomm.com>
Date: Mon, 15 Sep 2025 19:55:14 +0530
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
        Praveen Talari <quic_ptalari@quicinc.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, psodagud@quicinc.com, djaggi@quicinc.com,
        quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com,
        quic_arandive@quicinc.com, quic_shazhuss@quicinc.com, krzk@kernel.org
References: <20250908164532.2365969-1-praveen.talari@oss.qualcomm.com>
 <DCNLSFVPCKMV.K1UE3J3K6JQD@linaro.org>
 <DCOJFRU8KNFL.14VPXK9QZC9T4@linaro.org>
 <5b7b8c9f-48c5-45cd-8366-c8c048eaa757@oss.qualcomm.com>
 <DCPUJPHR8NUB.1SRB4D7ONSRBY@linaro.org>
 <2c5fd01a-543b-4108-ac54-80d1d87b65a3@oss.qualcomm.com>
 <DCT9VWQYD4VM.1NV5FJJCJG4PI@linaro.org>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <DCT9VWQYD4VM.1NV5FJJCJG4PI@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: qLTb45ePzK6Ij4-SjTUziJW8BHFapxRz
X-Authority-Analysis: v=2.4 cv=SouQ6OO0 c=1 sm=1 tr=0 ts=68c821d2 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Z2XpV/0q3vK5biEotBnTqQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=05CQPNOUvAP4fS3p7jwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAwMCBTYWx0ZWRfX739yvveE8rgJ
 3HrUwtUD2G6eyu4V/vuAtw9EUTkUKh12a8dtM5xCTwW3jJsCR2RhsFr8ix0Ue2EnsSD9yV3NasX
 xKafSQp9wxQjuhcPQ6xgkIZp42hFXGK4/QHdvq/EVh8DJPCdBoopzWhiJg9h5OO71TCq2rqPqjA
 GYWbSLp5W9n0C6y6OupNGfbcOtBCD2OLbw1X+7KVfwb5y7LA/emvKGawwIZFGTL95mrxTGEwTc/
 prHLouzFxCRfkaKtuuTYmoorXz1O4IJlGyq/Cy8v622WtFQ2iiOrvaugp5+TjQDLX8fa1+zln6W
 5TesWq08GgEe0rAxsQn1p7gTMk2nv9NHpcPydXWIiWVPeFkK1UUB8JaGnaT2lIuiJkOLCOvS+nl
 wEcrnALL
X-Proofpoint-GUID: qLTb45ePzK6Ij4-SjTUziJW8BHFapxRz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_05,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130000

Hi Alexey,

On 9/15/2025 3:09 PM, Alexey Klimov wrote:
> (removing <quic_mnaresh@quicinc.com> from c/c -- too many mail not delivered)
> 
> Hi Praveen,
> 
> On Mon Sep 15, 2025 at 7:58 AM BST, Praveen Talari wrote:
>> Hi Alexey,
>>
>> Really appreciate you waiting!
>>
>> On 9/11/2025 2:30 PM, Alexey Klimov wrote:
>>> Hi Praveen,
>>>
>>> On Thu Sep 11, 2025 at 9:34 AM BST, Praveen Talari wrote:
>>>> Hi Alexy,
>>>>
>>>> Thank you for update.
>>>>
>>>> On 9/10/2025 1:35 AM, Alexey Klimov wrote:
>>>>>
>>>>> (adding Krzysztof to c/c)
>>>>>
>>>>> On Mon Sep 8, 2025 at 6:43 PM BST, Alexey Klimov wrote:
>>>>>> On Mon Sep 8, 2025 at 5:45 PM BST, Praveen Talari wrote:
>>>>>>> A deadlock is observed in the qcom_geni_serial driver during runtime
>>>>>>> resume. This occurs when the pinctrl subsystem reconfigures device pins
>>>>>>> via msm_pinmux_set_mux() while the serial device's interrupt is an
>>>>>>> active wakeup source. msm_pinmux_set_mux() calls disable_irq() or
>>>>>>> __synchronize_irq(), conflicting with the active wakeup state and
>>>>>>> causing the IRQ thread to enter an uninterruptible (D-state) sleep,
>>>>>>> leading to system instability.
>>>>>>>
>>>>>>> The critical call trace leading to the deadlock is:
>>>>>>>
>>>>>>>        Call trace:
>>>>>>>        __switch_to+0xe0/0x120
>>>>>>>        __schedule+0x39c/0x978
>>>>>>>        schedule+0x5c/0xf8
>>>>>>>        __synchronize_irq+0x88/0xb4
>>>>>>>        disable_irq+0x3c/0x4c
>>>>>>>        msm_pinmux_set_mux+0x508/0x644
>>>>>>>        pinmux_enable_setting+0x190/0x2dc
>>>>>>>        pinctrl_commit_state+0x13c/0x208
>>>>>>>        pinctrl_pm_select_default_state+0x4c/0xa4
>>>>>>>        geni_se_resources_on+0xe8/0x154
>>>>>>>        qcom_geni_serial_runtime_resume+0x4c/0x88
>>>>>>>        pm_generic_runtime_resume+0x2c/0x44
>>>>>>>        __genpd_runtime_resume+0x30/0x80
>>>>>>>        genpd_runtime_resume+0x114/0x29c
>>>>>>>        __rpm_callback+0x48/0x1d8
>>>>>>>        rpm_callback+0x6c/0x78
>>>>>>>        rpm_resume+0x530/0x750
>>>>>>>        __pm_runtime_resume+0x50/0x94
>>>>>>>        handle_threaded_wake_irq+0x30/0x94
>>>>>>>        irq_thread_fn+0x2c/xa8
>>>>>>>        irq_thread+0x160/x248
>>>>>>>        kthread+0x110/x114
>>>>>>>        ret_from_fork+0x10/x20
>>>>>>>
>>>>>>> To resolve this, explicitly manage the wakeup IRQ state within the
>>>>>>> runtime suspend/resume callbacks. In the runtime resume callback, call
>>>>>>> disable_irq_wake() before enabling resources. This preemptively
>>>>>>> removes the "wakeup" capability from the IRQ, allowing subsequent
>>>>>>> interrupt management calls to proceed without conflict. An error path
>>>>>>> re-enables the wakeup IRQ if resource enablement fails.
>>>>>>>
>>>>>>> Conversely, in runtime suspend, call enable_irq_wake() after resources
>>>>>>> are disabled. This ensures the interrupt is configured as a wakeup
>>>>>>> source only once the device has fully entered its low-power state. An
>>>>>>> error path handles disabling the wakeup IRQ if the suspend operation
>>>>>>> fails.
>>>>>>>
>>>>>>> Fixes: 1afa70632c39 ("serial: qcom-geni: Enable PM runtime for serial driver")
>>>>>>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>>>>>>
>>>>>> You forgot:
>>>>>>
>>>>>> Reported-by: Alexey Klimov <alexey.klimov@linaro.org>
>>>>>>
>>>>>> Also, not sure where this change will go, via Greg or Jiri, but ideally
>>>>>> this should be picked for current -rc cycle since regression is
>>>>>> introduced during latest merge window.
>>>>>>
>>>>>> I also would like to test it on qrb2210 rb1 where this regression is
>>>>>> reproduciable.
>>>>>
>>>>> It doesn't seem that it fixes the regression on RB1 board:
>>>>>
>>>>>     INFO: task kworker/u16:3:50 blocked for more than 120 seconds.
>>>>>           Not tainted 6.17.0-rc5-00018-g9dd1835ecda5-dirty #13
>>>>>     "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
>>>>>     task:kworker/u16:3   state:D stack:0     pid:50    tgid:50    ppid:2      task_flags:0x4208060 flags:0x00000010
>>>>>     Workqueue: async async_run_entry_fn
>>>>>     Call trace:
>>>>>      __switch_to+0xf0/0x1c0 (T)
>>>>>      __schedule+0x358/0x99c
>>>>>      schedule+0x34/0x11c
>>>>>      rpm_resume+0x17c/0x6a0
>>>>>      rpm_resume+0x2c4/0x6a0
>>>>>      rpm_resume+0x2c4/0x6a0
>>>>>      rpm_resume+0x2c4/0x6a0
>>>>>      __pm_runtime_resume+0x50/0x9c
>>>>>      __driver_probe_device+0x58/0x120
>>>>>      driver_probe_device+0x3c/0x154
>>>>>      __driver_attach_async_helper+0x4c/0xc0
>>>>>      async_run_entry_fn+0x34/0xe0
>>>>>      process_one_work+0x148/0x284
>>>>>      worker_thread+0x2c4/0x3e0
>>>>>      kthread+0x12c/0x210
>>>>>      ret_from_fork+0x10/0x20
>>>>>     INFO: task irq/92-4a8c000.:79 blocked for more than 120 seconds.
>>>>>           Not tainted 6.17.0-rc5-00018-g9dd1835ecda5-dirty #13
>>>>>     "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
>>>>>     task:irq/92-4a8c000. state:D stack:0     pid:79    tgid:79    ppid:2      task_flags:0x208040 flags:0x00000010
>>>>>     Call trace:
>>>>>      __switch_to+0xf0/0x1c0 (T)
>>>>>      __schedule+0x358/0x99c
>>>>>      schedule+0x34/0x11c
>>>>>      __synchronize_irq+0x90/0xcc
>>>>>      disable_irq+0x3c/0x4c
>>>>>      msm_pinmux_set_mux+0x3b4/0x45c
>>>>>      pinmux_enable_setting+0x1fc/0x2d8
>>>>>      pinctrl_commit_state+0xa0/0x260
>>>>>      pinctrl_pm_select_default_state+0x4c/0xa0
>>>>>      geni_se_resources_on+0xe8/0x154
>>>>>      geni_serial_resource_state+0x8c/0xbc
>>>>>      qcom_geni_serial_runtime_resume+0x3c/0x88
>>>>>      pm_generic_runtime_resume+0x2c/0x44
>>>>>      __rpm_callback+0x48/0x1e0
>>>>>      rpm_callback+0x74/0x80
>>>>>      rpm_resume+0x3bc/0x6a0
>>>>>      __pm_runtime_resume+0x50/0x9c
>>>>>      handle_threaded_wake_irq+0x30/0x80
>>>>>      irq_thread_fn+0x2c/0xb0
>>>>>      irq_thread+0x170/0x334
>>>>>      kthread+0x12c/0x210
>>>>>      ret_from_fork+0x10/0x20
>>>>
>>>> I can see call stack is mostly similar for yours and mine but not
>>>> completely at initial calls.
>>>>
>>>> Yours dump:
>>>>    >    qcom_geni_serial_runtime_resume+0x3c/0x88
>>>>    >    pm_generic_runtime_resume+0x2c/0x44
>>>>    >    __rpm_callback+0x48/0x1e0
>>>>    >    rpm_callback+0x74/0x80
>>>>    >    rpm_resume+0x3bc/0x6a0
>>>>    >    __pm_runtime_resume+0x50/0x9c
>>>>    >    handle_threaded_wake_irq+0x30/0x80
>>>>
>>>> Mine:
>>>>    >>>      qcom_geni_serial_runtime_resume+0x4c/0x88
>>>>    >>>      pm_generic_runtime_resume+0x2c/0x44
>>>>    >>>      __genpd_runtime_resume+0x30/0x80
>>>>    >>>      genpd_runtime_resume+0x114/0x29c
>>>>    >>>      __rpm_callback+0x48/0x1d8
>>>>    >>>      rpm_callback+0x6c/0x78
>>>>    >>>      rpm_resume+0x530/0x750
>>>>
>>>>
>>>> Can you please share what is DT file for this Board if possible?
>>>> is there any usecase enabled on this SE instance?
>>>
>>> Well, yeah, sorry, I didn't really compared backtraces line to line and
>>> behaviour was exactly the same. I thought that the purpose was to fix
>>> the regression reported earlier.
>>>
>>> RB1 main dts files are qrb2210-rb1.dts and qcm2290.dtsi.
>>>
>>> The similar board RB2 uses qrb4210-rb2.dts and sm4250.dtsi+sm6115.dtsi,
>>> it is worth checking it as well.
>>> For testing here I didn't use anything extra (the only change was wifi fix
>>> from Loic); I tested -master and linux-next usually.
>>>
>>> If you can tell me what is SE instance I may be able to answer. But
>>> as far as I know it is not a part of any infrastructure or CI machinery.
>>> I just boot the board and see if it works, if it does then I rebuild and
>>> test my changes (audio).
>>
>> I'm actively working on this and experimenting various scenarios with
>> wakeup. I’ll share the updated patch as soon as possible.
>>
>> Should we include fix in V2 or new version(V1) if the fix originates
>> from a different subsystem(pinctrol)?
> 
> Wait, I am a bit lost. Are there two regresssions? And is this patch only
> targets one of the them?
I am simulated on different target(SC7280) and it is same issue only.
> Are there two fixes now for different problems?
The problem is same.
> If they are not related (independent) then I'd split it but it not something
> exceptional -- just standard rules should apply.
I am fixing from this issue from pinctrol subsystem.

Please guide me on this.
Should we include fix in V2 or new version(V1) if the fix originates
from a different subsystem(pinctrol)?

Thanks,
Praveen
> 
> Thanks,
> Alexey

