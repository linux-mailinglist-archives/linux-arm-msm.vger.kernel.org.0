Return-Path: <linux-arm-msm+bounces-102033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLFlB9tF1GnVsQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 01:46:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 706873A848F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 01:46:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0220B302DF61
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 23:43:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 307AE336EC6;
	Mon,  6 Apr 2026 23:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K5YiiQ57";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R/dtIRe7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEA530F7F3
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Apr 2026 23:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775519004; cv=none; b=aIaygmKVv/YCTBF1F2Wft/OdiKmedR078YLzpVylzjsltQ7gWByldn6+RK+ogc3PSX4rgKwOzGOz5qCcGVrfCdyYbq7D2RqkL2iYG9SitgnOeFseT3S64i5iZ3n1QA5s1XBl5z1jlFgmY+mnwb9hH1gXDj9KMHrwnu9MqV0ewSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775519004; c=relaxed/simple;
	bh=fvf2WEFFDIYD/yiN1mzvbgBpR7sbIchU4KPIjOhuiI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z7TnRBQDP26lm6kyyQUCVxp9SodLlnMzzSLsPgrbZ0UDlsnDz8+yvIH5i4H//AApHKvjzACDjpYJuxkSPxbqwSBZfRG8BYupci+WxXBns87WHcLIATF1T0DJMLPPQXKvqm3ZunarauBLGLjlDaw+MZ3BPTUEzVhNooFjLxRVqbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K5YiiQ57; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R/dtIRe7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LQYUS3402372
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Apr 2026 23:43:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hfm5estcAn1Cw7C4MRrM5+NNSc/ctNCcBh2lICL2YvM=; b=K5YiiQ57crlXi82y
	AzktGtA8cSsJWrH8qVtdBCrnCMw6aFInSmAklRh3v4udOBEDQxwfQ/uCKUQCpLme
	Pac/X/t7sVYIoNOqzBy5+zCstSe6FP8fAKSm7wdh/shi9eIdvEb4ahdfEqNIK3GI
	IFmz/acmTwCa4wV3PVMpw62Auu95IjHnZ3vntanZkpSVmt0cDfECZvfzCH8o+j1o
	KGxtUvIW7NrDQdPv6h1WV4XC7y/2SXHI+3gVI2wMDeZI2Hho9jyymFVV/JfFve2c
	fDm+fU2NW8smqkTr/F+FMsrg0gV7UnHIgXfJ8N3bAzRjGMH0exfuUO+wxz0CLFtY
	P8h0pw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrhr8ug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 23:43:21 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d984c74a8so29968601cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 16:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775519001; x=1776123801; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hfm5estcAn1Cw7C4MRrM5+NNSc/ctNCcBh2lICL2YvM=;
        b=R/dtIRe7WSXXP6Zd3PRDBe7ZA6fcu21PXCr7AxEti8fYEUohWNJq8ncXLpZP5nfMiC
         WSEgeZKJixWCGZFPL8LPQy5DrUWYjAbyEHixvTeuAazfduIVURI32peHIBcJP5+BFi4p
         snP76JROuL+XK7rLexNlt36Bk180y8VwZclOb8ztB6oovxWrH+ylD8kgGbCQPJgk6XMZ
         uNjy8CXRrx+ujBGTCDcp/Ap4x8AeAc2VwCXp0X3HNd1SAKyZ222Jx4w3pSigb7VVUMaL
         jAbFgUTvpg5LmTs+MfCR1QVPAxd1rAB2eUiQ7g4QDgp7AfLuFfjUH9IbZc3A7wCRI/AV
         Fc3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775519001; x=1776123801;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hfm5estcAn1Cw7C4MRrM5+NNSc/ctNCcBh2lICL2YvM=;
        b=Fv0wJKZhgk8UifkFoXdpZ70iAET4HTejcc4OHgl+I9QNb46XhDUzdFkUgV7eqnq6Z1
         VCJmwvaAMww7TLUgJbCjtpKiySyqZmUSYc3m9WmMzqNveBWeknCRnOO0ilSp4Q5UHp9D
         S1G0osz9Tp9KAkXz0ZD0uaGnDf6WpJiZtDrWsPaGrH0E3Wjt4P+pWFCXZqpEJSpSl+Gc
         5MoYvcKMzFl0qCsCYE8J+keS3WE2vGLQ/BVFc/e8eLEpL2FSSpCXRgwqh9GErLPXRhe2
         OIAfo6J8SaELNg7WOOt64UIIiGL3E4p0xpgINkqQtsoKeGOkR6BnaK1MaTd/zPcf1kGZ
         RaAg==
