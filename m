Return-Path: <linux-arm-msm+bounces-58891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 006EBABF4D8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 14:54:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 767574E4FCC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 12:53:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7B47269CE4;
	Wed, 21 May 2025 12:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I2+5K89a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F87267B1F
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 12:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747831951; cv=none; b=WwIzKNlFQjrrIFke1fiXz2ukCg6pL06HvzSedAPHAUHCfC+TBZe6JRxdgXx4sthAyDhs0lQm++OvTeaVK4/fe/d5uQ948aoYzjxA1OCFue9aNjHIljurfVOMvsIZ5Ab7WQlL+N1DTbuCTq/gM/lvIuC+4F1c6AzcfkCSCOV29z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747831951; c=relaxed/simple;
	bh=ubr0IoG6QxDImEoRbYeRtQ/EWZKK2tR2JQKhedixIks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TPp1lVW4XFb3VTSQBNxFrL6pa00Ug9wzaxc+zJxoelvRDX7DvF1kl6HM07xOiKidpl2/OLVS5F5RWHa9DW5bdWaWEXLt61z7OYN/nFCKnmnsMfR2vjYnQdru71O267pwhj/O9EAp4K7DYjBNP8OqMnwJnecwusHkSU75Tzxz9do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I2+5K89a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L9XMtK024821
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 12:52:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tZm1FcnWYSxqGc6IW3xjphoG
	JpTqJodC7MLjwn9TjHc=; b=I2+5K89aoGBs7qFoEkVBHrm9duJlO+OREk4tVzZN
	bN78S83KHmUIrZSlzqpDD4XlIIUnqmGThqZOCSUxQlOrAU+qmTtYVrLeLdEPV2GR
	YMho5mIM6UyTLiODbPn4xmrUwYSfz9GQERP0kRbiaZhnYZAR3A679uq8loBZcc3B
	L1/j6JtwzecCR16ca6EgfeslWqbmFKw3cm6PefVsbmxli/PWWHSs9YJo43/vh5sf
	DmbCLSwz33iVp/jODtCXYKGS9ptuGuYbwuzoyygHISkb6wW7znl1tv5iK1nMEX1m
	Kr++J7svvc+ctNhMkEpxwudiqknRYQq54iz6A8VLR0MRaA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf4txh0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 12:52:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c9255d5e8cso1149712285a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 05:52:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747831948; x=1748436748;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tZm1FcnWYSxqGc6IW3xjphoGJpTqJodC7MLjwn9TjHc=;
        b=A97wOv76FvCeObbaj37aXaoynLwk3dNPBS1BKh9lySFr+l96TDMG5B4NJernYurYXH
         qRW8gJaRa57AL4XNOEQUx0+WpJwWXjivcXLdfSl+nyM+GD1KWBWtIVnQr94aVmYRWt4H
         aaQySXmhdCLI8OZwy4W2mraANi7w4xROTlrVl7y0WTCLvJ1xsqS8Lx5SXIW9bPbgtEZM
         8bNo2A2yTsuWoZxdZRGgA4qeWWUEJWtbRc8dGkfC3o4EBeKWDrsCMOuI0UFsfn4Aypu5
         zhjGJRvuq+0Hf1NOo8zTpokxN6v4TSXN9RDSIZCe7xE/l+f8NnwiXvzvVcnEB2aU/y9S
         I9Jg==
X-Forwarded-Encrypted: i=1; AJvYcCWfTHpXjAuY55JryJiQddVZRAAtCoyEL/+A2MPQxlA82UaKszq8HrQs8dvsCkAjvGlZiTRi3bqwvaJyB4cq@vger.kernel.org
X-Gm-Message-State: AOJu0YxQJE+yuDprz8NHYiDS0VEHFfYz9KTk9ZLRNopc+jaoXpjE0/zq
	NYaMK5VQiEDt1bhkR8NgNLdAIeTW8lfcOOoTNq7axLbqQdjuG83V9X56GAohFOZOhAvBFOPfiFq
	CUfCk1czf5pW5I24xVfMiZH1aCTzjD1xCzJ+HEwaHrkoqgsHqaf6gT+NDdAONzxGpyZAU
X-Gm-Gg: ASbGnctfC9iLtLcC4NkoGLuvw9RkFurlNaAWD4ZHDyupPLEBVzLZH2Zf9LVChKiFw8h
	u8dEHzrkRciovcZ2OvKtYZ4YgYlAaXILh1aHLD4q0MJpFWRo3LMgJGUNsz2/QBNXxqalSAhuSOF
	o2Js00cyhH6akPWGbSOXxir2CJMzoVtgZuAmZ7709cBFEKaaBIFilCnROTKaeY2cUzKnSY9g6Eo
	JOqjKZ8CVszB+8DsZN/ZzLFfsddAzb4/kgE2WBzjFGhobCf6pXhBfM+rWojLO3CCEz40n9+XVm2
	fKL+/Vu+k0T+IHDPLbZ4yEntbIkKy+56E8l7a52KLLeRpfq1KMtxxXqIetBe/OFRCj8DKCVcmSU
	=
