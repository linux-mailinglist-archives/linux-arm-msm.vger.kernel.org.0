Return-Path: <linux-arm-msm+bounces-73677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F911B593E0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 12:36:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC2003A3134
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 10:36:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17E552F7AD4;
	Tue, 16 Sep 2025 10:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LQhnWGUc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992DD29B237
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 10:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758018970; cv=none; b=DX64Lh3Bc3vpa+SXa1pj9EPMeUQ7xnJYUneaD8SwiLFnWzlxQ3QtXZmToxpIa08LduZd6narqKqfQ35pnkUlzZ+gpMpz5YO35Ch2x0h1DNW6voOtRkQF6NVlwqGK995GshLALZz9VL4uGg1mziPZJEbyWxJvuPAZiicCGj5Occ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758018970; c=relaxed/simple;
	bh=Qz30nJSo3zoddLNFeFML3WJ7DaicVwANWR/rFS4kCnE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SzaykwpCujtnU4LEU+bxEQL8112GUwZWL1R3Z3mEl41CW83/etNaORRx6RkcLojwrNBNpB2mTwY4mrHTdP0eKlyCwdSCf4xtOoDgrS3r49d4gC4trJCjnKpcTHmTPqwqFNqkIjcHDs03JKrbfZzr/fYp7o/9xPk//nlVCUMF7FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LQhnWGUc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GABBQc005278
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 10:36:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I1oGxXNARfYkquajFMgBv86g7mkjud9gt3fZRcuQCEM=; b=LQhnWGUc7YZjveKJ
	lF+jfrzT3KP6KJ4EclPgeGbGUuMO9hbZpVcdhf5aVr7NeQrSfWr131T6Di58H8sB
	eEklXGWVkMOP5vyWdH210Dm5ozCglSB+jnALjAhElE9jSLTSB23K1WkhYSn4XiIT
	/q7wKRG4Lx9T6GkdefXhhS5i1JuGAxQ7A7kQvAiQzvYOb4JvVyQgQpDlQKriNLD1
	GTM6n3Y7/gW7WHNF6m+kAW1PZDxMg3CRTIdJdMiAZxQT+WUOTyCzeXa68qA2TBKl
	mBOTOfl9TqrOUBbH2TMe8Fa3xyjlbux9oQfx0V1YxpstpaFg7+sox7Nv/RVgeqQF
	6VQSdw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496g5n4752-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 10:36:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-80d884c99e2so69513585a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 03:36:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758018966; x=1758623766;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I1oGxXNARfYkquajFMgBv86g7mkjud9gt3fZRcuQCEM=;
        b=bjZQMbN/QNS2sRReyO7R3eIyPS4BPkTqqITw/6pZDsBR9baFqmpR/d5nJqqujExQeO
         eM6mxRxmqQk5XcyzK0RAVU7EGQ1TTSKC2PM8jFmqiKWwc85q5blP+hSrAi2Sri0DcKKj
         TOICOTZRsG/tZ9gcPPzrKQKh9Ch9j6AififrqpArLXhOSAsMdGDWMFXFiNDMQNpNm+PP
         xAZkYqUXWwXOLY0sh6RdvaiRcf5lQLoEfgTybdCmwboeEZ8kJ19Af1LQ4ubOXuiWiqkX
         pT1Nyx1+cDCYW8bm/76/fcvcmsOnRDIkNbPGbZCHEp6uP1DPsL+XYQouNoLi6g7R6cpr
         UK7Q==
X-Forwarded-Encrypted: i=1; AJvYcCU5+DzAITSEPK+XH2M1xN4wWnBn07dbi31C0bhjLr89kLI3GGSZClEUzfQ0ZCt4ZRYc8ZYZExsYLKmsanvB@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6c00gjj8BiyvHG7QZBWo9Rbmm3nfKE1pPc3tsuRlib15IJ8NM
	k7n0zShYpUh+OM9NPUKkDUhVIAi4XzUVbZzR2ro+qmXRPfbXbRa8feOs2NNiv2gj2CEiPb22Hey
	cTpMcRL1kjrvM0Wa49TSSHO/LxZTuKdj8PlNo3czq6DGau+UN/fmJOpmXAf3KB1aFEV/R
