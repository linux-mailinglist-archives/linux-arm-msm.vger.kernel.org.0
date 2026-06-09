Return-Path: <linux-arm-msm+bounces-112110-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iJvEDRLjJ2o74AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112110-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 11:55:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9A665E951
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 11:55:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jwbWXG4Q;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DFcqSNg8;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112110-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112110-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5666430B666E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 09:49:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58E2E3F7AA0;
	Tue,  9 Jun 2026 09:47:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024AD3F7AAA
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 09:47:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780998472; cv=none; b=BecI+Nq2AMD/VQeWJ0kQz/81Ye+tYtqZEhyhia4o2ewEpo9XjZG56QWr1Ukr3BAmUbiDUtqmrg0Ivc7DQzKmdEj7l+mq7vdpKEJsAo4W9lfYp6FySekvmCmF7mnv2hfjj36kcNbbE4/j1ARWF9r5/vItt62OiBdFACWKyuQ3Qsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780998472; c=relaxed/simple;
	bh=da4DiLmkH54vMKs4+UHrFXYyvX9aCG9OfWIw37ym+Ew=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AE67oV9F76nBw/uI8PV2hM5UF9VKxD0kp8Eb6rMwcVh12pGh3NDbUBAuqX41Z+9FGmOKZCm/5rkkxRoZeBPmhsgwU1Mw14gOTxiMWZoHsqT+lFngRtYteUj2bV61YmDxHlajO4UBGNItwCY2fmK04jE20ivR6eW6wFAjSPdzgWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jwbWXG4Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DFcqSNg8; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rSHx1517760
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 09:47:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4GLG60vKqqPhXSK9u7LFSK5eRlVCZiWpAvGD6R5I4zI=; b=jwbWXG4QsCbakz1T
	QRLIlyesxqjVyud+B6kdO3KTVGd2Mq7yA5+UGl2mW/8DWMSXeA+s0fbD7oMBIET5
	+BIPMv8iMosABtSfnTGVIkEsmSpMXUpj1/sPN2uQ/zlsK1D1Ht64x2Sn74ri6aqy
	+S2aluypkX3MUWGc851kcx62+wdrmiCZBEY6n2i2pbvI3vYqmpDQDl4qid6T8hmT
	E5WklZp7rrat3Wa+h1Wotow9I2Fx4YEO64WwtDmD6rjKkQMnxrmtK3Emj1Jhm/zi
	frMJMRofXiQbas17ZcMtNUG88c1JBR1tA3hEE/ZZ3rmUJch1WqtcczJPWuvMX/Us
	McnjLw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epenr8gre-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 09:47:50 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ccf3d72081so75928946d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 02:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780998469; x=1781603269; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4GLG60vKqqPhXSK9u7LFSK5eRlVCZiWpAvGD6R5I4zI=;
        b=DFcqSNg8xOmhXLeJ6Pvt1eBDOURDa+2pxS2Zhsgeqs0jBpOWdD3OdDBMmP4WWz/xOh
         2FGcT8O9BQo1ezvo7u/NHh8pzdVFejHaYItLsGsuilu3F28TuvbFkqCobmupTMh0+o8X
         K42YVbWthGyDuLjTcXV+AHBM9AVjKPDAlYchTf90URo6P4A1zqHgGxD3QvC9Yv8+5M3V
         QB4lMgx3D/War9x/0VfDskuyp/CVFPOnh0n2Yrkyp4M8yWvXQhCTF991PL1F00Crknyd
         PJt66kXkN2aoF1wnp/1TsxnfnI/TaYtROZ+6XvRJID71Zhuq4VlWfzFHToKPX9yovCDb
         qTOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780998469; x=1781603269;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4GLG60vKqqPhXSK9u7LFSK5eRlVCZiWpAvGD6R5I4zI=;
        b=hmKM/HT/fMKauAXvHEV7KktD+qcbxFTPq2IVaZz2ZO4OKIU9LsZKux6b4o6Aj7VdWq
         M8mKtT9uQuBhlZjml76kdXF8IFqZqj5H+mVpJt72iAlXhcyFI4BxGq6zuJ8DhXF17EF0
         2bIwPPsbsvCcLNtIMy11d08xl98nKUKyop53QcSnUS2EKWc17Ywf6dfSRDOeLeuYuKlJ
         IDfWJUNqW1i2u4kyUO9/3Lvv9QP77TxtGk53w2LOVHjpnKFdFrlNwjx4YtLEpfXPDCiP
         +zQlOxOo3ww/E8BqDmiDk0Ifna2FUFVsDYLdhjs3N0jXE3mBHiAIj1enMAPK0kBHbRSG
         sMQQ==