X-Forwarded-Encrypted: i=1; AJvYcCUHb+2bxx6RWubrN3Ac2d1DQl8eggMGsdMnXI7qenJxWUkcIVTiX8W3m0NWvE5O/XgMbd1+j5JyFUIQ4cd1@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5+lGQdix0LDq9c+kknola8Bon+oTsn9XF/OKVrse2oMre1kHZ
	/KZTF1ROyoqkjrmLo5yXtSbfG6eEqzc8e9ov2HIN/mYNF5A1MZ9l+cIZnayDeUeoR1ro0097Kg4
	+rA69MThsYP10McIBqMgO6mJvb5EnmCJ3yoA4ZyxKf7ybeMz4yaxNq3iI+bgh3FtIj1rQ
X-Gm-Gg: AeBDieuJeRM/4GXTeE6puGMSS4XuLYwVcGztOhvZVfkT/yLu6mzcl2DSatudz5NwlS0
	Y5OqRpBOOYyNDLv3+PqsWzf7NHSJ7rb5rB9yn8AtSyOosMcxqSnL/5Dxf2RJpdDlMRE3SC42JLI
	LRTzGeThHxPeFxathJL1aJ+iSKDyFBTgXLWHFOkpZxdnpJWypAY2zkfsfbF5OJ2OtlPpBWaB8KH
	XgbzPHXpU98ah9WKzfcLeJYk5pEym1Iy6k6qwxhfQFMERspZZBY0ezV/m6dTDH/gPicfurE3dac
	kbBBLjfhfePv+VjU4bc4m1Pvg4O66MuUAnrHJI+5PjLBOfWHawFmXMIYOKWPPJtv0ldPbuMFHrG
	A5U9xYwmkOfklCD8ab250BlPs5O9uuqhxhfh5IBk8uYTKQneJQWe7fPvSH/BSItgoDhzuUTwGvy
	3Lk7iOIPH1HXjOM37UjGVK5494ZUG0VjQFHGc=
X-Received: by 2002:a05:622a:1249:b0:50d:8d63:3899 with SMTP id d75a77b69052e-50d8d633997mr117473611cf.14.1775519001114;
        Mon, 06 Apr 2026 16:43:21 -0700 (PDT)
X-Received: by 2002:a05:622a:1249:b0:50d:8d63:3899 with SMTP id d75a77b69052e-50d8d633997mr117473411cf.14.1775519000715;
        Mon, 06 Apr 2026 16:43:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6ca3100sm3725118e87.35.2026.04.06.16.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 16:43:18 -0700 (PDT)
Date: Tue, 7 Apr 2026 02:43:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/adreno: fix userspace-triggered crash on
 a2xx-a4xx
Message-ID: <5boflu67xgvflhrkbmc4gsv7dx3dzke5b324hudnrtt5kzn5wn@74e4t7doa2zg>
References: <20260407-adreno-fix-ubwc-v1-1-bb2b09450b87@oss.qualcomm.com>
 <CACSVV03uVF-STTwCVR3=9Jf=dCh7buBmk-1LBhYO0YfUDYXNDQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV03uVF-STTwCVR3=9Jf=dCh7buBmk-1LBhYO0YfUDYXNDQ@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDIzMSBTYWx0ZWRfXxGIYXZgTNtJE
 haeS5BXB0smIgnbzqnQRIVUcq23+bEoSbrixMql4GJ2rK9BKJ8iHU59R1n2MPQGIfLZxwbyh48Z
 WmmSfciq6ibIqf3naInKe9Xb8/xM0R7bU1YrSNnKoD8ulYFLSfZ1TMRNdMd5dys/lmzoHL9KOFQ
 KXL1qk4InpvxKdNouLb83SK1cP6T9H2Fl1z8oZnApPS+/hh/dqBId/JGmJsbGYoBi174cjsJv8f
 Wii93sWMuOZCkVwY2BLzfZLNl3n2qhhO3i9nD5oBeURhrVDAqellvgAON5sy/mbfQkpa4cw8+xD
 tndYyq8qKvkCK5mxIuYeSww/bUcVplSF8HADSeWlPeLx4lAAg9RY2D2F30pEiQJbk4FxsfCBCcg
 SK1BkDlmrd8SSwqgad6m4yQV0OxyBr/YYQBU6F+3P3iObftE7inyj7FTWaFSFe3AaBbpXsWkHd/
 m43+6QumN419i9+YYkA==
