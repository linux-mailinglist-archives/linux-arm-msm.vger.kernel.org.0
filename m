Return-Path: <linux-arm-msm+bounces-88098-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D88FD046E1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 17:36:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D0D7D3357DB3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 15:26:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D7703D727A;
	Thu,  8 Jan 2026 14:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HI61hvGI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jNdpKEXL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0AF23B8BDA
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 14:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767881377; cv=none; b=dijQgxwrEkne+9UXa1tb1SZrFvj78FYHML1B1F6Xr+d7ztSqP+fORPUa8F4T8aYbJrovO4VECHB+Vdf/nFRa1L6sHaZs7ftoA6kWlRYUXqMTXqPOl3mCOEpDuBzfKuPRncmVuBgWCAg/PCIVI/cnDV+Fo5EBySMCV/W9dhbe42k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767881377; c=relaxed/simple;
	bh=evuD/6bVtVPa6WzEJFbKMkoPdGGHQ8a/9PZuWvIK7rE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=bdt6AWcTODGdS3Le1UJ6haJtHmMrG4+Z+P0SL+hdRg4AG68/5fO46RWC6dc+aXHH4FZ5quIwkrqm2vc7f/SiDAE1FK2jEboKxBze/OkM/WIANoKm3il9CCxhbrSprz7yEdd7i/twqqXtHSbu9eh8i5AZseUqlYV3k4Gr5wenxiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HI61hvGI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jNdpKEXL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6087VOvu1837907
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Jan 2026 14:09:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LK/TeYFjFV5YI9NzBdYblXnSYiQjb6KFXgChEGgcpl0=; b=HI61hvGIR4+ktHwX
	cTekQVX0gO2SuOvdjY5bNshAr3kTXFd/C8u4GGBDqyymiOKObA0ewd5SkCQx1m+V
	aP8qKKBE74A5F3wleccr56smfRfFhEH6V09dyKXZ+q24SZFtD2BGkvyFLEZQ+Kt6
	xfNKq+1RpIcbc1zoyOvybVQ8ncL1VRFn1uf5btUvgCxQur2PpVzDdbE/1u+Ij423
	62Yu7TSkDttChushUFp5VBl8BqG9B1c9ADvTgA1aYY0JL5qvC5grXmFsYaLRjNu0
	oxBEgDSAzTmO1iLkzXThOujuyaZf9308yhYaXGVvDmTMM583lmzQR9ipPl2VoxL/
	m1bNnw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj89216h6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 14:09:34 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-93f666131b2so655730241.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 06:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767881374; x=1768486174; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LK/TeYFjFV5YI9NzBdYblXnSYiQjb6KFXgChEGgcpl0=;
        b=jNdpKEXLaOYYjfCeFd2tV+HASjDmcn/iqRqknoTWbgX5upGD7PBmj/l+/Z9PtoS2EO
         STvPZXWguCHwNANyadQ8RdutJCxCbG33EZ/tq/zgnRIyoyNVydXNR4qy7U9fLPlbGmuE
         KHKbrpoJW4K5nzM4e5bWV8iLJSnj+S7ZHVRzWm/XB20NOIK2oqclty/UStTYzc4Vjym1
         2G9NuVZE5niNzDlNZI0Zr/zAhAkAf16XGn+7v+7+fK6e0hLblEKyxmS7j903uj1UiKsN
         8tabx1xSDIZ3KGw98X1xwbdep5zT3+iYMiRDiaJPxHhfTjfT5L7ihy/kzpgUzSL8LAWA
         fM4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767881374; x=1768486174;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LK/TeYFjFV5YI9NzBdYblXnSYiQjb6KFXgChEGgcpl0=;
        b=SPseZ+KmEq2JyxHCL5YRxT+iprLO2RmWno2lgrYeax67m7ABfimDk8uEVf472to6ef
         FbxzV5o7RoqS48XF1XEl7dqs2CyHm6+RgPGqz3VBvTLNaU9anusmEDfiHEa/8pEBot5F
         8qZ+4JOFy6HlfOvK9BhmeZoUdBOWcI2TfOhcCtJo0zCKO39gu767SKJUlb5SOogR6Q+Y
         WNhWh7OeAyDtNmJvyjUNrnT+8eII52ln04Cee3layGL5pLHd+wpZi2iDblb9CNzrR65C
         rrXDPD93SPBS4kh2QY0LLbIO/gRKSJIAaoKfLKmtUlZb1YnhYEKtYgvHKVcaDSltocak
         9V9Q==
X-Gm-Message-State: AOJu0YxoAgQd8Hq0DZV9WvFtTyJUu3304ClgjZFZMV72muCZtMkHuxN9
	M3f66iKaKf4QUtGmBCybeR42KIZzXAotDSZtikCbJCyBWP/C+7AsAp3wIV8ajXXnZoKbe9disrZ
	KjXoC6JLNwb+WEot7Pyzm6cNeehAUxpimCxk/1GMKPkzwDqtbMYFQzJwY4YGSY91H7cDa