X-Gm-Message-State: AOJu0YzBbP0EdalFRC/Whvz32q2nrdVxK+TZjdFwEhCXgaPpVaXLBytJ
	+BbzkGobVOXA3KqQlu7IAJ7xF5pJWXvYcxj8lQ5L5wDP3hVARE1WFrYRMkq8jbUu/t/VZB0H7om
	WcAZLbHnkekIknA6rKT84UUNA7Qm/ibmtJ1GjK3Jat89XpxzXMtWbwlMZS6aYQ9Yh3ROK
X-Gm-Gg: Acq92OE1aY+gOKRsZfxkqFZJdYgdOJr2G+JU962VrGtrPA8OiJescmRza4FofuXWx4r
	BWH6BuSMLRZm0k2ktK7VSYJEGCpoM1+UXvgwWqemSnSfFB5xOm4Z/jWJ05ebGcSszxbsyB+Xz+d
	0Add13th5fo3oPtHnwmbPClCfndVW3DZDqueRBGzUHOzgyMnhuzFzJDh+sVDSfUtTMlMdWWNIZV
	cJrlKE2QbbWRaIDjjvqWzkCbOi8yGuflHO03AuOO2kHFWvdW+uOVXbNqZURX0ShMX9Jnbt2eWTR
	q+6MGFPi9s6XgrVItHK52/vVxJeroKZ3vDaONuAEPRDWUQVhIfqS5kPPGdUmG2aAEhQtcrILQDD
	AFVOtANa0PvBiEqZ+nDJineyhr2EsM8pfzrEOIFRikeo7p2qmcklANqPGxsRWceN0hXIwip+AYj
	xW6rrJVJXVlWEdNdm7bw==
X-Received: by 2002:a05:620a:3186:b0:915:81ba:4071 with SMTP id af79cd13be357-915a9e098f5mr3148079485a.58.1780998469105;
        Tue, 09 Jun 2026 02:47:49 -0700 (PDT)
X-Received: by 2002:a05:620a:3186:b0:915:81ba:4071 with SMTP id af79cd13be357-915a9e098f5mr3148074385a.58.1780998468486;
        Tue, 09 Jun 2026 02:47:48 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a00afafsm2047489485a.2.2026.06.09.02.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 02:47:48 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 17:46:36 +0800
Subject: [PATCH v7 14/15] drm/msm/dp: separate dp_display_prepare() into
 its own API
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-dp_mstclean-v7-14-ea04113e8233@oss.qualcomm.com>
References: <20260609-dp_mstclean-v7-0-ea04113e8233@oss.qualcomm.com>
In-Reply-To: <20260609-dp_mstclean-v7-0-ea04113e8233@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780998393; l=3743;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=PejPis5lPUmTa0t10X2rGcGnHfGkWszn1oUEuwhLLv0=;
 b=WijUeIalYja5wc6YJaju+YjwJ6B6aB82NXj1CgEZFrCY8AbHyt+izfR8DIFRPfig0Bqoys3x4
 y7AHTm4eyHgBXEL7+fh93uvaWTePL7GNPjc4Kv4y/u3RSoTm67i1j9W
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: bAGdsDSkL1mkTHpAm8K-PuNgCldB6cHS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA5MCBTYWx0ZWRfXzxpxpUCZNHOn
 5jo4Fmif3vdLDjf7TM2okA4wF2Cbj0pa8GJupB6PIJsOihKqOTJdhfXiZHgpd8twSEsqWqdEv9d
 PypfJJv3SVplByugZIzcgYxG5CdYw5TjzroiHnwbtF6s0phRJyDasoaG5lF0FugY/BaF8CrIgBe
 0gVoCw/xZIB+Dcwh4F6eP4i6PS7yppIbBA/NBtn6+HcUd2y7Up/1zdPbDbPVjLTEhjnc8x/GSp+
 OVFXTLN4JQgOQzZ0c0GMjRgajL2KGDeXpG8ML8VTrZ2v3CnrtzHakHEVLy0WZGUEyZfm8OJRwnq
 iqBqi8XSROMabsJxn2vqAJS4FJ5edzDlHaruOvOnH2Cd4Z9pSsLZhQJt1jnzwzd/49S0VsmfWYP
 4AuQcbJFzc2YJfVZRBVXJaJEYLX+0O6RkHD26EWHK+R8BVOINbKg5TDroSZiJVFzbtgWG6DuK33
 389htXCG8TXH+8bjreA==
