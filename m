Return-Path: <linux-arm-msm+bounces-98256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LB4GVWXuWkJKwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 19:03:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C385E2B0854
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 19:03:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B490431B87C8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 17:45:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EDE32E2663;
	Tue, 17 Mar 2026 17:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nDpdg9LH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cZgC8E0k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD337198E91
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 17:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773769532; cv=none; b=AeSaKYWtAiXe8eACs+ppHSZFUAkyQZT2V7dXgTUWQoGjhBxXrU3YPC1KQghB8+GgnuFLPESHHLg0aUB/oiIH4qCE7ib9qqWBnQTwwTbrsOBxUUcZajg/criPCprBW8Da73+Qgyz9+Uq4SfEe//rnWKPXznS/N5gPfWoiTJg6JmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773769532; c=relaxed/simple;
	bh=iaNWFVFLm7vozirDxvC9jTtq6cozMvhQkxb9+GR6/UM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wfn6v6iyUlvkiNS1bsOOT1C28qHHvRyrOERGqfvoB+jrRVktSROkpVSwqeDGwCosA0efOUxcJtgHmmNSiCPYktZlRJLJpMU31PrDsDdP9KCko8/jMbixXHZFf/EyZ/qCTphclsC1+zV/PUvgfQALflyb+PpXofwY/0d8EfkCff4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nDpdg9LH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cZgC8E0k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HEHown2188299
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 17:45:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sve/0XHVXakpPoL6EEAxjWXr
	d/xyFE0tTXS0gGte2N0=; b=nDpdg9LH6CceQx9RwAn5zn9AU+Xt2QzpPN2MYRF5
	3INjPlpOOCTH1DZA3EqWY0MRvluGeq6/EnccZEF2Ojmbx7ixmZOmQYNCBFPdhN2S
	Mou7xh+70D3aGseV2PFHlzu5pJrdGNxr/ioc+/iT6tFdrg+cmA2DyPoIXH34ZgkQ
	uPMO+Rumub2H3y102PI5ZXEzxqsdkz2kAXl0LwNxh7OrVz+TXFXuxZZ8MFMSFvMR
	w3th+G25fSoxgTOQIo1BqBaFch+QknnSd3VjhohHtf8zypOGIyK9bIlLraiUPZP9
	xlZj1snVyEJQ0I15FKhOT/qHeYeR2L/Sfn94N95vx99K1Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy8kjrv3j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 17:45:29 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89c4b4ca093so175301976d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 10:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773769529; x=1774374329; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sve/0XHVXakpPoL6EEAxjWXrd/xyFE0tTXS0gGte2N0=;
        b=cZgC8E0kxbXx9PkYzpJ6eoajlwSWImnooQlAZCTTMJ8UdSF0e6mygvde36NtoPcwUb
         kCVZ7XLWjPCW0EnWhN0R2rMSU61JRsJxXogeNoinM5M9KDeOAKLXq7hwb1OEG11FYPtV
         Pkvlp3eR2fW17WGZC+yBZERF7vxfR/POjGO17wgWvsV7LjnPpEbfgYl4nErDqLxJD/bd
         ZeEpOnM2RKc0VTKAGI1XTq1YWLN5csG1Noiv0Z/ytd3EkfWEHr5N8552KfaAl4LVQegL
         J4DKs9JqNBDAP7vcGUa/dNj5pbHaig46VTm4pavA5HtH1BCtPJZdUlxgAqeE7cp9Z3sl
         fxfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773769529; x=1774374329;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sve/0XHVXakpPoL6EEAxjWXrd/xyFE0tTXS0gGte2N0=;
        b=WdBqF/0Twcjbukx9Vn5pcY6cUr5o91JuOFOfzHv24/eIb6AvO3b8Ug0PFF6zEPs5Ke
         cxq3fhLW8wuNPHGx1l0vvjWAOzXyXKeaNXuJHIapTIglfa5ZlPCuEmP5F2wcu7d/BKzl
         l+uVoy7gxngtDfcEf6j9aj/bOVuoiM51P/XHjitI2NjvrNlfH8xSNbsrtkdSXFBWCl2N
         8KC3mkr9dUKCWMcJMkExMhjQ9TBHKvt+Km/mIJMn4mHx4f7YiswatOdp7IGCdtaY2hJ3
         7P8rlPpwlgeK/ZVJPbHRsKWkv7H15n83VOAektYNrAZBtEn8yUyoi9+YGkwdjqtfCv1a
         pefw==
