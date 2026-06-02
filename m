Return-Path: <linux-arm-msm+bounces-110784-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDUnNVihHmquDAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110784-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 11:24:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FC162B69C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 11:24:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A834A316AD8F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 09:15:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A86B43D5C31;
	Tue,  2 Jun 2026 09:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nc6DvaV6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P9yZfLoH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0473D5C15
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 09:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780391528; cv=none; b=gbB3w59Wy3HzRhPaW/CwCQKnzXDgQjT66Wtmga7C2DWbVFgfPeeC1hZ1pxlU0f7ssznFO8FW0VK+f5OHZzGzXg3E83p7WzQpr+vMfH616NVjl3NomRn6OrcAuO7NBo0nMXAD39f3B7yYgT7XGUOfUyg9ElqrGySN0WfADYKjHlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780391528; c=relaxed/simple;
	bh=k+fjd0uAzZi7jcHsWm9CXjVJSBGmbgcOCLEymAHwJvg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IqVvV7PzNJ+7JKye2NHr/k/3DMiiJPUaQOQWHO7wZAwFYaDrJAhf+0JwfY9gE4wrh18au26+25kXHTse8/zJoj3ZKh3DFIzXhi57Xvp3mbK1h+DqqfeATe29QOxPKmlp638XaWyNh3OzSzEQ6mznTnb5L4pzp535+eUcURef28A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nc6DvaV6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P9yZfLoH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6525tiWc1854909
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Jun 2026 09:12:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Re9bQbGzhFUu/DwhaF7px31nxHQNbIQ8lgyi807eAgQ=; b=Nc6DvaV6tvosR4JA
	oYrChKsp58rejt9+eaHJ0rJ2iCgrOF33GM4I0Bv+z1OmU7e/sTSDIwDug/yw5u7i
	TTXi6qJoKf440aE0AjBzsLr4xT6epgHORMcHZjP6JFm4pmOrv7oyYsgg8ae4+f1s
	fjWkHnwnkTTrSHE4+KL219MhkrufEpodNXSI6OyBHJ+dTZccRXbuzZzIaYikUd6m
	8paOO1b5y0tCkx9bHzbIcHMeUst330fhjUUK0QBf+iajXJ4i8nTAu0lqrZ5v83xs
	U5KZ/REABHG8Xj8MJzCjAH5EU2ISSY0K+e034u/bbSscPPTa/Amz4EcDd6Zhny2m
	EXKlCA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehsf78sxm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 09:12:06 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5175bb9d47fso33400691cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 02:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780391526; x=1780996326; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Re9bQbGzhFUu/DwhaF7px31nxHQNbIQ8lgyi807eAgQ=;
        b=P9yZfLoHV0OdKIgmEa0MHVhht2IaeTKxyY7IM1MJybbG8G2a+w/dwhVa1z1vI63QbT
         fNZ09YpsoXxtuZPbJD+GKyJ73Mfmt7RDFucYUAGzeVJVYcsrzWAdOjieoOLLNiQ6TD5D
         fOCh9+RcFP5NksoOkBxE0scCAENA9iFBJtHY2IXI1bRhHFK9/2sbRmr0cgxQImjGB12A
         txdYkaXopzFla5ua//RTg5gX5rxqEL8sc+Rhmgih+Cxt4QAh1wu+HPahBqTbOpgJMTMG
         xRD7okIM8f+ZmxEc2GlhtvjSECQW+r42HqwAQOB17nbdCsuNHrV9VNtCBrZyFiu+qC6n
         WSog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780391526; x=1780996326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Re9bQbGzhFUu/DwhaF7px31nxHQNbIQ8lgyi807eAgQ=;
        b=PUl+swvB77vqHrbciTcU9KSbjFsvnK+JLkdZ0UxNZTsWUBnLDVys6rsxeq4hVXB0v4
         aBDY8ySuJubFMgbOdZyUXqT//SJggWlPDHkDokP232XFhQexG0+Ix7q+7YrK4rHFR24H
         8VhI8qHofX3jv8hrD20EcEBR4Mnf37zyc23Mg1pA9aaLuanyeLefP2g2E34FvNv8OSpC
         kGVx8hMt9wqWnvOejLPpFmv+PYMJePpp/OX0qAmkJgTchaX5B/yld9fY3kJ6+Dea2FyB
         SNDJ2Am0LEex2CYmGk5PV87XwAnr+Bzq+Q349TZ91ZZUo23CeegO38EfghH+iTGuPftm
         XL3w==
