Return-Path: <linux-arm-msm+bounces-87527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9A0CF4AC9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 17:27:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D98463008C66
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 16:26:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C022304BC6;
	Mon,  5 Jan 2026 16:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TNFYfFs8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SPlZ/Nr4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACAB52DEA78
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jan 2026 16:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767629566; cv=none; b=iGUj8c/bSUh5LFYqxm+ULjxIR+2ufs/ozbEQ5KOVm5lBu6zof54YgDAZEXR5YhQ8IFjjHEdz2NfzAWg9cYMXoVsUSzGKw66H1Bj8wyTeqd8kqp6a/nZmirWqnfK3rCubKJL1VXYW4R7lqb0ZqePMCvQHnWYin4gU4Qbmn0qjis8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767629566; c=relaxed/simple;
	bh=OrU54GV2LVpLw9WXOrnrg/6soqblvlSw6DkzLXmYVoc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qwJit3pxEKwm7Y8DJB1olAF6lguzgKRPwCbmHz89RLF7l9fmAfROXsIKLMCsEwhYxxKSdgfBC+IkhA62Kc92S9/hNzcn1eCKLXMAoc/km60akzJtCWx6vfKayaQjxH99KAQ/5iXNSroyGGIaZL8TT7XeJGuVOR0Brc+zLFUAZ0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TNFYfFs8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SPlZ/Nr4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 605FovOD1617488
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Jan 2026 16:12:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vgVyJzNXMpB1SreYlCVQP+upMwomcjp+afmj3FAH7sw=; b=TNFYfFs8OUr1vhTI
	YfTCx7koE37kuNyxK3Y2pyAIoVlWK9f4cS7tyc80pV3VoV65TGXmh0kVNOv7U7GZ
	aOQbekMfb28H9iOYOvlS0j1+Jdq8VzffhwragtmNzCJiaRD27u95o4F+fVLDLhf5
	4GyQM9iNMvegenA6cAJJR0K7Q1Q82rPqrd5/F5aePXMZslVnvtKrKKmumKaSK04+
	Ikccvemj1oBJkd8lahlJcFCxuzf1n9PLJs1AYCpura4/hZLF6vMP5YFnMqdAFU4D
	pmTuu8zucw1CctyFx+QCuLuOlIknPGy6pK9PzHSoFmzTQZ/++bLoV0z8C6IZi6N4
	lrrRRw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgg9yr33q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 16:12:43 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b89c1ce9cfso106069b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 08:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767629563; x=1768234363; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vgVyJzNXMpB1SreYlCVQP+upMwomcjp+afmj3FAH7sw=;
        b=SPlZ/Nr4jGnfSxwaZRSy0zlUmQoOd3P8fOQLQxbZo0GFLSNEqefshY9nJPZCWCf9BO
         PVMLywj4mzemFh2Yx6vwnrdU1H8rj3Y2Cm2D19j1AbLq6bl0i37aj/55tnD4GXuM/2Lp
         6lyTbpyYJQFj8dGMZfSKrj/EZxcvlqmVtX+5HFhc/NldrJMpr7TDl7qFAzyREADvt1yX
         Bg98rwwQjx/Funw0XQYcv7ftnZQmD7ImNZjMZmZPZdNXhY2pzoHGcTa8ciqdusV1wyuE
         4u7CCdwBg+5BJy5qoW/SL6PtVDf0QKs5pKyN3i5v3Ie4xkGzRzaPesurcEQEmnKWqoRq
         h+Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767629563; x=1768234363;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vgVyJzNXMpB1SreYlCVQP+upMwomcjp+afmj3FAH7sw=;
        b=sYiZH8w1CPV8wigG6BLjPx0GVWJH95w+RgjtaLd4CW3aI7kNRq2eIYjub67jREvi6y
         4FZh0bZrdXn0tKvVfdHOdtvo24vw2hJzVzRNrJfQdZArf/Rao/a4BVn0e+P+jWyEowNC
         ibQI1tp855gNRvHBKP6JCfldplIqoiOtmBKr+0N1efVLv8feVSH4pwtYx9t8+Z9b92Zk
         SI1AETDjTs7y/EgbhkLNu/PA2iPSMihaSnuTSdppk2hzBhjYzeY50uxhWobNVIzCqh+O
         /u0lYVGe0Sld9RcaS4iqCpsfjQUIvOBzxuqQGFPwQZk1Ez/+IVESOs4SioheHzhYq9Ky
         Bi1w==
