Return-Path: <linux-arm-msm+bounces-84224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C6BC9F112
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 14:09:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 97B15348F04
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 13:09:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 666892BD58C;
	Wed,  3 Dec 2025 13:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T9sbAjzP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lwjov1Oc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB1F2DE70E
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 13:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764767378; cv=none; b=IDmg+rVsdUAX1iAO/9UcKRt9Ea6EWrgnzRId963xYfUf8f9rH94Y7pCLIU9ufDYCRmL113uIDF9Y0jztI2LUu05mASrms61+xtwSK+3m/KbXJNfry2fZj8zkfpiudw23FYGf+c8m3iLZOWC+KtbEhG6kF0irwcatGAFcc21FjIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764767378; c=relaxed/simple;
	bh=FFP6lv9Q2PdVRUyLB2YQmwziSNq2WoACg/AuDLUdhbs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P1NUB/LSNuzpn6uRgBaIjS8bZs6MjuE3dyn1CPcp2mTJ8HKJa6sVrQlGFfvf+6PcSV2exyhCVb/0eA8Y5dobJgGcX3WdoNz2Rm112MmAcOljACOGQDJESxhwwG6ThCHEMircVH2t2YXWgeUgV8Ai9NFXS3t6ZxzynKQ42gJo2uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T9sbAjzP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lwjov1Oc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B39PxQ71969515
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Dec 2025 13:09:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oC+SGeAXV2/VMt29slGqYE33bHwErOo34q/I/3nm9AM=; b=T9sbAjzPz496MhY4
	efjdm/KclyLqs6eo/6lNYgwO0Q505IeuHm7W7jJFC38O5jYrCw69DrIcjwDtxqA4
	eLgkFSRG5ZfBdnhpIyC8U1zEmphjbrUq4qj9XTA+DcDhUyNF+Oj2v27dxAw51l+f
	A9EEPW+4wCFEJBL70rpHVGMFq/4rLeekACegNm5srXAWTwxyp5W8O3IicqqFr5Jx
	+gEGrcH2AflqH2Pq2XxcTDal3xJIBZylPRyMUrYNQrCLeN6C21wg9mrkpFQ6qiQt
	GSaIfyngStqevQEOAXIn+wh2aWxdvHbftz9WA5u8tvO4XOErT74udgeoro3BLJxY
	QondCw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atjjs0ncb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 13:09:35 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9352e153b93so176956241.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 05:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764767375; x=1765372175; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oC+SGeAXV2/VMt29slGqYE33bHwErOo34q/I/3nm9AM=;
        b=Lwjov1OcZFQLX3LGpfOcyLM0e+7+c25bIS4DZ012rHeko8TaU/Isz0xNwSw5k3WteE
         8kdpwngPLnpnA/KE608JnQa8ZA2cBLQSr03+o6+HubTkEFqzNoOr+o60ZsnQTtnQl93a
         VI6p3EnFhU4d/tJN9aLF/2XM80G3wORHk1bxFGHwyHh14PIAVXLO6d/EgyX0AZTYJi9z
         bQ/hHtJfo1L+s3bP1U06M174gfIQBMb6VpwBpnYtyG1a1SaCCvyKlNdn03TkndsbGNUv
         zBVASemKk2zE2L+d0lAjAm3pzii0b5lUkUm1kFhUBNv8m0Sjpa9kzId4L1bA82H+oNEY
         9YcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764767375; x=1765372175;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oC+SGeAXV2/VMt29slGqYE33bHwErOo34q/I/3nm9AM=;
        b=sTKxmk1EwopGtzoD3EST3CI8cLR+5KAUmAPxtn/jbMgnVtEoibIB7DUz9rQlwtqP7b
         h2N7rhikP5LWaQfyloIo8+AZcmRBP/LRgyFGOUnsjSV6Ww6PQ0UBZccB7uJSxKmrZ8FJ
         bHcbGbkiOz3QhVk/CSIC5rZzFjTr3bQJ+O5qkIL2BBs6sO5uiSgTq75e/iosm8BqUYV1
         dzxECbAnRPqLyXWiNHkkpfktTJpPpyHQA6/irNMW5zteibEb96IlzFV2V9ChIXx27dUJ
         DJNIPVXh9eM6qnZ/5EpQsJJ3qvdBp+MXQ/6n2rDe2PNzkyUlCbMLpQe7UibbICWwsYis
         gT3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXRmNkbL5VmT4pqww0hFM4GKmtZ5U/tMdXxeh7dWUSs+LMadVgshk6LRCMq4wgew6SeSfu4jlR/EfxnoNnO@vger.kernel.org
