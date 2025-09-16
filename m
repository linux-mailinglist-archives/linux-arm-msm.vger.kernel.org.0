Return-Path: <linux-arm-msm+bounces-73691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F54B5948A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 13:00:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3C8ED4E2E09
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 11:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B3092874E3;
	Tue, 16 Sep 2025 11:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a59Hb0H1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EC821578D
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 11:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758020423; cv=none; b=T3i0KTm2KBUqN/d0SISqI/oW7zyj+pb4FcMx9GrEYWSB/1mV79Gjt3D9EHnU0q2ySUpyqPLRBn0+tv/5SEn898c5NZipXuvfsmnScaX6mWKmFp424JECOj2oKdlnNWVD3+/ayu2a/fWfD31jequJRQhP90+m5C1mZt9SGKASuAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758020423; c=relaxed/simple;
	bh=lSiaAwQtmu8l3KrCfNgexYAeTwY8RKqZxR3XprYn4lI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l0u98MEbsY+RA2KChYCsHXXjKeR5DRQfgJddcYIlFjDfYw75mFXIXti90K/jv6mdBzCgRiH3rkPW94+q7o5zFDCGfPo7iL+BQY4JUiM4KeEqaQJxoJwI4QqTjl3PiJRrOuPxtShpQPr2eXqRBTTVff0CjC4BFjAhW7no6dzaSbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a59Hb0H1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GAdiET018564
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 11:00:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V3Bwbj3qyGvIGNCNZf70GMV21ynU087f+ba7OBsqQnQ=; b=a59Hb0H1co0lARzZ
	iuZu0QYAoh9HLmrBnxToZMG3Dhwf105HrnqhoR+EBBBRYXRkYwkDLGIx7Du3Bx7P
	tEo8qrZmUVWZex6G1y3Uudu7xOiZG0mk8B6hrp5Ms6SVokXAfSdcgsXV4joAX5ju
	mR/8oIZ7U3DQRPQW1PaaNK0Ub6DmuyBbCRi/mNUSAQroyFHwMiBvbYnHA0MkEWEk
	7dtstpC8Wjexnwr03IWqlAx8x1ERzG4ZLR8MIcTRZwv7Q0tIRlFGRi44FDPf+SR5
	pBfGLaqJJCG3Y7w7plq4saiUt0ht1wz5fXYj8TYJLO88KPIVVxNuP1c94297O1g5
	0mYU2A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496da9cysq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 11:00:20 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-77c37a2c874so7237496d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 04:00:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758020415; x=1758625215;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V3Bwbj3qyGvIGNCNZf70GMV21ynU087f+ba7OBsqQnQ=;
        b=YNaU4NVJj0/82XFYsFPpr02befHvxEPM/gdzbrt2A/TmiH02SRQ4o8wFX5Tx9GrXET
         14a5V+USKlBEL9OPUy/1ow62rHPqKsFiWb7P6s+GrCnFf7tR4MtlZbsQlemYFIX2zGYe
         HLqGbySWIaAbWoerU7AeMCESkofoXyFeNwmCfy67CVwVe9J6VK/3VLcjQ4kefLNBxlvy
         PSKnko62iD95fKqeEa9H9jIuCgnyy1YX1W8yBvNd9g405fKujcdvmzkfGYYXh6vuluZ8
         l0ewntK/FoaaPaHq/22oZONBylhJ1egxyGBh5yjCHm70TuerClyZSXLSt/taGjkC4D0a
         Aosg==
X-Forwarded-Encrypted: i=1; AJvYcCW7+x60vIn2r7eb24J8gn1q8xUKHlLfOtbBwJ3n+ZpK8gGKS4dlB6SmKgSyp53mjdvnO/z7Us7Ham6wF283@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx816084JGn7SfOp4B8W0U0g/0VgqbTBubyg/M2b/MA9as1wz+
	vsNFW8X70TMUjviFOyaNKRX5CR3eWJ8dX4c/QGLbqDWgxrmBzQH/6D1zfMksZKbr2FbpPdrGPoW
	3hoB9pMtO2ifYH3ZHwGCsT/+ZWtqoQA5YthN6cXZota5jcPPEjsMOyCqmuFvRe0b7dtOe
