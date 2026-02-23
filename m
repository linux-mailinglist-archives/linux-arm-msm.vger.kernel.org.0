Return-Path: <linux-arm-msm+bounces-93850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kH2+M8fjnGn4LwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 00:33:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CAD17F917
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 00:33:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D86DC30000BD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 23:33:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9C1634CFBA;
	Mon, 23 Feb 2026 23:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cN8RJqsz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CJ3dqWkn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8604134AB01
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 23:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771889604; cv=none; b=GNH2Q2yWpXioa3/yVq5tS5X+RJy87Z363z/j5OqDbkF9aM9v9f+XbENHTG5Barl+y7KIDxnkBX8a9zjL+wXiHlRm65mA3tMjAIp8RM2DTUgn6JNEeNS1SCjjcCpy0FFVaIMieJhaymshzJyFtAR9bv3tW0XzGrf9V7nCWGDnjYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771889604; c=relaxed/simple;
	bh=S9B0zGS5tGyITzgCtwm552xX1CH1pBBnL0nY+GO3AVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QG6/EMzcHGzepdIqzVit5kK1YQ+FXhomCHqbrQOXSiXQKbAmShHqPGixU4/aT1C9deRBnRb1deaIJy01P6y9RPRoxW8Tykit3WaAsd3wDFxiGZ18FQ02Chon6WMsArezhQRM1gnmQInc0xEjbg9MH7YyyzQUiR6Guq5VsqgnVdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cN8RJqsz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CJ3dqWkn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NFVcKO1200431
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 23:33:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xEZRaWaTYLmfpgMyGlakvruL
	p3dxSVDm+gJQSXU8gwg=; b=cN8RJqszRqybxYKAhu3zPVhqw/RSlOZK3MOiyPaR
	n8FNsXTpTOeH8DFgE/CSATNS7Dp63+J3xnlOc5jVpCu8l0i6aBO+9UP3lG8djhZl
	0QAe8X7muxbOM7SluzWZyIOiu2Z1Eo+Bwt4w2dcwCcjxyE+RAibBeIFY/OiJffgj
	1pXEfOficE1oMwVh6C2WKufbkmAqA3Iv3+0fVqsSKDPO8aJdbdPC3DORNt59YSh0
	g4AbkypOHYrhwBgNvX/bqP9eNgq57BdgEXFaAVIT8LbMWBF1KtI3zffy9wnWDw4G
	GKtnWMPjzut45ID61nDr0FiiBC2+s3lx/1JMpfenOXnzyg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8ra76v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 23:33:22 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-506a07740bdso521999281cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 15:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771889602; x=1772494402; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xEZRaWaTYLmfpgMyGlakvruLp3dxSVDm+gJQSXU8gwg=;
        b=CJ3dqWknSCvCgM6IgpUIioAZ8DNbiQMDtGvPSc1akb/YV2T8IixwypE0P21MPm31UU
         2lJ9Tm9gIV3rWa7W34FmJHF/NxMXibATp1IyVRc+J9EjHQ7e8HGs6YpgGbtTI55u+oJ6
         ORgPjdWtQ4vcrN/7cfty198jGuFo4CMmV+2nRRch1wyBAF0CLwV0q+fNagREIw3fZ3hy
         bTYSN3ztECIy4uBTIZdW/wdDjzP0V78NFNYqPGcqKQXvAKDk/0lAJrJ/ZRsbnl4CLVZM
         lrU/h/5HpVPeG63j1vuhLSVUzANWoseijaApa4rU+ZHSDr2m1JWYgZC65f0LeuoGgGOY
         9lhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771889602; x=1772494402;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xEZRaWaTYLmfpgMyGlakvruLp3dxSVDm+gJQSXU8gwg=;
        b=VuxAJSLw4EHCU/GbJwweSare9g1obxGk10bP/BqDbELpZ1Wr7ep/VRW1646Cc/B+ZY
         40SsOL5UntxHJdBJDNt3lY0/b6W3WIxSOvyozWaY7cgPnY+PXmqY84GJQlKwCPk/BsId
         sKUYe2Z4Fe398uWAmBIuJrau82uCFVRXpXxa5dBFzw2lPM3or+8uJgKYCwdDi3yYv7Aj
         nO7bNppPQGZ331kZYK+oIf/HYSNh+AZVSorcD2Wx7XNiZZbGRHTVRPjScgHEouuGmyBv
         nOHSGqTaQd1aax/vBzk2x2fIiy0fCml3XwAwehtwfdeXjm8GrTv+mbqj3Ukp44cmb9eE
         ihsw==
X-Forwarded-Encrypted: i=1; AJvYcCVXAOncPnxRvKi/H3GZvxcIarx23v3h+VZY3gTDU/ABWRMwdt86m2mFT0k6LyoE0RPoUa0DRbf8HK3ShJxG@vger.kernel.org
X-Gm-Message-State: AOJu0YwflJGtPNkw9fVHdOTxFVnkbE+Hnc1/roR3g1vB+4ohh8QwuGK2
	EHejiK321juwz28fTGz/9XDfYHlHpLx+4YUBEv7QbnCP03ZFGeR8wP6SQjGanaANhPSS8xoE2Sz
	QLK7dpYRbPK/+m4h3DOot/p/yO4ghifk4YqQP6oHuuWxyP5qddsy5gcFA+o3gFMNHuxyk
