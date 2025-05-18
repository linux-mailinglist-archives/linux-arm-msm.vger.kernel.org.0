Return-Path: <linux-arm-msm+bounces-58352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD7EABB241
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 00:42:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78D9C188EC08
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 22:42:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C33A10785;
	Sun, 18 May 2025 22:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ojyabReD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD451B4121
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 22:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747608126; cv=none; b=NpiAO0B4gCvJaUAwBI9yBiMgUnXBWXmCy5AQrSUjTr2C7yA41cA/k/HqE08zjCr2RuvNmMOaiwZ71vOaoD5ov3uhS0Gky0agL7PS7pq7UjizSQqFGBquAEw/1eZ7OcVQQk+Zm8L/YD//IGrXuM0q918wW4SF713G7L1mJj3KvZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747608126; c=relaxed/simple;
	bh=2WQfpB8+kAsksZzSScMuaHp9RFtdywGK7Cm9Y87Kojo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uF//naWesxETbznrWlC/AH6CqOBZnHA2T7KjKwXBpx2DYjTVzU9R6FJs46ZiUXoXoUCwF+w7kOR1ciEHlAEmrC9KVsHZcms1qfeha6webpNtXj32BhZgCGonM98YaedcQYMgcfRRYaj+cZUoyJdG5Fcy6pJCINDvP5dGZTs08Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ojyabReD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54ILDCk2013180
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 22:42:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eaaSG9X5R3zIXOMoXuwdOluz
	DMWxOT1zmAnsMUlIPK4=; b=ojyabReDz3msRcARrQsFfnmzGguOU5i+5g43ZX8X
	7PIkyxCmmo4YUgTtsO6tLHRB636hvU2k+gBuuHEwxfH/+o86Wd9IFEk7krOtjhWK
	GklC2yfmz60LYOfstDEkVt/0dowcSP2rgtwbGSRHsPWkXxcxa4/Kqyis6ZYMgYwM
	vN3TNYgoNOuPmTnIzgxS6IlWBi57RMTwsI0bJfNbD1hY744cthmtI78q3HR9EzQh
	1THujfsWDyapZgK+f9mQNZndNOnbOtuh8onZz9MA50ZoOjpiX2UetHybj01/+5mJ
	YhGRMxHPYyhE2LG8GQFNmjQ2FTSZoijD+Jdh5ZFzejJJWA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjp32hcv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 22:42:04 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f8bdefcb39so36656636d6.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 15:42:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747608123; x=1748212923;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eaaSG9X5R3zIXOMoXuwdOluzDMWxOT1zmAnsMUlIPK4=;
        b=NtP60FRn5FujH7HhPgaO/0ABG/T7R1ScYfdhyTMEW0OIRsGsrM3zTZs9OPCZxG+YFn
         nBpb6dGD7n1Eb+V3QkKI4PkraODZ1vnbMHyMD2v8u7xkHl56tdsIxjlw5OHGO7qr+7km
         a1641zQDkeY24ifURRjbislJ3cuiGmdlGxxuQZq1+0Znt/5sd+4+sUdDdzqVpmmmTHvM
         8DPNkGY6fUvwf+7KpCc7SwgZ0/c/YUgEWXkdpBL+yxCS5B4G16/A6lo7JiAVSgaFJd1r
         Nu6uSyq9kCX3tIe00q0ifPv38f//kOABNYtYG2lGGrRp79Ksf9kkuQoS2DSrCtnKIuTU
         FX9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVujGrj4YfkHaCdNAfBOl0zbWQxq67+n5OdgQ7CU57tt3NfOGZoQIrznbpbhNFVu2ML+ebakjAkIa9AoUgV@vger.kernel.org
X-Gm-Message-State: AOJu0YyM9NZPr/qVDknAdCqxvbl+oiwGxhKFgO/75bMVWBFjyl4eOiZ8
	nVNJorOc34GllzMNOf0R8yeg1mVrne3NdT7B/ki07gRTAlUF7Lq8a9pLmByTnnmSwGLxwQIzvq5
	fel3k4lzmgewWZtVaKtJuHfTzrKkK6I6PuToSZY5UrWNYWW9/ztuXrKwg9aLvcELkvFLK
