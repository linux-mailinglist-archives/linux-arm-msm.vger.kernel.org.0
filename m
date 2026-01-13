Return-Path: <linux-arm-msm+bounces-88645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F38FD16325
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 02:45:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC359300C296
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 01:45:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60F3727B343;
	Tue, 13 Jan 2026 01:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S+5ekt8k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HTsnQSnd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5C627CCF2
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 01:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768268743; cv=none; b=C56NAdqeEIkeW5H5PmcVU4GSwF7C2s8+EQ8YEU70qfR6R11aermf3NOKiBGxwGNaWA8O+9lmFf2Uf2W2FRT0HvSPX9vl1FU88gN3DZGOfBwTbXXR4f5wZx6o8VxJjIZWFBEN3XMJ3KmJI3HZ9ColFhX2ptjjWnkc9Dfw/7r9phI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768268743; c=relaxed/simple;
	bh=kVeTz8Sl0W4AjAX8RVK7TkU/eabgHDW/kbQpYjGkaNU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VYOA0EMr1uCoRRexhui5WcwGkMR89Mp8vYX7Oekfx7wIWbj8bPopy7bMMQhTp/UIp0WkqTbmzh6PWNxzq8UhPIbWZP4K2gJaEXWsKbjbTRpKrJzfy2j1Z0frAH5Hceql/mAVJKg51H1wpJ7+qyyM4sVJUdiKBd5+t5QrdLOEwc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S+5ekt8k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HTsnQSnd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60CN4vuG2063332
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 01:45:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vTIpMgb45qSpDf1Gi2sLOFHdwY+8l+ER69CS2kBAets=; b=S+5ekt8k/sg1VgFT
	egs48WQYnJvOrO/VguSrORKo2sSJluNbh5nSgjK6TqItRAep65zPt9w887jeIOsv
	OvdGib9ZmhW7m79TXE65RfIgzyau4188hTYphPm/HfUx0H7lE3G8fAR+gqY4knQc
	SgFxudIAuX7A/P6c/OwBIAuBNy6oyj/FV8NXwu0/EOuH2cEolg96pG0AepfI2+2J
	p7GWfO0GUS2rn+YPKxtfyD0fcLVSj1+72twHPDjG28OFj0RKSQEbsynDGOkZP6kz
	gLwnmXaBryN1YQKxkUY2rdBvaofQRiHu8svhz+O/hVnswHsn0FhHaxOIRU41CAvn
	RLNpBQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmxdvtqh6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 01:45:40 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29f13989cd3so164740375ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 17:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768268740; x=1768873540; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vTIpMgb45qSpDf1Gi2sLOFHdwY+8l+ER69CS2kBAets=;
        b=HTsnQSnd6J6VEOFOryGX401v/okpif5FHAJ5s0G11sQNBoC4inKJ3fWRZdMk8ADzbc
         L46cspvtKPLyte0iNhS/LeagfuqOuGu27PtfwpTd4j7oSi+yW4KS4pXBIJF73F4ettb0
         JIc8/c63VoLs5iMzFtAiRJdyb6jEGN2yz7cmp7t8854W1sqihlZwCOeZDpKRse0MBHxz
         DG12ZZnu9RcuyBLpFiyXcX96LaWxSY0B1BgYgMImo+NL5RIPjyLWzFYGgB9NFMPeeSjW
         ib+k9j0YVLt42geHkGhTXn/hd/E7wa8rIaBLh8Iv93EpQK1msg4krDUGTZCE0NFCIPcf
         +hew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768268740; x=1768873540;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vTIpMgb45qSpDf1Gi2sLOFHdwY+8l+ER69CS2kBAets=;
        b=PVid+/FB3kWLpX39oUQTMu+Kx313gXSFeKNC8MqYQbsFlp8Q7Ovm108wqYyEXkfsyv
         uuymT6u0cJQ4fq81nXn6A+I8Z7NLxgX3uayKiTQUuyRcnqZthQxmSnpfyTGe1+a4hTpt
         EKexvl7ylwC9esCfKP0nJsmXw5PewzcJB4k7BZUSkla7b0HhpotwgBw8jEEf66WufNU6
         AR4bOujW4+g7oDD0hHh6ZrfL/MP7zFvoYwpyu8vQYgtkvjix5pzxpVgbT/lkoiOA4289
         Nk8N2yxxEKK7i13ZOos9W43nmA6e3tyo2SoQKpaNHSQW24tZDofZI1DCk/vOyVP9CFsN
         ka1w==
