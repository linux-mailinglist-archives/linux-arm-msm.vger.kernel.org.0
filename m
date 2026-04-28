Return-Path: <linux-arm-msm+bounces-104975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHhjOH6f8GmtWQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 13:52:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F444484455
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 13:52:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 69EA43022AB3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 11:36:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B95CC38F658;
	Tue, 28 Apr 2026 11:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B+Lgz3oM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DSQURHJc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DFC382398
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 11:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777376167; cv=none; b=lIOtfhPeRqEDAIuvSwmdth1GNrbkjvUAedYE3TlWySHJCnXKiN25WbjqFND7lztEWSMmZb7grldFjiUpHOUDMK86ORZ/wl5E7+wIVNAS0zqHENR07ltuX6wieXXtFslpKmpIsSyOythXLBvvlqC5R3jsocptmHqtUuzEO11+mdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777376167; c=relaxed/simple;
	bh=cDmYU+Rejkj7CA4OVEj4cBeQZF7Zhbw/tP5i9ZbNs/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EXhTZMrUtihPfIG/879ucG/iQG1gVfYBAGto5KK4yQTc1Ap8PgCxNQylUfileAc+0M0wJQt87AnK2uxl58zCFliK2xvdXZaeDl/xSW+1I0v3ndqnW+6FmwZZKqCP18rkFQ+oS0sGHIAKfDxOUVX21/Meo5q+u3h1be0T9gjPkw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B+Lgz3oM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DSQURHJc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SAFtMj2111973
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 11:36:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=377DZ0H74TNC/FjMducyHBrM
	yeDlo9XVy4S3FtiAAA8=; b=B+Lgz3oMYTYR4aesU47o2XByUa2L2NvhtqZpnQ1S
	+6tFes5t/42QcZqpixbU0hAi13wN3SnBRuEIzsNj4+GTibV1XvIYfKANzp5Gmqm+
	GCyePvUap/48NGrRcecJ3NjOADXiT48gIn6V3rZWArVXOPcxLgAjE7ekQv3AYrA3
	RZPPBGn/1/Z+cFFjcDTlt1Ov81DwrRwI23EKhcA1hlKpgVL9KWrCpHuvN6TR+UEk
	NEAxy7lwi5QJ5nuFhStcvwx4R/MHRlqliD3VQRu5Sc/Z9nvoR9ixirZDCTuUnFrZ
	3GltPHWibQBUx6gCP2na6I/3Nd5xxg5RZn+XATfBqssw8w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtdmbk9v8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 11:36:05 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d812c898cso298895631cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 04:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777376165; x=1777980965; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=377DZ0H74TNC/FjMducyHBrMyeDlo9XVy4S3FtiAAA8=;
        b=DSQURHJcTaxZKSZY90Z1feI9RfTENObgIf2g5X4brudtze2PJ65K2qOJPEAZCQlEoo
         I3ZV63xgIluHXLkOuJgQOSQ6Ha1iEqU7/OXnrtbyVeqATw05zWEfLQX/t5/N8j7OYI2r
         kxT21897ik1FnXuK7qLguTBhZDcUCw9tLVTjqKThIcmWUbTfMaikBglUkq1eMCUG2GNO
         7VUCc0m1e22gELvO7pLOuGkEQjjpv9HDulL8KlqGA64+MPpkBMzi5sRXuR2FNBzDp44i
         7jOj/xF4Puj/6NTXj6lquwTwGSt4f2iO0IMyQv5BDVcfJrHsR1kcZOFPGWo03896FmVR
         3u+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777376165; x=1777980965;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=377DZ0H74TNC/FjMducyHBrMyeDlo9XVy4S3FtiAAA8=;
        b=d56isBMUzidhFS7CIwReS903X6waPUKQchcent12RBMo0NcfbuzARDoy4ZjP0PpDwx
         LMv4OxaH7kaZiwKe9STurMnvHp9csmliP1t7BrzYlM+P43JDJQmtb/PFwVu/Lru+uR0f
         7c912UF9TRGlAsYpnfKttkv+iTLZvNQHxCHfaeoTbgEso8QW604yN/ND6qcg0jaL2Oq+
         N0D6Y48Vqfne/2pPyc5C4F3MDaOp90irG5Gp5ckokXQgUay7jDWMQqxJvIC6vX4bq1T+
         tzXPlyw3slvz/Oe24BUpsCVCz4szpZ26BZPy6/0PdIkrhz2z6c20VuIojxOkI/BMLUSD
         1erA==
X-Forwarded-Encrypted: i=1; AFNElJ+IvsDaeELwW+ZcT9Dsw2vHXjsglW/17xK47iHGjHUOcYFyIOjoMqXIWJlcB3ScixjwrYOxNbTj2hQ2jsws@vger.kernel.org
X-Gm-Message-State: AOJu0YydIlaTQYXgqkcD1L/QaBwSmm7LtWQGgCCnF07ScMgnHcBiyCcd
	nyZ0q+C+IoPqSKKB+Mpj1xalX9YciSvICKdIvc5HVUXTiD/mOxzTTNMAHR8H6llV2kL6TWRFXPO
	l+uvdFwIELmTwxLsl+WyaWBf9/6H1BHn8+VolVrenmPHSyOxGbmj/RfWX+bHeoWURMCSS
