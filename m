Return-Path: <linux-arm-msm+bounces-89614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BF912D3A5F3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 11:56:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C25D13055757
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 10:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41EAC3587D8;
	Mon, 19 Jan 2026 10:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V3cgXdv/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TTEgT6tT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05783587A9
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 10:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768820179; cv=none; b=TariFiXbLk5VEs0UgPvAsRCBIcqmZ9WUkbAguj9C5mKcSS3caEr5VHBMXg4PQGDN2T20rE2qgW8bQghEluLB5ZmXuupWSmhsCn8F5f5rYtG+TBSuASvDYcwxcXVL8O5XCAodi9pUzQ/H3Yaz0KUXIfjZNgiGJtSc1YAMKYbxCsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768820179; c=relaxed/simple;
	bh=w8aO6ld4mSwUmeiEaoXIiwqTFA7MTjDMaUTfgtzA/is=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PFhAGvZq8flRD7Nuz88YnHZNCtu4/pRSJL/CVJAhfvVdDiMSUHOMlvd6hBJz9eZdKhVOillcwD40ST/+h2fyGueH0HEvI3ZJnECQ4L8yDCBGS+DGe3g2bY28h1YczbwODcH79xNTpGjRb0lQRxcF+B/FjQb+G8HPg64ZSLWwUMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V3cgXdv/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TTEgT6tT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J9kIYD774034
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 10:56:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vW6ARu7Rpz28zgYCVRFbLifVastvOSHaCxOQC4p7PM0=; b=V3cgXdv/gjAVePZT
	K3E+NRTpWxfO7L5pR505zdQH3NDbceX9EcIOVF7mfXTSujl3y5pTxW3uclrMsQTc
	+gmcLYH1hVhpqEXHeEoSr/5U9CXhR8AdWfdtdhxejh58A/lq+qY/zUOQaVtL8GBh
	Ky4HULGWThz5dbB5WByAOA5HD1SraoixkCixVXc7yFtcxOxfRNiVwHOmSRJU8FNb
	b7hzfVSChf7etGWSquNtNifOoXhABwpSRmKzChDeZJKgf2XNRMpuVJqRFqwZj2Lw
	oHTgMIgNi9AOOem/hRoJ8Btx4FqckSNAawrdeSoi8okKTxi6n4fGWSBDySRhdUCy
	sx9c0w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsj9a87my-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 10:56:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c53892a195so108452385a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 02:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768820176; x=1769424976; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vW6ARu7Rpz28zgYCVRFbLifVastvOSHaCxOQC4p7PM0=;
        b=TTEgT6tTWIbV/B9S9x8/p9Ba6nHtAwnkE8LLD7bg4usvosjsG6oYPQ5JhEC3uAm9tR
         ClMSyeJrEv3IA0MtclLmtkU5j+MLRpS5KUUOLN22Zi64B9mZpInSHFiVo6r/vMDWc96P
         KMR1y3lxgN/aM+fFKresTmDga5sHqcVMEV5eSv11+Tnhl4/cSoTy+f3NsuJCEwgpjFtd
         TUfB6wGHlXj9kGNv4pe49xYZWiX3VczlAubGxQaaseJ8407ok7r0Cu4Ll4Sw1lfJyg19
         3Z+vPMlItQikAu4ojhT8iIusOAxns1Gudep+UsZU27QIev8WoaloA8JgXpQTmG8yIp2G
         tmqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768820176; x=1769424976;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vW6ARu7Rpz28zgYCVRFbLifVastvOSHaCxOQC4p7PM0=;
        b=EIaLf7tLpFWnNYA2cf2zxBJY5wyb+HkjXe9xuweW97+dhs3R3dpxpN5uWUS2/rLn6Q
         WadbIXt5gTCdJOfOt9ETl+E0Un8O6+TSWI6wMKZ72u6nISPvPtf4it8xhkiSUmSokW6U
         zVaabXYprn6lGvEOZbFfp9s6rkrYuz1jfKb/yroq/k5WsCDchLk74BVOj208mcDmkoRE
         S/4py0H7cgc5l/nkXAeiBWm0GKCx2aEszN1wSvCukeaRCR0W1WklzGnObcezi5QeGu2j
         nJhEKN9quMvIE8cGEeQlWYHh/wT4GYZrNb0b5nwO/jZ39EStGKniH4S7rCmEJnSJ+OmK
         xA9A==
