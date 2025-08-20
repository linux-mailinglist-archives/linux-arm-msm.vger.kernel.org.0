Return-Path: <linux-arm-msm+bounces-69894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE5BB2D71F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 10:53:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 758C13B67F8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 08:52:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40E232DAFCC;
	Wed, 20 Aug 2025 08:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GhKKNkil"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D442DA763
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 08:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755679893; cv=none; b=Tcbp9muZzbZFBLO8lfkj7mqUXnNI1lVBfHcklgUeaeKSU3sF0mqaNQrUzy0PmSKFi38GApCWkclxMqrmOT4HEHc/+HpbSqs9sD6uQ9NqW0pFIPMvnGYtaY32c4QGws2NtLp87PZEqm0l0KYcsxZEcC+GqjK94daIk3y5xAP314g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755679893; c=relaxed/simple;
	bh=/ds2ps/9fiQfLgnyFNZdjYCVb+MpjXSLLk6Lrhal8gY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V91BeuKKKNFgM5QSSlGgbeX3yTezrpvz6xmaPWzZInnNDllQRGeCZWXGeG3WqDUWa6NGArXyPWyBHa8YF4dEYiBS0++HWkzV3vhha3aZ5rK94J8rsk+/ifPHkBGK1gQzNqzeCYnJMs4r12YbrDovk2dq1kIaaEmkcaGvTyEOKTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GhKKNkil; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1orgI003908
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 08:51:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y4OMPtXQhdfS1IUPfrekUduc3f8tO3YSwKKo5NLCOZQ=; b=GhKKNkilIu9G/9Ca
	eNi6oFbDH8z4Sd+aRC/mlkWsbAJFSgM2bzmI3ygq7x0rs4sw2R36/Bt6ST42zrQ1
	U7MNMRdCd6uN0zoNCbWXHRxOyYXulay+DxAQZzvAdkQSQFEKOv0mRsYwTbXW3TM6
	VzWSlcihfaXgMF3Kovl7GWHRcuqHzI05IAGzV2CQZ4Aj/h26L32aomHpoFQtcvbh
	5rxbTiIXKS3LCbTiGvidjupSmFwh/YdJWa/MH4FFu5hkd1/iMqHYRHPRSoRZaPB/
	8q0DwSLI+26DrZvp+7uJemkGCtMTYPsKupz1CmcGPEOLslBdDroAsb2zHr48j1KT
	24cXUg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52ah1w4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 08:51:30 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-32326e72dfbso11860788a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 01:51:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755679889; x=1756284689;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y4OMPtXQhdfS1IUPfrekUduc3f8tO3YSwKKo5NLCOZQ=;
        b=oFT5esbDvsVtnHrvsOp2+dImig4wbi/b9bMDyjl2knmTQjkzIaII9p3DwQpAsleHrg
         hEc1YHXjvCvAXwVi20GHEXNrGKaU/SV6b2UP2d/XtSlONDzvTrySxsfX2tiLaQF+xEMB
         b4kEtWNUzVA1VTkAtltxxEgE10y1XWNoi4kZ6nFDNt55D4v0YB9jWnSHCE7hn987ZR7Y
         gs9RbH0tcaGJUS7qzP1H8EPmk7uvyZfDjfIN/T8PH4jgOj06VxdTYCN8COUDAsSexmjo
         YejUZ1sYdzZfNIGeK7ryK6Z3PA95MgpEL+qFyFfDGlSPrq2zDepAS6w8Hmek8+8r4AYB
         tBug==
X-Forwarded-Encrypted: i=1; AJvYcCUBDq8l1vyDFXTlyHHqehL33Kt7ZNklEVqja/Xu9amyjc4vPEZWHPBMDkO1G3vwYl7A0GjAiKDOZOjGos7C@vger.kernel.org
X-Gm-Message-State: AOJu0YzhzkDYXfzXvLvba2DsKFV1e94JJaMwFUKVSi1HiudgGBIWXJkT
	9pDDfXQyPhtQX5AArOSxZ0nFLTXRwBDTiPswgIY6V7xFHOANMfNvM1oSJpyMOWNKunFmfJdgj+I
	HUmWka5b7dtSF1H+0ewj9pb38x3m84R5Twm2xtGyKwRVyrHC0HPJDaBZ2seveuQVL67Rj
X-Gm-Gg: ASbGncuNezb+eVUSzgg7FO5jrwYq4Fhw1Xi3G9iCg3/yucp6sZv9cZUOkxeDkpg100S
	o7EiMTFlfBGyQRAVPT9AUHbqU8DxjUV4BkvZEaoabT1dS8nHbnFpaBX9GtUhxca9N2DTs5iA9FN
	RGXhDuQxp3F73dPGFjrD1PlMtjrq47ClIVA0/5rajCHZfMIShfmRDGXk14P9D5ymxvdvoIPz9YX
	p8Z2QMIFtCOqWGghFOYSAnLkZfqjQUWevk6TDbPLX7i5X1vr9YzW5uxOCLUf5VLF4+6zUH0i1Pr
	qTcLwm4VDUp4yewpupaOtp30L7rmH/AxSGAUTIuByYtEE6hsD08z0oW3mIJYwzTT+UaLIvH+
X-Received: by 2002:a17:90b:48c6:b0:321:c0e3:a8ce with SMTP id 98e67ed59e1d1-324e140d2b1mr2658902a91.22.1755679888785;
        Wed, 20 Aug 2025 01:51:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGT7ZIz0JNmDoMWE9x4Ai5P9gO4JkYSgLlzLle23lvK2iLaSkN70tzxtR9pL+Q06Be6RHXqWw==
