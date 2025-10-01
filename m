Return-Path: <linux-arm-msm+bounces-75715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 915C4BB1CC6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Oct 2025 23:22:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0091218890EB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Oct 2025 21:23:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48D0C31195B;
	Wed,  1 Oct 2025 21:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AEoBOZbY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E352E093B
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Oct 2025 21:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759353768; cv=none; b=N4zLHu+/roFzniFZCzY2TcN9f6PVU3QndpVDCROFvN+wajNvUXuhffPXJXmVX4p+NhWfNNrdD1Eea7pEHcvHBOtX/rXGIX5YHaFH+GXJAa9lRP9iF8AoTZfiTyRWl3nf+fhiPwIJP0PjkDL/UaIoJkQxzZdm8Ofo4OQZmhKunbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759353768; c=relaxed/simple;
	bh=0feXbIiv5jZYhNGUawVlPDaLEDims5YKYfHLChZrH+Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=knfs/+WdFh2zFYWZ1Ixxuk8KHWc1pLXKDGfDN++KGbPv1ZnJuX5UJ1yvwLlTLE6VuaGWt+SVXqaPwFPh+k7asma/p8wbN7UC7RVOIJ555Bt/PlWevf4KtHWtHtMIwNVUA4u9mXhH5sGWALSRPf1h4yBSmOnIheUDrNpCHPgkqbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AEoBOZbY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591IcUSv024838
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Oct 2025 21:22:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tY1kk2Q5hRz9w3+RRK/dSbVzsoNAtpTZ1wIZRGTLaPE=; b=AEoBOZbY5dwHsaEu
	nCz2fNZKcAZfaYdo5d5ulPVRFWJ8zMZ7Mi2+jxZ1vA7pKIwX64LOdeMVvEmiD8rr
	sIDuv9xRcIAN69afsfe63q4APcIO2rPZE4ANruDmLiGkhcnlLxQlv0q5guwKKpdT
	8E/5BjiSkPiIHgQSXaWF5esBN9iECy0OktYe35tQKHWp+spFR2VCg2UuIy0DOYHJ
	lg6D0+O5lQ8xw2yAfFk6mov6NbrGiJxdlmEvUy9Vth2d2s8r+3W6cZf4dZndVJuY
	lZdnaPHFWzfCQzJe/5uh48ZM9lA1XK4aWdq70vaLqAlFNBPOF9UaA/2fqIiNCT+p
	+1Hnvg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e977wrc3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 21:22:45 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b5edecdf94eso493358a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 14:22:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759353765; x=1759958565;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tY1kk2Q5hRz9w3+RRK/dSbVzsoNAtpTZ1wIZRGTLaPE=;
        b=DNJCsu+8M6t0g5T7iyoYn86PRcpEfWHu6dKtbneoe5noR9SfnFeH5YTrhZS5TU+M64
         igwHun16bGyX+VljZH9ZKb+VigrRAOlWejddogkTNwretH6MKGi6ojTkqFlRdPcstBp+
         9TYCTCDMyaPCRd0wrBoK+//S6uSNe7YiDz6ZwmSzh8jo0jamUKY8y1SCC159QWR4LMvq
         zGAHySpYAhhTe/PYY3jUQKqeUyfq4aaCSGAd6M7cWapz60IutweOF3vCIf3VwEKD6p35
         m6avj7hN/7/ImnJmPZpApg3wp9ofHFg00TbWgWbgH2qJs0KbtFZ5pgr/9vRCSMulRDRB
         z1PQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8pFYFM00T4G9UodDP6qWfiGen4W2dHVTnKcocn5LZb9XFjKexFs7HsIqiPXBW1W3GzZqzoELkSFsGhATc@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp9mxcMkQaC+R8T6pac8vx5dqYhA8q3xj24IUd3VjIshIfFtIG
	3++5E/paVVFA9R++afJ2lyBVQknGdmOS/wzaVcnlY6YE8y8pwTMaXpbJZCWcfGHbIzW95TyZUij
	7xsnfvmLLx0vKVxonycrBVu4SQQ14ndIiHvfNIH7wdylGn272ns25/dyYpI6xyYVyuM96
X-Gm-Gg: ASbGnctB9mPBZFiapKGpV//DFJfU/LSCojNz7bIkmT4MItdSaoWWCleUkWLAl5T8Ljs
	UPmhqVYR6L0YFmDQ63bQOuMvB8BisXxJTJDHmcsX8NktQifXyiu/nk52LjiOQ/xare3GBxbQ6qG
	WWICmIUUNgme6pIBTlMKcD54Dunyh14HziKbQK0IEDfVwSIu4bTD9L2aEbptm18NI4kY9k252qD
	RxNBLVe69Wz8wAvs/K1xYKlzQ1YwVfREs4N0834caT6dF2IoT5uQihC/9dCLAsNxAWNoXSjwiS/
	gz4eYLGwx3ykqegulhyM4Ex/WxDjV1HHJiYTU3iW5dtvtd9nhEi0M1MMvUh+88Fn98U=
