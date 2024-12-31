Return-Path: <linux-arm-msm+bounces-43755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 962F29FF09F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 17:21:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD3813A19FA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 16:21:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3356B190057;
	Tue, 31 Dec 2024 16:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CNu6PG8c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869AC3234
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Dec 2024 16:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735662075; cv=none; b=unNsD5M+qLLH71FSNXwZ5Gj4ETzHe7H3QNmwtD5PbmH52JJ/VJNNuXpz7nG2+N/0iQkmqHhxMeoOBC/97c0Vgu9Kq8iO8OEy7Y6wOfbdwkt5z/wIDDf5DFp1/e1WlYGIEmrvMyqoIw6saX/VGsvARob67BZSjl22QVSnHbVquTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735662075; c=relaxed/simple;
	bh=2RF9iuBH0SUoO9XGLxM6Wzu/BqIdZFN/mDeBVPLgTwE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f/QyIY7zdQEJ28ucw/rbzs7zH8CVFCle0vaNIZNiRpe6V60c5zm6IW04dgqplxt3OSFeAIrua6/jsGQKmROEr0pGYwYUsBO3HHP5wNd2a4HKHRy8t2VU7YfhCp1QRB+0skRddxy5qlGZAfjYPckXIyICEEwqdwToBnvwjxZhg4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CNu6PG8c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BVE3gvh014803
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Dec 2024 16:21:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ljy3Qb4AXKfr9HphI58r4Qn4mu2yQF6pmaRFo1VDtqU=; b=CNu6PG8c5lfHt2dL
	dZLW+iX9jLVj8BQ5QfNT6JFhmcsrXee/qWF3AmM+XDe9xeTm5wSvrwk6qq5469VI
	VogGgD7HTn4NkRDPSJNjNpTBBQ1V80oXAYrxuv8adUlJiMAWTZTaRSHRcjfEr9iY
	agt+pdzqBRXW0PmKEIE7VqwG8oZWCPq+A6eU8IAJ6UtqiX6luv2yFZFOCzWf3Myr
	le/nCTLkXtdjoZ2asLIVhT81utk40cCn9rHYjAPTEYWfXNMtFRRO26KRGA4GoVtl
	tKaP19/BtbusfZMidHT4+/vp5M05/Eb6ExJoB8rnC0a98JMmnFWFbVkfshwDo/ag
	F0mx5A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43vj1ur6x7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Dec 2024 16:21:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7b704c982eeso87590285a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Dec 2024 08:21:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735662066; x=1736266866;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ljy3Qb4AXKfr9HphI58r4Qn4mu2yQF6pmaRFo1VDtqU=;
        b=frKwpODNXedj1yVJCd0N0vTnkoZePUZTLkk/ty5BNKnZEjU8NJD19PpElXTpDW5ozm
         FaTVgMSUqbqXFbzjZEX0inAtq8HpUCCrWhIK/bwTnTwjCcbTaYUzFShd650gX+VjPpY4
         puT7EHiR62mI+vhIe4DlhJzvmV1nOBL09/VwP6NzkXuDAmELOiqU8uCbDCbtKZIX7GAI
         wymHRFv2cDCN/F3WsVVxKHKYAIoEt+W8r+jJrnOQmIio+zaA5fiMU/TJZ9PZp1BhgC9X
         1erJAsQBR2KNt+bTfyeBma5YCBXW0aM3kA7JzmGTpmL7Xay5SW7RsgFSt+XVL19sSbMs
         pNYQ==
X-Gm-Message-State: AOJu0YymITn/SrewZAUc0x57+0Fv4cfYThISV7sMctnu5TDioRoD1hF2
	JuauNabr7GVltVRqtQD7EO6VYD/psyRkc4X3drTlUYPv1CNcJMEvpM41um67k6yGEJc59OZg+q3
	efYlT38aggIYmkScRVENQRhAWn4nx0ruKBoygVWzwuUxqEG3iBewR4f+1UvZ3uIIX
X-Gm-Gg: ASbGnctqc+LjFaTpKNzOueUA/sWln543rzFsxBAcEgyx1nZDF4h0RFuK7QL4be8aIXb
	K7lpznmWlgRwPsWCg1XRhbfzbEfbeGx2pzXgjxsHNKET7W8kGVR/BLWQkJkmuALutaNxg0ar1a8
	Hq52aN5jiN8xG1ilMJUEDESe+lInt2YG6PafVmmaH6CtUUKvO/+Ph41ZGiNZVeLx1Vu04PvnX/u
	yby+H5e7IgN67B+vKAZJe+WMKcGafeXFFtVzgdp91eF8b0udxUddTLbeTbEyshHkhfWNPubRGBO
	+BkamZl0rdZtXIQ3XyZud+H7s6pkjbjoVKU=
