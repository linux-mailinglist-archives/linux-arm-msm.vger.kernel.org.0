Return-Path: <linux-arm-msm+bounces-110102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0EQmM8gcGGq+dQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 12:45:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 943A25F0D2E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 12:45:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C5CE830AF074
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 10:42:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 306EA3C584F;
	Thu, 28 May 2026 10:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kQG+Juk9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HL2dDMEM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1513BAD93
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 10:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779964912; cv=none; b=lWlHolZXNjhB4ZhZ5JabrSZvXhwttk1yD95EceuvPQ5ew0Pw8+oDcyM4TUxCxsIU+G41tnELJJh73UvgDIEI1KDjtnmhIltIDYIZPZwoH9LPai3OfKsPoZsTreMuqgeVvjZx/V5yodm7YB1+CuTO1sc9icbpl9CnHef+97oxH+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779964912; c=relaxed/simple;
	bh=9RrNuNwTk/ww6iYx0SuggmHq9TFnipSUNnQOBEesNk0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=orE/mgQmGed8zrtLBlz7MCUGD5sCj9c+uZ4D3QVTnXY8e9YE89F7aZRnUdOuDgxc1Xy9km00eDAP4Hzlweg9a/OJKf6i4WBR5wmYIz/zBmdFc6cLhRzQCExkMBbbejpvOPIi3agbHXrO4F7ACRB40+FdmfHwQ8C6xk3rQLEK+nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kQG+Juk9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HL2dDMEM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vYvp1697184
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 10:41:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tpsE/BLJmEgKnrnJMIR8sDLnWgNFGNEPlGiP1+qAsFQ=; b=kQG+Juk9SVHTotYL
	Czw2ZdEwNgLUIbA/J/QDHH6g4V/R96HodONjjJal42NCCypvvp72fccz7oJ3QsZJ
	oDpAY+Wz/MohKfweQZWGYPtJ4nmdcG0aK1B6FoZMg/xIl66NNwRg2kcKNQaVU8Bh
	gYHNF/JUnBoWs4GoeAFTKRmE/dKbi5AlrStEzcr4i6ceKaWzZfJbFw4lO+fUzQon
	xIDfWUrgeFEW+EzN7Yq6UC078+soP81MsBF4S7fHXmgITJFiQlvKcTSQgbLKVL/D
	raPCpPYRt/c2foL+wzYA7Yzx0jFHWH9BAKqor4NsSDXK3EAM147zBueMUstek2tU
	u66uiw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7yaje8r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 10:41:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-914bddf7767so1020163885a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 03:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779964909; x=1780569709; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tpsE/BLJmEgKnrnJMIR8sDLnWgNFGNEPlGiP1+qAsFQ=;
        b=HL2dDMEMa7jd+g1QJc3XCuPzg5lGRw/Bb6DMNsPGyand8vX0+g2/M5+bqnm9DBZGGd
         wGxRHJrxUvavU/cq4FMv6ur3LitbCvFtaB3iqNWNNYN62qsw2oCwXCwxBwrHQKBpbYGn
         /Utmh22m4llVKRRlkk2n0KdDRgQEFdM9LeGMbmE6yRqHxIiE+DDCXw82I7ewoQ7M+8zq
         hDK4CgVCcrjWgBo0oEQFWJPF/5epLeB1zbU0s+kq9J+59nLydeXTrGa9mI7WB3OwTVEZ
         yyCZIY4hue2o84Xbf0+fYAjBURUDfWVd+X+jnzIPTj6eSMYQqelfG4kyS1jrvigFy/Us
         J5pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779964909; x=1780569709;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tpsE/BLJmEgKnrnJMIR8sDLnWgNFGNEPlGiP1+qAsFQ=;
        b=NJgj135CBlhR+YDswiYv7dwOoKfNDPNzKQmHHnH22K4dratvwLKHvXcbLrhdYKMYgC
         rZ+iPMY9EYSWZtahiavrKhfc/fjzsejOBxYbe7bv7J4zlkB+Qi7MI4oOwUkhHnKOpie2
         al7+i8CuZltVF1TdNFpvpSNl1hFe5CYLvE35VTcEw9DH/Qao42oxOCUKBgsF/EaDKAee
         +IfvEC6Vksw+kQtRseeRRrKo9TyF2+1jBzMiCM6uZpEqH97X1LaZ12LCKD2SfeJg/LJ8
         n2V2Kx1/dY4v9PeSXDvqnBNGwfD1d4vQxbo3fjqM+EXvx6cGkKzN/HBbdgSy+d0d00Wb
         nGDw==
