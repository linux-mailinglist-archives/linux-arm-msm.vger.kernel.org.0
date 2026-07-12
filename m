Return-Path: <linux-arm-msm+bounces-118542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4FcuAaZpU2q2agMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 12:17:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5452C744579
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 12:17:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="TcdywV/v";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jOTkR+Gu;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118542-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118542-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 27F24300B626
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 10:17:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B891C38E106;
	Sun, 12 Jul 2026 10:17:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5500B371056
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 10:17:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783851426; cv=none; b=M4C98KPW1AZRvCVfwnKQ7U7xzcMyxxfYFLyz9ruXkbxaNnkMTEIxH2aEt3NrADfvB0fMf0OTpaMzyzRcCBvK8hk/DcoP7s8V8sNk8TnYp7hDSlSGLVcUIJEsBTuYpGIkLHx7nLT4bM1oenkAl6tSdSQg/pCro3WDRD1wYhCxl7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783851426; c=relaxed/simple;
	bh=8/nAhx0U9lPfJ/3UZCa7116qc8bk6+9oalXt7noDLe8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VFGppFRk5lj3nV2iP4EgQvKFpQ+y8kR0eCRiZ2gdBkdAu9ts2TCzbdibyVjG3Bxvylhf2bD3XuLZPH4Geu5mFfurhjO1QGdlGkC9gYhE5TTRDRJ+zrOaBv2eEbQnoKp/6Zz3Ic4fid0jSVFeavARpspH4/VUzIqWo84t7EFir9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TcdywV/v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jOTkR+Gu; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66C7SGl91857801
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 10:17:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kTvxjps4eROawjZBgxnV201Y
	dE2QzA2QQ1k2r2UcRA4=; b=TcdywV/vnEEIA006FwxTQ6S1QW+0Esa9QDL8jdxA
	y2ypJsBk27z4Km/8mR1fUI8TWQAPIEt/04kdeg+x8D1b2+PPzxNGHq7rZ9wm2JtD
	T5RrVyACmTP6PVmukRT4mgmJo7KFf737RO7GwYWhCJVyRjYXnc3aM6TW2Sg3Nlgu
	zQHnI9b5krQqAoMXbiCI2FFo9XyWTjUGaYQd1znq46B802odlXPnkVV75D6WrYLh
	XlfeDeBTWaQFuGwlTmeBKEMgGaAp+N+mWPQlhD9iptSzUSlImHP8gKejVC5t1n+T
	z1xZMvpbfeihXI+1eyomiM0wsDZK5tf0ziGWLOZSzNXqkA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbekcjhjg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 10:17:04 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5bfddfc1088so13548e0c.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 03:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783851423; x=1784456223; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kTvxjps4eROawjZBgxnV201YdE2QzA2QQ1k2r2UcRA4=;
        b=jOTkR+GuUoiSwbNT5AZEkJmGjlF15QfKtLFZdaz49yIl1XE8JKB2HAe4/av1rbMEeB
         /nePF3b/ymansWwr6+PlOcZqU2yMYYfW69IXCgk2LbtDID+uHsEr8TEv+rmKS91gI06W
         PmaSb374xcSao67qc1PGx2JMIiJxhl8adWFg4i/Dazubx1o4NDyuodXEFQpm9kccp0jT
         WRenGvZPjIM4z5AxpoTpztmDI3reWOIYXvGqWOtBfXniIG1jdZDBHSfDjA/HwrRAltyT
         3HtbgztYOfPme9prC4xHVnucdAFrfqjTMj1NZk3uJnDSHgx4czXW1d4tk/HVp2m3Te/d
         PMOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783851423; x=1784456223;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kTvxjps4eROawjZBgxnV201YdE2QzA2QQ1k2r2UcRA4=;
        b=INKkKQfgIqoOBIGBun8ucYJPNHnr9eqExunEpZY7pOKIYOaWVzoeVaQiN23LKPML49
         BTYN643y5Kebnt1O6/+MRo30KieODq7h7J+tuIkB7OcpqhV5PWsf/hNUpQHFhwqTzVgL
         RnEVLIWQI68awVlXIcHCPjtnItBW2FKbQmZQlSJWXoejkaOzDjetNbK56dKi61tcr/7p
         Zd2N7yMu84F0GCyfJud6Eo3ShX/46mmYFxIIJN8S6NAZZhCMT3O1fc3PBNpiXDyYb7dX
         y++cD3MIyLbG9Y0xXpTjflvH1R3KcHvIPuC+vYzt3jsL5VyztZ/4FTFJLyQXaXTfzxvv
         k4zg==
