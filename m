Return-Path: <linux-arm-msm+bounces-97109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Nm7ABQosmnlIwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 03:42:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC3C26C5AC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 03:42:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F2D953008D53
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 02:42:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D6D137CD47;
	Thu, 12 Mar 2026 02:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jFwvcTiu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fdNxY8EJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB551346782
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 02:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773283340; cv=none; b=YA38dJs2KS+ymiKvYbwKU28RlEz6atLFIfRZMspCmOL+EzBkM7Xangc9cL4mLf4o2d0uJpeIlohgZSMK+yojLk6yokWaueuJ77f2osSTLVaHNpysqJKKC9tiWnJw9/QT+TfDTaab52jpM0EbwDiOa14hh6APEhE/0IvMgILV36M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773283340; c=relaxed/simple;
	bh=HzT+3wZ4FpxIm30KMmbH5XH5J+e/N7egoftKhEnEvdo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FCuMKTg/5qYPKuOz4sNld9Hz62r40YIhcRuzf9GgSZPUdPalj6JPwd+1vib4OmcaRjU4lqExoNsbLz+v4JRyOPgAXGJuR2wdxFaHaoWcxnkrsXzcN7EBBJDprZN6AoOqXC3ObG7Q4wXvSKKkYsMA4f5k6eFN0ncYoIYPHMU89Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jFwvcTiu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fdNxY8EJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BMP1Oi588071
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 02:42:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JLzu/POoUuORlRAv6y/cHpnp
	YuQTytrcgGVugsBFJCU=; b=jFwvcTiuaIQch+rESAhhtw02PEn6zmfFi75kgRBk
	/xRquIq5hkTa8nUDIcAmh9jFSbTxqWc2vdLQHln+ffexEWuSptQG2lgDCXlpOWnB
	KC5Mawhbl4UgEEEpeX77tT0uKL6hpSTqxenajB+hAceDBl6osiTwXMstCp7fi5xE
	Nr+Ki3ocpQzVzs0lDU6L/29h5yjnAgkrxZ+ylez+zGkuYTDCCIgMzn7rw9Ecea3M
	pRFKoznBDGjn9hIBnZNzRiuia7oaCHig7GNsnNKN0YoSHOpZGQeTND9QOwbZDfk6
	3Y5lwF5x8E557qv0zK06lz5fMZ0SWx4d6wPylJ3j+wDkmA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh5q0mn6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 02:42:17 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5ffca417657so4672594137.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 19:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773283336; x=1773888136; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JLzu/POoUuORlRAv6y/cHpnpYuQTytrcgGVugsBFJCU=;
        b=fdNxY8EJqy5dgSkNLWnEvGdBnHtgEfJRPpqv9RnZIy+74vGHzEyg9tmrzHwN8LajmQ
         zEWj5EH+sHm6Q75XZX0Lq1/ZVPFyuB509XB+8URrDpxxo1uYBIeyJ3VXQRXINVWI95pQ
         /J5CUti90krJaB6qZ9Kct7zwcnRWjh+5r6WrtyO8Jh6TJbbqST/pL32f+gTKCXu8Y/Rl
         OCW/XNuuMomYv6JqFsckVEBUKsirI0FEKHp32I/wbaZgLtWB8ycU7To4iJ4EvpwbKl5W
         X80h/YrBLTxGzED79ATXoYYbCKeh7tNwOnvXRF01XO0vUzezg7wySMfwxCF2TOe4qRe0
         f96g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773283336; x=1773888136;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JLzu/POoUuORlRAv6y/cHpnpYuQTytrcgGVugsBFJCU=;
        b=Q1p5lF98S91EflysMcJd3OJImzTTYf5IOW8SppW+Uvlkr3Wjxpk8HWo4MnCySOv0r3
         j2YuPk7Ttc0+WwcX132a4wHR4lJdaU27UkxpW7aIxLJPx9vMqwpthjif9unjt6vbBob8
         TUTZSIueKwmIi72Wjx4H0PV6kjxaCKMXkBKT5adNouJC0V3eM0P5Onnd6HG3Y1vqRyem
         WNJTM2YSHINihtOI+aEcfWVMV2XVCadsQI0EyDlu/2XSn7bBTqg7JVtELF7mzatn4WY6
         0AiCXjK/og6nA8hPpirMdiJcTo+k/aqKMaFjeFqPT3y46u4lZlckrcAuoPyu8siyv0o7
         gmCA==
X-Forwarded-Encrypted: i=1; AJvYcCWD17pZkVNB9T59y1zwiuaqHxxUfdANRrOkuGV4uWaQTQiPAk1Cv9b0EJW+tHoIU0Dzwk1Hj1PrfNatVLGo@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0DYv935pS17DIe1Nn+/Dhpo5+C+IU2G6jL3aEAyOzf6tYyCrE
	Jp+6NJo+PFsxQcAItz03hCYMioB4YkbUk4CW52hqGG0aXMrYZXXtCJ2kolWcX5Jk1ztPZ/C8KYY
	0GEeXXoJ9B1kidGRxysD7ePX0SbX5f2U2BYfHSZFbP1JyGZhGnuan61YJloWDpd9TzoS3
