Return-Path: <linux-arm-msm+bounces-83517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FFDC8C0A8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 22:34:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1AC143A9837
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 21:34:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0433F2FDC56;
	Wed, 26 Nov 2025 21:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dxvIIT0D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ldo5aCnn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9F92DFF19
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 21:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764192891; cv=none; b=oUOkpSCly+8HLZ/TOcJdoRs5eWtq2DgnlYSd5+9BMSbcT/WcZYQu58iy5y4bXCEW5UwS2UyKcG6ckLMETXbc7jIYjRPzIhI/FtZn/F50ZsmG5L62yk8Gyo1QUMs02MYURJudxQnhFUKI01hAmUyKMnV1UFhA197S0MP5QECWC5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764192891; c=relaxed/simple;
	bh=eowOxoJihoVTg0geYe5ZEliongOwiYqGsqbWYdSFZEw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mxwZdPKqximdIbLQm/FmKEx6TY5ODwZL+ClTbA1vUGPcAvI/7sqYIONoHHwbF862c8TpuSUn8n1a3nGd310gVmy+bwgNwyn1g+73VRwSVqcoA49Fl+7ktquZw+WeZsufB2y1R5+evKBFE4PtkUv2MbKH5lc7VC6C3jUxuIEkBS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dxvIIT0D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ldo5aCnn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQBNqI11849482
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 21:34:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2NwkyEIbP7mfwEd4CBJ0OPJpWw2cL6nZtgf+1stJqQQ=; b=dxvIIT0D9F1y4XWL
	b0Z8hg0g43gIyEzI1E1v5AHUGy4oE5JKE4XmhDBNbDe+oSJmf2a9CE/rvVnAO+bw
	z46dAjQmBYYjINqPhYczsbyBXTEExVQEIiC1tDiqUtlZqmCFsNENeZC3rFCSNOR0
	vShmG3qo9oyQe8vgIo9GEhuE8S8aK1kfUHEGFPPQDr8LTjGtmLSSqr7obZv8efzY
	6imXw5v9eIl0eTOkzTZYL4ms2M+qUJgnlZPUFcroeKY8yth+j7o/AQJVc7nvTcf/
	CtxcCHtCjrfeLHvu44xAYwbcuS3ErFIfVFi+I0/TuTFAkVeE3+lsvHc7jtkO8bCm
	pfnUdw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap0msskfd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 21:34:48 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7bad1cef9bcso247098b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 13:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764192888; x=1764797688; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2NwkyEIbP7mfwEd4CBJ0OPJpWw2cL6nZtgf+1stJqQQ=;
        b=Ldo5aCnnhAQbWaock7nv/qaFO7AE1VjIA5oFOcNUIEWnRivtVsAw1yCu14SFzOHc1n
         x7esF0x31SQ2jGWDpYSeCseluZdMtwAasaELiyNuGjW1RVV0f/aEeJVHrONjJAFNUA22
         J/vVz4jg4pIuphfkgVZ7Frmy+VT8ZmdxFpOW2lp4xqjy7UCwA+KrPrsRwV+uZoKbo/1p
         xhA4JpoJxkzqgEJUX/DCvC/xTTWWK3bpsGar34ogN5F1OUwwdvgSfOHfK6YvSgUqDrzq
         wUnA2hHWc6pBmg+EF2T8h/gq9ZzStq5tUeTT0Al5Are/BAN1THOv9aZsxWqPt4Tup//r
         27zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764192888; x=1764797688;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2NwkyEIbP7mfwEd4CBJ0OPJpWw2cL6nZtgf+1stJqQQ=;
        b=cfxwxblWaJErT6VhieyvqYqtvaLmvtVJF3c7awLJ2XFqBoB4WJ8tWN8eNS+raQLImo
         QLTdGHNbLAfxoaEtSWe/GxM1A2rL7CS1OuuonH0RkE+GWe+4lO0OGVgcsJo0JSqytXkU
         RmNpGjEh53qjVw5PHjFs601WdtecwJ3mUhj1wQkiBNPdcza4vTGrEad1EL7+deO7WJr1
         o8h3t8N0RC0ptYo5eZz1g8IH0uk+/6w9bcVt90H6vg9dEZo5PDyEnE4IegNamizeon20
         wDPjIkTuEqmDEVDASgw8Nv2oFnGBhjGzS77BF1qoyzNrBt97lavYTJyLYx57ba0uOjMH
         jtQQ==
X-Gm-Message-State: AOJu0Ywv9lL1WIPRVu3+hVr7JNooSNRs1KWya9Vc+h0q176nzzheHCBf
	NqhtRL7ZerRYT9Iffx2ms8lC0E0Unlax2GuY6TwOSbOKAC8gBl6je4x52ApaP9Epx1Y+ITeD5rU
	N3YFVWJ1SH631ff7X1LvrVsCS0n4FsU2OduLj636laLwQCCMEW+7GG3W+BMTXJKJD/mBU
