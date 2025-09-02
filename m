Return-Path: <linux-arm-msm+bounces-71543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B47DB3FBDE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 12:09:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C3C516BD22
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 10:09:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BA022EE272;
	Tue,  2 Sep 2025 10:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QW0YY59M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6252EDD53
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 10:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756807774; cv=none; b=VvYLhSuYXu44Sf4K5ArvzV6nRwn6J9R8tKocyQFTgx645XJAejPU1Oevf/Uqsyy+HJW6zOfvxSzn4VP8mh+TALa1FonmIN5Cj0vR0XVs407FzFfA3JCPyNjM4QBOAnJX1YBmy8xKFf6040xi2+MAqdrePHY16zm6xktkYwXYCEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756807774; c=relaxed/simple;
	bh=b+TPO5OmJGoIMPSdqhX4QRi4q/5WRHyAuGDpETkivbo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N9wEHw5EL7ThpzBNma7fimqq/yqDUwmkfJLkUJ7rcHpND81HhwaOnZ0Kx0O/xdbzCr3n2tTP0X+KW4v3kenoAKsPh9NtMx9rjxM+QsPQrbU183I0xw53huu2r1P22j6hzSBQonrRdBgb6b6TqpC6mFTriYwx0QWtC9506RTmCiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QW0YY59M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822RlPN015031
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 10:09:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	41pmmilN2PV7+r6cQZTS/Msx4vD68teokH8zgt8wVw4=; b=QW0YY59MVJbruiui
	3P9FMwfBtNsmtyt3wEpCdhMXSvS14RiBvg5HU8Ri1fqpHdV3hL1BKmokHZZLdwop
	VWhI0FNW4loJ5bILZe5WJAS+bqa3J8tpKwOSVbUXIAT3RXwkdF3GRDliQTL5B4di
	Xky3d7ZhA4XtRAqON/oPQ3UTd2mJantZJIpchYvBLKWaqsgA96lzGiRBukMBeobD
	UoDttxSN3QZ6WV/uluYfcU0G7yyBjakAPBhKTWMQMZATNToj5McA3PC2zlOP4DBr
	lhtiTKA7DaUg6YFLBdX6utpx+E48Sy30o4wMPhWIzdlpAYz0KpeNDQRuJfIgPbv2
	67/h0Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urvyydu6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 10:09:31 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b32eddd8a6so5409871cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 03:09:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756807770; x=1757412570;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=41pmmilN2PV7+r6cQZTS/Msx4vD68teokH8zgt8wVw4=;
        b=te2DWEJzmvN8hecEsJm+ZQ1A3iwP/EwgYHKvfWzAU6LWzx0OdRlg9w9UQQdLGUXRP9
         V9KrIlQn6/1LOnJ7BK0837uVhxhNEMPEIjMI5v7lI7EN5F8puA5SzGtaM1M/Knk2RXcb
         8L7dTOC8pbyFe4CkepbWLB4TihrZ0Ky0MgF8QqipOzO0u42l6NXP603T2qnzKOobwcTZ
         55ZpO4hHMLOxctSTqEBHJgq8RIE/S+QJ8cbW7WFgLvYNZXJgYibVfHjGbh5YURbuwtII
         tvP3c2kK1cInRP14LWRd8H2NhD2UOIe6jxEq9nR4Vurs1mjwtODohUG5t/b/TggCE+XJ
         03pg==
X-Forwarded-Encrypted: i=1; AJvYcCVUS9/l0/sXUmZiVGHRoMXOkBdqwhXdfnDRCfNe6Ch+ugYELp5C+ERjmQllv36i6mixHOpX1Q5DTIuzcCjC@vger.kernel.org
X-Gm-Message-State: AOJu0YzTY6SLFvx8vzto9bondsRyXwkKco/pyrM8eRRaqU6xpjE9+smM
	f4VLaAAzVsxchGxVbOh8uTVWg7zDth0xSpAzsSDiiFiV55hVfSLmLwQnQi9FTMjeEJ/3YC7nKlW
	e98/52MO+4JaqKL3FEX+lWEBkIT1Dj/LloxBc5kznTbbgb6ah9uoo1gS91T8nDLLMo6If
X-Gm-Gg: ASbGncsINADCgqWSXT1nTG9kzFR3jbVNpjkAVyRD/d05TpeI4+HAQyGrArf6rwE26qz
	+Go/se4bjCnqUDcpjCpTlCmh+cJPd2km85N/9cC/FqkWj0VHs5OOEoQ4P+7+2YhofdjBpRWYPGc
	d4z3OlKWQSzEhZ4OBEpIEkP3rHwfcEQNrK+AJTsEJj6W2JYq2ra3Xc2bQRqYxmCzTHiNf3Qn8AX
	BNO6f+cUeYIBwSj/YjiMh8PmZY8nqGyeixUEInM3IffbcwlUBLigBp/pSFucMgsl3x/kn4bd7bh
	XqraasG9nsqHvsNUKHW/X2JLJ1/W7WY4QPCFekI7iP30w/5a0IGW7TtQrAKFEBfvAQFZaLI+uAF
	hncX3VRfqgaXVBE1d+vA1xg==
X-Received: by 2002:a05:622a:f:b0:4b3:d28:c94 with SMTP id d75a77b69052e-4b313f91b70mr104592211cf.12.1756807770439;
        Tue, 02 Sep 2025 03:09:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG62naAHegsU8yObAUYcVswhyEJm1MXgvdqmgJY8Nsg/BHuM4ig7uhBtizCPYrmE6bZFkxhCQ==
