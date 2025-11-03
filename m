Return-Path: <linux-arm-msm+bounces-80091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 35742C2B848
	for <lists+linux-arm-msm@lfdr.de>; Mon, 03 Nov 2025 12:52:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 66E224F8E51
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Nov 2025 11:45:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 951F4303A24;
	Mon,  3 Nov 2025 11:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k/J1m/Im";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R/FeOeax"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24864303C9A
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Nov 2025 11:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762170290; cv=none; b=ff/o6nNvhiMuiGXfTi9eZt85+qnTPAW8RO6LN/2OXD8VwmJPzQW9XOIA153Q775pqE4nw5y3RhKm+3Aqdfu1z0xBiaYpYtYuI8YJaeUalqg3lPTRXcd7uXHvsUhNTuCW/JJKqX2lZtZrITOLlH6oh9ZWyLtxCruj1Sz+QiHiJjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762170290; c=relaxed/simple;
	bh=78couzGyGlQWvfkwHhJwUIZfTijNdF4uPcd0+FmU9EM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p3sO7gD3RJk+kqyXtyVevMAWoJXN4vVr/j/m4fJEQQ1I9PPsRCIsB/VdVhSMVcUNsgL/SH0tAKnHPrrVrc939gnsrEJ4vVJrHMfvnr09m1JIGMVdh353H8MTMkR1JEq5k00hLEbxVDer1W15K7Mh3wQsdKDOGO7nXFoOJU+P0Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k/J1m/Im; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R/FeOeax; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A3AIQno2755662
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Nov 2025 11:44:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MGzSna7Z/0B1jw6cXgA4Dygu5B4WwM9yg+V4B8uyOFw=; b=k/J1m/ImlB9cCQ+6
	+Zx/PgZAw1e3i7vHCdFl9/4d4licSm+zsOjG1QwjJBURgVfMRtrKRIAjjDy7AB8a
	7DuQzVNORWJl7NsZsoCXNhWY+iLEaNHVhityKe8jgqHTRDuQusLeYfFBB9RwRmfg
	tU5x9eF+VBr75+J9Im20Weza9EwpnO0iClIt2rllD+Z/4xRJZsAgcpuHagIMU2CJ
	nfR58M1yWWRKKgWe281wVJBJ12otuktl4/csA7v3oIqeRQGW5CpgA4c96EhvOnnw
	nQmSD75YdS9XvxC6mW9aY0wa5ogkyckLuibOnaF2FSBEsBbBCJPTWJENggEGALHs
	0EII0Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6th9r6u9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 11:44:47 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-87c262c72b5so12322286d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 03:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762170286; x=1762775086; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MGzSna7Z/0B1jw6cXgA4Dygu5B4WwM9yg+V4B8uyOFw=;
        b=R/FeOeaxWMPv5G0kXJynoYtOkHW5RZZ0Y+gGeacWpyylBwbim2Ag0MmGD6gH8zXos0
         1/dNLxAReCP5Nc8W36Ej4Apfjo6c8a7sSIkQW1vGTzG82AzDTp15s3NJeVBLu1S2nG4G
         SposjV/WM3l/6DyNQ5oiYByH6ZlFKN4ukwlB17iVaDn870socyqFzNdmb2MBnCf8OWth
         7nUOL3YInBUVLEld7mA9wtClwGVrJNlKvvc7QV7Vqlye3K9whvoigRKTsEFGDsUJA5G5
         usq80Ny5ETJ7Qo7JBP3T3NYaNw8KW96P+MplQKdHf7IEEgVGUwNM3trFwxkwKhB+AHZD
         KErg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762170286; x=1762775086;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MGzSna7Z/0B1jw6cXgA4Dygu5B4WwM9yg+V4B8uyOFw=;
        b=sv7R1/G8GGSyPAbTtmPHj8iMCGjvY4OE8MryIHXrc7mUzK4aD7YRwieoRBl5qPVXEA
         QJGNzWe2V3YFrbxxR99AlwLBSjxYAByGdGt1XenvQ4OLMPHLFqqFgfOJcWkjPvTbm8nA
         G5/0ISrTGjldxxKhHxZB3MtpCy5AqqEmoWgyOi2khiY0AaJOUZ5av5oCzTh6CbhGjL6R
         9h1ssrvw+LJSzB1ElhMFv3QLa/gVz0YphNQ4/WF3o9d6Yl3VJ5tlGBxtVE9hS1NyP+3Y
         AQFHSHQUKLL0v50KurKS/Hf6/nVpb+Okr0jrqaydbbzJWO8QOcQhxdpUwHIvKKZlw85N
         imdg==
