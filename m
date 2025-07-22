Return-Path: <linux-arm-msm+bounces-66156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D5673B0E479
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 21:56:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F987162AC5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 19:56:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA1B42236E3;
	Tue, 22 Jul 2025 19:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OKqie+tW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44794288D2
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 19:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753214165; cv=none; b=tzsj4luUCtgagVJ6DPwkW8k86EArvuusl1SzEY2ayVisXaWNQo+guNfP01l2BPlqVSFGIYPqt0A6GrEkA7mCuWWAveVTSfC1KzHmodctTqn65KTvpuE0XHd1+5tr/TnLzD3m3mnw3t5KFb5b25GXx6c6rcAAz9+Pd0IoJ9j555M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753214165; c=relaxed/simple;
	bh=PCihER/NBi1sl3yVYVgy3pgJILf9z9adFm0ghGHjbkc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AMNNDX9dZ95gtCaffzMvB9IRreO8PMszpvYocWiZAozDUV47nVSfzv7tVOlH+6aFK6AxlLl1cGU9g+ObjZcP7PTZRTkICpXCX7F2I02k7nGku9zjT+4oynKix8g+TI7sbooL4y4AGAE8598oqM3opoukcS2Py77+It97dNb9dss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OKqie+tW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MCsb74021550
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 19:56:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GjTWvnObvG/UeJuKXHL9K9+ApIca33uxx+7EN7uxT/4=; b=OKqie+tWt99ZKEf8
	mAm/cX/RY8ADiZ3d49ZZhhZ5C76BICLa+fxEe2uT9OC6zM0Lm2Po8S8BxqByx7kS
	b780q1o0HyQBv5ayhLBW47cTHVXGkt4dXh0ZTTWmpS4u4H7FXmW5I2zolHBIWoZM
	X9LWlos02N+xOaumOQlS1BbYiBvI2mVxfhQfLC8fYn1FHaVW1A/guRX7VgX7cUoT
	1fU2PIgSKIoyaOBG+X1ygtz8YMV0ErNXxLNj8Oz+twJshpKBI+T6AatLG190oGdm
	9l1Acc4talfp7qKRwld2uG2GQ5WJf6lHRM+SjzTl7sXLILfTAaMs68dY2XE/x+UQ
	QDlToQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482b1u997c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 19:56:03 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-748e1e474f8so8440212b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 12:56:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753214162; x=1753818962;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GjTWvnObvG/UeJuKXHL9K9+ApIca33uxx+7EN7uxT/4=;
        b=AMr4vWYOd1c8ypw/qGGEUn1pOdsox1xbkpcKeOErU6Ymof7Zngz+vyvmRudTVIK2gg
         EL3IjvvfLqoHrdq4JIZutmmP4jL9tD62zkgtryea+/Hm+tEFVhfe8EbrWHcsjS+MO3D/
         VSXbS6dY8yk8ogs33WWjMjOJv0wNTrZVYmTWp0XhdW0mSpZ6+b3C+25Av238JDLnuZ/T
         dl9ClRlEfv1+PhGn8Kh0rkCmKBP5YhR1CsxP4LyW0WFPWXgfKm049hohoo+wC/ZeqnxT
         VIixzx9woEuR1uPOtcs9d+QnljIaJJJJ4nWnGdceeZDUuK5msU1xvWMr+pOOnBuziVuS
         /eNw==
X-Forwarded-Encrypted: i=1; AJvYcCX5kr5sdtfuMrNayWJqh57DhfRzInxTET/oCCoFnRvMdH68ULi9h57+rL2KFQpl4R6of8NW5WPIdZ3c69ZD@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3k2B6CYyEZLReLA/jvS5aAopjevEZsngd+cS5YE/0dxHQ7Gse
	2rpr38tzrNoAymn2q4ztnbO1Lf5FnF+n1PyTNz+IWtQF8Trd6TsBbl0CwbO21Qzkr+tr/9EpzZk
	JvVF2NPcmu03USfc6tOLu5Tb4tqo5Xwn3NVcHa18txLhm8UrrKIIJPcHSuo0k1XT0nsAhan72p6
	Yd
X-Gm-Gg: ASbGncvx+Waz9nRzxNozAtH8+gHNtliF3374hzWKgax0ofGZUVKh0MICtZVl0dGe0Ll
	l4CJqCOazpN2jFhWN3zeJFlPCy36FlCFOIuPxe56WvhcLtaIzbWt045FF0pZ9f1JN1aC8d2fNEp
	jn9iH9T0qWpuKiT4VRSdB8QU9Wrew/Qb4ydCh+fWKaUq1Pr0jxJTeBaHHogIfd8XWINyN6mXdVK
	AFmmPUVCQUY9Bkqq7iT47RbY94QXS/U1pOGdBNRDpYkM10fgTXSlR9m/FBdHVTTsces05MoEPy2
	G507TDnWAKwN1lcwO8igRxTpbpAyY9Gh77ucA7Zt+P96+k0ukKtegy2jHGgiOJg1