X-Forwarded-Encrypted: i=1; AJvYcCXifuj63paNGllmSaUBmcWrovQTvlz44P2Zd4EWCkKeoAbGEwB0aQUkggGC59MfpEGfQbuRuFTpBE1ZIzm+@vger.kernel.org
X-Gm-Message-State: AOJu0Yx505OWY8ysB9Awe/A0FidHvji5P8pMO2L6YiDV5+E5rVuoNwE+
	7qpcP0bmoO6P8nHn2W2JnAf1LYlkWVjpbFqfmagUjPOkiUmWiwOjN9kIMNduPTVDEYg/x2RPxmT
	Omoxr50BVcJXBKO4+mfr9FbXq7UuAXPEfsACMPOWSPTKNCJn+m/H5mIIbCwiAwlde6rVJ
X-Gm-Gg: ATEYQzwMsvACpF4a7Po4tN4ZQDujuufq0cYosj0xT0lwBwSP+B20QyYXXHtPTiA6FQr
	0Ic27b1zfW+3OSWa0ECgnZoodcPVo/NqDsxxsSsdjCE69u59HCtgjQlKCdwbiChRE5Xx8QGbG1q
	VLKnB6oyuEwFuiK9ww3J+U0wp5IbZ+q8YIIiutoZnfyn/oTB0El0ggO2oqRnfTIDWqbS2bwcoYb
	WgwKub3L4+6vLxXMGt4zAGxIaqam1CpwlrXHIQUc8ds2wfYd2Dj/LXJVAV3HyETsEKFcM4opv1u
	tCxepUZcEjUEmUPXpEiOzuyLHv23pFiaL0UMfmkKv9uy7TYd/bbqOSyGfgnCUR0w3nzpu0EBd6i
	qQTHBrvfHOUDvwh3zrDwwtVChyAkAr0kwlvbUcppVpLPT/GEUpZplJvDolcns6ad2IsuhkRVk/l
	MTgJGQkBNUrLba2ANzrAD8t08EzH4pNbVLOQ4=
X-Received: by 2002:a05:620a:19a9:b0:8cd:8320:3359 with SMTP id af79cd13be357-8cfad1e0b92mr60711585a.9.1773769528714;
        Tue, 17 Mar 2026 10:45:28 -0700 (PDT)
X-Received: by 2002:a05:620a:19a9:b0:8cd:8320:3359 with SMTP id af79cd13be357-8cfad1e0b92mr60702685a.9.1773769528096;
        Tue, 17 Mar 2026 10:45:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bd517df25sm1088111fa.15.2026.03.17.10.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 10:45:26 -0700 (PDT)
Date: Tue, 17 Mar 2026 19:45:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        regressions@lists.linux.dev
Subject: Re: [PATCH v2] drm/msm/disp/dpu: add merge3d support for sc7280
Message-ID: <7tcmh65lhy7t452mwkiv37pxqwh6dbuh6voelaag6kph7tfr65@cskiwvoafbdy>
References: <20260101-4k-v2-1-712ae3c1f816@oss.qualcomm.com>
 <DH1IKLU0YZYU.2SW4WYO7H3H4R@fairphone.com>
 <tbi5mwg4jt5scvr76lpzpvi5zj3kn3entoorsd4dior4g23czd@xtobadslhfrz>
 <DH437ESQRIAF.2336WF7XZBTI@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DH437ESQRIAF.2336WF7XZBTI@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDE1NiBTYWx0ZWRfX2yCqnOhG2bEC
 ns875Mv08aRTna/jMM+2cs7TGKPi9SaKxgljMEL+hZ7Ngv3qo75TX6F/VyaxF8i+djE2ZA9GXZb
 XT6MPze0atxvBLivx2sJI6FJ4Rx4cidS4c3Iso7YSeqvvM+jjfoQVhCO6v/gYEJevl1t7XmbsYb
 1wu34XdZH84Q9XJBtGALbgUnvjSYtAfwdB4u4WrCoBunXHDV6P1pZ7pu9KwI+vBuVJRA67aBGRW
 LTVnkCaC2Q4eHa/Bcsd1L1ByTXkeOgde3r9iFEUYclsjlYpn0EiGXOSU7Fwui9STLAtY1P2bojs
 rKbm3vPYegdbHhQz1VlNXmM3SdY4PI6jH6WiK23Hrn76RYKHT2l3qKOTjCoDC5MDaoF1u4gMeCL
 X+vPpCqH9Xm25ZfjK1bfAmf402o56etfhrzd2CsOTf7YfPYPZt4L3hy7OSxEKanAub/Lsd0t4Pz
 DIeIrKcmFUUzLxoJ5tg==