X-Forwarded-Encrypted: i=1; AJvYcCUZnLbNnka4h+UmmTicgWbsnlyYv389P8zKSdLYcG2kFXqUx1djqApDj82uQkcFiSf2WMonjDGDorz68Egi@vger.kernel.org
X-Gm-Message-State: AOJu0YzqRlJsh9BGRvoQM8XqC8gGHUJSb0Gobkz5ylrsCnjsBksZQ8gI
	uc+A/2KfRMh5U9L4rtZwJDUNlIAX1yThm7CMKuGk8O7O/7oHyPd27/cukC3TxX7AsxnTkSllWlQ
	Z0tBNsOCOzyQRIOSAVx7I3XOg3G3i5hfXFucvWkQn4ODLAQF3eEXGB0P73i5xOhWs3G1R
X-Gm-Gg: AY/fxX6Ic2ovJYZTr49jS/STPntvuUIi40obiBu+C+/vjpQ1K0g8OHSRCunB1acbOE9
	2YEi3Sf31EVqM/VBIyPCle0sYziC8aIDiQurPfsfO/yhQs2UIi22QmrZ3/b3K0bYltJwDFiZ/CE
	2cghe6N2HVJLJNBLu4nwLMfBUWzWyur+qUgJZvA+Kw5Wgm3kAyCHIZ/5r5QY2gJQP4vIXaV3tYA
	mTaT28EHdXaamOGmAzPYorK6C6Tbq5OZ9V+t5DFxFM/fcVZqYW/jN6QTo9qXW9O5/1HqybP5pbW
	YHjK6oWu8aAYDiGSt3i/grUcQSM+oIqGtJlaUOvhK1zUdofg4tdIX039UE5LmZEmyVAA2CE2N9b
	/++m04+6If+LiSjF/UgW+xLY80Gw5B0rgMlJ5FgI7
X-Received: by 2002:a05:6a00:1c97:b0:7e8:4587:e8d3 with SMTP id d2e1a72fcca58-818878abdb3mr143547b3a.70.1767629563110;
        Mon, 05 Jan 2026 08:12:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGRjwDvoF08ImTrFOuu5dBZHLArSCa5rNn+RBUwZaD/Jh+OU5669NrgO+VjRyBY9+a8VvBylQ==
X-Received: by 2002:a05:6a00:1c97:b0:7e8:4587:e8d3 with SMTP id d2e1a72fcca58-818878abdb3mr143439b3a.70.1767629561102;
        Mon, 05 Jan 2026 08:12:41 -0800 (PST)