X-Gm-Gg: AZuq6aI2ugYZYX8tZ8ao2AYvSbmN2mLmP5fyTmCUMKmJnn4z0xdQO9pWtKsbZbyCR7j
	12T4euOVBwHp6Q2paVSKVkD9I/vH0KeageNyo1avZ+Tt76SGjn35d7Nkpg9dLCUz2tAVBW06vMK
	xiSMSTPo2/WvBJ0rme/Tnc1M+HOl7knDjiG3bZfCbPqCbiF0Y87C/0XgIp3eiNm4vr5oADNyAID
	dhVc+u2betgYE4zhZemy+FF3+8caFDdsgb4GQ1slaajcdffChAnaBv1LrPFoF6mDLm1FkXm/Ju+
	AuCTymEx+kLYhE6EtfN2GLs2Ib7DZHjUHF2nOtZvsYcxAaZppfhiiajTjMeJ1wv6dkMdPmlYPy8
	JwT3uzCk+566UuRRD5pzycfw68s2s4Bkh8JHMlEglRD/QuY7VmeLlFd/0WwTL3ix68NtpVb0W+J
	wpzBwiFM+IBaEaKBIejRe9gUfQ8ehr5t1+4Bo=
X-Received: by 2002:a05:620a:45ab:b0:8cb:4d64:e993 with SMTP id af79cd13be357-8cb8ca09dd1mr1373764885a.26.1771889601867;
        Mon, 23 Feb 2026 15:33:21 -0800 (PST)
X-Received: by 2002:a05:620a:45ab:b0:8cb:4d64:e993 with SMTP id af79cd13be357-8cb8ca09dd1mr1373760685a.26.1771889601309;
        Mon, 23 Feb 2026 15:33:21 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb47617sm1867293e87.75.2026.02.23.15.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 15:33:20 -0800 (PST)
Date: Tue, 24 Feb 2026 01:33:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Thomas Fourier <fourier.thomas@gmail.com>
Cc: stable@vger.kernel.org, Rob Clark <robin.clark@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] accel/qaic: Fix dma_free_attrs() buffer size
Message-ID: <w537ptifelockziyyn2lufdmkv2puwrwdjnydsyiqn7tuefs3g@lobsudoe33qq>
References: <20260210083529.22059-2-fourier.thomas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210083529.22059-2-fourier.thomas@gmail.com>
X-Proofpoint-ORIG-GUID: qv_H17jkgPU044M9aTACHULv-jdofxYi
X-Authority-Analysis: v=2.4 cv=V7twEOni c=1 sm=1 tr=0 ts=699ce3c2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=h6-xzC9InjtDQXJTJ98A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDIwNSBTYWx0ZWRfXyVqxKR2E0rr4
 KwRS0M66fPGYgav6I2vor81AGals7yy8IeHx0xplaqyoGYw65vZC5RK8+/3Kdg3QSlbdhPJWEey
 9mZ8193wwb5fVziTHdgZ9jaWKFArIbmC6dCAKg4dTUilJMgMNC5K+j2vQO7oMnNRAENWsrfPG3z
 SweeES2FAJAM4T2a7DBqYmldI6RynSlCIHZ4J5p2n67t3AEIQZRvncIszc5AIg12r6eqU8X/kxs
 Ng9wxlrEQi0kK7sWmR3e2ZnXIMD86HBvfZsRc017y6yTsR95G8XorX6CM3XPb/XidMnVgr59khy
 BBQuefOZPnjXSgaZlCf3yf8sH19ED72g2EwmGCVDzi6jSDEj0/1qJmYHw0RAiUcrKZiPcSVroqJ
 o8ycB4CZ7cE1b7BVzjTiG7oEtXs4xkYam818urqsMPQLRoXbWP1GmBGBnsiLUU81X/hIS2bDK/P
 aV/1Z3IsaDiP6q17fUg==
X-Proofpoint-GUID: qv_H17jkgPU044M9aTACHULv-jdofxYi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_05,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230205
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93850-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,marek.ca,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 77CAD17F917
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 09:35:27AM +0100, Thomas Fourier wrote:
> The gpummu->table buffer is alloc'd with size TABLE_SIZE + 32 in
> a2xx_gpummu_new() but freed with size TABLE_SIZE in
> a2xx_gpummu_destroy().
> 
> Change the free size to match the allocation.
> 
> Fixes: c2052a4e5c99 ("drm/msm: implement a2xx mmu")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a2xx_gpummu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Note, your subject is preffix is wrong. Could you please correct it?

> diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpummu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpummu.c
> index 0407c9bc8c1b..4467b04527cd 100644
> --- a/drivers/gpu/drm/msm/adreno/a2xx_gpummu.c
> +++ b/drivers/gpu/drm/msm/adreno/a2xx_gpummu.c
> @@ -78,7 +78,7 @@ static void a2xx_gpummu_destroy(struct msm_mmu *mmu)
>  {
>  	struct a2xx_gpummu *gpummu = to_a2xx_gpummu(mmu);
>  
> -	dma_free_attrs(mmu->dev, TABLE_SIZE, gpummu->table, gpummu->pt_base,
> +	dma_free_attrs(mmu->dev, TABLE_SIZE + 32, gpummu->table, gpummu->pt_base,
>  		DMA_ATTR_FORCE_CONTIGUOUS);
>  
>  	kfree(gpummu);
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

