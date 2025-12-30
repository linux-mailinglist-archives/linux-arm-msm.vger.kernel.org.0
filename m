Return-Path: <linux-arm-msm+bounces-86976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBC6CE9C09
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 14:11:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 20F7E300294B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 13:11:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC20222156A;
	Tue, 30 Dec 2025 13:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lYAegnzK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aAefB9gJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B26C212FB3
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 13:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767100294; cv=none; b=ulaMneGJvADgvKJr7zmQI25Lwc8GsIogXkxpd16ncBxv/vw08oBTjlxQh+WbIK+57KJa49vjx2tzi9d6V9PUrTEl6lZt0jMUTadF+prjYho30i4gDXNun/a+BxsnwqbhkwobgWDccJ45HFIK1htM6h080ZHirB0JWW2KbwOVCI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767100294; c=relaxed/simple;
	bh=Dt2eP+Y7Oqwl540YyF+ybi9qy2vn6WdgODkOrzIHOsE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tZ2ISIeAwqTgCkF6o8hy4cHqsGAarjQuXmo+xknXEf2gJULQGAzakwYDTFkWEBU6n916xYj66j/EqARf7ADdPokiMI//DMc0jiQO2FDOS9vnR44naf+3n9a3i68kcBYNLXT25Mvkwdbno36x3Am6Pxbby+iKg+a6rsOBrv7yohc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lYAegnzK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aAefB9gJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BU9cl3t2723181
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 13:11:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dt2eP+Y7Oqwl540YyF+ybi9qy2vn6WdgODkOrzIHOsE=; b=lYAegnzKi4JEfAuq
	2ATRE3Lmbp+xuGRNyXZgiHAMrFok9ojU+qlzCYbNR81Nz15j+Xzhrzp0JL0OfFOY
	PlEB/VPSqxzSjgM9CsHzD8jFrJ/tMzK5GGDIhXGsOwhlYAjM1hPcXMTc5N7z+kIm
	Jmb+qbcHq4XEd5SeSicG07yzelDVJhtymUfaYkb+vlooSLP22gPTdFmjmhcp5eTG
	FKVLUhziAK/wLjm7SMpClDIKY/c4HyNUL/+4MeV5VxKIzsp3O9PVEa0Oz2kPSz7c
	Xws1KshvdKyrhBqlYvsE+NeWpc7xifEMyWhudeT5iZKidIahoLbKovo6e+zcvnzh
	3EdPSA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc0vdhw7b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 13:11:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b1be0fdfe1so417480785a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 05:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767100291; x=1767705091; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dt2eP+Y7Oqwl540YyF+ybi9qy2vn6WdgODkOrzIHOsE=;
        b=aAefB9gJMo0y/hJpeazIBv2kzScqxcJL/2kt1SSr3yJ1SqbcEE6WPxgCiML5wYSSdE
         d7ePCJ+28KkAnrDravPS2+UCbBDQARiLI1rQWURpR535N7JoXkzoeAJ8NtlLSOit/aP9
         XNsBM46oJfIijmj1nlV0GrrjHzklCYoODorV+GOJ3D0dqoN1OppISJSqH4m5d5CJ4ty3
         ldyORBm14pp2KNbdqlMLfX7xaBoTu8DmgVQUk3GG0lo43Nnj0l5PRLwhNGfseEdneITB
         NVqIlcqgZ5MvSye8Uo1CHTKCbUrBJlrtxADaKEgBy117xo+mzyBvYOq1k+WLH2Vr+J5t
         vRkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767100291; x=1767705091;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dt2eP+Y7Oqwl540YyF+ybi9qy2vn6WdgODkOrzIHOsE=;
        b=D7E3ExMhrwcN2mcmg61z+8Raap3iCT3VsYqWgeZgs+z3swDAxi4kX/46rUK7GbEL54
         rrDeT/htof2iyxiIGsHLYCtWjd9seA3Qlyl/JGxB3HH59HKHwoIrFTA1lxrYYo1ogEgh
         MKvdfuvkU9vHbQ27dZ+6o27NND4pmEhnF1jeyW/Sm0aKRgaBvKr0ZVRhotou2qjWYk3X
         CF7AxV8epg7/mU8GH62iWlp3fwxju65YvJtGgSqIuUTlijojhefaEphf1iV+bm7H/dZ2
         EwYuarU/KFfQfPMZ3tprR0/vBv1xj9Xhy0PRpcPwxM2ssSL3iapN+ByBOPheMyUyPA6f
         dcIA==
