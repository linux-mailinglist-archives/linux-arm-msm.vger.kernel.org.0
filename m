Return-Path: <linux-arm-msm+bounces-107316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKrTMPOABGrmKwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 15:47:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C614153452B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 15:47:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3DCE930DD4DD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 13:35:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 427E221D00A;
	Wed, 13 May 2026 13:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NeGVkM15";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GmiO2YAD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39C53F4137
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 13:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778678673; cv=none; b=FqVNYK/ZTAyM1NIqzo1rm+OD75f96GOsks58gDv8ouqkWmX1yhVsuumUm2G4rAm2956ouHBJyoYx8ZqS/30GEYCSihEwwhfBGbtT4eFvGUliYsXHopBqrd/2BGhzWLgMRDQOOZzVKxR0wePYhJvaLa95UG+rgZy7qsOf9LiPAbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778678673; c=relaxed/simple;
	bh=U61VnrkFAfmh8QhkU9tfQPOx9p8nQsPfTDcormtzBKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R6tlH8KOYwEIsf4J6Z45oDDGK9zFp9BB7eUvpVES/uMN4L1R0tpi32Ei7Y9eF7+jPtDMQ1b30CDnUhE5Os+IR4LxNkQeD/y5beDbOXBe0Bk3uiIeahUrJmUw/807wsL42/WdYs8A3LMNH71ub+b/jhTuy5dGzupxuFEF2KRgzj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NeGVkM15; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GmiO2YAD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAKEN52338760
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 13:24:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+gB12q4lels2v+/8HXtt380T
	L8doTk8XmybcqxUT0jw=; b=NeGVkM15eeCiWkOht6pvmZ5NQPKZLYdSr948zgvF
	4Tn9hdVbol1zz10PilAJ5xCyomiq+Ju/M3DC1p60yWnFbfGarjrVSiC1gcNoTx0t
	x8YgdMADFeXBNwsMD7GjsI8Ci8c2ddqFt30Ao4j+mCHTsQwA/zC2ZclCPrTiXZNI
	4nYMk7ApOFSlFHsWSbhIDmptURmnzSFWCwMLmskgkfEApEmDPGr5RoK2HnGB+xzl
	JcIk57evZjHf+S4DVS3E+CzewPqssWk735fyK0+yRZvjvgyn/ClamYXcMfffgToM
	2O3bp2bl0kq1JYW7v4+0iUh7WM1ZUKoW1XafHJLzb386dg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e49vxbkme-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 13:24:29 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-95f7fcf4f37so2362717241.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 06:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778678669; x=1779283469; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+gB12q4lels2v+/8HXtt380TL8doTk8XmybcqxUT0jw=;
        b=GmiO2YADZY7hHQXUWeObmZ2JXGgegBds8pZMOwiAMwLucG+5IpHlZvikSivZih16ZU
         5KFl6CsaqfJPFarcnwhuJG1Cw6EKolLbjRfkIreyN5FZDattYuHhWT7o3eDT7/3bR1wS
         E1IBLKN6mDrBcxO8F2JJu0PCEUd+gZDcYfeM1V13UZ6cIvRAQRaa6J1Ld1Z/f9g1oymP
         6NrawQaYcIbUKFbMRtdGHLftm5eREIJpr7STenfjMCOID+CD7Kw0PPpg1y5Kh/SlUVmy
         pyh0McbtWXJmSMy08oGFjiPznU5Z4PELYzyo2aPIEMTycvtHLwNH2z/yCZ1tsasBH1PM
         U5Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778678669; x=1779283469;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+gB12q4lels2v+/8HXtt380TL8doTk8XmybcqxUT0jw=;
        b=TJ34YvHlpF7R+JdBvSf1tCa1NErvHWly7vFu8ii5zz56TOmZCmds+rpJ+Esw5k5GUT
         miSEmbTqy8gaxrfYNpMI80Q+aSvYbEILy5Ai7FIxuYrECMDK291I37PjqLm6pjl4YAhn
         q24Win3JzIp5y6RyY+AcJ7tPyr4wOTx06D0nI5drfFUGlN3NBxDABqfIQM/BQPODBBi2
         Ia/XKm9kaWk7MPtYrq4isf8+qGmqJvFRKT85c6PUYOA7F/ZOsVAM552FH/FjGCbzza/8
         ucQTq6caiXRHRyY8QBOb3C26A8mQjEsdyjPZBRbds6QExBDg4CbvebHQ2WKF40lyZe8T
         kpIg==
X-Forwarded-Encrypted: i=1; AFNElJ9fj94mFM/u2NZA5vcfY7rIVTDCaKbSrXHEdlVvQYU8SS6Oh5/HJtfOvrg0kEVF9WSnX8uFCBnEN+dzFIOB@vger.kernel.org
X-Gm-Message-State: AOJu0YxFQqF37yYIp89iQIfvBi+6GlCsLuMaQJhHDZeZXqLA/9dz/6+f
	X05IaOWw2Iy+DPafqYPG2bXu+KclhlFNO7jnEcTXqGqxM3sl5LFJBQpswsBgnKpNzNQq8kwiv5m
	N/iVMpQvvXVLdqrYvRgG/Zc+G48qBVKoWiL2CDTDvQz6mAFiB7AlzGZh5S+qsS4W5bgAg
