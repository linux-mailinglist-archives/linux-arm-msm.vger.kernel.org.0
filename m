Return-Path: <linux-arm-msm+bounces-87943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 733D3CFF5CD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 19:15:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B1EF730049E3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 18:15:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FD4A359F9D;
	Wed,  7 Jan 2026 18:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Md2Ezqvu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eF8vknuZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072A73587B1
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 18:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767809714; cv=none; b=iNvHENcowO29MYQmZ8ZUdlKjWDfA/Gh+QRQ2p+2Hi3tcxgjanopAfl8UPgx//oRKlDx+OFsb0mHmF7woLziD5dRa3tng/vVHwNIYei72161ArhpOxTIDmUq9odF9NZwdEPul14w9RsKl8RfT7NV343fssAtNGXtMRgYGhPM2gWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767809714; c=relaxed/simple;
	bh=LT/feZw0CtZODegcFJ+4Vz9a++4eaSKUzh1MRBMJ8BM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gfem+6i52K4qW1YZZbpyg0K6ZoGOS934GYmvJ9meuxAJn8WBBGWHs4NiNA4EQBfl228oVMaHidQjTnEd9WN2+edSA5rqQCrxR/GhJMoyy4n0+dmDbK4HMT5ztG3/ers7A3ex/iWrJop24x2Q3PS0jBmHe4jG1cv3eL/1HwbG88A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Md2Ezqvu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eF8vknuZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607GQsBg1981267
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 18:15:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iDMa/3+oiy4vVFgOo69jkSU/S1Hmln8yfU7tzvohWvc=; b=Md2EzqvuQa88+NJo
	eO9CT6W6zNA2/mmL8bAXb6GdF2TgbDZwRiPcGhExvC1k/rcBmLe+40l0vu3MF44S
	QoUy/eggghWay8HBTYciFmcK5g2Aaf1FDZD9rolR0ZkMC1fbK/4XwkN295/ny6OD
	7Hj8ZpUvDJbaSgxgOTfCtEZ/BOyzVnuN1jYl2TiJ7O858oy/50DcJLZtCL/98fOS
	wCygVIIJJAKqG1PSF668wIDMDoHtjoc5LvKMAp7ude/wxjONNzUeXjIqQCv44rac
	XA1DZJ9KsfhFk550JzlbWRLh4b1Kazpk8gIsV1iwDBjhCZWAHHgTWxHTv9A6e2dC
	QiQ2Fw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhdavk62t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 18:15:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2e235d4d2so911651985a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 10:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767809710; x=1768414510; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iDMa/3+oiy4vVFgOo69jkSU/S1Hmln8yfU7tzvohWvc=;
        b=eF8vknuZERuZPFoj7N71BxtZ32AYvLKWEVpoZu8KTuDPyxe5s9iC35r2NLQTUJqFWe
         9woeYC1gQnMh8WbnqW5phq52aWuPyfpY4Aw3it2lPdgzBVYdQzb/iqdnrA8fxXk0WCEH
         1jmZrBiHsWZVgF3xiLGVVcmV9G2lgoL5kYtR7H1zxXdV+TJM2pDigMS4SLIV71cOGCdS
         5Rig0FZoc0BySRqzjqUpXruf4P19VTcEQPWPlstqMZHvk+vPpmtjZjMwouND+Zt2mvKR
         gfpj5iHRqOX9RFjGhVGrEKLcjIsJG2KrtO+OUNAtLqpQ17iN8s9CBnJtXEeBcr5uLxkP
         jw4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767809710; x=1768414510;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iDMa/3+oiy4vVFgOo69jkSU/S1Hmln8yfU7tzvohWvc=;
        b=QRKQKxDN/4nttuaVSShZrZxi5ISn3685RxmdmnEODpKRlYV7leyQY/qE59N8XHQxby
         b1odLk9ROvSdiL8e1ldRD1BbVilZB3NHZhJ8XdAK8TsypSSHcY+rHinwwE7wO3yv9t7o
         Lxr1925khzxOCCR7eqmHc4Ifvli+FnOrI0D9WTebeeYUW+6XQB6nDgB7CwB1ywqJ8b4f
         9eOy5N5313rqmXlcU0JszgeU9w4FlHkgJHaKrIsMCRdlBReYkHUfUT1ETWB/1cYDAc/c
         +8JbBwiCGgZny4DhJJVKpo5ynyHASL1nDiysWBcYm9FXfeKhVXop7ibpBy7YFxUOGelA
         Fmjw==
