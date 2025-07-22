Return-Path: <linux-arm-msm+bounces-66098-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AEB1B0DBB8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 15:53:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 188207B4152
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 13:51:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A50102EA72B;
	Tue, 22 Jul 2025 13:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Onz7x3Pe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397CA2B9A5
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 13:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753192339; cv=none; b=KIg1NZMpaQ7fuKmSRNcvCJcGQBPPZxDeU9XeC5gciNtZQyyO2rBCI4TiuLvkFbSLibsROixIhS0Ahxyb1beV+YXvN8/5vLTcV2cZgpraUZXooitDaWNm41IwmNMq7WrSDBdEbvop27coHa9CwWqHqlbmLbenKzEZUHRX3ooLKVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753192339; c=relaxed/simple;
	bh=QQpHzlcpW2+Y1Jjb8mCrgKam8W9z5/cTRPpSANu4kTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PKMiaWnvVDEkrKmP7yWezsIvU9tHc/lqCAz70NHMzX/h8cdlGwauk0D8jNSqSH1ANLdlsaul7Sj4wrrpe9l1QBmBa/tsz/fDyEVzvDij3+xKe3nEvsY6ZHlcB+8R+n6AoDRDhYTXWHO4saxyPC6EmwIerAoaQyDFhXwHJkClEMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Onz7x3Pe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M7LEZ9015188
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 13:52:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Kw9ZzSYekP4jnMMDcD6u6zPA
	55Dkfs0wyd2ey7LJ+D8=; b=Onz7x3Pedf5elMf/z6wd1xlgRL/J1CJ9BxfEi9Do
	FS3EDeFEgiu2i06HRNNfzJNeNjNkeTCk+AEUm1vmMa3ci/IoMf/1IGmQ90qcARy0
	SWrh9BhIo7i0+otRHvLZhsxk3ti/7DL+PvQEhfqRMrOaEw/HSPcPgoy7P3BE2od5
	2r6PRKjy2/M0/ch9+iavqkIqieKBSQ70McWiirrNSA0Zy5W5LRhOplyIOTjaoL0N
	bzrnmCCezGcoL6XsVegZqsklNiFAvlC0l1aRgjfhXNh8zn4m38l+hm+dBDf3qT6R
	oph5hjbnFFznkQSfOzoxuwP0BJMJGOaM7NDwiyJq+ZMPRg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481t6w2rsn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 13:52:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e36f4272d4so387184685a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 06:52:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753192335; x=1753797135;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kw9ZzSYekP4jnMMDcD6u6zPA55Dkfs0wyd2ey7LJ+D8=;
        b=JfGM+SAe3ZcAH5q/uOifEV3jgbr+aqIzUHsnGfcyGd5OPac2TOjASwnvf6wRPbpNmP
         uLmK9qD6Vp9O9Fd6FnFLnvtCcWJjmR1LP8OTDbsNOxKU8gaqBY/wh/2Ka0aTin3Hilsw
         IZ9lDlaeZDn6HtgCEkiytpqWZIkHg86hxwHVbX61H178sKXPdIcQDbL14U0/6L+mBtqT
         BXhIXlJRsIzTa1HH618SZ4qDXnkvx+UmiRt/dkYBu1REwyPLIYd+yHYMsmTx/nW3weAp
         +AvaqhNJWjCqgP+Ap+3gbSg+PYp34ed5X04di4eZCTUGtFvluk4jmfLj1WqNYiyUpcZs
         RIMA==
X-Forwarded-Encrypted: i=1; AJvYcCVgxK258qwTq7FMzLoaodUVR9cezsMYatFRO0PxUzh6s7WeYjdQRTXLEiqqsZRFmiiI3B9veBbWeX/Mubmc@vger.kernel.org
X-Gm-Message-State: AOJu0YwVnbxxksExuJcfv7VMClbZbVFFsIMhHdWMahvhXOgXAEsSZp4C
	YTngpyKHfNMj5KQshBiZw77WT2UYXk/zZDFzh/K3mV400mLHHZCbUwpuaCHijz2em4ykoBFua1v
	/8DOXCckn6RmYvG4GS545hcjVND9SgfZvEXuYHi/lI+t0laICcrHl+k46iIBXCxwEf95U
X-Gm-Gg: ASbGncvPYeZryyGNIi0KuBuFDjsSWfFDmQx9A6s3sIFQFpCoE63jBFBWez2JRkjL0Vq
	F4nhxqogpVFEpynXMYLqPU4S9ufjX+kB9tnBelG9DJ84TsLFs4aKvviHAXBQ3lrFMHvXZ/bRxsg
	qwDMFLArzLrPs8ML4HiGfaH0IN+HmutY01vwxZFEL2njkBjKzvK0klZ7Ex65f1sGEzK3DvqaZiD
	OjGcaTmVO+SeDIa6nIw49PEuUyAzh53zZSiCyqZ01DpfY3wDYngV8E41oBkDzPg+RVP/eunM7x0
	tSJ7qt4nEB187Rx6o2Y4040NaTpMptUqKy3gd8CXzCahWxS4jrO8MxuqSUvHGRmJplxPbwNNoIK
	OKEtv1ZBVrSrzpcPkP2gUEWQeFbMgw+M+2LUh37WUm0w83TINqoVA
