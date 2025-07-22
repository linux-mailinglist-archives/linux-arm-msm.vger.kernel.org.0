Return-Path: <linux-arm-msm+bounces-66163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E4AB0E59F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 23:38:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 418F41C82907
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 21:38:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AA25286409;
	Tue, 22 Jul 2025 21:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kOt82l1N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D6727E076
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 21:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753220283; cv=none; b=uddHtNe7QStC2H/kJ0MAuvzWZUhW9/uw27u6O0o6rdaKrhGmgQLp64MxcIurxjfgXFGntYJV9pk4mxzuoVe+Z66zBQ16YdSwvA8poKwPVEagnFsBZcA20M+flIJIxSdqA5aNWO3sYDf9U6/xABsA7QdNeRfQTAQdwgDzHRhirLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753220283; c=relaxed/simple;
	bh=6nRVyMzTEbtWqKQXVzYCCUxbPhh305yz2e5jk+pXCPw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eP5fiflCLYyD9pfV47hdpZ8U9Hm7hUsY7MOA/ArettMJDDebpxMRSunP7sYEdngQH61CVoA2BEeVvbjB2C4XKiO/oTTQ6/nGU9Nprz/N6UxkEqk3j4x520DHS+9GAE28GUm0UZKY297as0oNtVxU8DOAu375lz+7biYitBcXR0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kOt82l1N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MKTsNl017919
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 21:38:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LxLJaMV7OXItal3Gz6wp6eY7p9oi9m5tlAOw82q3OnA=; b=kOt82l1NSr5ROuW3
	bSRdVdcSuPIGn/CQpDL7Cx3fTxSls+G/0PFu4oe+S7YnGvMzsnExL4A2JYMuU6j/
	FpvKW74RW5VJNw575g/fa5OHg38/3bjnCLhQ9fZNx7vmPUJkkpOpTQE3zXv6VPnz
	Ox7s1+WZOzueyqBvjnvUEaHWgF9g/i7VCJ1m5lRBeJsmaM6PHvDITBqnvDHWLU2k
	96ZQQQtrTtFQcIRLXh4qeBuRX5n2KAJgv40GtHJ+TaW7+2l+TjEgmdc05mrlSr3/
	eymp38UdfXg+FzSt6ZG3W1mEcedKzdh76t6gRHVvPoENyJ6tI4HvohhnFT8UjhFZ
	IFBzfQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4826t1a9mb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 21:37:59 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-740774348f6so5752587b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 14:37:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753220278; x=1753825078;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LxLJaMV7OXItal3Gz6wp6eY7p9oi9m5tlAOw82q3OnA=;
        b=JT3ojX6UN1nUESQeRCokvr3Rgh8TDMXoExOapcYKd1WXYbkALU4P99XH+1qc/YS5yE
         i0+y6Q5C4UsB2tacl2LHLVeK06HvKLOYPNAiXQvPJoqmFUd5staBrLF4ssKXyIbCb3uJ
         1a4Uulg3ol7lZhHONHnvM1nwnWnWXwWW3aA2BTFGqC+gO3SxayokhjjbOy8UsubesQQU
         0Zi2pAr3iSz0SMfxQXKqpts27m0iPfKUMc5QTUMLKxDqHGk1BeFezyqYY3lTabDhbVC/
         7+jdk72oJ+hDReojPakiJPQrNgmS7g546rtxuDCfsmrdmFvW+tQmmRM1lwx3MWQPXM6y
         G0wQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMJlsKiUGrCZGGyloYkodwduOLx7xffi97v3f2qpBG4/4pOoTKSajuxS8Qz5aBv1Pac5EyZiUU3WJ8mWQS@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/3FQ4NOy8dz2S8R6sLnqlFw6z4zku2YaoFo9KFHLqruBmJRnL
	KoiUB6NInJmqm6m9n+lE4R2VMpt7Vv//cB+pqhkbSgJPZyr9KaE/Jgb1eDmhSn01oTsx/VYC5w/
	pZNiMHqPy56tPGNo0OGDGjdEtqFj9gClIYhNi8p1HurXq1tNxB3T/CgoMALddX/RZ6bCp
