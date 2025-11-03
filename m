Return-Path: <linux-arm-msm+bounces-80090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5344CC2B7DC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 03 Nov 2025 12:47:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0D6C1885542
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Nov 2025 11:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1989303A2E;
	Mon,  3 Nov 2025 11:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HTFTJTyj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YdZBY49r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14833303A15
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Nov 2025 11:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762170278; cv=none; b=ALirG4pypJTrpSPBKfR/yS9AeKPGRfo3tbRp+W5KPIiZI/PWa8CvAk8zWOybtMlyHrzh5Y5iid4N1fU4dsqZ7t+pVCaj+E4Q80yqGVxdloRCRHZxGkA8hcuxVH0IBOH/PaiuM0g4k+9GKWRsffZsP86tqgAKCn8lLTqubcsWRCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762170278; c=relaxed/simple;
	bh=rYQmWo6untjuQnk65ZXCDd7qRmOrWGj40uijeGuIyAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OwmknM4z0YT6KyazWzS+3ylM92DHa3c2TmtPbBolOWPWRyxSjS5yf8jmEqvQ6oIti9R/G1UpW0v5jyEpZ33BAF3T4hTx6pT3jRfmP39Ll2baBtwIKhF1TnXoZtA6dMLot0ubJQfQmsXsv0xtkJxogx8uvJeQ729zRHCKms2tna0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HTFTJTyj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YdZBY49r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A3AHlUZ1941384
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Nov 2025 11:44:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YvOf+kp0ZdmTGQTGoezpj45yRTsjMynuJPHhSZjrogk=; b=HTFTJTyjdyo/guLM
	WX2vhQ8wZOIyFsXCe36gsy0kBRphrIR62eb+610H9EB0TpCX8aYS5LqQynP6PtJ/
	6v+T8yCOh51+nVYc+9+fyonlatXL5oZtPb5+QNDkR+KcVdeY4cDJ9z3ZRmOo4UPq
	ZSx8rk9SRhZ3XWifvdQ2otIH7ayKm/JmEkSY2KsrCUT+z2IuWHB71WJaZjm9zUFZ
	lc0VSywiqw7rv9DgUol3LcQ1PHggRN+37CxwNJYlaN7OaXZDAg3avUFpAfqdaW61
	/UA7nBFmgSyZKTwAj136tyNbR5RcHBgA4TtkrGS2Ro7hi5iLxAI/Xy9EIi0RzGIC
	A5Y6qQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6m9w9bq0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 11:44:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4eb9cfa1b72so18169811cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 03:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762170275; x=1762775075; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YvOf+kp0ZdmTGQTGoezpj45yRTsjMynuJPHhSZjrogk=;
        b=YdZBY49rjSFkC9TPN4loBWI6UrKb+1rqRmbHBKgYmqKdOOR6lO4JhAmNsobCCPntTl
         z4BFanUdcCIPLb3kVTQK3nTAvOptLAcmVwxsdMJZoZIwum7th6vYoJkMqxB41m9MO0J/
         fmP/8hRF3Kq9UtMwSQPof4HvS/gwjhq3O6zMt8g2X1iqAksZ0kcHTXx1XVrpc5H+0tdy
         e5dkeXqPNpmF/QllJxbG73bpK9HrW4TcpJgNLJe18RSKyG9f9tXH33z9fiaSYwugF/A7
         w/cHNjB4hFd6/jHijeTU/vjE6lqPScYTRKeTVeJ2/d/MZSKLkezIuLRhQh8sL5dDiJZe
         gpaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762170275; x=1762775075;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YvOf+kp0ZdmTGQTGoezpj45yRTsjMynuJPHhSZjrogk=;
        b=ZwHKQv9m4kdi8uQN8kEN+UdFT38vKwi0lYbKBiS2p/LHafew61YgB7Exy9eyuwVUzY
         yCzuduJoL3GkrEoaQjPOagXNqrcm/bhoXdHNMP1uSw6y3N0fAVB7rIfWWtfbyvxuYJME
         hoPY+8rfay6EE7EwIMU2uWAXajHysIo5KvmdP6HJHfzGiwuK+xoix0eev/5pNpUzblv7
         0TIKrH+lrLh1eLvXPxHSXIStGX9C07nZY7yY4kEcFAcHnwO/d6OSNyv3FGD+GTSCDr/Q
         4dNI1O8UGvHi24wmrJiPRbH6HwKnHeR89IlUodW/Ik5il/dFTeyKy3S8vIbQddDnOUXI
         Fp7A==
