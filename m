Return-Path: <linux-arm-msm+bounces-107443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qHS9GwDLBGp2OwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:03:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA66A53983E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:03:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1D14430D4D62
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 18:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7267C3A783D;
	Wed, 13 May 2026 18:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fDpH1Urq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bD0z5xAp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2840A3ADB94
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778698524; cv=none; b=URetjxIRUTlivYYgPSo24+MVPsXXgTR0Jdk1v7ponTR8hgi3cKIbBcI71cc3YMCrctxMXB638DRmF2ALL776D0kQz+3y3EYEDHxpXdz4L1HMisQkAQAJYeo5zGAMXHDhX2zly/RNeJ938t6sJRTD5H3UMXUpqogfwY8l5vv7Yy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778698524; c=relaxed/simple;
	bh=0UhnpxfmU/4ytSYRDPmpHzxWeVXnoAQvUtxWmeg3O9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rYSdQ1somw/ayyLHZZHewzvvYJe6NqeA6rOgDQXuiApZPNpUQIas2d/v+vyuMlK5AkYkMnA8y81adeOyJU8X2IWgozyu9KMG0jpW6hiKlJfempHTLunukt+frhMHDydJCKAl6LcjYOvrfuyCmfcw7wHk+35vUKAelKVjKrx8JBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fDpH1Urq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bD0z5xAp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DFdqiU1242893
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:55:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TY3hRC6xWGaXeiOL/4+fJ0R8
	wTbjlVnLAhpgz+1/EcU=; b=fDpH1UrqxCcOyXo+UM8jVH0fDcoUOBhZNwa2eUgK
	NVOtX75KaieBfDLmtmlOeUI1Vgx3hfrddRaSUvJ9vXuYPuqKPQZAZ+vD16rcA0OO
	bylAgDcLYh7BVmizW0XS6K3i5VY/Qs2+WUm5lQm2vIkrR80/eZoScmtXmjmDzcEt
	bdmAMykGRyQwmbY76/P9foqEWZDadogQ5JUcE7uaQP1CzwhxOok+1AgmYMRLZ4is
	z5N34qSlYgTER9AHqpmyCqBdKtGyIrosxjRqvYrbURfR3DF82v9ADsXTeexVmEQG
	KZn8LOvozZsMB3RUXj70+CNX+6Jkelai6jrPum85bdIY1w==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4v4trtu6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:55:22 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-948b41f95deso10501917241.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 11:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778698521; x=1779303321; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TY3hRC6xWGaXeiOL/4+fJ0R8wTbjlVnLAhpgz+1/EcU=;
        b=bD0z5xApaY4IAzvUax+jHtYN+nGzOFxM0kYaLMWjttjiTe0Tl7Y0mRgsN7ZL01izM/
         dK4xNolJanr9oSP9GRZWhO4B2qpmCUBOOfMTrGxMlx5yf8ffsP2zSPm3jFY2EJ+7P3Ym
         kgrc4BGHJSrrzCnyocb4j38QwyWD2Y1iBccPF16eZwp7uJBr8uvY58Lu/6sKV36CFdQW
         VN+1OXXQoxXXI+2HUXwMeEZOpnW7UYXf5cSRaD0zKXuNT6ivBX+VT5z4PBrXqc1NWx9J
         wAoDPOIpyuHEHSD/EiKgESisV+DQdx1ukr03xlSSQt02OwxsjrhnA+RnYHQ4Zs0UDiyc
         63IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778698521; x=1779303321;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TY3hRC6xWGaXeiOL/4+fJ0R8wTbjlVnLAhpgz+1/EcU=;
        b=aOXB9svt7Whpf0Kp79RH6CyhFYXZuVvih+ggJEHVP2W09rS5ogNZH3l2iX67Y1icXe
         zfdrHVtm0F702fb9/3ZSUxER+DPQiwZlaBlBoGTvTSq+rl9groA6HorELj6mahi5soMN
         yMI3bm3EwGxofg2qNaJ38Hw5BQUb5MaEAulcUKGD5XWGLlkN2TC4IXK8vpIXAyZp39gl
         u76S7/8VtPveLeltPFrP0BzV7EF/dOkb/8rv6FknpwCgLvFg1+0UjlpTPvLRLJHDXYgp
         LdxdkSoktS7l68Vq0bi7kez/kkvZRmAlWRcqAvcNnsjlt0eFsv6si8fzb6L2yrfxiHqA
         7eDQ==