X-Forwarded-Encrypted: i=1; AJvYcCV5Hl7+V9rC6KSdsZPoneMngNazafrDvdrUQiJFYSODDG6ZjSJj1niDtN8v2vW8HZl58WMCsdlg3XywV5X5@vger.kernel.org
X-Gm-Message-State: AOJu0YxT6q8OsJdX7e+9Lsvkmzxx548wpRdNU6ujozvBC2GK9jLJl1d6
	XUgfwW+N7qXZjPaRs2OcIAPqaQ7dUh63J5kDL9cM7AuhTS3LvSncORmvt3ARoQimUs4rEUXAHSp
	i+0NTGtcWpQAupQHyDOh9BLBaGWARvAHlVdIHqTN6QQXW0f9RsZIexZUVYvJdOkaxDWFE
X-Gm-Gg: AY/fxX6q8F50ThMtQhfVi2UHuff7u34kXILhfbDFRLXgk6xlKIIY0OWPDyos9j+97Fi
	bidw5HDxr+/OOyyNxt1rRKP/EgXqj0jp84Q/VfaUPxYBuUzsvstvSmQaTfdFtUSTBmRnptP+UdB
	aSTEVdAS/YFXpGKVJLhYgTtjdOlI6k7uqXsQmAdVyduJQYm/1HbPaP7cWMXOOYyD88AllKPZIA4
	0AESMv6WKsnXxu7GYggbXlyq0diFVCuhTcuJahAp3+wEECPG7suKUiZ37F8fB6I+B9PtMNsiAKH
	F7kCTzyHB1XQ2MQO9Nw752UHvu3y8zEDPjPLfqotY2qqQY/cPYWNiLq1R/bnY5uVl8Skxo8zEJx
	MVXPXBuvlgECP498mcaZhowQsjBX+P1qlgwoLIkVRpdi4wvZ9xOq+ZwEaSjje8PDJu7Lky9N9zI
	P3uug=
X-Received: by 2002:a17:903:38c8:b0:269:b6c8:4a4b with SMTP id d9443c01a7336-2a3ee41358cmr196565135ad.6.1768268739789;
        Mon, 12 Jan 2026 17:45:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHhjEMp9f33ML0ap3l+FgrBuL0am99vvMV9Ry28KBR3ZDae70V9VINMLH1eEUbhJSfCsdH0mA==
X-Received: by 2002:a17:903:38c8:b0:269:b6c8:4a4b with SMTP id d9443c01a7336-2a3ee41358cmr196564965ad.6.1768268739286;
        Mon, 12 Jan 2026 17:45:39 -0800 (PST)
Received: from [10.133.33.127] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc8920sm184010105ad.85.2026.01.12.17.45.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 17:45:38 -0800 (PST)
Message-ID: <8132340f-6ca3-402a-b07f-6142305c00d3@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 09:45:33 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: Add base PURWA-IOT-EVK board
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        krzysztof.kozlowski@oss.qualcomm.com
References: <20260109-purwa-v2-0-f39ee10684cb@oss.qualcomm.com>
 <20260109080000.606603-4-yijie.yang@oss.qualcomm.com>
 <6e8e6583-033f-439e-bd92-b24fe432fb96@oss.qualcomm.com>
 <3959a318-aca3-43e2-a431-4a9ae40f911f@oss.qualcomm.com>
 <ak6xsow3cobhe64y2koa4v7w5dkdc4v3zlmpokws4nxmu5c6rt@kdgm2oqxxvcl>
 <d5d1d6c0-87ab-42a8-9816-359a64b9112e@oss.qualcomm.com>
 <CAO9ioeUTPopTg+S-6uASXa=L4DQaVVEJ_CYRGzKbJR3MkcZMFQ@mail.gmail.com>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <CAO9ioeUTPopTg+S-6uASXa=L4DQaVVEJ_CYRGzKbJR3MkcZMFQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: zow9VnES007Z3iDUyn6UhORSue-IylB0
