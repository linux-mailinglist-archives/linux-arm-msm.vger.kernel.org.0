Return-Path: <linux-arm-msm+bounces-103970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFWeEO6h52nw+QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 18:12:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DA643D2E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 18:12:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8542C302737F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 16:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B90211E2614;
	Tue, 21 Apr 2026 16:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="piYuSDIR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T6teaQbh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781D0236A73
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 16:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776787718; cv=none; b=q/RcV8LdwpfmFOoco+M2MFgjWNdFSN4SAuTO/SLJD++0HO3RWyc13vMMouRoAwcw+Y8I4aYOdC3ArnMLX8lk3e2fSnVkU4NqHco6qZuvyZJ+BE5foQiAbB9OPOfG7iBXO/4XblABf7I7+xAlijhmqROcYxtxU+lZnEYR2Idme4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776787718; c=relaxed/simple;
	bh=72xucHSsSyXOtHwWI+k+EQ6i7OMSHMBwwCyVzXtPwvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F8ukbWXNq46P3IhcZGMe5ht66sVmhXE6/zAqh1JF27bK62XPKnco7+C3VxyE8rGwA89lnFUtblv1noO0opdHUE81nxyfebu2AafWShYo4MOVDNL9tJvyzfbu74ZfLe4gfs0rMadqsEcG93Z5mJ6YNkQ0X5vkwHazXHQbcLa0S/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=piYuSDIR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T6teaQbh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LA6C0q1834900
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 16:08:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kBePGaVYHXLdWyRMJebFznjl
	7q7azdqgDds4a1vdvo0=; b=piYuSDIRShi9VMg4C3Sup8gt3YMFe+LnqiRrjuCU
	YvnfghsB6pVooXNm3qkkNnTkkYOgJUnofzscm5oqDMD+hc+xNGUVh8LsZflk9S0u
	os9E/biPuDkLrUe2607Sg2aGREiv9H7/M9uSW9ZY0xdbLDbmys2SY7Zmbd39lHhk
	6LY/FrQ/YQolNMsRXjVkZBDJrk324UZP9VJtWFs8YS0DgtE+QR1tX56YaK6zeDXW
	WLPio9MDFzYGWV20xOUb58FUdctgkn6ZUZ15OjiuD0FeDYtItU+H9TJp1muG03kB
	wKdbWnG3+4NI3dTiy83AV1yNUKVYgK+2hNfLvxlHQo7Mpw==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp76gsac6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 16:08:36 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-46ff0cb3a36so6521446b6e.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 09:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776787716; x=1777392516; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kBePGaVYHXLdWyRMJebFznjl7q7azdqgDds4a1vdvo0=;
        b=T6teaQbhZDkNhOfB0rta2xFMJ0o3AVnWHqZ9jWQv4A/ass+dKZOA7oxRXDmU/tmYu2
         nNqs2clfVcouTzKlaaeUqNH++YQIGgKH1kpPmxzELSkFatCLMgF0a1fTMMiajQxDQ+sn
         Gvt3LATqg4jDcepSsVtNxvDMNrEyfsc5ys+l13o4LYfwQUj9YmDhWWQsjgVBW4RngxyO
         r48pFW3UQheLS0X5xtds6PLtimVNayXqCZxpA7H6CtNxteDEni7O90uMSlVwLY5sApVv
         t03Ih96hrCoJwPEXHTPtvaLntDujIUM+XHMqNCd34po4qxWJdwDVRxTkuzHxkAZznWAo
         XUGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776787716; x=1777392516;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kBePGaVYHXLdWyRMJebFznjl7q7azdqgDds4a1vdvo0=;
        b=P68evR0gkGYS2xVMiOxeVEi1TcmHYN8DfqbG+y+kma27IoxJslUNyEqC8Q06C6dTiq
         SVvGK7SMzOHJRw7EJMkKf/eYWLJWM6YGG5G/4Mp+aCI87EGlPnxqoJRqjXigCAOCdHYg
         ok5igvklaBSPdtbn3Ypt8OVc888QBf/m+QbNKnDjZhbp8p3MvMTPRH85Gewbl5azAqJQ
         pe2vXs8zou32hm8T1vbWdY0+M2Ta8o6JJyAHq6ysQgaisqxtSPuAG6yafDlCETlXGe0h
         +7ou2Ap5ewykQZtOUpLKDxZzPkhVxPHcOl50jehpzDmypQa2qxQ3dbkRzOb474Rl1YGh
         9ldA==
X-Forwarded-Encrypted: i=1; AFNElJ/c4dPXh4d7GV4zDaGhgkHP/ichWaBFVXCtVhKW+qw+96uYp9g+UDtl3H0jLeno2TbwxIhDniOkAT/FHscl@vger.kernel.org
X-Gm-Message-State: AOJu0YzC43WN5FTasLXcsZ/BKomu61HCK2arLTmfXkTwaCqYBqPAcroq
	kZ2L45N5b2iUxtxtiPcZJPbuypLD0h6ekheA1jXlvY2EOq0o9NKIp9N2DrIINmfKiF41EUgTK54
	uy104uBOgpZWXRwL0E7XuwY5pJTLXA/um+2bNRVftlLcsMH+IG2k+PEepH6UGqeZ91mdL
