Return-Path: <linux-arm-msm+bounces-107267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QAsbA+RjBGq6HgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 13:43:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EE0532737
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 13:43:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AAF8A302F98E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 11:43:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 488643FE37F;
	Wed, 13 May 2026 11:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cgAn+non";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BbY6P7gP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF7E3FA5D8
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 11:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778672609; cv=none; b=IM3lQ9LBKR1aeytPULfFWpP4LtIifwe4JdlZQMqFqfaXcLxY96/VKvZ4LSy7i3z0hmGMcHNzueRn5FRoJv21LJl1Qhocm8bfBPQhdUodWVO1j6eIRy2QzGWC3j7ezPUA5i3tlUg5Q6HcYncG64+Uc73Ku7Kb//rDBHIGzVJ1118=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778672609; c=relaxed/simple;
	bh=sN61OO8kAG6yTPwisV5x75Nn5uMIPXOrQubhgGNTp5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c9sjSkyoPgJm3gzTdLfFMmSqBMW+pDOBLugM+Sr6d1DbNb6gID9oG97Gsd+ICjqHnwg948hsNWguDoOV0pSKBT1iutclFDChVq3PCUxka8CviskPfli+Uv4Tv6NF/FgoA7uuZFQ4jAAZmUhGUtLiprOKvVuhC0pqxzh3+tBxoEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cgAn+non; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BbY6P7gP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D6ieNv2965201
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 11:43:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UkyD0xKerVbIAXiG43DrA/Ry
	ShtWpfl8ICPJ8+orXi4=; b=cgAn+nonSupl25K6PuR0ewknE+ofnZJWgdmKZ/Jb
	iHdhmrQrYP7Vl0/v1t1KyknpDE17DH/XzY8Ln4cpET73ID0JzPe0UTzqxQb+aLvH
	RjZ7vlYCYn2SsOo5o8VUEbixY5ytJv1Ro04C9BpLNT/XXWlgCJ7HhibYzecYgooq
	1UzKARO8Phqd79cFHV4JK/OpNAndQC/7evMX+WNuzQgDJHoip8qsQnm0Z6P1kJCR
	jfG/b6EjPGsVaKqs3ocFnjDhtmQAi8XsUJXx7CJ7Bfh5QM+ZZXboXC2SL3EpQk9K
	XmGZZFG3dyts0SOqGLbWqGo7qlhM8ZVGuS/1PmSPNk8Usg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4ma594ss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 11:43:26 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d5d1c2289so60732281cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 04:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778672606; x=1779277406; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UkyD0xKerVbIAXiG43DrA/RyShtWpfl8ICPJ8+orXi4=;
        b=BbY6P7gPa74C0/Rr8GIyiiQIhdGwXVTDv2N6NGnFwdOEB5vJTmGTNWtcUU/6oCDuUQ
         wZOI4mk2e0KRofm2lZw818AgXBzDBm/H3619pqVFp5XqZaHDHuvKmDMjcnahyAZdif5x
         nnQyEAV4tX+DL/dEwJsqDgafY0Q5RHWcZo9od84ZZqU9QIfkmmeinJIyMtzAGdndDhwD
         DiaoceHGZu/RvtKisVEFDCTH8yfHRnypoq+6CVDBAtbsGuZBHeLxLnFHUQtaqdZM0fM7
         kvUlL+HnsBWR5Klx05TKfLqF9mgvOT/r1R77tq1foysawBFMs83zv0BUnstNrr0iM88B
         NfYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778672606; x=1779277406;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UkyD0xKerVbIAXiG43DrA/RyShtWpfl8ICPJ8+orXi4=;
        b=LLMC5/kVGZ/HKDyLWh1iuRGR6+YtmyJr6qQ3+z2Bv24cZ6Vb/RUwntjNZJpDhVehfB
         4A+z7gtovA8pH/ns0+HdIgP7hxSvUH7GMADF7a7Cu4+4Ewqyc4c6mPSqESim0UVrA+e5
         bOvos3NypvmOMKaPlc3i6AmGJNs8brx/76npuudK0NhmbDhLNYJZXUZz/YUd5B1WhuXp
         cJjQYIj21XyHIU3RdfEk4MkYssOH4ao2hFHS5ggsm1rSW4IPx9tUVPQlBOD5KTPG4FSv
         M4NQHOlVKPBzL7uLdK0BuHTuMq+VzT1GtjDAox8S/gdSP0gbLYeQV9c1a4zEjlBklHDe
         OGuw==
X-Forwarded-Encrypted: i=1; AFNElJ82xr4MmIcQKCNcZvb3GZmMubg//nbYmw0BOXODZoftKnUTEY52QF+GPyzffgTyOAXuX2jC7jo83Ut2a2fW@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1kzfXXu+Q5RyLGnRbQgK5BkQLK71zmVvB3Su1/yINX+ssteZd
	kow7+dPqesCijq0sNfUToXrzOP6+1U3GWOOYKFOSCmJz8KYNCwbjcKPXfjJX30KXYfUVMUQVzAn
	rrJ+mDy1DrrbOleuZvOts+k65PehX+nSx5m7ZqXf0qYY3JiR+SWd+9bE1dZYoQB2Yw66e