X-Proofpoint-GUID: zow9VnES007Z3iDUyn6UhORSue-IylB0
X-Authority-Analysis: v=2.4 cv=HoZ72kTS c=1 sm=1 tr=0 ts=6965a3c4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=JCu9_ZYDNiP3dRRzww0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDAxMyBTYWx0ZWRfXwmrDJFsf9m37
 pHR0ley9wd7VHH0c+KquIf3pnYTdnL+RUIfedlD4ti0E5uofNV5qbkcHknHFQunkJ8ay5u62Kgy
 uki93ykjRTpejHHAFHie6Jnfyy74JsMgMxz9dD2kiI8gSHng/M06ZxerqCd65vssroY9Z1lNDrz
 g1Yi7dQu395CJ/hzNRNklbUQ9Pv979i7QNOY26BgX3/An5BpesH2mqeeO1HshvXV/QFFEnn1xGY
 azWqvgOK0RnHizgXDqoSh+KfNN3QR0laZl1ZKdbOddMB1L785XVrZjrZsZzgMrxogVA5ozx/0UK
 xKnNTpeCKBJ9qirSUSetgZt3NdikeN4piuyNbfWVkRUVqTLuLVbkLlYPGA4X8Rna9C+5i0RuQvL
 XMqteIsKS+aUXoUoDenGaJpgxBXCmKaJzyzfS1fKY+eoX05/ADmAicD1Qh5kp8oCpObg49jdhA7
 H7lgq4xilL+aYEUeUow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_07,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130013



On 1/12/2026 2:01 PM, Dmitry Baryshkov wrote:
> On Mon, 12 Jan 2026 at 07:51, Yijie Yang <yijie.yang@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 1/12/2026 1:00 PM, Dmitry Baryshkov wrote:
>>> On Mon, Jan 12, 2026 at 11:12:09AM +0800, Yijie Yang wrote:
>>>>
>>>>
>>>> On 1/9/2026 7:29 PM, Konrad Dybcio wrote:
>>>>> On 1/9/26 8:59 AM, YijieYang wrote:
>>>>>> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
>>>>>>
>>>>>> The PURWA-IOT-EVK is an evaluation platform for IoT products, composed of
>>>>>> the Purwa IoT SoM and a carrier board. Together, they form a complete
>>>>>> embedded system capable of booting to UART.
>>>>>
>>>>> [...]
>>>>>
>>>>>> -  backlight: backlight {
>>>>>> -          compatible = "pwm-backlight";
>>>>>> -          pwms = <&pmk8550_pwm 0 5000000>;
>>>>>> -          enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
>>>>>> -          power-supply = <&vreg_edp_bl>;
>>>>>> -
>>>>>> -          pinctrl-0 = <&edp_bl_en>, <&edp_bl_pwm>;
>>>>>> -          pinctrl-names = "default";
>>>>>> -  };
>>>>>
>>>>> Is the backlight infra different on the Purwa IoT EVK?
>>>>
>>>> As you can see, this Purwa file was copied from the latest
>>>> hamoa-iot-evk.dts. However, not all nodes have been verified on Purwa.
>>>> Therefore, I need to retain only the functions that work correctly and keep
>>>> them aligned with the nodes from my initial version. The deleted nodes will
>>>> be updated later by the respective authors from different technical areas.
>>>
>>> Please, only delete nodes which are not present on the Purwa IoT EVK.
>>
>> This isn’t a deletion—it’s just not ready yet. Why do we need to include
>> all the nodes like a mature Hamoa platform in the initial push?
> 
> Purwa seems to be mature enough. What exactly can't be enabled at this moment?
> 

There were some errors during boot when those nodes were added in my 
previous test. Anyway, I’ll fix the issues and add them all.

-- 
Best Regards,
Yijie


