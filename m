Return-Path: <linux-arm-msm+bounces-80382-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 131CFC33899
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 01:54:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 09F434E3161
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 00:52:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CFA323BCFD;
	Wed,  5 Nov 2025 00:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GfDnKDcm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jkzWBslU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0864323AB90
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Nov 2025 00:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762303937; cv=none; b=fLEdrSEM3wpzYD344TF1CqohzEuz6SEFJ060IMiMDXem9MLKhZ/+WRl66TMruNHvoGoGy1X6YwVRKLtnCaiOqQ5Bmp/hvSnLMlme7Q88It4DzQS5NlVruprDsyPIvwhFQwBkFDtpYo6hJ2v7irzhKCebUelKjhcq1RuYzSHHUJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762303937; c=relaxed/simple;
	bh=aXaS20XfOO0yOYPDtdD/ohFBCnm7CTzrYLH2xYcxTmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NjQiN68zCb9/+UcB2kwDTLVSezFwrfvhMUv0WPYqPjyakvAVoo4YY1lYKbRn343WrDDHY7VNxUAQcjkCPtaRLHts8+iZF6nRzSgjQBLs52Vu/UBUdbGp1MnW3vA1S+57fwYGzbI0/yXSGABBT7I4mGT5QiZwpmD6EusRidp23Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GfDnKDcm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jkzWBslU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A4KfmQ12978782
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Nov 2025 00:52:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mF+cLKKVRQFP3GvNceM/xWFx
	mZNCdYIyW4EQECMmO9I=; b=GfDnKDcmJbgEjVa1R/Xi+95GqnRXT7sVjR2jfZIN
	Fqc/jht0INTlofOpx+e4LJlUoiI1KbPU/iViAXvdmmcPcEtlAgdaix2pFl749Y5i
	Gqtntd8ZRhkHEpuDHWdfegIPe63fJBVO9sKlhqOUWGXhyf25o+lnvZw1Duz3rmDs
	pGluoIET4yW2TdnZb4sXhZbjDyO3jc1rjJriVDVOFGYD4k+DZ6ph6Bb5wX/ltIcT
	hCqKqRzCIJn9Juvv/LietW0Edeha8xrOzH6kXvURaXOLrC1+Ub19y8rcagLPVab4
	m3vMNetuG2Py8zVt7gcTR2kgXG9pCbM3duI3XggfTycvRg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7hbjt35q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 00:52:15 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e88947a773so285551211cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 16:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762303934; x=1762908734; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mF+cLKKVRQFP3GvNceM/xWFxmZNCdYIyW4EQECMmO9I=;
        b=jkzWBslUX0LewY2Qh9e4baptnblSZ4lGXzsPPujRSiVGyp4fBvkwTUJKBnBuDCJmxb
         rlKNRrAU6Zin8wgLN59dxYV/XBHRVb+vgOG7vpmKfoIOP6dWVkgSVucLpbzZDO8EFtJB
         Nth2J3bZurDYq7c3mNp07Flgw3EYzPKtCGmI2vk1vcPwAVwbNJY61V8K+tsvqfH8Iuyg
         KtJeq5sUyZ7Tw8tlQnom3w6G0DTMcR3L8eaMsHj/JOxjI1okCpjWRFQCLOjyNeT5ztd+
         c/ivPyT+7lriLausyS7Gy5pfF0/HthhpQbfq3mqt5OeTQGNSz7ss0Q4PGkDJVZrv5HYo
         +p0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762303934; x=1762908734;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mF+cLKKVRQFP3GvNceM/xWFxmZNCdYIyW4EQECMmO9I=;
        b=N7QamkbPE9MHqOqpdlQ6/cbPvkuWxb9/6pe3kiffm3GJqZ5kZv4rgjucRyx8ev+9g2
         kvK5KJ0BC9uS35FwOQ/zwH45+j9i8mOXvWYDXgwi71cI/q5mLMjWP/HLIU7AZ1Qx2E4V
         Ot1hP0KNJjeveZgK0bC9oqAY/1Qj0472RULeEQSEtzNM5pIBTpK6KmNFXwsUCQLSQIi7
         W7GsgyJZbfWjIaxs3fkC0Hhzh9cZ2tFqrO/ZENpUqlKUCGIBLcjdnX1RTMyIxqTFhfLo
         pBoY+lEACC172cgLNITKo5XJt+wwajqihj3Nxk+UjRAub6VLDAOI7WkmoNfX7wNsi65k
         8Byg==
