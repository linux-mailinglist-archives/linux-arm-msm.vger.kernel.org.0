Return-Path: <linux-arm-msm+bounces-73851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B76EBB7ECBE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 15:01:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B299B7ADCC2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 03:24:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9590326FA5E;
	Wed, 17 Sep 2025 03:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gFbCT5Ae"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E471E149E17
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 03:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758079585; cv=none; b=o6l887TOxmxirxcZrVbrzf6/9aARpB3QacISuqfxHPc2pfuiLGLZBFwGHociq/pi/EArYsEoiNii++xlelMTKJT6m9xVTndKEUMsBkNQQukb/2+rkq/fHyrSSxpzvYpTS9q66+b1Qzj6amQP9D01UDx9OREp8kiS02QXQxZ5hF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758079585; c=relaxed/simple;
	bh=8ts0F0K+Jc0lwgkQ/xSNE7ECANa/vNb5ZeLpV9g8uWo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pEOZPttVQvI2h2iuBCDRlWfS3ztTL7NaB7tNpknKoRfri33Vv+PnbXzrsd+CgCMg20o9Iv8lmQHwX2HlvLoMxaEbM+x3nr3w1cdc8dsL/jjSG+/RYzVNE5P01nWY9q732xaiquKdt01wuq+TUuSSvM00uwSxWzbWknGlOmTs7vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gFbCT5Ae; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GLajHs021938
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 03:26:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D5Ze7fBfF5bOpW6nOK7lzrEeHW+SnZky8WuncUBAOwc=; b=gFbCT5AeCRUdBBGv
	tavMaaYdL3ZCkhRk6bXBiqC9F5Pjt/vWaEQUVlFlmrn0zzKHDaMXqsruzNiHORR7
	XCJz2fEEgFsVQoeiIjBvbjka/VxuV06fuh1CfD8bHbI/Ovv2rn9zBX165s5zgD0L
	LDwVhlCQ5uBx812XeKUcx/HixfYI1yiJbvUqD8v+Z1aHI3awA7HRh29SmGZdrGEe
	Aj409MEPJMS/89nW0jVUtc+hCpV7rDU8Eng3CCBKLlLtxb36Ww4qp4Bg1AQwgMPh
	LurbBqJmeH30XKQusx+Daskw7Lee/m1u8EE9xRK+kSiY/jxVi/DMtr8zo4Qq0A0N
	9/J6EQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxygqxx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 03:26:23 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-268149e1c28so1662575ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 20:26:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758079582; x=1758684382;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D5Ze7fBfF5bOpW6nOK7lzrEeHW+SnZky8WuncUBAOwc=;
        b=kdBdKRXurTcyeUWYk/wddp+fz7JS4MGZi1BcGrONDMPzCjBRIltqgHTEJ0t23KUNQT
         Y9tAKfjmCqcy8ADFarKIi9jp09MAJcZXpqJMnMnrtVDg3aXZyioXYxqCaApuVsju6bIB
         O0eIiZXN/YQNOjiW3O0VwXT2DhD13m5+2IzHord7CoMAOPWBfYjqr6NySBziFoWEy/2/
         AqhuLlPUaNeZzC23n1Y/SP3gQOiFqtmRVeQKu0pSNCgssHqQZQS+VWdSwLUI8SkumNbR
         xk3NWHf+tYskNO1k/uUkLMUUVEx/EF+KkgHEZNvfK4j/UvZP7F+XNyyTsWt9Ysr+1/bm
         A9NQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHszSqKg+5US7AoUSdn2X7XO++OdBK0S/OoPfNkF6sHqE0SUnEqWzHSXehCP4iBRFj3G7psT7VG2osc4Ck@vger.kernel.org
X-Gm-Message-State: AOJu0YyFOtS5X3IOzG83rJlyCbHHLtrxQO6V4iffBTGRC48rMtAboKn9
	cG6BZlYaTNVG2S2XAsKIE+Uc+wjV0SOmrLYlfxvG5Y6VWZ64lxw5HQC+PSsNQtpQ6prltKlMpl2
	q8Bah0rmUzQMfKNPww3gCb/Uh0PLogl3OFT2HY8ddCP03C9IsMG1hLYROq3ljXdM35RQ6