X-Received: by 2002:a05:622a:f:b0:4b3:d28:c94 with SMTP id d75a77b69052e-4b313f91b70mr104592021cf.12.1756807769913;
        Tue, 02 Sep 2025 03:09:29 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0416e878a2sm623402966b.95.2025.09.02.03.09.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 03:09:29 -0700 (PDT)
Message-ID: <d13d416d-507c-4f74-91f5-38447ac39599@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 12:09:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/3] arm64: dts: qcom: Add base HAMOA-IOT-EVK board
To: Yingying Tang <quic_yintang@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Yijie Yang <yijie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yingying Tang <yintang@qti.qualcomm.com>,
        miaoqing.pan@oss.qualcomm.com,
        "stone Zhang (Stone)" <stonez@qti.qualcomm.com>,
        zhichen@qti.qualcomm.com
References: <20250828-hamoa_initial-v8-0-c9d173072a5c@oss.qualcomm.com>
 <20250828-hamoa_initial-v8-3-c9d173072a5c@oss.qualcomm.com>
 <qgirqibqvsld7n2ac4cvuvtqknhqkq535jkxnxjjqvss5wpm36@i3mbp7qgqxju>
 <1600b292-df57-4328-baa6-db6467e00096@quicinc.com>
 <wxnyux7a5raz5ltz7hpd5dp5euuwwjts2qvhvr4ksdgoye6pm5@2jxthgfwgpuf>
 <23d10901-6b8a-41fb-8cb2-e8e361093561@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <23d10901-6b8a-41fb-8cb2-e8e361093561@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FMLcfABX6njyib6ZtdNR_gMe_3IX3CDM
X-Proofpoint-ORIG-GUID: FMLcfABX6njyib6ZtdNR_gMe_3IX3CDM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfXxfkLL2Dwho5n
 J6A0Kh5wJOdyAPiyervyqiSLyDzE+9GlvHQFiHr1w0Yfk93MIpdBgs1igZ7vDGNclOQYrhD6RMj
 XSrs89G4sDX2wVaa3tCfMPVwuK51BfibrpItPLoXw9NfBMHtALW9Su4sysV8XIEv3bFXJ44YN3o
 SY4YgKS7uBlvP/WsnObuEwUPlI06+a39O9h15d1ofKxK91WTFeTR4MhX8+yty7y1mcdqqKst/gl
 3qAn6u35zaBrngcq18mgImdPmDsJP4hq7vxtcVKo5eT3bGq2AUnoQnK6TyBEkOThR9BDoQ60R/7
 Y0QOyUQN3/kASDllHLE39NUTlVH6aO67L8wcJPD0WZnUz5aB64Qs36jx59kVYA00XvpeAZhzYdS
 ajX48O25
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b6c25b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=RSXL5CDgIuVycp1vnC8A:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027

On 9/2/25 8:56 AM, Yingying Tang wrote:
> 
> 
> On 9/2/2025 10:37 AM, Dmitry Baryshkov wrote:
>> On Mon, Sep 01, 2025 at 11:02:24AM +0800, Yingying Tang wrote:
>>>
>>>
>>> On 8/28/2025 7:18 PM, Dmitry Baryshkov wrote:
>>>> On Thu, Aug 28, 2025 at 12:48:47PM +0800, Yijie Yang wrote:
>>>>> The HAMOA-IOT-EVK is an evaluation platform for IoT products, composed of
>>>>> the Hamoa IoT SoM and a carrier board. Together, they form a complete
>>>>> embedded system capable of booting to UART.

[...]

>>>>> +	wcn7850-pmu {
>>>>> +		compatible = "qcom,wcn7850-pmu";
>>>>> +
>>>>> +		vdd-supply = <&vreg_wcn_0p95>;
>>>>> +		vddio-supply = <&vreg_l15b_1p8>;
>>>>> +		vddaon-supply = <&vreg_wcn_0p95>;
>>>>> +		vdddig-supply = <&vreg_wcn_0p95>;
>>>>> +		vddrfa1p2-supply = <&vreg_wcn_1p9>;
>>>>> +		vddrfa1p8-supply = <&vreg_wcn_1p9>;
>>>>> +
>>>>> +		bt-enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
>>>>
>>>> Okay, so how is WiFi controlled? Is there a GPIO? The DT should be
>>>> describing the hardware, not the UEFI behaviour.
>>>>
>>> Hi Dmitry, as I described in previous mail, On hamoa platfrom whole wifi module's power supply and enable gpio are voted in UEFI.
>>> Hamoa is PC platform, so BIOS/UEFI behavior is compatible with Windows/ACPI architecture. UEFI is responsible for enabling power supply 
>>> for all devices which may be used in boot phase (such as WLAN may be used to boot from network).
>>
>> This is not completely relevant. You are describing driver / Linux /
>> bootloader behaviour. I asked if there is a GPIO in the hardware. If
>> there is one, please add it here.
> 
> Hi Dimitry,
> 
> During the UEFI boot phase, the WLAN enable GPIO has already been asserted, and the WLAN chip is functioning normally. 
> If we include this GPIO in the kernel device tree, when the kernel configures this GPIO, its voltage level may experience a brief glitch, which could cause the WLAN chip to reset and result in a PCIe link down.

The WCN pwrseq code handles this already, please simply describe the
hardware like the platform firmware description which you're creating
is supposed to

Konrad

