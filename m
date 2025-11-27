Return-Path: <linux-arm-msm+bounces-83660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B33C8FEA4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 19:23:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6636E342312
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 18:23:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5B7E24886A;
	Thu, 27 Nov 2025 18:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PXlJnZee";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dvsuagI3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7DF3009F2
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 18:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764267822; cv=none; b=DdYbwYMdrYSdM9yMUAZLxg7l6bklrmDvaZeCdbMP7jVQahejoYk/VFve08YBTGnh2mNSZ0gLQdbVwMGWqJ3Y6OTP6lVU4OBrIxeR8Nw/6yWS6Tc2jxpHdkLPQcqMV/mlcgWWXpigHw/afQfg4P3rcukZHEZpiprPWG6kvqx0nOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764267822; c=relaxed/simple;
	bh=pGvZ5SattYYHOiHhfNEXrMAp3ftWVa2ZtWqec5muQN4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BZcdyQs22o3Q7gLoTVfigC5PA9DOigOqWRX3yCZ0jzkulVaPjBaD6tCZBLwuXI+xhRALi+yXcg2TOHfpZt1A83ufLJ+Cqtk3cERUZOn4o+2QYSBkR3QLOF2qY2dMFN55+7gF72U7PzrrwEoKwTaSkbo7AFm578VthjGsz9R/FjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PXlJnZee; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dvsuagI3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ARA3bNj848568
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 18:23:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IUchDNtUE84gJY1BIo7DyrQV1aOljy5HhZHPH/qoZ3s=; b=PXlJnZee5fix1eQK
	pWveOSQUVQ9grdsqlTkS+zIy108BabjuXjxPuOsqyiYBucii8BzrHecpPMnd4NAV
	HA86O6byF+UPp6aOC2fs9lZ645L31XPFcsiVeQd4mq5Jm7XXYF69pbdiRM35LBAK
	68wF9DNvKx/5KTdT6L8KkzYh/f7fZQLRoKVI0qHl4QQ9d2iJ96u6j8mH9Hi76nWO
	LFDmAQOhY5O5AGhbcnqPC3Rjn0aGEWLwIUOtmo4KZ6EjCSL9OaPVhtKysOBT+nYY
	fUkfAQ0aqW2WGgXnO0u/ykh4eXil64dYmtLIC3Rq8m5TlDr1qSONFDrh21GP9hRG
	1hQGMA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apmjd96p9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 18:23:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4edace8bc76so1803891cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 10:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764267818; x=1764872618; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IUchDNtUE84gJY1BIo7DyrQV1aOljy5HhZHPH/qoZ3s=;
        b=dvsuagI3vuPnHVUahwXkQQLIRKMAsQ8brhdflkTLxuRT43emA55l7pKWrCEYQ4cSEa
         NhbQkWQDQwkFzlST2GHATgzAH7SjiussP3S1rJEy/DJxLT+QzbRsdMit9MqEFCLKKbSg
         nAyxy9Dkq52IC8UgovtcaSI7AgscJJm679rwIuW2qU+b8nY7Z+Fnmmkp2ZQXznJlziOi
         HOUge5NvfGDt0cdnhLh2mbBJzSk5L/kcx0CszUnjYDZMgzJajapRhe9pQzn+u+xXXnPM
         +pYwAeRoqX/IVsdziPcAfR7FPCzKogxS68KBC6Bgdm4KgNxzTTVRlZtnadsusEZ3u4x5
         mh7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764267818; x=1764872618;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IUchDNtUE84gJY1BIo7DyrQV1aOljy5HhZHPH/qoZ3s=;
        b=rM4dykgrdxZbaNOyb3s0r0gt9iZUPMtfJAFJivrJp/MVJ8V2J062HRcJdEdBOoCrAU
         W2VQTfHd6v+hYJQk4hbBZPpi/g4DiqEKrQkp8CCMO+lZe//FicenCO0AjuitCcFv4GcW
         +VCXn8e3FPhCjKJ4nSuSfoo4BYKOjJmE+4CF+Di1fX0R7pPiBdBVEOWyAMBKUsJNzy2H
         R9KqLUVqqhgPn/ichnV8pEIVy5EcL2hxZwRK8X517PjYEOVjv3xUgz1tBk28e3vOZrB+
         7P/gwE9MVTAoSYRWMUc7WpYW+foT0qP86VoG9d7tIWktAaZEvxYrmWOjCbFmbGFA9VpJ
         phqg==
X-Gm-Message-State: AOJu0YwDhh1CdNt3/kfQaGRzUjjN7yiSV/8/2Q+nuuFblyGlMtH47iu0
	CsiplV8ot98JVrHoY0p+9zfk+WVBAe6eiy9tDYEkLPgb4C3f+2rguihjSaIscX5BINNdtSlcYtv
	jpEPfVQu9IHJfThe6K8FPMROKasHAXKo/xL0ArJuLOsbaoG7njc8KP7HJuVbUpU3lQV56
X-Gm-Gg: ASbGncvCDto8cb+sHj7tM8O2d8OeLBEwLmBH656nhUQsm377cb07prxJjZnTM6JsSPt
	z3ctgDzN0sKDn1Gub0UAAwqpdD7e8Y99Hc9k6cvVvkBvSWUVLf5QeP2Cklu+gZXLGPvghMgG8fN
	ZwG1AwkRYLgeLfkS9Dt4SxImeTkmtbaVbEnRJP7PSNt1WV4z7SeR/f3mv79cJrLfuJW8qGlk/lm
	4vdmN2+a27m6oE5hKj6iLZgDvgELyE3RpomiiKeaLrfpEoO86JMVJQabbsaxB0KEjuLc/Ft74tw
	gb2yl1iTLeVnw9rVimIQMOaluM/L1bpkeI/6t0QOYlaJ6qrmcwpdLRUQd9CoN2KtSI7F2NeJyIu
	Q+I8Fa794uidIdjRA1ut8FcNQY57X6MZnUACx+K7nbBz4kl4pgdj/dE3psl54VpJeD2s=
