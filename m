Return-Path: <linux-arm-msm+bounces-79396-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 757CAC1964C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 10:38:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 204D04EFF40
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 09:35:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 701C2328638;
	Wed, 29 Oct 2025 09:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HZTLtbVI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="diWlTxH0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E02310635
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 09:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761730531; cv=none; b=iQAVPKAbGIB8RFEuti+ly6HcF/NQUjtO+YRJVjTRdS66T2mT2SygeE+PC8x789UXsjTCx66Syn9KoIEcIWynm6P9gu9CkLunm95hMRzYsa/wI+0JXJp4VREO5jFClF4qCYcKgE1907iwDs5uco9RDyRh5Mfx+jHtTjuYualQoXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761730531; c=relaxed/simple;
	bh=NgfyWXD4ZMuCkyaN3+/uoeoSemySMrT4tQNuxgJ6Tl8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZlUxPsabeWM3YEncqqJm/uscLxBouSvVhqLKzOHEhhkJdW5DvwsWNOzndeYfeGdpdtJDHM2iEcjuoIZJMRFhCnqfx5TUxdJ7UlFW0fRZ1+ymZEfq1hlv46U5xYQt53l5k0gSpVvI5yygfy1wya3o/xBlsTJ5XcZKr3QfofD6BWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HZTLtbVI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=diWlTxH0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T4v93a3764533
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 09:35:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FJeGESJ/n35Xq37cXnQAMlzhqerXJpjFv7StBPPW6Nc=; b=HZTLtbVIfaBwHupY
	1Gdt5SJCj7qX6I8zBP2cMp3lCgpuQh4uFGHmpTD3MOtoCEqeD5mbDUbMgFcVK9C/
	Qh6EPwOd3JmmWBopEa821c9asfvR62YsFGCHzo2+I8bordxus1H6wutc+ZZo9ci4
	eWQLIfPpo/hiHaeHB+TDn3cf2jP1P55UP9BlnbsB9ktNhsXKz4VBWnEnc73DmsiM
	nrXMwBI81mkw6v23ScllVWHIC+S3EmeQVXk2SoBRghcpfBwaMkx2gDrxjGjWiIzA
	Wj11JOM5iJrVkequeioJNMo8MWqFPhqoih3yuHcjcRmNBmmDcDdLYpCXeiIzN0cx
	5gQMug==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a12108-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 09:35:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e894937010so197376761cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 02:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761730527; x=1762335327; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FJeGESJ/n35Xq37cXnQAMlzhqerXJpjFv7StBPPW6Nc=;
        b=diWlTxH0oibIWIoCpYXEAb1v4UNn+AcydGwRWs34tHGNsH6Ra2GnRieDNm2xJkc9ra
         n0+2QalcIGopycTpjwCHpbnfeqdzcBcFxwB3Inn5m7Mdn3tfqJSnKzowfXFRKP9cYSRp
         mGJGgzfKm2P5hRTMIpBRXk49BWAmyYVhlHGNcTf+qN1MFXTU11PQURwOdEC6IPaq9Jdq
         c1aOgF1NUP2tWfbuW01a+PUvRtRAGXmcWDilYDGS9Lo4AEoB9nzn2zstYby+KLNUnoGH
         DSxL+RibRyhhFdZup4WTzEci2fv/nHDrWG+U1QLFtGTKNAvHC2iih/iLhzs/J3I1DFmY
         nCYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761730527; x=1762335327;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FJeGESJ/n35Xq37cXnQAMlzhqerXJpjFv7StBPPW6Nc=;
        b=TWSZG0Ar8PQbUAE+jvUoGbyz897JwLtWdldmAuj9WxkPWNlJbldAYpFbgTTgkc14K6
         jSDPJxjZJIcY7Rh3n6J806xuG+tKK6l9Od5UL6Wvrw2LOTMVUrGfUu9LQk2a07PB3niK
         8xplkGA3uc/9YNF+8tBRTnVeWY9CUTyoSBd0Dkl/Dagu0xIV5XaR2V6Sp6kWQGwz3zVL
         Cy17rhukvLoI5CZJiEEfHR1DhuRPIdcu6kfK5SxLa+irk5bMXPcw+AU49GfKGXELhLoD
         iFMQvYz4B9SY+6j+0PEuEE9ecgaxDmOTpJNCulX8wS157a6kPscLwdLoft7djxGW4f9I
         cucQ==
X-Gm-Message-State: AOJu0YzL3VMm1+IL0h2sVfudN34GNkoayqdUbnEzFKAAhpJtRWTi7ri5
	P362JNa7Ihk5ZIXvalaC94jilaJeOXMOO+T7YOXqf6xQCxeBQ51LCfRX9CFXOes9oi9AdxzwfJ0
	eFtd5N74yZRAN0M7D5Kr2I9MqnGh89kVn3hyPe7jY5EsKJyvrWVB6MvObr87I9U89xgfHoj/n9C
	QA