X-Gm-Gg: ASbGncvA8WUl8miU99d3vrgHvNEGxS3tBWkb7X1p/j3+LfXiGUc1WDr9Oj2wxR90EMa
	OHt75MKyrgv3x1WA2pLKF3+Qtwe0bUPM5JrwYkjGYy12Ka0f7z9/ewPfkkLbWfh5pxmyZ4r/2/I
	NmfsF4qm4pjtpINCuBLpVvgtkMyGfYanVNAJbQ25fFxxl9tXYjvA+kuKpfSZeCnIiLN9f1tNckJ
	QI3E+SgjlOKRlI4HFpGZljP9hMbV76zALXbjXdO1B+6LjYsOKepwCEY3wv0foyc2pzZjgbDWOE/
	JL5yf/0m/i0Khx5E0bkxBTywSr1MwfEeAigRhpwCeQGgrmNJPjGHoge/M6nWKRAkVW21GMnQsEw
	uVzmUv4D+W+ddWd8L33JTSg==
X-Received: by 2002:a05:620a:19a1:b0:81f:ebae:fae2 with SMTP id af79cd13be357-8240084e22emr1063116785a.11.1758018966148;
        Tue, 16 Sep 2025 03:36:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtrsP4OgHOvZ+jFOe5+SIsQT9/nGz1c5nMb0t2aETsobB1lXRz1cf6sYYhrLoapwJPuNwg2g==
X-Received: by 2002:a05:620a:19a1:b0:81f:ebae:fae2 with SMTP id af79cd13be357-8240084e22emr1063114985a.11.1758018965433;
        Tue, 16 Sep 2025 03:36:05 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b3128a5csm1123661666b.37.2025.09.16.03.36.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 03:36:04 -0700 (PDT)
Message-ID: <ee2d0d92-bff9-4593-a912-7e4b1d66913b@oss.qualcomm.com>
Date: Tue, 16 Sep 2025 12:36:02 +0200
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
        Shuai Zhang <shuaz@qti.qualcomm.com>
References: <20250910-hamoa_initial-v11-0-38ed7f2015f7@oss.qualcomm.com>
 <20250910-hamoa_initial-v11-4-38ed7f2015f7@oss.qualcomm.com>
 <aMPhEm8PuhEofHP7@linaro.org>
 <317ffa87-060c-4f1b-a6bf-61bb27367477@quicinc.com>
 <jimz3qnjrcvemvgrqpwxq4zmywfo6psplsg4jefkvvpiwlffek@fwn3juynr4zx>
 <b3bf54a2-f33b-44d5-a9e4-65ba18ea267d@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b3bf54a2-f33b-44d5-a9e4-65ba18ea267d@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: tKzcHVfC9UJGBTrZZgE4V4HPuXkFd7ym
X-Proofpoint-ORIG-GUID: tKzcHVfC9UJGBTrZZgE4V4HPuXkFd7ym
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA4NyBTYWx0ZWRfX3WnS4K9xEkl1
 KdxNGH+gDNQoVaHuEF0h+7YJ37ne88evGpXWN7PNUIxbbJ2uCwyEEpCjfqcFxNn4JxWUnIQXPI8
 ioyxfE0qqFIT6hzUCjdPpE9jO+Y4Ios1MldNhLDDp+UM6RRmIcrBywHWq1GqhLl2KaNdLH3x0IS
 1WFYYC0XpGHtbALoHKMImocjfrz1lvoys+63xDdWAy0Y1y7CQ+6W91emI73SkdAb7gnw7fhm2NK
 6cGG0Oz9c8LwWS4WNv0ZxwVJY4PwF1zqcEdRqYH4aOk37ZOZ9WCJV64M27ifkEIG9jKS64hC1X2
 yy/OjAvNHZ7AJOy0ekGMQ+druhBBrOypXGKJB3ZLuKxzmSaHzj/PbYdVNNpMx70wuw+46tGyAjg
 5zPU+I8r