X-Gm-Message-State: AOJu0YyX033eU65UMXNDu7xVR2GFbMCpKMcDrcR8mZluBkiA/x372i3w
	0fgkw9tVt1UOaVw6gmkEmCGnTS6XscmqdSMq/tOGFc5Qji4B9gP3isIuHZdEOqNPkXxV5on2s40
	FZRjvyL+syp6L1N7TsNuhy+Ewl6hF4aX5QYfBsvYnnT6Qp1pg1OMRJKoMGNcsE8KxpI50
X-Gm-Gg: Acq92OFwP8Oe47kG0TtFENeNnVSWuc3wKORTq2Ns8FVcIYmw8IbZSqYWwYfHusmlWpH
	nT8pXHYLUXIiXY5HtwEpjsBSGvFb4x1Djla2HBIdq6aM8CQqrwxp5YoqYHuVgIZHrZii4Ubhe/j
	kYOQAhbfqtwsmUVVunszO6ZXb9LVNLs7LRBkZaunNGHUWVdo6fY18RZWkTCKLXuornvHr4GuMKJ
	x6Yj9UuTfLEnGmHWHDSVdFmh/vWM6j1IWJuhVGoS0uYLGsYrhxMNGs+LpQZKxlWxXJiCo9cVBxm
	rEwtg8LRw1PHh0z1nt2HMeFVJWCbVumYhljzDDF/bvB+TzJ/bjK1YEmBo9K/nj/trsoS/5v7PQY
	XtgVJr7xTkU1cPiKqbZoX2KkD0NMVLYj2JI51b6qdsi/E13Yequ55SO03W86otxZ419b9ELUnMT
	09cyxYgZla+vPP2jo/sw==
X-Received: by 2002:a05:622a:2a99:b0:516:ea30:8756 with SMTP id d75a77b69052e-5173a817bf7mr147694341cf.36.1780391525580;
        Tue, 02 Jun 2026 02:12:05 -0700 (PDT)
X-Received: by 2002:a05:622a:2a99:b0:516:ea30:8756 with SMTP id d75a77b69052e-5173a817bf7mr147694191cf.36.1780391525127;
        Tue, 02 Jun 2026 02:12:05 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51768c76e53sm12480851cf.4.2026.06.02.02.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 02:12:04 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 02 Jun 2026 17:11:21 +0800
