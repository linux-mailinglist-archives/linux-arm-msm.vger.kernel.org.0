Return-Path: <linux-arm-msm+bounces-85491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FECCC7683
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 12:45:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 68E633054C89
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 11:43:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7E35313E2F;
	Wed, 17 Dec 2025 11:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vdhf1FWP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I0fVkXwd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A9E31C58E
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 11:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765971833; cv=none; b=cOkzSxRWS147yg3k3dNpSUKa/YKN2/p3dSkSTEd+yZtqIwjPhouvc6SuZ03DWrbaYWISGIXkjhI/X/qI37DYzNE1LtO7ab+uulTvOLc3Fo0odC3V45ceYRkhmQ6vuMvlNXwJa7yB2auzfqntyY936vwsO/wQnS8Af59qRBvas7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765971833; c=relaxed/simple;
	bh=AOLk/fdBiFe7VPddTQoahAL+GlZhzF/mifTE/7Ua7fk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QnLL8UFwFMlBxDvBEwIUxNcryTlDu3k0smahb2vtDzh3Gt/ler7jgS2cyE5aOsait2D/lJcDlYyIJdsbNF+NhDU3YSvhUC3Sh7ooBasgnMZVSHzQNK/w8NsaAXl2LmCgGoLbKtcMdyPEf+dlehzFc5NxgEsf/q84IWlbxccWZHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vdhf1FWP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I0fVkXwd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHAAhUZ1500905
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 11:43:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ihQcqrukQ/c9+YuZ0oNpyvOSwvxDJPxiaGKm80UrkQU=; b=Vdhf1FWP88mUbqhF
	2X9T/LZgXIcTZrNqQAkOQgRgVNCMyTyyvPUG8dCmdFui3rrh890TGEOBSlLUQp1e
	TW2gLy3R0xEpLtZQlBZ0QCxPmrYreFWT5f1gk+p2cu4mFwK419AWEt5TI/r/D/2Q
	EaDFLpgIyk6JgIs5IcpBbq4aMEaq4qb6qgVgJP5G3w4ZsovZUsqzxfk4DYfYFpk9
	hmFSIv5FgUMEZySIYfCiSiNUk2zUJxySfiSKMQgzSDQgE7boQs2RrvtZXINo+W1A
	ME0sNCAHizLfz1BeiMA/C7FJ7vm/R0f29B85rrJdlStZ3svwzMetIYHiQJlmJhsx
	NTbVIQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3kkesn7p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 11:43:51 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88653c1bab5so21241326d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 03:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765971831; x=1766576631; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ihQcqrukQ/c9+YuZ0oNpyvOSwvxDJPxiaGKm80UrkQU=;
        b=I0fVkXwdYwp+lgctL0pG6JgL8rEIGIO+YmEG+3zaMiar3gvxCBVm/y4uMDQRUG2olH
         e/SYWCPJBg339JtgbXXFqndXT2osa06njU2u+lxSjAakRYOZbVRksUhwdhqKryvV+ny7
         0PNEhVrn1mQ7cZPrPr5M1JgN0NZELfZFMNUiW30ZIb05UISl5NFydeZdZUqdbNIjwq+j
         8dFaBcRJwUQMIW2+FiYu4o2F7Qi5EkJqz4EpEzRQLpgGQM9m/OxSKFBzAgmkIAUvRym3
         X0jSo9Qs8qTkQsmQj2//7OswwICmwaLHHQ3yazyiN/eYrrk0+wH3u9I0tQ9OgmOIVIL9
         RJYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765971831; x=1766576631;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ihQcqrukQ/c9+YuZ0oNpyvOSwvxDJPxiaGKm80UrkQU=;
        b=DORB3p8+gszfDlXLzEOdAEGR/8ZAlxg56WMM+rx9hBItLDdgdWIxb8obo698wcINut
         tHQe7NXPWumpSWp020+98babKyAj3NdQ8Vjpvj/F51M5f0XrEoXxRwTsjLSN5mz5sI3O
         s706nc5+iupntAQkQm/B+g8EpyaM5RKdSi2+P9jptr7OsFU49Hx9yVI/G7SHJBMwEAjV
         huM14UHyyusuIAWnqeGShXNIBD5qRLj62L4eF2s6hi9AZQbJM+B8YRnlsUjmCL3pru5C
         naGWrRDZEJ5bzgFlZboyP9TMbxB7gUkpfYbRP4BNcfJVY41/o6mCNfkTSiLuolzSjS73
         O58g==