X-Authority-Analysis: v=2.4 cv=SaD3duRu c=1 sm=1 tr=0 ts=68c93d97 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=Sfr1CVDFLF9upuNpyUYA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509150087

On 9/16/25 12:29 PM, Yingying Tang wrote:
> 
> 
> On 9/16/2025 6:14 PM, Dmitry Baryshkov wrote:
>> On Tue, Sep 16, 2025 at 09:42:26AM +0800, Yingying Tang wrote:
>>>
>>>
>>> On 9/12/2025 5:00 PM, Stephan Gerhold wrote:
>>>> On Wed, Sep 10, 2025 at 05:02:12PM +0800, Yijie Yang wrote:
>>>>> The HAMOA-IOT-EVK is an evaluation platform for IoT products, composed of
>>>>> the Hamoa IoT SoM and a carrier board. Together, they form a complete
>>>>> embedded system capable of booting to UART.
>>>>>
>>>>> Make the following peripherals on the carrier board enabled:
>>>>> - UART
>>>>> - On-board regulators
>>>>> - USB Type-C mux
>>>>> - Pinctrl
>>>>> - Embedded USB (EUSB) repeaters
>>>>> - NVMe
>>>>> - pmic-glink
>>>>> - USB DisplayPorts
>>>>> - Bluetooth
>>>>> - WLAN
>>>>> - Audio
>>>>>
>>>>> Written in collaboration with Quill Qi (Audio) <le.qi@oss.qualcomm.com>,
>>>>> Jie Zhang (Graphics) <quic_jiezh@quicinc.com>, Shuai Zhang (Bluetooth)
>>>>> <quic_shuaz@quicinc.com>, Yingying Tang (WLAN) <quic_yintang@quicinc.com>,
>>>>> and Yongxing Mou (USB DisplayPorts) <quic_yongmou@quicinc.com>.
>>>>
>>>> This looks like you should have Co-developed-by: tags together with
>>>> their Signed-off-by: tags.
>>>>
>>>>>
>>>>> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
>>>>> ---
>>>>>  arch/arm64/boot/dts/qcom/Makefile          |    1 +
>>>>>  arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 1221 ++++++++++++++++++++++++++++
>>>>>  2 files changed, 1222 insertions(+)
>>>>>
>>>>> +
>>>>> +	vreg_wcn_3p3: regulator-wcn-3p3 {
>>>>> +		compatible = "regulator-fixed";
>>>>> +
>>>>> +		regulator-name = "VREG_WCN_3P3";
>>>>> +		regulator-min-microvolt = <3300000>;
>>>>> +		regulator-max-microvolt = <3300000>;
>>>>> +
>>>>> +		gpio = <&tlmm 214 GPIO_ACTIVE_HIGH>;
>>>>> +		enable-active-high;
>>>>> +
>>>>> +		pinctrl-0 = <&wcn_sw_en>;
>>>>> +		pinctrl-names = "default";
>>>>> +
>>>>
>>>> regulator-boot-on?
>>>
>>> It shoulde be regulator-always-on
>>
>> Why it's not boot-on and always-on?
>>
> As I described before, connectivity power is voted by UEFI in boot phase.So PCIe link between connetivity card and RC4 is established once RC4 is on.
> If we set this node as "regulator-boot-on", connectivity power will be down first then up. That cause PCIe link down and the link can't be trained again unless you reboot board.
> So we can't set it to "regulator-boot-on"

Surely gpio-regulator.c implements .get_voltage which reads the pin
state though? Did you test this, or are you theorycrafting?

Konrad