X-Gm-Message-State: AOJu0YxBDnhctPAJN80Mc+ee+gG/xQMw0q7zLXC2XXYr+7NvMlOgoS/C
	fcUREJNGsss5eyKgHBCOvTxEJfZQqLfvsUih28AsRP2ksfJSG0MlkakLkP16MRE0LhLXO8A5V4H
	TO0Aj/pB1hKJ9/TpkGlkmYcCysrMcF8k3qp/65C0w1S5wnYUbsOgTgp7YZow5bdphU80z
X-Gm-Gg: Acq92OFeGfJESm6668bMkowhmFGRQ0b9j++zKRyEcDy+XJSBf/i6hwhj4gpToF8QFZX
	zjIwbaZhbXDEFxXXXfwsoz9DUXp9QdXVcb1wFObdpQwTFvED172gVIxUymC56SDGYtUCeJclvQt
	El80XCfjJ7IuzCAgEMbaKFvXxp4TNlKhSM4lLL0EgGWGWxJGfZ/RxtC6rVndqUNt7d/kAJFsBz9
	2lgO1I6X12iMXY9EWLDc8ghx5vVvttwDCMBlNMZe/CtWQDe94XIfk7dZrsiQvC5SVawSJ69fK+/
	aLZTiWkCzhV6BshlZltDj7i4dZz+piYO/lQGu4HlgHGnR+TaaUfnqBMo00m7pXA87EV3G79B2Xu
	6ws5zKSLg+5xStZxz3M5TsJg7MTrtWpfIfDazm3snNUQnlfqRKPScP58efXsFW+P1vumc3X/nFA
	xjrHUa1Qr7Ec0n7nVn+A==
X-Received: by 2002:a05:620a:1a0c:b0:914:c01e:6f92 with SMTP id af79cd13be357-914c01e80b6mr2782525685a.18.1779964908819;
        Thu, 28 May 2026 03:41:48 -0700 (PDT)
X-Received: by 2002:a05:620a:1a0c:b0:914:c01e:6f92 with SMTP id af79cd13be357-914c01e80b6mr2782521885a.18.1779964908368;
        Thu, 28 May 2026 03:41:48 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-914f86fffddsm755148485a.12.2026.05.28.03.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 03:41:48 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 28 May 2026 18:40:36 +0800
Subject: [PATCH v5 15/15] drm/msm/dp: pass panel to display enable/disable
 helpers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260528-dp_mstclean-v5-15-a9221c1f1f3b@oss.qualcomm.com>
