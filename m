Return-Path: <linux-arm-msm+bounces-87332-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 56859CF0414
	for <lists+linux-arm-msm@lfdr.de>; Sat, 03 Jan 2026 19:42:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 627223009F8A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Jan 2026 18:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF0941A9B46;
	Sat,  3 Jan 2026 18:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UUyYCZxX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fCkdXAvF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382A0BA3F
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Jan 2026 18:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767465768; cv=none; b=XUsgiwKH7W6SvK79E8Py+gS/7HPpr4KGxGo6hl4vw6jzfndgsWDC5tYVdn2GQaltQUZ4lLUFe8oDPiDtrBJ0WeEb7TGGrQLfwlx/hMuAAjUaaSiPIYOH5aaAIc8GeU1nRq/s/2oqEtsKjkeyjs+BNh5itphvdM13aCVlJFfC9Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767465768; c=relaxed/simple;
	bh=LGCScZtYQpIGACtn8PWzNjTdFD8wxrn37Tk54JQA+co=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cbAo9TblwnZ3Eqo4iX2Xmr4iKyKAfQNr0hdkRMHf2mEB9IOmwr2CpBFTWGK0O5ALwg3e2tLGBAFhLlPbkVmo+mM5UK+PHme6C9Y1Zu6K9S5OneeukllGfAGstqN9Y/8QeSVpoHTa77BrGfOn9bQewqjLY3oKpRIJK8T7jhFSmMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UUyYCZxX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fCkdXAvF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 603HJV0E006642
	for <linux-arm-msm@vger.kernel.org>; Sat, 3 Jan 2026 18:42:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hw1GxSSEuEzvVreBw7PD4wzy2G86JsuRfE2o/kemx4w=; b=UUyYCZxXKBQTST8M
	NHTZJf2fK+YicJbx6K9RBwaE+kX3WO8G228rnPwfTOErbglW2kyDN823uxF5m0N2
	a7Vu7iFYbq2uS1qg/yFBNyo5ZiSnhotUORzDYalb8CDMgpKbXx05x4smZKRp4KxR
	JaSfTKhuD4zIoJ/Yy98uAk8bagz6rkqVpjqHzTXenJIFH7ZIgJDqNY+m5dQBLi21
	WGrPD5XHi0kP88XiHwbnHoLpbiLvtDTqrOCYqMZ14rRg0v6KCr3cnJ9drbWaEs2D
	FwPCD1fEFb9ur25RS+tMOXbcDx9m5FGMfCoa/jQIj2pHIZFo+lVqlNLAro1sXEiN
	WD6SkA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4beywdgjtm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 03 Jan 2026 18:42:46 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7b9321b9312so27584531b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Jan 2026 10:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767465766; x=1768070566; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hw1GxSSEuEzvVreBw7PD4wzy2G86JsuRfE2o/kemx4w=;
        b=fCkdXAvFWEcbk0r+lqcrVSnCefR0FnL57z0o69J7IADdIvYR3s3u8VE/+AR03efaxC
         80weukIKB+90ev7/W5he4vaMbpzIWFp8038SIpAsK5dz00t8bvuNBYnNimRXA2QYTuC9
         APppu3FV/yV2hk8jFo1ktjAaPN+vtFmKB4WmkA+8yZQAzu13lOMp81lXvrq1FWwbMtmP
         23KLPhBtajBHKPAb86zhtoBFzLpj8T5p9343PkGkb+Fvziw8xfGjiwACAiRIUFK5ZMx4
         atdttkpNfES4j2qD0KFlW0/Ie3sVFYvRhO6mGBBlYqRLkJ5ZkdKc/mxw1c7Y5FcWG3P9
         EfRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767465766; x=1768070566;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hw1GxSSEuEzvVreBw7PD4wzy2G86JsuRfE2o/kemx4w=;
        b=UPvr8RYe3af/qnEymbPjYJzu4LKkPnHthnwz3DbB4CxO5PwnusC5doZTDVbFg+/8ZE
         8CZUe8QRcpe7kOeJBM9hbUBrxWlCcMdskBdNDKT94ITFJkGZTl5l2WVcLzbHMLlkNtTG
         RY/Loj6pZ5ORZjaMkhy3jjuqOsqjeKjp8b1HDIHGHU7oD3j0c81UN8G8PGjnIWW5rLJL
         XAw/GFHDr7+u4tNS18h8BmCGDI9z4AiRBcsuFH2f9k6XmXSzh8deeafcAf64PsuutFQ/
         UGgVaxSvZbblut9hYaeamm0KWuuZvG1E96EcjXdOROBkhD7CCzQ9s6rfs/AicCtaHRSa
         T0MA==
