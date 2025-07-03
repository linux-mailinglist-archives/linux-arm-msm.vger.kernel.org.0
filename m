Return-Path: <linux-arm-msm+bounces-63525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3066AF7451
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 14:38:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 216D73A3134
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 12:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45A702E54B7;
	Thu,  3 Jul 2025 12:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c07+vPHx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF302E425D
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Jul 2025 12:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751546320; cv=none; b=MWvfPii9e8+s9jppUGxrw3eTfR54Y1PzWvAM0hK11eD4KOFyfR5P7QtvcnB19ScpLbv1ET+4kJRcoAxkFqkaNN3sikKz0wF/leJqOFV9V8EI6aZjIqyoX5nO1BMxLJzYEMA7dKdu/0q8dKRdgTUfiVJjGhcUcDd7QMSUEX6Wp5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751546320; c=relaxed/simple;
	bh=blvhHAuvKd0z+M6UM8fJg7hW66Y0sZvUde7gR9VDZFc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z7eBuQAICp73nj+AMfDmOTvl4NbPkFtlVDAP9mb6969oXaHRQs+MeGcDuekYso0Bi8V4kS6saWtRIVNXMUVLztb1+0r1/9682sTRJqQ5YT9Mf7UXidZMLWgLy8R6WuwcMT4olnFLQb9XvxkzozxElCxutnORXpLT45LraGVyinU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c07+vPHx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5639CuJi032748
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Jul 2025 12:38:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qh8aZ053Ew1qTcqO548gAuyDU01MqTeC46OFogIdvLU=; b=c07+vPHx3IKsaKNJ
	+53zzbImtZLBaVhX0gRwKtESHcuUKKzex75Hisgg7BKtV2h2MORMWrimj02M1qKA
	6Il+GHeP/ycLt1WdHxuqsodzLwnK/+XSd4NLEfy/sp3D1V2RhAgyT9UMJ722Vws8
	GHbDeqon/n0jBwk3zeazACWa1hXYNSCx9JM0NC0cGfYXCA4sPYIno4tWj4p4SdpX
	gUkEVZ5glqNFNNM7u6AY2sf1gFt2cdn/nHWZs1C9vWneLMctqLki16etuQLb3fVX
	Lw7GZiAtwnFhIsDnXZaq1ooNaQp0Ws7LpVbdfUQlPS8DkU8vZuVO3PD0f8IaayQj
	uptZsw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qmgbdx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jul 2025 12:38:37 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fabbaa1937so23921786d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jul 2025 05:38:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751546316; x=1752151116;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qh8aZ053Ew1qTcqO548gAuyDU01MqTeC46OFogIdvLU=;
        b=TuY/By4piaeSTohWLotFYFbcQ2qbNxZT0c2LYC/nEiaxASXGH4a1jaMITxdqTfkJq4
         2fc426MCCxYKOuFqd1qM21lQpulknccwQ85FJpuZNefHPe37Rko8oLOVyHC4KXAri4c7
         iU1VLAuxp6Wu5LvWVWvix/7t+BY851uH0Z5KLHzxkYqkoxurPn9BQmU24qu82LQ4KxNZ
         Y/l4nVa0HLnARTcrPbuSUt9CSh6ExM2K/IxmNtKRw+9UAA3ghtmb1GhpIQ/jo/CyypkK
         VXpqDkh3hSYB4WpcL7mJNkZIqIUZcNtCX+Fq3cW/El8Y4mjhNITwm6A5dMLymmajz3Qg
         XTsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVM2WKAxuJp250s2mhTYOODSKqALQ6ZpRuRpA5nAkgzjgBULzC6wm5S8k3hJjxQUlQQoZjM+NSzA5EMGPn2@vger.kernel.org
X-Gm-Message-State: AOJu0YwFgFXkSLz12HF87KVW4nPG6YwPf/oY46agZq9+dHoQZb5LPW4f
	aGidwzneJa91Y5lBrL2ZmLE7JF4Jp+MsqBmRMsnppLnxL85J88HBcKw8/CURYkGzhhUMAQfR5K3
	OGvsaBYZ3uzN81MyngYPfC6JLCLPoKe7rMHg73vGGHdOoUL2x1oTJq2uazI0D2oV3P+CO
X-Gm-Gg: ASbGnctQ4/r1QuUZdkWuAGt9LhCjt9zP7OoC1AOxuYNzj3oNxGWB7cuWyhd+4l53RDN
	3I8dakcLODOFY+xJyVxZcJafXgpwVTQQ3wG4toIXxugqvJWDQ1kiHKTG8FnkMs23F95NQM4T7NG
	a6GG4hLHbaNRLF+ZdpoKwikPjODzW+NJG0fTkwcfWbAhvlYV/ztbcNH6UhyvaTxn7WOrCnIVL61
	8pwZW8Dyf6GbTWUTyCrUrPji+OVzvbHrGbPVwN4irOnr9xbUr74DGqfqYds2df0MNEDmT06+hyv
	OHxuyTe13waGsreATQBmnI27KMFv4whjh6vh2QYWTOCruOuhbhv0V44Og05MSiEjhwVe8+JFss+
	j6z1GV2Zs
