Return-Path: <linux-arm-msm+bounces-75362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E3ABA576C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Sep 2025 03:06:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 468F13AC404
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Sep 2025 01:06:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0ACB20101D;
	Sat, 27 Sep 2025 01:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QDi2iJBm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9241B6CE9
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Sep 2025 01:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758935115; cv=none; b=OF2BQaZmdfqowO1WD1MwRVAs4n3DTC37WYk1SgBw7Or16RxpOVe+dxFg1CXsWUVrxefOuUBm7GS9XorjYg9FxNVa+5qBz9CJKCTPQEagUxWiVAVnVfd6MOFZ5+inz3LpkDwlOohx57Iry2dydaJAuAKYHl0ikeGN/PhK2gG5mhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758935115; c=relaxed/simple;
	bh=SRdsHNR0LO/SljNP2tmHd0np6D3Jw2olFDYhbWhBuVw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZN8XxDOJMePcGpvgf3ixt5QnrzGILYB/t9j8bCCFkAfV0KPAOS2DB9sntx1+tbwy+DFriBMyutTfoqeKtaEGVs2LePSy5bXw3RGEur/RVjjTOAcMpPq8K3ogr2qREXDKIUHM57qKff4KM0ntkWKoJyAWTJSem0RDjfxWMIq+lhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QDi2iJBm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58R0gqxE011889
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Sep 2025 01:05:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l1ReRpPqrVzS8dYBiuFlXpsNAUSjSC7vdxG38yy4lOA=; b=QDi2iJBmOAe289bu
	ESavkYGg/aib9Lmi4hEjsKBuz55srjSA/nH+EQWD/o0RpTB4LmHnG+WlT2dECr2c
	7e3Q+8YlCBiZV8X8OFeXh9WeAB8nSENYypTIHGecs/5uNAYH+wJktkJuNz0cAiZ3
	uxtn8HfWJ4d13s8O/1/qw0X2IkKnFpu5ip0PgspkD8Q4wkAjrupE2l4jmk2QeAkE
	7xz3t4E8QQ+8nPaProcefTjG37VaYQSO1Yr4yoiytjvECdW7ztDMm/SO5IrAi74X
	JJbTzGOaBYsbyG7D0YuiqahtW3ZRIkwsyPJdTlQq1p0jUSVJcvIjQeX7HZXOi1Yv
	J6zJ5Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e5mcg0ub-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Sep 2025 01:05:05 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b5f6eeb20eso95626931cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 18:05:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758935104; x=1759539904;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l1ReRpPqrVzS8dYBiuFlXpsNAUSjSC7vdxG38yy4lOA=;
        b=fYYhIZxs77oGf3mKLnUkJClwStNUta0cRuJTe8f7t4vePa63uSQUqgwlB2R8t4e6ad
         1wgqSDgq2s3s7E0in6gZIWhDhVX9WNE9JzjBuUO1sVuyOLQTEFFeJwBmv6rFKgKk+A8L
         IZxO4RAXsJcuyDdZ8u1x/HxCmH3E58uxTdcUPi7R55np8sGakSCBTMkOg3D4Sxtncaet
         NCpMpZXl/WLrFhm5nCFGeeEG1MfVSps0wNt0iHtz/Z1NzhzcD/2EzwARWQhZpL/0CTL3
         qVYzvCePgxq0zry/CnwN54QOnA93EOPQKqjd44h/CiHBdUUkM52rWatxlHg6hYnARUB+
         oELw==
X-Forwarded-Encrypted: i=1; AJvYcCUBU60fTxLmqjR1UC6gJygLBEzemwEnca5ZXemAeBjJv8bT+lLlkDbPznlOw2ANbpX9ljBuIQF7nuU2hv47@vger.kernel.org
X-Gm-Message-State: AOJu0YxQw53/ta1pdwaglVNQLMpDmRqvJcQaGSoNwd3hO5pYtm+PbZvj
	fdL0+2zxaiY004n1dvNCZ7n/0x9fv3dcwbB51gBFQ58fJbdIHbGX/lH5bVC1XdqJUgPOriS8ati
	JWZGI/M1Tx9hMBVOBWPnOj+h0pzI4pPdhBNyXbq9LZYRRN0mFCqpZYAOBWxC2lNSKLlfJ
