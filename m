Return-Path: <linux-arm-msm+bounces-71273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5DBB3C64A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Aug 2025 02:25:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7DD493B131D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Aug 2025 00:25:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FCA320FAB4;
	Sat, 30 Aug 2025 00:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q+5mmYj+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E6C1FC7C5
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Aug 2025 00:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756513408; cv=none; b=A3REyU/lf/Ifqc/AaHtehqpTd8RmOT5Tj7Y512JC+sASSM1Az9WTfsF3G5fy9Kx+IBhFCm0kwwGfUZI303Q7MLlq+mSinnNdxZ8GlOwF2sEJVbNO1KW1iPNXIR//9BiV0XN1mHVhuesQ4c+5IauzjTJm93eytkPr/luqkgtL2wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756513408; c=relaxed/simple;
	bh=VIOVx9ZFQcN8aP7U3+DXeUs0Ba2NJyVyJ0ONqbKAcgU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fI7duNZcS9yGge3X+oLxGaJH16U+ub1YQecf/OuNNDl84yTZDBSKyNEokczHfqsmbghHb+tQO/NjaykAetAv39RnsT2Ygo8IPR4p9rEBBR3wugpGTgoeVivod04LPO0chsTyomQ9yMqlkr2g3Yr6A9F2pfO+nvUF8V4SOJhPrgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q+5mmYj+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57TMwhr6001118
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Aug 2025 00:23:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tMGCzwi7iMqpBSIwuiogi39ZPNmDZ+NlaUaBUi0ePrI=; b=Q+5mmYj+n/VSVLYh
	QoJEjJoCvH+Des/LL/ULV2D2nLttafyPPr2QA4sl2XtTaYHJCq4T+bPQyVJ7CsSl
	sSIV7foFigiuEhSUTP84O9+acizE7obyfGN6k/EJXvjRHRa4ypkFCbTpjHaiezd5
	5/bZ1AL/17zWQfZl/v2+oBXPoChXDOnv+u0eoZuBSqp6g/dxVhNIrzxuMXhbbJl6
	fTzqNL9CiDglo0WwZ8bP60aHCVi1zi9fSMFc+4MZh2Fou+OjxvYFhw5cWxX++xa6
	1zwL/DRLfGpnoltZyvB8GSnx6Nt1crfT9tXJyRD4u4fCaxdXUwXxTe4NEg+ftutX
	1IayYA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48tbpgpvmc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Aug 2025 00:23:24 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b2ecb8e64bso33281721cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Aug 2025 17:23:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756513404; x=1757118204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tMGCzwi7iMqpBSIwuiogi39ZPNmDZ+NlaUaBUi0ePrI=;
        b=gaPUQRRz20RUlvX2nMWPkVclGnyG8orY/rnT8h6KRYmYBAOKbO82vMgXgEOp6ye3yB
         6D2v0Td5kQad9epfZLspptQCMM3jXlVa+fJpRm6Ehw00AI3y10KS55DqXv5POdq1q8DL
         JIazVrcJPPDNA7UodcwHwcJn1JaeEfaQx+ZJAlDHoC5w4l+3xFLQq//RjmxzxT1eRMLe
         Et3ZPDdJFpsk9PPADbAEfwoyfNB0uF/THKO4MkwAVEUkNISE5KWshDmXbABGOxq3JuG2
         BgCGy7ToSIv+y2pi5oHJOxZ05wGSQUzTLBbOU7tiRYZf4SjCqATScq5Qc39sBBgbIJFs
         pb1A==
X-Forwarded-Encrypted: i=1; AJvYcCU5mTw3+OV4OAAh0HwlRiijLbQTJUctPtM82WGDU2YLct2PNy5mVZpKb/UNP4TFVpTZ4Ouqh5Iw0UxZlK+a@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/JrPf4HCJCN6evBKuk3xJeUYL3LAu6JLEKseTfoEzcxHci2xh
	6Cr0QR6Lr6q0BSkpYpTcTcd8ZslWmCKC32m/Rcql7txEDS8L1jZlVGBl0prAjJtrhfFGeyf2Nf2
	fAsBiIWW+v7yrUPmAiD6Dto9eqTDa2aRbjsPAyFeGF6vFuwx3oQPpHxKyP+BG0q594VXL