X-Gm-Gg: ATEYQzxZ0yMknmLEiCd/a7S2Kekjwd2sugXdFgPM/0n+V8E8DHcCE5uOc4B5hADscDa
	nrmLfpZ9xDuIyOx0nRswI873gOqJLgzg+lKN10vAF7OsftiaoS+kcoRBao/XppK9KjU0e1Xli+K
	hnG1STyE9ODFM7tuJ1JnN/H9sozSLDDcl2zXaNE0b6PYUTXcsEGwaEif49AY++v1FRZqX78Dmps
	4wYcBNrKRRU7g6FDr2qhOH3kle3H2M9Dpb/958mZs/5h+WYI/B7nYQMmjDIN3OmrcQXNyl63lUu
	oAkWXVP3az52GfyvHHzxK06CyA56rr3hov9hXzVfdIsaSTU2x1maDhvuRrsz9HmAgJX48i4Yc0l
	2DCD0vxdAtLOaQMnBVPWE32936is3rPVqKj4a9DQcfXNvg/Cp5f4xHvBPcl4wuQm6WkYy9UXSrh
	gZfRDDyqfwP31DKkKVLKUeq6guROMaf2lw2yI=
X-Received: by 2002:a05:6102:ccc:b0:5ff:c2f1:20e2 with SMTP id ada2fe7eead31-601deffa7f3mr2310712137.31.1773283336031;
        Wed, 11 Mar 2026 19:42:16 -0700 (PDT)
X-Received: by 2002:a05:6102:ccc:b0:5ff:c2f1:20e2 with SMTP id ada2fe7eead31-601deffa7f3mr2310686137.31.1773283335554;
        Wed, 11 Mar 2026 19:42:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e67b73sm6681401fa.30.2026.03.11.19.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 19:42:13 -0700 (PDT)
Date: Thu, 12 Mar 2026 04:42:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/7] drm/msm/hdmi: Consistently use u32 instead of
 uint32_t
Message-ID: <qzfkft63auq2gjcqlv5miat24coqvxxm3ibjmhmgw5yhpiz77x@sffrl5t6hwb7>
References: <20260311-drm-msm-hdmi-cleanup-v1-0-c5535245f6de@oss.qualcomm.com>
 <20260311-drm-msm-hdmi-cleanup-v1-4-c5535245f6de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311-drm-msm-hdmi-cleanup-v1-4-c5535245f6de@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: w_9mhh0-X8N5LxztVu9dXNOOoACObl_x
X-Authority-Analysis: v=2.4 cv=CIUnnBrD c=1 sm=1 tr=0 ts=69b22809 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=MxPJovyF30u6jUFPon8A:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: w_9mhh0-X8N5LxztVu9dXNOOoACObl_x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDAxOSBTYWx0ZWRfX5dMzp0gZDuwe
 /mRCBWkoi6AeukgQIbm4IradAqhFaSPpZfHubF9Fxq2xiqu6vpayHimVCle3LZQO0moM2TSeDNs
 mnrzqWSPBvjgV7dqUDYGEsQbfqEG3N0trTcvX8GfR6Q6GpA/l3tTEqP7W0lQLa1xoz/nAO+09zR
 +etAmJsjbpdpizHUtQqKehjP/MBoVMxA1yySD8BCTGHBFZpxGnwKyXXjkkZhaWcHXk0uEeS3HPh
 fMXYPeCkaU4hVT4iAvMK1Ua4FX0J9jmD9bJHGSXrbo2Uk8NlTRScoBOUOpTQ7SYxhwsHoJAVk3g
 YUAGmSOpMxam40Gz9MYGlKWBo65m4C/8lccUKeaHAK2y0iow+qKGW/5bD0w4ZW9Ju/OKJ38MBTB
 zX2UvU+FKu2tGsFsH1VY1GpYOh+lvctg0WZgq8BNpIWT8uZtbYwydozFz7fk85A3wnhc2gF7YkY
 91waiDO7xo4ROOUXT4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120019
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97109-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9BC3C26C5AC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 09:17:28PM +0100, Krzysztof Kozlowski wrote:
> Linux coding style asks to use kernel types like u32 instead of uint32_t
> and code already has it in other places, so unify the remaining pieces.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi.c        |  2 +-
>  drivers/gpu/drm/msm/hdmi/hdmi_audio.c  |  5 ++---
>  drivers/gpu/drm/msm/hdmi/hdmi_bridge.c |  4 ++--
>  drivers/gpu/drm/msm/hdmi/hdmi_hpd.c    |  4 ++--
>  drivers/gpu/drm/msm/hdmi/hdmi_i2c.c    | 12 ++++++------
>  5 files changed, 13 insertions(+), 14 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

