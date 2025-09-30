Return-Path: <linux-arm-msm+bounces-75559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B376BABBA5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 09:04:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BB2E47A7B08
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 07:02:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43B5127875C;
	Tue, 30 Sep 2025 07:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pazFXeSC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4022367CF
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 07:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759215844; cv=none; b=p+9bFXjMbleGPYfsTNS4Byr1tfXuyamvOWRnPB5YQ316grH3ZR9dfj5KZtwJsX1RuxQw5/9nLhQW0bL+TnirnsU7KytaZc5bpd5Adhv6jb+bM91tGRTY7x/uUY5ipTqlYDlphUxmvssdJE/VJHDsAkL6zCA96jCov5Wch8Ag568=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759215844; c=relaxed/simple;
	bh=U7r5lXTdsw9Eas2iK8J9LazmFVQXR2IcunJ0KlLWvAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=evW+6h6S/mMjQF5ZYZzCi1EbBBqKpxrkck1f8SIQeEX8KhrvgbL441AoKwajDdfevG10zooKc7ckHpjsvMn/FE53wjaIsZcqiLgS7ekcV7k5+YNQMFMx5XmXMNfHSir06j+JAPK5x1n9qi8NSE8jNUIZxCxQCZIp3V4XLw4fs1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pazFXeSC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4HUjD027451
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 07:04:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tnz5TqBen53zV+5c0hfw9xo0
	Ki5Ws5bufZFZJ5eyQqk=; b=pazFXeSCg6o5laK+b1VdfeBi/n+XWo/NDACcUXTe
	UThRpLJb+Di/Os6lyIJ2n2gB5DCHAf9Y9P4MKFydgDKh6p9L1lChuHqP7i6IKcZy
	ffNiiibIpJwhES1cDQkWs27bxgAwDm64aK/C87iSuqxqkx1hrN1glNoHKpIx+1pT
	12MUrxNMPV7xJf3dntnWub2mC1b65RUpB7Che2v89b96bVzQ0wTJd4L3yI0NkPbz
	1rt+1z5xtboyQ05MHbJ7hDBUds1Tfe5NjHwoS2//qqZ3+C9CySiLf3PNw7+9e5Yp
	jgJqQCm+uRBwMET1BkMmb7wAzbWV92jcVZotc1l0Gif/jA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e851fwe7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 07:04:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4dfe8dafd18so92535381cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 00:04:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759215841; x=1759820641;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tnz5TqBen53zV+5c0hfw9xo0Ki5Ws5bufZFZJ5eyQqk=;
        b=eNyiPQwcN4sRvsRMOAptQf1O13/bROHtz9TJNi6GdDHFksv31G9/+AycBzdhA9+Dsy
         57f0URneTcIG7rky+8apb6e4aepi0hCsZys8wWvtuObHQxvpUUoIdO8uzSNiEqwWnZCR
         dj4MYqPfRJSbq/2wqQzfFwzbgatGyGxjKexY9Q+e7xrA0qhDnorGe5Xpb3tm100cwKVW
         IifF7IBUK5N3iRao7l05c/unxnewXf3AMK0XARZ1AxCvcRUdku5mfkIAZT24c14pUJJQ
         R/nuIKaL3p3PXw51KTnHCnMmW12wBOqMCzQ7af2HqpZx9FUF3n/1Qq8hvTDVLy/BbuSN
         EeAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiSHbkbnDoEPiOPtShkvR6iXNThbyX/IBFMBNSgUjZ76fvlLj0tzKYJh6vziv2H4CHkKHy6kN8H55MB01x@vger.kernel.org
X-Gm-Message-State: AOJu0YzFpl6j69g/y/b+t1IMZy5YRT8yeXsC6G00xlSv08P2QX5SHD1p
	aEhjYF7yrjQI+CBlkdewOQ2YVxokORegQrWqOY6eQ/BPNRmZg8Cx4KDgXe//1mCsr5HNvNH8xEy
	qq3RZvblWriLBYk8p1d5zM4naItOzEFv7A4ksxZv2sdaHEEQ5YdglJiRfiWHuYgY96hjI
X-Gm-Gg: ASbGncu7+XGWeQSNErdiK12LdU9l3AdqsthCIqgd+rg3iiV6n4NH1gGBqLOjU8LcyF3
	cFp7pYFPsjTk1XnKInaGex/aMGrA/ItdRCA9paRSrt0l5jfoN3U1UVfzfmAvcHJqCo2dzVu0eyK
	BDeG2F+Ab1PZhVCQftnBcmWvKVBL8t9VuI7MeRnTpbcAxtqTyzAhsGF6ijQjPDPFrtCsCARhBMg
	Tb9YzoJFKWXpbbfKQthqPZpBf5mpkf86NOVKEY/DF/p5TfF4iEazAaVY+p7C0YpS1eO5D62vtUe
	QR+wlEQZ4HUp8CkfInNMwPPNOnjCM7aJe7cqoX+xqprImW15FBQ/+XlAqb1inWo4p4x84OSlIst
	6nG04pI0doU9BdEaPPZ/P7+m3CAuhtt/BtMZ77ruAyyUQLIKxJNGG7gKJHA==