X-Forwarded-Encrypted: i=1; AHgh+Rq02Ck8KAKeRiIc6ebosqJkoZYLva3P0WIZdc5A0hA7X6I82THvsUe79sP0T00D8UHi72M4sqJtshitBUm8@vger.kernel.org
X-Gm-Message-State: AOJu0YzshfrhChwsc4B8vY3SiPYg9DqswNDslhO2axLQ4K6ElwYIXD5G
	k0AQtksynI+nFlIwPIvn9yH8DT2d2hpgtUmxqmC20T6lL9/bVeu77QP1uN/FHVvRtmDyz4UXi39
	wIQp0ARp9GVs7072Kig48FpGnj2KeAkk9qk3nw9NbXLivR3etloTNZWg2tB6EZmfng8eb
X-Gm-Gg: AfdE7cmZYKe81dtrw+qNh8iN3p2Mcr+QT8r1J8/p3VJGksjdZoRwljJS6ylmuPzD9sL
	g12tSgiWsIrJUaMcPpl49lOQouHiG1bKvJLuxnMvVg7kr1vlUjoPyvMLO0ZNJuF24KN4k2h/8bD
	RvJcDGhl/EgbjMtqgeED6z3YN31fVTsY40HqoG4hA8d5gYeAj3otIVrZl1SAU2dP2x9r1LBRpiY
	2Msi0fJrDj2JOjjAaOEBrFgIhOeJ1hZoHGOPiQpT/EPtT7p2c2DN2Pz5q6N4ZBTX/pnrMn3r47M
	sA1qSjpYTktfZyswyC45g/IBXTcUnQcZFbmf2pmWd/Ctn7g0kzdjGRrf9wRrUYW7JQnzmSn4o6a
	FQOkGPj5nyCVlQYFqwqjA24ilW/b4B1uFf5hdOSKVVYDUZS9CT1NJ9EDvzq3NWT9OHHn69hf6yF
	GILQkIu8MXxkLSwMMnmcTKOx8n
X-Received: by 2002:a05:6122:218f:b0:5bd:faa8:74e1 with SMTP id 71dfb90a1353d-5bfbf4da3bcmr2919340e0c.13.1783851423191;
        Sun, 12 Jul 2026 03:17:03 -0700 (PDT)
X-Received: by 2002:a05:6122:218f:b0:5bd:faa8:74e1 with SMTP id 71dfb90a1353d-5bfbf4da3bcmr2919310e0c.13.1783851422514;
        Sun, 12 Jul 2026 03:17:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c84b97553sm22237151fa.33.2026.07.12.03.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 03:17:00 -0700 (PDT)
Date: Sun, 12 Jul 2026 13:16:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev,
        Kumar Anurag <kumar.singh@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>
Cc: dri-devel@lists.freedesktop.org, Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        linux-sound@vger.kernel.org
Subject: Re: [PATCH v1] drm/msm/dp: return 0 from audio_prepare when cable is
 disconnected
Message-ID: <5ixuxbgngzobl5c5fsyahdsouohwuykoat7s4hy6sczrye7vwf@rj7nmn7x3c56>
References: <20260616151252.3599089-2-kumar.singh@oss.qualcomm.com>
 <20260616152536.D81FB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616152536.D81FB1F000E9@smtp.kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDEwNiBTYWx0ZWRfXxXlyDJn3rc84
 R/6fg3Wywyy12KzS/ni04/OeHBgpD2JKR42aH7kWscRUDH86/CBJBFEslUjnA1ceb1Drfl4WkR2
 aD4pwyGVO4VcbG8gFco8BqVoplQrJMoi9yVMzypgrBtZbpM/FNpT8n66+E3KU1VUjyf1ftZps1w
 8tJlzLHp+PiIS0ASa3CMA8z6yldC9rbtrP/ATY8m+JhSxMxm1BV/LhQ++P0ALc0Q+Ozfypoxq42
 u/LiFGeaJwymny1l4mXELmucYuOfmYxcpdo1Mpq6p7mXkT5ZJf5ph7JCoiuQS78mHK5vXOPKhbL
 fM19/hFCsGvrCuomB90LfbPIBvvl1Z5QKuyQvCSKP59yp9Wo+xTxikl+CjehmFSiCzcMHXL/z/b
 O+I/zyFKYq1WkWtUA55RxvVzsMSbXHGf55mf+GCL0HglcYGCVt1EC+b4vq6jj4otaKXBrkaIM89
 Tt3YGENkQX2qPXmydxA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDEwNiBTYWx0ZWRfX4DXigDw8O6AA
 QotAvPR33ZjwW6kHuGsoSxp2t+OPY2a9Rx/U8RBb3s+AgAZtdmOpP6AyMaODMyKvlglBPd1Hf4F
 aQQL7A2GK024Pi75a1dlEWWa2EmKkkA=