X-Forwarded-Encrypted: i=1; AJvYcCXBuJGXmfqqAZGRq4iLb4WCDx5m2LGUksyxGYFlwI7LETTFOZT91v6lr6vUMjlWfQXlIpNcBb5I9q5ZnVLm@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj2gp3nkJvy6SarVpF8eqMmStsNHgifx+1SEUJANEmGtm/C40u
	eW3/roNauTBExD+2nkZxvSVY1ux57bJTI9lGIM+HO0CqasMmApemR66Bbdoea5Rr3V1dxfImQWC
	3BSd1K1HSKAA3YWh53+MKT/VW0Esex9yMos1j9FIPxLdoo9S6ndBlOx0MsJP35tRtgBpJ
X-Gm-Gg: ASbGncs+CVgnyDKQmbbQ/7Lrwc4BttAoxmW7hnynPqUb5UlaukZK8hFUBRHGb8xCUBB
	HVPlbZJLypyebIJWOqAU3oyGUxtcNP2sK4tbbfeDFW9V1/tNiy0SP0g4RgCL5+0Z3DOQjEYgyhN
	qbbx85Ul7vOyLoW0bMWMoXdzDFQRvJq3gxKQvIP7+xgH7tDKgaJTpZOOdXvah/FbERha36WQ4an
	dnY7L3D/U6Qhdhccjm+r8fiEK5PWawougu8AitsgT7tcuSDhX5qVtV4XECu1hhVfdYb2g3PmY6T
	GkWhS4itUtUXWJYQP59e4O4HHXwdSS5fxNMEJJf6I3pK5Je4lhU8RhdiWnVu/wN60rrNgj027Zv
	QjuPq2TToAayY+YFkl6tM55Le884+MzVNtIOErLOi0/yPulcgoG09IJx8
X-Received: by 2002:a05:6214:2b08:b0:87d:c7db:7897 with SMTP id 6a1803df08f44-8802f26f50fmr113779696d6.2.1762170286412;
        Mon, 03 Nov 2025 03:44:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE7HDR4oGKE7YvjUNK4SfxIARE+xpgeOD3N+t+XaeA+ttAVIE8suSRw89bGxUKlp/o0DJTuMw==
X-Received: by 2002:a05:6214:2b08:b0:87d:c7db:7897 with SMTP id 6a1803df08f44-8802f26f50fmr113779286d6.2.1762170285777;
        Mon, 03 Nov 2025 03:44:45 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64092e1a405sm7542470a12.31.2025.11.03.03.44.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 03:44:45 -0800 (PST)
Message-ID: <0ab3c556-8876-4598-a7d5-ba7f9eb33391@oss.qualcomm.com>
Date: Mon, 3 Nov 2025 12:44:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] drm/msm/a6xx: Add support for Adreno 612
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>, rob.clark@oss.qualcomm.com
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
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
 <7c563e83-031c-445c-bcfa-c04f4729622d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7c563e83-031c-445c-bcfa-c04f4729622d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: -dweAIZ3bwup0Bs0038Pgr8_qa5lyA8M
