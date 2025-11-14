Return-Path: <linux-arm-msm+bounces-81843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF16C5CDF7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 12:32:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6BE384E0291
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 11:27:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62930311972;
	Fri, 14 Nov 2025 11:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YvmEGhHa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HCQCn7Tr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD57129A9CD
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 11:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763119619; cv=none; b=bghLREgk31Ww1iv4CS6NXfCcT2cjsn2lBLF3aIaxPZ1D3R+qlesQCQlKG27XuhWUl+G8XWM+KLTmmcPa2b8Dj1p5gFceZl7oyF0etKjwjJEosD4YhQ7V9hZ6FLjwBXCioN2h+a/idb4V+cLCHspRX+b6JllFwlggbMF7y7pKMOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763119619; c=relaxed/simple;
	bh=FjgcuY6SxnUFbFV//lcFGoEp8mOCm8RF0YZOkQurjI0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NLAX9gC0jGxN0i4PBsWwLigjoKdW6syN0QM7Nho+/NHUSq8lEOSaQbrLRZ0abJrwQTf+wkvCHV4EXk5xJ/2rISs8tmVPery/JU5wI0AiLVJCwbbTQABw//Zhb3rHtWxrNXUe47TqGpPE7veMnmCCiZnofyTGlx34agaWL/w39HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YvmEGhHa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HCQCn7Tr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE8JIdR1477709
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 11:26:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xj6btczQP9EttHmyg9oi/yzZG5tH5YacuDZXJnwTFdA=; b=YvmEGhHayMHB5uzm
	enctitrc46sCoSYts4Pd9jZjRcyEUid2Ik/mbTzm8syTdh4h4lXKq37hSw8lTm8u
	Yhy8xu/xdQxTek7UznfSUHnt7Unsi24CjmQHL3RP0QBVu7uPEq+iTY6nQGTFN45Q
	GGAap7UTFISWYeA7ukX5CUosV266vxpbLt6zcavgnyczJO7ANnJaxrfLwRCxQq9R
	u8ZYGBePYg0IyQ/Zzu1PDGTHB74DtlwOFi90Kv4Dh8PSZHso9CgSO+WOGtPeU+Rt
	3iD78ZHcicHcJHs4x6j/DiT6z8TlLjfXAuNPUfpaZR9anLgM/rs1mo1BsMjgydUc
	JJgxmg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9dsy40-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 11:26:56 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-340ad9349b3so4517939a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763119616; x=1763724416; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xj6btczQP9EttHmyg9oi/yzZG5tH5YacuDZXJnwTFdA=;
        b=HCQCn7TrTDGlfi/b6A1mRsKLAsMWqKThV7/VKGPBGd+hoRiWvisTmzXDjFLevCUdMQ
         5cyOd/7MWaUFDtf5IRnp5HAu1v083ylZ5Hfwwwl/uGYoOoFKhkxil72tt8OxgxD4Lu4l
         VV+BzgonEiGJOpruutS357e+O9ZGRj7tJiGtDJrHjV0eWK9+lnLpb+x+AIyjeO9ypjk3
         w+0aWRc+6ZQqycTo+sXW/9V1p3w283cY4Rdt69LcN6fkvoqzs/JT7sd3xpExzJm2LIRD
         rm37cdxsyXOcavs7fIXw2E8lZU9QOo/yYnd9Uv2m/6lRmWQh0gpjrYjnDePAGnVJFudq
         d50A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763119616; x=1763724416;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xj6btczQP9EttHmyg9oi/yzZG5tH5YacuDZXJnwTFdA=;
        b=GxzKUthIMARfUaMvTcZXRk8ksBReuiqdUvKq0yNwYJTScCfpCF+GZP+kvS7SGmQYRk
         bUUno4kO0S8rADCn5jFnu8/35M7nB7ex456Mdf3FP/i29pa83/zbcQfmvJze1xS/NSqs
         AUp/V5ffXbjTuJIsW/XZY2EdmXktgqvVCYyQReQm7+w34odQIMstVPnOZ/5D2whFX9MP
         JkTH21T6SQ9RGQZVNVle1T8JKrA0NSVu3uXPnKL8g2uJysnwAdl49pCSx5nioUAYD0U5
         yE0gcU1+jr3P3/i0cs4LqH8mUNvF25NlposuSPTtfVTt/lTZ3JfdWtMWFCufcn54Uqdf
         CFPA==
X-Forwarded-Encrypted: i=1; AJvYcCUgbtSE37oSFIQpgOb6+ZSfyNE/UpZSI3fXIOLpjQ+LRRGIcpSGKoA2sq4KxunSrIlviFo+5HVXDgA4pPop@vger.kernel.org
X-Gm-Message-State: AOJu0YyhDd8km+22WoY8zzpy+P6A3+GSl8WVLe0XnXtHj2q9hHEGuKmf
	WGRdHTykGQ1Tp4p95TzoYn9cqwzG5qRYxhUEyDULTX1riFSLkJcVAO8JYcGGco6VfZ6RClvdtg9
	wNdI4UC5vGXJHvEjMhVeNglFS/VE7LuMPr9gc6/s2CMoDTrXNbN38AR/+NZqT5DF8/pT4
