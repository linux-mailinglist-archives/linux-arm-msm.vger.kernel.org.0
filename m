Return-Path: <linux-arm-msm+bounces-86183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E137CD5577
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 10:36:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A0C393001BE2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 09:36:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4C1020DD48;
	Mon, 22 Dec 2025 09:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ao204+l3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SrafBBHq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3685E1E5018
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 09:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766396168; cv=none; b=jgK5HL0hhIcZedJlGRPRUevMvLA1kOv90dPKSWzjdDAeIRnC6e/vdxxHUxIvuoXBveW21xblg1T4Wi7pADNFLs/+ANO0q4Y+pFRz6vdqHUkLZTwroWjbXLZdQH8eh3b79mism5ZnJDd18TJVN0CyUO2L1daFew+kIMbtM6zhCYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766396168; c=relaxed/simple;
	bh=g0E75W9yA/tbkplCW5uH0aFBksPHYxxlsR7v+f+Lhto=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FngcwzWO8uN4MuMSY6QxDoYDXcwDuUfofJebpAVG56Nms0bP+tz1lZzBvpb0jtgPoWZ6f+B9fh0GmasYFYaQkwYQj9EldMXvD/29DLVReCf17CwOjZt1Qc2u8PQdiM0ceZrXFPrS+HxbtA4QRYUltH4smP5gl0N8r5y1OIxa7iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ao204+l3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SrafBBHq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM8KmZ23787547
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 09:36:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kq3LMdMdij6fkif2PNLahCRwz5DF0om84C+pt+8LIEc=; b=Ao204+l3rub0U4Uo
	nt8KbxBgvEmGSjTLVa+80ofCTjIkmpS7GS9yV6+NYbm9vmdBlhiKAookikqckw4S
	hHTTOZ35YZccV6sDgOI1RYjcZyJnwii8O+ofkC1eLNp+4nRBvbfCe7k5yeMWchLa
	9lGd0Qo+TP6jN99eJUWEcrAG8C27mqQ4aDKeA4XS6tAvTBTHGMqAob7qDaK54FtO
	+YPiFbNT5VFGRPrRPx24fpltJYbQPWTTF5pTXlMozRn4fSY2v65VpMd9SbFtN8yG
	LqZBxPce9mFcwP5at2CKtzOWyEQrq6jD8EuBv5p4k36cJY7BoYEi2pqvBh1GS2Yl
	ExzRxg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mru4gqv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 09:36:06 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee07f794fcso11485021cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 01:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766396165; x=1767000965; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kq3LMdMdij6fkif2PNLahCRwz5DF0om84C+pt+8LIEc=;
        b=SrafBBHq3IarvsB4mTF08fe6G6ahoOE5QE1WU6LF5n1wEvFdiuPifkg9OxuCGu1ZhI
         zmUm6h5qystSF8bRQ5f+XQEC8jTfrs2xHZEf8SzbhhRMrvJNC8Mdp7w5qrhAr4+FsgjP
         CyQW9bepkpYl8In7cJJJKicoeNtphJSI2T4U92z9zA2qamNAOMaOcKTcOafItySaz9Ne
         pTW2L5bQAq6EuwoCwj39HtHKhNFW+NxjvyAnLjouCj12vGGFTbQ5Py98ZAyqvb0fKfmT
         y+HwcfDaiVWJPHmHImd5TQX1HMw4ouo4rkRwCuu5jcYlGq4/cm7/5bweus/pmXR6C1P5
         F3og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766396165; x=1767000965;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kq3LMdMdij6fkif2PNLahCRwz5DF0om84C+pt+8LIEc=;
        b=Govk0SH3TZEugbZ4ty2v+UzjYrJU56ti15+wFjWGvdcJ9hdRbnrclwihPGLDBei0mE
         E8xjm59R2YR16vyuMXVyEg/ynv2+zn6Ao0MldSaGfHSgnQKeqVVN5Vr3DFVRopE4O9Hm
         dOAkY9r2jgntpJO0JyzRhu20bj07rPiGbKHGeahHX4M9ldSNZrSh/+3yddEvWNwuDloE
         sDfSF+eEB6PZVHZJopidnSelKkhlCTWd96bfq8xgspZRHR2LUgLd5lGQj0F/SsHJ/eyY
         ulUufFMDyuvbKRyLL3cggsfz+iPUtbKZdH+CAmhGCfEkhgZ/NNQwkp2FOfz+auFU8mhY
         9lYQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1xUjGSGJwZ+fZjpV795ZlE57b4ivtvsgslN328AOOLzPvD506yhdTIv72ZPOuwCkrJ116xTcI/FYjWt6C@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3exQQ0SmRsAxcgKQIGd4+M9kortG22+deMteyGxdWyCUvrcni
	a9CzUzdche8C5wwWiJYnT0lQlk/9c9JMIdXBa0HvNhLwUcBWU7C3eEMrFrJyJKHQT/Npbknwfn/
	5sCxc1/SDKroGyXB5WCXOtNGZEa5v7zWOg5yF2BLQH4SzaTpQ/MmK0QBYpga8+RuQqrprPtnfxL
	NX