X-Forwarded-Encrypted: i=1; AJvYcCURvChYnjFtpPpzqeN1x1up1xbYgIx2KZz3MRjvhos1jDTrquuDj+UT7tyDJaR5KJT4nVTcrMtVVejsMub7@vger.kernel.org
X-Gm-Message-State: AOJu0YwAJUzn5WvGQEViw8ivp8A+OzWcfUK6IpKGceuU1xWdFa8G2t7i
	mIVBBO8QAKLTs+vZG32DPoHhn6n8GL29VRpdDPJ87G3FGwAxLe/Win6iIbUcmeU39tMTbUW1+VX
	BTMq7iX8N2tL0EmF2a1SGW4UG+HrDNXBQud72Pa8tZj1whDLtPiXzf7z3YkoLwGM5CeUi
X-Gm-Gg: AY/fxX6sTiFkkVtxxtD8JxPA5LhsbH7pvwg6hINAjZr1ocx9raMjX9IwzP6eyyg7FPf
	lqy9byyrt3idJs8QWO53L5jAbRueaNOnLmiKo8R3ZBtnI+vhb8DexOUjCvEzz5d2O6WEDskYpaU
	RExj0NPy7Ni1ktcAFVhqCz8cJJaorPHsMaNgqt0zgkgNjR4j2drsAujP4LugHSREutOYlsgsXuu
	0gQqIdHAAfpl4CDKwY1lT1cns+NRTJdNwOiFIIdVQcMKS/EOKUe+u9zdzMfBGKzsFixpx1ylk7z
	YI7fxN2gXlrrL207mkvxn1cbhUnzzZmSWMkSxqGlRstD4PdH/OfvIXXjYE8955lIsoYh1fKG6fK
	QiPs7FcXca9euzRQBD2Beo5Rrg8VUYkfeKW1EI7G8uA==
X-Received: by 2002:a05:6a00:ad02:b0:7f7:3749:d97c with SMTP id d2e1a72fcca58-7ff657a37e5mr40323093b3a.22.1767465765500;
        Sat, 03 Jan 2026 10:42:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGQVx5ArkItgm3P3dalXhu5nbT23BXFFl3dDv5MC+trY9KiLsHnUE94+iuUcA835+N77O3fCQ==
X-Received: by 2002:a05:6a00:ad02:b0:7f7:3749:d97c with SMTP id d2e1a72fcca58-7ff657a37e5mr40323067b3a.22.1767465764958;
        Sat, 03 Jan 2026 10:42:44 -0800 (PST)
Received: from [192.168.1.3] ([122.169.221.137])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7a93b516sm43782587b3a.6.2026.01.03.10.42.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Jan 2026 10:42:44 -0800 (PST)
Message-ID: <07eeceaa-4f0e-4671-9ce9-8368c76e7d63@oss.qualcomm.com>
Date: Sun, 4 Jan 2026 00:12:39 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: interconnect: add clocks property to
 enable QoS on qcs8300
To: Krzysztof Kozlowski <krzk@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
References: <20251128150106.13849-1-odelu.kukatla@oss.qualcomm.com>
 <20251128150106.13849-2-odelu.kukatla@oss.qualcomm.com>
 <bf8fbe4b-d89e-424f-8445-0da2f80422c1@kernel.org>
 <ef51aa03-4478-42f4-88a3-510457c4b917@oss.qualcomm.com>
 <54ee48cf-9a00-4132-9ca6-bad65e08990a@kernel.org>
