Return-Path: <linux-arm-msm+bounces-98528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILOFKYfGumlobwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 16:36:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F2B2BE5B6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 16:36:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2A81332F1F77
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 15:13:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE17A3E51D3;
	Wed, 18 Mar 2026 15:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IujoxCao";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iAuxPwCb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B01A3DEAD0
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 15:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773846673; cv=none; b=mU8gwKV5Xr/OH8RTzD31t0lHin6mcj+DIfvTVaqjhNjvo7BQmNGO0soPN5JvuZQfD6KOOs4HnfwOWQjFRBzjVI24Z2AOLdB6YITno+KL3TgB45O1QxEhAk22QzBOH/e3ikpqPGI0jbP8MHD4PNVxut8Q7831Q54HqbV+/Rg8U+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773846673; c=relaxed/simple;
	bh=FVZip28xg9Ayos85rMIkNIRds5dZACAMHB5UzXTQx+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EfjgTTbcNKdao/YKrZLN/SI0YCgNPvTSGiWYfgfIich1XM1aH7Aw6dYILvdIWfNsCgjV+7xhDJYCgW6wH5hKwjVBopZPCejg2zMVvyntBdjSosiFpRFVREf9i9mMIkIxAfxfY2iz7ydGHUpGz7ThruBn42TD/ydVGVXmIPw38bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IujoxCao; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iAuxPwCb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I93Kbv1144949
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 15:11:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zTaSBeSUZqyP55RQNCJYe+Q9
	ap51sInV9JJjR2VFl/U=; b=IujoxCaojfpzwcOlEHi9EUm/xn78BswNB8OuNPX1
	PEK999Ee36iFlB/md/RZMkeLexHLhfgmHuRQRwQey9N5UPdM6tw5kBRmrg17lf7x
	Nif/oe0g5Ro/0JEox9phN9nhtu1FnQBOJCse/PJ4bda8PZDKjYr5nTVAh3vfhnp+
	oL6oRDCNkLmnNprEq/TiWiMJXQnk6ja6rRItK1FEkDM8zbESLdaGXo8o4NK6a/3R
	fUt6fOSFhg6GM5Lp7luqpr6wzxWPBVkkWuquCnCe5ct6wyX4sdD0gbzdpAisFjHh
	jDT7eTjUUUXgKqsLra8EA9Qe+BuSatCBzQxg/bjoAFIi3g==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyak3vsu9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 15:11:11 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-950c91e200dso45970602241.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 08:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773846670; x=1774451470; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zTaSBeSUZqyP55RQNCJYe+Q9ap51sInV9JJjR2VFl/U=;
        b=iAuxPwCbb2cKzkevp7UhUwTfSLw1N+nVYGc8smaUS6pnSJai+zf5XUrmo/xmmHRsjA
         v/XKhv14PGDtPFv1dfpHPWNKu57skJ/kydYijgKzCYZBBWfE/qrUbh95Z5IGlws/pjQ/
         1cdifXDOndlBamwic+dK3+Ud5F3jAW7omnvkDf/tLDQzVbm1mknMNLG2860uH6ip+HiG
         hZptMpjFn/Hg5075iFWAE3/xiFFwNhpP3VQX1nRiBqc3kB0+qHph9skgqVbiD69JKnfg
         WBT9QfZ8K8SgVXp85CnhH5/Spt9J0XuW7jbAqPOSunZ71ubjT7zSXvcbnIqrA713IfV5
         Jrqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773846670; x=1774451470;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zTaSBeSUZqyP55RQNCJYe+Q9ap51sInV9JJjR2VFl/U=;
        b=TFJdSXFRCnH/zfmbnwb7TL8GbI3ZlPjJ+ysf2woiOUESpIpOuNN3qJnQGhvtwAPQFU
         jFD5XQlfEJtc7TO3l6VKvyKwIQHU10dhBG6yf4l2cHIG64RnzeyKr0HalpbAWXt4JJTV
         9kSHjj6TQY2mzaxPYwFQn9new6WS/udTKsIm0SFj7hOQaai5HULiLIo3FlaByzwL8emP
         KcSA6ETMl4EmkDSMRy7YgwAXa8W1ElLu4XQdFVso8nRl+vpsnZkMevJP04AxOgb5hCCM
         iDGssbscY/J22wlsxZSSIVEIcF2sz1t5ATMTCNGpREh2vhzxcmkC4DtYTLRXFbDYjgPx
         ysNg==
X-Forwarded-Encrypted: i=1; AJvYcCUXdxYDU6Kh/X9Z94PwuIefLe9e29nhbpYO0hrsO7d/O7Ms4F/9Afw7GVy3V43Klj4mV3UujrDOuNH02EtT@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4zNCAylh7vijQK6hdGGqWnf+6mj9sHjsyijMMs4VyvJyDgdTY
	i2+Cz0TzBWxQCVZrLh6KYPgWIguxrh3Yq9fFjhslpE9z00mN4bl+1wbOq8ywbwOD0WGLw0GlY4I
	QW6sr0+gQ1pDZmjdFoI1pIOxj3o4mgRoy2gDrzSJfy8P/XcHSs8RDsl/WFZGw5VJ3UKnqBYfMJR
	S/