X-Received: by 2002:a05:620a:459f:b0:7cd:31ca:d81 with SMTP id af79cd13be357-7cd4673b9e8mr2611201585a.27.1747831947936;
        Wed, 21 May 2025 05:52:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElTuLwfN5LBdLDm3L5ftLVYf4GR8LqxAuo0yz1nHnyhymUVMITO1eRg42xfg0uzDWWAlCCaQ==
X-Received: by 2002:a05:620a:459f:b0:7cd:31ca:d81 with SMTP id af79cd13be357-7cd4673b9e8mr2611198585a.27.1747831947533;
        Wed, 21 May 2025 05:52:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f16394sm2826161e87.5.2025.05.21.05.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 05:52:26 -0700 (PDT)
Date: Wed, 21 May 2025 15:52:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 2/3] soc: qcom: qcom_stats: Add QMP support for
 syncing ddr stats
Message-ID: <jl4g7mutb65ifxuv3covropjntziv5enxyc3lgz2fi7ddu64bd@e726p6by3vfh>
References: <20250521-ddr_stats_-v2-0-2c54ea4fc071@oss.qualcomm.com>
 <20250521-ddr_stats_-v2-2-2c54ea4fc071@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521-ddr_stats_-v2-2-2c54ea4fc071@oss.qualcomm.com>
X-Proofpoint-GUID: Kw4IEnAnX1Hyre7vXaeioqZ_t53F0EPt
X-Proofpoint-ORIG-GUID: Kw4IEnAnX1Hyre7vXaeioqZ_t53F0EPt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDEyNCBTYWx0ZWRfX1AVTQ/3KqRrI
 16AoL75RyMxHO0T7BVM0BJ4nhiBr5ToU6VoYWrPkBWbDMLUlXKApyoUhFLsikfmhBWLbXLWazVe
 42altw9Kh7nvSdQ+LaK9FwZwkx3Kj2aUK0bO4gUHqd7Jc7CB0/DUZ8PhDks0kmzI+jLamvCnsEX
 RHPSKkv6Mgy8DgltrSLSU9/Rd4fZvpaMTYHXEUDpojVBAeVHYN6tFssQJfnyFi0knl+E+5uOuBY
 /KfzwhM+7UFT0fWcJ4Mmp6KMY5HfTn9auvZoitkE7gTNI2K4UC/Mkr4RAJtDIIjWMJhQWp1oR6G
 A75K1Qm6E2MyV+7aWEkbWDNo6Ek92pOi6MSdoY6xTgN2b04dVivAL85HgzfE6V3U7z3WM7ODon3
 Pa72ztB8OaIykBA9gFjDIjCLHtachaGJeb/aGsJxKgsWvfK5ziNG+3yQWv1vZt9u9hoT6+1u
X-Authority-Analysis: v=2.4 cv=R7UDGcRX c=1 sm=1 tr=0 ts=682dcc8c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=Prqm17leZL3r9GWXGqMA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_04,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210124

On Wed, May 21, 2025 at 02:02:11PM +0530, Maulik Shah wrote:
> Recent SoCs (SM8450 onwards) require QMP command to be sent before reading
> ddr stats. The duration field of ddr stats will get populated only if QMP
> command is sent.
> 
> Add support to send ddr stats freqsync QMP command.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/qcom_stats.c | 29 ++++++++++++++++++++++++++++-
>  1 file changed, 28 insertions(+), 1 deletion(-)
> 
> @@ -310,6 +329,14 @@ static int qcom_stats_probe(struct platform_device *pdev)
>  	qcom_create_subsystem_stat_files(root, config);
>  	qcom_create_soc_sleep_stat_files(root, reg, d, config);
>  	qcom_create_ddr_stat_files(root, reg, config);
> +	/*
> +	 * QMP is used for DDR stats syncing to MSG RAM for recent SoCs (SM8450 onwards).
> +	 * The prior SoCs do not need QMP handle as the required stats are already present
> +	 * in MSG RAM, provided the DDR_STATS_MAGIC_KEY matches.
> +	 */
> +	qcom_stats_qmp = qmp_get(&pdev->dev);
> +	if (IS_ERR(qcom_stats_qmp))
> +		qcom_stats_qmp = NULL;

Don't we need to handle QMP being not probed _yet_? In other words,
there are several distinct cases:

- No QMP defined, proceed without it
- QMP defined, not probed yet, return -EPROBE_DEFER here
- QMP defined, qmp_get() returns an error, return that error code
- QMP defined, qmp_get() returned valid pointer, proceed with using it.

>  
>  	platform_set_drvdata(pdev, root);
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