X-Gm-Gg: ASbGncuzD4Ldmbs3kUZZxKxNcQPyh3mmOkd7KJZgnudr5emJuBqwmxBSIX3oF0Nt8/2
	VKozCL0I83Qd7fGtqnnE2ZLiGeENAQ1mTPVLXoH2bkpxpi5ZUxktaEaGYnRIn59D6Stt8AeTjrh
	pKgoWo6RA2sX20/hEDDS3IyryKDuMdL22d/3QwiPDgC+Lqhdj1J1fqaRoY4vUkhr8zVhv3GKH9h
	5dq14n/VxRmDOcyEo+f4m2AwLuwgKO91+of4Xf2Bv4RE2/1osscSHHhSw1C1ymRogmSsMosbtxs
	kAu/VXUbrNAUR9cB5Lib5IEZuc3jWGOnYDF8xXxUxm02DVUC9s1s06vQv87R858+ClFMz/T0Ow5
	pjl18nnnppWJljWRXkpRt8w==
X-Received: by 2002:a05:622a:834d:b0:4b7:7dbf:9a8a with SMTP id d75a77b69052e-4b77dbf9f29mr110864831cf.6.1758020414238;
        Tue, 16 Sep 2025 04:00:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKU9cobyOEfY+YQm5wRso/r5A+Y7Q8gplBHC/ZGUi55Jhqj/RSggEBomsnCmJzcZ8GLys+ig==
X-Received: by 2002:a05:622a:834d:b0:4b7:7dbf:9a8a with SMTP id d75a77b69052e-4b77dbf9f29mr110864251cf.6.1758020413354;
        Tue, 16 Sep 2025 04:00:13 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62f638e576bsm1218127a12.23.2025.09.16.04.00.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 04:00:12 -0700 (PDT)
Message-ID: <03fe6810-fd37-4883-8fd3-f4919dec1b8d@oss.qualcomm.com>
Date: Tue, 16 Sep 2025 13:00:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 4/4] arm64: dts: qcom: Add base HAMOA-IOT-EVK board
To: Yingying Tang <quic_yintang@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Yijie Yang <yijie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yingying Tang <yingying.tang@oss.qualcomm.com>,
        Shuai Zhang <shuaz@qti.qualcomm.com>, zhichen@qti.qualcomm.com
References: <20250910-hamoa_initial-v11-0-38ed7f2015f7@oss.qualcomm.com>
 <20250910-hamoa_initial-v11-4-38ed7f2015f7@oss.qualcomm.com>
 <aMPhEm8PuhEofHP7@linaro.org>
 <317ffa87-060c-4f1b-a6bf-61bb27367477@quicinc.com>
 <jimz3qnjrcvemvgrqpwxq4zmywfo6psplsg4jefkvvpiwlffek@fwn3juynr4zx>
 <b3bf54a2-f33b-44d5-a9e4-65ba18ea267d@quicinc.com>
 <ee2d0d92-bff9-4593-a912-7e4b1d66913b@oss.qualcomm.com>
 <17d1e632-31c9-48b2-bf0f-5b57234de113@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <17d1e632-31c9-48b2-bf0f-5b57234de113@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=M+5NKzws c=1 sm=1 tr=0 ts=68c94344 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=Ojoud9tNSuJXTGgBNUoA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 7HVgiMcdCkOEyAEKavAdWM3UuBjYwAUB
X-Proofpoint-ORIG-GUID: 7HVgiMcdCkOEyAEKavAdWM3UuBjYwAUB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA1NiBTYWx0ZWRfX8ElGRsxPCU3B
 kifz57/UTu0txLCPTRRTobqQP3B4dTewxDGD3g+DinNlA5eAAa4+RVajB2lu5J2smUKB+HCSFU1
 CWXNiD0XGITwvIGCmu83A22gPWSrATWWvQ0hEkqfoGu+7nxi43unzrqXzHePlUhqqQMmebXQiBy
 wosTvbC/7F146/HbkDJ21K6aF27a+6QTNJ6lxEa0dyXBV3Sv3r8eis7UqJc5q3O3wdHoyNs/uMf
 nrOBdx39JDfVrfN58K6Q/Z2+3YujPeyZUWZw/XiLaV+QrlZvUSAPxd9KRyaLOGGIyjcWb7dcDnJ
 2DOPkRK/ZMG6DrXm5xbPNoGByKOtOEjoKqwB4gpiq43LmKUDejkgt6GkSEfQ9CEQeP/kEocAaNV
 3XpLSViy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509150056