X-Received: by 2002:a05:6a00:92a7:b0:736:31cf:2590 with SMTP id d2e1a72fcca58-760353f2759mr687692b3a.16.1753214162227;
        Tue, 22 Jul 2025 12:56:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJK019g6DqECaNDbpD0Yvmal8JjGmdWP1kCx05y6YQEB+NqSgr5xgmvBvu9sxGV/5wQFRvhg==
X-Received: by 2002:a05:6a00:92a7:b0:736:31cf:2590 with SMTP id d2e1a72fcca58-760353f2759mr687654b3a.16.1753214161634;
        Tue, 22 Jul 2025 12:56:01 -0700 (PDT)
Received: from [192.168.1.4] ([106.222.235.133])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cbc680absm8266052b3a.144.2025.07.22.12.55.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 12:56:01 -0700 (PDT)
Message-ID: <1b7817eb-6d54-4ed0-9ab3-d5b521d5bf6d@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 01:25:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/17] drm/msm/a6xx: Poll additional DRV status
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
 <20250720-ifpc-support-v1-4-9347aa5bcbd6@oss.qualcomm.com>
 <shq6rnj5qrw52xvtcnu3bbvxuxjuddzajugawcojdyrm74fpp6@abeztbbmtqnr>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <shq6rnj5qrw52xvtcnu3bbvxuxjuddzajugawcojdyrm74fpp6@abeztbbmtqnr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LdY86ifi c=1 sm=1 tr=0 ts=687fecd3 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=4dphQItTPUswyQvINXrzgA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=TSBj-XRfAaQ4HSZEJ1QA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDE3MCBTYWx0ZWRfXynOY+KXoEffp
 a4eM5fqjGFSzi0Im7RjP2xvv+lQv67cQPBtSifrABwK7NrZH9VbmiRb2sbb5sMGc9VbkfixCIDv
 wX4EQPCkuHmM64EH5bjdLmk2YdCzRAPjOVn35XbNuaStYp3eZAPyMQvtYUo1LFPM36nPGk7Fx6r
 Qw5dZ3MTRktShz/j4rpZdfsoGrwQdljZTrv98vvXvNE+EZ/zu+D3DoM3xP8j8aJWuU1E0+WJUBj
 xjdLQPPp4saUaTMRDZ/mQEicwibOnnOQmc8bxVnyRxIUCK8SYw23wsRbyH94SR8k3PNjtZKzP4x
 227yYaQkaeIGM26hdobtbRKs4cGbKtAe5Vg3JKM5wiZPJpTvDLgC8v09yiuxzETMQOz8EugAvPk
 x1GoUSuVRZpD+DkTGs1ofrEoWXyKEJVrLiCVaZzUctRIOqJ49KlKazTUKyA41DB0+5uuw9n8
X-Proofpoint-ORIG-GUID: FtbYVkC46hKP1bty_kexB343GIVsiCNk
X-Proofpoint-GUID: FtbYVkC46hKP1bty_kexB343GIVsiCNk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 priorityscore=1501 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 spamscore=0
 suspectscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220170

On 7/22/2025 7:01 PM, Dmitry Baryshkov wrote:
> On Sun, Jul 20, 2025 at 05:46:05PM +0530, Akhil P Oommen wrote:
>> A7XX_GEN2 generation has additional TCS slots. Poll the respective
>> DRV status registers before pm suspend.
>>
> 
> Fixes?

Ack. Will add the tag. It is good to ensure there are no outstanding votes.

-Akhil

> 
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> index 790ef2f94a0b0cd40433d7edb6a89e4f04408bf5..3bebb6dd7059782ceca29f2efd2acee24d3fc930 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> @@ -987,6 +987,22 @@ static void a6xx_gmu_rpmh_off(struct a6xx_gmu *gmu)
>>  		val, (val & 1), 100, 10000);
>>  	gmu_poll_timeout_rscc(gmu, REG_A6XX_RSCC_TCS3_DRV0_STATUS + seqmem_off,
>>  		val, (val & 1), 100, 1000);
>> +
>> +	if (!adreno_is_a740_family(adreno_gpu))
>> +		return;
>> +
>> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS4_DRV0_STATUS + seqmem_off,
>> +		val, (val & 1), 100, 10000);
>> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS5_DRV0_STATUS + seqmem_off,
>> +		val, (val & 1), 100, 10000);
>> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS6_DRV0_STATUS + seqmem_off,
>> +		val, (val & 1), 100, 10000);
>> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS7_DRV0_STATUS + seqmem_off,
>> +		val, (val & 1), 100, 1000);
>> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS8_DRV0_STATUS + seqmem_off,
>> +		val, (val & 1), 100, 10000);
>> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS9_DRV0_STATUS + seqmem_off,
>> +		val, (val & 1), 100, 1000);
>>  }
>>  
>>  /* Force the GMU off in case it isn't responsive */
>>
>> -- 
>> 2.50.1
>>
> 


