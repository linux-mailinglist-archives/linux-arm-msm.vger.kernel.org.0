Return-Path: <linux-arm-msm+bounces-85283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6927CCBFD26
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 21:49:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A82E3028D9B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 20:48:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1206A327206;
	Mon, 15 Dec 2025 20:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mVIB/ia/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QlUcoaoV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1C42D877B
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 20:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765831720; cv=none; b=IvxkQgW43uzr1ogqy6QrYQGwhTdVblDSDDPJ0A+tC7cmIZxWqcEO7pvxiZuHOys9c/H3PInFfvXeGTABTLkzmjOJeGoiJuQGJXRC3joEvkfd6mjyt8FNMCLtiW3YcWlh3xcSvXYFJNnUDGDlCWdUSy0HupW+kByMhWy3TJTxlfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765831720; c=relaxed/simple;
	bh=8jdI9Or7M7mfu/EWodx4eqnaqhqfRIv7PDDpLdyztBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H8dcXl9189Oh4/fj9YmhPvzaYkLz5oUJBWNpPSZf9kB9U7Zhl8tA47UDlEd7LNAoYnIJspVUWi7H5dKK9+KXnK0YlGIbIkaAm2ynHxCprsPrxg0S1MWIVEndfb0DQTGRDBTwnynj0nuYYnGiCXPUZRQ1wwnMzJGLhmaMf8DVtO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mVIB/ia/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QlUcoaoV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BFI0DYI1682204
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 20:48:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5pki75WPCYaCGC32sVPKpS6f
	I/bdegMiprelgAi5BB8=; b=mVIB/ia/kCldiJCOFdtrqEX8ET1h29tPZY/1LXy8
	4JpU7W5CxK7bpSMjdxiN853d5HA3oj13c+QnU8zcg0clU8Rr+chRIVKYRdB3Ny7b
	ceNarShcH4Jtdh5deNfnN5SFH54ErI7yrdWZaud8JRipqx0cgxBdCB4BljSQbPQb
	M0nH0N/ccvFiCRhwBEE1823BnTfTIAr/9576ZN9IyK+M8Nbw6+HfxSIethdj92SP
	hq++FHIoHvc10yIAxAonWwkGYfT5NCBsEbeHJq5a+DK09UmC5u1WV7ARgk/OSa23
	djsE629VE5UT3ekub+jP0+XdnOAUbvpK5evOKtY1L9KmNQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2q7tgda3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 20:48:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b8738fb141so868629885a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 12:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765831715; x=1766436515; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5pki75WPCYaCGC32sVPKpS6fI/bdegMiprelgAi5BB8=;
        b=QlUcoaoVN0dMqA19nL3q4KIOI4Ib8eNoVfTgGrekR0ib2bAgV6Z/cd/s9frpSDiR3z
         tR2/DkVbycXiKYkvnUNTSkXs53M7dSUxilkGnv4XeJiouvWosyeRZ1C1E/hXBOcypTSf
         SIznpoR1VrOXAFbvaDnSC53cJomQm83NgBNMYcdkTAb5ggTyf36dU6aSTKlSIgAc+q/j
         B0ybazk55hwnAamrcrhgMQm20pNr4isy2lQMxqmVsoys2b2xHr3Yl+cwWrseNJD/jtmJ
         /tlhJXJKF8uUtsz4xY9Ap+LeXFv+8/DYxo0IEvVz/eikmAX4wsDFwNp4m6D7EP4gjAV0
         Y9FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765831715; x=1766436515;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5pki75WPCYaCGC32sVPKpS6fI/bdegMiprelgAi5BB8=;
        b=IKh40n1jpSyifgFzvc15xkNvg7cdLmSofUlczjDR+NDBO8EHdb6iaDdT1MT9ZrBtFk
         V7R9TBai0xWpxkCEQ7pdTL/wiocrc6gJHNlG6GpiiD25fkI5R/wqk39VydqUaqTGk10B
         +rkEvxjmh09hsmNKACy2Cptq9PMgX4dFjL0KsSPnZ1VQbZ09tRjSqOOfKUNPJEh7QMHN
         sB1WPjaWVh158VwbrQG/uJilkTSppA3itPRBi/7+4OfkF00b3g5omsUdL2Ndkw7AkOJd
         RR2FAfjTBcUOVggSh/00DJ7oKg7F41zsAMgC6ab11vT0yY8S0Dle8Nald3IUV5hqn6tr
         GOjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuBLz0zOG6xf10w4T6RYirJKf7TIeDzwyXP9x0I6zwraa1Ul5z7JJFgaISatrWru2n2eHcYxVzh3hn2o+r@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/BIAr3K/Hu7lpcU3pFxHqtBG2zoqG0XVLOfKTQPROy86qhNWm
	3rAqE0IjWDsASjOwc4nwFwT3hehBvPq/aR+eax0yLctk6wlQm1KmnQAcw31RQ4p7+sBGYuvr0/q
	K6++R9Cb2qia2DYbm2cqP/z+e9Z6f+TthfjrZMt29bWkeUvmxGXLsC4AOLatb0LeUMx10