X-Gm-Message-State: AOJu0YwWWqyuePGOIE8enu1OTZOMHoLpi2ScgUHWyyymjyibIztUJp/9
	CdAWtdrlJ4SVbdV+SbPS4Co5jt/LEtzMuBBbUhvH1HFeVGQ4IP4/ypht5uoYLKzdAPtAJHXBr5j
	j9bMCFKNxFjDpvFxlsoz+syFtC3uHlUGHOS+7rQ5AYV6sZpNRXoDn158mtutcrKKRiwln93Z2Vs
	y9
X-Gm-Gg: ASbGncv+KYt4dTTJXAstj5wbT1sI8v2b3ti4t/VdLgIUV0keFGi91q9ObncxKRACKra
	1uelveb2ApM1VbmXwKyt1REtcOVfep4P8Uc6Nd6H77GMS7FcekhRHPPUexRATVeG+A53+B4jCkH
	u+AmsV/y6I7hyJom9qDps/tDH0tBgNztOlhA/N6DSrgea4nPQqS7aFp7eKbzcUy8zhhvam6WXJ3
	U7NY4DJU5oBeAnjsJoKxNxLFA8gSFqG5zqjSrdeP6dMCgDGuaessdYs61bZkP5Mz/UnoCgIdRT/
	nUC2q+AzDHZ27rNwcP7uHryqQIhLzt5dhuGk5Mg1yzBkBM36yayHvOaZ8xDkqPG95AuSEQ6pEd7
	BE+imXJfG3vA6raYvdT2YnAQm0PjixUMWzEer0+zFRDVrQbOPs0FVdYNkObCUoVv00A==
X-Received: by 2002:a05:6102:442b:b0:5df:af0f:309f with SMTP id ada2fe7eead31-5e48dfef877mr299125137.0.1764767374940;
        Wed, 03 Dec 2025 05:09:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFSgksr6HNoBpaNwL3yWZ2mFG4RKy+iSMJh5vT5XSBu/sTOH5BHpxqaJ7yas8hXsl1FarHcaw==
X-Received: by 2002:a05:6102:442b:b0:5df:af0f:309f with SMTP id ada2fe7eead31-5e48dfef877mr299108137.0.1764767374439;
        Wed, 03 Dec 2025 05:09:34 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f59aea78sm1720927266b.36.2025.12.03.05.09.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 05:09:33 -0800 (PST)
Message-ID: <eef2f002-22b5-4582-9fc5-df1c8b8bb0ce@oss.qualcomm.com>
Date: Wed, 3 Dec 2025 14:09:30 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: Add camera clock controller
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251203-sm8750_camcc_dt-v1-1-418e65e0e4e8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251203-sm8750_camcc_dt-v1-1-418e65e0e4e8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: RCvjvzpQ0EzMwi587MBk30V7CIqUyxt5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDEwNSBTYWx0ZWRfX3Nccwm1s14+o
 io37/LjP83Zkx6JEgpVshWUygc9ent/CS748qN0aejV0EgV75gCKItr0QmxW6zyuASdMY9NgHCY
 LnHbNK4az5rYQvjmBr4zVQfa9IqoeOO065YKDgBrndV6wOvtLwQCAob08r5hcFvl38CACYuVxSP
 qbYSsNnhQSDuHLu6doDWrQjtGB1AcG+B+PQzo/5npNXA2aaXQPcRd0e4HWYY1kIS+WPzUIyaxin
 lnNta57M9YMAX+WedBm/qTvhCjiKBeGK80wbaRmpVlyICgSG6IvqLGANaSQGRkjVtHYh9eGadJs
 LaYOeIbtOmz0XzPHqfSg5VB+KC/nB858fTISJftwLx18T9/aMWjUC4M+CtJROXCfrVKgQe/OWKI
 7oO/xWoc/o9FTwV4M6d8sFzDSTZ3RQ==
X-Proofpoint-GUID: RCvjvzpQ0EzMwi587MBk30V7CIqUyxt5
X-Authority-Analysis: v=2.4 cv=ZqDg6t7G c=1 sm=1 tr=0 ts=6930368f cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=9N2CO4OIQ6e-80MTA3kA:9
 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-03_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512030105

On 12/3/25 11:32 AM, Taniya Das wrote:
> Add the camcc clock controller device node for SM8750 SoC.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

[...]

> +		camcc: clock-controller@ade0000 {
> +			compatible = "qcom,sm8750-camcc";
> +			reg = <0x0 0xade0000 0x0 0x20000>;
> +			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
> +				 <&bi_tcxo_div2>,
> +				 <&bi_tcxo_ao_div2>,
> +				 <&sleep_clk>;
> +			power-domains = <&rpmhpd RPMHPD_MMCX>,
> +					<&rpmhpd RPMHPD_MXC>;

I see that a small subset of clocks here also needs MXA

Konrad