X-Gm-Message-State: AOJu0YxzAuZZeT6SX7Q6yWthr19RiOBtncn52UzMtmXN1X2hB0+GGeMJ
	O2U2m25Xow60Rsk27F1xKlM3GHX+BI+fgCr4VY8GEU4w6cNSsvD5AU2lBdkAReBLkHnhrHJTHm/
	CimKyjUuswKeGQTu8rGenHvj2Soflo0R76pNVybNdBiJ3CTw6j3JRj7bgXuDOTLdA1VWq
X-Gm-Gg: AY/fxX7k7JLJuiSvlaWF44JGYjZWdz8x0kMM/auThN5G9PfPtZdqHENxhgnYwrGtJDX
	qG1gJsAWQWauGL3Xyo6baxax7DK4FjEMWf3jTmB2L/xvsAU2J0hKfMVsGBz/JpHfb9Dxru06NlG
	4oZDGk6SOw2ONYY2O4gN6W7V5UgdT2q2bqEGh3Sx67Eb0jleWVO3yJhTC9u08z+U+/t4ZFX5BfD
	rS7B7p55Ok+yZKFAnVsNTvK9EOAVPG6+/Axqn0pdPR8Qg4MVibZdDTOJN1I66d0dctNoaaAkJ9G
	E8IclJVs6FtUfIZ4HwA76oiEwFC8ETOEPlN/SMwyVkj+koLVvd8Ueazij0UGP3Zegl2W2V3YEDc
	PJPi6bCMt4Ird7KiqZ/e34gIml7NQ+VKsjuHNXJGJVU7Wyg86AuT49pfJwy4KBKkeP5Y=
X-Received: by 2002:a05:620a:4084:b0:8b2:e704:55fe with SMTP id af79cd13be357-8c6a67c6110mr1142865285a.10.1768820176139;
        Mon, 19 Jan 2026 02:56:16 -0800 (PST)
X-Received: by 2002:a05:620a:4084:b0:8b2:e704:55fe with SMTP id af79cd13be357-8c6a67c6110mr1142863185a.10.1768820175610;
        Mon, 19 Jan 2026 02:56:15 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795a18c3fsm1061152466b.58.2026.01.19.02.56.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 02:56:15 -0800 (PST)
Message-ID: <999ad755-91fd-4ba8-a3f8-1cb1673e714e@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 11:56:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] drm/msm/dpu: offset HBB values written to DPU by
 -13
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Val Packett <val@packett.cool>
References: <20260119-msm-ubwc-fixes-v3-0-34aaa672c829@oss.qualcomm.com>
 <20260119-msm-ubwc-fixes-v3-2-34aaa672c829@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260119-msm-ubwc-fixes-v3-2-34aaa672c829@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ieDRZujRNOg2xnrmaZiPmc5qnOlRFy-9
X-Authority-Analysis: v=2.4 cv=N40k1m9B c=1 sm=1 tr=0 ts=696e0dd1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=FnLLt5dnLMIZ3HHg8ZoA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA5MCBTYWx0ZWRfXyxyjDwqOsXb4
 Njn/0Y0QbHkkqeZlbOOJQCMKipACTZSt/qROp+hwCTmHzznZfuJZ1fchR52dRbp0M9TiMb3L2Mj
 Cu3Ljw6PwLZUSWNTaKXqGUQUbBAnDjF+Ph+a1G595w0uKdNRamXr/yPJcTRHuYrmFgZjJhSPnI1
 agaltwiuaHch+tLkqekB5Prade0t6yzJ6SCnjJj1T5pEXE8MPjYhOOyDIN3z9OgChT52K5DTLK+
 tFBEXmCPQ5AuB98Ssd79Gp11GBhO2AbExv8510oZ4BC2n+M2zLDHfL+DafRLaubm77rp3/U4VQx
 +KIekd7yzx0/EbqjTg1RPmXph4SHbr6uauL9NmApp3lyUK5UKSUrlFKHcMqTRT819ZwUIMCBAh3
 NybRVnem8tWrv3gpNuxVVZ+MgG21maEXtr3G7gbw7t9BwWzn8cODCw8yDSDmrqm2nbFmC9/3ZX2
 NIT6IAWnrFJVbuXO+xw==
X-Proofpoint-GUID: ieDRZujRNOg2xnrmaZiPmc5qnOlRFy-9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190090

On 1/19/26 9:17 AM, Dmitry Baryshkov wrote:
> As in all other places, the Highest Bank Bit value should be programmed
> into the hardware with the offset of -13.  Correct the value written
> into the register to prevent unpredictable results.
> 
> Fixes: 227d4ce0b09e ("drm/msm: Offset MDSS HBB value by 13")
> Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


