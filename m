Return-Path: <linux-arm-msm+bounces-102839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OE56MXbl2mn26wgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 02:21:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1B53E2229
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 02:21:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B3453300F531
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 00:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48EA513D8B1;
	Sun, 12 Apr 2026 00:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LQqRyRml";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a+7294/K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182771A2C04
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Apr 2026 00:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775953241; cv=none; b=AtTcZkZnRsJe2KIF2nA++PgSifXIzYQK/bKuRmz9yUjUnjeNWqZ9flgfG9FFtVh0cPTrUQiAr9IJOFr10ux/ewoYBrslC7WTvKFMnNaQRut1KQhgLwY9CuF5pyn6nGPkELdI54/NE/F54b71aSBwHZOvHBlBRwjMD/MUji2MjKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775953241; c=relaxed/simple;
	bh=GaX9x9w4NdKJNuiYhk8MaIfH8Bc31FstaU7BWMP27wU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I6y6ehewqHakuT8wp541YtmldY6aHrQmdhfaqPBZZDzb/HjF3zTFyl+cijwlJqRxzKZvMB+QrHCMfX99sNSasMTFxECA0lTWl8z8696ltSzYRsE9Q2m0gfs9p7CewFtLkRpGHbxt4T84jn+r6bKF8fsrM7qHy5EdwPRM4Z0/eIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LQqRyRml; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a+7294/K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63BMSc3B2858132
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Apr 2026 00:20:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=38k/XTq7kKCBw+bFrD6wXO/P
	0rbeifQeFp/yj6jZ2YM=; b=LQqRyRmlOhVITTnkio20iiVY/SuEJAiXpqhbkHqU
	8qdZqog0MUFhcpL9ibpAEeQxkdsEwTInKXnr/iRhnNsKjAm0VTmiv2pqIgy/7TIF
	Y5V3gxKWYyYCyaUvYrFbfSiu/JOH8zvs0KDZBwgaKSqLUiuD2I++12/TBqZiynJC
	kOvYDuwK9QzJA0St+SJQ9ObJOByq0OEmxSjxI9/pGfNRgr6mH1nuGowCM3T2CCTT
	G61LSNiRMnv4gZh6i0Wd2VlJ6/tCZBu/Q/L3B4GNtvXAYbmPr1uTiIKxtXngCOIX
	OTSqnObic0rPMI4ZUn5UugfFHV+8Hdz+HfqQXYmgT9LR6g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dff2b9hs9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Apr 2026 00:20:39 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d812c898cso85546351cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 17:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775953238; x=1776558038; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=38k/XTq7kKCBw+bFrD6wXO/P0rbeifQeFp/yj6jZ2YM=;
        b=a+7294/KSX6jsOeKAOUWYaIwNSH6PrLKgHW0ZRj2Ch+MFQlW6hOZlGIx2qRCaBaGya
         eb1lZBnjuFo1JbvGzSN5gaimL84tTLuaFAVKCUjj2OrB8Ei+imjVAr/TY52+utzEyLfD
         oq8y4RWR1AUHY194G67kt5pY8/Fmj0ooU/EZTzqV93y53h2cX0UuLR75BKVE4IOCwXQ/
         MOehmcl8f+elILVkCw2File/fqGmIlPry6Gf96CFBnql0kNFdDZLtvPDSretBD98SsDE
         E6qTMTyu+feOWyk1jNAzJ9E/EE8wyG3A4ROZ1YvrWnc8aAE2ALnMd+eV8pC9SFjho9q2
         HNrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775953238; x=1776558038;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=38k/XTq7kKCBw+bFrD6wXO/P0rbeifQeFp/yj6jZ2YM=;
        b=YyyFVcJOjDiy9disQEDE9hv4rdRbgNE2eUxE5JMKaex0mVx/WfoDOuDSVXHmHWdZ5+
         LuzlSkpUCLRIoX7Tl3LtKWWyCKLuzCT2gmELyzhZfH14Yl9coZAZbmG7PLUJ1yeJ3Rg1
         /qbdUIIOMAl5/F2f33CClFeyb5zLuo4EmMrWshJKkqTeVuoucxWLSwYd/y9wxPDlzxBQ
         gpHrd73OKFNsJsY1q/Dr0gcEniA/ljDhOq1RrRDWWER01cvey3s55cTDhzn3vAG2QBQI
         WT6JWDHPgO0//j66DeOU3/1Ez/KfHd8zGXwMY5CQpG0twfQF1aJNZOF/NDEkiTqpppE1
         zvtg==
X-Forwarded-Encrypted: i=1; AJvYcCVUwjUmMFGiYOjB9quxZ+LOlDEI17WTcEEwu2bxZhJbichucG3HcyTQtN9JQRqyrGza5fx8xLEi5+alusec@vger.kernel.org
X-Gm-Message-State: AOJu0YyIMTwk7GeSkpz25N2yHZ08Xik3u0HkI7wl6aZxBiL7Le+79yTt
	Gb0RR/IA7slc7ASmh3Xmn2eyVXRRW/KM+/QWRtYLUluYNLlpqEHrgOgDN3U4wbioxL4gLmGiZq6
	rjsySHx9R7smN1zB/fz18QJSFp+hhED0FfpoxTBmH/kmi4RlJwT4Ycz40+Jj+hfdbW3yp
