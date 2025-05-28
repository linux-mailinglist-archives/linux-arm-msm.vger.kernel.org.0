Return-Path: <linux-arm-msm+bounces-59683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AE8AC6832
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 13:13:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1CD221774E0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 11:13:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25A7327A124;
	Wed, 28 May 2025 11:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SXmpdtcw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0DD52798EB
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 11:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748430813; cv=none; b=YW2LJEhrghhXXUIrR674cOmo+rZqnsGJL04GImCs+lqf2t9XEmPXKOW3zZhAgXFyLi+XAMg5lgFLpfLAibOWmk+I7mzX3+fUuNgo7MVF1/TDQ6z2a+Yb6Ec3czbuGO0eDRDvKbDVR56efi3WiEVpTFqIPoqkCQedpP2VH21XkJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748430813; c=relaxed/simple;
	bh=kSxeXKRTq2AWY+QK4FBihHz03SpIclgrupOj+3QM8gI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tqAguSBM0rEBntQE6BtNqhycfWXl5QMsc7FJgJQLEBL0Vl3NSeifnNne/V8D1aX9xCIuhm55O7lf+3lqGzgBo3LS2l+gZESpabRKFawT5kYTeAGnmPM/Qmxh7XT+1C+fQLyJOfAB9j0eJWv+sgysIbVRbNjY5AHd8fdUDaU+azY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SXmpdtcw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S1u7H5012235
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 11:13:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vgyuAx7dSshWcQQhWvUbmXixp8HbacWD1UD6odQRfDI=; b=SXmpdtcwbio5lhSK
	rN/v64jtZDFc8B9yTOIX04ce5thjB3uvDghaVCXJFic6wmAcctUmKZSU66L8weja
	cRgkn5jMhPFhuj+WKbIx/Q26n1Wl15ralEzIKH3baDjvZOxBsaNh0soGYkGeOmjz
	OQedSDimJPJ7Q2Np59bTbL3VxXoQTig9ijJFCSq2LC5a53stMbFjA+JNuZ4qBPn5
	8LtrbbCOkzvE0c4CP97NjquG2yabMRQOBpZk/cTBORCF4gNVpjVtMiwmSnvn4BQW
	VozEl3nf97Cp73G4f4fxfxG5/iShGuVIfH06rLzOVJqkueAs2dlmaiZceTbN33vA
	v3oFHg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w691cgkx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 11:13:30 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a42d2df3b5so804301cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 04:13:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748430809; x=1749035609;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vgyuAx7dSshWcQQhWvUbmXixp8HbacWD1UD6odQRfDI=;
        b=miU4Lc+BgnMRV/JC9P5ixOF8Ww6EYyfv+ATU9dKvQMGN6+kJqMwNAHLDfHEpuVA7IM
         nlGHrnmMVatBQb85qaRwQ3uR1DsmpmY7juEY11ALGJjTZkpSM9C1g1x/AMNrxU8G8Djd
         dFpbQ+vsaIJHy+1gIXYDWRC9j7t4A0kxwOu5bOwDqCAtIddSajALeg77dm0B7898jzWL
         DNiV4VkJmnXlqdcYfybqZsX54QTIXyjn+sUlRXP9kvF3R07++cJm+45s4JRB3cZk2TeI
         yGQI+QH6RuQfnnn5cnR8ATjcpdxf1jfVK+wfeCDxp+A3Iz5KoKLSnklfaqkoxglnXRhT
         VVhA==
X-Forwarded-Encrypted: i=1; AJvYcCXavFz8WgX127L/NLZOKcMAwBiLwQQM6O2s7xl9wBezU15ruF5BipOObJHBC7moWmIgW5qlnlpulqW1So7J@vger.kernel.org
X-Gm-Message-State: AOJu0YyyOB/91PoUojqb2RviKfXYMqiPBjdCgaUXnlr8DeWI8f9HatT8
	xkJLFC5pKIPJIoqAtfF+HEByynbvxeC87R8MS/oy8RToxLEqpZMZTUJrFu47kWXzms0uheYn8aw
	+bTwElGObL8tiT9nOH4R7nGrksxgshJ1LE1gSYUsFRx9C/XS5HOAwUkda1NlatGK12rQH
X-Gm-Gg: ASbGncuSn4JqnQQJGwCBYH/KpwNwMa54JzKsIleOdT0GOow1oP/XLZFYs7qpFHkSfpc
	V0V3aCvlrfuEXF8I+v3K2e43I5ig0uNO+5xEZ4Xx5pOq5VfvqIlQuAt1LhYO4d++59saSpU+OTV
	9gzywXvwM8V1wjfZTCEaUReyUltjIPXIzhdGcJLE6hAdzwUr+tIpOQJ4EBpNbgFefTPKmNQ8Vsd
	nlCLHncgNvuOMmip19N8zDI1GO24Njfz/wMFfrUIeNwVlBUbkV9iwnPRKhmZ8j7g85PpNIYM2qf
	ge175pyo5HyalT/DNFtSW5UpmM68bm4LhqtmhI/ki2j+WNo9kWh6Fm3+t/7ME1MN3w==
