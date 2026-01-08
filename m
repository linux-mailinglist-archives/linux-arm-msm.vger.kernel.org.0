Return-Path: <linux-arm-msm+bounces-87974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DD5D00E82
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 04:44:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 85091301D955
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 03:44:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E8F2286400;
	Thu,  8 Jan 2026 03:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eFrrlk27";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QaLAnRiu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E74277CBF
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 03:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767843863; cv=none; b=GqtABFQg0aaJ4GJRTOKselsLHrzIbAt0GsY0r+sGslZb9s7yhzn8zaFbz64FW0sdZvWux6xfLSpso2zyaijSMNSIjC/WWybhlxNP/g0X10RJ9ZCOecxx7ne4lhdJtIvzLx/iqr2lP8BrvNZKJ5cYNi0nOOe9MkMonW605Diko2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767843863; c=relaxed/simple;
	bh=nPz9YN3ZKg4qM0hoRcl0MSCzDHeS49HS02aeYIFURgI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ct/tyqc++wi+kVVewqbC9w2S/KHz071HBqAhtPEFhPu1Sb7ILLy2Rp5SdyVeR/ssA4KK8epboVNqMcVnO3nCMDAfs8E5U1+XoxWyY5GWaHQmLZFqdDLz2q5OpDexq5SWK/DWH/ttacRALQgGfO9jTxhQA0/ZxmZjZ6BVmLbNdB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eFrrlk27; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QaLAnRiu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607No2O4472972
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Jan 2026 03:44:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AyhaKcRTZ87kyRrMP8Gl5ERKBywP1044Z0AKTZfSCRg=; b=eFrrlk27G5Lj0WR8
	Kg9yf8cewzCEQEDR2WiOvhGpUlb7X98qrm8pkJP8XbokcBumbi3euH3QkrNpxW3k
	kl1COLAot5zSWf1T7iZKMV1Z99OQY8vdX7LD+bMcK6XZZXfGQZN1rmhh840tiy3Y
	A2vkEkWIvubowBmtAfH85sPZHqcx7yXXHrkBTeRQifDSh+RWNIVjWbJ9jcxc7Nni
	2NcB5bHjBta8SHr2yepb8wMWYuCnu4UmDFT/2UoXf1cAeWdY3UwnuD44Rzl7kJg8
	vlIDuAoYuv0Jx4PxfF2tvb+eg9UHDdG1JQYD2FpGox7iZqpVQ/1abBKxP/R9bG3m
	rzAOEA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhuy71k3c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 03:44:19 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29f25e494c2so17935875ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 19:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767843858; x=1768448658; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AyhaKcRTZ87kyRrMP8Gl5ERKBywP1044Z0AKTZfSCRg=;
        b=QaLAnRiuihFYjHrs8LMMY5UPkDY7VSbAbJa9W2ZSOzenzt3KkxGtevcYBd/htcxDzM
         ST7w7iVrMK/waIE4BGC7zm2RBFad+POvDlTxCvEiwiMHGWuv205MZv61mcLnFduwFxYg
         ufBBuvJlLs1mpu7MCsTpLsTaojn2WOWzA8goWo8/nuvA6wvwWx3SCYwSZLdQU9MBq/SV
         Ep+kt/J9mFwhPb7RA9aPaYZpENjpu4UwpefDRydyHkN+MyfuUy2p7u/KUlSHWmJYDCJ2
         SnMihGFCmoPYiFxRbQd5UiIOGPiuyljlhbNieGrmW74fMyCqlnDMwHJ+deQxjXBeJRed
         CAAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767843858; x=1768448658;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AyhaKcRTZ87kyRrMP8Gl5ERKBywP1044Z0AKTZfSCRg=;
        b=ihoAFFjooYuJI+Ryt33AxMEOtXzBHUkkLXndYZNVh6UcUkfGuxCqgihpFi3otyhpsL
         NUW4mp5Fy31STHXdmwZImQLBJf+Tx9mrPRU2k5Mr3yj7wcs684bVasf6CcIYj+xZFbhb
         OGJwetzN752k0MisG7bzljjk8xVbSjMRD9pZQKwcyTyUxEgdsKZnIcW6Y6yBJ26uV4de
         dYkWN4otiXcra4hxuWquox29YPftFxCv8/xsossih9TwCjMCtxDlIFjVLunmwyAfDmVM
         RXhRPcX1p16rdHU+hfv3vEnwWnX2SFh1cGjeZcrbs3ZdzJA+/ZYazcvMcATKUhA1LRV8
         N0gQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbBc4ulibkGh0KIxCuD46GerL0kBY/siqQ1cr52v81yQKNCOSvH+RXMIcIRH9q0gXcVFyfMNw74Hry8wFJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5QaVHgLT5Y65q5NapvR4gb3hQgs6zx2d6y671vzYCLCDC+JbV
	xpP3Yauo0L+HiEVcvNtFXAq9vDvkIpZl+LIa3ixCOhHmO9QMvMt7/y3oh8FCPgJV5xMeTM569Kt
	32oR/73ewxaSkjpR84WXZHIoJ60slNNVWM6jlf6UrjekVogfVhuC3ZUFrtWZXkmg+HB56pCarTg
	EV