X-Forwarded-Encrypted: i=1; AJvYcCUmiw/l+Li1UdislEr6otuFlIO8sHsrvULLMmIb63Dr2ZzKoOjnXAis0cVDekWUnjk+0rlOXJaF/lnIbqcM@vger.kernel.org
X-Gm-Message-State: AOJu0YxhdkDiwTB5Woatbxq4fgFBNx+sSF6rQFQdQZWO8lTwvFLMvlHu
	lJr/+CMsSIqvIlDayJ9tgnHJqKWq7XGHBEptIJrYf7UUTK8NMOmWmAWeezI2CFLdJokuSalJQAx
	vCD4fnqebEfcz0p32RxEiwCYqsM587SPUe4dZL6pKxAlAVwb+79kU/71k0ug6rae0Ez0v
X-Gm-Gg: ASbGncvUVPIci/fbeLKEFDWlFXimQ26kRXlQQygLCuGhuhUwJGWz8yIsysgHdSHo6ni
	q48+YnYSx2Fu0U57ZhxJEW2+1cgtJx40WG57+ssTvQG+r2r+Vgp8EVFtMXQx7rb6mA15z6aVKCT
	y9P6LXt1nysUadTXErvyXCdg9TlrbjeCj4QJ+q5knCDleUMlSeJxd5cs5MO3OpffvPkacS4+so2
	Bh5qEFy1ZKgVNrLMErZ8TZtXpVQE49JAnGjDGid4y3E8Nu0peARp3jP86BEWGIa+v1/Rh+doxkp
	vgufhR5Fzu5yMrAgdD9TovoZ4o+3DBG0S1u/K7mA4kwQalWpCwNzp59L6ABlY9yIzd/jAvEewQD
	fzzeaWrq+tmIHBLCLO4UBlI010xUVtTvJ/urBlCZexv4/NcMYS6mRkF3Z
X-Received: by 2002:a05:622a:607:b0:4ec:f123:230a with SMTP id d75a77b69052e-4ed310020c8mr119135891cf.13.1762170275289;
        Mon, 03 Nov 2025 03:44:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGnGpJTNO4VxSLqtGK2GRrVTvl345j+n/5/IOWSW5sFL9hZhQS5EOwv6lu1y5X00EWO5TIXYA==
X-Received: by 2002:a05:622a:607:b0:4ec:f123:230a with SMTP id d75a77b69052e-4ed310020c8mr119135761cf.13.1762170274838;
        Mon, 03 Nov 2025 03:44:34 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6407b34a808sm9435758a12.8.2025.11.03.03.44.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 03:44:34 -0800 (PST)