X-Gm-Message-State: AOJu0YwYDj/MKlTBwJAByOZQkgJ/mVQZezZng1ZR0Nuh/fJ/C0a7V0Ql
	X/fHazXWIFoE6p077RfeqPasXa/IamF32A0xZcJOB5hvGlF0TfeUykX1dIWgA2gG3lST7mmJEV1
	bsFSiJ9Cg1v6v5wM6PzjK+dSpKfmyP+vvNsnt0OW0263+9BS5wWnrzsHV1vtxOiTPJPCZ
X-Gm-Gg: AY/fxX6Jrwsvkomb7jxo4KxW55GFoqzyDibJmZlAelgd9tAbTJgEkLQAWHM58pNQNmd
	+dWek+VWnQzgiKtWDDuu03CWFGC2lUHFA5R4vxIToF9v4Z8kizNAymJ4IVU4uzplao2nIkVmLSK
	UmM5qTvQc8pLbHPOpggmyW1cYHBsEI7kFpq9KUNODNpTzGm9c+Vj4O52sxAuWs0qQLUkggsP0zX
	hYijWjp3wihUZgb4MTK1nclKe8PH1tmGMLkxKso2GsYP4Ae8baXmOXkQTUDQHemrWstlmNM04tu
	J3Ezi4VfhseHI5Jk5LxcaMIq7SCcNSo57HzcXVHGrGzkHNab3j2aNsn+AnLK480KVqxP/bAKYXJ
	is9SmCnmXvOgHPKWe4HDdK3ALElQmLeBw9BIQqxnpWweHQUMYkD6w7iJ1ZQTG9Or42w==
X-Received: by 2002:ac8:73d9:0:b0:4ef:be12:7b28 with SMTP id d75a77b69052e-4f1d0672490mr128131741cf.9.1765971830730;
        Wed, 17 Dec 2025 03:43:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHAgKwfKGGZDctaZIOos+XWywvYp44BmYdAOut+z3apzNeFOakzV6Yya5sv5OGB2G0AmUYl3g==
X-Received: by 2002:ac8:73d9:0:b0:4ef:be12:7b28 with SMTP id d75a77b69052e-4f1d0672490mr128131511cf.9.1765971830268;
        Wed, 17 Dec 2025 03:43:50 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa2e817csm1939729866b.19.2025.12.17.03.43.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 03:43:49 -0800 (PST)
Message-ID: <c3e6664e-5de3-4423-9953-fd0a5cbc45e8@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 12:43:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: sdm845: Introduce camera master
 clock pinctrl
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20251217-sdm845-mclk-v2-0-7028c2d09145@ixit.cz>
 <20251217-sdm845-mclk-v2-1-7028c2d09145@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251217-sdm845-mclk-v2-1-7028c2d09145@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA5MiBTYWx0ZWRfX+vMtYj0JsjZI
 Lrc9/kXMWDcg8590weTZYbcjF5XaJ6HaOSVGo/pKO0K4AoWwD+l+Ibr9Kv4vg0PYl3nBoMr00n4
 EC9m4rt/dvzSwXDAnBIjuPVqW9KmL8XEXKrkAJUYDHUAMWaJZztE8EMdtFKAROHoFJlYQ0gxmo8
 4RwjFv/PmECwR6rnfL9onoZ9TiknRuNj1y7u6krV42g1kX6mmtcYnTrvj9BiGYFQw6eKdIRjzmi
 LEc5iQY3gw87mruf43O5CLnogWw+7P0Tq/7g/wbS4F5NhT4dvAl+aKk43Me9xCYPYQQyClyggVn
 IpWmOVomKRsub66yiwExadDrzYVWP/6TkXciNVRCA3pI4Lo4u75jTa6KY/qjNV+PHpK8mSiF6Bt
 aIfCGaBR34VMeK0mOvk9cwLzCtiUZQ==
X-Proofpoint-GUID: buZLoRJvWZ_IcO5i5VxIM8u4WSqfQetv
X-Authority-Analysis: v=2.4 cv=Fcw6BZ+6 c=1 sm=1 tr=0 ts=69429777 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=Xu5O6cxXq1gntZcgiy0A:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: buZLoRJvWZ_IcO5i5VxIM8u4WSqfQetv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170092

On 12/17/25 12:39 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Put clock pins configuration for camera master clock into the dtsi.
> 
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

