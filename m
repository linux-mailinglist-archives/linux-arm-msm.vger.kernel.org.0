Return-Path: <linux-arm-msm+bounces-92113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id PNC3IDECh2mPSwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Feb 2026 10:13:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4B9105493
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Feb 2026 10:13:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0EF7C3019827
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Feb 2026 09:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4799A2F6937;
	Sat,  7 Feb 2026 09:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pb5Yoqmw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SwmrYbRj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114FD2E6CAB
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Feb 2026 09:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770455598; cv=none; b=JZdAvjskgtMOPAPM+v0PsN85jtpi3XQ2GV2Y6Zs8ktGVKpOx8biZl+sBrFsLYS/Dkp2j42rmZry4ouf7rqxgkY3UTONaTaMefI2DotKZU8pjCsaSVSHGVVJfxI2DzkT+G0mLCfdKOZ5T+HzrnujpSs2apWQXQnuBDvcqThc8iz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770455598; c=relaxed/simple;
	bh=VlUPWMAqypEdpJZi2GWeQiiRkpy6zBBiZPD0Xd+59qQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tSLJDMcrLGFOdD0xbYSqR/bPmmiK8HEUposzmVY8qeGca1L7aRvHJOYwhSMWRlQ6XgEusiKAjKzDrXQPSXgxngkC95N0aA+SuXWtja1H0wId+WJsutpfJfscCJRJI5ykbNTM4LuGdAeOFI0hWTu14XqHO7vD0HDCe/IucL4/p6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pb5Yoqmw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SwmrYbRj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6174Qqtf922444
	for <linux-arm-msm@vger.kernel.org>; Sat, 7 Feb 2026 09:13:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZnhPfRcyvXmJuJSiZfwzyHe7
	jzBv7YRscb6FfNKJ8LI=; b=pb5YoqmwIkiTWV4BTcm1MMbKPi8Nhj8aVVJ9cG0V
	76vEeGsPWhJQvNxzHJ8PWKegr7VI+D3ohps176Htydpl7W7TIpa6xyJuwzx77CKv
	7lnMXr+R44bt00GQQDerJ6tRzTxjKffxtBjdfvazdUICpCLw/lmUx+i/1ZbFBHBN
	SbPYC+3vvn2mIanSL520174D1KMTlY6eWyOP8BvojNVLWmLI2A9V7Y8RQy+Mh5ly
	A35LSKrwrNt2j7/oKzG/S8CON1vrgh2BEasO410oXbLnL2+rkOSK113dj+8wQpnz
	1OgG7trhbL4JNF077BfOwHlDF6vf9/RYVwJ4hWnIUF0QcQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5xccrdja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 07 Feb 2026 09:13:17 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89471437f64so109002146d6.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Feb 2026 01:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770455596; x=1771060396; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZnhPfRcyvXmJuJSiZfwzyHe7jzBv7YRscb6FfNKJ8LI=;
        b=SwmrYbRjqDRtHIQFtFQQYZLImPs6CIl7BNLaWuEMQWlW2FEWKJGzkwIfleAMDlus3T
         FttRt+ZPCrkszACDoGtjKuzsPkW2gwTNiedcIXrqPDgqCJhFs86GhbsUGchInbl5NWK6
         +1u9x36Irb+XZlRXFrrPrpw6W83xUvbHCrqKv13ZoJH9zzGbYz5AnDeEjbaCeM0fC2RF
         pi8UgbSB1mOyGJOsQEJTmHM4MmdEkne7k5nPYH1x6Z1v5FevgF9ye3MQke+WDRSoIsq4
         VcVhwiKbbJ3oOzpsFEKd9ROkNV1k0yZWywp2+nAHIpz2uDa6GmEOk/snulBM+CQftLjz
         dCHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770455596; x=1771060396;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZnhPfRcyvXmJuJSiZfwzyHe7jzBv7YRscb6FfNKJ8LI=;
        b=TyOS/AGAoaHWQn+At5zN6EaTphtUr/txCGlgUN1B9yFC5SSXZFRa1VrzqUlvWRx+D9
         Gjeso8tdsMxuUPiBvht2omzgdksNkDyfl7KbhNA1i+a7Ia71jRiRu3FZAX9Ox9BNKbPH
         ZWIIuOX1AVHmo+5egcW9ODnuZebuWhUkn+sE9wwnaBAbM++5nAmdAfoVZYCaFNb9nENI
         Fc2rfpF8hAFdlCZhITKhykIvKkWyQHBCfmHzcyUGX+ciXHRy22o8cHmEw+FN+13j7eMt
         MKKGsBu0a8laDSjF5fOr6+cxA3TqmMhgMQQFriRcH6I1b4OdyI+HpFK6IL7zlDnRsvVJ
         B1KQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMf68IrkQ8jbZU6ek2oiX3UqsNf9LxOa3mzpTO1eNxQ7bA9K6cl3J9huviBi3x6YaKcUUJdVSnLyxYdn5Y@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3rXurVISzn99gp46mjTIX/O70NcFa/w9FC9Jt+5Q+jD+5LdC1
	aGDA0lh/V5Tb7TBy1rgC+aprkhajE1/tf4M1Rf8hysutzdqgMkdIhph2eDlqg50l2m4TYesNbTI
	3VA5OTwGWfi9x6vXa6WGsyX3X+3wVuLKWh9ClNokF/bSPScYfHGg7HNXWDtSdbClW5gAp