X-Gm-Gg: ASbGncvUV8a/+BPSNKLcAsmgEQTBGx0/mMLG4uByR7WlePVBjWuMBSIq1AlWZTvZUz5
	7iNte7sGXYwlxrlm9UdSIt5/bYeRjzVy1D8p2BXktQb3S4YvF9ttfhW4vYxssdR2uV/EQT3exov
	Ti5peYUn0iSVmWA3ACOLk4uqBxKQ5S5/Xr1x5bB4YjkDiSYPn8z1kK0C5LP5IrXzq9Y7UzFPXxz
	ijPFWwO5uPdnT3M11hM6G6fi9PDDCFayHmQ/0WblOx0xeeTh+oNxkF+df2MuW9/dxWPjY0ss0Qm
	ZbZHniORyJ+JQ27rwqQcI3fri48bdFGVwqC7gCMqfaViHcqdgW1D1SpzfdpOToOodczPfAdxJ4n
	wsq8I6GJH8SAeoZUjGvgkMF5x6GNnz2hFS/qlUfEvOV5+WDNT7KcB
X-Received: by 2002:ac8:7dd0:0:b0:4b2:8ac4:ef8e with SMTP id d75a77b69052e-4b31dca7d9bmr6262501cf.73.1756513403727;
        Fri, 29 Aug 2025 17:23:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQbp4HnJW53TtgpH4goLIxU1betKvFXJivt7Yk4w2HXWAhfhSte/bjtbH3ZPMA/GFEM5dqMA==
X-Received: by 2002:ac8:7dd0:0:b0:4b2:8ac4:ef8e with SMTP id d75a77b69052e-4b31dca7d9bmr6262001cf.73.1756513403243;
        Fri, 29 Aug 2025 17:23:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f676dc52esm1019907e87.8.2025.08.29.17.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 17:23:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 30 Aug 2025 03:23:07 +0300
Subject: [PATCH v3 11/11] drm/bridge: lontium-lt9611uxc: switch to HDMI
 audio helpers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250830-drm-limit-infoframes-v3-11-32fcbec4634e@oss.qualcomm.com>
References: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
In-Reply-To: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sandy Huang <hjc@rock-chips.com>,
        =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Liu Ying <victor.liu@nxp.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6539;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=VIOVx9ZFQcN8aP7U3+DXeUs0Ba2NJyVyJ0ONqbKAcgU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoskRk4mO/Wae/aVjMwFDeIGRIwNht1W8+SnIgW
 mGWDw77GSyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLJEZAAKCRCLPIo+Aiko
 1aiuB/wLjBle4c8EUZFBkZrH+ITKfuu9NiqqEEnbh20zp5cP/q6DGCXvqn7JiotAYk/2OWe+TgZ
 wibQ6J9oaQdsYHdWszWTqJ+VckceGts93XDX83DH6MjkZl+U8ZmQazE2GM4X8phxTGZUpwrsT7Z
 PDXS9mKbl+23uOJ1Os8+rhOL1tKuMqFeIZEo+ChO/XJwS8pxmNET5bhSBFls35KXWLrGYP9NYV4
 J5+ZfT8+UntW/s1gQvPQB3LefV4pCOhcu9Kw9AWBxi2ScS9jJ0Zzh3XvewVtxknFkFz6JndPqqP
 ZQ0mPlZZl8Gb4f76AWhB8eGhy2KizaEN1C0CmHbU7wwbx3+Q
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: j8zGIimvQlFo392OeEklBEvja0VMf2Z6
X-Proofpoint-ORIG-GUID: j8zGIimvQlFo392OeEklBEvja0VMf2Z6
X-Authority-Analysis: v=2.4 cv=G7gcE8k5 c=1 sm=1 tr=0 ts=68b2447c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=l1vpWyVUGYkh7_PGMaYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI3MDE5OSBTYWx0ZWRfX8aeOSStFK+FY
 mnLO6mLIw77PWQ7T4JBjEJfXuWCsoIl9RO5p6y0X0J9GPESDKCHb7OMa+He2f35dS0E5dKrkIMJ
 mpN1oO/eFTzcc/8IiJCdQmiLXKKRpWvu45q3SAgmRCgwx38liBEu98iMbR4EUQzAVjd0RapSr/y
 IG2kZ9PdS9W2815mZZkGR/6DaZC+YWoylBaWD0bzqIi62wDVVjZzngKFqFAdW1w7BjPKe+FUV2O
 bDkJiFX6MCDL9zgitOjIyl0JM/9H7mc1OqyMgceATJhVOqh15OuuJpurkinCVEOLnIULe0fhz56
 b2U8VNMnHQ8d/XIvKqTmI8ZBnxlhak9iQAgTBqeFb02XTHcsN4XuuqppbaJhxyAbOGV49T05eph
 Mlp1Gx8Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508270199