X-Forwarded-Encrypted: i=1; AJvYcCVxb8lP1d2rE2dVskT9VlyjmF+Gy+ZquDR86ISpT3hwsbhAApKXbvk7JOv1p5Xyv8WSnjsk4WPBI8HFk4va@vger.kernel.org
X-Gm-Message-State: AOJu0YyJdEt1mDoCzOs1OOhjOrgKJvWD7dxXX43C7TRl0+M6wmtqQbtN
	9axgEaCL+BCGn5ZPDcjoxGIQjbhtz/DtVBiLbVgKWnI7xiRvplAbE8tzf3zXdhi9kwBfoVgsP/I
	BNZrxsCsuviQZhUYsEbdrhNrJME0Kv4dO8/WiHz0r6xYTrFGn6gOG41eqP/dMrjyEvm0b
X-Gm-Gg: AY/fxX6Cb3UydKTT47EUm1TMiQaMmO2OhFavbBbrOMwlR3j0krUYZvKlPWqhY+9fTZD
	o0zPklgEsctt8+FDksxsd6skWVADB+5/TXt9qBHClKzQj8LKT99s0P6UF9DEzF7TiCiBQ6rP4wb
	vlVEz77ZBKg14q4KerEIcEiof4WiFAJyBSIDYN+FJQ8LA3jTnNWvyyDIFyWluBPkYOXgNXtmKfQ
	C3rZfGcIaE6jrB2b1Wm7pbiQpJMZHz/ZQbLWIJadNU5nStf4CQhj++P2ccA9tEW+3fGN9nwka+j
	S8+E7/Vm+2Q4Fqu6Fa/jH67F3bYUvQIUNGpwRgtRLjtT1mqJUjgvku2AVc0Ck9kC6dP0/oShiPL
	jLRvlaDKWshX5VG0GEkE/hmEe2zsBdvhSHZUlQKWBXTBnaI/xfSJKb+giaYIopKkP+w==
X-Received: by 2002:a05:622a:1993:b0:4e0:b24a:6577 with SMTP id d75a77b69052e-4f4abcd2349mr370256671cf.2.1767100291187;
        Tue, 30 Dec 2025 05:11:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFOus8Oo8rBOHgphg16T4x88GeQXF22rIvKQDq2q5Y4+zs1Ub9Svq9UC10KtPEUbRRG0YDfxw==
X-Received: by 2002:a05:622a:1993:b0:4e0:b24a:6577 with SMTP id d75a77b69052e-4f4abcd2349mr370256271cf.2.1767100290536;
        Tue, 30 Dec 2025 05:11:30 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9159a6ebsm34519958a12.27.2025.12.30.05.11.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 05:11:30 -0800 (PST)
Message-ID: <563ce29d-0a96-42a6-9c05-51cf16244cc9@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 14:11:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] remoteproc: qcom_q6v5_mss: Add MSM8917
To: barnabas.czeman@mainlining.org
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251228-mss-v1-0-aeb36b1f7a3f@mainlining.org>
 <20251228-mss-v1-4-aeb36b1f7a3f@mainlining.org> <aVJhH17XH1srlroL@linaro.org>
 <d531f1346b59af06c323f393883b1d13@mainlining.org>
 <2898fde7-2b3b-471b-8f8f-a02cb6953aaf@oss.qualcomm.com>
 <eeda5a8b6f5a9dc5cf5440afc07c40fd@mainlining.org>
 <d3ee6ba3e66706c304ecfe6afc4b75f2@mainlining.org>
 <10bc67e8-e9e9-491d-9e38-4b55735d42fe@oss.qualcomm.com>
 <a142c6c16ff298fe782b3fc80efc4a30@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a142c6c16ff298fe782b3fc80efc4a30@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dfONHHXe c=1 sm=1 tr=0 ts=6953cf83 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Oh2cFVv5AAAA:8 a=qC_FGOx9AAAA:8 a=OuZLqq7tAAAA:8
 a=QONU935ig0yVzzykNcAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=7KeoIwV6GZqOttXkcoxL:22 a=fsdK_YakeE02zTmptMdW:22
 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDExOSBTYWx0ZWRfXzY/8+BGq4N+Z
 sbVsvkbkT6eKR2q/scs+MmTRhLzD9auPK0apQdhM+ZTuEFBwZjD96qCRUdv70K239Pd1luPd8EY
 z7WC/X+JPvLh1lQ3ZydpxFosW453E9OwCDfGULfIySqPmG+cwejFTKrqSrYEr8unThHgno0V5mp
 gL5Ve4o8KJg3iKjY1fsX2hFZQ4AmXN/AUUYh29Od6dggmNOI9LUne/jldFDB2te3SwCL1WTerql
 bPIkXUU12Cn2VE1L9Ns/sRuI6v8fm0pNQZ3EXKgCGZgLE47PY1XIznkfv0vJEQgLIWfza+KPiEZ
 aRs/vmQZeE3RmPXdjTz+fgYXuRqCM42hF7opPc8O5M4rz1wQuCo4gRH+gC7VVeK6Y1hseVQSMof
 qystN2z64McJTvz74qIXejXruEODgqACKf2Cl7dGdugpGcdUXjadw9/F7b1qbz0lGxNaO+vDx6y
 m/B8V9fimgYYUR+oTDw==
