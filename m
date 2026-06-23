Return-Path: <linux-arm-msm+bounces-114245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id k2yELLWuOmq5DggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 18:05:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 258C06B88D2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 18:05:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=aqurw5LY;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="XzzG9p/w";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114245-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114245-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 29E423048607
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 16:05:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA063307AF0;
	Tue, 23 Jun 2026 16:05:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F5030B514
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 16:05:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782230707; cv=none; b=IDhNPANQLajjh116jtEIx06fRKnBqx4JMhJPuLWlDO6G5kvtpXqg8AKaLKKyP7y9LiV1qC4MX6avdAYxJOxalIuQ3sQksYu9qV9G5ghXofl2q65hyh2fZ7PSdvkbsFpI6ufLhAL+FDgQh9yXox1y8LAv/GD5Uw1EGIhTFRgXgDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782230707; c=relaxed/simple;
	bh=6dPZAhxmblZx3o1TnvfD1vhQNrUxfxPrZLK1keutCxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=czovqkI0tjPvWfoSe/X9uhwP+OHHbWKp3qTuklxuOyh9exAmvgUZV/egOr08sCJ946jw3RRohD7qOpZt4sEIrSq+DQvGqAH48gSl74eANQh1mOEdjUJ1+u8jyH58R/UJ20bevG+JUh3mEEizon6cdS524YIEgEfqqsFYn/T2nHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aqurw5LY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XzzG9p/w; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBYoS1113942
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 16:05:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ba4JmPIhyOix7J6UGNQsATfR
	esjlvTIh1uzBfnXSHKc=; b=aqurw5LYd+SAucGEvdzzsXEvhRZ/FD5PbreVRzfT
	5zOd5EfoxErSVSDXyUzbFtsaudrWRKiyB3VZ4toocr0QQuyL1D6sKQGHKxXmTMWH
	cYBtz2GrcwwO6xMuj9ruGaiqcZfJ75LI2k5HfkLv6BnKJfV3LUL1jpGO4svfN0Mb
	UdwTmuqNm6rD9dNKCIJbSaAnSeFkkFkXGwfc5AuQk7pl3J0hMRmfyinsIBLrf1cb
	D6p3oextWExOhcpkG2PILdZxAKhTewZkAT3Bjf6YSRHF3ZD55xEyjla+lvIhPdck
	wqTKQoh+NN6bsClv1e9e/FfqT1b7tzozgS6YfNf1zfYDYg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eymnvtdvr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 16:05:04 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8428419982eso78936b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 09:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782230704; x=1782835504; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ba4JmPIhyOix7J6UGNQsATfResjlvTIh1uzBfnXSHKc=;
        b=XzzG9p/w/ieRJQrUghn6WfmCOGxBZk07RrfEPrJoOl6TfZF2vuQdmHUkUsNtvKGPhU
         +3X8jcY4gFSP1xJx/gkc3k34hWRP0NaMlyN7/rOwnKSLqvpcXatEg2SUstXAgIHaZd3Y
         ULjdgObr3QGtV0li52f0zedOu/Lu/t9MnidA+Mr981xSL6b4ur8vnR5YTpkY4UiQqayj
         V1GsOXTTc5Reo6Lkkw9apJaq+jA07PIkV+11XIYxBf31hTqFs+9TDtK3WCztPcOcQc7j
         EvM/o/v7VuttOjetvSvEF3m1KpOtfs+sVYGslkf8Ksp1rZ72XwbqLVk8hlc29NpgRo1l
         kE4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782230704; x=1782835504;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ba4JmPIhyOix7J6UGNQsATfResjlvTIh1uzBfnXSHKc=;
        b=aRRwhH1w5Xjwz4Tz7sBirJS7ZwtX62AeAhQg5FfJyAjXBIpW7kgxI8ZsyCMz9R0CQ0
         SE2W4hVA4+JllEubgrbZdJdakcFBalD0MFit0UWJzgt+UhWYl78a41HbplKeWserPjM7
         Au9V+rzGa9EWKs8Ls0LgEufrG2QNStGDI1GyEL8IZ8WvrPdRt6DoHh8NtlZo5AfvhUqj
         1GYZyqCsETnMswKdS5FQyPhuDSvkntqqUs2/Xvbv4eQHhi4YEW6YDI4OQtQbBqr5ssPX
         mAO/OSbaa4tJ1U+XFYAr+RgV2k6wi1kDUJkFz4v+Kmgw1AIe6c/ITDy+vpU7tSEsARkc
         99UA==
X-Forwarded-Encrypted: i=1; AFNElJ8iQa5nHor8YeNRISu8tueJdgkDM08vMMYPDuAiRq7Jx9gdA9hkPX7BZBNrWVBHpMOIrLcI2RJE+hC/i77h@vger.kernel.org
X-Gm-Message-State: AOJu0YztTLLxG055gmK3fdPVnfpwq6KqA080WjGzU5zMw1gAnMiZqXOb
	OXzktq+Rm9o7JZ0Iy3RnLDp2Ply2+NJnGDI56xpMOD0UVEjp2GhwL0JNKe9WYxocoJUOl0he2MH
	PlHz969XU9GiKxRJ2baxYsEDBjINUXYOVpUZDiTlD7zsYzLPkdYc5bg0+OxNRfVTsmh52