While LT9611UXC is a DSI-to-HDMI bridge, it implements all HDMI-related
functions internally, in the firmware. Implement DRM_BRIDGE_OP_HDMI and
DRM_BRIDGE_OP_HDMI_AUDIO by providing necessary stubs, streamlining HDMI
and HDMI audio plumbing (which includes plugged notifications and ELD
handling).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 130 ++++++++++++-----------------
 1 file changed, 54 insertions(+), 76 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index 38fb8776c0f441ae433c60a7680aaa6501a8956e..df4661986423a871c006af2a36d85d8103935f93 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -17,8 +17,6 @@
 #include <linux/wait.h>
 #include <linux/workqueue.h>
 
-#include <sound/hdmi-codec.h>
-
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_edid.h>
@@ -27,6 +25,8 @@
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
+#include <drm/display/drm_hdmi_audio_helper.h>
+
 #define EDID_BLOCK_SIZE	128
 #define EDID_NUM_BLOCKS	2
 
@@ -48,7 +48,6 @@ struct lt9611uxc {
 	struct device_node *dsi1_node;
 	struct mipi_dsi_device *dsi0;
 	struct mipi_dsi_device *dsi1;
-	struct platform_device *audio_pdev;
 
 	struct gpio_desc *reset_gpio;
 	struct gpio_desc *enable_gpio;
@@ -429,12 +428,50 @@ static const struct drm_edid *lt9611uxc_bridge_edid_read(struct drm_bridge *brid
 	return drm_edid_read_custom(connector, lt9611uxc_get_edid_block, lt9611uxc);
 }
 
+static int lt9611uxc_hdmi_clear_infoframe(struct drm_bridge *bridge,
+					 enum hdmi_infoframe_type type)
+{
+	/* LT9611UXC managed infoframes in the firmware, provide an empty stub */
+	return 0;
+}
+
+static int lt9611uxc_hdmi_write_infoframe(struct drm_bridge *bridge,
+					  enum hdmi_infoframe_type type,
+					  const u8 *buffer, size_t len)
+{
+	/* LT9611UXC managed infoframes in the firmware, provide an empty stub */
+	return 0;
+}
+
+static int lt9611uxc_hdmi_audio_prepare(struct drm_bridge *bridge,
+					struct drm_connector *connector,
+					struct hdmi_codec_daifmt *fmt,
+					struct hdmi_codec_params *hparms)
+{
+	/*
+	 * LT9611UXC will automatically detect rate and sample size, so no need
+	 * to setup anything here.
+	 */
+	return 0;
+}
+
+static void lt9611uxc_hdmi_audio_shutdown(struct drm_bridge *bridge,
+					  struct drm_connector *connector)
+{
+}
+
 static const struct drm_bridge_funcs lt9611uxc_bridge_funcs = {
 	.attach = lt9611uxc_bridge_attach,
 	.mode_valid = lt9611uxc_bridge_mode_valid,
 	.mode_set = lt9611uxc_bridge_mode_set,
 	.detect = lt9611uxc_bridge_detect,
 	.edid_read = lt9611uxc_bridge_edid_read,
+
+	.hdmi_write_infoframe = lt9611uxc_hdmi_write_infoframe,
+	.hdmi_clear_infoframe = lt9611uxc_hdmi_clear_infoframe,
+
+	.hdmi_audio_prepare = lt9611uxc_hdmi_audio_prepare,
+	.hdmi_audio_shutdown = lt9611uxc_hdmi_audio_shutdown,
 };
 
 static int lt9611uxc_parse_dt(struct device *dev,
@@ -508,73 +545,6 @@ static int lt9611uxc_read_version(struct lt9611uxc *lt9611uxc)
 	return ret < 0 ? ret : rev;
 }
 
-static int lt9611uxc_hdmi_hw_params(struct device *dev, void *data,
-				    struct hdmi_codec_daifmt *fmt,
-				    struct hdmi_codec_params *hparms)
-{
-	/*
-	 * LT9611UXC will automatically detect rate and sample size, so no need
-	 * to setup anything here.
-	 */
-	return 0;
-}
-
-static void lt9611uxc_audio_shutdown(struct device *dev, void *data)
-{
-}
-
-static int lt9611uxc_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
-					 struct device_node *endpoint,
-					 void *data)
-{
-	struct of_endpoint of_ep;
-	int ret;
-
-	ret = of_graph_parse_endpoint(endpoint, &of_ep);
-	if (ret < 0)
-		return ret;
-
-	/*
-	 * HDMI sound should be located as reg = <2>
-	 * Then, it is sound port 0
-	 */
-	if (of_ep.port == 2)
-		return 0;
-
-	return -EINVAL;
-}
-
-static const struct hdmi_codec_ops lt9611uxc_codec_ops = {
-	.hw_params	= lt9611uxc_hdmi_hw_params,
-	.audio_shutdown = lt9611uxc_audio_shutdown,
-	.get_dai_id	= lt9611uxc_hdmi_i2s_get_dai_id,
-};
-
-static int lt9611uxc_audio_init(struct device *dev, struct lt9611uxc *lt9611uxc)
-{
-	struct hdmi_codec_pdata codec_data = {
-		.ops = &lt9611uxc_codec_ops,
-		.max_i2s_channels = 2,
-		.i2s = 1,
-		.data = lt9611uxc,
-	};
-
-	lt9611uxc->audio_pdev =
-		platform_device_register_data(dev, HDMI_CODEC_DRV_NAME,
-					      PLATFORM_DEVID_AUTO,
-					      &codec_data, sizeof(codec_data));
-
-	return PTR_ERR_OR_ZERO(lt9611uxc->audio_pdev);
-}
-
-static void lt9611uxc_audio_exit(struct lt9611uxc *lt9611uxc)
-{
-	if (lt9611uxc->audio_pdev) {
-		platform_device_unregister(lt9611uxc->audio_pdev);
-		lt9611uxc->audio_pdev = NULL;
-	}
-}
-
 #define LT9611UXC_FW_PAGE_SIZE 32
 static void lt9611uxc_firmware_write_page(struct lt9611uxc *lt9611uxc, u16 addr, const u8 *buf)
 {
@@ -858,11 +828,24 @@ static int lt9611uxc_probe(struct i2c_client *client)
 	i2c_set_clientdata(client, lt9611uxc);
 
 	lt9611uxc->bridge.of_node = client->dev.of_node;
-	lt9611uxc->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID;
+	lt9611uxc->bridge.ops = DRM_BRIDGE_OP_DETECT |
+		DRM_BRIDGE_OP_EDID |
+		DRM_BRIDGE_OP_HDMI |
+		DRM_BRIDGE_OP_HDMI_AUDIO;
 	if (lt9611uxc->hpd_supported)
 		lt9611uxc->bridge.ops |= DRM_BRIDGE_OP_HPD;
 	lt9611uxc->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 
+	lt9611uxc->bridge.vendor = "Lontium";
+	lt9611uxc->bridge.product = "LT9611UXC";
+	lt9611uxc->bridge.autogenerated_infoframes =
+		DRM_CONNECTOR_INFOFRAME_AUDIO |
+		DRM_CONNECTOR_INFOFRAME_AVI;
+
+	lt9611uxc->bridge.hdmi_audio_dev = dev;
+	lt9611uxc->bridge.hdmi_audio_max_i2s_playback_channels = 2;
+	lt9611uxc->bridge.hdmi_audio_dai_port = 2;
+
 	drm_bridge_add(&lt9611uxc->bridge);
 
 	/* Attach primary DSI */
@@ -881,10 +864,6 @@ static int lt9611uxc_probe(struct i2c_client *client)
 		}
 	}
 
-	ret = lt9611uxc_audio_init(dev, lt9611uxc);
-	if (ret)
-		goto err_remove_bridge;
-
 	return 0;
 
 err_remove_bridge:
@@ -908,7 +887,6 @@ static void lt9611uxc_remove(struct i2c_client *client)
 
 	free_irq(client->irq, lt9611uxc);
 	cancel_work_sync(&lt9611uxc->work);
-	lt9611uxc_audio_exit(lt9611uxc);
 	drm_bridge_remove(&lt9611uxc->bridge);
 
 	mutex_destroy(&lt9611uxc->ocm_lock);

-- 
2.47.2