X-Gm-Gg: AY/fxX4f92QAEL5RRLh7fqdhGaRe9zW7iD0VboA9IgUhCF9Xk4qmXDwoJLiaCH3gxt1
	TnBsCSFscePt+fWnMPaICRJIJR3WWgeK/BrYepXpV/bu4lzmym2NOCtI4UsBTRJ/mCdNPQMkFpe
	2MklOyZxtbwS/CYdkLap8zOkYWawgL3rVgg/sJiRI/G/LbFwLasYa5W3HjDXzLC4tkmGpP4qvPi
	VI+tLfUsUfTo1AZYKQl0CuodDqnmcOgzePJo2PaTE/eHzrJvUNY2w9UY7s3tF0Gxk1WaFa7nqkj
	QC3hlwDjQsR/1UYCYpNatNBLgTSFpnHEpDaZPLCHHLHljedQmrZtacGyItpwDY6VVUuVkOQnEG1
	U13LRu3KYPu5mbLSIS6x2+AUdnGSBlglRYo6aD8fwlP95l0Kb9O5sxxFFqdfyHvBtQcY=
X-Received: by 2002:a05:6102:1795:b0:5e4:9fd:5a3 with SMTP id ada2fe7eead31-5ecb697d5acmr1094910137.6.1767881373845;
        Thu, 08 Jan 2026 06:09:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFr0o9ZuJWtz/EWtmYSsEVDz2rg8ifdhyHsfJy84t05/NRvCcr4yxWjjyBYDTUEqkUkKO3dAg==
X-Received: by 2002:a05:6102:1795:b0:5e4:9fd:5a3 with SMTP id ada2fe7eead31-5ecb697d5acmr1094885137.6.1767881373150;
        Thu, 08 Jan 2026 06:09:33 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf6d683sm7752188a12.34.2026.01.08.06.09.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 06:09:32 -0800 (PST)
Message-ID: <f8e2177a-2aeb-43b6-aea7-ca1c571c9928@oss.qualcomm.com>
Date: Thu, 8 Jan 2026 15:09:30 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: talos: switch to interrupt-cells
 4 to add PPI partitions
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>, andersson@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com
References: <20260108092542.1371-1-yuanjie.yang@oss.qualcomm.com>
 <20260108092542.1371-2-yuanjie.yang@oss.qualcomm.com>
 <d90f592f-6bf7-4b04-98c6-608383652797@kernel.org>
Content-Language: en-US
In-Reply-To: <d90f592f-6bf7-4b04-98c6-608383652797@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=M45A6iws c=1 sm=1 tr=0 ts=695fba9e cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=CmC1huXhM7PGevsx05QA:9
 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: VnxH6pKWO-ryiCf1yta76YSCWL0_alZD
X-Proofpoint-GUID: VnxH6pKWO-ryiCf1yta76YSCWL0_alZD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDEwMSBTYWx0ZWRfX/Ps8EfVI3Itc
 iRJqpbg++AsVsYuSZRNagC/GcUXZtmr6ZadyP5vYA4/bgTr6eqkln5ibdIECSu4ve7jnxzcs/vM
 0woP7T5AHcEEtlEsqNiLWkdBi8bAUBbiDTTZIZ9OdGaBSw35l3quO/1VryW4x4/O9Aa8VCUn3/N
 5cyNQvolLTdisbsFg3c34iR1LSY1WdmtOR8msbKZGKFCGmd6MIcG1p4gLZGixBzj+s+YhbBv3A1
 EDODX7je6Vj+AP1FBJ26RKCPvtPKgS+ZWvuQGyhgZ3mDywGnQ3G4GQOx6s2jamRQo253QjmziP+
 2OYMD3wnBRlIH5sQG4Ahs55yYNLiJ0o/Ad4NYwwcWBExbiqFcoy5oDA+PT9PSScV7VzPh0JkoVX
 huf7qxp8prb8sa4lvmHdaOWA5hcqyR4emvxVX6zn2SUWgm//b373G1MB6Q1aU0UvN8MCWDqixy2
 Flm3qIGpk/e0cgpd9vw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_03,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601080101



On 1/8/26 2:38 PM, Konrad Dybcio wrote:
> 
> 
> On 1/8/26 10:25 AM, yuanjie yang wrote:
>> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
>>
>> The ARM PMUs shares the same per-cpu (PPI) interrupt, so we need to switch
>> to interrupt-cells = <4> in the GIC node to allow adding an interrupt
>> partition map phandle as the 4th cell value for GIC_PPI interrupts.
>>
>> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
>> ---
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Sorry for the sloppy trailer from the wrong email, let me try once again:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