X-Authority-Analysis: v=2.4 cv=P8I3RyAu c=1 sm=1 tr=0 ts=69b99339 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=xNf9USuDAAAA:8
 a=EUspDBNiAAAA:8 a=WX5Q9rlaD-dN8u3Ux8UA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: 38b-xXyEAIQxUJRJgIysNEckUw5Havf3
X-Proofpoint-GUID: 38b-xXyEAIQxUJRJgIysNEckUw5Havf3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_04,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170156
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98256-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com,vger.kernel.org,lists.freedesktop.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C385E2B0854
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 10:08:47AM +0100, Luca Weiss wrote:
> Hi Dmitry,
> 
> On Fri Mar 13, 2026 at 6:14 PM CET, Dmitry Baryshkov wrote:
> > On Fri, Mar 13, 2026 at 09:33:18AM +0100, Luca Weiss wrote:
> >> Hi Mahadevan,
> >> 
> >> On Thu Jan 1, 2026 at 6:04 AM CET, Mahadevan P wrote:
> >> > On SC7280 targets, display modes with a width greater than the
> >> > max_mixer_width (2400) are rejected during mode validation when
> >> > merge3d is disabled. This limitation exists because, without a
> >> > 3D merge block, two layer mixers cannot be combined(non-DSC interface),
> >> > preventing large layers from being split across mixers. As a result,
> >> > higher resolution modes cannot be supported.
> >> >
> >> > Enable merge3d support on SC7280 to allow combining streams from
> >> > two layer mixers into a single non-DSC interface. This capability
> >> > removes the width restriction and enables buffer sizes beyond the
> >> > 2400-pixel limit.
> >> >
> >> > Fixes: 591e34a091d1 ("drm/msm/disp/dpu1: add support for display for SC7280 target")
> >> > Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> >> 
> >> This patch is causing display regression on QCM6490 fairphone-fp5.
> >> 
> >> With this patch in 7.0-rc3 (or 6.18.16) there's just pink noise on the
> >> screen. When reverting this patch everything becomes working again.
> >> 
> >> See also https://salsa.debian.org/Mobian-team/devices/kernels/qcom-linux/-/issues/41
> >> 
> >> @Dmitry: Can we revert this for later 7.0-rc, in case it's not fixed
> >> quickly?
> >
> > Could you please provide the resource allocation parts of
> > debugfs/dri/0/state for both working and non-working cases?
> 
> Working (patch reverted)
> 
> resource mapping:
>         pingpong=# # 68 # - - - - - - - - - 
>         mixer=# - 68 # - - - - 
>         ctl=68 # # # - - - - 
>         dspp=# - - - - - - - 
>         dsc=68 - - - - - - - 
>         cdm=# 
>         sspp=# - - - - - - - # # # - - - - - 
>         cwb=- - - - 
> 
> 
> Broken (with the patch)
> 
> resource mapping:
>         pingpong=# # 68 68 - - - - - - - - - 
>         mixer=# - 68 68 - - - - 
>         ctl=68 # # # - - - - 
>         dspp=# - - - - - - - 
>         dsc=68 - - - - - - - 
>         cdm=# 
>         sspp=# - - - - - - - # # # - - - - - 
>         cwb=- - - - 

As we have identified that the issue is what downstream calls
DUALPIPE_3DMERGE_DSC topology, could you please also check several
things (with the broken kernel):

- What is being returned by dpu_encoder_helper_get_3d_blend_mode() (in
  the broken config)?

- If there is any difference in working and broken configs between
  values being passed to (and programmed to the DSC) in
  dpu_encoder_prep_dsc() ?

- The same question for pclk calculation in dsi_host.c

-- 
With best wishes
Dmitry