X-Forwarded-Encrypted: i=1; AJvYcCWjEqZOxR6HccO7O7oOqcPIYLuZU820HR2KS4dJmG7HFwq/0BvBwFWl/Deude/srUScl5ywW/rAz1ShnhCI@vger.kernel.org
X-Gm-Message-State: AOJu0YzLaLqGH4mp/FugdR1OuSztMf2Teor9GuYKeVnGf001IW65gCeb
	z1zagC9gn60Otcfpv0SNyOeJMkA+oFgZDnBNHRrZJVUK3Ng3ynswf3gMyoETRKoDWpvfezpI5YO
	nQxDK+h186m7UvSNYpMSbkWrno/cfliUGH1spG7v68XJkH3J1XmrcXV2cR/QLHqjbw73I
X-Gm-Gg: AY/fxX6+lIfEREPvyIijaaDC0mFTXwHuGcayHXEGzJlOrGVGb/kKiIOoDqE8HXlw7R4
	Ws2fsdfIVsdOw2FTnAHd3mZ1RLCmnsCWdxyZV5i0AG9ydgqNHDxKpRkNIhrOWJ9O5H9z1w8bd3Q
	Wi7pIAfwud3pzZbc5Zunmy10hYBkmliZ1McjP//TQGs4rfWo+laYC/knvTy9YDPObMm7TKMsgr6
	vVA8Lf0E7rvo6g+RoU972q4M2XRzqz7EpdWVTEHsm0G8jpSKszmeDTW9kaEZFIJKSSp3kJcoGsk
	t2aFIpUiso/dacAm8zHtJ4z0RmOnuwJD/+v7S07kd1ZIdKpOlsCiUm3EMtJbhj14brt145jjpK8
	+sbYGvHucop2fixRRI4nTzdUFL3q5bl/wrJsEWG6J0otiAKCZLviw4f1DDjKBD5gDBb8OmaOl+W
	GgW+Yl7y8KLtQ+2Fw/XHhYfD0=
X-Received: by 2002:a05:620a:284d:b0:8b0:f8c4:a5ff with SMTP id af79cd13be357-8c38939548dmr415672685a.23.1767809709956;
        Wed, 07 Jan 2026 10:15:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHNnSAiO2TN35uowVz5nUxPTarPKtrJKczFdjq8YtoRDL79CU00FYbWgXjKjI0hV5LSFGnXqg==
X-Received: by 2002:a05:620a:284d:b0:8b0:f8c4:a5ff with SMTP id af79cd13be357-8c38939548dmr415665885a.23.1767809709293;
        Wed, 07 Jan 2026 10:15:09 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d6988asm1436884e87.80.2026.01.07.10.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 10:15:07 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 07 Jan 2026 20:15:01 +0200
