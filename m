Return-Path: <linux-arm-msm+bounces-66362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F279CB0FC3A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 23:43:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F39DC96336B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 21:43:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46078270568;
	Wed, 23 Jul 2025 21:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VjClZdQ1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B65E239E82
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 21:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753307014; cv=none; b=ROoW9/4MTf4BQy6Bq8YBzUXVqrCfVvD+qzldl5jF8l/bOlX+YLAGzw9MXquBLHTK2AtdDUCI807eKqXD1VO7MPan9EsB9g2SZhHHGVe8OMmG04bMsSeM6ncm/LTd72GBLF3UyXK+NHapnOBX2OTJCVBXKupOp626OFlfzaVxTys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753307014; c=relaxed/simple;
	bh=DdZBJuqK6v04qPpfb3bnK53HYuyPqR1JM0r/nUPg7WU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D0IsX1WB1+0ZWU/eb1Kwn1U+XH9lpaOKNdC5hJcch1Zp6Qm0Yt0ompRlFJVVNKj+6RzgfRVWmXsEXywtoTF+xvC4SdT+FqgB0i5ezJwXdIkkUI8mtnmYIQCsRKZb9fxfzaz8GXvGmBTOVmYGMVpl47ZNqrofUYbhAolMS6eoNx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VjClZdQ1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NH87sA024377
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 21:43:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uzsd1xcUKgsxCpgkX2HBRK56tDWw0kgTphmNT2IrLUU=; b=VjClZdQ1R/6nAsi4
	mu+I9PBYb7YhfPNj0w8Fs2qNGeoI0KcHczcDEQM4o5IUFyS2ten/n4F2EaZ0523J
	rwSbI+nGvi6txycqRvmmWqGt4TqoqVyFrRTQQ8wJ2wdvV9Utxuk7JKTuhjRe+Y/+
	dzkhAyUuM20VVUAL1cUngxGKagZdTcdJO1ATwOvU7z8zjcqd478DxIqT6vGHIlBK
	l0QMIf7/80G4LjaVbL6jEL3SommuCkoaEr45iupaESdgvCqTe/FsONjzPSlsr8kd
	HOCt8TtVevPIk2MBl2ZMRe6Wejvy2H80sbG19DlAexLixjDP8noHmMTSjUhbaWW8
	klxYZA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481g3ese4v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 21:43:31 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-31cb5cc3edcso255085a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 14:43:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753307010; x=1753911810;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Uzsd1xcUKgsxCpgkX2HBRK56tDWw0kgTphmNT2IrLUU=;
        b=o8Ndk2JzcIj98QG5QVF2K5e00lUwjGLJ8mQ53dNCR2xiCgQ5YfkFa1LSRH/eHhUzVW
         Q5VSNYWuL/4XPOUx+o8S/jhxFE+PwosUdzWbfPQmYBfhOAlsX+TIjxpo/Ymxm3gjgo5A
         y8dUqmblupA0FID2/h8nWVfIpcfNjVx8peSeBh6GJu3GjN8GKqJ8lX/cFaJodnuDD9Ki
         uF9RU2SHO2211eWWGTchCON75Z0xmEYcKWPRKTlWjmMUMPACJ9OMPvlXQhJtvYr5zLyS
         GE0pnYXAA0S/0ZqdQ0eDhLnlzI3IVidb4GXODAWuwD2FLbPAy2rKV5Z4bmBpTowkhU1j
         cIVQ==
X-Forwarded-Encrypted: i=1; AJvYcCX59Jk3rV9L7qyKrBSGpE+0gcBTzKgAfaBiD58k96TZMI16+Je4RJH1RrWDzdykoX2fzb1jMFejLsUo/UjK@vger.kernel.org
X-Gm-Message-State: AOJu0YwjDIh7RBaro84dCVI6VlwfuK0d9p11WZdWMQprgnKrz+uMcMne
	HKaPkqfWm/Lf4nwlOlrqI0AgoLiD0btMziHDiRTCkxHHMJIrrMFoNwG1becHDZYZonZmyqK/yHa
	GVADXOTA+sCc7hi80m1RYNtrU8w9xyYBv10tFhflvdLHBnR/nDBDSZGRSgd/LcU2qX4qi
X-Gm-Gg: ASbGncuYyJ5pk7s3NSKiDvIcVlFjlAfvd9MgT9s7DaIBrmGxMl9ABa0YAYy2ztoQrIY
	FpbXuZnGvfeCwxaLNSs+ujJgfC+qmAr+cqlCm80DVxLRYMModa+w9yEybxarJml79fgEC7U5sSv
	T3Mcoeso7yCbdXd9kCABbbhAYe943JO7ncYAYWrskTTPG0e9y3lnhYtFzcxmqSdQAAMcz1hy1ub
	iIV9CFMyDlBfgMb434//BbigKIYZ1MsxdhoSJfwpX9TfGbLqMrZjLrSLwAaGfRWxrFv5ExUFuoB
	mOmCQdznqqO9Q691sULU/MOzsecivlfWt0ns4czP0aBBbR7QHiTTeoOPxB5LCQ==