X-Gm-Gg: AY/fxX5+RS2pmcf0Q6dRNXgY5cphCi1OWOCFnu2Tpt7as2dr+c0tuAe0EyALdg7wJGE
	Tf7+6tclvryMiNlpNsuEsmszOZbBXcWI4RPjhUD8uTJ2AUHcHT3tUxnTb38NUkJ/ryXvESAPzLS
	qyuwap5TCfXoIfpJTn5udX++W812ENWGm28qfONbaw4lvj6Ia7EPZOaiE5h1Crwz3ni7IZbwSs5
	rXd/6AWTtIYk0SIn6tJYDzJxa4HTy3UkcpzTV7UibCpP8ZF4YcEd8TycCG0GO3cY3gDEhS7dAXH
	xUYWqrFke1/glm2bURZ1Lw1rJHypnqS1WCIO5qAaERgvEI2lvNIdlLbga3d/b+sAjuPAdfhYeIC
	Qn/CxS1yDK8KIt4a27m7WgKfa/nGP6F9GG8AScIfFLNnbovKxPL7IBiARv20bE/cWgkEqwhDE7m
	l7FMl3ExJv+4bnz8z2LW3LhNs=
X-Received: by 2002:a05:622a:2c3:b0:4ef:bed6:5347 with SMTP id d75a77b69052e-4f1bfc527c9mr243417331cf.30.1765831715206;
        Mon, 15 Dec 2025 12:48:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHmN/KDpj3W3F4CvCXgAdna9To5O6vhU/HOdmJWgcrxO14nwGW/q0vweBv6qM8C0DSy566hBA==
X-Received: by 2002:a05:622a:2c3:b0:4ef:bed6:5347 with SMTP id d75a77b69052e-4f1bfc527c9mr243416891cf.30.1765831714718;
        Mon, 15 Dec 2025 12:48:34 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5990da5dc5asm131302e87.77.2025.12.15.12.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 12:48:32 -0800 (PST)
Date: Mon, 15 Dec 2025 22:48:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        "open list:DRM DRIVER for Qualcomm display hardware" <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER for Qualcomm display hardware" <dri-devel@lists.freedesktop.org>,
        "open list:DRM DRIVER for Qualcomm display hardware" <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>, skhan@linuxfoundation.org,
        david.hunter.linux@gmail.com
Subject: Re: [PATCH] drm/msm: Replace custom dumb_map_offset with generic
 helper
Message-ID: <cv4we57zxltpys6qf43nxldwwogjwxyglp2hj3ld6talvlteqp@dsen5g3v24t7>
References: <20251215022850.12358-1-swarajgaikwad1925@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215022850.12358-1-swarajgaikwad1925@gmail.com>
X-Proofpoint-GUID: WJmNwdLmO9-jeYcdy_YxT7X3IsKH0J7M
X-Proofpoint-ORIG-GUID: WJmNwdLmO9-jeYcdy_YxT7X3IsKH0J7M
X-Authority-Analysis: v=2.4 cv=Qo1THFyd c=1 sm=1 tr=0 ts=69407423 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=26i9lwY6jznW_AXw1HAA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDE3OSBTYWx0ZWRfX8YDOmwIx+THI
 HAGsgvpRQtll//bTInsxlRxfitDIRyf7+1Rt7Lq465OSLtJh5vdT1jmrpKevKn684sp6NslM2di
 XrHuV8KSWNei0JCeVo7PBW5Wsu+Fkzm4XdOkd28k4HdmCYN1LEftyS0xHIcBVE+nK5V0p6Ri2S8
 K3fNWzTdoKML+LcWXoSzyFDL3fpx64hgKFJIHv1bLUVUWVfmzG9NNuZfq5p6urH76tSUH6KkthH
 0g9RA/izEq0ezoc/Ry/0juuhDdQa0tyV/axxstjj3/3IIbIE3CwmYbUTPcs5Ucn4r6Saa0mjMAA
 xSuCISTFmYAcuAm7BQ36nai26eXpCuPCgU79Pd8BeJkzE+vnHSoGf8XHE7Jg/ovDjEt1LAOu+Az
 5G9gZ/2GlG0lbdA69v056ttg6pScDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_05,2025-12-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512150179

On Mon, Dec 15, 2025 at 02:28:50AM +0000, Swaraj Gaikwad wrote:
> The msm driver implements a custom dumb_map_offset callback. This
> implementation acquires the msm_gem_lock, but the underlying
> drm_gem_create_mmap_offset() function is already thread-safe regarding
> the VMA offset manager (it acquires the mgr->vm_lock internally).

Other pieces are using msm_gem_lock() / msm_gem_unlock(), which
translates to dma_resv_lock() / dma_resv_unlock(), so you need to
describe, why it's still safe wrt. that code.

> 
> Switching to the generic drm_gem_dumb_map_offset() helper provides
> several benefits:
> 1. Removes the unnecessary locking overhead (locking leftovers).
> 2. Adds a missing check to reject mapping of imported objects, which is
>    invalid for dumb buffers.
> 3. Allows for the removal of the msm_gem_dumb_map_offset() wrapper and
>    the msm_gem_mmap_offset() helper function.
> 
> The logic from msm_gem_mmap_offset() has been inlined into
> msm_ioctl_gem_info() to maintain functionality without the separate
> helper.
> 
> This addresses the TODO:
> "Documentation/gpu/todo.rst: Remove custom dumb_map_offset implementations"
> 
> Signed-off-by: Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
> ---
> 
>  Compile-tested only.
> 

-- 
With best wishes
Dmitry

