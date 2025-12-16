Return-Path: <linux-arm-msm+bounces-85340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D2CCC2E06
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 13:45:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 84BEC31DAF1D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 12:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D5C82BE043;
	Tue, 16 Dec 2025 12:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RiJ+xHtb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M9FbrVm6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E08332548D
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 12:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765887509; cv=none; b=BGJILj2o0558rLSfiO6l4GIiNO7R6HmBb806fCywJBQ0PLbc24vxyu7wbtMxPm5u75778b7EbJuY4+CvNJQxIbCh5cD2Qi5crhlqnujwNOJ11oHd5MfBtz65Z2G99nC/DvDAKQo0cQNg7pv2LsJk9ujq/wG3MdiK/m8JGeeAWzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765887509; c=relaxed/simple;
	bh=IgbrckJ8/m+L7rQ+YGOHhMTi2lN5L69wFwUdEig5HWY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I6EQPBihIGSmMT/XBK6I/+j4yqtMFedDO1RyT3nvDVIBRraMEO1e0Mpk4IR6MFCQQGpqvr3ocJqUcQUmmyfmELU2wRTqBhgredng+1l2GsmDJDaIwLZKYFrHOQLUJNSdBwEPwK/lyvoXKyCCV8rWO687ZwYFOH6APfwWMilW+2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RiJ+xHtb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M9FbrVm6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BG8JOtI2573306
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 12:18:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gLeSWQEgN0Hq9iuqOdJbomTDuGn1najYt9wSZnLiKIg=; b=RiJ+xHtbgZD6q3Ra
	6Tim5XWQKk0s/5NjDl7t4DuuZHIoHi1fiAPooYkY/813RNVjAn3/i9V2xxI34dxm
	LY18zS6fyFt8uE+BPh/oHpBVRXO3tqUBQfG+fS1Eonq2ubB+JnSjxMqWH7+Th4K3
	8dsOIIfdgzW8omHmCOXJOdg0w+yOb78gi+TdC7jtQwpjboLhV9ChcYi80jDdPP8U
	hdQqOsjPuneqFXtcf14N3LHqeD/anyjaZXgxtXgg1f1Klw9eQBJZiUsx7Wei6vtj
	dJUO1g7jrhawDCma/95mDgTXPfaTxi6GomUm/9worcepoPyIKMiJGqa4OloPYiwW
	kOgYuw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b33ths0ev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 12:18:27 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4edaa289e0dso18196291cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 04:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765887506; x=1766492306; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gLeSWQEgN0Hq9iuqOdJbomTDuGn1najYt9wSZnLiKIg=;
        b=M9FbrVm6CxhweBEEhSO2kRgglbQ764jQDBB+o3CTAzn6cdkSQO0HTYr9dSO0y3dByH
         z2e+HUWBDQcMIiuro7qedlFH+lnJOvVljot1dr1P5rQL3Ay/MONxuS19oCmn3LFQc7Hc
         kAfONqxQmBHg0P4cvAHCTD24m6pCnjZoB2EBZ1jBzXNyyxLhgV3aIEMxjvROPA1ySdwq
         cdakh39DT5LxZBxeLNDQ+3B4+D3o0TCBEzrUyqgILADxX/g1dhapi6/nRGBKNb80j/B8
         CaRXu5b0iR02FxxSolF6DlF1+LX+Bb+/jnLlfC9EATT6hRxOU1hRpEGT2wuoJ+C0TAyT
         aHdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765887506; x=1766492306;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gLeSWQEgN0Hq9iuqOdJbomTDuGn1najYt9wSZnLiKIg=;
        b=TXIXIoSU/HCa2uVN+aKOQC5CKgVTSsO08gnvGVDGBI369kJMZlqgR6eHIT3paVAG43
         wlQyfx13VLgq7nSxubWM7/yIH3BauuXXXes5FG/fe2vxL0GWnQLVnbzpzYPNVKHRAY9N
         N88RyZ+k8A8DdBSHJ/9H2KVFIjRP64x0Z6KlG/YD3bPMk/xXAZB6mPej+nSN/HGPqGdj
         JQ0Zl0dPHWnqEwQE0WAfj7T5Lyh7Jdm1+DgOq24aZCGDSsbnFmGEIgdtQbwZx6q/SAv9
         z7oOA/K/ACYo6Y7kmfCIcxKG786AjkoDAFkpsw8JrfXmE0TfHip9tO/Oyo5fyfWlf95K
         o/pQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqUd65+XHyVqnobPB+fBgWU32+hj2UDoVk/eUtX3384jZ/lNEC9UArOAf2ip+iE56YWsvGQofRosI1MmZn@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7evyljj4+/P4YHcp4bt62umEcyveD25mbxYgx4zs8nWBa6lkF
	SIhslgtUZXW3zlfBa0rYJCxQvixTGdkam59Tcfp1qqkpo5ixjqUvGQ/+ldaMKrDPN8qHeQvDlTs
	dyaQD6gZfbC3bj5qhKxZ6KD/ZXnhjln7SDWLrB7RTP4JvRPv1eIRVKIxwSIdlCvVIgP5v