X-Received: by 2002:a17:90b:2e4f:b0:311:b0ec:1360 with SMTP id 98e67ed59e1d1-31e507e27ccmr6472065a91.29.1753307010585;
        Wed, 23 Jul 2025 14:43:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzTDpyK8uhEHXdusySPe7kL1WJwqg+L63lFCGjVnLvsY2leb5rLrYmu0tDVWGGC6nfTLKVxw==
X-Received: by 2002:a17:90b:2e4f:b0:311:b0ec:1360 with SMTP id 98e67ed59e1d1-31e507e27ccmr6471989a91.29.1753307009327;
        Wed, 23 Jul 2025 14:43:29 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.235.3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e63a6677esm18638a91.3.2025.07.23.14.43.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 14:43:29 -0700 (PDT)
Message-ID: <d06c6b86-2aa0-4f59-af8f-0130897c7b26@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 03:13:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/17] drm/msm: Add support for IFPC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-11-9347aa5bcbd6@oss.qualcomm.com>
 <k653qq6a4xkvwadeum5kbr7cheje773vobehpzq33ec44vyxjj@vi3ekv4jwext>
 <6472bc1a-9546-4cb1-85b9-d826f76ba9f4@oss.qualcomm.com>
 <5471754b-5dec-4107-96d6-a6075328d824@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <5471754b-5dec-4107-96d6-a6075328d824@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: dbnpR4uIq1TY8GzUPcf5Sjd2MrVOh7G9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE4NiBTYWx0ZWRfXxZtI5hgNKW3p
 Hi3wGrX/0xU/jC6FiASvwzW/Eto85UMCXfFDXky1kqqJr42w4NjHGvFwh9cbpi4lcstaWkuwZUK
 EB+O4PjD7TS5K+EezZCh0unxxuoONVnlAObzK9DWwfv+q66Aqp4wmDdE0VrsMVJozRrkBuKFqmS
 4U0SdzcG7fynI3Pe1mBh4JLcvKIj201T9euNmJEf+Dhos15j3mJ5i2IQZ2zZRVFBTfVTTS6n3xo
 xnF7zdOykBIgsyshRdcU5hh6lTVregoFRsLJU4u+67E36UKUJdDus/rdWSD2aZrcLY8VewpwZhF
 yA5+Mwvx6dUvsX//MtT5ta+OiLxeEZp4rYQ0TEDaWb8QYF25kJRpU8/2wqqAYUEmYXHXzV355EQ
 +SW879w3E/ABs/l8l2N3jd2qPMSfjobbN5uni7FZHYbi+1yg/xfZ/K/S9tmPn4mXxcZ0HBkc
X-Authority-Analysis: v=2.4 cv=Q+fS452a c=1 sm=1 tr=0 ts=68815783 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=pSIa2sKh8ADkebnh61Ypzg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=-ImCKyWHiv6jzAo2IrkA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: dbnpR4uIq1TY8GzUPcf5Sjd2MrVOh7G9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230186

On 7/23/2025 3:57 PM, Konrad Dybcio wrote:
> On 7/22/25 11:27 PM, Akhil P Oommen wrote:
>> On 7/22/2025 7:19 PM, Dmitry Baryshkov wrote:
>>> On Sun, Jul 20, 2025 at 05:46:12PM +0530, Akhil P Oommen wrote:
>>>> Add a new quirk to denote IFPC (Inter-Frame Power Collapse) support
>>>> for a gpu. Based on this flag send the feature ctrl hfi message to
>>>> GMU to enable IFPC support.
>>>>
>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>> ---
> 
> [...]
> 
>>>> +static int a6xx_hfi_enable_ifpc(struct a6xx_gmu *gmu)
>>>> +{
>>>> +	if (gmu->idle_level != GMU_IDLE_STATE_IFPC)
>>>> +		return 0;
>>>> +
>>>> +	return a6xx_hfi_feature_ctrl_msg(gmu, HFI_FEATURE_IFPC, 1, 0x1680);
>>>
>>> magic number?
>>>
>>
>> Let me check.
> 
> techpack-graphics/adreno_a6xx_gmu.c:
> 537:#define A6X_GMU_LONG_IFPC_HYST      FIELD_PREP(GENMASK(15, 0), 0x1680)
> 541:#define A6X_GMU_LONG_IFPC_HYST_FLOOR        FIELD_PREP(GENMASK(15, 0), 0x0F00)
> 
> (same value for a7/a8)
> 
> 0x0f00 is 3840, which smells oddly like the XO clock rate (possibly mul/div2)
> 
> (38.4 MHz or 19.2) / 3840 is (1000 or 500) (ms? us? cycles?) and the other one is
> (333 or 667) - without any further information I'd estimate this is some sort of
> scheduler tuning

Thats right. It is around 300us. Will add the same macro in the next rev.

-Akhil

> 
> Konrad