Subject: [PATCH v4 04/10] drm/connector: make clear_infoframe callback
 mandatory for HDMI connectors
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-limit-infoframes-2-v4-4-213d0d3bd490@oss.qualcomm.com>
References: <20260107-limit-infoframes-2-v4-0-213d0d3bd490@oss.qualcomm.com>
In-Reply-To: <20260107-limit-infoframes-2-v4-0-213d0d3bd490@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sandy Huang <hjc@rock-chips.com>,
        =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5425;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=LT/feZw0CtZODegcFJ+4Vz9a++4eaSKUzh1MRBMJ8BM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpXqKkh8Uw4zR96uxdfP3B5zJVi4OZsf/KLRV9b
 W7ObW3B+sCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaV6ipAAKCRCLPIo+Aiko
 1b8ZCACVHXOVdotvxgogUT3C9rJjVAwz5C7cHtd38CQCrPUocd+kYKlETxwvuPGlVJvCHUeAM8X
 5/dbL3WQ4QoPcR1iBb8oDv1v6oB7mJeoOsV/aJpocz5lRWP8NYncKNG1ePRkGEpeU3WHjpZqIFS
 kYhO2EzWmB1sJ9inh/CWFfZvf4ElzxfTYGmj/kCkM/z5sVjYqKRiqW7x7HsR8MtVNsWKFqCfk3V
 dVqKuC0OSU4IUdW2h3I1weh+JiTliULMhONr5eVnvaNom/JZ5QKI3oJK+lJB7grw4QWcRHvOVP2
 EkMSiWdtnpNVOEWxdQ2Q6yJ+NQAxzjfP/bYkeyAmuPwG08rp
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDE0NCBTYWx0ZWRfX7qkqX37gPvAz
 U+7wQdiO2G/yz4N/WTxwWsiGPV8e3RqqjLeO0N28ql+2/nZtwbL6d/Cu6wBhxYWdZ6hkLfCzQdJ
 3YJ4O9L6Ygpi2FM5Sf545PctBG4haIv/sU9Xvny0nG2wp7pzSSP09wM/hDVot/i0wlRIq0ikRwc
 9GPRNghQbFIZ3pmSnmdWwUC8EpftTfmjy0IWFbHmmjejaK4wMeO2jxvLAecNtHRvae/a/to1Ibq
 1JMWaasC8pvytG387LxsERzLU9PF/3BWlGSgaIqPsD6yf19FKJIxu3xzUx2ux+fqE0m2P6Q0c30
 UB1t+mO8G2IJrdARQbpV2CRpKdgaW0eIdpDUjCyk3Q3/KMzr0kqKiVyP8X4vq05lYR5DUPK8mCl
 m7uMLa60uQDvj4i15ENlyJW4WnAzYPKEVM1vO7eGc+TGTTBJHZK1W1vpm1D7hvg7FApxGx1XBv7
 T6AzjKF+edtwlg/3/Rw==
X-Proofpoint-ORIG-GUID: GFzjc_qbLAInsFQu-pYrh1DU18SjjlL4
X-Authority-Analysis: v=2.4 cv=comWUl4i c=1 sm=1 tr=0 ts=695ea2ae cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9fyoTQa5ixSHU3Y6h0oA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: GFzjc_qbLAInsFQu-pYrh1DU18SjjlL4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070144

We already require both hdmi_write_infoframe and hdmi_clear_infoframe
for bridges implementing DRM_BRIDGE_OP_HDMI. It makes sense to require
the clear_infoframes callback for HDMI connectors utilizing
drmm_connector_hdmi_init().

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_connector.c                    |  4 ++++
 drivers/gpu/drm/tests/drm_connector_test.c         | 15 +++++++++++++++
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 22 ++++++++++++++++++++++
 include/drm/drm_connector.h                        |  2 +-
 4 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 4d6dc9ebfdb5..40e025712c9b 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -600,6 +600,10 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 	if (!(max_bpc == 8 || max_bpc == 10 || max_bpc == 12))
 		return -EINVAL;
 
+	if (!hdmi_funcs->clear_infoframe ||
+	    !hdmi_funcs->write_infoframe)
+		return -EINVAL;
+
 	ret = drmm_connector_init(dev, connector, funcs, connector_type, ddc);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
index 22e2d959eb31..f356ea695ae7 100644
--- a/drivers/gpu/drm/tests/drm_connector_test.c
+++ b/drivers/gpu/drm/tests/drm_connector_test.c
@@ -25,7 +25,22 @@ struct drm_connector_init_priv {
 	struct i2c_adapter ddc;
 };
 