X-Gm-Gg: ASbGnctog25Y6FtgZVsWCRToG0O6Mx/veh03YK5Btgxpl3fqJLdHwkYUGijBsqkfFHv
	pjQnsnN++y84/uVf98P0F64G6DX9SIrCG1hkUDWoL0d3VdZje4GwaidQj3OCseuGsUm5KZblO1L
	Aofa0HlCwA2azus60Lts3ehNmoDMHG4wyjpFwKLED+blw63Q5xgt5kwbtGlrH4sFznRmDh61Veh
	jBx7UeTw3zvo7OVZ/qWtP0ix3G70o1yM5hhttntbdicav8qoe0TmHevalnGNMWPBc8OPktdy/ZT
	ozIEvPCLnTzXskE23JBAMbrpAUq8Gedn1CCzrbPTqiyWaMcXu0DTL7DYbkJO3Ya6KVhAX+Ag0vA
	=
X-Received: by 2002:a05:6214:262e:b0:6f8:da7b:9d2f with SMTP id 6a1803df08f44-6f8da7b9fe4mr15487736d6.20.1747608122813;
        Sun, 18 May 2025 15:42:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUjV8M+Fj2g9HbnyHkTiE/hYtX208dk0WrYDuNrnpAxFDjqyRvu9ixEuA8DIi/pbCTpIxB7w==
X-Received: by 2002:a05:6214:262e:b0:6f8:da7b:9d2f with SMTP id 6a1803df08f44-6f8da7b9fe4mr15487566d6.20.1747608122476;
        Sun, 18 May 2025 15:42:02 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3280ca53e2esm15185761fa.89.2025.05.18.15.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 15:42:00 -0700 (PDT)
Date: Mon, 19 May 2025 01:41:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] regulator: qcom_spmi: Constify struct spmi_voltage_range
Message-ID: <pxm4kekb573zz2cdjgjn5rxlr2ipneaoxlqzwkcwhctqnqm45h@pdgediy3o7tg>
References: <ef2a4b6df61e19470ddf6cbd1f3ca1ce88a3c1a0.1747570556.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef2a4b6df61e19470ddf6cbd1f3ca1ce88a3c1a0.1747570556.git.christophe.jaillet@wanadoo.fr>
X-Authority-Analysis: v=2.4 cv=B8u50PtM c=1 sm=1 tr=0 ts=682a623c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=gpGGzw82cXZ8HdMEZUsA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: mMWduXWy4GySPqEc2reWD0Zf318ouSn5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDIyNCBTYWx0ZWRfX+ZKvpZaKHdPd
 H4QDH2KAsBDG4pngYNwOsq2XJeAtggBLD+3yTLa0hFz8b4n4HW1/B0+D48uJtXCY5cnlEcOJfCM
 BH/pM4gUKLS5UTC1JwHADRmnOQzESHGxNyUHCjYCYc07CjypIq2Zxtr6AWwrjrlBAbKcHYCOwFt
 wZ3O0csAAm8XknYLrEeydmtQ8liquuy/5FBUpS/joHpY01//tSiJKGx7mnchewkg//rVTp5kGKh
 1PUTcNvkpgu3iKpb8Ea/RI5EZUxGYbuSClWeUatln7MOqfG8EfEZnf2qIfwPOsefz0I6qUfHDMs
 UmNn3wIYHUEJvStgDe9YMxiwXIjUTibrg8tT9GF9cnU3+2DX4dit2jlJh3+Pk1kRj3im87il/T/
 m2QHUuqNbCqLKdLIMye5dp7tOIW2J/ztlondlFLC/QWWica+S1KtH2RaW96+PgPf1JfFBrUL
X-Proofpoint-GUID: mMWduXWy4GySPqEc2reWD0Zf318ouSn5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_11,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999 lowpriorityscore=0
 mlxscore=0 suspectscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180224

On Sun, May 18, 2025 at 02:16:21PM +0200, Christophe JAILLET wrote:
> 'struct spmi_voltage_range' are only modified at runtime to compile a
> field, n_voltages, that could be computed at compile time.
> 
> So, simplify spmi_calculate_num_voltages() and compute n_voltages at
> compile time within the SPMI_VOLTAGE_RANGE macro.
> 
> Constifying these structures moves some data to a read-only section, so
> increase overall security.
> 
> On a x86_64, with allmodconfig:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>   85437	  26776	    512	 112725	  1b855	drivers/regulator/qcom_spmi-regulator.o
> 
> After:
> =====
>    text	   data	    bss	    dec	    hex	filename
>   86857	  24760	    512	 112129	  1b601	drivers/regulator/qcom_spmi-regulator.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested-only.
> 
> I've also checked in the .s file that n_voltages was set initialized with
> the correct value.
> ---
>  drivers/regulator/qcom_spmi-regulator.c | 69 ++++++++++++-------------
>  1 file changed, 32 insertions(+), 37 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