X-Gm-Gg: AfdE7cl1U1qFYSVQFyFfCGciB7UFOPyec5JYFePqqcRg2xSYbBSwX3BfEY0fCMBUjgG
	xalXr0jPuMQy0s0wWwX2+cL7tO1D2bv0eAEg6uLK3X/4vRu1Be+7FXNXKalbUT6aDPfKz8HU4dg
	zq/sUUy/QvOx1KbrV4Jc95OOnkqGLWb0sxY+QmCXi1WK1wiH49q2HhIT/ttJhiJRlRhnW4jG/CC
	VwwyTbDdVWxRGk5Odx2T90hEh1LZHotWWiram9zaJ2XTbjwNEWUuM+LJwhuA7+DtrV4oLNHgUBh
	VC1oD4IIlXd0tXcumYHBbkD6E7zJe5oeJPXwFGnD7NIg0uEfLgqSRXogMA9sXks2HpgW/hbx47f
	q44EFlgsEy7zSOKjnj0atFb7MFhai0S2CZj3Veg==
X-Received: by 2002:a05:6a00:27a8:b0:842:6849:2180 with SMTP id d2e1a72fcca58-845971251f2mr3726664b3a.37.1782230703777;
        Tue, 23 Jun 2026 09:05:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:27a8:b0:842:6849:2180 with SMTP id d2e1a72fcca58-845971251f2mr3726598b3a.37.1782230703213;
        Tue, 23 Jun 2026 09:05:03 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564eca7fcsm11145523b3a.52.2026.06.23.09.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 09:05:02 -0700 (PDT)
Date: Tue, 23 Jun 2026 21:34:57 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/2] pinctrl: qcom: Drop unnecessary bitmap_fill() call
Message-ID: <20260623160457.j66dlzxfkvn3jxuj@hu-mojha-hyd.qualcomm.com>
References: <20260623122732.6439-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623122732.6439-1-johannes.goede@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=dOWWXuZb c=1 sm=1 tr=0 ts=6a3aaeb0 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=CudRCQxTT4vl8MJ7sxAA:9 a=CjuIK1q_8ugA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEzMiBTYWx0ZWRfX30kpYUJWOOTb
 fkT6dLaw1YVHrPYAi3hl835vx0u0mfkaX+SMUTNtQSJQFmInpSzDlRShMQuVitoLJSCuEHqeByI
 15yOWoYcRXH32+cUQkTemFiJcPpgl4Y=
X-Proofpoint-ORIG-GUID: 6jQLELI3RyxN0X-OM_2LndwTP0Ji6Zpo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEzMiBTYWx0ZWRfX1boCKH6Smob9
 DyPbABio2nVH02BAWg4ZzaQ5gVX9jwnPQ/cb71Zi2WcGc+0od5QWCCKcvN9zw4MciXwJSAoxQAU
 HpBoQdPxB1usdDbpA++k0QdtGVSWftIhmvl0GkpWssUFO6DVPEq9DfJG1tNM+KJg62pxtj4iPZL
 VS+zxHTzPMKyNQHPVQ3f/IvIMPmtXONagt6S1nF3/Q8Jnu9nOWjRIfw0ecbdRETV5KWsUhGL1AR
 JZvTOBMMwKHBu7wkV9+/S30fjPpyJITJui0Cft0dPVk2Vyqknur99PhDJb/bHFFGpj9CQgo1l2V
 Do5sjCEg+81DCYgdCLsSu9nGiTVQZt+gdzePOWRaMD4biWouOsfKXU9C/RVYLGw91NBVtTcmnqx
 iG/AY6uCOFZhiSqxr2BimYbJHWCDnxiMlorMHjMJzWTrfKp8wE5NlVPdtQPcQJvi8IEJsVW0+22
 luqBPQEH1ibPpA1C6AA==
X-Proofpoint-GUID: 6jQLELI3RyxN0X-OM_2LndwTP0Ji6Zpo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230132
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114245-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:johannes.goede@oss.qualcomm.com,m:andersson@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hu-mojha-hyd.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 258C06B88D2

On Tue, Jun 23, 2026 at 02:27:31PM +0200, Hans de Goede wrote:
> Drop an unnecessary bitmap_fill() call from msm_gpio_irq_init_valid_mask(),
> this is unnecessary because gpiochip_allocate_mask() already does this.
> 
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index c2938494c6bb..419342ab45e1 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -1047,8 +1047,6 @@ static void msm_gpio_irq_init_valid_mask(struct gpio_chip *gc,
>  	const struct msm_pingroup *g;
>  	int i;
>  
> -	bitmap_fill(valid_mask, ngpios);
> -
>  	for (i = 0; i < ngpios; i++) {
>  		g = &pctrl->soc->groups[i];
>  
> -- 
> 2.54.0
> 

Looks like you missed to add kernel mailing list to the series.

-- 
-Mukesh Ojha