X-Gm-Gg: ASbGncsCmo3fAGAUiDdCaq7JBHm4q7Uxf+M/G9yvPNloOo1lS5q8fGYN0+/85RBIdpw
	FvuW4O++8tMkiz3pIUwM2vM17yg5UJGGvXFrbdX7fGZh+5iadBBHRwb5X70EBPIJPyfbfJ//MnU
	xnZsRhO6dKAEcWqcLTI9NQdCvW5bN6OyEqMqtAyugcw8kfnkEp3mN/ACizwZPAHaVZzMrX15mne
	KUfFZjOLnbp85M7IlES0CpLSrrvLxrL5rvAzHKy+efUA0HN40K16E1+irzJlA+R/Mu1aPVuJfko
	PUS+N8+xpO2da7D6XPUE81FWf98rKgfOIJI40pPSAn98aM+titlOxnRd+f2+m8dFmrInW7yp15x
	y8BRflYmR4IjC9ZsazzMvuJUa6noedGAIGCunUMuzdd4/hJ1JYOgo
X-Received: by 2002:ac8:5852:0:b0:4b7:9743:6da6 with SMTP id d75a77b69052e-4da4d02b61bmr114904011cf.70.1758935104446;
        Fri, 26 Sep 2025 18:05:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwTmhqnyjZFBwp/HsFiMEBnuWPK9YLUS4DPznVcdyQv+I6YogfCDp6AQn+3SRx+7bfeXBXfA==
X-Received: by 2002:ac8:5852:0:b0:4b7:9743:6da6 with SMTP id d75a77b69052e-4da4d02b61bmr114903571cf.70.1758935103968;
        Fri, 26 Sep 2025 18:05:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583139f99c1sm2156143e87.35.2025.09.26.18.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 18:05:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 27 Sep 2025 04:04:36 +0300
Subject: [PATCH 7/9] drm/rockchip: rk3066_hdmi: handle unsupported
 InfoFrames
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250927-limit-infoframes-2-v1-7-697511bd050b@oss.qualcomm.com>
References: <20250927-limit-infoframes-2-v1-0-697511bd050b@oss.qualcomm.com>
In-Reply-To: <20250927-limit-infoframes-2-v1-0-697511bd050b@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sandy Huang <hjc@rock-chips.com>,
        =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2953;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=SRdsHNR0LO/SljNP2tmHd0np6D3Jw2olFDYhbWhBuVw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo1zgg5I6HgovfGNCnJrr9DZzOmlvr89IG2N7Im
 J1IzAHqkSqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaNc4IAAKCRCLPIo+Aiko
 1QseB/91TXFBZi0pEpfz77geu/ZrsROvcW7gOnMXI7ySzBuNlQ0kbfHKfrR1hUQKrPiz+7O3Jyt
 NG+3ogi0SSqQIhJWGu8FsrNLkhtixlNgVerOl1ZDM2aZ+xSH870nIvmmE1uPJey1/Za9yRjxka1
 kIELmhbciVh07+E4ejIJiDgMU/A1ybNMwnRww/7ZFXo5VNDJ4bE6RrOn9IdGr79W/444T+7Whog
 LSCWgGHlVq4g2bQ9RmPH0uGaOYeFpNQu57k5KoEvnqJv1jFMj7p/dAs8EyfS3UCh6z6w+UvR3Lc
 oq2InUo+uryQ5zZYarcxA8FBAO5BnW4QIvwhKBX0jSUfxpty
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=RMC+3oi+ c=1 sm=1 tr=0 ts=68d73841 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=XNEcMcDYeHr5uxMbIEwA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 2e6sMeKxszKa3ngEOX8PC2Rf5ETXgnRb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwNCBTYWx0ZWRfX3PQL2LqinPgt
 6NOMqRlUaz1Nu4oZ5bnt4UxyT63Gn2QyPpPSQTXr+/morH5qTSERQt+95tJ4gmZKKDweGa/SVym
 r6afmEgs8HgH/K8leqUCdcoJJjL576wkbSdIqwjn9vwaZRgj9A8kwUvG3+8ETbZYC0//P2dCQAl
 vl5og0GQW+l5Op+FuFJ5/X9SurkiSPBQCiLdy6hKEOyUW7D86Un5C04iOAn+Imeucou18/SAHSU
 vF3M/Q3l8h0VaIHE4wdyVPzV2XZoekSdFxs2RYhi2Bylz1qeFvsAAcfnqlGT2ClVBwUuRhE8Dgd
 Jlj4+lehe3A2zTNHTsfJj3yTMYyqScFkFhEovst/vtjosb6305jHRgtcEqh8x8NALYpCuv+7Opq
 OwH5QlG7CyMhIiHmsTkNx/rXo37mxg==