X-Proofpoint-GUID: oq_Gf9Qq3TN78XsoRWdH5B3p6uNTc0a0
X-Authority-Analysis: v=2.4 cv=XNsAjwhE c=1 sm=1 tr=0 ts=6a5369a0 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=8zdHjTvXFIs7SsKF2MMA:9 a=CjuIK1q_8ugA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: oq_Gf9Qq3TN78XsoRWdH5B3p6uNTc0a0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120106
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118542-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sashiko-reviews@lists.linux.dev,m:kumar.singh@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:srinivas.kandagatla@oss.qualcomm.com,m:broonie@kernel.org,m:dri-devel@lists.freedesktop.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:lgirdwood@gmail.com,m:linux-sound@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[lists.linux.dev,oss.qualcomm.com,gmail.com,ffwll.ch,kernel.org];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,linux.dev,gmail.com,poorly.run,somainline.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5452C744579

On Tue, Jun 16, 2026 at 03:25:36PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> New issues:
> - [High] Returning success (0) from `msm_dp_audio_prepare` when the display is disconnected causes silent audio failures upon hotplug and NoC errors due to unclocked DSP hardware access.
> 
> Pre-existing issues:
> - [High] Race condition between `msm_dp_audio_prepare` and `msm_dp_display_disable` causes unclocked MMIO accesses.
> --
> 
> commit bfb65364e66313dc1385a42e09172f44a1e1fbd1
> Author: Kumar Anurag <kumar.singh@oss.qualcomm.com>
> 
> drm/msm/dp: return 0 from audio_prepare when cable is disconnected
> 
> PipeWire treats a non-zero return from prepare as fatal, marking the
> DP audio device as a dummy sink when the cable is unplugged.
> 
> > The active_stream_cnt guard already prevents any unclocked hardware access,
> > so return success instead of -EINVAL when the link is not active.
> 
> [Severity: High]
> Is this commit message accurate for the upstream tree? There doesn't appear
> to be an active_stream_cnt guard in the mainline driver. Without this guard,
> will the DSP push data to powered-off, unclocked DP hardware and cause NoC
> errors?

$ git describe
v7.2-rc2-4669-gb9810cd75b9f
$ git grep active_stream_cnt
$

Which tree has this commit message been based on?

> 
> > diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
> > index 41018e82efa10..df222943ae57f 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_audio.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_audio.c
> > @@ -284,10 +284,8 @@ int msm_dp_audio_prepare(struct drm_bridge *bridge,
> >  	 * such cases check for connection status and bail out if not
> >  	 * connected.
> >  	 */
> > -	if (!msm_dp_display->power_on) {
> > -		rc = -EINVAL;
> > +	if (!msm_dp_display->power_on)
> >  		goto end;
> 
> [Severity: High]
> Does returning 0 here trick the ALSA/ASoC framework into marking the stream
> as successfully prepared?
> 
> If the stream is marked RUNNING, ALSA won't re-invoke prepare() when the
> display is later connected. Could this regression result in silent playback
> because the DP hardware is never actually configured?
> 
> [Severity: High]
> This is a pre-existing issue, but does this lockless check of power_on
> race with msm_dp_display_disable()?
> 
> If msm_dp_display_disable() runs concurrently (e.g., from a hotplug interrupt)
> immediately after this check but before audio_enabled is set to true, it will
> skip waiting and disable the DP link and clocks.
> 
> When msm_dp_audio_prepare() resumes, it will call msm_dp_audio_setup_sdp() and
> attempt MMIO operations on unclocked DP audio registers. Could this lead to a
> synchronous external abort?

I'd agree with Sashiko here. Do we guard against the unlocked access? Or
how do we ensure that the stream will be prepared later?

I think this needs to be fixed on the other side of the pipe. Do we need
to define a special prepare error code, which means "working, but not
available now" and make PulseAudio / PipeWire handle those errors
specially? How is it solved for other platforms? I don't think that
msm/dp is unique here.

Mark, would you have any particular recommendations?

-- 
With best wishes
Dmitry