X-Proofpoint-GUID: s0SGv_FJkoNIFtfHvfoBZoXS7_3GOEXG
X-Authority-Analysis: v=2.4 cv=XPUAjwhE c=1 sm=1 tr=0 ts=69d44519 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=aIc0x1t0BmEQyzKU2LkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: s0SGv_FJkoNIFtfHvfoBZoXS7_3GOEXG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604060231
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102033-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[poorly.run,kernel.org,oss.qualcomm.com,linux.dev,gmail.com,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 706873A848F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 06, 2026 at 03:24:43PM -0700, Rob Clark wrote:
> On Mon, Apr 6, 2026 at 3:14 PM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > Before a5xx Adreno driver will not try fetching UBWC params (because
> > those generations didn't support UBWC anyway), however it's still
> > possible to query UBWC-related params from the userspace, triggering
> > possible NULL pointer dereference. Check for UBWC config in
> > adreno_get_param() and return sane defaults if there is none.
> >
> > Fixes: a452510aad53 ("drm/msm/adreno: Switch to the common UBWC config struct")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 15 ++++++++++++---
> >  1 file changed, 12 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > index d5fe6f6f0dec..7dc95c0a17f7 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > @@ -426,16 +426,25 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
> >                 *value = vm->mm_range;
> >                 return 0;
> >         case MSM_PARAM_HIGHEST_BANK_BIT:
> > -               *value = adreno_gpu->ubwc_config->highest_bank_bit;
> > +               if (!adreno_gpu->ubwc_config)
> > +                       *value = 13;
> > +               else
> > +                       *value = adreno_gpu->ubwc_config->highest_bank_bit;
> 
> These three params are only used by userspace on a6xx, so tbh it would
> be ok to return -ENOENT for platforms that have no ubwc config.  That
> might be better than returning imaginary values.

I'd say, those are defaults. But I agree, -ENOENT might be better.

> 
> BR,
> -R
> 
> >                 return 0;
> >         case MSM_PARAM_RAYTRACING:
> >                 *value = adreno_gpu->has_ray_tracing;
> >                 return 0;
> >         case MSM_PARAM_UBWC_SWIZZLE:
> > -               *value = adreno_gpu->ubwc_config->ubwc_swizzle;
> > +               if (!adreno_gpu->ubwc_config)
> > +                       *value = 0;
> > +               else
> > +                       *value = adreno_gpu->ubwc_config->ubwc_swizzle;
> >                 return 0;
> >         case MSM_PARAM_MACROTILE_MODE:
> > -               *value = adreno_gpu->ubwc_config->macrotile_mode;
> > +               if (!adreno_gpu->ubwc_config)
> > +                       *value = 0;
> > +               else
> > +                       *value = adreno_gpu->ubwc_config->macrotile_mode;
> >                 return 0;
> >         case MSM_PARAM_UCHE_TRAP_BASE:
> >                 *value = adreno_gpu->uche_trap_base;
> >
> > ---
> > base-commit: 36ece9697e89016181e5ae87510e40fb31d86f2b
> > change-id: 20260407-adreno-fix-ubwc-6a2564710e21
> >
> > Best regards,
> > --
> > With best wishes
> > Dmitry
> >

-- 
With best wishes
Dmitry