X-Received: by 2002:a05:620a:4088:b0:7e1:872a:50fc with SMTP id af79cd13be357-7e34356cb7bmr3600635485a.15.1753192334865;
        Tue, 22 Jul 2025 06:52:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZcOEKfXjfbMZ69Gm3WsZ5DAtXxY4VO7zJgh6a1vFVgcI9uk4+0wZ083YoYs+e4/Wgr2kP+A==
X-Received: by 2002:a05:620a:4088:b0:7e1:872a:50fc with SMTP id af79cd13be357-7e34356cb7bmr3600630485a.15.1753192334345;
        Tue, 22 Jul 2025 06:52:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-330a91f1f4bsm17890721fa.105.2025.07.22.06.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 06:52:13 -0700 (PDT)
Date: Tue, 22 Jul 2025 16:52:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 13/17] drm/msm/a6xx: Fix hangcheck for IFPC
Message-ID: <i4o3ivearks7gwg37ywyqyl4jpmbwnuczac6h7dscrmlepawag@jhedlyj2hzps>
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-13-9347aa5bcbd6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250720-ifpc-support-v1-13-9347aa5bcbd6@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=SPpCVPvH c=1 sm=1 tr=0 ts=687f9790 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=eWe-OnA97Zcb8zRWG70A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDExMyBTYWx0ZWRfXwWGa0jWlGyU7
 96pi3ch8rm95lFavfqvbLMH2tJWzxextJrL/W+BtpLE8sjD8DWU/fN8XzdggHhaqkWrlt2y80s9
 KVsVFFyHYIEhbn9HNbvKxgYIvjCDYAWBbOnn/NXih8+TZMHH3rvBXFpeWRj5NwOtIwV8zx3APx9
 gi4DB12rRIF7UcrxMpYYllbgGw5WOyxS67fYlm91plSsXjFYOzBIOeGwXLNQ+8V6hFWUdQjkD8N
 iMWIUw7ik9fPuwef26cVfGSA8DzIr1ZRioSkytlpK3bvU4dJpLmt1Tn9kDxP3SXK+Cm/0S3CRCv
 QgADVs44/qqvMVi1VeqcEit7S7stNXImnfamDzlHwTYT/6TOn37dwj6NcnZ3UstKqRxb4H85tW9
 vuMzoLusG+Odijz1zBs+M5cvQCEzEQyZkJMK/NcKkLV5n750+yzkgPzgADqxpezjH/D0rU3N
X-Proofpoint-ORIG-GUID: Zn1Pu7x9_IfaVFHUFMYYd_-GbKVDdH5s
X-Proofpoint-GUID: Zn1Pu7x9_IfaVFHUFMYYd_-GbKVDdH5s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=891 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220113

On Sun, Jul 20, 2025 at 05:46:14PM +0530, Akhil P Oommen wrote:
> From the hangcheck handler, KMD checks a few registers in GX
> domain to see if the GPU made any progress. But it cannot access
> those registers when IFPC is enabled. Since HW based hang detection
> is pretty decent, lets rely on it instead of these registers when
> IFPC is enabled.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index e331cbdb117df6cfa8ae0e4c44a5aa91ba93f8eb..b3becb230a94163cccff4eaffb8eed44f1c29ad0 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -2399,13 +2399,23 @@ static uint32_t a6xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
>  
>  static bool a6xx_progress(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
>  {
> -	struct msm_cp_state cp_state = {
> +	struct msm_cp_state cp_state;
> +	bool progress;
> +
> +	/*
> +	 * With IFPC, KMD doesn't know whether GX power domain is collapsed or not. So, we can't
> +	 * blindly read the below registers in GX domain. Lets trust the hang detection in HW and
> +	 * lie to the caller that there was progress.

I know that we've relaxed code line width to 100 chars. Would it be
possible to reformat the comment to 72-75 chars?

> +	 */
> +	if (to_adreno_gpu(gpu)->info->quirks & ADRENO_QUIRK_IFPC)
> +		return true;
> +
> +	cp_state = (struct msm_cp_state) {
>  		.ib1_base = gpu_read64(gpu, REG_A6XX_CP_IB1_BASE),
>  		.ib2_base = gpu_read64(gpu, REG_A6XX_CP_IB2_BASE),
>  		.ib1_rem  = gpu_read(gpu, REG_A6XX_CP_IB1_REM_SIZE),
>  		.ib2_rem  = gpu_read(gpu, REG_A6XX_CP_IB2_REM_SIZE),
>  	};
> -	bool progress;
>  
>  	/*
>  	 * Adjust the remaining data to account for what has already been
> 
> -- 
> 2.50.1
> 

-- 
With best wishes
Dmitry

