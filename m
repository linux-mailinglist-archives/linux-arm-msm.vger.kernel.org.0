Return-Path: <linux-arm-msm+bounces-108751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDuEHLixDWpy1gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 15:06:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A03D858E748
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 15:05:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E4DA930399E2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 13:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F8D636F428;
	Wed, 20 May 2026 13:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V1LiJLbT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h6j01Agg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9893CBE71
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 13:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779282289; cv=none; b=i1DAz5AAYCP4I3KiwQaE5wQGB1NutmzNx5dMmS+2gjjG3TzAD/v0rxrwgLZnjyGqzWWwNAiLYcdG8i7JNxHiVzBYS0Ph8cFdVWjnQoyVCjOt06OBqFp7JW8rK5XTE71UL5I7tUNm1hA2FeG41SE/SyfdbQcsNgodeq7KMw3B6RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779282289; c=relaxed/simple;
	bh=GQQrx1sGVnqbKnvWv78r5yHuONIlxJWqqPy7Xm4CCbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EzYCfKB7IzGDh9h3lg+YtbTiTSi4wf3r0KEeU9pezPf17B7Hm9dqStGpqu68uEPWdVjoiuC3Pn/UrZHxHjIImYLH5bJeUVibS1pB0wCSHhwHnPhl2yTRRF6yQb5xqfI2aLlmELo0wzUGYd4vMOvZbOUzGutzDTsSYk6WtI6o7gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V1LiJLbT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h6j01Agg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K9nRaJ446712
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 13:04:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kpTG2ueCP7uKXj2aLZqi4ovU
	YrM7cSBV0BgwJSqxzwc=; b=V1LiJLbTqPYTUwTneVZ2/bD4/eI/jNZYROYPYJl7
	24ogz0cLpsxdggcqr7bE2z6EXcV3+AaYa5+J9efjYu1tUvbMv0AnuUPYgSsCV5YR
	pe7lD+7TITnprsJNWZYYwDAxor45/PlCaZkDlg20RzC5pRl6KdbsjOc0KCd0fDhn
	UfXvG+5TyNqnDi/ZJ8HyoOHMiskyOJOV2dVVD8ywNi3vS3Z0N0inWTg1key2QqJZ
	3hZnWmWB9D19O/Kz2ZqopTq8uoFJxEHAfbYdIb3EEerOGYu1A6BO6uWLMuzn7fnz
	b5WDRIMaFwOeFYzVOBSVNk2WQ8Wl3uk26MwIUnnmVXp29Q==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9anrgppx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 13:04:45 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7dca6ecdd85so8701842a34.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 06:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779282285; x=1779887085; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kpTG2ueCP7uKXj2aLZqi4ovUYrM7cSBV0BgwJSqxzwc=;
        b=h6j01AggGmtsv3yWxKV79QFcNS6VKOCG164pGrvlpAZysWpmsEumT2p5y3tEPuRfDz
         Zc/+DjFG63C14SBRWpNLjo6iDiXmXoK9ej1/XQV0Q5YdLrZo3STRjEqjiCmms71vauqD
         O8+GGTyrGwDLqpfdROGSWLDRBLujk3G1rd1FC2V+0HLGo+UAq9uXaQ5KNfpCXHsnEQzZ
         WrPphsQjqCCUd551aPGugYhZmk5/rpB9vC60EquywKE9/fhusW/BS8C9NS3xcqjL/M7w
         +TJCpKt+OB1V1gEHxMuf7JYSi8EquESy/lD9CmMavlSl8LXz3WRFJiHBxeKl2c2T0Ss/
         Heqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779282285; x=1779887085;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kpTG2ueCP7uKXj2aLZqi4ovUYrM7cSBV0BgwJSqxzwc=;
        b=BQQ8WG/JMf7ZZRk4QVYIh95oUTN8uAWXRLZjQeVi39zlN4Z+bPXh1Hrr1GfNdwuuLh
         RuvrGecovOSgE5cK3WO5M6B13F3jPTtFm5QCVyhU37exCZX6dOV0RSWG6vDP1aZcrg+c
         yjZiO4cBq4ql2IZxyPLgcdcPplAUrq2ZP7Wgp8ADNTa/w/e4Pyu4bgpI9SVfASzbIMyb
         JVbI03RMglp9NKHm2Pqi5ftTrLkkm4/EgFtfc6C7I9F0OgkCvNEA6oocXkccI9GWZGYa
         4oKOsnnQ1U1D9MSZkanssc+3Ie7LT+/t+9fJvC5xp+uoZ8p1BaO8opcP6TvnO50mOehr
         kktg==