X-Gm-Gg: Acq92OFce75Io+lIUKn3+Ij+kTmyvdqEmtHQqv4Oi50JxBK7lpr7+tbxahFdY2typhY
	j8eRgNv4AJCWkO8WRblsiOh5I6Pp4noiQtwIDMcfo7tOaFLsJ79IhbvIdVMV64i2dxmbs7a6yb+
	Vp9TMsz5OrqWG14vFWfv5r+eqDuobkhrnXuMOYhD6I1sDL4Sj+yHVSDyOmnzS7Lmm1oLCQ0R/ee
	5lv2fjgFfktMXcwfXttEmpE0iywnBLZtIkxpFnf5Jrytari9f4zAqlisMZIUs9iZjrLwKgD087Z
	DZ2/7dNg0V77qHdJlIpgbuo4k6KC6ipK9ADbmQvpklhe9E3fqsmhnuTusOBF5b8kKcOPOTsm8jk
	E/4F3TPQvNn0Za/fYy+u6+hq/GcioLySKi8EjROrvMzUSHBLM51EIJ4LJE1o3ljkHxUjHmywaRZ
	dgJl/zHbXr/4ZpRmTab45cNQuhT+Qmmny5W3U=
X-Received: by 2002:a05:6102:4a93:b0:632:d8d5:291b with SMTP id ada2fe7eead31-637ab380a9dmr1159482137.30.1778678668997;
        Wed, 13 May 2026 06:24:28 -0700 (PDT)
X-Received: by 2002:a05:6102:4a93:b0:632:d8d5:291b with SMTP id ada2fe7eead31-637ab380a9dmr1159429137.30.1778678668490;
        Wed, 13 May 2026 06:24:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f6290cfdsm40679791fa.42.2026.05.13.06.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 06:24:26 -0700 (PDT)
Date: Wed, 13 May 2026 16:24:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <jstultz@google.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@amd.com>, Hui Pu <Hui.Pu@gehealthcare.com>,
        Ian Ray <ian.ray@gehealthcare.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 03/11] drm/msm/hdmi: switch to
 of_drm_get_bridge_by_endpoint()
Message-ID: <abncnrwznp65m2lmnmzpf4ftde4mqxyfpvlqgzsoxrizet54de@z6yqjvkbenws>
References: <20260511-drm-bridge-alloc-getput-panel_or_bridge-v6-0-f61c9e498b3f@bootlin.com>
 <20260511-drm-bridge-alloc-getput-panel_or_bridge-v6-3-f61c9e498b3f@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511-drm-bridge-alloc-getput-panel_or_bridge-v6-3-f61c9e498b3f@bootlin.com>
X-Proofpoint-ORIG-GUID: a-DKUCvPl-X3JnnFMqBZp7iBRAkXCVco
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEzNyBTYWx0ZWRfX9xbOyi0BZpzE
 d+ai5HhM/SI5PNlKkOPRFNRbjF0NIxxStikr7U+CpTNHtB41CXxnbsDLwBTa7uPQJ3/d/Cw+eUj
 lJAYktzL78GmV2xOwfyiFpb5400+frjVyHNVA30cRl1Cjy0v+ZVF9pQou1/USmZ6ewRiSMM2uuN
 PM1S0Zek25mEGnkRKRN45Lo1fEAH0CLBHl+HxYPg4dIxxMZAgdFg97faIC2KzVqXx8MzcCXEDNs
 Hz8QfnqpQcXyQiiAD9Mo31GZUJuu7U8GqPGKxlqmsqVwb5halnWJTNkEBDXQ5Dysz8WKzy+JyHK
 IiT6KQZ8hqKen+/rtN2KSZ2DEx2YG2sZtVv/b+tENXpTBI+irvGc8G4d+NKPME9fztlIlhQWqtm
 /Hm09/C5JQl3/z4xF/qenzAKbkDzGXp8CfZrFlVLf8G0rLkVD/tJI379G8YKY64GfRzCq8Uzoc3
 dWDOHuxGYhG5gQtQZNg==
X-Proofpoint-GUID: a-DKUCvPl-X3JnnFMqBZp7iBRAkXCVco
X-Authority-Analysis: v=2.4 cv=A8Fc+aWG c=1 sm=1 tr=0 ts=6a047b8d cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=P-IC7800AAAA:8
 a=EUspDBNiAAAA:8 a=yWMTck8D_P2mmUstWnwA:9 a=CjuIK1q_8ugA:10
 a=TD8TdBvy0hsOASGTdmB-:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130137
X-Rspamd-Queue-Id: C614153452B
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-107316-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,google.com,amd.com,gehealthcare.com,bootlin.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,bootlin.com:email,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 06:40:07PM +0200, Luca Ceresoli wrote:
> This driver calls drm_of_find_panel_or_bridge() with a NULL pointer in the
> @panel parameter, thus using a reduced feature set of that function.
> Replace this call with the simpler of_drm_get_bridge_by_endpoint().
> 
> Since of_drm_get_bridge_by_endpoint() increases the refcount of the
> returned bridge, ensure it is put on removal.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Changes in v6:
> - move assignment of next_bridge earlier (avoid access before assignment)
> 
> Changes in v5:
> - simplify error management code flow
> 
> Changes in v4:
> - ensure next_bridge is put on later probe failures
> 
> Changes in v3:
> - fix ERR_PTR deref when -ENODEV is returned
> 
> - move assignment of next_bridge earlier (avoid access before assignment)
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi.c | 70 +++++++++++++++++++++++++++--------------
>  1 file changed, 47 insertions(+), 23 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Ack to merge this through the drm-misc tree

-- 
With best wishes
Dmitry