X-Gm-Gg: ASbGncuMoBq2UPHBNOAubiqpN9gMoWzY6TpNRnsFuajXXFv4jv+nBhxarVS/yYSTSLz
	8kSKyvyllJDVF9TkY1cA0y2wbJeeNAJEIJTPCkRelCXKTdU9xQ4IyOD9HyQOJ+az8a8N3BNIaSC
	zsDFmAA6YzPpDXjwmJnjarkyp6fhGTVlH+Cs569in/1EE2pHOIbkn7Z7Ij8tfyuMzBu1AVkbbQn
	u5Yo4SR56u/hZREfC5z+gMUZ77LBV03vS/IlR3bkETWvL1ZWHU0jbuDXfY6xUXs00fn7KUCwngF
	6hotObGptwrwnVQTVajBbY4z/FxdiIK0WTS9JBAi0zONXHcDa9BH/3UGjCBiJ/kQ
X-Received: by 2002:a05:6a20:3d88:b0:23d:480d:1c8e with SMTP id adf61e73a8af0-23d490f610bmr649764637.27.1753220278618;
        Tue, 22 Jul 2025 14:37:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUzh0+F2fFC/OFAdVApFhTjPc/PEurlH2lfCsWMfZmPW8kbCHDDIcYhoLoJAcVU+iy17tT6A==
X-Received: by 2002:a05:6a20:3d88:b0:23d:480d:1c8e with SMTP id adf61e73a8af0-23d490f610bmr649724637.27.1753220278164;
        Tue, 22 Jul 2025 14:37:58 -0700 (PDT)
Received: from [192.168.1.4] ([106.222.235.133])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f2fe62d9fsm7733090a12.1.2025.07.22.14.37.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 14:37:57 -0700 (PDT)
Message-ID: <85073de3-3933-439d-9912-1f0ff145df97@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 03:07:50 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/17] drm/msm/a6xx: Enable IFPC on Adreno X1-85
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
 <20250720-ifpc-support-v1-16-9347aa5bcbd6@oss.qualcomm.com>
 <37nuk4kevhpwlzbpgm4tyhnmk6vi3a75oosz7l7xbvvn7qwq22@oomdnizhc673>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <37nuk4kevhpwlzbpgm4tyhnmk6vi3a75oosz7l7xbvvn7qwq22@oomdnizhc673>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Lczl_LjQsl9kAKGWsEAMH6RkJ1XIJ58y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDE4NyBTYWx0ZWRfXw59ZAbF8S8gp
 dubcawVR+e04rK4V06hVSJsl0WzZCM2fVnUuPEBPolIXOdVH3f+xqidLx3ATHq+YIWlYGlyCyKu
 V3o4G4cEKfW3WLog5zWU4n7XY4b23KRFoO19hsCYK8VAl+U2kyXgsIH+NeaX8ud076BWfRu4l2e
 D66GTsMwysoWKYSk8H0Y7F2j98Lcf2PNrcvad2lWvahpbaV1kzLFTEYTUsxQ05xsktWJ7W2X+fn
 7KXBge1jhZ2Ai0fvBYucPMa6PSJc6uTx6C9jZkYGbHRsJmykDhoEF7vqYs8xbo/LRkI8Ogaa79u
 /RQRtVJXjAZ+ISRbyHAgaZf6MeY9NmPSv9VQIW08MExAHwVRY8BhunGFMEq5Cynp1+VlT/R73u4
 D2FEaqk3QcFA82djzGbl6Pi4bNL4v48tlSNPrQrAIv6ITe7kJSDgBQEnAfMCWvcNGf7qDVr1
X-Authority-Analysis: v=2.4 cv=E8/Npbdl c=1 sm=1 tr=0 ts=688004b7 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=4dphQItTPUswyQvINXrzgA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=0HPixKO5BHaGtdwfH9wA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: Lczl_LjQsl9kAKGWsEAMH6RkJ1XIJ58y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_03,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0
 mlxlogscore=658 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220187

On 7/22/2025 7:25 PM, Dmitry Baryshkov wrote:
> On Sun, Jul 20, 2025 at 05:46:17PM +0530, Akhil P Oommen wrote:
>> Add the IFPC restore register list and enable IFPC support on Adreno
>> X1-85 gpu.
> 
> Nit: GPU
> 
> I can't stop but notice that KGSL enables IFPC for a bigger set of
> SKUs, starting from a630v2 and a615. Is there a plan to get IFPC
> supported on those platforms?

Sorry, no access to those hardwares. But I can certainly help if someone
wants to do that. :)

-Akhil.

> 
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 67 ++++++++++++++++++++++++++++++-
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 15 +++++--
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>>  3 files changed, 78 insertions(+), 5 deletions(-)
>>
> 