X-Proofpoint-GUID: 6YNlC5j5Ds1TqQBpiILunUvnM_seBc6M
X-Proofpoint-ORIG-GUID: 6YNlC5j5Ds1TqQBpiILunUvnM_seBc6M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_01,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300119

On 12/30/25 4:25 AM, barnabas.czeman@mainlining.org wrote:
> On 2025-12-29 14:07, Konrad Dybcio wrote:
>> On 12/29/25 1:59 PM, barnabas.czeman@mainlining.org wrote:
>>> On 2025-12-29 13:51, barnabas.czeman@mainlining.org wrote:
>>>> On 2025-12-29 13:40, Konrad Dybcio wrote:
>>>>> On 12/29/25 1:33 PM, barnabas.czeman@mainlining.org wrote:
>>>>>> On 2025-12-29 12:08, Stephan Gerhold wrote:
>>>>>>> On Sun, Dec 28, 2025 at 03:21:54PM +0100, Barnabás Czémán wrote:
>>>>>>>> Add support for MSM8917 MSS it is similar for MDM9607 MSS
>>>>>>>> only difference is the mss power domain.
>>>>>>>>
>>>>>>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>>>>>>> ---
>>>>>>>>  drivers/remoteproc/qcom_q6v5_mss.c | 46 ++++++++++++++++++++++++++++++++++++--
>>>>>>>>  1 file changed, 44 insertions(+), 2 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
>>>>>>>> index ffafbe501a05..2579558fb567 100644
>>>>>>>> --- a/drivers/remoteproc/qcom_q6v5_mss.c
>>>>>>>> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
>>>>>>>> @@ -259,6 +259,7 @@ enum {
>>>>>>>>      MSS_MSM8226,
>>>>>>>>      MSS_MSM8909,
>>>>>>>>      MSS_MSM8916,
>>>>>>>> +    MSS_MSM8917,
>>>>>>>>      MSS_MSM8926,
>>>>>>>>      MSS_MSM8953,
>>>>>>>>      MSS_MSM8974,
>>>>>>>> @@ -749,13 +750,15 @@ static int q6v5proc_reset(struct q6v5 *qproc)
>>>>>>>>          goto pbl_wait;
>>>>>>>>      } else if (qproc->version == MSS_MDM9607 ||
>>>>>>>>             qproc->version == MSS_MSM8909 ||
>>>>>>>> +           qproc->version == MSS_MSM8917 ||
>>>>>>>>             qproc->version == MSS_MSM8953 ||
>>>>>>>>             qproc->version == MSS_MSM8996 ||
>>>>>>>>             qproc->version == MSS_MSM8998 ||
>>>>>>>>             qproc->version == MSS_SDM660) {
>>>>>>>>
>>>>>>>>          /* Override the ACC value if required */
>>>>>>>> -        if (qproc->version == MSS_MDM9607)
>>>>>>>> +        if (qproc->version == MSS_MDM9607 ||
>>>>>>>> +            qproc->version == MSS_MSM8917)
>>>>>>>>              writel(QDSP6SS_ACC_OVERRIDE_VAL_9607,
>>>>>>>>                     qproc->reg_base + QDSP6SS_STRAP_ACC);
>>>>>>>>          else if (qproc->version != MSS_MSM8909 &&
>>>>>>>> @@ -817,6 +820,7 @@ static int q6v5proc_reset(struct q6v5 *qproc)
>>>>>>>>
>>>>>>>>              /* Turn on L1, L2, ETB and JU memories 1 at a time */
>>>>>>>>              if (qproc->version == MSS_MDM9607 ||
>>>>>>>> +                qproc->version == MSS_MSM8917 ||
>>>>>>>>                  qproc->version == MSS_MSM8953 ||
>>>>>>>>                  qproc->version == MSS_MSM8996) {
>>>>>>>>                  mem_pwr_ctl = QDSP6SS_MEM_PWR_CTL;
>>>>>>>> @@ -826,7 +830,8 @@ static int q6v5proc_reset(struct q6v5 *qproc)
>>>>>>>>                   * Set first 5 bits in reverse to avoid
>>>>>>>>                   * "inrush current" issues.
>>>>>>>>                   */
>>>>>>>> -                if (qproc->version == MSS_MDM9607)
>>>>>>>> +                if (qproc->version == MSS_MDM9607 ||
>>>>>>>> +                    qproc->version == MSS_MSM8917)
>>>>>>>>                      reverse = 6;
>>>>>>>>              } else {
>>>>>>>>                  /* MSS_MSM8998, MSS_SDM660 */
>>>>>>>> @@ -2538,6 +2543,42 @@ static const struct rproc_hexagon_res msm8916_mss = {
>>>>>>>>      .version = MSS_MSM8916,
>>>>>>>>  };
>>>>>>>>
>>>>>>>> +static const struct rproc_hexagon_res msm8917_mss = {
>>>>>>>> +    .hexagon_mba_image = "mba.mbn",
>>>>>>>> +    .proxy_supply = (struct qcom_mss_reg_res[]) {
>>>>>>>> +        {
>>>>>>>> +            .supply = "pll",
>>>>>>>> +            .uA = 100000,
>>>>>>>> +        },
>>>>>>>> +        {}
>>>>>>>> +    },
>>>>>>>> +    .proxy_clk_names = (char*[]){
>>>>>>>> +        "xo",
>>>>>>>> +        NULL
>>>>>>>> +    },
>>>>>>>> +    .active_clk_names = (char*[]){
>>>>>>>> +        "iface",
>>>>>>>> +        "bus",
>>>>>>>> +        "mem",
>>>>>>>> +        NULL
>>>>>>>> +    },
>>>>>>>> +    .proxy_pd_names = (char*[]) {
>>>>>>>> +        "cx",
>>>>>>>> +        "mx",
>>>>>>>> +        "mss",
>>>>>>>
>>>>>>> Are you sure mss/pm8937_s1 also works as a power domain? It seems to be
>>>>>>> a plain regulator downstream (similar to msm8226/msm8974).
>>>>>>>
>>>>>>> Same thing applies to MSM8953 as well though and there we seem to have
>>>>>>> decided to model it as a power domain ...
>>>>>> They have this at downstream, i guess this is why handled as a power domain.
>>>>>> vdd_mss-uV = <RPM_SMD_REGULATOR_LEVEL_TURBO>;
>>>>>
>>>>> It seems to be just a normal regulator on both 8917 and 8953
>>>>>
>>>>> https://android.googlesource.com/kernel/msm/+/android-7.1.0_r0.2/arch/arm/boot/dts/qcom/msm8953-regulator.dtsi
>>>>> https://android.googlesource.com/kernel/msm/+/android-7.1.0_r0.2/arch/arm/boot/dts/qcom/msm8953.dtsi
>>>>>
>>>>> https://android.googlesource.com/kernel/msm/+/android-7.1.0_r0.2/arch/arm/boot/dts/qcom/msm8917-regulator.dtsi
>>>>> https://android.googlesource.com/kernel/msm/+/android-7.1.0_r0.2/arch/arm/boot/dts/qcom/msm8917.dtsi
>>>>>
>>>>> Konrad
>>>> It is different between 3.18 and 4.9, 3.18 seems simpler and easier to use it as regulator i will change it
>>>> https://git.codelinaro.org/clo/la/kernel/msm-4.9/-/blob/LA.UM.10.6.2.c26-01500-89xx.0/arch/arm64/boot/dts/qcom/msm8917.dtsi#L1375
>>>> https://git.codelinaro.org/clo/la/kernel/msm-3.18/-/blob/LA.UM.6.6.c32-05500-89xx.0/arch/arm/boot/dts/qcom/msm8917.dtsi#L1655
>>> Only question is left what about SDM439 and SDM632? They were introduced at 4.9 maybe that is why it was modified both are inheriting
>>> MSS bindings from 8953 and 8937.
>>
>> Seems both are the same too
> https://git.codelinaro.org/clo/la/kernel/msm-4.9/-/blob/LA.UM.10.6.2.c26-01500-89xx.0/arch/arm64/boot/dts/qcom/sdm439-regulator.dtsi#L18
> https://git.codelinaro.org/clo/la/kernel/msm-4.9/-/blob/LA.UM.10.6.2.c26-01500-89xx.0/arch/arm64/boot/dts/qcom/msm8953-regulator.dtsi#L17
> SDM439 and SDM632 do not use simple regulator, s1 seems power domain to me. I have checked it in use at Fairphone 3, Redmi 7 and 7A
> all have S1 as a power domain.

Hm, it seems you're right. It does indeed use level-based voting which
would qualify it as a power domain in our upstream understanding

Konrad

