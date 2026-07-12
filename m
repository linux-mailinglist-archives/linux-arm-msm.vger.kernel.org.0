Return-Path: <linux-arm-msm+bounces-118548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PJHZGAVzU2o3bAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 12:57:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A4D744703
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 12:57:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=PivHYZLu;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=K1qASHNA;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118548-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118548-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CD773300C244
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 10:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24BA239A040;
	Sun, 12 Jul 2026 10:57:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7229306B1B
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 10:57:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783853826; cv=none; b=Ap6TGfyZg2ZIpcS41sA49OpUhQLmTC7tcK/9OOiEnLOOvd22TV8OrJRQ/4U7pbFxv9ZgDmwPDBMR2Z1hXuqPu4EffTlAR5e8Em0Wec/FqBYBV3mioRL68WMogIjtKrw0Cr6HkW8RbqbUSp1C7qEcGL5V9fAtPKGoIDLJpId+YZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783853826; c=relaxed/simple;
	bh=OwMfK6ZCjt8ZnN40TZrvlnUDjZbVnqnG31XPJCpW0SY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GK6+NVmLJU+LIQw+3NMTLFiaxv2dtwB45ghVb0R17fgG9wjI7mMSfVUdGb+4esLmNSU5J1wif2AmIu1ehhQvXBk3vv7MBqycCRdF7bA5KBIOxBY0qykkjcgvebCIf7ERQAST//74LrHxIhWkX22mMxrg21qHHDK7kZ/n468Q1m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PivHYZLu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K1qASHNA; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CAdXHb2390387
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 10:57:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tBa6sEiBydXVWZOOLxPyxODj
	FUcBwp/AoovX00pVO0w=; b=PivHYZLu1uWprgW1eoB58HG5svn53cKX9CFOT9Ra
	DpXOIjfOFNTFYsugwlWIptjpLmaNaSTXEd3czJ/nXmH6RMJj+3yJ4yaDLOre7fwE
	wImX06xb2nsnhzHUig10cmOJhAJ4/dgaVrfIO1AG4AVFKVb3CFgQwCJk0B7plWie
	ID+72F8Zv1lnO7tR+fhprP6PVgn7NcZJXxXJqOiLCwLdYCLL44Qv6sPMIS8wrNf0
	AeUfeOZrUZfD5OOzcoCA9E+3MygWDCnUzPMk9qGU42IoTSqClF5gynN5rTGSS2hd
	P97lk5bHF2ZL/ZbiXZ5tVk6ZZZm7MXmJGTybAYjEXi4D+g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbecgjp02-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 10:57:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1a97644aso30887831cf.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 03:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783853823; x=1784458623; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tBa6sEiBydXVWZOOLxPyxODjFUcBwp/AoovX00pVO0w=;
        b=K1qASHNAC9hq+b4kQopMPYgpZKe/+qdfdqQCEY/lQnIxhF9la+VY4rl22Xp//M+RR+
         O7RGx21ETqO0iOBqTfIp1zs+yu4Opxrt3MWqS4eXuwyaKQujMnj++3brKr3+NfIjvZsf
         8M0zA8Hax3Qlt+BdvcLJ9IeEYBTwP1odRD3cqCx2IYfTFriJOJ84oNleWkRiZ+b80Xl9
         Tg3NCooA4xNU43Pdyghjt4icLvETid7bJJBUPQ31aRySvenGMSijf1DYWJPn2Ks4M9ad
         KbokOyZZX0+EGH3bymI7hvQk9y37tiWmsGrnSuYJ08U+D+YLPAr+uOxDZbp1l3EJRtN5
         ysww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783853823; x=1784458623;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tBa6sEiBydXVWZOOLxPyxODjFUcBwp/AoovX00pVO0w=;
        b=kHVT00yuGvnsY595MEHkw6r+fz7MIkLfxSafG6zeRcbKCvvQ8s6ViabeLnWZOZz6KJ
         RXaX96ECDhBmbLYui10g+NgabRj4ann++4suPjSXt45DMeleqV2GAagHDdlJ+KpaDDpm
         NBWfhWrTi+mjGTwSRnUJYvqUHhLU+nk69BUNvGQFCqVVDyKVAIxnIe7sBwT1EmAX58KW
         vOZ01HvRvakFzfDZO+pcUZb42dPDlLduudT4O6E74tA7Uu6q0LcBu8tjkOBrzWxo89gI
         vbX1y4VmDxBp6USXe31OOfd6LJA2IhnxIXuv+Bb4seE83RM3f2zHjBpxAC1OARQyZjM9
         lvJA==
X-Forwarded-Encrypted: i=1; AHgh+Rrg0jSMvbhuxSWnMXyhmlNxHRQFgbjEXWtdMPrbE7Lv62lninmchuAf0L1swh+80+giFOf5EyEBveFAWII5@vger.kernel.org
X-Gm-Message-State: AOJu0YwHhP3sSHfROS3p9eWvaslQxLf2Mwxs6PIk8PfPy+lesstXKE3q
	kycOjyClBLV6bipN6kxSnqaBL/VgX6yj3ovRb3xzlkV6MAxLJSVFMnv1/tjXjlA3kKa5V+6D2rv
	/a+klQa4n3I16CzlR0S0AYj7G9GGuQOBqzhj+/aLxfT72/SwKpY9KQYiQY8e+6mPoUi/Q