X-Forwarded-Encrypted: i=1; AFNElJ8IZDhlgPa6f9LqORSgTmfCZVrOboAPWsuzIQ3OZhnWcJBJFxtpoUQKAvSydscYibyVd6HXIOcqandPJY0m@vger.kernel.org
X-Gm-Message-State: AOJu0Yzzbdf9APXD4nYC/9+Qtm0awyXhRbHHiGnHosZDoY1FV3Su/AXF
	52gBdb4S9yxvC1yi0JeuU9XvV0Hx7Xyn1PLGnMe+wOTS2YysKwdU3IgRbzbYMNRameqJROqDy0a
	OKyPLznZA+80D+JZT14V+u61AgeZ7f2++m56yaQu8FjlxUj9ntVVR5GML/BtbX5NVhbO+
X-Gm-Gg: Acq92OEGLKCboc9W/HjV7ljH6s1Rw3dzRtA2EGZCeCksvdTeoCdbtQ0n7QYcyi8+Hb6
	wfT6g7vCR6psUduazetQ4ppAlCFqzjK6ru5Qx3Rgpdza3yrTL6UmM7zckT3TPpP0Dg2Czuco9De
	tyI/hzCa+FeEFzskvIxYfQi/ZVsd45gHyFzXg0qsRgAPPETI+vPVfCBD3HRkzkqveHYqtEgy9Pe
	sS0UR/9MC1zfilYPMzYHjpWM3kmEotbna8QcJpc5H64g3SfuhrXofDMtjFe2R5hAKQRb2JnOPdN
	5p8gE2BVW3OKr2rwAZGmRfbAvgxRexSKmU3t+/Y8mKv3fu33x1zDDDOEHiK/iucpLit66Q02g2+
	LgrVuSD7/2Xuz0hnq2p/OM6x4gGRn2k6f5S36VtapJ6WhexvfR5PMmLg3NMee0GInq7gOHrBbwU
	hLuHN39Tt28xphvOwzD3AOr4mnrOcvJ8XqH0w=
X-Received: by 2002:a05:6830:6d0e:b0:7d7:d100:2613 with SMTP id 46e09a7af769-7e4ea03bfb3mr14892449a34.1.1779282284791;
        Wed, 20 May 2026 06:04:44 -0700 (PDT)
X-Received: by 2002:a05:6830:6d0e:b0:7d7:d100:2613 with SMTP id 46e09a7af769-7e4ea03bfb3mr14892372a34.1.1779282284298;
        Wed, 20 May 2026 06:04:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395887b3c3esm30377451fa.34.2026.05.20.06.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:04:43 -0700 (PDT)
Date: Wed, 20 May 2026 16:04:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: John Harrison <John.Harrison@igalia.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
        "Kandpal, Suraj" <suraj.kandpal@intel.com>,
        Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
        Rodrigo Siqueira <siqueira@igalia.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Louis Chauvet <louis.chauvet@bootlin.com>,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 0/8] drm: writeback: clean up writeback connector
 initialization