X-Gm-Gg: AeBDieslOrqnF07EuZVf3m7qZAGZf6v84tOUMomn5MsGl6Ox4RVqm3Q+Uo1bJYE3dSV
	Xkhx0irgTnrwrHmuB9VA4a+UmEbkQpSwO/ngxt7lt9zU4zf/ZAZtRzthA9uERQ31Immex46BDMm
	FELqy/JoURJU4JRAbXldRG14gLLB5ycQXvyUZZbdn87hk++h4NSh9FXoxnhd5oNtyK4jMGErMZZ
	TZQmBONDyYDeUNSVo9gu2BIn020x/e0PdawXZYYgqaKeBOKkwmcFX6dErta7bS3ZlYLTK+kI6Lm
	EZe1SEBRCf7+4WsZOrPjrWUAhxr2/BB1YJNnJ4un3lbMmVJR/QudUnbvvNJyfU5ceWkBGb05iKQ
	xB5mxkM1oAb2wukIvDeezSFDP52PwsPod4tZ03oeierbaFuD/+6UEPBvRSkAzRPj6cmFHSUMVoF
	gJHLJRzecOl9f2aGn8Xh6ClU8xzbuF9of763O3eF+iraaGyQ==
X-Received: by 2002:a05:6808:d54:b0:467:237e:ba47 with SMTP id 5614622812f47-4799c870d9bmr10161279b6e.1.1776787715731;
        Tue, 21 Apr 2026 09:08:35 -0700 (PDT)
X-Received: by 2002:a05:6808:d54:b0:467:237e:ba47 with SMTP id 5614622812f47-4799c870d9bmr10161245b6e.1.1776787715259;
        Tue, 21 Apr 2026 09:08:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc672sm3869507e87.34.2026.04.21.09.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 09:08:32 -0700 (PDT)
Date: Tue, 21 Apr 2026 19:08:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 0/6] drm/msm: fbdev: Use client buffers
Message-ID: <pcbuciyme6uh7hmduzzykuyacwelope6or5durvddzwfandtvb@wfjyexsjra5x>
References: <20260421125733.209568-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421125733.209568-1-tzimmermann@suse.de>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDE2MCBTYWx0ZWRfXxFd32EB09TI6
 cqc3iFPu0N2IHY4vXbYKvvhA2Q3uPNE+c2Me9vtHr87X7g/3fBRMuNvaCqTd8COudMyPIehH1pP
 VBoAAuYvAWR4NatGNJseAEopOA6oWZitfUe2ywzl8Vi4a/50TWxE9O9y7OoleUa/HNQVK8ncXvF
 naQQVkjDk1XMS66DdfvH4IDM6ts3OBvofDta1UhV5GtCq0lR6p9K0YVEpmbwY6BAeE9E/KYlUzs
 LJjx8T0j6Q3ZfLqjhG6ug6m6MAzjzuKyzacM1onAhR8P0LU7T59G531U8nwOhzIUgpahkbUjqNa
 5mR9P/bahdTQ1m8IL5VLkigdo7EUIFUjajptkv13agsuL8rsQHWmgfg/MXV4amkD6t3YghIOllA
 SlrXXO+Pp/izaW6OHSyMxd8IDCbnFls+Ty6f4Korp0tgqj7UBXkoL1pPq9lGnA/oq/xsJ1e+QKK
 HGvS61DiRpTxE4jXR2Q==
X-Proofpoint-GUID: iNQHSG18-0VpViNgnvRKotNK1DEo977D
X-Authority-Analysis: v=2.4 cv=crWrVV4i c=1 sm=1 tr=0 ts=69e7a104 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=oMqSzAFODtequhd9pCgA:9
 a=CjuIK1q_8ugA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-ORIG-GUID: iNQHSG18-0VpViNgnvRKotNK1DEo977D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604210160
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103970-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D4DA643D2E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 02:51:13PM +0200, Thomas Zimmermann wrote:
> A client buffer holds the DRM framebuffer for an in-kernel DRM
> client. Until now, msm created an internal ad-hoc framebuffer for
> its fbdev emulation, while by-passing the regular interfaces used by
> user-space compositors.

I assume this was somewhat because we supported using the stolen memory
for FB. Support for it has been dropped when we moved to GPUVM.

Rob, would it be possible to get it back at some point?

Thomas, would the series prevent us from using the stolen memory for FB?

> 
> Convert msm's fbdev emulation to use client buffers. Replacing the
> existing code with a client buffer allows for stream-lining msm code
> and later also the fbdev helpers. The new framebuffer will be registered
> against the client's file and will support handles for GEM objects. It
> is then just another framebuffer within the DRM ecosystem.
> 
> Patches 1 and 6 change visibility of msm_framebuffer_init() during the
> refactoring. It is the easiest way to refactor the fbdev probe helper.
> 
> Patch 2 and 3 inline the fb allocation code into the fbdev-probe helper
> and fix it up a bit.
> 
> From there patches 4 and 5 convert fbdev buffer allocation to common
> DRM helpes and client buffers.
> 
> If all fbdev emulation helpers can be converted to client buffers, the
> emulation's whole framebuffer handling could possibly be moved into
> shared helpers.
> 
> Thomas Zimmermann (6):
>   drm/msm: Do not declare msm_framebuffer_init() as static
>   drm/msm: fbdev: Inline msm_alloc_stolen_fb()
>   drm/msm: fbdev: Fix error reporting
>   drm/msm: fbdev: Calculate buffer geometry with format helpers
>   drm/msm: fbdev: Use a DRM client buffer
>   drm/msm: Make msm_framebuffer_init() an internal interface again
> 
>  drivers/gpu/drm/msm/msm_drv.h   |  9 ---
>  drivers/gpu/drm/msm/msm_fb.c    | 98 +++++++++------------------------
>  drivers/gpu/drm/msm/msm_fbdev.c | 85 +++++++++++++++++++---------
>  3 files changed, 85 insertions(+), 107 deletions(-)
> 
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry

