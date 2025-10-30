Return-Path: <linux-arm-msm+bounces-79691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 422FEC2080B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 15:10:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D526C4ED2E1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 14:04:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77E601EF09D;
	Thu, 30 Oct 2025 14:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AWuor9Yx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jX4WnwsO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8451DDC2C
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 14:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761833075; cv=none; b=FPmHdlbp9LE7DceljwHpkH2VSUSYEw3qd3ZlagZksIu8wCJ+ggollAP4poac2ydAHuipanflimw6uk/1nxtTW3v7iw0OXPD3YJEFkczWc/naWT2pnb3rWo5n3tWKwvnfhC09tTxHhgJ+QtGyhrIWo70ThytxNpdfUkLyvJV+4Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761833075; c=relaxed/simple;
	bh=LTWQBjn0CZ8QqR6dlwlS/KcTfG6d9CFl7mBgOcL6lD8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mlNPs+WdF+3Q28++HYKBIdD9vVILtQ8rDUlQ8o6XiMZEi71WzOGaOkjKL8S+y6xWfsECLPdMaqu9JY3jhIsbPpec66EVBfLtM8Mie2beWAqzyXcWfZccl7uRt1qPmGAWz6q6JXGge1cCNsix90uONZmHw1Eqmy6S/4Fu/y8uUmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AWuor9Yx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jX4WnwsO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U7EktR1501940
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 14:04:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aQyeMtemgCoOzTzlwykczyRlEpZ0QjYCHYEqGRqhGag=; b=AWuor9Yxkz6K2wy3
	IiPbM7oYI158WOrYLTN7eMPnu70Uu3AuuCOcn+C2w4weR3T6rH0AVFAd8haAFv/H
	pNOTpocnKQbzDT9i+zu+/tXr0ZhoFM9AL3KPw8cFanSHVtw7MGl/3zpSrFwgl/q2
	0znrD3KNsyRnHMYKTFNSXUOSvUj7qrbSCBsPrJd28y8iFdv9h5hgmwvolEKYfvyW
	KmBmsjWOrA6rN7696+mrUhXbV7d89iJz9P3oZmHddxBMxy08Kh/Pcxii9D+xnwb2
	+Mlze/ikiy/UbwTVNSOmrQ0jJVssydVZuXIblCFlRmYMGdkiJ7zrRwy7oAp1LC8y
	R045iw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3t1jtpdf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 14:04:33 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7810289cd5eso2862429b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 07:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761833072; x=1762437872; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aQyeMtemgCoOzTzlwykczyRlEpZ0QjYCHYEqGRqhGag=;
        b=jX4WnwsOdv7FkLdndJmHdOBBDg8fSFHXrdYoHVlj57Ba9hJIbyO+O6R81BHzGrce/+
         Fj+YCpRPeOqMxk8k2N3veMWSuJ+10KXxn4bJBGEJ1pDIvgc/wcCaH91pwd2M0mqqdcom
         s0HLAWaIagL4+bnZGLelwTgn9N04bJTop6z2jcZOfcRmquiqb9cdfdGRKZjEyY197784
         J57SS7hXQj6yRZA3Qu8vyQF7BruJ1CfUq/qRhLmgGZ+9NF14An1P9pafkPcW06fRB/+f
         HjfgfCsOceehwlDzZGpOlF5zg0LvPtH1izPPDtOXnS7/lznj7mzccuK3d8HrAsArZJQL
         R1jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761833072; x=1762437872;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aQyeMtemgCoOzTzlwykczyRlEpZ0QjYCHYEqGRqhGag=;
        b=tQamCtFyLGA/Fo7VOyrCuP4agBic42dNHcm/wNusLQHHOrENbZxFIOXCGGkugVV9XK
         PC8LPnJbgK+7zAbnD76qw7wCa4WIogIngQE8WPvOgy4E+Bd6JE/n0z5i4XfkxRmd+Djh
         BsobGhvS/go9jqCbKpMbVE5uUK7YyqF+J9HnKz9mgpG4pxlZlJD3Cg/RUQV3/cRtjpUL
         jA0DTSRMuj2lci8tam4TqaAhTrfSiZ+3WiqiNz00Yc/cAUe4s8/HkVoBekm8uxNd9q9F
         oJmSaW7lOONfrSvZ7MGGN1i/htfnCXId+Mdxj7fQl67gzkkskmyzMQyfE0cpqOjwlux2
         zZiA==
X-Forwarded-Encrypted: i=1; AJvYcCVUk9/I1cm5jLw3LoxCOuKcHqa9whA5OJlE9qB5UBkt2a4B/bg4WO463cny0UPK4gx1vHVTi2MiCRWkJQTD@vger.kernel.org
X-Gm-Message-State: AOJu0YwaNJ/LkW6MKHyehAhf+SYEhZ3VC5bCMCGd0h/KRqFFS5ak5g7J
	N65b5Zlgty6POayDAO2rjOPG6UU0gUjYPCBJwk4KrJ/emljn+91C1FZJTOFnyCu45e7pm1/Jx7w
	88fTP2Ak3MwxqUToHZimiVsRQj08LpfRac8S7nRNRHdRxT13z3bYext+R6rSkPQQ8gSed
