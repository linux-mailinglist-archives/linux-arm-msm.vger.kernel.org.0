Return-Path: <linux-arm-msm+bounces-118557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lvJ9L+2AU2rMbQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 13:56:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 128257448E3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 13:56:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZLGbLaRc;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Q4a27QUj;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118557-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118557-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A56083004F49
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 11:56:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4521A3A4F26;
	Sun, 12 Jul 2026 11:56:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC72390CBE
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 11:56:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783857387; cv=none; b=qdPlw6wvyfAWdknRKW76TRkocbMw0u49LpgnUw9+UE9hD1CtA/ozdn1enVvQio6AKHLwrYFg6hNJp2zPAhRantpVo10cqS16Bg1HCaCSe6z9GWCwwlX7adA/y1/zE4e3epD7IIOG4W51sXOyWa5ckdZN149wHTzX8MQmQ2u3fok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783857387; c=relaxed/simple;
	bh=OsLWiRcpKt99DASjPj2jVtShDQMAJ4uwD/P0DccixmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GMyW8oeMvqiVEv2s3z7m7I97eYAUTLsAog8Q1jtQ80DWuLTCL/dl1FAx16Zq0chVxhzba7M7dOQ4jfSOKe6YwVfAdjwh7CtGLrgsoAlCGZl/a/aB7uGT+ym8/uDTEpdmBJgmqXeS+CvaOUFGuL3i37Do/AlvpIK7Kge5qRojyQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZLGbLaRc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q4a27QUj; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CAclqb2403099
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 11:56:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KC0A5o11l+xPlKmgNI1EcL//
	XJ+YFhRLisW+sul/M2k=; b=ZLGbLaRc2YuGI0wgaZCGUsB4ZiuswQQlv7zLaaKo
	6x2ZX8fN4HIB3lUatqNhKi3z9ieniFujKabB9Q9nS6aZHueYyjdFVE26Z4Rq5hxm
	he3amQUojp2PFZ51DALlsfHVrVKTF7+2wisEe3NW05u7Wr9/aP2tDfX/g7IZKLrW
	2uW3dJL/B7/pG76QZNmvaBLfzMLpPS8CupnjdwMaS/TkffgRNIIRVTXvO2K1eqsc
	0JB7pUVdhkO/4pB79lQ4uJp32i45Go9Ce1yOw6897EdcwaTLCXeWmXHMqZQHMsG+
	03ca+g1RGA1UTbpwdd/MPxeh3db/f45+NDIrTrU7PSyZZw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbe9hjr9q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 11:56:24 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5bf76bc1cc5so3200768e0c.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 04:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783857384; x=1784462184; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KC0A5o11l+xPlKmgNI1EcL//XJ+YFhRLisW+sul/M2k=;
        b=Q4a27QUjtVl4IHpDer23GFg74iORlQiyGXUQT4v0yX7BK2yqW+vZLGhz2q2fts9Qb7
         HafQkvqrm9jFVbKo+TN9qh2R1ocdOhsIH7a/nOGYb0ixVyOGxcpbCJs0mhMhN80fhNMl
         4+m5OGzuHW2KMaOvIrzKsNo5+eSb5Dw0t3ylqCsLbRf3OHTXVSh+H+O+hOlHmlIyQySg
         3hdNrrI9p/p7qG5SfrT86kC0QDKcnMCXZzUUxbz5mvelS6nzoh+/wFTPDJshM1vSth/s
         Bv9lF1rMpsQG/u/Zh9s5pYlufTRc2OSJLBIXthMx7hmVWdynpAgbztG8FfTQkNk495Uu
         hAyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783857384; x=1784462184;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KC0A5o11l+xPlKmgNI1EcL//XJ+YFhRLisW+sul/M2k=;
        b=Z/0WbVygkJ9m298TCN5GYXbqeYnDSDZZZnWhQsMnob8HosCNVPDj6HHuyeZ+zPEPEW
         XqzyviT/0ngxQXsybI/2rOUgcuiCzhn5FoanWrEP7pjLYXQo0BlwTvKjQN670n7JSgI6
         0fTVSvqgblyQfUAT5tmjPVEmqlhoHd7gBIeGPhhV7YFiJoyTRCo/EDAlMc2O6hsUYFpi
         ztrzLyKnrnglN0pkFjNcoa+rbJdiqLfaC8n4dHUWeXbv8GOb5yI1RfM5cT5ZMY5gDTUa
         DbRnL8zvJgFw7/s8v9bOuPY+JsHudUgjw/Z4MUahYdP7KnzlTg4w1AYTxLOsWVLRZdy9
         uBtg==