X-Gm-Gg: ASbGncsk2ft2kQydYZDBhdkqf94SmSY0LYCt0aZLMz+R08l7YWpjCgqb03fYT9j0QYR
	RrSB2mmnYFwd7053JOIGP+fzpCZWYXsvXtWbVm2Lj+yovKoOC6GLq+si7r3E/QGBwJaYol/nBxi
	f+f51ALY23G15b/dU3MyXtfbgmFjoqz6z11zVy4cu4e4ahHTQN2v2jQ1GshmZwkjv6IsrB7NM/e
	pqSxuHb0BEJ4PV9o9iGdo/sP3SmSg8sK2ZGsbpHuhe3cCEEGSPewElUBOFPD3UiMwJY4zzSXXA7
	2z74w6UDjqrjBI8nA3gjLcqDGhTD1eZVNS3uWffvIOESxpOIEG1SROn2siAkigFKhj4cP5HmbYy
	Qd1ErJpMWRFrAK/N7Uz+DaeJ+4OpWRj0V
X-Received: by 2002:a05:6a00:845:b0:7ab:4fce:fa1c with SMTP id d2e1a72fcca58-7c58c2ab130mr21776560b3a.1.1764192888292;
        Wed, 26 Nov 2025 13:34:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEzCt9XSY3gyqFZT1HSKkLzlml71T9rXO2LDSzLEnensoelSRtYNU9rQu4G8n5l1LFmUCIzQw==
X-Received: by 2002:a05:6a00:845:b0:7ab:4fce:fa1c with SMTP id d2e1a72fcca58-7c58c2ab130mr21776540b3a.1.1764192887864;
        Wed, 26 Nov 2025 13:34:47 -0800 (PST)
Received: from [172.20.10.3] ([106.216.204.28])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f0d55b71sm22707890b3a.55.2025.11.26.13.34.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 13:34:47 -0800 (PST)
Message-ID: <7b6dff80-6e20-43f8-838b-3c5b02338714@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 03:04:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm: add PERFCTR_CNTL to ifpc_reglist
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20251126-ifpc_counters-v2-1-b798bc433eff@gmail.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20251126-ifpc_counters-v2-1-b798bc433eff@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mZr515o9EKGWPjgcNcHjqfHyUppX3Tk8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE3NSBTYWx0ZWRfXwYYm+Oqj+fPp
 cpvqmIDew788Fd5toRmoa16BnbgxOnBQlUSln8xKzScbisI+9Cd2KqAVuuf3ibaRw/vUi4pCzBc
 84TWRmDlGMKj58pjy37F3qB2sanXvNgx2wzQ2xgWsJ1pP3/rH963vfYlhcw1erRuAEC3ULhOdDH
 5bDqFiX/aOwFv2NFyeRq7Ea4BJlcblMjbMaYt4qEpchANduRYURZAWIUZ2FY1eBF+FHRKUpBFFN
 YjDq/mHQwTp0pVOfsuk9ew9PmTSuVJyjvQjQIA+6W4qnkyxEtOAebvZ+N9AzTl7ndb6eMMBt3I1
 eis3TO3KKDLsLCpBAL12nxuOcn3V+jlS/E4XUEuRBjj7OhpTYZ81E2yBRUq0BoXRJm0g6afbQYv
 rA/h1CW9v2vyH2ht3g8wSSiju6ea5A==
X-Authority-Analysis: v=2.4 cv=N5Qk1m9B c=1 sm=1 tr=0 ts=69277278 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=RklEKUTwpnVNyatRsSmyOQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=GqK8k8GEXUDarboaZ6YA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: mZr515o9EKGWPjgcNcHjqfHyUppX3Tk8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260175

On 11/27/2025 3:01 AM, Anna Maniscalco wrote:
> Previously this register would become 0 after IFPC took place which
> broke all usages of counters.
> 
> Fixes: a6a0157cc68e ("drm/msm/a6xx: Enable IFPC on Adreno X1-85")
> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> ---
> Changes in v2:
> - Added Fixes tag
> - Link to v1: https://lore.kernel.org/r/20251126-ifpc_counters-v1-1-f2d5e7048032@gmail.com
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 29107b362346..b731491dc522 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -1392,6 +1392,7 @@ static const u32 a750_ifpc_reglist_regs[] = {
>  	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(2),
>  	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(3),
>  	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(4),
> +	REG_A6XX_RBBM_PERFCTR_CNTL,
>  	REG_A6XX_TPL1_NC_MODE_CNTL,
>  	REG_A6XX_SP_NC_MODE_CNTL,
>  	REG_A6XX_CP_DBG_ECO_CNTL,
> 
> ---
> base-commit: 7bc29d5fb6faff2f547323c9ee8d3a0790cd2530
> change-id: 20251126-ifpc_counters-e8d53fa3252e
> 
> Best regards,