X-Gm-Gg: AY/fxX6ioelcILH82d1dwFZ8FQTDhf4d7K0FRZGHDEWms8DjbueDiuFA4dxS19FnZRn
	movqMjEI387veWsyQ5NFB7LDb4uXkcYgtG52Tkh/gyAX1HoLXEKs0kFQAIjK6scUTgKTeURKryO
	otUJm7zYV72y3p8yw9ea1nGhPYD2lVnl7F+lwhnuvtX/J4FQlVLzhvTK5xiJVmpGoYB5y/+ujia
	rvgLEjOreP94BL2BPuyGBJ5FcNc1viLO+QsPl+6SC50Q/dPt+NMpe+6JBd6pfLkZSwYtbq4XoTb
	NZ5Em9qtWz0EdKKVDiWQf8AvC4JC0gxOQtGd5OkDVQEpbiojOu0K50/vtAL8RmbNnBVPcCM0iXS
	53BGGmbBXBVNdhrxQX/GM1Fav0T/Yt/288iHvUxzqd98Xkyx2ReRYQB5G4/lsk8VEIA==
X-Received: by 2002:a05:622a:409:b0:4f1:aab9:851b with SMTP id d75a77b69052e-4f1d062f452mr151920711cf.9.1765887506278;
        Tue, 16 Dec 2025 04:18:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFCymIRaI7wnVzSlN0gvR4JGfpggG6OO0QhbvguaHtQaxxnFQfG0GbMrMZIugN9w3H+9Tjywg==
X-Received: by 2002:a05:622a:409:b0:4f1:aab9:851b with SMTP id d75a77b69052e-4f1d062f452mr151920421cf.9.1765887505724;
        Tue, 16 Dec 2025 04:18:25 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa56c152sm1628758866b.56.2025.12.16.04.18.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 04:18:25 -0800 (PST)
Message-ID: <c1e08b3e-c861-41d2-8ca7-4db43432416e@oss.qualcomm.com>
Date: Tue, 16 Dec 2025 13:18:22 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sdm630: fix gpu_speed_bin size
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>
Cc: Konrad Dybcio <konradybcio@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251211-sdm630-fix-gpu-v2-1-92f0e736dba0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251211-sdm630-fix-gpu-v2-1-92f0e736dba0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZIPaWH7b c=1 sm=1 tr=0 ts=69414e13 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=e7aU34VQUkOlsANtNgcA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 7kPYVRbdC_MCAg57c6LDl9NZOeoLSKaN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDEwNCBTYWx0ZWRfX2scJaBUA8Wl8
 Yxs0alGLrV5ZXCOstCzdtHMStAx4AkniWEmTMjFClcxJTtLHefA4PrzPjs/29rxMA3JGYMpNUD5
 0a/qNU6SnAh36VXXSMWlzxKxwXVcTOOkrR5Y+sToPHRVl2EiVaU38Tib8hsmkWzDehYhevzwR5z
 YW8778PuuWITi9tFqc6WVOhCvf40YNfwL2AeUaUaXV2aKJPMr88kl/CY3wlO6c1grSKKLvwDV5t
 tNtJkP9SkjZQol+on6D/mk+X/Vl5RvSgVENBK8P+HOIQZrkdmyI8rzcMpWHKfNvhm6YW615v/Te
 xJOqajvkKngJRDeZqoBCeP27ciN7uPMlNJdGpXVKyZaxmu5qihCxYJHqgtIUykbuiWe5gn+yXvd
 Hkg9yZeV7i6C1AZEXI+O45VO1MZccw==
X-Proofpoint-ORIG-GUID: 7kPYVRbdC_MCAg57c6LDl9NZOeoLSKaN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_02,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160104

On 12/11/25 2:27 AM, Dmitry Baryshkov wrote:
> Historically sdm630.dtsi has used 1 byte length for the gpu_speed_bin
> cell, although it spans two bytes (offset 5, size 7 bits). It was being
> accepted by the kernel because before the commit 7a06ef751077 ("nvmem:
> core: fix bit offsets of more than one byte") the kernel didn't have
> length check. After this commit nvmem core rejects QFPROM on sdm630 /
> sdm660, making GPU and USB unusable on those platforms.
> 
> Set the size of the gpu_speed_bin cell to 2 bytes, fixing the parsing
> error. While we are at it, update the length to 8 bits as pointed out by
> Alexey Minnekhanov.
> 
> Fixes: b190fb010664 ("arm64: dts: qcom: sdm630: Add sdm630 dts file")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Changes in v2:
> - Update cell length to 8 bits (Alexey)
> - Link to v1: https://lore.kernel.org/r/20251006-sdm630-fix-gpu-v1-1-44d69bdea59a@oss.qualcomm.com
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