X-Received: by 2002:a05:620a:2620:b0:7af:cac7:5017 with SMTP id af79cd13be357-7b9ba7322bbmr2404605285a.4.1735662064332;
        Tue, 31 Dec 2024 08:21:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH3W+kVRXZdSaW7DniEPJbMiXabPdArKM93olFDB2Kxk2mk1ehf3/y/E52cFnrn5gdU3D6fhA==
X-Received: by 2002:a05:620a:2620:b0:7af:cac7:5017 with SMTP id af79cd13be357-7b9ba7322bbmr2404603585a.4.1735662063904;
        Tue, 31 Dec 2024 08:21:03 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e894f2esm1614037866b.69.2024.12.31.08.21.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Dec 2024 08:21:03 -0800 (PST)
Message-ID: <1798bc04-4cda-45aa-b033-3cbafe7f8f54@oss.qualcomm.com>
Date: Tue, 31 Dec 2024 17:21:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/6] arm64: dts: qcom: Enable cpu cooling devices for
 QCS9075 platforms
To: Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wasim Nazir <quic_wasimn@quicinc.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241229152332.3068172-1-quic_wasimn@quicinc.com>
 <20241229152332.3068172-7-quic_wasimn@quicinc.com>
 <dc6876f2-ede8-4105-86fd-fd7060d9e7fd@oss.qualcomm.com>
 <af982662-85c0-5d21-be40-44cbc8401678@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <af982662-85c0-5d21-be40-44cbc8401678@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: oT2-hQXtNXoI6I9n813Trevp4WPvN-at
X-Proofpoint-GUID: oT2-hQXtNXoI6I9n813Trevp4WPvN-at
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 mlxlogscore=750 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412310138

On 31.12.2024 12:05 PM, Manaf Meethalavalappu Pallikunhi wrote:
> 
> Hi Konrad,
> 
> On 12/30/2024 9:05 PM, Konrad Dybcio wrote:
>> On 29.12.2024 4:23 PM, Wasim Nazir wrote:
>>> From: Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
>>>
>>> In QCS9100 SoC, the safety subsystem monitors all thermal sensors and
>>> does corrective action for each subsystem based on sensor violation
>>> to comply safety standards. But as QCS9075 is non-safe SoC it
>>> requires conventional thermal mitigation to control thermal for
>>> different subsystems.
>>>
>>> The cpu frequency throttling for different cpu tsens is enabled in
>>> hardware as first defense for cpu thermal control. But QCS9075 SoC
>>> has higher ambient specification. During high ambient condition, even
>>> lowest frequency with multi cores can slowly build heat over the time
>>> and it can lead to thermal run-away situations. This patch restrict
>>> cpu cores during this scenario helps further thermal control and
>>> avoids thermal critical violation.
>>>
>>> Add cpu idle injection cooling bindings for cpu tsens thermal zones
>>> as a mitigation for cpu subsystem prior to thermal shutdown.
>>>
>>> Add cpu frequency cooling devices that will be used by userspace
>>> thermal governor to mitigate skin thermal management.
>>>
>>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
>>> ---
>> Does this bring measurable benefits over just making the CPU a cooling
>> device and pointing the thermal zones to it (and not the idle subnode)?
>>
>> Konrad
> As noted in the commit, CPU frequency mitigation is handled by hardware as a first level mitigation. The software/scheduler will be updated via arch_update_hw_pressure API [1] for this mitigation. Adding the same CPU mitigation in thermal zones is redundant. We are adding idle injection with a 100% duty cycle as an additional mitigation step  at higher trip to further reduce CPU power consumption. This helps device thermal stability further, especially in high ambient conditions.

I understood this much from the commit message.

What I'm asking is, whether your solution actually works better than just
letting Linux software-throttle the CPUs, preferably backed by some
numbers.

I'm also unsure how this is supposed to reduce power consumption. If the
CPUs aren't busy, they should idle, and if they are not fully utilized, a
lower frequency would likely be scheduled.

Konrad


> 
> [1]. https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/cpufreq/qcom-cpufreq-hw.c?h=next-20241220#n352
> 
> Best regards,
> 
> Manaf
> 