X-Gm-Gg: ASbGnct5IITuoIBHru/JIHAHbuSFAGISYNi8MAklANxNngP1X9nvfrsfCa0/QiFyv/K
	/fSmD7huqrxrn7KSPWgUmtJNZmycWDHmXVVW6lZTqQnzspmipofkToNWXY9o09sKtO7O1Qnkplm
	xc+02HvaNGUltWca9nmZMCPbBB9hTQdBFUClKVQ/ukNd9x0XzfWba241IZTYOcC5A5KDit5dPnX
	Y7YsbmuqevyJzY4+dZwUWjjQ6RTDRK4uvmTTfDC/93CFmYZYSfR/GmsP6sN/y8qZkoztRgNEu01
	9zmSaV/Jztb8xOFZYGogp2YvEKf54xdxf7mnzKXv8zf0PqQXtxA/36pU5HuIDb9m8J7tmgH0
X-Received: by 2002:a17:902:f548:b0:267:a5df:9b07 with SMTP id d9443c01a7336-268118b95c2mr8163645ad.12.1758079582140;
        Tue, 16 Sep 2025 20:26:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqu8JXr3DLXFVqyhAiPyWwY3CsgpScBJki2HbdMSZofPzvbaZpZpPop/u36XjzDnXudTckuQ==
X-Received: by 2002:a17:902:f548:b0:267:a5df:9b07 with SMTP id d9443c01a7336-268118b95c2mr8163265ad.12.1758079581517;
        Tue, 16 Sep 2025 20:26:21 -0700 (PDT)
Received: from [10.218.32.171] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-267de22b719sm28237545ad.85.2025.09.16.20.26.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 20:26:21 -0700 (PDT)
Message-ID: <7f0e6f0b-942f-4903-bee6-9c8f6ab5ec36@oss.qualcomm.com>
Date: Wed, 17 Sep 2025 08:56:14 +0530
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
Cc: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
 <cb96f3cd-7427-4644-b7ca-26b763867db4@oss.qualcomm.com>
 <df05da7e-fd9d-48a6-bffc-e84749cd8e96@oss.qualcomm.com>
 <aMl2hOYTjBuCo4AM@trex> <aMl9Fbuyq7hdXvQC@trex>
 <DCUE5AXJ99BG.150SRQMY7EJG6@linaro.org>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <DCUE5AXJ99BG.150SRQMY7EJG6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=e50GSbp/ c=1 sm=1 tr=0 ts=68ca2a5f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=3zEiWGLsQ94HuRbx9vcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: DTcC9ziT1lvNthuO_AevGequRKCDRgAx
X-Proofpoint-ORIG-GUID: DTcC9ziT1lvNthuO_AevGequRKCDRgAx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX+McLIjVKQAjR
 WjbbnKxf1DkIFZOAxrdhvGqyTIOx+j95Fwj2sb0g2R1qTu6A7VJ8bt3omc/OEqZeTENXIDbfdwN
 Xtfw6rcSKkPLf+vW51UmJzObz5pYhJnOZ6zj0VMbU5A1a+/rcl5KrgqzOjh9D8SL5/HpjbSqs/i
 GIdMwJ4xEIY6wrqjCsYaiXVspUJ5Hc1E/qwb2uCjX8caFW9+5rvQ5IcnxqyOqVgZev6USCQjsJT
 pcMJbdQ6uMrv3dLRfuSCDxC5NWGUClBPTBns8/sFqQdLzCeRSraqvDCP+a1vTfKHDIII5B47MvR
 t4vYOMSN0JYQe7O3s8AgerCEpsVlcKCgSB0jiI9KP6cWI7gcQhnQ/VkCZycYpi3BKbtVqX6uUaK
 vuERW2CV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-16_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202

Hi Alexey,

