Return-Path: <linux-arm-msm+bounces-75412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5894DBA6B55
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Sep 2025 10:26:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9AF477AE77E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Sep 2025 08:25:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C69D2C1586;
	Sun, 28 Sep 2025 08:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cxLU/nZV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5B02BE7B8
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Sep 2025 08:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759047927; cv=none; b=oUGQDUdK8uzvrzQw+wc/Q8psArs5XWs7k0VVXzdeChM2ns4yCkWLwrJhHX012TwUq7TSMAqA6+148L64506LqYyyUo9Nhrh9VUxsFfWS/Whnj1FqpZT5KFeXyxQ3eXOMzJSgXOU89pzV0VFX7jXbBFVZvfnN/+OV9JKODBtYogg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759047927; c=relaxed/simple;
	bh=SNmzbnw2SRpSDuHUMU89vGrNBx2CzM0VUWkNV9VkozY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sWkplYKBWkyhB1rxbzZwDTCA1EREJiMpL68C/Y5RBlF+JpSwwi2WECFbd7GoQLy5WiQZpF17uCgDQWgOHIiQax61SJz49QStW/NnBWf7NycVUKKt/LTZQ5zg7phje1Q2PR7jOuExxtUlZh+heOjKrPYekVgBrRTA+7+pI5kEEFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cxLU/nZV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58S0rNMn010468
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Sep 2025 08:25:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z7oVTmK4jTegfS2LDYKFs2TDqZVMBs8llu7PGEMrxt8=; b=cxLU/nZVz5UWUibq
	ZG6VxhOTPNQsP2gAAYed3eAS3hPx2zdPmA6z+TP6CLhhgfpJcHe+qqgkbqAF/nF3
	GwyISE9aK7iqgyqPUeY5UTYNjsJlJF8BexHyQuGXwza/gNhtEwA4ub+t5dXwbb2K
	gWvAQhohtLv8z3vJ3XP2x+rk6DpUgEXK/b+XEVrzMycX/9iaahbZ8o2D69HB4vpK
	Y07PU4GSBFOXfMNkp+0W6zS5GkL3afys9aF//BG7eZp15nT/oTluCwaKbtBkqH63
	JPrAg2rMw+NcKCx8GgF+B5Xru08K/QkuwMVwfiL/h/wnt/8QE8FgFgh3afcSxOVL
	/FPurQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6x5jfsg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Sep 2025 08:25:24 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4d8b8c3591fso104286231cf.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Sep 2025 01:25:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759047923; x=1759652723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z7oVTmK4jTegfS2LDYKFs2TDqZVMBs8llu7PGEMrxt8=;
        b=m8Ub4rNXZdj+PfFq1/Kwd7FOMvm+lpKh5GoSkHOW88wlAAx1mSG2WQJw9mHowRqUKV
         J8B2uCtRJfJvC+61mrzSMe7fLE0cqcm4H6XatYUlDMDnO7VQv+iew5ZypsccMGDGNNY7
         JamXHqk6FN8LAzvTnIKGDdr1p5qdPQLo6Na6k8KlJBcq5sDLHTmBMcd6H9BgOZhxOQ6y
         o+drBbOmcuyRn2iks5RFCQy5ui4APVQdir6e/JnLtl2C1sUh3yngRH5e716M1XsSWfPS
         xkGKlG4X82BSR3yUeOFwI8ONanGVrZ7bGRQCXj8AC74K7N0yJ4IAeiXEWtlW/V58gv1x
         NUnA==
X-Forwarded-Encrypted: i=1; AJvYcCXWhKZF0aeund9cKG53UfpdhnCa8qMvAp8XRwwqq6SDNTNgm/8cdaujwfdQ3rf+HHzgrPuAIV8ioxyGpsCt@vger.kernel.org
X-Gm-Message-State: AOJu0YxHhi/KXkcy5EVTJRaeZemDzf4jR7IRf6IOYRu88lyJ8G0rmh1G
	FerdwlewQrIkStPITnZYhar2vIKYIBn2nXP7tPnoE/iaQepoE7lNk5lpIFJwZYeae+sdHYtYkkL
	C2K85CvvuYGbnNdLtItKkf6MeTfm2kGNbdMx+bGG57HEPLsKFsXC2ohQM50+Wg0qX8xDO