X-Gm-Gg: ASbGnctJZz3AAEikRasIltSIOOIbTtVnkhUquD4ISZ8pK6OdWqwVf5IylTyvDMHiKB2
	0vzaw7nJFvpmECflJYZXFjKeDutikTZfjnIxnTwvKfZngdG6eqw8Pbqel01QVSrI6mHWetH6oPa
	Xw+rMxxvtpNadsvQXBUbeK0nwpfH+7kItu791E5BV1l5wByTuuetPZOuYdHMB8u18mnQTCjruKs
	H7gM0CWJ4O//FwUSkTzFJhzmJpceoQDXT+hFRPzAWZPko772RDiKBnTdjZogYuZ8LgrIYPnhsJr
	4HhmaHJMQtXuHAvIp3AAZzGr4LRRASzWDKl1z4F/XFrmpuH8PEWW9A9RhNwnunYCrQ7CNh02I/Z
	vlTlDFY/8l7G4+FQMfXnx34q1789RxSRzcnVCozJk1he54qovyWsKjaJvyWQouFD5oFMl2MXvQJ
	0kXA==
X-Received: by 2002:a05:622a:56:b0:4eb:a2ab:4182 with SMTP id d75a77b69052e-4ed15b5970emr27737551cf.22.1761730527384;
        Wed, 29 Oct 2025 02:35:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrRwSSecdIRfs936+1xe5RDYK9h1uyw0BYIZUGcu6vRuRGwPaVc++qS+lMTWMFUdJMj22VSw==
X-Received: by 2002:a05:622a:56:b0:4eb:a2ab:4182 with SMTP id d75a77b69052e-4ed15b5970emr27737401cf.22.1761730526925;
        Wed, 29 Oct 2025 02:35:26 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::4c9? (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::4c9])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5941566452esm133254e87.8.2025.10.29.02.35.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 02:35:26 -0700 (PDT)
Message-ID: <51f10d4e-3962-4c20-9d5f-afd0ac3f598e@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 11:35:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] arm64: dts: qcom: cleanup GPU's zap-shader node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251028-dt-zap-shader-v1-0-7eccb823b986@oss.qualcomm.com>
 <c83079bd-ebd2-49fc-ab62-1fba08276cc4@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <c83079bd-ebd2-49fc-ab62-1fba08276cc4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Ii5N2H5pYfy_m32qYUA7gWukAXjYwGgL
X-Proofpoint-ORIG-GUID: Ii5N2H5pYfy_m32qYUA7gWukAXjYwGgL
X-Authority-Analysis: v=2.4 cv=A5dh/qWG c=1 sm=1 tr=0 ts=6901dfe0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VH_4oVhpAmBFcI_Eq3kA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA3MSBTYWx0ZWRfXwHai/zn/lNIL
 ibMpMgpDg5ryhQh6P/Qjc2fS5zRILmXOa7OX+09vhh6klWpjUQ6B24ORdxuln7u8Z05fGdG7AS5
 ZlwSSjvAEw0pB3f5JA31tRmc13wCBHRAvBcYXAYtKbBPgyrqIAa3QnYjHWQIGGpnaNyon8N5kUp
 CaDAQFBcAIyU/Mb2iyVLBEy6x/x8dh3jZb+hCgR6XUV8Bsw+zn16fCACDnkuY1DhU7ZxybZP45W
 m9ZA9YjW36pOWvDGhg+5p2ZASdSzzkL1vzMlS+OkWt982VDmtLCARwYetgLWkofjLzrH6V45xKZ
 kAFE+e+J4y3kDYYHx4hCZPJ+EkaBU3s4GmrtksTSZbaX5Zh0gs2XepHYORNjQJ27yy+0ObOCgDl
 ggh8T7vCK8MVV4tl4jgM0JejcF92dg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290071

On 29/10/2025 11:33, Konrad Dybcio wrote:
> On 10/28/25 9:59 PM, Dmitry Baryshkov wrote:
>> Historically all devices manually defined GPU zap-shader node in their
>> board DT files. This practice is frowned upon. Add the zap-shader node
>> on all platforms, define a label for it and use the label in order to
>> patch the node with the firmware name.
> 
> I'm not sure this is much of an improvement, since at the end of the
> series, boards still have a &gpu { zap-shader {} } section, with the
> inner one not being referred to through a label, which reduces
> duplication in the single LoC used to assign memory-region, but
> doesn't e.g. prevent typos in the zap-shader node name

By the end of the series the boards don't have zap-shader{}. They use 
&gpu_zap_shader { firmware-name = "something" ; };


-- 
With best wishes
Dmitry