X-Gm-Gg: AY/fxX5tBU3cbgjGNCQIuBd6njbZmaRXWVOHajtJfNxFUsuiKTMj3TgB8SK0gyC32z9
	oqVf6MQ6LUTR06Y++WAzjNgt7K+FTDHEtUfDTb0Xp6NbVmTjauh2NI0r8W56NQsV6xUM5ryLp/8
	OXapCKQ8BYOgNSKrgPcrg/nJ88F+/wXp+GBHS5vgZk+SR/kUzUTiFQqLIcF5B7UfiSbM5BLuYki
	K1Q6VSBhQJcQTO0KvJu7kR0chXkGkoe/lpVYNtHNKEi7u7pY8cAiefVo6eKjRWzea1J93nSo7U9
	wYImjHYMxO1+3cUce7gRLJXkCDhybLu5QmPJNVt5oDlYsmFs915Ib++AebD88S0cqtoL5tScAGd
	VXYTkm2XybfPucIAz8Zi3iqsEETe099O0bgC7tjPY
X-Received: by 2002:a17:902:d511:b0:295:50f5:c0e3 with SMTP id d9443c01a7336-2a3edb775b6mr47955755ad.14.1767843858265;
        Wed, 07 Jan 2026 19:44:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGe3IIUIinIDemcmtGGMAaQzqMVMErby+gw7b+7OcqE8dh7iXGPMzpeDAbLXk0JgeahN5MNVw==
X-Received: by 2002:a17:902:d511:b0:295:50f5:c0e3 with SMTP id d9443c01a7336-2a3edb775b6mr47955455ad.14.1767843857578;
        Wed, 07 Jan 2026 19:44:17 -0800 (PST)