X-Gm-Gg: ASbGncuSOpvEOS4434aADfA1ZjFiYS+PFf2ZOTXTnogGGOK2uCKka/oUWDPN4kSywse
	kovpk99rwji2sOg8YgLNt3/erkpfO4H70t6+TA/l6PTwEy8Qtoko3ARopRhtoMtABcanivzJkAa
	Ybf7ZlSFyyZK+negiYFL0nS6Z0Dr1n4GSVGBQAJdKMPL6GA2gAZYp1H8P/UIxXp5Y5YMDJuVM20
	Tx0OEYE6myiwxkbvBCAYX55Yiz/fu+8Ea4563Lu8+vmA1pFIPaXpMO8nkhtdfWVM+S/9qoIz1w/
	3DWGBYt1hUn/Klbun+gpLkNUZ65zNdE5rMj/cdD47cVW+q0mCYgDRJRtwftyz+kkdUTS7WvJhgU
	3pUTe3QcKFd9NtIFXBKqTSaKD1yBfnVEhVJskT5yGcCUgFzOUzsZv
X-Received: by 2002:a05:622a:1451:b0:4dd:e207:fe2 with SMTP id d75a77b69052e-4dde2165a57mr93280751cf.41.1759047923201;
        Sun, 28 Sep 2025 01:25:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEESn7rJMVdvgKDwuqV4pofk8SCks7ZTpp/nKrxlhNer6Wcz1kuf5zkj5btieQDBdmwJ29uJQ==
X-Received: by 2002:a05:622a:1451:b0:4dd:e207:fe2 with SMTP id d75a77b69052e-4dde2165a57mr93280551cf.41.1759047922745;
        Sun, 28 Sep 2025 01:25:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583166561c0sm3244298e87.81.2025.09.28.01.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 01:25:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 28 Sep 2025 11:24:54 +0300
Subject: [PATCH v2 9/9] drm/sun4i: hdmi: handle unsupported InfoFrames
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250928-limit-infoframes-2-v2-9-6f8f5fd04214@oss.qualcomm.com>
References: <20250928-limit-infoframes-2-v2-0-6f8f5fd04214@oss.qualcomm.com>
In-Reply-To: <20250928-limit-infoframes-2-v2-0-6f8f5fd04214@oss.qualcomm.com>
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
        Andy Yan <andy.yan@rock-chips.com>,
        Samuel Holland <samuel@sholland.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3167;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=SNmzbnw2SRpSDuHUMU89vGrNBx2CzM0VUWkNV9VkozY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo2PDUVHPts4iT9DO40TpNVuDbiJgKbp9tiaTF5
 1h5ic+PbuaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaNjw1AAKCRCLPIo+Aiko
 1X1PB/94ehTdKMPnfDOQqb5MoKaN8Ah7FgUWp1xokcVcE+txfW6tC2jaIjwYYAAMg3MJu5MKqOd
 4PWONxLpvDmWFuvW0awSN19CswKo4/ryi42gY9MMgRQVUs1fvs0lmIjNQQmMh/GtJGpWRmGFZ1Z
 pFUgZysdcpoJqNHMmpRuPnDgdLsPdkrHk1iSNAdtKMHFHrPWMg4EQBxyTtppsBsV+NDtUojhffi
 xOI8LZwI15c1n9YOqXYsq8iXY8BHtBBCR74y/paTdp5/44jEoUPkdBhMZsbD2jB5l/oT7LqHFXS
 sXRyBWKd0da84pm5V/dCUkLlQgTe+nmOwJ0AI1Mec36mivUm
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: tSTP_m_sTdX1y7JZWQSS-OoisbO4QFWY
X-Proofpoint-ORIG-GUID: tSTP_m_sTdX1y7JZWQSS-OoisbO4QFWY
X-Authority-Analysis: v=2.4 cv=ZtPg6t7G c=1 sm=1 tr=0 ts=68d8f0f4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Uj443JZPoyhSIAxeSSAA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxOCBTYWx0ZWRfXyqrdLyci8o/K
 ZEMCOJ6IPsae9vfN7Xntqyo7V5pwdN6H7OwySRnheK0buQ7ScaVdyAxcekr6YsvUxciuWWOicL8
 sVYZLDy5TJYNCg+LadTz16UdU0VhauJoFdg+fvxQCkyFEEdtIPTsKsEwLh0UcdUsYUJBhhLQVYP
 EWOcSTd6uChdolXHhtzgG6tijXg2vWNXKMxoYi3gB0WaEbi0zwT6VTZP9hbtjxdcuQvdF0UDQgy
 gR6GsudkwrhLs8JE18ACnsI28dd36mRXyT4rXDTqWOOQkPu2pUZugS5LPKKlM+c+hofNvQZ5TDW
 wABiXRJvJZCKPTFU3r0JKFkNdwe9moiwp1XctJLlxlFn2yJ3sYSh3q6vb5NWt4aH6dYLTmY8YYA
 7uJbJudKhSI9CjQQISPceRfLug6I1w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-28_04,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270018

