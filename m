Return-Path: <linux-arm-msm+bounces-67036-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6821CB1529A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 20:20:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D3D6718A45F4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 18:20:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C42B62459F6;
	Tue, 29 Jul 2025 18:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q2TITawp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CC61DEFC8
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 18:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753813205; cv=none; b=SgUyOB8EVlchcDm9ComM4/WegU7vy82wUSJUQdoElKl78m+JtikjYz8DxwMNoSVDt/+IAbqZBDILb3Q3Vv9uHNuH7+CLqAjhdcnbjjBwiNZyQG2312GfbOs7BVgEnAI0SbYdFV6JsQm09sHMQRKK2JdfPP8hvUTRSzqUUVolMhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753813205; c=relaxed/simple;
	bh=VDE+uz8ZRjuzdabyq1FdVvOSD94+IkhP09IItTR59+g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MM5u7odXA1j6eZwT3nIrs80//UiOPqDHVmf87sYKxdHwxMZlpPB5s7Xr2IE8oAN8iFoCGSKeB02B2W9/QVFV06u2iJHXv69IJQ5k6cYpDVCgBU9Ru85dZhy0mMHp/Ousgxru8r/L6UFIYjU3E7y1IO9w5b834Sl7Qt5uTdbNFUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q2TITawp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56TI6M1M018302
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 18:20:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lcsta1yjIbei4fuovlusUPalhkFx/bRo2Mx3CVdJirA=; b=Q2TITawp04pzzAhu
	xgbOv/S3s9a9GWetJyEZIkSGmrKEpvOPuMlD7Izf4baGmdaurpXRt9l+ANFsEoWu
	w73V3gK+5KM5/kVy9RKGiziNE18pFPqGNZWLvJsTjQcopKW5Tj/kb6/8OXuBN5CB
	L7NUd+ZIKA8UdLD5hblJYL170pAh0Uow/7/7cveYRpNmfzURSX2MvJaL1VE98tys
	v/8jgbJ7/PaJq0mPYXyYPx7SmFX+mlgm3Xl/WcOZiJbSJD8FySltSjB/Y+gE8jjC
	84SlWIWs7NzpLOUN5rCISI1Dt0XWXK128LqYaozH+l8WFR/OPo34NSIP0nz2WtPF
	AHn/Lg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pbm12eu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 18:20:02 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2405fdb7c15so16986055ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 11:20:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753813201; x=1754418001;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lcsta1yjIbei4fuovlusUPalhkFx/bRo2Mx3CVdJirA=;
        b=H2IyRfEVeiWOfzYfdUTOefUkWytZGfTwSY1rFDrA+u3g59+z+P8eqGLVzyv7c1//Un
         WfDUitB6E/XGk33TkGEDZBoT6NF3X76zlMcUW82KhCPIkafsbegSM+ydAJlK0nv0tPKD
         7CASgjKrHYuR6R9ASAyP4suKKBeBo4FaW+HtJaoGPaB7xZVn7eFzpWn1aEzi2+9PNOSj
         N6yKr0l3HOQhMekiEnHosNGqiysobqcG94lE+lIhaEQjSGNuGO8fQiLSCEect+QMzlAD
         5CwqXKMmbfEh/cmPJgsZ1ibWTXBBz4Ay9Gan1s2yotDhfiEoVT/FVDvISqB9OkvOSuLS
         vrLg==
X-Gm-Message-State: AOJu0YyiofEc6+Ik5kQdfcO6/wMC3D2X1/sx08ET6ov2JRk/G0nVnHt6
	4vbpWxv+9NnuEuxRuvacFIqSOy34QgBggUx8YEUd1NGuYBVij94OyXCQwDsaZrISiJU3x77sjZI
	9hVLTghTaMS4HgKUxpACAREEdGmBThacraTwpnDGdCaOiapnksg7VARJ1Lb3vwGH4lLn3
X-Gm-Gg: ASbGncs+lGhGOh3/u5IkflR1h7lfLYqbqzly4ypu1ZQDQWcLEDRNOm4DcerJzZrI/KG
	j1L87+dutKGYv29RSqfv0TObWIHH51d4PA5euhRqBztGkBw+e0xTkQy0+ZG7pT8EF168qkwTNIp
	xpAK2uAKggRzaOGfv8QIgXysp5BAD/Q2fjQNvFyMiaczS3zxWf34euPKYjhB6OPFnU/VxjpBAqH
	vuB58tcVPBK/Tu0fj/+8gIEMGG7xL4L4UWEykOvIwjLYJHgMowWSV0TFQwz27Lq5Yd1nbTrn5BD
	bLXGf1w5orOQ6Qeih2rw/rJNx07NUSSvV840YkiXQ4xndyQaRXAGoYMnCmst7SZ4
X-Received: by 2002:a17:902:d4cc:b0:240:6406:c471 with SMTP id d9443c01a7336-24096a4f7e5mr4814395ad.10.1753813200874;
        Tue, 29 Jul 2025 11:20:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGa6BasIaRExFV/BwNT4qsayfxOvO5gmjUpfnYyJ28K3IONSoxFXWJUahLqssfmGes+zOsqug==