Content-Language: en-US
From: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
In-Reply-To: <54ee48cf-9a00-4132-9ca6-bad65e08990a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Sc76t/Ru c=1 sm=1 tr=0 ts=69596326 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=5iuJI5XSOpgSZ6Ruo5Rmiw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=E--YsjGbu3XWsEhLv2MA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAzMDE2OSBTYWx0ZWRfX0Y/1SkIcLkbX
 4xxYcntWm/HVOAAWSlX2bwQvujtWzC1rxe+WVtxAIClx8MaQlY92qt6Y1FQuWtKC0TPcL7MXaQ8
 6EC17TmVcA4GDJzdKZrcT+l4KH12Q/W7VbxHiWdk4EIlLhjCtJeDxIrENA6yGVZzdh1x7Prd3fu
 PugBbAZhONPB0vUVqLlS9tRjDZkyJO5bVr7Ou5nhtqAVizInvc/HA67Gn6NiAh1ZgHh7aRTm9ei
 z6i8uomiNHAIZVVv9/RwAm67mPqejqXMXR0S1pkHpSnUEZmlpT4Gv/ILkK4hTAMtDYpoYJFXYwS
 ZXvON2yIaBdnNpfALdedm1P4823uzwuFLynZe98AJTv+zabqY+ZSWPzjBLN0jxFeyIviIPiJ43L
 XdR7JLJCssI0IuuXyhw3bQ1uJrO6rLhRjw7qoT1Zqea56nD2wEUV5Jn4VGVbtT4ViTTLwxsjnFJ
 sV7pYgJEe+ipDfn/S4g==
X-Proofpoint-GUID: PQ3rkKEypwE26zjOjW0lovZbG9Dhh5Gk
X-Proofpoint-ORIG-GUID: PQ3rkKEypwE26zjOjW0lovZbG9Dhh5Gk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-03_03,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0 impostorscore=0
 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601030169



On 12/23/2025 7:15 PM, Krzysztof Kozlowski wrote:
> On 22/12/2025 18:38, Odelu Kukatla wrote:
>>
>>
>> On 11/29/2025 3:03 PM, Krzysztof Kozlowski wrote:
>>> On 28/11/2025 16:01, Odelu Kukatla wrote:
>>>> Add 'clocks' property to enable QoS configuration. This property
>>>> enables the necessary clocks for QoS configuration.
>>>>
>>>> QoS configuration is essential for ensuring that latency sensitive
>>>> components such as CPUs and multimedia engines receive prioritized
>>>> access to memory and interconnect resources. This helps to manage
>>>> bandwidth and latency across subsystems, improving system responsiveness
>>>> and performance in concurrent workloads.
>>>
>>> I don't see how clocks property help here at all. Are you getting clock
>>> rates in the driver of some other clocks to make QoS decisions?
>>>
>>
>> We don't need to get clock rate/frequency, just need to enable the
>> clock(s) for QoS register access for which we need to get the clock
>> handle in driver.
> 
> Not relevant what your driver does. Still getting clock does not improve
> system responsiveness. If you claim otherwise give me an argument or any
> sort of proof that providing clock has impact on system responsiveness.
> 
> IOW, don't feed us marketing. It's waste of our time.
> 
> 

Hi Krzysztof,
Thanks for the feedback.
You are right that the clocks property itself does not improve system
responsiveness. The QoS registers are inside a block whose interface is
clock-gated, so the driver must enable the required clock before
accessing those registers. The clocks property is only there to let the
driver obtain that clock handle and enable the required clock; without
that, the QoS registers are not accessible. The actual QoS behaviour is
determined entirely by the values written to those registers, not by the
presence of the clocks property in DT.

About the “optional” wording: that was incorrect on my side. I will:
1.update the binding so that the `clocks` property accurately reflects
the hardware and does not allow describing non-existing hardware, and
2.drop the “optional” wording and the performance oriented description
from the commit message, keeping it to a minimal statement that the
clock is needed to access the QoS registers.

I’ll send a v2 with these changes.

Best regards,
Odelu

> 
>>
>>>>
>>>> Both 'reg' and 'clocks' properties are optional. If either is missing,
>>>
>>> No! They are not. How they can be optional in the hardware? How SoC can
>>> have for ONE GIVEN device optional reg, meaning one board with the same
>>> Soc has the IO address space but other board with the same SoC does not
>>> have it.
>>>
>>
>> I agree, I will drop the “optional” wording and rework the schema so
> 
> So why were they optional in the first place? What is this patch describing?
> 
> 
> Best regards,
> Krzysztof