X-Received: by 2002:ad4:5c65:0:b0:6fa:b954:2c35 with SMTP id 6a1803df08f44-6fab9542d12mr26075816d6.10.1748430809486;
        Wed, 28 May 2025 04:13:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEeKRrREHf2m6YYb/SYCGixIP+aO46rPYYipbA1Vi8xkIBSTUT+o+9WPcrWNSOLCsqtY0Enyg==
X-Received: by 2002:ad4:5c65:0:b0:6fa:b954:2c35 with SMTP id 6a1803df08f44-6fab9542d12mr26075586d6.10.1748430808982;
        Wed, 28 May 2025 04:13:28 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad8a1a1323bsm90175166b.84.2025.05.28.04.13.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 04:13:28 -0700 (PDT)
Message-ID: <9037fefe-aa40-4884-97ee-b81ff8346944@oss.qualcomm.com>
Date: Wed, 28 May 2025 13:13:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] arm64: qcom: allow up to 4 lanes for the Type-C
 DisplayPort Altmode
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20250527-topic-4ln_dp_respin-v3-0-f9a0763ec289@oss.qualcomm.com>
 <styd5gjksbsqt7efylpfn6bgwgyvt6zexxiooihjsnmp25yigp@unq7dor6gso2>
 <447c3b13-8d6d-4bcb-83c1-9456b915a77e@oss.qualcomm.com>
 <inpfuxskvmrebxitqtqwzvpnpicibo6zakgk4ujpcrqrpef2vw@nhclj5rg7axr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <inpfuxskvmrebxitqtqwzvpnpicibo6zakgk4ujpcrqrpef2vw@nhclj5rg7axr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=WfoMa1hX c=1 sm=1 tr=0 ts=6836efda cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=PC4tWo4A_DL9_zoQyE8A:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: oZBaCslODWsmbkpfc7-UhY6zFpR-M1fy
X-Proofpoint-ORIG-GUID: oZBaCslODWsmbkpfc7-UhY6zFpR-M1fy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDA5OCBTYWx0ZWRfX2NUe+t08xwto
 1IUwOjiwh34vgozlIUZOXckKCaccioOOH86/zKwcLxCV8aMah17fD4gs1Bnpemn24TvwtWKWIOG
 Eif98Tz+3IdxcbFpzrJU4DktLzYLZ8rjM4LohOass1A9ExpogTp1zhTEra9bl2vLOVdej3pW+5n
 ZCDil6RrpxS+5oc5U1aFElCuD8ktLdSkvdqgBkBv0RE/Dj4iPP2mmzozAfyosEPu0iJcWR+Rsi1
 okN5fxHeQrekq+cd33lYKydT9B/U+lOHpb8ItzNixgqv5AHuia8xffm6Hr1OD/dwpqh7/lrxiuR
 +cn+A5eEUcQxM8izxKNOua4bHMVMeSfMSLEWrppVRr4jhJY1eBXnGSLJa6XSkDESLu589Kw4L4v
 imuLc6pcbB6YFyMUEUAFjRq4r2NLDi3hDJ18qy3c+UBEbg6OYc6NHasS1ztw+zvScUKwZ54G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_05,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=588 priorityscore=1501 mlxscore=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280098

On 5/28/25 11:00 AM, Dmitry Baryshkov wrote:
> On Wed, May 28, 2025 at 12:24:02AM +0200, Konrad Dybcio wrote:
>> On 5/27/25 11:10 PM, Dmitry Baryshkov wrote:
>>> On Tue, May 27, 2025 at 10:40:02PM +0200, Konrad Dybcio wrote:
>>>> Register a typec mux in order to change the PHY mode on the Type-C
>>>> mux events depending on the mode and the svid when in Altmode setup.
>>>>
>>>> The DisplayPort phy should be left enabled if is still powered on
>>>> by the DRM DisplayPort controller, so bail out until the DisplayPort
>>>> PHY is not powered off.
>>>
>>> This series doesn't seem to solve the USB side of a problem. When the
>>> PHY is being switch to the 4-lane mode, USB controller looses PIPE
>>> clock, so it needs to be switched to the USB-2 mode.
>>
>> I didn't find issues with that on X13s.. Not sure if it's related, but
>> on the SL7, after plugging in a 4ln DP connection, I need to plug in
>> the USB thumb drive twice for the first time (only in that sequence)
> 
> Might be.
> 
>> But there's nothing interesting in dmesg and the phy seems to be
>> programmed with the same values on both the initial and the subsequent
>> working plug-in
> 
> Please try using a DP dongle with USB 2 passthrough (there are some).
> Or just emulate this by enabling DP PHY / DP chain for plugged in USB3
> devices. Would you be able to see the USB device on a bus?

I only have a dongle with both display and usb that does 2ln dp
(I tested 4ln dp on a type-c display that I don't think has a hub)

USB3 - yes, USB2 - no (but it works after a replug)

Are you talking about essentially doing qcom,select-utmi-as-pipe-clk
at runtime?

Konrad