X-Gm-Gg: AZuq6aLbkHsfP7Yly1ML+fPmWmV5t82+dP3qlQz1WWl8VBJiAZNj0DKqxtD7GHZJRaP
	xqNr/b3fhFY3gWrGHMymHicx4CuxiSrQ5WBB4wzGuoGBrnLt5AGlguAvWYVWaXw8Xt4u0ODCyRx
	riwmexgjJkEbZugH8szZKk0Q/iGO4j4JUD5upv08BU0gDp0pYw8CKTd/KTcuwv6VkUqzGu05+mQ
	gXjUxAy7Kfn1ZcnQTZFP09GTKjSDSaPAXsBq3qQ8yLbWSC4EkX1U5sOWgzirvLSxUAKdI4WThTx
	W9QxNkG4jpn+oyIhvfzgmu2X/y9jV7H7NGHw5+fkfhwYsT/8+HG2vlOjIG9eZmlu8o0dJ9CQIvy
	oRB/aUNOLhqejMTaaHSsXR6/de8twYcVOFrjpuimChFRj5FvZ9bXLMerizP72h9+uPQmyCtmKRV
	SEBV2UzpwKYMspQQawbvt4paU=
X-Received: by 2002:ad4:5dc2:0:b0:896:17e6:b3d7 with SMTP id 6a1803df08f44-89617e6b59dmr1404116d6.68.1770455596449;
        Sat, 07 Feb 2026 01:13:16 -0800 (PST)
X-Received: by 2002:ad4:5dc2:0:b0:896:17e6:b3d7 with SMTP id 6a1803df08f44-89617e6b59dmr1403876d6.68.1770455595931;
        Sat, 07 Feb 2026 01:13:15 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-386b63adc3fsm10918031fa.26.2026.02.07.01.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 01:13:13 -0800 (PST)
Date: Sat, 7 Feb 2026 11:13:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kees Cook <kees@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH] drm/msm: Adjust msm_iommu_pagetable_prealloc_allocate()
 allocation type
Message-ID: <734wzdoihl2qn4lu4inig5taw5n2aovabpce5y27qb5kiftnwh@ynnugouvaran>
References: <20260206222151.work.016-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206222151.work.016-kees@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA3MDA3MSBTYWx0ZWRfX5LxBVYHxuZcu
 6ryKZog1cH2iLqNEbj4nJWbRudD4fLH2Z/9UlSdHH3KMWgudJEMtXQlB5ZilsKAe4qXynCm+2f/
 Q1kzZ5z/p8+CcWrykwhBMSCm1YU0WEMHxPHhRXszm8B+m5pRT3mya3Cu+ZDNwOJVL4cON1kX/5P
 RBjY2ZwWbQQq2FoU9K5hFZX3yXvHOHS6DYppZNU/SUc0ZeLDrPhUSkedqMJ4MlB4//iyZ4/M/+F
 ouo0QvxqF/tXsAPzLtTBEexpc6PnqiI1MjwbmxDb6ZIRrajvvEp5zdGFtYukYJ2gtzN71FGQnFt
 Nh6LnsOvT0dKAA3D0GnRTAAfYBH2WUhvQykk2wcS7nvLmaX+CFh1mRA4KpaeJA2e5M/fNh+rpfc
 RWsWbdGzgsBEeqNM2cZi4kcPT8dxcTPMkNbTu5lxaS2XOglnp1uWV+zozGMb25zQ02BBCgXJZJE
 dC5aO9FrFM+mzx+axyA==
X-Proofpoint-GUID: 1u3e2WqLdX_Chpsq0AzeAZOzXZTRrhjf
X-Authority-Analysis: v=2.4 cv=ft/RpV4f c=1 sm=1 tr=0 ts=6987022d cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=tVI0ZWmoAAAA:8 a=e5mUnYsNAAAA:8
 a=parfbKQTulTwLggSwN0A:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=-BPWgnxRz2uhmvdm1NTO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: 1u3e2WqLdX_Chpsq0AzeAZOzXZTRrhjf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602070071
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92113-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.dev:email,ffwll.ch:email,lists.freedesktop.org:email];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8D4B9105493
X-Rspamd-Action: no action

On Fri, Feb 06, 2026 at 02:21:52PM -0800, Kees Cook wrote:
> In preparation for making the kmalloc family of allocators type aware,
> we need to make sure that the returned type from the allocation matches
> the type of the variable being assigned. (Before, the allocator would
> always return "void *", which can be implicitly cast to any pointer type.)
> 
> The assigned type is "void **" but the returned type will be "void ***".
> These are the same allocation size (pointer size), but the types do not
> match. Adjust the allocation type to match the assignment.
> 
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
> Cc: Rob Clark <robin.clark@oss.qualcomm.com>
> Cc: Dmitry Baryshkov <lumag@kernel.org>
> Cc: Abhinav Kumar <abhinav.kumar@linux.dev>
> Cc: Jessica Zhang <jesszhan0024@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: <linux-arm-msm@vger.kernel.org>
> Cc: <dri-devel@lists.freedesktop.org>
> Cc: <freedreno@lists.freedesktop.org>
> ---
>  drivers/gpu/drm/msm/msm_iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