Message-ID: <ff74fd52-1191-4a0f-8c3f-1dce1830c8ea@oss.qualcomm.com>
Date: Mon, 3 Nov 2025 12:44:31 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] drm/msm/a6xx: Add support for Adreno 612
To: rob.clark@oss.qualcomm.com
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jie Zhang <quic_jiezh@quicinc.com>
References: <20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com>
 <20251017-qcs615-spin-2-v1-1-0baa44f80905@oss.qualcomm.com>
 <44ff81bf-8970-475c-a4f5-c03220bc8c3f@oss.qualcomm.com>
 <97aeb6a1-fda2-440f-b14b-2f3dbc2d7e8e@oss.qualcomm.com>
 <5e64c246-a424-42c9-b102-e1a2af579936@oss.qualcomm.com>
 <CACSVV00vwbNtH47S_BVet7uP7u9t4RY=xTBn_r3u4sS91Y7Muw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACSVV00vwbNtH47S_BVet7uP7u9t4RY=xTBn_r3u4sS91Y7Muw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=P7Q3RyAu c=1 sm=1 tr=0 ts=690895a3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=Kgau_Mukr_2Uqyo6pRUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: jq8knt6WJ7oYz7V_hmBVqjjPFwLQWxx3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDEwNiBTYWx0ZWRfX8uN0unYy26Kd
 vVZ16QrwvFum0ARUCK3wNtoDfkRbWG3jX6kStOxdTiu7Vo4jKyRkgxSdVzqcGStoiWEJhRzc3TM
 NMs2boT1Nwlqq07ozvfRQ+KRcojxWwH6f3EabnbyEdhJsn5Dulk5Qwzs3p7+r9xqafHGAFhcpzl
 bWBUEaI2/YgHDMoyZ/YH/bls6vgTqhT/P2kT+SeIXjJa6G9eWFsKA4kJQK8FlmZMUInVy1yEnpE
 JUroUYcM29REH6NvGux0xr69sIy996xyEr+DIwj0nYLeOPgfXAkxQIFJ6qdYAyn8PJC0A+5/tir
 RzyjKhv2dMkM2SBvkfKHxpM8q4cH5HIEpujKVLhDJkVEsvn9oI4AJOaWdTDPUzNMoDbxEkGKrMs
 kLltq489jxKK4KdCUNDVusOEyWaGVQ==
X-Proofpoint-ORIG-GUID: jq8knt6WJ7oYz7V_hmBVqjjPFwLQWxx3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_01,2025-11-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511030106

On 10/24/25 3:16 PM, Rob Clark wrote:
> On Fri, Oct 24, 2025 at 12:55 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 10/24/25 12:57 AM, Akhil P Oommen wrote:
>>> On 10/22/2025 8:43 PM, Konrad Dybcio wrote:
>>>> On 10/17/25 7:08 PM, Akhil P Oommen wrote:
>>>>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>>>>
>>>>> Add support for Adreno 612 GPU found in SM6150/QCS615 chipsets.
>>>>> A612 falls under ADRENO_6XX_GEN1 family and is a cut down version
>>>>> of A615 GPU.
>>>>>
>>>>> A612 has a new IP called Reduced Graphics Management Unit or RGMU
>>>>> which is a small state machine which helps to toggle GX GDSC
>>>>> (connected to CX rail) to implement IFPC feature. It doesn't support
>>>>> any other features of a full fledged GMU like clock control, resource
>>>>> voting to rpmh etc. So we need linux clock driver support like other
>>>>> gmu-wrapper implementations to control gpu core clock and gpu GX gdsc.
>>>>> This patch skips RGMU core initialization and act more like a
>>>>> gmu-wrapper case.
>>>>>
>>>>> Co-developed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>> @@ -350,12 +350,18 @@ static const struct a6xx_gmu_oob_bits a6xx_gmu_oob_bits[] = {
>>>>>  /* Trigger a OOB (out of band) request to the GMU */
>>>>>  int a6xx_gmu_set_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
>>>>>  {
>>>>> +   struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
>>>>> +   struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
>>>>>     int ret;
>>>>>     u32 val;
>>>>>     int request, ack;
>>>>>
>>>>>     WARN_ON_ONCE(!mutex_is_locked(&gmu->lock));
>>>>>
>>>>> +   /* Skip OOB calls since RGMU is not enabled */
>>>>
>>>> "RGMU doesn't handle OOB calls"
>>>
>>> Technically RGMU can handle OOB calls. But we are not initializing rgmu.
>>
>> Oh, I glossed over that..
>>
>> IIRC the reason we delayed 612 support in the past was to make sure
>> that the RGMU FW is consumed, so that runtime requirements don't
>> suddenly change one day.
>>
>> If you have no interest/way in getting it wholly supported right now,
>> can you at least make sure that the driver requests the firmware and
>> exits if it's absent?
> 
> adreno_load_gpu() calls adreno_load_fw() first thing, and will bail if
> gmu fw is missing.  (zap fw is a bit more awkward since that could
> come from dt or device table.)

Indeed you're right

Konrad