X-Gm-Gg: ASbGnct3NIof33MRvfjWI/PSViKaRvUbG4ipRskHxYRD8M/RMsX6Zf15fN2ua067ZqN
	vJ/StoKe70nu3fsKbGT0jVs+lYOEEsADtTZiYg1pC6Dg7ZlVmkhif3c36DKe8PhpZlWU1fO99P+
	9GpXOdk63yGL+mQRbBvdTdcDQUTFnTdZFHcIZyH+p45Zfzfg5Cwuv0V3g1X1in0Xm4E1CkW/65v
	GBiAKsZBNB7Nr738wJ99xtsqVjHoKN1ACSgUEOraAUto9RpeQ70HOVYn9CnCT+ufXenWepldwq+
	0mgKR6OENXzchd9eeVtcNkLATWNkmoyEkIhjQ3VzF70hAsecGyT+uipJ4uNF/rnbrxXKnOhHaxv
	HrQvSKkPtflcaM3Rxk7y4TZs=
X-Received: by 2002:a17:90a:d408:b0:33b:b020:597a with SMTP id 98e67ed59e1d1-343f99c1cc3mr3251179a91.0.1763119615947;
        Fri, 14 Nov 2025 03:26:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFgKCyHJGBBYPB4qZv+EAl4Tx88PJN32VSjZcg29sFOWP5dg9DS3lwkBEwjYg2dmQ/BXtGF2A==
X-Received: by 2002:a17:90a:d408:b0:33b:b020:597a with SMTP id 98e67ed59e1d1-343f99c1cc3mr3251153a91.0.1763119615473;
        Fri, 14 Nov 2025 03:26:55 -0800 (PST)
Received: from [192.168.1.8] ([106.222.229.203])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3456516c622sm167599a91.9.2025.11.14.03.26.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 03:26:55 -0800 (PST)
Message-ID: <76523142-b337-4a31-90d2-c8477ef0b270@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 16:56:45 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/21] drm/msm/a6xx: Improve MX rail fallback in RPMH
 vote init
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse
 <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Connor Abbott <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
 <20251110-kaana-gpu-support-v2-11-bef18acd5e94@oss.qualcomm.com>
 <dd32a5e0-1dd1-484d-8fb7-8f6c506c8c83@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <dd32a5e0-1dd1-484d-8fb7-8f6c506c8c83@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IaiKmGqa c=1 sm=1 tr=0 ts=69171200 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=UUXEStRZTiKyGgBwSCQbmw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=lZFDvItL9zSOf8gjBGIA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: ZYAL4XMlAbFK4HoiNnR-z0UfAqk4fZjP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA5MSBTYWx0ZWRfXxR80Pe+GAoXO
 IsO3+dvvV+fwQq3ahjMYP4JPPdr/ZBC/l0Us7Ns7MEC4+q4UBCzrO9oqR6uSqh1jZY/EWQ4xBrB
 74NSohC6E7H3BP/iVy22XCJce8L6DzVGl3XpnNlK6RxntocJZqm1lLp5UcbkhXj82NkJ9n6J3xR
 qufATMq8SddKpQePJe4F7RKaglB0S/wCc+OWEGX1SNch/ah9+UGtT2FK9SefKO3aKi+y6U3LpTZ
 Rmnap795H12fr/S5sjJSl+FOcO9cr2SjIg4MwWLMG5klvvI051dERk1PDN48X7YaCJBNc82vEfJ
 toyZYpWVf8swuTfUOKqMr5ab5m5A8RmYv0JJOcG+CchwRw3SF58HAP83DiRzQy4ryvJljOvfw1Q
 F3aEntdYYuTh28aezYi4qtq+2TZmmg==
X-Proofpoint-GUID: ZYAL4XMlAbFK4HoiNnR-z0UfAqk4fZjP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0
 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140091

On 11/12/2025 4:29 PM, Konrad Dybcio wrote:
> On 11/10/25 5:37 PM, Akhil P Oommen wrote:
>> Current logic assumes that the voltage corners in both MxG and MxA are
>> always same. This is not true for recent targets. So, rework the rpmh init
>> sequence to probe and calculate the votes with the respective rails, ie,
>> GX rails should use MxG as secondary rail and Cx rail should use MxA as
>> the secondary rail.
> 
> Is GMU always on Mx*A* and never Mx*C*?

I believe the GMUs we have so far are always on MxA when it is available.

-Akhil.

> 
> Konrad