Received: from [192.168.1.9] ([49.204.109.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-818770efea8sm230201b3a.10.2026.01.05.08.12.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 08:12:40 -0800 (PST)
Message-ID: <d97cef3d-b6c0-42fc-952c-1b9eff8b730c@oss.qualcomm.com>
Date: Mon, 5 Jan 2026 21:42:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] serial: qcom-geni: Enable PM runtime for serial
 driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-serial@vger.kernel.org, alexey.klimov@linaro.org,
        krzk@kernel.org, bryan.odonoghue@linaro.org,
        jorge.ramirez@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, psodagud@quicinc.com,
        djaggi@quicinc.com, quic_msavaliy@quicinc.com,
        quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
        quic_shazhuss@quicinc.com, quic_cchiluve@quicinc.com
References: <20251110101043.2108414-1-praveen.talari@oss.qualcomm.com>
 <20251110101043.2108414-4-praveen.talari@oss.qualcomm.com>
 <2zeqt3tu36qcxs6xrzqqmn3ssmyzetl6tq6lxrjdvt5dhxrtv4@g5q4zhk4sebs>
 <8c734f2d-59db-4815-bfc6-3823cf3ef37a@oss.qualcomm.com>
 <25f3e3c0-7796-4318-b479-a680b878528a@oss.qualcomm.com>
 <793dafa1-43bb-49c4-9e05-cfb597ba39c6@oss.qualcomm.com>
 <8a51bb87-ce81-4adc-92b3-9a077f124ff8@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <8a51bb87-ce81-4adc-92b3-9a077f124ff8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=M89A6iws c=1 sm=1 tr=0 ts=695be2fb cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=JcPDDAWpA9Ur2UU+zoP9YA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=q7x9qeZvavHb9BQ_h_cA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDE0MiBTYWx0ZWRfX2r9OXARSSwP9
 relgAJJuRWOcl8Y4/XGW2VC6ghZaH97IMmrGrYfnnDsQy2ORO+Wwvl2nGdFc3x/9NhCJ7YldyFe
 VJZ6ma/oR+IfTChIO+BB9cAqgsOtt5ApN5KRYnl51HEDN0a74UKwN6CWWOW2uRDS/hTAeoRHDYe
 7i9Xhxcc9vlPxYPU/XAw9IiGDOIu5kfiDMxKtoGXS5zbSrpbPQmO1vfIKKgCT7a7AUf/7Aa6Ftb
 WOFqKs59YwdhWNJ1MEagoPSZ/7JEhKdMcurQ0rb94AvYssrFF6NxABb8g//q9RiL4YxMFp84i/r
 hm374kkw9aS19v8AXv+n9n5uDPit+BkImpDpPhxg0BuKfgU+jZQ9G428i038WssTjzWDzwtvyQP
 dwsNntkE2aaV3NQMGHCoA15iAOMsAKkhhZyjymMehB0fQA7fRcwJAVGYP9KMQzEeAFafXGH3aI+
 Vs9W9pZXBwQMs7g/kPg==
X-Proofpoint-ORIG-GUID: IUkJlNkR1-9R5KeFEsoA_vyKk_jFDA4R
X-Proofpoint-GUID: IUkJlNkR1-9R5KeFEsoA_vyKk_jFDA4R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050142

Hi Dmitry,

On 12/31/2025 11:21 AM, Dmitry Baryshkov wrote:
> On 31/12/2025 07:49, Praveen Talari wrote:
>> Hi Dmitry,
>>
>> On 12/31/2025 8:30 AM, Dmitry Baryshkov wrote:
>>> On 31/12/2025 05:00, Praveen Talari wrote:
>>>> Hi Dmitry,
>>>>
>>>> On 12/30/2025 11:53 PM, Dmitry Baryshkov wrote:
>>>>> On Mon, Nov 10, 2025 at 03:40:42PM +0530, Praveen Talari wrote:
>>>>>> The GENI serial driver currently handles power resource management
>>>>>> through calls to the statically defined geni_serial_resources_on() 
>>>>>> and
>>>>>> geni_serial_resources_off() functions. This approach reduces 
>>>>>> modularity
>>>>>> and limits support for platforms with diverse power management
>>>>>> mechanisms, including resource managed by firmware.
>>>>>>
>>>>>> Improve modularity and enable better integration with platform- 
>>>>>> specific
>>>>>> power management, introduce support for runtime PM. Use
>>>>>> pm_runtime_resume_and_get() and pm_runtime_put_sync() within the
>>>>>> qcom_geni_serial_pm() callback to control resource power state
>>>>>> transitions based on UART power state changes.
>>>>>>
>>>>>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>>>>>> ---
>>>>>>   drivers/tty/serial/qcom_geni_serial.c | 24 ++++++++++++++++++++++--
>>>>>>   1 file changed, 22 insertions(+), 2 deletions(-)
>>>>>>
>>>>>
>>>>> This breaks BT support on the Qualcomm RB2 platform. With this patch
>>>>> applied, I'm getting the following:
>>>>>
>>>>> root@qcom-armv8a:~# dmesg | grep tty\\\|hci0
>>>>> [    0.000000] Kernel command line:  ignore_loglevel 
>>>>> console=ttyMSM0,115200n8 earlycon root=PARTLABEL=rootfs rootwait 
>>>>> systemd.mask=pd-mapper.service -- 
>>>>> androidboot.bootdevice=4744000.sdhci androidboot.serialno=2b89b520 
>>>>> androidboot.baseband=apq 
>>>>> msm_drm.dsi_display0=qcom,mdss_dsi_ext_bridge_1080p:
>>>>> [    4.074354] 4a8c000.serial: ttyHS1 at MMIO 0x4a8c000 (irq = 140, 
>>>>> base_baud = 0) is a MSM
>>>>> [    4.099410] serial serial0: tty port ttyHS1 registered
>>>>> [    4.131200] Bluetooth: hci0: setting up wcn399x
>>>>> [    4.149847] 4a90000.serial: ttyMSM0 at MMIO 0x4a90000 (irq = 
>>>>> 142, base_baud = 0) is a MSM
>>>>> [    4.229099] printk: legacy console [ttyMSM0] enabled
>>>>> [    6.499519] Bluetooth: hci0: command 0xfc00 tx timeout
>>>>> [    6.514347] Bluetooth: hci0: Reading QCA version information 
>>>>> failed (-110)
>>>>> [    6.559933] Bluetooth: hci0: Retry BT power ON:0
>>>>> [    8.016330] systemd[1]: Created slice Slice /system/getty.
>>>>> [    8.066194] systemd[1]: Created slice Slice /system/serial-getty.
>>>>> [    8.148389] systemd[1]: Expecting device /dev/ttyMSM0...
>>>>> [    8.956804] Bluetooth: hci0: command 0xfc00 tx timeout
>>>>> [    8.962447] Bluetooth: hci0: Reading QCA version information 
>>>>> failed (-110)
>>>>> [    8.976917] Bluetooth: hci0: Retry BT power ON:1
>>>>> [   11.296715] Bluetooth: hci0: command 0xfc00 tx timeout
>>>>> [   11.302340] Bluetooth: hci0: Reading QCA version information 
>>>>> failed (-110)
>>>>> [   11.309534] Bluetooth: hci0: Retry BT power ON:2
>>>>> [   13.660078] Bluetooth: hci0: command 0xfc00 tx timeout
>>>>> [   13.665814] Bluetooth: hci0: Reading QCA version information 
>>>>> failed (-110)
>>>>
>>>> Sure, will check and update.
>>>>
>>>> If possible, can you share what is DT filename for RB2.
>>>
>>> qrb4210-rb2.dts
>>
>> Can you please try below change on target since i didn't get target yet?
> 
> Yes, I have this patch too. It didn't help.

As we discussed offline, On the RB2 target, Bluetooth fails during 
bootup but functions correctly once bootup is complete.

I suspect that GPIO configurations are being affected during the bootup 
process, possibly due to the wakeup registration sequence.

To address this, I have moved the wakeup registration process to occur 
before enabling PM runtime.

Could you please try below change and let me know result?

diff --git a/drivers/tty/serial/qcom_geni_serial.c 
b/drivers/tty/serial/qcom_geni_serial.c
index 6ce6528f5c10..46a9c71630d5 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1888,12 +1888,6 @@ static int qcom_geni_serial_probe(struct 
platform_device *pdev)
         if (ret)
                 goto error;

-       devm_pm_runtime_enable(port->se.dev);
-
-       ret = uart_add_one_port(drv, uport);
-       if (ret)
-               goto error;
-
         if (port->wakeup_irq > 0) {
                 device_init_wakeup(&pdev->dev, true);
                 ret = dev_pm_set_dedicated_wake_irq(&pdev->dev,
@@ -1906,6 +1900,12 @@ static int qcom_geni_serial_probe(struct 
platform_device *pdev)
                 }
         }

+       devm_pm_runtime_enable(port->se.dev);
+
+       ret = uart_add_one_port(drv, uport);
+       if (ret)
+               goto error;
+
         return 0;

Thanks,
Praveen Talari
> 
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/ 
>> boot/ dts/qcom/qrb4210-rb2.dts
>> index 0cd36c54632f..5f8613150bdd 100644
>> --- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
>> +++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
>> @@ -694,7 +694,7 @@ sdc2_card_det_n: sd-card-det-n-state {
>>
>>   &uart3 {
>>          interrupts-extended = <&intc GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
>> -                             <&tlmm 11 IRQ_TYPE_LEVEL_HIGH>;
>> +                             <&tlmm 11 IRQ_TYPE_EDGE_FALLING>;
>>          pinctrl-0 = <&uart3_default>;
>>          pinctrl-1 = <&uart3_sleep>;
>>          pinctrl-names = "default", "sleep";
>>
>> Thanks,
>> Praveen Talari
>>
>>>
>>>>
>>>> Earlier I had validated on RB1 and Kodiak.
>>>>
>>>> Thanks,
>>>> Praveen
>>>>
>>>>>
>>>>> After reverting the next and this patches, BT is back to normal:
>>>>>
>>>>> [    4.067201] 4a8c000.serial: ttyHS1 at MMIO 0x4a8c000 (irq = 140, 
>>>>> base_baud = 0) is a MSM
>>>>> [    4.082426] serial serial0: tty port ttyHS1 registered
>>>>> [    4.106122] 4a90000.serial: ttyMSM0 at MMIO 0x4a90000 (irq = 
>>>>> 142, base_baud = 0) is a MSM
>>>>> [    4.108647] Bluetooth: hci0: setting up wcn399x
>>>>> [    4.125371] printk: legacy console [ttyMSM0] enabled
>>>>> [    4.445205] Bluetooth: hci0: QCA Product ID   :0x0000000a
>>>>> [    4.450927] Bluetooth: hci0: QCA SOC Version  :0x40020150
>>>>> [    4.456470] Bluetooth: hci0: QCA ROM Version  :0x00000201
>>>>> [    4.462006] Bluetooth: hci0: QCA Patch Version:0x00000001
>>>>> [    4.509408] Bluetooth: hci0: QCA controller version 0x01500201
>>>>> [    4.515656] Bluetooth: hci0: QCA Downloading qca/apbtfw11.tlv
>>>>> [    5.488739] Bluetooth: hci0: QCA Downloading qca/apnv11.bin
>>>>> [    5.671740] Bluetooth: hci0: QCA setup on UART is completed
>>>>> [    7.993368] systemd[1]: Created slice Slice /system/getty.
>>>>> [    8.045612] systemd[1]: Created slice Slice /system/serial-getty.
>>>>> [    8.125418] systemd[1]: Expecting device /dev/ttyMSM0...
>>>>>
>>>>>
>>>
>>>
>>
> 
> 