X-Gm-Gg: AY/fxX6D91rLCC/A0WxhNBDM2piFMSjUQLtcZzBAEMD1uPqx0+tE5J7sHOxfVXSv0zA
	UPnROPPhO6XKPIPntx8/rQkrPDxeMg7OmpQCNe3JmeX6fZWfrBq7LnMQXcvzGz4eKd3ZzIS3mW5
	NX8eId9MMsHBiE58afzp/0FC9qHAUNBChZhK84EHE3uPIRWlvWfuuAyo6hB58EacSEDsZokAKTD
	kI7x2e86vuf7KN8AEUIA1re4A+Exwzs7hmIBXaLlTdsL+pyiZbE1lPeafO8Nb6Fynj0XMN1KihI
	qHeClZNWILomI1ibNSIFxc2oOQPGsgq9o7P83LuC5Ys+9b9M8fl9T8bZjmLr+Xi22Ofqi/u0H5X
	4JlcFh38aNAmZsOo9HEjVC3wTZkekFlV3pM8yREQwPdjvnkln10WCATUUBXAceR5IAw==
X-Received: by 2002:a05:622a:6a07:b0:4f4:b372:db38 with SMTP id d75a77b69052e-4f4b372dc2fmr65536221cf.5.1766396165103;
        Mon, 22 Dec 2025 01:36:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGWpek2X38QiRtdwckvzye0DRKZoNSOPiseCm6P/erYFzBxx49LJUA8iJJlmbhUn/duX2bSIA==
X-Received: by 2002:a05:622a:6a07:b0:4f4:b372:db38 with SMTP id d75a77b69052e-4f4b372dc2fmr65536091cf.5.1766396164666;
        Mon, 22 Dec 2025 01:36:04 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b90f53c16sm9874135a12.1.2025.12.22.01.36.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 01:36:04 -0800 (PST)
Message-ID: <a401c58b-a0f4-487a-8530-1c6ea411ff35@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 10:36:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/19] drm/msm: correct/add a load of kernel-doc comments
To: Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
References: <20251219184638.1813181-1-rdunlap@infradead.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251219184638.1813181-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA4NyBTYWx0ZWRfX8zzFohMypvlo
 cAMplSrmZPPB3Ve+7ScrTpPZ1rm9QNFHaBSsIk/sWi6Jm3e8k8ZceCwpYcjzuSrVwB/FLLAWGfd
 dLQjsl8+FEsMEaMtbOMl1+Lz3nX4rRwi36A0DB6gRHFJH0iiu1oBly4YjlXkeNFT6Rbzp+ukAsJ
 hUn2MZ74ys19ZE8qccLbAurHnkNjjRWbor22CgLjGRG991nk8vgqf+Ivq6o9wKsfbvkIzGver3j
 X1/UT4hCgihYQqIfiJGz+o9gvxTRqcY/OLRaPMVGEsvUYnxE+fA/0yZ9SLe0CYOjfvWLzJlKYSj
 Rb6IN33SGEWMefdnJaqZHV++95PX7VxmGC3AOYhGC0MVpxJV+0ZLsSJiS0E2tD+mIjeLH8dLrUP
 EAsMndcY7yUuW9RLx94NzALZpzB1DdGG2OCcNFW/AvMZnXIfnu38MxbmG50VDnVg4vJUs6yFNUO
 yvzFWVNMohqOsryZeYg==
X-Authority-Analysis: v=2.4 cv=VMnQXtPX c=1 sm=1 tr=0 ts=69491106 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=QSihu6i2WLKBEhuxrFcA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 1fm50F3pdQeTv29T4OEFRUBAN-Wrtjr2
X-Proofpoint-GUID: 1fm50F3pdQeTv29T4OEFRUBAN-Wrtjr2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220087

On 12/19/25 7:46 PM, Randy Dunlap wrote:
> Correct a bunch of kernel-doc comments in drm/msm/.
> 
> [PATCH 01/19] drm/msm/disp: mdp_format: fix all kernel-doc warnings
> [PATCH 02/19] drm/msm/dp: fix all kernel-doc warnings
> [PATCH 03/19] drm/msm/dpu: dpu_hw_cdm.h: fix all kernel-doc warnings
> [PATCH 04/19] drm/msm/dpu: dpu_hw_ctl.h: fix all kernel-doc warnings
> [PATCH 05/19] drm/msm/dpu: dpu_hw_cwb.h: fix all kernel-doc warnings
> [PATCH 06/19] drm/msm/dpu: dpu_hw_dsc.h: fix all kernel-doc warnings
> [PATCH 07/19] drm/msm/dpu: dpu_hw_dspp.h: fix all kernel-doc warnings
> [PATCH 08/19] drm/msm/dpu: dpu_hw_intf.h: fix all kernel-doc warnings
> [PATCH 09/19] drm/msm/dpu: dpu_hw_lm.h: fix all kernel-doc warnings
> [PATCH 10/19] drm/msm/dpu: dpu_hw_merge3d.h: fix all kernel-doc warnings
> [PATCH 11/19] drm/msm/dpu: dpu_hw_pingpong.h: fix all kernel-doc warnings
> [PATCH 12/19] drm/msm/dpu: dpu_hw_sspp.h: fix all kernel-doc warnings
> [PATCH 13/19] drm/msm/dpu: dpu_hw_top.h: fix all kernel-doc warnings
> [PATCH 14/19] drm/msm/dpu: dpu_hw_vbif.h: fix all kernel-doc warnings
> [PATCH 15/19] drm/msm/dpu: dpu_hw_wb.h: fix all kernel-doc warnings
> [PATCH 16/19] drm/msm: msm_fence.h: fix all kernel-doc warnings
> [PATCH 17/19] drm/msm: msm_gem_vma.c: fix all kernel-doc warnings
> [PATCH 18/19] drm/msm: msm_gpu.h: fix all kernel-doc warnings
> [PATCH 19/19] drm/msm: msm_iommu.c: fix all kernel-doc warnings

Much of these comments should be rewritten, but that's on us..

Thanks for taking the time making them at least format-compliant

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