X-Gm-Gg: ASbGncsuA1ZEoMRdKl9BqxOfghaTVD5UyDduqGh86pFKAQ+yWQcLSR8/1xlIiwU4zYQ
	rC/9R1lHPDi4rgVWPBJEbtDLEoSoYtxQJqB1lYN2Pi3Q6HqtvFIvoh1OKjLH6ST39yV8vrTBeya
	BwCXnBRkiiWCchbL342qI2KvULfA4dU3DYHBapvFVEfzZ3huHCPXfbdeeJLvulaRhr2YZRNmf+n
	8HqvS2R30JXR/IxNkYYyQjeFsUU6oJwG/SWsazm8e+4+BJSfgLQd9O7K1EwPxJUIJWDFwVM6PSD
	la/DVvRngZJCkc349r7xsrhsCzSwMq4yni78RpB4o1Ea+WXJg/XvD5BwYzOt000oH6MYMToVz27
	TgKP5NsNoAdb8CVEAndkCXg==
X-Received: by 2002:a05:6a00:1786:b0:7a2:8649:5ab7 with SMTP id d2e1a72fcca58-7a4e2fe7764mr9513756b3a.14.1761833071974;
        Thu, 30 Oct 2025 07:04:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOsm+Sq4JNvFojnAbXxBbvyUiQ9n1HBmXRQ7fcHIwRyOXUnsy9UNUn/WOnPgjzpqXGKHxy5w==
X-Received: by 2002:a05:6a00:1786:b0:7a2:8649:5ab7 with SMTP id d2e1a72fcca58-7a4e2fe7764mr9512694b3a.14.1761833062850;
        Thu, 30 Oct 2025 07:04:22 -0700 (PDT)
Received: from [10.204.104.20] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a41409c703sm18826520b3a.70.2025.10.30.07.04.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 07:04:22 -0700 (PDT)
Message-ID: <4b41cb16-858b-4fc2-8ee1-3a7171712808@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 19:34:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/17] drm/msm/adreno: Introduce A8x GPU Support
To: rob.clark@oss.qualcomm.com
Cc: Bjorn Andersson <andersson@kernel.org>,
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
 <20250930-kaana-gpu-support-v1-12-73530b0700ed@oss.qualcomm.com>
 <CACSVV03HaKAvfDa5A5LqRZM4_o8g-haVU3A6GgWqfTO0QNcK2w@mail.gmail.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <CACSVV03HaKAvfDa5A5LqRZM4_o8g-haVU3A6GgWqfTO0QNcK2w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Tt7xSvRlddesGKtdUOq4Dk1sRpoO6r8N
X-Proofpoint-ORIG-GUID: Tt7xSvRlddesGKtdUOq4Dk1sRpoO6r8N
X-Authority-Analysis: v=2.4 cv=M/lA6iws c=1 sm=1 tr=0 ts=69037071 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=ktRuAwBfdPNgXckAlmEA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDExNCBTYWx0ZWRfX4qTy/5n20Tmi
 4ltoo1fPQn9wfJneEX8k28xDv8e6MKhbrdemQr3OenUzVrggwtThggJ4kGwd2t8mgI3Ei2gXheF
 fhmaxNw4DfRuGmN1XDkBVpnhxpOwVxwvQSnEebtlREe8WmsGHVelw/hPfgezKf+hb4EABarxTNO
 Y4GpG+elWfo6fphor12IF5qFNifDDRyvG/mrfUneTYQZdJVuRycYHuEmydhQUDS+r4beK8lEkow
 6PKxaAwpVq818ojJpLS7nkwvSs/hzA58RN35YzayepdOGBxKS95pU+ScLCYN8aHhyS1yxYd95BU
 0xeDkrjiFNuYa7k49Uud1gtm4YPXpNE7NCuSfJ5BD1nRbUwuLch9wXo1HfOT3aRYWqsGL360Npd
 i4qJ0WFMuY37MOxUBuXQMAT7nGLqSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_04,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300114

<< snip >>

>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> index 0b17d36c36a9567e6afa4269ae7783ed3578e40e..18300b12bf2a8bcd5601797df0fcc7afa8943863 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> @@ -46,6 +46,7 @@ struct a6xx_info {
>>         const struct adreno_protect *protect;
>>         const struct adreno_reglist_list *pwrup_reglist;
>>         const struct adreno_reglist_list *ifpc_reglist;
>> +       const struct adreno_reglist_pipe *nonctxt_reglist;
>>         u32 gmu_chipid;
>>         u32 gmu_cgc_mode;
>>         u32 prim_fifo_threshold;
>> @@ -101,6 +102,11 @@ struct a6xx_gpu {
>>         void *htw_llc_slice;
>>         bool have_mmu500;
>>         bool hung;
>> +
>> +       u32 cached_aperture;
>> +       spinlock_t aperture_lock;
> 
> I don't see aperture_lock used.. but seems like maybe a good idea if
> a8xx_aperture_slice_set() acquired the lock and we had an
> corresponding _release() which dropped the lock, so that we couldn't
> have race conditions between the users of the aperture.
> 

Yeah, I guess we should add a lock because the pagefault-coredump path
and gpu irq are not serialized. And both of them are users of aperture.
The other users are serialized already with gpu lock.

-Akhil

> BR,
> -R
> 