X-Gm-Gg: AeBDiet9rZb4d5myUyJSL+b4++1wPeiDVIrVlnMtFVZT+aEKy+mnls4Y9dBJAw5tfCu
	mJ70+fEfPEhjvwuODXSL2FK1n3FB/htcXB5POQzTgKo5diH/SFAFPw9nydcGS4jqXOVANw1UmLr
	dB4lAlVAUKe6CyzCycU2SXN3DKDScBVHfBYVGonGC43iQjjianSVhQbGLqF9oDI1oqlJkpOy8cr
	iPTootV0FUmxSf+5q0x2/2Be7jb0Kdi9B3W0fs3Zx0yNRgFQBpfUvSPt/eWbCvW8DluJkkmUCxm
	E0qDedU2uGg0bAlWJzqDeM5Z751FNnK16dz895TvxuHb5PliwnHk6mEif/5V3BVEyvFnSkgY4hx
	V1Uvnjn/4gvr90i3CMgsBighMcsv3pBBNrRyPU3KX6QfDD0T528y4VVg6e4BCyWDEdf3QJ3md6z
	+Gm15EgAahvVPDC5ZCID41ONUXT/QwpdRqWjRkG0DIiFzNmA==
X-Received: by 2002:a05:622a:2c7:b0:50f:be4f:465b with SMTP id d75a77b69052e-5100e1a3f31mr34440701cf.33.1777376164742;
        Tue, 28 Apr 2026 04:36:04 -0700 (PDT)
X-Received: by 2002:a05:622a:2c7:b0:50f:be4f:465b with SMTP id d75a77b69052e-5100e1a3f31mr34439951cf.33.1777376164190;
        Tue, 28 Apr 2026 04:36:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a7463f9f3esm547988e87.56.2026.04.28.04.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 04:36:03 -0700 (PDT)
Date: Tue, 28 Apr 2026 14:36:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tian Tao <tiantao6@hisilicon.com>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <jstultz@google.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@amd.com>, Hui Pu <Hui.Pu@gehealthcare.com>,
        Ian Ray <ian.ray@gehealthcare.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 05/11] drm/bridge: chrontel-ch7033: switch to
 of_drm_get_bridge_by_endpoint()
Message-ID: <3sxkk7hrom35lea4hgfmh6fsm5ikyq7zm4dv7dfg7qrotgvxuz@i6hgeeliqh64>
References: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-0-4300744a1c47@bootlin.com>
 <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-5-4300744a1c47@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-5-4300744a1c47@bootlin.com>
X-Proofpoint-GUID: a-7tvIHoDlmSwLYFunYRc0orkcCFqnR_
X-Authority-Analysis: v=2.4 cv=PcrPQChd c=1 sm=1 tr=0 ts=69f09ba5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=P-IC7800AAAA:8
 a=EUspDBNiAAAA:8 a=3wW0AoOGKtJXkwOK0G4A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: a-7tvIHoDlmSwLYFunYRc0orkcCFqnR_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEwNiBTYWx0ZWRfX7+T8FA+XMpSW
 Y+OzmgZtdY+JBSBXNhtSpAPpJSDZphOMD038tYjJ/jIeOEkmjz3BMwIzp+GIkG1w17q3ujA9pZh
 LEiwbP/chD2z3+SG/8xiIDvR1H9YnIBjv5A1skKAf5tupRu/9tYkwtAUqlxe6mF9QsYJolumJ1h
 cswDKrZ+VB0//4rlKGNaLHDCA6qX2q0UEykCJsJnkM4pohB8bfEIE07xQ5DoOU4427JMwaKso1E
 0sWZ8mHhfofOdRq1o3wgyqyOGSoZG+0uSiY+rC9CKArjFDpKDtgqO/niDoiXS9dhC26vQVEK5CQ
 wdz6Tapz7HmlOewfVjYRIYXpmyV41Uh4EMXO5ygwcqHF74MFgSjo4/ftiqAoc0lY3vtUpUS6qqe
 rh/Cq4j06WZRpSEP/zE2o29gdlMgmJwYlMQv55T3XXDwUD/eKziPyhxGSN7XGYoMIpn55v+Pf0i
 UV8JwY6GyJ84S06AY+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280106
X-Rspamd-Queue-Id: 3F444484455
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104975-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,hisilicon.com,linaro.org,google.com,intel.com,ideasonboard.com,kwiboo.se,amd.com,gehealthcare.com,bootlin.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:email,oss.qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

On Tue, Apr 28, 2026 at 11:15:51AM +0200, Luca Ceresoli wrote:
> This driver calls drm_of_find_panel_or_bridge() with a NULL pointer in the
> @panel parameter, thus using a reduced feature set of that function.
> Replace this call with the simpler of_drm_get_bridge_by_endpoint().
> 
> Since of_drm_get_bridge_by_endpoint() increases the refcount of the
> returned bridge, ensure it is put on removal. To achieve this, instead of
> adding an explicit drm_bridge_put(), migrate to the bridge::next_bridge
> pointer which is automatically put when the bridge is eventually freed.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/chrontel-ch7033.c | 28 +++++++++++++---------------
>  1 file changed, 13 insertions(+), 15 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