X-Gm-Gg: AeBDievA7uobcJF8OTTCzrz9aeoyL68UiEHlndxJRWxNoHPlwmJZFMeOk1Ej76TkaEC
	ocNjUpGuDJwLsRJD2tPV0N154tv06sdmWOUFbDU+Wjr/lUno4MTjcffRARmSraEdXzn9ET3blTa
	ClwVQH4zhQ7YObJfnt9p84/TfDlXktsszdpqwxgg97bcjvnB4ee3c6humiJif6LyJC5R65Z0/8W
	nCnH8pONKrJ3AwDKT8otvpgs+ATjBx6xr/ZWvHLW2DMUIpFoP5LHH8OeYbccuYGP/GcF9XcAEqf
	b1j7I7nQLjI4MHBNGkmAOG8KvEVdvzJSXG2Q7FxH/prRtBCePvSkE3yhBbx89EqL7ZQkEWFDTgp
	RMaD+Ht1zBWebQLZDP2yuRlGJxs6vONTNy0mhb9sRXhL1u2jITHSLC+t4FLrRWAWWozWhgOfJYe
	+YpYYl7m18jVLNkA5KyJj7//BPyHeUKKvprcE=
X-Received: by 2002:a05:622a:998:b0:50d:830a:4213 with SMTP id d75a77b69052e-50dd5b2ef3dmr137656591cf.6.1775953238311;
        Sat, 11 Apr 2026 17:20:38 -0700 (PDT)
X-Received: by 2002:a05:622a:998:b0:50d:830a:4213 with SMTP id d75a77b69052e-50dd5b2ef3dmr137656291cf.6.1775953237855;
        Sat, 11 Apr 2026 17:20:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eeee1201sm1642279e87.54.2026.04.11.17.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 17:20:36 -0700 (PDT)
Date: Sun, 12 Apr 2026 03:20:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v4 03/39] drm/msm/dp: break up dp_display_enable into two
 parts
Message-ID: <b5uajle5nbjziwoxjpxrdog277acn7xpkl6kaeydjuwf3t5jkl@opvkfwursb43>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-3-b20518dea8de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410-msm-dp-mst-v4-3-b20518dea8de@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEyMDAwMCBTYWx0ZWRfX6kANttXmpELj
 3j66Ql3gd9HiLg0JzwAk6FaIkHuARrMsYbnO4MJBz2uQjxMK7pnnzwAEd0e8C9go68xJdz9oOtP
 +1A/ikprDUSpaPI4ktpXMEqAn6bVv4/PdbY1+xcJW7cpUsO8z8MIxZN11qKHBjNE3ZfMrrgMx8K
 i1PwJvhnRaWwV/2R4IfzINp40rdtmAV2mdmEapWugeBuZm5m6nPn3Sn2McsSsAMYk0xGefskQnw
 6CLDo6XU5dhd6KlRN1UzzpQApnB5xA4T8ywGR/12jkKbgG3AFPzFM+oe3evLLbwmnxJGPYlJrWf
 Aa65mcMkpuLkauHOtxCwFr+ONa6ifYPqlcLsXpnMEWpan8bM3hTp9od6ELYv9J2vUbb1ph5nxZR
 7Kk7jmI9OhhdOT1hsnFgeZ3aA5gER7E9j9ZjIHjFEFiZEJoUSzsoU4FJcsZAcJhALteYidU9LmF
 dbJdVzHSe3uDehGHJPQ==
X-Proofpoint-GUID: g9_QdVzlHnY1O4PKWXjic9cLdI75UfPW
X-Proofpoint-ORIG-GUID: g9_QdVzlHnY1O4PKWXjic9cLdI75UfPW
X-Authority-Analysis: v=2.4 cv=W4gIkxWk c=1 sm=1 tr=0 ts=69dae557 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=o24zTyMAPkfF8K49h8IA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_07,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604120000
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102839-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1E1B53E2229
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 05:33:38PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> dp_display_enable() currently re-trains the link if needed and then
> enables the pixel clock, programs the controller to start sending the
> pixel stream. Split these two parts into prepare/enable APIs, to support
> MST bridges_enable insert the MST payloads funcs between enable
> stream_clks and program register.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    |  54 ++++++++++++-------
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |   3 +-
>  drivers/gpu/drm/msm/dp/dp_display.c | 105 +++++++++++++++++++++++-------------
>  3 files changed, 106 insertions(+), 56 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index e9f0b96c3ebd..5ecbc83c3838 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -622,7 +622,40 @@ static int msm_dp_display_set_mode(struct msm_dp *msm_dp_display,
>  	return 0;
>  }
>  
> -static int msm_dp_display_enable(struct msm_dp_display_private *dp, bool force_link_train)
> +static int msm_dp_display_prepare(struct msm_dp_display_private *dp)

After going through the patches, msm_dp_display_prepare() ->
prepare_link.

> +{
> +	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
> +	int rc = 0;
> +	bool force_link_train = false;
> +

-- 
With best wishes
Dmitry