X-Gm-Gg: Acq92OFy3x2yo3CpQVBSL/BrIXDG7hxM1N02JQWxMZxTJkLEpNZphS6Te5UZqgjmuDn
	u/hfohic4ecMua8jWjSzpCPeZGAJhQ+mL4VFZ1cxkQ7Pgn0C2IZTbBNsWYD450IF3k51YGSValr
	+2sxxOp6cJ5Qnc4KTYT7xX/kW10K+DEYYmFuFtrCnjQmvv8Ozqu1xwcGaX6eIhDJgjGbq0wT6lO
	MlvVMMCB/wrK88RgZGSBJICg8LpGqKQUp825wcPXZ9l9UayKje3yyxUCjqj5oUbeOfZ7UcNCgJd
	/Z0dTbpmtStru4YzgkizOPRfXI+Nuenx6jRPDqTqxkm46RCiyW0l4B/AwM5FnX5IgFaaa4yQNWI
	OmYYG0b1CLZLa4vE40PoNshDmNgYYCqu4/c/gWXBL9T7eGBg+gdWr/k9dFY1DMiCzXllM3ZZB2G
	tcx8opBdn9SKD0mPb63CbAi77logyDI+ZCJRw=
X-Received: by 2002:ac8:588e:0:b0:50e:5de8:6458 with SMTP id d75a77b69052e-5162f63c521mr36966231cf.57.1778672605968;
        Wed, 13 May 2026 04:43:25 -0700 (PDT)
X-Received: by 2002:ac8:588e:0:b0:50e:5de8:6458 with SMTP id d75a77b69052e-5162f63c521mr36965821cf.57.1778672605393;
        Wed, 13 May 2026 04:43:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f625bd3bsm41131021fa.34.2026.05.13.04.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 04:43:24 -0700 (PDT)
Date: Wed, 13 May 2026 14:43:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFT 4/5] drm/msm: Always use component model for
 standalone GPU
Message-ID: <pbvoyojew67yeo2cr4n7msem242ytlh2qqtrxli2q3tv7e3iao@myqtn5w57paz>
References: <20260513-gmu-sync-state-fix-v1-0-6e33e6aa9b4f@oss.qualcomm.com>
 <20260513-gmu-sync-state-fix-v1-4-6e33e6aa9b4f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513-gmu-sync-state-fix-v1-4-6e33e6aa9b4f@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEyMiBTYWx0ZWRfXwiT4CnwRNUZF
 1KWHBXb17XzIjCDb1FXThauBjfCl/Y7hCBql0eaLwsObyp7qgRBqNL0IJE+6we1cxOl234NKhkl
 39k3gJNelZ8dq5AHmHPifNzv9qPAZDgQjD85lzW+iGUKn2D7tZ7ZeDv2BMkIQd7fLJGPLr/K0DL
 ZY21FUm43+MktiZ5jtEqQ4+pBGjDHNXdvyi/T2+yvKdj4HrNGmHtq7YTdkajpTRaXwkJu3Mi0u0
 8bIJ79sbblhbFzJghl8AzifS17XjdmyR6ukC8rbSL/QDsKDra4kOZKH5w1+5cwRd5Bs8C91axIC
 ONH5nFpwbHeFY8ltH0m6/Jfs9jkZoBixxuiUor2aWOMCeUwNKubKQA9xkHwnKOYSIyB0VVRTcxb
 2Sk1F+FP8An57OUFt5yznW7VW2uxzwFUW5bp2R2SXU7lfexn50S4ZETivR0qhq7+ETZAhbZKRCJ
 t/sRMhBLSQIvaeom5Qw==