X-Received: by 2002:a17:90b:3143:b0:338:26e3:ffb6 with SMTP id 98e67ed59e1d1-339a6f5329fmr5484051a91.26.1759353764864;
        Wed, 01 Oct 2025 14:22:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3J5m7IdAEVQ8YgjK8xPIMo/mwc0iZ4ZB/L76eAW/owdYw7sgKWjOIFg1cMlAzuYnR+gwPtg==
X-Received: by 2002:a17:90b:3143:b0:338:26e3:ffb6 with SMTP id 98e67ed59e1d1-339a6f5329fmr5484006a91.26.1759353764421;
        Wed, 01 Oct 2025 14:22:44 -0700 (PDT)
Received: from [192.168.1.9] ([117.244.71.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339b4f3caf9sm623334a91.13.2025.10.01.14.22.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 14:22:44 -0700 (PDT)
Message-ID: <edb8b0dd-126b-4ed6-8603-119f1fd52baf@oss.qualcomm.com>
Date: Thu, 2 Oct 2025 02:52:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 10/17] drm/msm/a6xx: Rebase GMU register offsets
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse
 <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-10-73530b0700ed@oss.qualcomm.com>
 <s4no2wy3yskk6l6igtx7h4vopaupc3wkmu7nhpnocv3bbs4hqi@uhie6j7xr2pt>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <s4no2wy3yskk6l6igtx7h4vopaupc3wkmu7nhpnocv3bbs4hqi@uhie6j7xr2pt>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KCK_MbigxzNygWSPRaIFWbwmTvYaXSnK
X-Proofpoint-ORIG-GUID: KCK_MbigxzNygWSPRaIFWbwmTvYaXSnK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MyBTYWx0ZWRfXwdao5HDaoGaT
 xfAL8maMY+/CGogpySgaiADHMzyFfZkD+xMIoYXKxx1RowKGfekD07cGNNhW1lS0AefUCHLQgQ+
 MakAG8qYTmd73+hN7TKtU2NRNSm5EulksEtbwAHv4+5lCBvx++Rf6wRnsOL/RVsCTswugYlcgoB
 a5THzvzFOO0H7qiR98h33fD8ziWt2zJof4Eniz0MYHRdCFdW3d4mseu29PuDz4aDYoSAdpeaGmG
 C82pmZWp61dorEUZReWbQyUVmLLFGsq+lDoLvfcarP92hTlDNqzFk7mnUMVMVEQ5YegNJ1/lei1
 Eq2Ny9OK/HJX1J7m63Wb/KMxwpkAta6l7d/OnMRLTmaM3GRQ64yoRgS4/1RQrlKZBg4R/4PQ8MT
 9j2Kmw86gxX3rspOcuMX/Oy2VuGkMw==
X-Authority-Analysis: v=2.4 cv=Sf36t/Ru c=1 sm=1 tr=0 ts=68dd9ba5 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=2kejHg7nZSoTgEpwAwsXNQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=DsFpUOTLdg6Fp_xZM74A:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_06,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270043



On 9/30/2025 12:53 PM, Dmitry Baryshkov wrote:
> On Tue, Sep 30, 2025 at 11:18:15AM +0530, Akhil P Oommen wrote:
>> GMU registers are always at a fixed offset from the GPU base address,
>> a consistency maintained at least within a given architecture generation.
>> In A8x family, the base address of the GMU has changed, but the offsets
>> of the gmu registers remain largely the same. To enable reuse of the gmu
> 
> I understand the code, but I think I'd very much prefer to see it in the
> catalog file (with the note on how to calculate it). Reading resources
> for two different devices sounds too strange to be nice. This way you
> can keep the offsets for a6xx / a7xx untouched and just add the non-zero
> offset for a8xx.

It is not clear to me whether the concern is about the calculation part 
or the xml update part.

If it is about the former,I think it is okay as we have confidence on 
the layout of both devices. They are not random platform devices. Also, 
we may have to do something similar for other gpu/gmu reg ranges too to 
conveniently collect a full coredump.

-Akhil

> 
>> code for A8x chipsets, update the gmu register offsets to be relative
>> to the GPU's base address instead of GMU's.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c             |  44 +++-
>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.h             |  20 +-
>>   drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml | 248 +++++++++++-----------
>>   3 files changed, 172 insertions(+), 140 deletions(-)
> 