X-Forwarded-Encrypted: i=1; AJvYcCWSHxuRj2Ukuy6gk/6+ubJKVExyKpzYCiLCf9y1NSe9iauxsmIjZ6sNykpzrdrCONNVhaQXY39prWTfXeDv@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx4wZh2FButs9NGONIVP7XXd1JLjWOn7L7Z1u1964EKLpwPDfu
	uXXJP+FKno4wFDfmKFxJdG+UWNogJaGvWIGUzYH+KpjCCOyucZaW7M1fNo27xUlMGGIanVC50/N
	kaGrGO2LshN2PjDTwsG+Am0dBVHXrmVRlU5BY5cPy0vfo65mNcEtGGG+04bG7iYjihSXW
X-Gm-Gg: ASbGncvMdeGsTQYE+QOsF+Zu0BDHPCmQXJhylXGHiCi/yICfwoF5p7xmyXdI4SfpL5S
	6sAvtnisXLDVmKCqy4mMCAa/UNcYJR5llvoFT9t0FZ6+Eu8L5Sv1QSu6HEpbhbpEN75UmTT4yop
	/RxnU85KRKrGxzn63L60b8rg1vUHAMw1cgV+TU4gJSA5Hrq5akQ8vHCIFb4VG7uLUQMm+UMxLRn
	srq2xoy/QxfJuO3dlfM6yOurre4hfbImtYEGFQ4F134SZrJjKbp0vsT8h84gj+sUqijNKs7jk7y
	LShW+XooD9SL/a0G48RvQ+Brs3+ZQsiS52xIS3oiOA9APUjEcv/sEMW0vujStOuEjbv+AaQoiG+
	EtZfcIKX81fnSvPgCduNynzKhlzxCkZsTlAEMPKibI5I4/s+VbKMMRB4+IBEPQxhhdqRdK9blh7
	/FwyxMrKzzh0Ih
X-Received: by 2002:a05:622a:50c:b0:4dd:2916:7980 with SMTP id d75a77b69052e-4ed723300demr20380911cf.2.1762303934338;
        Tue, 04 Nov 2025 16:52:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEW0DgYaDDDgZj+/uKyzHvi8EHOj7DGy29ph+Uz3G6jt85XoV7F46z+h4bslY5sXRqHQFhVIQ==
X-Received: by 2002:a05:622a:50c:b0:4dd:2916:7980 with SMTP id d75a77b69052e-4ed723300demr20380661cf.2.1762303933833;
        Tue, 04 Nov 2025 16:52:13 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5943443db87sm1187433e87.52.2025.11.04.16.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 16:52:13 -0800 (PST)
Date: Wed, 5 Nov 2025 02:52:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MAINTAINERS: Add Akhil as a reviewer for the Adreno
 driver
Message-ID: <icgutv7idot4h2fqx5iwhghty6h3gtqcsp5vbdgtw6jwjliy2f@536e2qcqpzmq>
References: <20251104220245.240480-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104220245.240480-1-robin.clark@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Uv5u9uwB c=1 sm=1 tr=0 ts=690a9fbf cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=V8cJkdWAq56nonIdhLQA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: yggEV81MrkjLIAtEMOhhaev3PHBb_MCL
X-Proofpoint-GUID: yggEV81MrkjLIAtEMOhhaev3PHBb_MCL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDAwNSBTYWx0ZWRfX3k+U+hy2o2rn
 L9SuVloe7qZLxrQBTn3f5zGs9j5x+tgSf7uHQm1al0oyT9pj7LVg9bod+xsxcoX1YVnwMFnAx3Y
 Ou3uCiTE1jsty0yW4a0ym90yU4l5c1gFSWOqZO8Sp/CJXZyVfvRe2FU25EP2ccRe8Qo91mHcfbe
 xI9ou6Iyi9cDO8OifHwJB3jxQvizZ18Ssfg0yrTml/z2K25WL47fdEgyWh54vSnPB79VnCNfT+c
 LY7W7PZl9BQmxpe+oqMmffU8E1ShvuaW24FBsBel+EXhjvf5H2CuYuVzLJtevTHwJG7/lglj2jJ
 9w259OkKmvv2X7k31p7AfjuVRn5jZAfTLpVgCxobLemney2OsA2evmA6xgWRxBnKNovBaJbyBPe
 nR3vA8sWZXDdWm8elcuOiu5ukb9a/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_01,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 spamscore=0 clxscore=1015 adultscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511050005

On Tue, Nov 04, 2025 at 02:02:45PM -0800, Rob Clark wrote:
> Akhil should be getting tagged to review GPU patches.
> 
> Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