Received: from [192.168.1.2] ([49.204.107.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c3a51dsm63750155ad.18.2026.01.07.19.44.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 19:44:17 -0800 (PST)
Message-ID: <1260b788-3156-4116-8683-7e2c46bdafcd@oss.qualcomm.com>
Date: Thu, 8 Jan 2026 09:14:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] serial: qcom_geni: Fix BT failure regression on RB2
 platform
To: Mayank Rana <mayank.rana@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        bryan.odonoghue@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        andersson@kernel.org
Cc: psodagud@quicinc.com, djaggi@quicinc.com, quic_msavaliy@quicinc.com,
        quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
        quic_shazhuss@quicinc.com, quic_cchiluve@quicinc.com
References: <20260107162610.1582626-1-praveen.talari@oss.qualcomm.com>
 <0d214cab-1844-4d0c-870e-13421f4b7ca6@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <0d214cab-1844-4d0c-870e-13421f4b7ca6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: l2jTyGYwjLaMRN0R47g0qZIvCEP_2uWo
X-Proofpoint-GUID: l2jTyGYwjLaMRN0R47g0qZIvCEP_2uWo
X-Authority-Analysis: v=2.4 cv=DZEaa/tW c=1 sm=1 tr=0 ts=695f2813 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=+gEgXnvjvgnLECGlQBulyQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=XTfrK5f9tDC1lpa1uY8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDAyMyBTYWx0ZWRfX9+nawulBurfk
 6ZPd0Oh2p2kCWGRjxRqcQha0GMeE/GRAEKrjAfpfGVRUQEjgDrGJyYt+hKvgpmhrG7geft1d0Wy
 c3XvbZjT96nptbIerS/AzZVvn10spMJ67ZviFDLkT8THfr8QMQWCHOU3yrzOSo+MnJwfWTSVYRP
 mZTx0+j1fsKvL95zSt99hHrxlUx/BuF9UeviIQcfQHkyPwplcn0LxUGubUje9XtTJ1XyvhzuDXE
 wYDQOnr+1t3vG/AbDFTitC8hn0yh/XKx65iJ8i+QUw4s8E6FZOB+T4C4DCYc4j3Sd9Mc/TLg1o1
 SGCtyUUVpR+aI3ebSzQj8O1734xH93hOo3yzTzgM8vf8iTjIgPtAKkQ/yMynLnPTv96gykftG0v
 c2DrbsP/KSEiWw8SIx02iCn7t7lrHDpRvLLXK8VtO4doVtcS1YTyiTIjX26H9taE1wmvwdv5iif
 mA56v+jL6BOeQRZszGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_05,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080023

Hi Mayank,

Thank you for the review.

On 1/8/2026 3:09 AM, Mayank Rana wrote:
> 
> 
> On 1/7/2026 8:26 AM, Praveen Talari wrote:
>> Commit 10904d725f6e ("serial: qcom-geni: Enable PM runtime for serial
>> driver") caused BT init to fail during bootup on the RB2 platform,
>> preventing proper BT initialization. However, BT works correctly after
>> bootup completes.
>>
>> The issue occurs when runtime PM is enabled and uart_add_one_port() is
>> called before wakeup IRQ setup. The uart_add_one_port() call activates
>> the device through runtime PM, which configures GPIOs to the "qup_x"
>> pinmux function during runtime resume. When wakeup IRQ registration
>> happens afterward using dev_pm_set_dedicated_wake_irq(), these GPIOs
>> are reset back to the "gpio" pinmux function, which impacts the RX GPIO
>> and leads to Bluetooth failures.
>>
>> Fix this by ensuring wakeup IRQ setup is completed before calling
>> uart_add_one_port() to prevent the pinmux function conflict.
>>
>> Tested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Closes: https://lore.kernel.org/all/20251110101043.2108414-4- 
>> praveen.talari@oss.qualcomm.com/
>> Fixes: 10904d725f6e ("serial: qcom-geni: Enable PM runtime for serial 
>> driver")
>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>> ---
>> v1 -> v2
>> - Updated commit text.
>> - Added Tested-by in commit text
>> ---
>>   drivers/tty/serial/qcom_geni_serial.c | 12 ++++++------
>>   1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/ 
>> serial/qcom_geni_serial.c
>> index 6ce6528f5c10..46a9c71630d5 100644
>> --- a/drivers/tty/serial/qcom_geni_serial.c
>> +++ b/drivers/tty/serial/qcom_geni_serial.c
>> @@ -1888,12 +1888,6 @@ static int qcom_geni_serial_probe(struct 
>> platform_device *pdev)
>>       if (ret)
>>           goto error;
>> -    devm_pm_runtime_enable(port->se.dev);
>> -
>> -    ret = uart_add_one_port(drv, uport);
>> -    if (ret)
>> -        goto error;
>> -
>>       if (port->wakeup_irq > 0) {
>>           device_init_wakeup(&pdev->dev, true);
>>           ret = dev_pm_set_dedicated_wake_irq(&pdev->dev,
> 
> do you need to handle error handling part here as calling 
> uart_remove_one_port() shall result into NULL access related crash while 
> accessing port->port_dev as port_dev is not allocated 
> (serial_base_port_add() add is not being called due to moving 
> uart_add_one_port() later)

Yes, you are correct. Will address it in next patch.

Thanks,
Praveen Talari

> 
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -1901,7 +1901,6 @@ static int qcom_geni_serial_probe(struct 
> platform_device *pdev)
>                  if (ret) {
>                          device_init_wakeup(&pdev->dev, false);
>                          ida_free(&port_ida, uport->line);
> -                       uart_remove_one_port(drv, uport);
>                          goto error;
>                  }
>          }
> 
>> @@ -1906,6 +1900,12 @@ static int qcom_geni_serial_probe(struct 
>> platform_device *pdev)
>>           }
>>       }
>> +    devm_pm_runtime_enable(port->se.dev);
>> +
>> +    ret = uart_add_one_port(drv, uport);
>> +    if (ret)
>> +        goto error;
>> +
>>       return 0;
>>   error:
>>
>> base-commit: 6cd6c12031130a349a098dbeb19d8c3070d2dfbe
> Regards,
> Mayank