X-Gm-Gg: AfdE7ckEqED1I4SQ61Gx6XuReDuJLzPFPSOYMPOW6YqmYVR4B45VraF4YV+YL2MD9Fx
	r4hnt875pL71aef8XuYHz52BL0kGOJbj/GVqnWY4YnFKi/mwh2AQ5I7bRjgA5n3aM/9CYtiUiwR
	1BvALEief9Gd/NJu9z4h8N5Z2hdcKIikafRBeaUW9x7OrGFCDKyYjRgI4FsQvEG+3GwGCI34Exg
	a6QkEofCqxIs8dPbZnQ2NB9PkHKegVeSWM3S9JULeMiEFNcH+ol6fZFuGqn0LgQJTgrfV71E9TD
	nBiNkhIJgMFNflXm/ZAGWDsn90nHNrRuY+kHF4wuEvXkrvXxdOj0DQmjwzbDC7S8cZ3aIhcKZG/
	HEfaZDDFyS/y6RniCPEJqM8d63Fj36XyUazEurfVcvqJhOOd83cyGLjTa/hhz3xzXnb0NqL/6jX
	sjTjQzZvCPe12sQUA+DTMAaMfD
X-Received: by 2002:a05:622a:591b:b0:51c:25da:903e with SMTP id d75a77b69052e-51cbf264fc7mr51677591cf.58.1783853823025;
        Sun, 12 Jul 2026 03:57:03 -0700 (PDT)
X-Received: by 2002:a05:622a:591b:b0:51c:25da:903e with SMTP id d75a77b69052e-51cbf264fc7mr51677491cf.58.1783853822639;
        Sun, 12 Jul 2026 03:57:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01ca9ddfbsm1969378e87.54.2026.07.12.03.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 03:57:01 -0700 (PDT)
Date: Sun, 12 Jul 2026 13:56:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH 5/5] drm/msm/dp: mark the SST connector disconnected when
 MST is enabled
Message-ID: <sijdmdhcbxyg23gh6c62hspruvbnyqbdrtv2er3bh6n6ftolsp@b6o4khv6dofc>
References: <20260629-msm-dp-msttypec-v1-0-646a10256233@oss.qualcomm.com>
 <20260629-msm-dp-msttypec-v1-5-646a10256233@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-msm-dp-msttypec-v1-5-646a10256233@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDExNCBTYWx0ZWRfXzSJp+59ac3da
 wtUUhM+PgwYrJBThFJV0PgqIyD49BLAX2L/iZXc0MvGVesQ/m65Srvwsr8EMm71Zeb+kviSaYI6
 WS969qFIeWhdHvy7S6YjiHwFu7dw2yo=
X-Proofpoint-ORIG-GUID: YcBZQkyp40btZ5A7Wbt6dI_RknDmMdMF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDExNCBTYWx0ZWRfX7kEg/ZS6K1Or
 wkhnLjlVIv5qUcKSE0/83xSXhJIlPGuiVfbZFydOViTxCk2qZ7O68LKjV6O3HboHTsJaDpaxorz
 0VVaB4fPvpvmFcNpA19bgudZJbYWoNYy0NQxejNaUj9iW6GNAptID/zwnh/ZMyengjEVf5gVZo2
 VnPpVD6p/tjsXz25/1OhBABRbHrSBku2dg7Ti4OKtdkolLi1CzmxvVC0NegBGDd8R3PUCkN3UvW
 VBkiFYlSL3EAUi+/V1h3yBQtRlnsDU5YjeBhoIajQyuHnuEcIBoCHmaDmetFSYJVxGksAIWLaSs
 OM/m2NZCw7XqeWM6jsas8LspZ1wS0m93y3ec0JYD2g4BgOGEtKFfiE984Oj73WbvJsw5TM33FP2
 dj/EssM1fZ14Ytwi2AFLNG4g//lh5ATiOS+vC2+n0+yDDHqdJJL0IjfG5J5kOX2PA8J+oOoVimd
 uLbUnHs962Fwen5pUYw==
X-Proofpoint-GUID: YcBZQkyp40btZ5A7Wbt6dI_RknDmMdMF
X-Authority-Analysis: v=2.4 cv=KM9qylFo c=1 sm=1 tr=0 ts=6a5372ff cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=EGGHxoTsPsDd0Tq__ngA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120114
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118548-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:yongxing.mou@oss.qualcomm.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:luca.ceresoli@bootlin.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:tomi.valkeinen@ideasonboard.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-amlogic@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:jernejskrabec@gmail.com,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[31];
	FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,bootlin.com,linux.intel.com,suse.de,ffwll.ch,baylibre.com,googlemail.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,b6o4khv6dofc:mid,qualcomm.com:email,qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C7A4D744703

On Mon, Jun 29, 2026 at 10:48:07PM +0800, Yongxing Mou wrote:
> When MST becomes active, the initial HPD plug notification updates the
> SST connector state to connected.
> 
> However, the subsequent SST connector detect path reports disconnected
> while MST is enabled. This connected -> disconnected transition is then
> observed by the polling logic and may result in an unnecessary hotplug
> event.
> 
> Set the SST connector state to disconnected immediately after MST is
> initialized so that the detect path does not introduce a transient
> state change.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 4ee391cc7165..f8ca60d6d714 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -352,8 +352,10 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>  	if (dp->max_stream > 1 && drm_dp_read_mst_cap(dp->aux, dp->panel->dpcd))
>  		msm_dp_display_mst_init(dp);
>  
> -	if (dp->msm_dp_display.mst_active)
> +	if (dp->msm_dp_display.mst_active) {
> +		connector->status = connector_status_disconnected;
>  		msm_dp_mst_display_set_mgr_state(&dp->msm_dp_display, true);

This should be a part of the MST series.

> +	}
>  
>  	msm_dp_link_reset_phy_params_vx_px(dp->link);
>  
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

