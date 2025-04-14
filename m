Return-Path: <linux-arm-msm+bounces-54247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F038A881C5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 15:26:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91729174D1E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 13:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED14F2E62CC;
	Mon, 14 Apr 2025 13:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jnckoJTp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E6C2E3397
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 13:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744637082; cv=none; b=Olsscm2Gcz/f3ySxaxIdqIFAEV8fypUHJGDiBTnVJuBwRyr2Zf+ZvkQ173xIksbLKtLZRnvlVq717uUFOnLEORpavNsc/YkKDlKbBMhZwBApdUYcem0y61YnUKymJLIl4t+UB2ybeSzo1zG98yfstDhOmobVlKvfrWtzYQf8h80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744637082; c=relaxed/simple;
	bh=aY/1fKbaFYeuZIqGliNdGJUKlTqEKs5abT4Ep+BqkFU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FUtIlM49VsLkSmt/q3d99t0oc/RUrhR79gvzQXuBDvA2UrB85HuLJspHBctn4+E6Z+jSTn1tJqqUAM/5PftWJRcVONfsB0fb0jdj7gKHo2dQdrSMJS05wVnYkJ7vHiHLeTfwR7jFL+ntEsol4Ugd6J+twzFS1BUwgfYyPkHiLYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jnckoJTp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99r06030666
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 13:24:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	02Rkx6hdb4JQY/Ijn44NbhfuIINmFhZjL7KXmSEDk+I=; b=jnckoJTpdLjpb92R
	JFE6CQZuFy5FrMok02UFOGe39o5eHr/O4vdLekD86iTaGixkr3UAupYSa7X+ko4X
	kS935FECRVHxhGRohZ/cHpad1IENgbI+CoIICMwj9LlyqNV+HigOZ7d2pkOphFhS
	6cEyipqXxZIej1AF1jZIxlScxe64BQARe57PZZsLOW1pauEsDca+OWWMprT1xo8P
	WbtOQcrAraALT5jVU1cV6lV1ocOaGwxc4xSPmGTVyQUEr0LDw0OaQ98yGO3WlTwI
	kdgogWcGA3UMAco8EXt4V5fu2AWKJnBkP+DXkF6dkDD8ES/KhTHRpPSkOMVH/WCL
	I3v/RQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydvj4unp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 13:24:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5841ae28eso100783985a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 06:24:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744637079; x=1745241879;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=02Rkx6hdb4JQY/Ijn44NbhfuIINmFhZjL7KXmSEDk+I=;
        b=efMtn1UnU8B0ZuSzKrdmP2AMF/9e5va1xJwVUTp+T+euM2KLhj4y3yIPMGX93cpVJ5
         nnm+8fH2Gupu2Au1CYXlAEt1qGIVaOvE8x38NGA5YCDUCrALDSj7W7RsGQwLhCyNyyuy
         2TPhF+tvWkjSXtsPVcX5jN2UXAJe7uHsl690ff6kXEkIuuUQlUpzDWbSLrBmBJOY1YW3
         UAvscIaICghPXSv8JFlm1qdeMgxhw8rGA3uYKZ2YAHBi+7uR1PSOAilCYMvBZBce/9m4
         5GZEEIAInSZT+9E9dWyhvx1cOf8G/3kIJh8fWiZEvlk+HEsBjAq0MOnXFsR+3+ucQBCo
         bH9Q==
X-Gm-Message-State: AOJu0YzT1+xGxwxHRA3+SURmK3Mob4d5BV4HoQe9iuV7wvrTR+a2+xqV
	7P9G3HYVt07uuDLrQxtkuHaljlaBSkcF8KM68NjTmoyF05TimcnWngL4gT23XqTBQsdSUwCyaXS
	qLGHQTC6OiOSx4W3wR3P/Kv5/NbzXKJA5DhTTSLH09TdJlPqWuYP+TZAcEpkkeRjY
X-Gm-Gg: ASbGncvXVyzi6Vb2mTx35yQ0HWTqTy3wTD05h050UAaKqriImNSgiQAy8Z/r/4fo009
	kjcQrlenzf3lxXkzakOTmF2IdL4sPYpNsuNdbVromntSh9I6wZvhAgU7uvdYcQLokAniF3+LDr0
	9ddRnBAALGlIIqZr9q4ipa2Cc9RYuXXMgxNcmdGjhI2nIZXi+qMTbS0rPdvtyWv1TFVFQ28AId2
	2ZhbG1WhTXybb+5z2OYWkvdaq1NJ+D1H7N8r7s1T1xo6cAbP7hU8hSvFcMbgP0L4XnLTNTWjO7j
	8ENwVbTV0K0VT1lLvWmZL9uPI5D2Z4FksC8OBGNo15Mmta4h71aVamfLXKJ/D9kcPQ==
X-Received: by 2002:a05:620a:45a4:b0:7c3:bae4:2339 with SMTP id af79cd13be357-7c7b1ae7e0bmr568800785a.11.1744637079167;
        Mon, 14 Apr 2025 06:24:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRa/QUfGBb0tF7zkWM/E/7q8wcm5etsdwSv+/cstcR8oAuNHxCD10hAM4FInQktT2x4+YUZw==
X-Received: by 2002:a05:620a:45a4:b0:7c3:bae4:2339 with SMTP id af79cd13be357-7c7b1ae7e0bmr568798885a.11.1744637078599;
        Mon, 14 Apr 2025 06:24:38 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1be8d0esm896745566b.43.2025.04.14.06.24.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 06:24:38 -0700 (PDT)
Message-ID: <1b783592-e59a-4e85-b727-d38b11411a9c@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 15:24:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] soc: qcom: llcc-qcom: Add support for SM8750
To: Melody Olvera <quic_molvera@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250324-sm8750_llcc_master-v3-0-2afd5c0fdbde@quicinc.com>
 <20250324-sm8750_llcc_master-v3-3-2afd5c0fdbde@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250324-sm8750_llcc_master-v3-3-2afd5c0fdbde@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZIrXmW7b c=1 sm=1 tr=0 ts=67fd0c98 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=qAG6vWTBVeFq7agocEUA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 5Ovs4XhTTZisRcuwtznt7tyfM2F9cVEP
X-Proofpoint-ORIG-GUID: 5Ovs4XhTTZisRcuwtznt7tyfM2F9cVEP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=867
 spamscore=0 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140097

On 3/24/25 9:29 PM, Melody Olvera wrote:
> Add system cache table and configs for SM8750 SoCs.
> 
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---

[...]

> +		.usecase_id = LLCC_WRCACHE,
> +		.slice_id = 31,
> +		.max_cap = 512,
> +		.priority = 1,
> +		.fixed_size = true,
> +		.bonus_ways = 0xffffffff,

This should still be .activate_on_init = true

otherwise lgtm

Konrad