X-Proofpoint-ORIG-GUID: 7G8ht6ryT6xZY-ITCEyahsPKCD6PK1SR
X-Authority-Analysis: v=2.4 cv=TJZ1jVla c=1 sm=1 tr=0 ts=6a0463df cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=hS7WgQE5nrJr_MMTOVAA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 7G8ht6ryT6xZY-ITCEyahsPKCD6PK1SR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130122
X-Rspamd-Queue-Id: 61EE0532737
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107267-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linaro.org,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 02:22:59AM +0530, Akhil P Oommen wrote:
> When separate_gpu_kms=1 (or the device is compatible with "amd,imageon"),
> msm_gpu_no_components() evaluates true and adreno_probe() bypasses the
> component framework by calling msm_gpu_probe() directly. In this case,
> we skip creating components and directly bind the GPU.
> 
> That shortcut makes it impossible to add a second sibling on the GPU
> master without introducing ad-hoc plumbing. To prepare for adding the
> GMU as a peer component on this master, turn the GPU pdev into both a
> component master and the sole component of itself in this path. A follow
> up patch will introduce GMU as a component device.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 20 ++++++++++++-----
>  drivers/gpu/drm/msm/msm_drv.c              | 35 +++++++++++++++++++++++++-----
>  drivers/gpu/drm/msm/msm_drv.h              |  6 ++---
>  3 files changed, 45 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index 66953e551d86..67686424f3a1 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -271,18 +271,26 @@ static const struct component_ops a3xx_ops = {
>  
>  static int adreno_probe(struct platform_device *pdev)
>  {
> -	if (msm_gpu_use_separate_drm_dev(pdev))
> -		return msm_gpu_probe(pdev, &a3xx_ops);
> +	int ret;
>  
> -	return component_add(&pdev->dev, &a3xx_ops);
> +	if (msm_gpu_use_separate_drm_dev(pdev)) {
> +		ret = msm_gpu_probe(pdev);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = component_add(&pdev->dev, &a3xx_ops);
> +	if (ret && msm_gpu_use_separate_drm_dev(pdev))
> +		msm_gpu_remove(pdev);

What about making it more clear:

	if (!msm_gpu_use_separate_drm_dev(pdev))
		return component_add(&pdev->dev, &a3xx_ops);

	ret = msm_gpu_probe(pdev);
	if (ret)
		return ret;

	ret = component_add(&pdev->dev, &a3xx_ops);

	if (ret)
		msm_gpu_remove(pdev);

	return ret;

However with this patch in place, maybe it's easier to use the main
msm_drv_probe()? It would need some fixes to handle !kms case as the
GPU-only, but it looks very similar to your new functions.


> +
> +	return ret;
>  }
>  
>  static void adreno_remove(struct platform_device *pdev)
>  {
> +	component_del(&pdev->dev, &a3xx_ops);
>  	if (msm_gpu_use_separate_drm_dev(pdev))
> -		msm_gpu_remove(pdev, &a3xx_ops);
> -	else
> -		component_del(&pdev->dev, &a3xx_ops);
> +		msm_gpu_remove(pdev);
>  }
>  
>  static void adreno_shutdown(struct platform_device *pdev)
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index b61deafd02c3..af5aa7ff6179 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -1097,10 +1097,25 @@ int msm_drv_probe(struct device *master_dev,
>  	return 0;
>  }
>  
> -int msm_gpu_probe(struct platform_device *pdev,
> -		  const struct component_ops *ops)
> +static int msm_gpu_drm_bind(struct device *dev)
> +{
> +	return msm_drm_init(dev, &msm_gpu_driver, NULL);

With this patch in place, we can remove the ops argument from
msm_drm_init() and msm_drm_uninit().

> +}
> +
> +static void msm_gpu_drm_unbind(struct device *dev)
> +{
> +	msm_drm_uninit(dev, NULL);
> +}
> +
> +static const struct component_master_ops msm_gpu_drm_ops = {
> +	.bind = msm_gpu_drm_bind,
> +	.unbind = msm_gpu_drm_unbind,
> +};
> +
> +int msm_gpu_probe(struct platform_device *pdev)
>  {
>  	struct msm_drm_private *priv;
> +	struct component_match *match = NULL;
>  	int ret;
>  
>  	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> @@ -1116,13 +1131,21 @@ int msm_gpu_probe(struct platform_device *pdev,
>  	if (ret)
>  		return ret;
>  
> -	return msm_drm_init(&pdev->dev, &msm_gpu_driver, ops);
> +	/*
> +	 * The GPU pdev acts as both the component master and the sole
> +	 * component (added by adreno_probe()). Future patches add the
> +	 * GMU node as a second component on this same master.
> +	 */
> +	drm_of_component_match_add(&pdev->dev, &match,
> +				   component_compare_of, pdev->dev.of_node);
> +
> +	return component_master_add_with_match(&pdev->dev, &msm_gpu_drm_ops,
> +					       match);
>  }
>  
> -void msm_gpu_remove(struct platform_device *pdev,
> -		    const struct component_ops *ops)
> +void msm_gpu_remove(struct platform_device *pdev)
>  {
> -	msm_drm_uninit(&pdev->dev, ops);
> +	component_master_del(&pdev->dev, &msm_gpu_drm_ops);
>  }
>  
>  static int __init msm_drm_register(void)
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index 6fcb696ceb7c..6264ff27496f 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -544,10 +544,8 @@ extern const struct component_master_ops msm_drm_ops;
>  int msm_kms_pm_prepare(struct device *dev);
>  void msm_kms_pm_complete(struct device *dev);
>  
> -int msm_gpu_probe(struct platform_device *pdev,
> -		  const struct component_ops *ops);
> -void msm_gpu_remove(struct platform_device *pdev,
> -		    const struct component_ops *ops);
> +int msm_gpu_probe(struct platform_device *pdev);
> +void msm_gpu_remove(struct platform_device *pdev);
>  int msm_drv_probe(struct device *dev,
>  	int (*kms_init)(struct drm_device *dev),
>  	struct msm_kms *kms);
> 
> -- 
> 2.51.0
> 

-- 
With best wishes
Dmitry