On 9/16/25 12:39 PM, Yingying Tang wrote:
> 
> 
> On 9/16/2025 6:36 PM, Konrad Dybcio wrote:
>> On 9/16/25 12:29 PM, Yingying Tang wrote:
>>>
>>>
>>> On 9/16/2025 6:14 PM, Dmitry Baryshkov wrote:
>>>> On Tue, Sep 16, 2025 at 09:42:26AM +0800, Yingying Tang wrote:
>>>>>
>>>>>
>>>>> On 9/12/2025 5:00 PM, Stephan Gerhold wrote:
>>>>>> On Wed, Sep 10, 2025 at 05:02:12PM +0800, Yijie Yang wrote:
>>>>>>> The HAMOA-IOT-EVK is an evaluation platform for IoT products, composed of
>>>>>>> the Hamoa IoT SoM and a carrier board. Together, they form a complete
>>>>>>> embedded system capable of booting to UART.
>>>>>>>
>>>>>>> Make the following peripherals on the carrier board enabled:
>>>>>>> - UART
>>>>>>> - On-board regulators
>>>>>>> - USB Type-C mux
>>>>>>> - Pinctrl
>>>>>>> - Embedded USB (EUSB) repeaters
>>>>>>> - NVMe
>>>>>>> - pmic-glink
>>>>>>> - USB DisplayPorts
>>>>>>> - Bluetooth
>>>>>>> - WLAN
>>>>>>> - Audio
>>>>>>>
>>>>>>> Written in collaboration with Quill Qi (Audio) <le.qi@oss.qualcomm.com>,
>>>>>>> Jie Zhang (Graphics) <quic_jiezh@quicinc.com>, Shuai Zhang (Bluetooth)
>>>>>>> <quic_shuaz@quicinc.com>, Yingying Tang (WLAN) <quic_yintang@quicinc.com>,
>>>>>>> and Yongxing Mou (USB DisplayPorts) <quic_yongmou@quicinc.com>.
>>>>>>
>>>>>> This looks like you should have Co-developed-by: tags together with
>>>>>> their Signed-off-by: tags.
>>>>>>
>>>>>>>
>>>>>>> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
>>>>>>> ---
>>>>>>>  arch/arm64/boot/dts/qcom/Makefile          |    1 +
>>>>>>>  arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 1221 ++++++++++++++++++++++++++++
>>>>>>>  2 files changed, 1222 insertions(+)
>>>>>>>
>>>>>>> +
>>>>>>> +	vreg_wcn_3p3: regulator-wcn-3p3 {
>>>>>>> +		compatible = "regulator-fixed";
>>>>>>> +
>>>>>>> +		regulator-name = "VREG_WCN_3P3";
>>>>>>> +		regulator-min-microvolt = <3300000>;
>>>>>>> +		regulator-max-microvolt = <3300000>;
>>>>>>> +
>>>>>>> +		gpio = <&tlmm 214 GPIO_ACTIVE_HIGH>;
>>>>>>> +		enable-active-high;
>>>>>>> +
>>>>>>> +		pinctrl-0 = <&wcn_sw_en>;
>>>>>>> +		pinctrl-names = "default";
>>>>>>> +
>>>>>>
>>>>>> regulator-boot-on?
>>>>>
>>>>> It shoulde be regulator-always-on
>>>>
>>>> Why it's not boot-on and always-on?
>>>>
>>> As I described before, connectivity power is voted by UEFI in boot phase.So PCIe link between connetivity card and RC4 is established once RC4 is on.
>>> If we set this node as "regulator-boot-on", connectivity power will be down first then up. That cause PCIe link down and the link can't be trained again unless you reboot board.
>>> So we can't set it to "regulator-boot-on"
>>
>> Surely gpio-regulator.c implements .get_voltage which reads the pin
>> state though? Did you test this, or are you theorycrafting?
>>
> Yes we tested this case many times, "regulator-boot-on" causes PCIe link down. No any issue with "regulator-always-on"

We didn't ask you to remove 'always-on'. That makes sense because
it avoids an extra call to (re-)assert the GPIO if both are
specified

Konrad