X-Proofpoint-GUID: 2e6sMeKxszKa3ngEOX8PC2Rf5ETXgnRb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_08,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270004

Make hdmi_write_hdmi_infoframe() and hdmi_clear_infoframe() callbacks
return -EOPNOTSUPP for unsupported InfoFrames and make sure that
atomic_check() callback doesn't allow unsupported InfoFrames to be
enabled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/rockchip/rk3066_hdmi.c | 38 +++++++++++++++++++++++++++-------
 1 file changed, 30 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
index ae4a5ac2299a93a49f87df7604752f6b651c839c..cbae27e2443798d62bd83acc8b979cfc34df3544 100644
--- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
+++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
@@ -162,10 +162,8 @@ static int rk3066_hdmi_bridge_clear_infoframe(struct drm_bridge *bridge,
 {
 	struct rk3066_hdmi *hdmi = bridge_to_rk3066_hdmi(bridge);
 
-	if (type != HDMI_INFOFRAME_TYPE_AVI) {
-		drm_err(bridge->dev, "Unsupported infoframe type: %u\n", type);
-		return 0;
-	}
+	if (type != HDMI_INFOFRAME_TYPE_AVI)
+		return -EOPNOTSUPP;
 
 	hdmi_writeb(hdmi, HDMI_CP_BUF_INDEX, HDMI_INFOFRAME_AVI);
 
@@ -180,10 +178,8 @@ rk3066_hdmi_bridge_write_infoframe(struct drm_bridge *bridge,
 	struct rk3066_hdmi *hdmi = bridge_to_rk3066_hdmi(bridge);
 	ssize_t i;
 
-	if (type != HDMI_INFOFRAME_TYPE_AVI) {
-		drm_err(bridge->dev, "Unsupported infoframe type: %u\n", type);
-		return 0;
-	}
+	if (type != HDMI_INFOFRAME_TYPE_AVI)
+		return -EOPNOTSUPP;
 
 	rk3066_hdmi_bridge_clear_infoframe(bridge, type);
 
@@ -193,6 +189,31 @@ rk3066_hdmi_bridge_write_infoframe(struct drm_bridge *bridge,
 	return 0;
 }
 
+static int
+rk3066_hdmi_bridge_atomic_check(struct drm_bridge *bridge,
+				struct drm_bridge_state *bridge_state,
+				struct drm_crtc_state *crtc_state,
+				struct drm_connector_state *conn_state)
+{
+	/* not supported by the driver */
+	conn_state->hdmi.infoframes.spd.set = false;
+
+	/* FIXME: not supported by the driver */
+	conn_state->hdmi.infoframes.hdmi.set = false;
+
+	/* should not happen, HDR support not enabled */
+	if (drm_WARN_ON_ONCE(bridge->encoder->dev,
+			     conn_state->connector->hdmi.infoframes.audio.set))
+		return -EOPNOTSUPP;
+
+	/* should not happen, audio support not enabled */
+	if (drm_WARN_ON_ONCE(bridge->encoder->dev,
+			     conn_state->hdmi.infoframes.hdr_drm.set))
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+
 static int rk3066_hdmi_config_video_timing(struct rk3066_hdmi *hdmi,
 					   struct drm_display_mode *mode)
 {
@@ -485,6 +506,7 @@ rk3066_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
 }
 
 static const struct drm_bridge_funcs rk3066_hdmi_bridge_funcs = {
+	.atomic_check = rk3066_hdmi_bridge_atomic_check,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset = drm_atomic_helper_bridge_reset,

-- 
2.47.3