X-Received: by 2002:a05:622a:48c:b0:4ec:f9c2:c1ec with SMTP id d75a77b69052e-4ee5b786a91mr241585871cf.9.1764267818302;
        Thu, 27 Nov 2025 10:23:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEFeMQ9EMbLd3D677mJIIOmwB+k9eDLur9GvtzjsK1+MSFnfAPwRig3yaBnk8ECV9phL4g1Bg==
X-Received: by 2002:a05:622a:48c:b0:4ec:f9c2:c1ec with SMTP id d75a77b69052e-4ee5b786a91mr241585631cf.9.1764267817872;
        Thu, 27 Nov 2025 10:23:37 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64751035c3bsm2094550a12.19.2025.11.27.10.23.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 10:23:37 -0800 (PST)
Message-ID: <7f723f9c-93f4-43b2-8421-7af5f697c752@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 19:23:34 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: Fix a7xx per pipe register programming
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20251127-gras_nc_mode_fix-v1-1-5c0cf616401f@gmail.com>
 <58570d98-f8f1-4e8c-8ae2-5f70a1ced67a@oss.qualcomm.com>
 <951138f1-d325-4764-a689-e1c3db12bb90@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <951138f1-d325-4764-a689-e1c3db12bb90@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: DZGYZRpAOVbW4XQm1nlgvHqv0crGJhVZ
X-Proofpoint-ORIG-GUID: DZGYZRpAOVbW4XQm1nlgvHqv0crGJhVZ
X-Authority-Analysis: v=2.4 cv=OPcqHCaB c=1 sm=1 tr=0 ts=6928972b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=6nOnMbRXApaOt5cKipAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDEzOCBTYWx0ZWRfX585xNDyGA0Ae
 RhyQQOGhFIOXTeYjXxN1/NV0PJABlqs6xKHH/gemz39d7gOGon/Ii44oE5KNEEYp+Bh/2O5fg6Z
 QS+TXUcekl4wRmptTmf10SCkbK1+VUa+ISw0gNqeXBoijCBj1Jxn39RhsHEDcGGfmxMZb57dSbk
 prR3dYlAm3aprkIWwH2YLcKrpTd1Ef3Sac+MwFv8cIEsgb89TbXW7o9mscz9LGESWQltMjwSsuM
 DuOS2eL2xaNOHlxSfxuQzGCEfQxFxz1gXZ5G5B36i2f/hHSkaprndCyXHx8VxDJlBncD+KGa8RR
 w2ajGVcr4Ho9Q7wjvDNtyh/SMS6CLeP1TnezkYaR/w3ywQW3ToWBi1vrmnKyvHuxUHmRsUibSlW
 bkbvaY73ATmiOMhLEbNV323FdylpeQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270138

On 11/27/25 7:14 PM, Anna Maniscalco wrote:
> On 11/27/25 3:25 PM, Konrad Dybcio wrote:
>> On 11/27/25 12:46 AM, Anna Maniscalco wrote:
>>> GEN7_GRAS_NC_MODE_CNTL was only programmed for BR and not for BV pipe
>>> but it needs to be programmed for both.
>>>
>>> Program both pipes in hw_init and introducea separate reglist for it in
>>> order to add this register to the dynamic reglist which supports
>>> restoring registers per pipe.
>>>
>>> Fixes: 91389b4e3263 ("drm/msm/a6xx: Add a pwrup_list field to a6xx_info")
>>> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
>>> ---
>>>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c |  9 ++-
>>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 91 +++++++++++++++++++++++++++++--
>>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>>>   drivers/gpu/drm/msm/adreno/adreno_gpu.h   | 13 +++++
>>>   4 files changed, 109 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>> index 29107b362346..c8d0b1d59b68 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>> @@ -1376,7 +1376,6 @@ static const uint32_t a7xx_pwrup_reglist_regs[] = {
>>>       REG_A6XX_UCHE_MODE_CNTL,
>>>       REG_A6XX_RB_NC_MODE_CNTL,
>>>       REG_A6XX_RB_CMP_DBG_ECO_CNTL,
>>> -    REG_A7XX_GRAS_NC_MODE_CNTL,
>>>       REG_A6XX_RB_CONTEXT_SWITCH_GMEM_SAVE_RESTORE_ENABLE,
>>>       REG_A6XX_UCHE_GBIF_GX_CONFIG,
>>>       REG_A6XX_UCHE_CLIENT_PF,
>>> @@ -1448,6 +1447,12 @@ static const u32 a750_ifpc_reglist_regs[] = {
>>>     DECLARE_ADRENO_REGLIST_LIST(a750_ifpc_reglist);
>>>   +static const struct adreno_reglist_pipe a750_reglist_pipe_regs[] = {
>>> +    { REG_A7XX_GRAS_NC_MODE_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
>> At a glance at kgsl, all gen7 GPUs that support concurrent binning (i.e.
>> not gen7_3_0/a710? and gen7_14_0/whatever that translates to) need this
> 
> Right.
> 
> I wonder if gen7_14_0 could be a702?

No, a702 is a702 in kgsl

Konrad

> 
> If we do support one of those a7xx GPUs that don't have concurrent binning then I need to have a condition in hw_init for it when initializing REG_A7XX_GRAS_NC_MODE_CNTL
> 
>>
>> Konrad
> 
> 
> Best regards,