X-Received: by 2002:a17:90b:48c6:b0:321:c0e3:a8ce with SMTP id 98e67ed59e1d1-324e140d2b1mr2658869a91.22.1755679888241;
        Wed, 20 Aug 2025 01:51:28 -0700 (PDT)
Received: from [10.217.216.215] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d0d1a44sm4787237b3a.1.2025.08.20.01.51.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Aug 2025 01:51:27 -0700 (PDT)
Message-ID: <7d3e5cf7-4167-4005-ba4b-c1915c254705@oss.qualcomm.com>
Date: Wed, 20 Aug 2025 14:21:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: interconnect: add clocks property to
 enable QoS on sa8775p
To: Krzysztof Kozlowski <krzk@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
References: <20250808140300.14784-1-odelu.kukatla@oss.qualcomm.com>
 <20250808140300.14784-2-odelu.kukatla@oss.qualcomm.com>
 <90b51e31-3217-4483-bb5b-ec328665a723@kernel.org>
 <28b97952-1b67-411f-a7fb-ddd558739839@oss.qualcomm.com>
 <ac83c453-c24d-4c4d-83bc-9ed13f2f9d1e@kernel.org>
Content-Language: en-US
From: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
In-Reply-To: <ac83c453-c24d-4c4d-83bc-9ed13f2f9d1e@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1zE2-VtnqhWimNK-9AKi7s8EbgG5Y77m
X-Proofpoint-ORIG-GUID: 1zE2-VtnqhWimNK-9AKi7s8EbgG5Y77m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX/BrGPvhdx74P
 9tXZCUuznHLBJ4uQVk1uabx1Fdxr/OWWcZm50xag/iixLQLKVHAjqG8AdHUwyKkhAKwrnKpo4nW
 d+sgRulHK3hmgHgmdfQwJCtdlbBcl1ZLfYgy3YVmgI6tiE/ofuk4DNExB+uGf+qNJm7w7WQukvX
 hUyL8M7yBXj5SyIAI7DkvgKKXWTb4C5wu7NpgQDk+PNVJiN5HDAhCu5a1NIsKZ8YtBcLikHDPIr
 c9xI7pIja5QmLRXWEfk/UmKfrvwb7AQOnyEjmYWP1N5isBNb9U0kX4sk5Dbfc13lcDLzCcW2/jT
 WfQPMMpvyZ5qJhOhbifaTaRfRZqVLrYpHgYApbfx96WXBuy5fhlqicYSDe1dVkuZCG87e4o9wJg
 wa8yDTtwgCqhsx0ql28hvdW4oKozDw==
X-Authority-Analysis: v=2.4 cv=XfbQDI55 c=1 sm=1 tr=0 ts=68a58c92 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=tJ9fhpcgm4yphQaQ0K8A:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2508110000
 definitions=main-2508200013



On 8/13/2025 11:32 AM, Krzysztof Kozlowski wrote:
> On 13/08/2025 07:55, Odelu Kukatla wrote:
>>
>>
>> On 8/12/2025 3:47 PM, Krzysztof Kozlowski wrote:
>>> On 08/08/2025 16:02, Odelu Kukatla wrote:
>>>> Add reg and clocks properties to enable the clocks required
>>>> for accessing QoS configuration.
>>>
>>>
>>> Nothing here explains why EXISTING hardware is being changed. I also
>>> remember big discussions and big confusing patches regarding sa8775p
>>> (its rename, dropping/changing all providers), and this patch feels like
>>> pieces of it without proper justification.
>>>
>> Thanks for the review.
>> I have added description in cover letter, i will add here as well in next revision.> And this is hidden ABI break, no justification, no mentioning either.
>>> Again we are discussing basics of ABI breaking patches?
>>>
>> If you are talking ABI break if we load old DT which may lead to crash, we have .qos_requires_clocks flag which takes care of skipping QoS if required clocks are not enabled.we have addressed this issue through https://lore.kernel.org/all/20240704125515.22194-1-quic_okukatla@quicinc.com/ 
> 
> Format your emails correctly, it's difficult to read.
> 
> Your binding did not require reg and clocks. Now it requires reg and
> clocks. This is called ABI break.
> 
> Please follow Qualcomm extensive upstreaming guide, it explains this,
> doesn't it? Or follow writing bindings...
> 

Thanks for your review and guidance.

I agree that adding reg and clocks properties to existing bindings is an
ABI break. The sa8775p is a relatively older platform, and when the
interconnect provider driver was initially upstreamed, QoS configuration
support was not available in the framework. As a result, QoS was not
enabled at that time.

The motivation for this change is that certain interconnect paths on
sa8775p require specific clocks to be enabled to access QoS registers.
QoS configuration is essential for managing latency and bandwidth across
subsystems such as CPU, GPU, and multimedia engines. Without it, the
system may experience performance degradation, especially under
concurrent workloads. Enabling QoS improves system responsiveness and
ensures more predictable behavior in high-throughput scenarios.

We previously discussed ABI concerns when introducing QoS support on the
SC7280 platform. To address this, we added a .qos_requires_clocks flag
in the driver, which ensures that QoS configuration is skipped if the
required clocks are not defined. This mechanism prevents crashes when
older DTs are used, thereby preserving compatibility.

I will update the commit message to include this justification. We also
plan to follow a similar approach for other platforms like SA8775P,
where the provider driver is already upstreamed and QoS enablement will
be submitted as a separate patch series.

Thanks again for your feedback.

Best regards,
Odelu


> Best regards,
> Krzysztof