X-Gm-Message-State: AOJu0Yx8h1w19QTYQuieFCLNijpKP5KPqxO5TYK7l/779gn79PJaEonN
	jAQvSiAIV0Z2ze6/TGSF6Sn8b62C80HGRhNY8zyhpp9ftCoHeiAxxr4+1aSAC8IM9GypnCVyAaF
	TMIjCsH2b9ubhFBcrxd345kJmPOQjhY4AftOSLsXrwDpbfEkoiU8rQBp7m/QtdjXkhdUU
X-Gm-Gg: AfdE7cmtaT9tqrtA3/5Nq3MDjnkj/VgJR+hpjVisvD2XGPyeqjhERox0ucI64B77Jia
	Sxym69y3vmhgAl9zuEx0tV2w33tM1jK7uOWcAnHz4YVslqX2NdOImOPPGjQREaCKuX0ZpqAYoTd
	fuwOyF9SyRvw5ob7Ebs5vB2SXVhHMmplTt+Mvezi6c1jLwghBDwzn8NT3A3SQrbEeXTxJsU91U0
	J06CV4ckCpTI7mmISZAb5bQGLwK7Pq8E0rT8GnrmHOGM7Y/nX2mdf0yu2ltS0YwC3AVZi+5iIhW
	/g6cENG3FCZPJcVx6WAHc9sqDOJaPo7bQWLSXeRKoIs100G8RBPSrTTwMRVPSd1rEcHeHSB87u2
	/yylLd91s30Hgd7PGYEnaEhRqRZEnGENoioBnIqpvhGFQBTwVPcrNKN/HXUCpF1SkqVegH2B2eE
	FgZEVHqP5V7cwpXmDzlmDmMF/H
X-Received: by 2002:a05:6122:4a01:20b0:5bd:b47d:1865 with SMTP id 71dfb90a1353d-5bfa49392ddmr4163136e0c.5.1783857383961;
        Sun, 12 Jul 2026 04:56:23 -0700 (PDT)
X-Received: by 2002:a05:6122:4a01:20b0:5bd:b47d:1865 with SMTP id 71dfb90a1353d-5bfa49392ddmr4163111e0c.5.1783857383553;
        Sun, 12 Jul 2026 04:56:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c84b1a164sm21000341fa.16.2026.07.12.04.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 04:56:21 -0700 (PDT)
Date: Sun, 12 Jul 2026 14:56:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel J Blueman <daniel@quora.org>
Cc: linux-arm-msm@vger.kernel.org, Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jun Nie <jun.nie@linaro.org>, Federico Amedeo Izzo <federico@izzo.pro>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
        Randy Dunlap <rdunlap@infradead.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        Val Packett <val@packett.cool>,
        Steev Klimaszewski <threeway@gmail.com>
Subject: Re: [BUG] qcom: x1: GAMMA_LUT corruption on DPMS wake
Message-ID: <zscjwjuqhg36vwsbt735y5gq3bcfxcfh4m46zcgpakacyoxrvf@ekji5eglhdcn>
References: <CAMVG2st2udHCUHZ_2j=jNmwTAVi2Cvda0qGgH4tDZHwsGVfLKQ@mail.gmail.com>
 <CAMVG2stuY5aTwfmJkL_cLDn86hfuFD+sT-LdqdmN5m21y2aL5g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMVG2stuY5aTwfmJkL_cLDn86hfuFD+sT-LdqdmN5m21y2aL5g@mail.gmail.com>