X-Received: by 2002:a17:902:d4cc:b0:240:6406:c471 with SMTP id d9443c01a7336-24096a4f7e5mr4814125ad.10.1753813200416;
        Tue, 29 Jul 2025 11:20:00 -0700 (PDT)
Received: from [192.168.1.6] ([106.222.231.177])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23ff1dbec8esm68679145ad.194.2025.07.29.11.19.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 11:20:00 -0700 (PDT)
Message-ID: <c44eb0a7-3656-412e-8b21-fdc52866c0a4@oss.qualcomm.com>
Date: Tue, 29 Jul 2025 23:49:54 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/17] drm/msm/a6xx: Enable IFPC on Adreno X1-85
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-16-9347aa5bcbd6@oss.qualcomm.com>
 <cfbad162-e629-45c9-8436-74bb6fc416f2@linaro.org>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <cfbad162-e629-45c9-8436-74bb6fc416f2@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LsaSymdc c=1 sm=1 tr=0 ts=688910d2 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=9XpMM9ZEX5jLuhR58p3+Fw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=oxwwQDlBbdW4oIJT5RMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDEzOCBTYWx0ZWRfX53dUHfeWwaJg
 pab4Z5MiD9rU88dP6FP1pRs9yBJMFKra7pzceVFIDH89/kduFBrGEOBmVazkfO+6CZXULXC05Xz
 OfLUYG60okva03p0YGt9TVBgwVZz+KwTwWc0EJMmgiOAtEsX+7chdCeE1CtRtj/EGP/QNla3qa6
 fPl4vmxdJkKmkjq8SEr7plHsqOl6geiYyPApHSj2BhEVPX9JN8psF38vU5sd+sZtMJtBxzw4cuX
 ZiCIQXVNUIzKWur73AxkpWvzmvrXTQJrGVMxdRCHAwP5Mb8LlGVgmRUpJkk9+pRJGeS2BEsX/vR
 uzpKAhCqZSsw6DDs9N4iEHED+Lk7nkG2McxOgRrVA6UVxfqwdlkcH1YrMIqA/LkHDFkOcp8gTal
 du8hMcGXA+wvA/V1vsHsyTNVa1YdbTxxEEm5xxAPJacYs4R7kTPyJY9jhQiqDldExEcbJm5+
X-Proofpoint-ORIG-GUID: mMgdJ-tSj1jv0EL4NGCI8LaLLH32NrWW
X-Proofpoint-GUID: mMgdJ-tSj1jv0EL4NGCI8LaLLH32NrWW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=959 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507290138

On 7/29/2025 7:36 PM, neil.armstrong@linaro.org wrote:
> On 20/07/2025 14:16, Akhil P Oommen wrote:
>> Add the IFPC restore register list and enable IFPC support on Adreno
>> X1-85 gpu.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 67 +++++++++++++++++++++
>> +++++++++-
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 15 +++++--
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>>   3 files changed, 78 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/
>> drm/msm/adreno/a6xx_catalog.c
>> index
>> 70f7ad806c34076352d84f32d62c2833422b6e5e..07fcabed472c3b9ca47faf1a8b3f7cf580801981 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> @@ -1343,6 +1343,69 @@ static const uint32_t a7xx_pwrup_reglist_regs[]
>> = {
>>   
> 
> <snip>
> 
>> +
>>   static const struct adreno_info a7xx_gpus[] = {
>>       {
>>           .chip_ids = ADRENO_CHIP_IDS(0x07000200),
>> @@ -1432,12 +1495,13 @@ static const struct adreno_info a7xx_gpus[] = {
>>           .inactive_period = DRM_MSM_INACTIVE_PERIOD,
>>           .quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
>>                 ADRENO_QUIRK_HAS_HW_APRIV |
>> -              ADRENO_QUIRK_PREEMPTION,
>> +              ADRENO_QUIRK_PREEMPTION | ADRENO_QUIRK_IFPC,
>>           .init = a6xx_gpu_init,
>>           .a6xx = &(const struct a6xx_info) {
>>               .hwcg = a740_hwcg,
>>               .protect = &a730_protect,
>>               .pwrup_reglist = &a7xx_pwrup_reglist,
>> +            .ifpc_reglist = &a750_ifpc_reglist,
>>               .gmu_chipid = 0x7050001,
>>               .gmu_cgc_mode = 0x00020202,
>>           },
>> @@ -1459,6 +1523,7 @@ static const struct adreno_info a7xx_gpus[] = {
>>           .a6xx = &(const struct a6xx_info) {
>>               .protect = &a730_protect,
>>               .pwrup_reglist = &a7xx_pwrup_reglist,
>> +            .ifpc_reglist = &a750_ifpc_reglist,
> 
> So far it's stable on a750 so I think can safely add ADRENO_QUIRK_IFPC
> here aswell.

Thanks for testing. I will enable it for a750 in the next revision.

-Akhil

> 
> Neil
> 
> <snip>
> 