On 9/16/2025 10:42 PM, Alexey Klimov wrote:
> Hi Praveen,
> 
> On Tue Sep 16, 2025 at 4:07 PM BST, Jorge Ramirez wrote:
>> On 16/09/25 16:39:00, Jorge Ramirez wrote:
>>> On 16/09/25 12:20:25, Praveen Talari wrote:
>>>> Hi Alexey
>>>>
>>>> Thank you for your support.
>>>>
>>>> On 9/15/2025 7:55 PM, Praveen Talari wrote:
>>>>> Hi Alexey,
>>>>>
>>>>> On 9/15/2025 3:09 PM, Alexey Klimov wrote:
>>>>>> (removing <quic_mnaresh@quicinc.com> from c/c -- too many mail not
>>>>>> delivered)
>>>>>>
>>>>>> Hi Praveen,
>>>>>>
>>>>>> On Mon Sep 15, 2025 at 7:58 AM BST, Praveen Talari wrote:
>>>>>>> Hi Alexey,
>>>>>>>
>>>>>>> Really appreciate you waiting!
>>>>>>>
>>>>>>> On 9/11/2025 2:30 PM, Alexey Klimov wrote:
>>>>>>>> Hi Praveen,
>>>>>>>>
>>>>>>>> On Thu Sep 11, 2025 at 9:34 AM BST, Praveen Talari wrote:
>>>>>>>>> Hi Alexy,
>>>>>>>>>
>>>>>>>>> Thank you for update.
>>>>>>>>>
>>>>>>>>> On 9/10/2025 1:35 AM, Alexey Klimov wrote:
>>>>>>>>>>
>>>>>>>>>> (adding Krzysztof to c/c)
>>>>>>>>>>
>>>>>>>>>> On Mon Sep 8, 2025 at 6:43 PM BST, Alexey Klimov wrote:
>>>>>>>>>>> On Mon Sep 8, 2025 at 5:45 PM BST, Praveen Talari wrote:
>>>>>>>>>>>> A deadlock is observed in the
>>>>>>>>>>>> qcom_geni_serial driver during runtime
>>>>>>>>>>>> resume. This occurs when the pinctrl
>>>>>>>>>>>> subsystem reconfigures device pins
>>>>>>>>>>>> via msm_pinmux_set_mux() while the serial device's interrupt is an
>>>>>>>>>>>> active wakeup source. msm_pinmux_set_mux() calls disable_irq() or
>>>>>>>>>>>> __synchronize_irq(), conflicting with the active wakeup state and
>>>>>>>>>>>> causing the IRQ thread to enter an uninterruptible (D-state) sleep,
>>>>>>>>>>>> leading to system instability.
>>>>>>>>>>>>
>>>>>>>>>>>> The critical call trace leading to the deadlock is:
>>>>>>>>>>>>
>>>>>>>>>>>>         Call trace:
>>>>>>>>>>>>         __switch_to+0xe0/0x120
>>>>>>>>>>>>         __schedule+0x39c/0x978
>>>>>>>>>>>>         schedule+0x5c/0xf8
>>>>>>>>>>>>         __synchronize_irq+0x88/0xb4
>>>>>>>>>>>>         disable_irq+0x3c/0x4c
>>>>>>>>>>>>         msm_pinmux_set_mux+0x508/0x644
>>>>>>>>>>>>         pinmux_enable_setting+0x190/0x2dc
>>>>>>>>>>>>         pinctrl_commit_state+0x13c/0x208
>>>>>>>>>>>>         pinctrl_pm_select_default_state+0x4c/0xa4
>>>>>>>>>>>>         geni_se_resources_on+0xe8/0x154
>>>>>>>>>>>>         qcom_geni_serial_runtime_resume+0x4c/0x88
>>>>>>>>>>>>         pm_generic_runtime_resume+0x2c/0x44
>>>>>>>>>>>>         __genpd_runtime_resume+0x30/0x80
>>>>>>>>>>>>         genpd_runtime_resume+0x114/0x29c
>>>>>>>>>>>>         __rpm_callback+0x48/0x1d8
>>>>>>>>>>>>         rpm_callback+0x6c/0x78
>>>>>>>>>>>>         rpm_resume+0x530/0x750
>>>>>>>>>>>>         __pm_runtime_resume+0x50/0x94
>>>>>>>>>>>>         handle_threaded_wake_irq+0x30/0x94
>>>>>>>>>>>>         irq_thread_fn+0x2c/xa8
>>>>>>>>>>>>         irq_thread+0x160/x248
>>>>>>>>>>>>         kthread+0x110/x114
>>>>>>>>>>>>         ret_from_fork+0x10/x20
>>>>>>>>>>>>
>>>>>>>>>>>> To resolve this, explicitly manage the wakeup IRQ state within the
>>>>>>>>>>>> runtime suspend/resume callbacks. In the
>>>>>>>>>>>> runtime resume callback, call
>>>>>>>>>>>> disable_irq_wake() before enabling resources. This preemptively
>>>>>>>>>>>> removes the "wakeup" capability from the IRQ, allowing subsequent
>>>>>>>>>>>> interrupt management calls to proceed
>>>>>>>>>>>> without conflict. An error path
>>>>>>>>>>>> re-enables the wakeup IRQ if resource enablement fails.
>>>>>>>>>>>>
>>>>>>>>>>>> Conversely, in runtime suspend, call
>>>>>>>>>>>> enable_irq_wake() after resources
>>>>>>>>>>>> are disabled. This ensures the interrupt is configured as a wakeup
>>>>>>>>>>>> source only once the device has fully
>>>>>>>>>>>> entered its low-power state. An
>>>>>>>>>>>> error path handles disabling the wakeup IRQ
>>>>>>>>>>>> if the suspend operation
>>>>>>>>>>>> fails.
>>>>>>>>>>>>
>>>>>>>>>>>> Fixes: 1afa70632c39 ("serial: qcom-geni:
>>>>>>>>>>>> Enable PM runtime for serial driver")
>>>>>>>>>>>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>>>>>>>>>>>
>>>>>>>>>>> You forgot:
>>>>>>>>>>>
>>>>>>>>>>> Reported-by: Alexey Klimov <alexey.klimov@linaro.org>
>>>>>>>>>>>
>>>>>>>>>>> Also, not sure where this change will go, via
>>>>>>>>>>> Greg or Jiri, but ideally
>>>>>>>>>>> this should be picked for current -rc cycle since regression is
>>>>>>>>>>> introduced during latest merge window.
>>>>>>>>>>>
>>>>>>>>>>> I also would like to test it on qrb2210 rb1 where this regression is
>>>>>>>>>>> reproduciable.
>>>>
>>>> Since I don't have this board, could you kindly validate the new change and
>>>> run a quick test on your end?
>>>>
>>>> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c
>>>> b/drivers/pinctrl/qcom/pinctrl-msm.c
>>>> index 83eb075b6bfa..3d6601dc6fcc 100644
>>>> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
>>>> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
>>>> @@ -215,7 +215,7 @@ static int msm_pinmux_set_mux(struct pinctrl_dev
>>>> *pctldev,
>>>>           */
>>>>          if (d && i != gpio_func &&
>>>>              !test_and_set_bit(d->hwirq, pctrl->disabled_for_mux))
>>>> -               disable_irq(irq);
>>>> +               disable_irq_nosync(irq);
>>>>
>>>>          raw_spin_lock_irqsave(&pctrl->lock, flags);
>>>
>>>
>>> sorry Praveen, didnt see this proposal. testing on my end as well.
>>>
>>
>> just tested on my end and all modules load - deadlocked before this
>> update so there is progress (now we can load the network driver)
> 
> Is it supposed to be orginal patch here plus disable_irq_nosync()?

Only this disable_irq_nosync() change from pinctrol subsystem.

Thanks,
Praveen Talari
> Meaning changes for qcom_geni_serial_runtime_{suspend,resume}
> + disable_irq_nosync() in msm_pinmux_set_mux()?

No, only disable_irq_nosync() in msm_pinmux_set_mux().
> 
> It seems to work here but let me know few more runs.
> 
> Best regards,
> Alexey
> 
> 
> 