X-Authority-Analysis: v=2.4 cv=NKPlPU6g c=1 sm=1 tr=0 ts=6a27e146 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=rHTcTV9uYuKpyGuOXCsA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: bAGdsDSkL1mkTHpAm8K-PuNgCldB6cHS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090090
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112110-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:yongxing.mou@oss.qualcomm.com,m:quic_abhinavk@quicinc.com,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,quicinc.com:email];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BB9A665E951

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

For MST, the link setup should only be done once when multiple sinks are
enabled, while stream setup may run multiple times for each sink. Split
the link-related preparation out of msm_dp_display_atomic_enable() so it
can be called separately before the per-stream enable path.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 16 +++++++++++-----
 drivers/gpu/drm/msm/dp/dp_display.h |  5 +++--
 drivers/gpu/drm/msm/dp/dp_drm.c     |  6 ++++--
 3 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 2d5ef087648c..cd1f2899b733 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1403,8 +1403,8 @@ int msm_dp_modeset_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 	return 0;
 }
 
-void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display,
-				  struct drm_atomic_commit *state)
+void msm_dp_display_atomic_prepare(struct msm_dp *msm_dp_display,
+				   struct drm_atomic_commit *state)
 {
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *crtc_state;
@@ -1426,10 +1426,16 @@ void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display,
 	}
 
 	rc = msm_dp_display_prepare_link(dp);
-	if (rc) {
+	if (rc)
 		DRM_ERROR("DP display prepare failed, rc=%d\n", rc);
-		return;
-	}
+}
+
+void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display)
+{
+	struct msm_dp_display_private *dp;
+	int rc = 0;
+
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
 	rc = msm_dp_display_enable(dp);
 	if (rc)
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 5116f7bbbd02..43ed79093e24 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -35,8 +35,9 @@ void msm_dp_display_set_psr(struct msm_dp *dp, bool enter);
 void msm_dp_display_debugfs_init(struct msm_dp *msm_dp_display, struct dentry *dentry, bool is_edp);
 void msm_dp_display_atomic_post_disable(struct msm_dp *dp_display);
 void msm_dp_display_atomic_disable(struct msm_dp *dp_display);
-void msm_dp_display_atomic_enable(struct msm_dp *dp_display,
-				  struct drm_atomic_commit *state);
+void msm_dp_display_atomic_prepare(struct msm_dp *dp_display,
+				   struct drm_atomic_commit *state);
+void msm_dp_display_atomic_enable(struct msm_dp *dp_display);
 enum drm_mode_status msm_dp_display_mode_valid(struct msm_dp *dp,
 					       const struct drm_display_info *info,
 					       const struct drm_display_mode *mode);
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 6b8923d9dff4..4bf1a5b7c3f9 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -55,7 +55,8 @@ static void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
 	struct msm_dp *dp = dp_bridge->msm_dp_display;
 
-	msm_dp_display_atomic_enable(dp, state);
+	msm_dp_display_atomic_prepare(dp, state);
+	msm_dp_display_atomic_enable(dp);
 }
 
 static void msm_dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
@@ -152,7 +153,8 @@ static void msm_edp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 		return;
 	}
 
-	msm_dp_display_atomic_enable(dp, state);
+	msm_dp_display_atomic_prepare(dp, state);
+	msm_dp_display_atomic_enable(dp);
 }
 
 static void msm_edp_bridge_atomic_disable(struct drm_bridge *drm_bridge,

-- 
2.43.0