X-Authority-Analysis: v=2.4 cv=ea8wvrEH c=1 sm=1 tr=0 ts=690895af cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=IwubUePDlzt84yfe0skA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: -dweAIZ3bwup0Bs0038Pgr8_qa5lyA8M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDEwNiBTYWx0ZWRfX8ZKGQ+hx3m1Y
 xgdy9lRAQtHSnuIZK3fB4vOm5+Wf04JpmztgFELxZgk8jUGOL/k04hxzAv+yH3Qfy3pQBKdhFg9
 +pga0euALAYIMw1MAm4j5CzYsvW7C1XfWBR3iNxXR5+nI3YC6uk/0JyKst77y8t6AMOMXje4wmX
 QaxEJ1AGGF3tLzrFcAAVhcxulOFHm29/2+BAMsIAqMw6UEhTgScHR/lIrLCOFGFyfkisVPBj9iP
 RoiyTd87AVmojF9pTd9H3HnFGBXxjzMtCEw5WmsF3Uo+IDCQ/0sT86kaM2CJU5oC2QsdLp/Rt1+
 v13bluQJr/j3K5ogLhAkTiAONGmXgo8WwTP1GCYcC/GTyMPPwnxdY5CtFMAaz5lEk9wShgbWybB
 Tj2EciHn9H/YsLQGmhCkhl+NqixuAw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_01,2025-11-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511030106

On 10/24/25 4:23 PM, Akhil P Oommen wrote:
> On 10/24/2025 6:46 PM, Rob Clark wrote:
>> On Fri, Oct 24, 2025 at 12:55 AM Konrad Dybcio
>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>
>>> On 10/24/25 12:57 AM, Akhil P Oommen wrote:
>>>> On 10/22/2025 8:43 PM, Konrad Dybcio wrote:
>>>>> On 10/17/25 7:08 PM, Akhil P Oommen wrote:
>>>>>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>>>>>
>>>>>> Add support for Adreno 612 GPU found in SM6150/QCS615 chipsets.
>>>>>> A612 falls under ADRENO_6XX_GEN1 family and is a cut down version
>>>>>> of A615 GPU.
>>>>>>
>>>>>> A612 has a new IP called Reduced Graphics Management Unit or RGMU
>>>>>> which is a small state machine which helps to toggle GX GDSC
>>>>>> (connected to CX rail) to implement IFPC feature. It doesn't support
>>>>>> any other features of a full fledged GMU like clock control, resource
>>>>>> voting to rpmh etc. So we need linux clock driver support like other
>>>>>> gmu-wrapper implementations to control gpu core clock and gpu GX gdsc.
>>>>>> This patch skips RGMU core initialization and act more like a
>>>>>> gmu-wrapper case.
>>>>>>
>>>>>> Co-developed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>>> ---
>>>>>
>>>>> [...]
>>>>>
>>>>>> @@ -350,12 +350,18 @@ static const struct a6xx_gmu_oob_bits a6xx_gmu_oob_bits[] = {
>>>>>>  /* Trigger a OOB (out of band) request to the GMU */
>>>>>>  int a6xx_gmu_set_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
>>>>>>  {
>>>>>> +   struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
>>>>>> +   struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
>>>>>>     int ret;
>>>>>>     u32 val;
>>>>>>     int request, ack;
>>>>>>
>>>>>>     WARN_ON_ONCE(!mutex_is_locked(&gmu->lock));
>>>>>>
>>>>>> +   /* Skip OOB calls since RGMU is not enabled */
>>>>>
>>>>> "RGMU doesn't handle OOB calls"
>>>>
>>>> Technically RGMU can handle OOB calls. But we are not initializing rgmu.
>>>
>>> Oh, I glossed over that..
>>>
>>> IIRC the reason we delayed 612 support in the past was to make sure
>>> that the RGMU FW is consumed, so that runtime requirements don't
>>> suddenly change one day.
>>>
>>> If you have no interest/way in getting it wholly supported right now,
>>> can you at least make sure that the driver requests the firmware and
>>> exits if it's absent?
>>
>> adreno_load_gpu() calls adreno_load_fw() first thing, and will bail if
>> gmu fw is missing.  (zap fw is a bit more awkward since that could
>> come from dt or device table.)
> 
> Correct. And RGMU firmware is available in linux-firmware repo.

Thanks!

Konrad