X-Received: by 2002:a05:620a:28c3:b0:7d3:b0a3:6aa7 with SMTP id af79cd13be357-7d5d3eb6529mr119135685a.3.1751546316492;
        Thu, 03 Jul 2025 05:38:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwk4eFNYt3i3rxN0XJmcdLSCwy/gouEpTFY2xPCM13VPaFLKLCRNVsyEKzUlz6/p28jLHr6A==
X-Received: by 2002:a05:620a:28c3:b0:7d3:b0a3:6aa7 with SMTP id af79cd13be357-7d5d3eb6529mr119134985a.3.1751546316055;
        Thu, 03 Jul 2025 05:38:36 -0700 (PDT)
Received: from [192.168.1.114] (83.9.29.190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353ca20fesm1272538066b.174.2025.07.03.05.38.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 05:38:35 -0700 (PDT)
Message-ID: <1ad2ca1e-1d57-4ad8-a057-ab0d804f1d49@oss.qualcomm.com>
Date: Thu, 3 Jul 2025 14:38:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] Introduce "non-pixel" sub node within iris video
 node
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com>
 <5f90547d-945a-4e26-b36c-75f2d8a1af97@kernel.org>
 <eab8d79f-7188-9537-9176-3e4d22f0978a@quicinc.com>
 <5ad418d9-8199-43c9-a477-1e3b939c054c@kernel.org>
 <7b6db4fa-2f73-376d-4eb3-64c1c7e6cda3@quicinc.com>
 <f5ebf0d6-2f0b-45cc-b99a-b786e5df9edc@linaro.org>
 <5qsgbqml367yq6g5vb4lotrzulojqhi5zlwwribze373a63qrn@rxi4kwyt66m2>
 <4f38058d-a2f1-4ac5-b234-228cfb2e85ff@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4f38058d-a2f1-4ac5-b234-228cfb2e85ff@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=686679cd cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=fKQzr7EGRj+VoE0XNsDNvQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=V26NVJm5TTlvxhDq-ocA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: HpBTe1sEflCQ5Rxf5CYHIojgk9sd9Lnb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDEwNSBTYWx0ZWRfX/Z+KH8NTIZqK
 DW/dZGdnvylgBXkq5TcNVf5pPMuTDZYtgABqs9zjtaDZQyZja0KHGfSvRnKj/S5X+7pMkw5CIUg
 dUJz3BmeaSUE965Lr/tXZM2Lt9BvxGbdwCf8IDHyJkY9YjTUPcOO6MXLk0FVLT/D25jWwgYmP1Y
 +6FU73rxf/7aPw8P8CeWhuGGeoG1I+jRMYhSTDAtC6dDYLjaoaEQHT4ognfwuyO3WgE2mLW574j
 ZnV9daTLPcfQW2SaCg0KiOuFvaAuIk8lk6mra4rEFggP4F5IF7acdGsDPq/F35N5EG3BEmaHmBm
 M1rOaDmTC9v7deNB1xPZE9hkja2vcSlNrV0RpbbAnH65XMfZinLYVcO4VD+SIOSTwEIFFBi6/YF
 Hhsrq9HZ2YfWNO84iPgAx6EJRZE/oQEUWELAI3woZK8reZ8TcP23+8vQCz6Lh2CnJ5JqIrU3
X-Proofpoint-GUID: HpBTe1sEflCQ5Rxf5CYHIojgk9sd9Lnb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=933
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507030105



On 03-Jul-25 09:27, Krzysztof Kozlowski wrote:
> On 03/07/2025 00:26, Dmitry Baryshkov wrote:
>> On Wed, Jul 02, 2025 at 01:06:17PM +0100, Bryan O'Donoghue wrote:
>>> On 02/07/2025 13:01, Vikash Garodia wrote:
>>>>> Anyway, in other messages I explained what is missing. You are changing
>>>>> existing hardware and you clearly must explain how existing hardware is
>>>>> affected, how can we reproduce it, how users are affected.
>>>> Exactly all of these i have explained in the commit message. The limitation with
>>>> existing hardware binding usage and how my new approach mitigates that limition.
>>>>
>>>> Coming to usecase, i made a generic comment saying usecases which needs higher
>>>> IOVA, i can add the explicit detail about usecase like 8k or higher
>>>> concurrencies like 32 or higher concurrent sessions.
>>>
>>> Why not make this change for a new SoC, instead of an existing ?
>>
>> Because we definitely want to improve support for older SoCs too.
> 
> Older SoCs came with completely new drivers and bindings, instead of
> evolving existing Venus, so they for sure came with correct code and
> correct binding.

No, this is a terrible assumption to make, and we've been
through this time and time again - a huge portion of the code
submitted in the early days of linux-arm-msm did the bare minimum
to present a feature, without giving much thought to the sanity of
hw description, be it on a block or platform level.

That's why we're still adding clocks to mdss, regulators to camera
etc. etc. to this day. And it's only going to get worse when there
will be a need or will to add S2disk support with register
save/restore..

Konrad

> 
> That was one of the reasons why duplicating venus was accepted: to get
> things right, so obviously your argument cannot be true, right?
> 
> Best regards,
> Krzysztof
> 