X-Forwarded-Encrypted: i=1; AFNElJ+vim3nX13O6jylXzlB7ykELnaW/BtnucTjAtgY0JLZDei6rbfX3DyveQSzRIgFu8fRhP9Tih7SXAcsWPb+@vger.kernel.org
X-Gm-Message-State: AOJu0YwohqcEkrE0SuUzeOOxvfMESogBwl7mC4C73Vq6Al3cU7yX+B//
	s5zQ34pahnBrPI0IVLPgtx00bwco+9FkElLPD5BW40aqwroM1GLW4UPP+nGeO+pDUdoJ8Et8PYt
	MBIYLTH4EAtXI26Inl1mH7Os9lbGvbCZE49dMNmxItVDYzt5I4c+mOoITygzDht8Np2iT
X-Gm-Gg: Acq92OFLhzgJJSMnF/rxzzyTWrhwuUj6cdr0C4ZxgJsQSn0E0TY5mUrkcJvwV4meUW6
	8w+bzfnC8kOC3gpm8GPyBu7ronnLbGcVum21ZCc8t57p8PH/vXhVhEmjF3Ur085ax/OAJDnMfx3
	5rljdi+iYLlZpIChcprPvaH/6P2RirAy2U+Ean0GgwxgAMqBkZd0tY8Ws1mpuADxtoJlzya4Qzv
	SArNVFF4MIbd7P5u655jZdrN/Tsw8l2tN7o1SOwwUrfaKykvyHBK8qPysLnPx8Wvf+1HR+YFB6z
	CM6fxAz5U/5G+rBBzuLwgIkh5OBuWpEKUiNqxJ1ILAp0+Idd7g9Y0aEfVtI15U16U2JyS6iDAgy
	dzv6k3M7iVxgkKhc1JH+N4HGSiWEQItEUg41rtybVBTZJcwI0wpuJEP8T+XkXEREE0nywC2+jbD
	VI3czgnVpYnR7jFAhorQ19rp/UyZhHQHuiEis=
X-Received: by 2002:a05:6102:1512:b0:61a:c2e2:932e with SMTP id ada2fe7eead31-637aaa57d2bmr2368660137.22.1778698521501;
        Wed, 13 May 2026 11:55:21 -0700 (PDT)
X-Received: by 2002:a05:6102:1512:b0:61a:c2e2:932e with SMTP id ada2fe7eead31-637aaa57d2bmr2368637137.22.1778698521073;
        Wed, 13 May 2026 11:55:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a955df99sm4329747e87.45.2026.05.13.11.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 11:55:19 -0700 (PDT)
Date: Wed, 13 May 2026 21:55:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 06/16] drm/msm: Add a6xx+ perfcntr tables
Message-ID: <irbg5jjlwq6imiiwf6yfgvwg4wvdfwdkvimh52hnnmm3s7dbf6@ikcemlfpkel2>
References: <20260511130017.96867-1-robin.clark@oss.qualcomm.com>
 <20260511130017.96867-7-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511130017.96867-7-robin.clark@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=XIIAjwhE c=1 sm=1 tr=0 ts=6a04c91a cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=-2mmMjQWwNZ6YRhNbUMA:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE4NiBTYWx0ZWRfXyXH/Lw90lF+x
 wBPzZjXwUnOsSmMPalpYiPtzO9PYCd1b8BmR09qQRGGW747HQBKnJuq39sjUVuovZavzb9RO0Qb
 8VhBfIKMyocq4dn2FRzzGNWlibi9C/sB2M4Lp04gbS8SXzZsnGLmHnpZ576fxORIFk86PGjzuZk
 azeEvkRiatEkW3q93J/MdbBzBlwtdW+E2qDM4/AACLPlSZlchl57SST+KIpGKXP5JRjdn6jgTe/
 R/+nldRvx4vQPv/TO9FJAq8pT7iKB30byiEcKuecHhQawx4KP1miE56M1CNXQR4z3RAyqLufb7A
 oLN6LB8Qop5+B5s+LnsN2a9koIFIDmrNViOEEUicniXPqy44DRqtC8wv/Vg0RSp27NbJHeCBoIh
 ak2P8hw+HkI+dkjO087+Q03gzWpPSaZHdAv9fjZaTJH/fQS6j0qqwatUNdUxXDh+4CgSRB0SYUg
 KOfRHJOJS+VqQAPVavA==
X-Proofpoint-ORIG-GUID: 2l_-l8vJ_7D-8fpbmYOtsrdSwFGQtoaU
X-Proofpoint-GUID: 2l_-l8vJ_7D-8fpbmYOtsrdSwFGQtoaU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130186
X-Rspamd-Queue-Id: DA66A53983E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107443-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 05:59:19AM -0700, Rob Clark wrote:
> Wire up the generated perfcntr tables for a6xx+.  The PERFCNTR_CONFIG
> ioctl will use this information to assign counters.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 15 +++++++++++++++
>  drivers/gpu/drm/msm/msm_gpu.h         |  4 ++++
>  drivers/gpu/drm/msm/msm_perfcntr.h    |  9 +++++++++
>  3 files changed, 28 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