Make write_hdmi_infoframe() and clear_infoframe() callbacks
return -EOPNOTSUPP for unsupported InfoFrames and make sure that
atomic_check() callback doesn't allow unsupported InfoFrames to be
enabled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 51 ++++++++++++++++++++++++++++++----
 1 file changed, 45 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index ab0938ba61f7d75dd0bec473807a04a20e1cffbd..6d41207548386c0ae14ba0a9b7553fe0d3bd001c 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -47,11 +47,8 @@ static int sun4i_hdmi_write_infoframe(struct drm_connector *connector,
 	struct sun4i_hdmi *hdmi = drm_connector_to_sun4i_hdmi(connector);
 	int i;
 
-	if (type != HDMI_INFOFRAME_TYPE_AVI) {
-		drm_err(connector->dev,
-			"Unsupported infoframe type: %u\n", type);
-		return 0;
-	}
+	if (type != HDMI_INFOFRAME_TYPE_AVI)
+		return -EOPNOTSUPP;
 
 	for (i = 0; i < len; i++)
 		writeb(buffer[i], hdmi->base + SUN4I_HDMI_AVI_INFOFRAME_REG(i));
@@ -60,6 +57,47 @@ static int sun4i_hdmi_write_infoframe(struct drm_connector *connector,
 
 }
 
+static int sun4i_hdmi_clear_infoframe(struct drm_connector *connector,
+				      enum hdmi_infoframe_type type)
+{
+	if (type != HDMI_INFOFRAME_TYPE_AVI)
+		return -EOPNOTSUPP;
+
+	// XXX: is there a way to actually disable the infoframe?
+
+	return 0;
+}
+
+static int sun4i_hdmi_atomic_check(struct drm_connector *connector,
+				   struct drm_atomic_state *state)
+{
+	struct drm_connector_state *conn_state =
+		drm_atomic_get_new_connector_state(state, connector);
+	int ret;
+
+	ret = drm_atomic_helper_connector_hdmi_check(connector, state);
+	if (ret)
+		return ret;
+
+	/* not supported by the driver */
+	conn_state->hdmi.infoframes.spd.set = false;
+
+	/* FIXME: not supported by the driver */
+	conn_state->hdmi.infoframes.hdmi.set = false;
+
+	/* should not happen, audio support not enabled */
+	if (drm_WARN_ON_ONCE(connector->dev,
+			     connector->hdmi.infoframes.audio.set))
+		return -EOPNOTSUPP;
+
+	/* should not happen, HDR support not enabled */
+	if (drm_WARN_ON_ONCE(connector->dev,
+			     conn_state->hdmi.infoframes.hdr_drm.set))
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+
 static void sun4i_hdmi_disable(struct drm_encoder *encoder,
 			       struct drm_atomic_state *state)
 {
@@ -237,10 +275,11 @@ static struct i2c_adapter *sun4i_hdmi_get_ddc(struct device *dev)
 static const struct drm_connector_hdmi_funcs sun4i_hdmi_hdmi_connector_funcs = {
 	.tmds_char_rate_valid	= sun4i_hdmi_connector_clock_valid,
 	.write_infoframe	= sun4i_hdmi_write_infoframe,
+	.clear_infoframe	= sun4i_hdmi_clear_infoframe,
 };
 
 static const struct drm_connector_helper_funcs sun4i_hdmi_connector_helper_funcs = {
-	.atomic_check	= drm_atomic_helper_connector_hdmi_check,
+	.atomic_check	= sun4i_hdmi_atomic_check,
 	.mode_valid	= drm_hdmi_connector_mode_valid,
 	.get_modes	= sun4i_hdmi_get_modes,
 };

-- 
2.47.3