References: <20260528-dp_mstclean-v5-0-a9221c1f1f3b@oss.qualcomm.com>
In-Reply-To: <20260528-dp_mstclean-v5-0-a9221c1f1f3b@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779964831; l=3051;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=9RrNuNwTk/ww6iYx0SuggmHq9TFnipSUNnQOBEesNk0=;
 b=NUSYehlP04crvps+VPP259ZW5+AW1qkFK0Wi1t/AyhuKVspU510X+GVtKQ1PDP4N7qLZ9NfWQ
 uzd4MMW4C9gDsqvx+ZO39rdNfAIQjku5I/1EtfrdTdFiOT/K5fvu3H5
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: 2hwzT9-TZhLKPd8uyI95OXw7ZE5xppak
X-Proofpoint-GUID: 2hwzT9-TZhLKPd8uyI95OXw7ZE5xppak
X-Authority-Analysis: v=2.4 cv=E/r9Y6dl c=1 sm=1 tr=0 ts=6a181bed cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Kfrt2GjMPgVQdVN7MJkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDEwOCBTYWx0ZWRfXwS9pvGHVVL05
 WWBBFOJHhPICFc9SyUMe8IEoezqhfuUGBLeKAZRjFMlKomYTfe0HX+7fUPBd0Z3fo/9dSA2YmMm
 V8JR0+5jsZF7IgNTCTQyS7f+mhPtyefauF9yH5UXQPhMbd7I3XcInvcC86yrRahR4vAw6TK2fXG
 NIa8+n1doQ+2BVDaA4oDc7dvM33D+S/ia4xqPo6ZvRth8rG3FjMZrpGndUlArbQVTF6PSGOehaF
 g6VJdqtV26oGwm8oXVzNTdYskIwrhU0JDarJ48fhwh9x5y7eA71Z8B0EO/Y/4lVkqZNEGYJ6nSm
 KVv0Meq5t41ktrkFSIyL2n/Cmj2Idu2p/+zHOlQ3urgWnxvQ0XEwzL7U5rj3PKkI7I8XMszldBZ
 49TAvEGZ+mtBv6EpanG1LwloAy3JQ23tqoRxllZaYIZ8ae0pi4UeRFaFH550MaG1sKjdLf+yGqY
 Ha+h6Q8rGvcynEcXCxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280108
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110102-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 943A25F0D2E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Pass struct msm_dp_panel to the display enable/disable helpers to make
them easier to reuse for MST stream handling.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index cd1f2899b733..bea5bfb22967 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -650,7 +650,8 @@ static int msm_dp_display_prepare_link(struct msm_dp_display_private *dp)
 	return msm_dp_ctrl_prepare_stream_on(dp->ctrl, dp->panel, force_link_train);
 }
 
-static int msm_dp_display_enable(struct msm_dp_display_private *dp)
+static int msm_dp_display_enable(struct msm_dp_display_private *dp,
+				 struct msm_dp_panel *msm_dp_panel)
 {
 	int rc = 0;
 	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
@@ -661,7 +662,7 @@ static int msm_dp_display_enable(struct msm_dp_display_private *dp)
 		return 0;
 	}
 
-	rc = msm_dp_ctrl_on_stream(dp->ctrl, dp->panel);
+	rc = msm_dp_ctrl_on_stream(dp->ctrl, msm_dp_panel);
 	if (!rc)
 		msm_dp_display->power_on = true;
 
@@ -707,20 +708,21 @@ static void msm_dp_display_audio_notify_disable(struct msm_dp_display_private *d
 	msm_dp_display->audio_enabled = false;
 }
 
-static int msm_dp_display_disable(struct msm_dp_display_private *dp)
+static int msm_dp_display_disable(struct msm_dp_display_private *dp,
+				  struct msm_dp_panel *msm_dp_panel)
 {
 	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
 
 	if (!msm_dp_display->power_on)
 		return 0;
 
-	msm_dp_panel_disable_vsc_sdp(dp->panel);
+	msm_dp_panel_disable_vsc_sdp(msm_dp_panel);
 
 	msm_dp_ctrl_off_pixel_clk(dp->ctrl);
 
 	/* dongle is still connected but sinks are disconnected */
 	if (dp->link->sink_count == 0)
-		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
+		msm_dp_link_psm_config(dp->link, &msm_dp_panel->link_info, true);
 
 	msm_dp_ctrl_off_link(dp->ctrl, dp->panel);
 
@@ -1437,14 +1439,14 @@ void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display)
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
-	rc = msm_dp_display_enable(dp);
+	rc = msm_dp_display_enable(dp, dp->panel);
 	if (rc)
 		DRM_ERROR("DP display enable failed, rc=%d\n", rc);
 
 	rc = msm_dp_display_post_enable(msm_dp_display);
 	if (rc) {
 		DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
-		msm_dp_display_disable(dp);
+		msm_dp_display_disable(dp, dp->panel);
 	}
 
 	drm_dbg_dp(msm_dp_display->drm_dev, "type=%d Done\n", msm_dp_display->connector_type);
@@ -1479,7 +1481,7 @@ void msm_dp_display_atomic_post_disable(struct msm_dp *dp)
 
 	msm_dp_display_audio_notify_disable(msm_dp_display);
 
-	msm_dp_display_disable(msm_dp_display);
+	msm_dp_display_disable(msm_dp_display, msm_dp_display->panel);
 
 	msm_dp_display_unprepare(msm_dp_display);
 }

-- 
2.43.0