Message-ID: <wcgvogluzfrjk6rlomswkmqceilbbichxsgx3aqzpoawe7jzgw@uiy3ogtswflk>
References: <20260505-wb-drop-encoder-v5-0-42567b7c7af2@oss.qualcomm.com>
 <177894506978.2448625.17152574519326512949.b4-ty@b4>
 <8fc45730-b2e3-4ba8-b80a-9b30557e810b@Igalia.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8fc45730-b2e3-4ba8-b80a-9b30557e810b@Igalia.com>
X-Proofpoint-GUID: wQ84dtWgH2naBNuuK4i9ctZSTBtLJGz5
X-Proofpoint-ORIG-GUID: wQ84dtWgH2naBNuuK4i9ctZSTBtLJGz5
X-Authority-Analysis: v=2.4 cv=UuJT8ewB c=1 sm=1 tr=0 ts=6a0db16d cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=e5mUnYsNAAAA:8
 a=JYzImek8qnKDYlgmmesA:9 a=CjuIK1q_8ugA:10 a=EyFUmsFV_t8cxB2kMr4A:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEyNiBTYWx0ZWRfX5xp6OwkibNoF
 vC8+ylCh1OKJOePSchDRnaHap+9iEaipf3NtlHACPgpsjVMjh+t8onazpD/mb0es1N6elBX8i7d
 qX46tWHnvULM9l8hyYV2XdmmaBZ0OFaaFQLTQTY0+BZX5W5slRbpe6LF6MrUtKRYZ4SvkMRQlCz
 wx3ORGTKS8mGNL9K9qO6QYPgbLWbnAceXztw0g/STUIwaKB85htwwIkDqEHmSV88HtVb7YpLd5o
 1Hs6tD7k2tOZT1Y36UisJ4DrxG5udlwgU+FwzpMHV+iN/swILB4PuBTct/KIes3XVjfH6UviN6e
 AmGUcd7ZyVgiYRkN4XuYB9lSzDzKrCTuoATmi+ZeSjyT/6AM6+REHDoDKPMvXHgEiN5PzX7TTvp
 HuejDKCCrvfn8U+Oxxh1KZoA2jmvwWIUBHZEU92DoPl++1U1R5Xy3+HwRf3nLUnyyJvSEaSIHbJ
 LbtOO3Vdjj5xW6TF+Yw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200126
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108751-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[36];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,intel.com,amd.com,igalia.com,gmail.com,ffwll.ch,arm.com,kernel.org,suse.de,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,ideasonboard.com,glider.be,raspberrypi.com,wanadoo.fr,bootlin.com,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,gitlab.freedesktop.org:url,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,renesas];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A03D858E748
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 09:59:00AM -0700, John Harrison wrote:
> On 5/16/26 08:25, Dmitry Baryshkov wrote:
> > On Tue, 05 May 2026 03:24:57 +0300, Dmitry Baryshkov wrote:
> > > Drivers using drm_writeback_connector_init() / _with_encoder() don't
> > > perform cleanup in a manner similar to drmm_writeback_connector_init()
> > > (see drm_writeback_connector_cleanup()). Migrate all existing drivers
> > > to use drmm_writeback_connector_init(), drop
> > > drm_writeback_connector_init() and drm_writeback_connector::encoder
> > > (it's unused afterwards).
> > > 
> > > [...]
> > Applied to msm-fixes, thanks!
> > 
> > [1/8] drm/msm/dpu: don't mix devm and drmm functions
> >        https://gitlab.freedesktop.org/lumag/msm/-/commit/c0c70a11365c
> > 
> > Best regards,
> That is only the first patch of the series, yes?

Yes, correct.

> 
> What is happening with the rest? Can they all be merged to drm-next now? As
> I understand it, only the first patch was still being discussed, the others
> have all been reviewed some time ago.

At least we need an ack from the AMD maintainers. I can pick up patches
3-6 to drm-misc-next, but it doesn't really help because the rest of the
patches are blocked by the AMD change.

-- 
With best wishes
Dmitry