X-Proofpoint-GUID: LKYZcEbGZIwNpCffCJ8_nptGr_nPCt-S
X-Authority-Analysis: v=2.4 cv=SajHsPRu c=1 sm=1 tr=0 ts=6a5380e8 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=e5mUnYsNAAAA:8
 a=t9ty7G3lAAAA:8 a=3Mq0MthYWaJk8H4ohRsA:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22 a=Vxmtnl_E_bksehYqCbjh:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-ORIG-GUID: LKYZcEbGZIwNpCffCJ8_nptGr_nPCt-S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDEyNCBTYWx0ZWRfX5QKZPysVOaiE
 7+w60VCs0sUdcqpz/u1iBr7UOk8iEco3m4+5upPIoKrqOon8olaxVvm+JPt0vSz8o9h4UMiEgWf
 bWZtO+xtOed9W/NpkuDAfuiQcIwUOxZEMpcS5PRo0fYj16bjJAajU+7Z8gRxJy00P7pipQ1aIHe
 q3Mh+qsGhsyk9Xi1NobvAJMIqA4BatSJUjgZMBjaGtj5hgtRAJ3HKZjcpGpZmxCdvgLv3DjpxCD
 HbsTO8kbNGpY1evaVpiDA95VMOIqiF+/XAmPnEiPIQRvSMfQMV8ogrvxmJUeBqrEx3XePJpBQJy
 qJ1dMPAvW0GAd1iV75aXa8k2G37jrUucm0b4nSJFVA41/20vmJ6G41hYxtbPXt1ybQF/hRWQWrT
 yiopW4lSxLRhRwJR0Xw57GkkKXciESp0hUgBvacmqss5BIfHbE+TJ8v+sm23z6QNKOxFjvSAT8+
 9lhiXwfoakPMWmP/EUQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDEyNCBTYWx0ZWRfXx+pWJfh+itXU
 /+yItv/ZPzMquRWlPgVzsyHw4shJXpjyrOBVomCo8kFF4nLlHgt8uqpV48+hibb72psB9sozh3H
 /MxrU2DwAxTiyfzWFk80gBa2UAKVt1s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120124
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118557-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,lists.freedesktop.org,ffwll.ch,linaro.org,izzo.pro,linutronix.de,infradead.org,packett.cool];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:daniel@quora.org,m:linux-arm-msm@vger.kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:abel.vesa@oss.qualcomm.com,m:krzk@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jun.nie@linaro.org,m:federico@izzo.pro,m:neil.armstrong@linaro.org,m:thomas.weissschuh@linutronix.de,m:rdunlap@infradead.org,m:linux-kernel@vger.kernel.org,m:val@packett.cool,m:threeway@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 128257448E3

On Sun, Jun 14, 2026 at 06:27:50PM +0800, Daniel J Blueman wrote:
> On Mon, 1 Jun 2026 at 13:37, Daniel J Blueman <daniel@quora.org> wrote:
> > Since Adreno X1-85 GAMMA_LUT support was introduced in Linux v7.0 (eg
> > Ubuntu 26.04), when waking from DPMS-off, palette corruption is
> > frequently seen; this manifests as purple banding. If GNOME night
> > light or similar is enabled, the visual impact is greater.
> >
> > Further, on larger panel monitors or laptops eg the Lenovo Yoga Slim
> > 7x (2944x1840), a second INT2 block is used for the right half of the
> > screen, which may remain totally blank on wake; major usability
> > impact.
> >
> > Intuitively, the symptoms feel like the LUT SRAM clock isn't being
> > driven soon enough during the wakeup, thus state loss may depend on
> > silicon binning/variation or related. No such symptom is seen in
> > Windows on the same hardware. I found a workaround supporting this
> > mechanism is to activate the GNOME night light and adjust the slider
> > to update the LUT - any black right half of the screen always
> > reappears.
> >
> > Please can someone with X1-85 Adreno insight check the Linux clock and
> > power domain behaviour around GC_EN, Layer Mixer, INTerFace and INT2
> > on DPMS wake? Happy to test changes; this is a stunning platform
> > otherwise.
> ...
> > Link: https://gitlab.freedesktop.org/drm/msm/-/work_items/89
> 
> Just a heads-up on this with additional findings. Note this issue
> could be the only remaining daily friction on X1 laptops with suspend,
> once my video decode reboot workaround or similar is merged. Also note
> in my case, without GNOME night light active, only a few LUT entries
> render purple so visual artifacts often go unnoticed until a gradient
> eg in an image is visible.

Could you please check if increasing reg_bus_bw in msm_mdss.c would fix
the issue? It's not a proper fix yet, but it might help me to understand
the issue.

> 
> From DPMS wake on a dual-LM panel (>2560 pixels wide) with
> INTF_5/DSPP_0 (master) and INTF_6/DSPP_1, I find DSPP_1's registers
> are intermittently unresponsive just after MDSS resume. DSPP_0 doesn't
> exhibit this issue, suggesting some missing slave/second unit setup,
> despite booting clk_ignore_unused pd_ignore_unused.
> 
> I found the extracted Windows DSDT \_SB.PEP0.G0MD F-state EXIT block
> enables disp_cc_mdss_rscc_ahb_clk and disp_cc_mdss_rscc_vsync_clk;
> could this relate? RSCC being the RPMh bridge subblock. Also, could
> any of the *1_CLK or MDSS_INT2_GDSC entries in dispcc-x1e80100.c lack
> setup?

RSCC should not affect these blocks.

-- 
With best wishes
Dmitry