+static int accept_infoframe_clear_infoframe(struct drm_connector *connector,
+					    enum hdmi_infoframe_type type)
+{
+	return 0;
+}
+
+static int accept_infoframe_write_infoframe(struct drm_connector *connector,
+					    enum hdmi_infoframe_type type,
+					    const u8 *buffer, size_t len)
+{
+	return 0;
+}
+
 static const struct drm_connector_hdmi_funcs dummy_hdmi_funcs = {
+	.clear_infoframe = accept_infoframe_clear_infoframe,
+	.write_infoframe = accept_infoframe_write_infoframe,
 };
 
 static const struct drm_connector_funcs dummy_funcs = {
diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index 80f819a9ff5b..cfa14a6eb97f 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -78,7 +78,22 @@ static int set_connector_edid(struct kunit *test, struct drm_connector *connecto
 	return ret;
 }
 
+static int accept_infoframe_clear_infoframe(struct drm_connector *connector,
+					    enum hdmi_infoframe_type type)
+{
+	return 0;
+}
+
+static int accept_infoframe_write_infoframe(struct drm_connector *connector,
+					    enum hdmi_infoframe_type type,
+					    const u8 *buffer, size_t len)
+{
+	return 0;
+}
+
 static const struct drm_connector_hdmi_funcs dummy_connector_hdmi_funcs = {
+	.clear_infoframe = accept_infoframe_clear_infoframe,
+	.write_infoframe = accept_infoframe_write_infoframe,
 };
 
 static enum drm_mode_status
@@ -91,6 +106,8 @@ reject_connector_tmds_char_rate_valid(const struct drm_connector *connector,
 
 static const struct drm_connector_hdmi_funcs reject_connector_hdmi_funcs = {
 	.tmds_char_rate_valid	= reject_connector_tmds_char_rate_valid,
+	.clear_infoframe = accept_infoframe_clear_infoframe,
+	.write_infoframe = accept_infoframe_write_infoframe,
 };
 
 static enum drm_mode_status
@@ -103,6 +120,8 @@ reject_100mhz_connector_tmds_char_rate_valid(const struct drm_connector *connect
 
 static const struct drm_connector_hdmi_funcs reject_100mhz_connector_hdmi_funcs = {
 	.tmds_char_rate_valid	= reject_100mhz_connector_tmds_char_rate_valid,
+	.clear_infoframe = accept_infoframe_clear_infoframe,
+	.write_infoframe = accept_infoframe_write_infoframe,
 };
 
 static int dummy_connector_get_modes(struct drm_connector *connector)
@@ -2441,6 +2460,7 @@ static int reject_avi_infoframe_write_infoframe(struct drm_connector *connector,
 }
 
 static const struct drm_connector_hdmi_funcs reject_avi_infoframe_hdmi_funcs = {
+	.clear_infoframe = accept_infoframe_clear_infoframe,
 	.write_infoframe = reject_avi_infoframe_write_infoframe,
 };
 
@@ -2543,6 +2563,7 @@ static int reject_hdr_infoframe_write_infoframe(struct drm_connector *connector,
 }
 
 static const struct drm_connector_hdmi_funcs reject_hdr_infoframe_hdmi_funcs = {
+	.clear_infoframe = accept_infoframe_clear_infoframe,
 	.write_infoframe = reject_hdr_infoframe_write_infoframe,
 };
 
@@ -2790,6 +2811,7 @@ static int reject_audio_infoframe_write_infoframe(struct drm_connector *connecto
 }
 
 static const struct drm_connector_hdmi_funcs reject_audio_infoframe_hdmi_funcs = {
+	.clear_infoframe = accept_infoframe_clear_infoframe,
 	.write_infoframe = reject_audio_infoframe_write_infoframe,
 };
 
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 8f34f4b8183d..4543833acdec 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1253,7 +1253,7 @@ struct drm_connector_hdmi_funcs {
 	 * called multiple times, once for every disabled infoframe
 	 * type.
 	 *
-	 * The @clear_infoframe callback is optional.
+	 * The @clear_infoframe callback is mandatory.
 	 *
 	 * Returns:
 	 * 0 on success, a negative error code otherwise

-- 
2.47.3