X-Gm-Gg: ATEYQzwqpLyeKCym6K7MOlbOCqeSAEgGSDIzxVteTE5JTiAFjD3/4uMqpmPHyTLhMTY
	pPKkpk0u0k8hbiksUeupye68lloeEtO3vgtiPh+uM3RGlBS047CBAVldQPxiAZyB1/EvoDAv4VI
	qbRdICgvEpnwWMSubflr6o9PXCIzwIIj5NUHNK4KipppWluYnXKd9A+ACp4Y8CPe2nZq3MxiMr8
	R/wI15CB6dbj32WHmt9elnUzxI0bMNTmslXJge5QKveOF+586Ub50z9CLYhLPUkNAirZ9hlJZ/R
	ktbUj8xJA8hFJ8RNtoKhOWUNxLQcPuN3++Gk1bc0fcK0Ubq4IlleKQlJIu7DoMPIg1518rPincB
	dLCCOvBBunTCwLJ9lZ7rT4hVZ8joolsz+lWJ/8xhT+bGb+MQOBAV4+SWdciI+vLz3vrZ3uf6/Aa
	0NG6ZRRWoK6HmCb2a9cOKOEoqV7NBjnUXRDzA=
X-Received: by 2002:a05:6102:84d1:b0:602:9228:34a3 with SMTP id ada2fe7eead31-602922838d1mr307315137.0.1773846670269;
        Wed, 18 Mar 2026 08:11:10 -0700 (PDT)
X-Received: by 2002:a05:6102:84d1:b0:602:9228:34a3 with SMTP id ada2fe7eead31-602922838d1mr307287137.0.1773846669635;
        Wed, 18 Mar 2026 08:11:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a279c6e6e3sm590250e87.48.2026.03.18.08.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:11:08 -0700 (PDT)
Date: Wed, 18 Mar 2026 17:11:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 1/3] drm/mipi-dsi: add RGB101010 pixel format
Message-ID: <5yunhfspibjyktb2qnjeoo4d67tbmwrbq44lopfjrtbqkw4gec@un7uckbss6ol>
References: <20260318-dsi-rgb101010-support-v1-0-6021eb79e796@pm.me>
 <20260318-dsi-rgb101010-support-v1-1-6021eb79e796@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318-dsi-rgb101010-support-v1-1-6021eb79e796@pm.me>
X-Authority-Analysis: v=2.4 cv=A7Zh/qWG c=1 sm=1 tr=0 ts=69bac08f cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=FuJAHOuw8bFYrA2LdQkA:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: fXQzIWeyqXtw3RrX4ZK688rNmypZzi5a
X-Proofpoint-ORIG-GUID: fXQzIWeyqXtw3RrX4ZK688rNmypZzi5a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDEyOSBTYWx0ZWRfX9kGzwCnFQOvY
 hCLKHsmtD+JlGUGXzMq4Ym5DtafE93EypiT/j6HYcKIyFsLY8b1aZ839dkKEI0RFCh8wpuZ0TgL
 bEqEE2xQ3J2lK22P/Z/vlGKV+K3KTAbM6fWV3SHdUg+wIHjQaQMaGfd491jD/S4ML9+UjMPDzJd
 eNRVR4if6ClLWXjQJDNtbuTKWpo2NA4HDZ/EEp+DiO6zNXTBULXPFuhEroCsXOt9/bBMdaYwsR7
 VmzNYN8rCtiW1fMxy3o/8crbII3FxPZQTIVsrMBtx1zM+/EfNIWvJGmpG8Uclvgg4XGUVzg8UN2
 eiBK/17xl3WXqBZQA1K/Zjdx2Kn0hkZv4Hmj156O+O3YUuflOqPbSZm3AwpRwIGINJhJmgUTdGg
 ijg4Roi1p82dnvnk2wuLqPedFNMQ2tqywcBZYHAfbUxxCQ9BrHHJ697HoiPNo8y4sb7QwcJfI4b
 a8cayLXqvEaCzag4CdA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180129
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98528-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,lists.freedesktop.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,pm.me:email,qualcomm.com:dkim,qualcomm.com:email];
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
	NEURAL_HAM(-0.00)[-0.994];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 16F2B2BE5B6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 09:41:00AM +0000, Alexander Koskovich wrote:
> Add MIPI_DSI_FMT_RGB101010 for 30 bit (10,10,10 RGB) pixel format,
> corresponding to the packed 30 bit pixel stream defined in MIPI DSI
> v1.3 Section 8.8.17.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  include/drm/drm_mipi_dsi.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