X-Received: by 2002:a05:622a:560c:b0:4db:b5f1:84a5 with SMTP id d75a77b69052e-4dbb5f18dbfmr197540061cf.57.1759215840528;
        Tue, 30 Sep 2025 00:04:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEB+47pVViAKJXbEvOe8O+nb1gHysifWQJ8Ow1s0HmR2oz9c6rHltLPTDn+bK5bbHz5yEbEhg==
X-Received: by 2002:a05:622a:560c:b0:4db:b5f1:84a5 with SMTP id d75a77b69052e-4dbb5f18dbfmr197539681cf.57.1759215840076;
        Tue, 30 Sep 2025 00:04:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583139f990asm4623729e87.38.2025.09.30.00.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 00:03:59 -0700 (PDT)
Date: Tue, 30 Sep 2025 10:03:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
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
Subject: Re: [PATCH 02/17] drm/msm/a6xx: Fix the gemnoc workaround
Message-ID: <7gjolux5eowgpbptxdnuys2fgzkz3we6hznldrmfwrkpym2gwl@e4e2tpiinyb4>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-2-73530b0700ed@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-kaana-gpu-support-v1-2-73530b0700ed@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=OJoqHCaB c=1 sm=1 tr=0 ts=68db80e2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=EdiAtJSrrEaB_zXPBFQA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMiBTYWx0ZWRfXxbrIX2tqi2rz
 AhSmXYsiZ1E7yMMNQPnDZ0pOfhuRdrYLM4pVZWnefHqZ6o/Eqr2tYJXAf1fhBjvCTRoSWX/7S2r
 mOOSS8FRkV8NPfo3LjXkOH7T5U/e5IQk6p/zMySav1AB85WH0dlrgnhKINjFCpC07cd6qA3PbEm
 3pind5YHjsZ1zAOB76W6UDuszdKjZCdPpe0Dc6xDZ9/8gdTujud0VFApH3P/XfAZbDhg6XE1C6v
 Tiwj1L4PE6vtcOFDoigvCXn+Fdwoc3aU9Tod8hGvl9ttHb0ykV+PHmRcz4kKFFnkn5vyEIa/Nv/
 u8NeWkMIFolOsQ/o7Dk3ZpI6zrd74O9v+OS6j47E002cmvsaszSAfJylARdfu0ORPZZ08lIHEIy
 mE6xsJLnNJCErnWgAhCeWxBiaJLmTQ==
X-Proofpoint-ORIG-GUID: WWRnjN2ytKdC5VlHs7TsAlyl6kqCRfFT
X-Proofpoint-GUID: WWRnjN2ytKdC5VlHs7TsAlyl6kqCRfFT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270032

On Tue, Sep 30, 2025 at 11:18:07AM +0530, Akhil P Oommen wrote:
> Correct the register offset and enable this workaround for all A7x
> and newer GPUs to match downstream. Also, downstream does this w/a after
> moving the fence to allow mode. So do the same.

Please adopt the 'why' style of commit messages. Describe the issue,
then describe what needs to be done.

> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index fc62fef2fed87f065cb8fa4e997abefe4ff11cd5..e22106cafc394ef85f060e4f70596e55c3ec39a4 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -485,8 +485,9 @@ static void a6xx_gemnoc_workaround(struct a6xx_gmu *gmu)
>  	 * in the power down sequence not being fully executed. That in turn can
>  	 * prevent CX_GDSC from collapsing. Assert Qactive to avoid this.
>  	 */
> -	if (adreno_is_a621(adreno_gpu) || adreno_is_7c3(adreno_gpu))
> -		gmu_write(gmu, REG_A6XX_GMU_AO_AHB_FENCE_CTRL, BIT(0));
> +	if (adreno_is_a7xx(adreno_gpu) || (adreno_is_a621(adreno_gpu) ||
> +				adreno_is_7c3(adreno_gpu)))
> +		gmu_write(gmu, REG_A6XX_GPU_GMU_CX_GMU_CX_FALNEXT_INTF, BIT(0));
>  }
>  
>  /* Let the GMU know that we are about to go into slumber */
> @@ -522,10 +523,9 @@ static int a6xx_gmu_notify_slumber(struct a6xx_gmu *gmu)
>  	}
>  
>  out:
> -	a6xx_gemnoc_workaround(gmu);
> -
>  	/* Put fence into allow mode */
>  	gmu_write(gmu, REG_A6XX_GMU_AO_AHB_FENCE_CTRL, 0);
> +	a6xx_gemnoc_workaround(gmu);
>  	return ret;
>  }
>  
> 
> -- 
> 2.51.0
> 

-- 
With best wishes
Dmitry