Subject: [PATCH v6 09/15] drm/msm/dp: re-arrange dp_display_disable() into
 functional parts
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-dp_mstclean-v6-9-2c17ff40a9b2@oss.qualcomm.com>
References: <20260602-dp_mstclean-v6-0-2c17ff40a9b2@oss.qualcomm.com>
In-Reply-To: <20260602-dp_mstclean-v6-0-2c17ff40a9b2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780391476; l=3890;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=4Wm5dEjIlmt2dcJEpToKqMf/8eYUPZtjPLztPMLreZM=;
 b=q9czTavEj55EDD0AC9Z/pXgndqDGASyPrB0KPxwVGUMSDYpltbQSYpgN4VQ52U3vd4U83sncs
 RnAAe8Hddw3BAlPxYuDw4b+ZzuwYkZXgka4Ug2HDZ4cKBumqFN7Lib/
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=WKRPmHsR c=1 sm=1 tr=0 ts=6a1e9e66 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=7LH33tsxRIP6uNRhSrAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: rRureiKGH9h2ehvxuyVSPgJVbbMqvyoe
X-Proofpoint-ORIG-GUID: rRureiKGH9h2ehvxuyVSPgJVbbMqvyoe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA4NiBTYWx0ZWRfX10wdUXZO5eU0
 4JZxSeJjaXUywL+9J8f7Yu0D8kSHlDo3Jd/ruwBO/ybvkqcJRoKSFObTP5Ypz7996S7MHpaiLJi
 lVtOXOAam7BCZj3t7MmDxQCwx6FHVtQl3Sa9IQJLgoCRYleJFq1myjnU1I5Nld2CQZ6IKbK6B6s
 Pm6VmcaESvQGsz9zshsy2eN6l8JpbtmaGKUAvKR7Lclmtr+B1hziU2l2oCGFvl11qZXjagpNYH/
 Wb4aLyruh4XDBw8eRhBf9rTWHw6Q8BTrl9AXXHKWNboFJmfFIE7Gip50+f+TgKeARoZ+LDWOz+S
 U82uxc6z/ZbVj6r1nyf6FDrE/wQrf3Myw95cc28l+fbsetIOVZIHJny9h+xUkZnMdLg//zRjO3y
 lIJTg7mP2QXlZsoZgoqxSJSJhoMx1n4kbJEC3Dl1F9kjJydLY5MUKiPj1L8oEFHgcOPyfybQDHm
 k255wRMWrNnL9l6A74A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020086
X-Rspamd-Queue-Id: 35FC162B69C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110784-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

dp_display_disable() handles special case of when monitor is
disconnected from the dongle while the dongle stays connected
thereby needing a separate function dp_ctrl_off_link_stream()
for this. However with a slight rework this can still be handled
by keeping common paths same for regular and special case.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 19 +------------------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +-
 drivers/gpu/drm/msm/dp/dp_display.c | 10 +++++++++-
 3 files changed, 11 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 002141a02073..d0c5ffb907e5 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2599,7 +2599,7 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl)
 	return ret;
 }
 
-void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl)
+void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl)
 {
 	struct msm_dp_ctrl_private *ctrl;
 	struct phy *phy;
@@ -2607,23 +2607,6 @@ void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl)
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 	phy = ctrl->phy;
 
-	msm_dp_panel_disable_vsc_sdp(ctrl->panel);
-
-	/* set dongle to D3 (power off) mode */
-	msm_dp_link_psm_config(ctrl->link, &ctrl->panel->link_info, true);
-
-	msm_dp_ctrl_mainlink_disable(ctrl);
-
-	if (ctrl->stream_clks_on) {
-		clk_disable_unprepare(ctrl->pixel_clk);
-		ctrl->stream_clks_on = false;
-	}
-
-	dev_pm_opp_set_rate(ctrl->dev, 0);
-	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
-
-	phy_power_off(phy);
-
 	/* aux channel down, reinit phy */
 	phy_exit(phy);
 	phy_init(phy);
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 1497f1a8fc2f..5d615f50d13b 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -19,7 +19,6 @@ struct phy;
 int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl);
 int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl);
 int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train);
-void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl);
 irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl);
@@ -46,4 +45,5 @@ void msm_dp_ctrl_core_clk_disable(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_enable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_disable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
 
+void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl);
 #endif /* _DP_CTRL_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index cf859f880943..b8dab3f8a7c2 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -714,12 +714,20 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
 	if (!msm_dp_display->power_on)
 		return 0;
 
+	msm_dp_panel_disable_vsc_sdp(dp->panel);
+
+	/* dongle is still connected but sinks are disconnected */
 	if (dp->link->sink_count == 0) {
 		/*
 		 * irq_hpd with sink_count = 0
 		 * hdmi unplugged out of dongle
 		 */
-		msm_dp_ctrl_off_link_stream(dp->ctrl);
+
+		/* set dongle to D3 (power off) mode */
+		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
+		msm_dp_ctrl_off(dp->ctrl);
+		/* re-init the PHY so that we can listen to Dongle disconnect */
+		msm_dp_ctrl_reinit_phy(dp->ctrl);
 	} else {
 		/*
 		 * unplugged interrupt

-- 
2.43.0


