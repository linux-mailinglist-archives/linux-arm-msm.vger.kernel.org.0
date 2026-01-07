Return-Path: <linux-arm-msm+bounces-87948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0C2CFF923
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 19:54:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8573E3378768
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 18:16:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9791B35EDBF;
	Wed,  7 Jan 2026 18:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OpUmQbYb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="is8iALen"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E93435E544
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 18:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767809723; cv=none; b=PnNdm3RuO8kOASsQYADgwW2QVuF0IdRHNOYE1mQFrpZqZwqRK6dB0+f33qTel6o6qTlA97CyaK8VUNLGys7neETj6jKRcfEM2fECiJ86BP+irA2z9uYy5LqH07Rx0xbhyCwbbHA6lQYgVw2g7a0g+huEUF10eL6vxpmF+okNa1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767809723; c=relaxed/simple;
	bh=j/nplc82Uc8n6ck55GeREmF67vUj6ZFIListkklkuXo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j42xN8yX96c9Yi/T/C26BZnfP6u5hWy9FyUt9vqqKb8iC8a1jxsf8IeF5prjY/FOa3VK9onaLrBNOR5fxYRgw6KL/vo5kbeYag68AoVF/qY1MHfjUh67WmfMPEQqLjbxNaCKP9T1sT4r+yi1FecT5ICdgHDr7KTyZcqC+lr+W/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OpUmQbYb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=is8iALen; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607HYYmC2593311
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 18:15:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JPs6IVrvHQYSHaamgUjrxzM3vyFi8BapYIQ1hzBD3c8=; b=OpUmQbYb1j/NSFYk
	Xft3zpHcpuFEAv3CwOsCEDm8TTZut6f7fktTiYhP1reTavXR/x0cZtP0e3AsQjk2
	Kd4d6fr83beQDg7xLfrwhBhAE1TfPfdQLKTzu0NA99ht3KT3l1jDTgchxxzV/8nA
	msygtyBCiUhJg4YwVhjC0/Yw4oEbkJVb5gT29FunL44ATkzFsPDvFDPjYgCoR5ls
	J6Ghe+PxRcaqeJPPU3PMEpgkcVIcCIzeIl2l+M80+JIOz89logld2RC4jfJ53ZQm
	YKlxv/l+pU+RIUbbZPSXmCUkNA3IpMNQ3klIl0c0i1wuE62sfSsCVDo1NuIrb25t
	HacGAg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhn291n56-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 18:15:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b24a25cff5so722230485a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 10:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767809719; x=1768414519; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JPs6IVrvHQYSHaamgUjrxzM3vyFi8BapYIQ1hzBD3c8=;
        b=is8iALenGVv5iqzBXnP1dl0019yTgnhy0HlAafR2dd4ibqxyJYrwgu9b/DtvRFBsm6
         wUdQaEvvaMtm6MdXLXnknAwR9vbtxGcVarVDlhAGcT8kMLMVqMU4IO8i3049sLRtIzkt
         dM25XLdUQgabaXCNPObCCXmbDRyI9vfFDLY7QjKUeR10N6F4FdRLkbGo6Ym8M0ZisjuZ
         RtgowRNQjXWyu8UHI6OuMmYzFLSoL0mqM3yiOUbGbc8faj1Dm1KpAEBhQ24b81mcJ0GB
         xLywpuPxoMOrjl9luKeDbdq97Ks8fk2p/8J/N+0r/tbbz3t0yC2QkkkNmyjnR4eQcetR
         /Umw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767809719; x=1768414519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JPs6IVrvHQYSHaamgUjrxzM3vyFi8BapYIQ1hzBD3c8=;
        b=wCrE+qNeH73plgXlR4KhW+mGw6akhFhMO8giOPBC+jpOQehDpAyi4LyKZ0B/geX7rs
         wbDXbG0DMnlZlMdejhSsRGeQv5Y6z4hsPiSI/tcVsWoGlYcBSGJ05oilkLU6ELMeaUCj
         P8Zq4VQVVQuDYr/NqXcNODCGerRfyH5M25+/pqviU4/r/SCFbI9F0YDqXmLW/E1sG5tq
         +1a415NadDdGBXGLD8kO3tjqUaUILuXzPNc/wXXX2dTKbnQtsuM2+Wci5JxV3ycs/cSN
         yyiDhQncsCzMkCQwMN0bd3qvpOWkOfHhDjMoF8cSpwuTNeaD7zxdS+UbqN+JU7gfOCf3
         O6VQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzfteFFpki22LUvpPZbQ5/+u8WJ58ydwi4dKzSmnEsn02OtHMT3GelIqwcot5XxGy+izGa78lLCiWBlPnS@vger.kernel.org
X-Gm-Message-State: AOJu0Yzzy7eujn9gM/qhCcHS+qv39RDqNL/gmR5dQ1hsuQT7SV4SPAjn
	NXmLFFtwcV4Dw/WmyqNBJgXawrb8AOZCgy810A7JWvlplz4tNwueyUauLaVUNekzS8N41CxPxb9
	6a/5o0+dX+JAC9mSloq8xK1ziHIVHTPPeY1hjCL+Rce2bihdy1KJg5w+1xvXo3HTILpfFlcRacm
	tH
X-Gm-Gg: AY/fxX5wn0LRpbROonLSdNm5Xv3Pz/7ZlGqDGA7w9nvAi7yG/Cgpc24oK9yJ3YSVhgJ
	tUFUb1AfXe+v3IhekYQ9srAWpIj1erogWLVYdTArj8WEreG66a392o/i6WvAusLtMA+1iyLyUhH
	LhDYTmc40biT9fxZ2il1M2oRj1XC8J0mlpYs1hWPfwxt16duR9Xys36VkwpBkMgmVFrMwSR8NlT
	Of8CbN8HRaG8l9F36wmObzbRuamYLHbtR6eOQJ66h7NaF/x5w0HtRhRpziMzT2s9OBxJaDws5Ih
	zxbSGk42b4TzEvgha0kL/lVaBOGZTmaGKUr4iFaii+l8WKCoF5iX8UCgI7DIjcw3gKFmdGdn4o6
	sOIYWP6Iv4wHsFdAZiLkLr58sY5l2M7XYxwvDpJK31c31i9RTA+kRqY9rjn71oGVy1t6fDE0odl
	Ov/E8xle+B/Fxi1/Kwb3R2g6Q=
X-Received: by 2002:a05:620a:2a0e:b0:8b2:f145:7f28 with SMTP id af79cd13be357-8c3893a26a4mr408411385a.33.1767809719365;
        Wed, 07 Jan 2026 10:15:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFUjHXe7uuYeZEqUMuBR5K2kia77K+Kj14ZWPxBppIzS2JiKcdZruRDku2629OMG4LVhagWmw==
X-Received: by 2002:a05:620a:2a0e:b0:8b2:f145:7f28 with SMTP id af79cd13be357-8c3893a26a4mr408404785a.33.1767809718716;
        Wed, 07 Jan 2026 10:15:18 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d6988asm1436884e87.80.2026.01.07.10.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 10:15:17 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 07 Jan 2026 20:15:06 +0200
Subject: [PATCH v4 09/10] drm/display: bridge_connector: dynamically
 generate HDMI callbacks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-limit-infoframes-2-v4-9-213d0d3bd490@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6894;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=j/nplc82Uc8n6ck55GeREmF67vUj6ZFIListkklkuXo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpXqKlQWZc4/P6jahK/bWP1w2B50/o9TLzfzbdf
 aaZXx2QNIaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaV6ipQAKCRCLPIo+Aiko
 1f1FCACoKLk12kYaWdypMvDCzHmH9N8HbMOWbXMZlbluaF79NkCtoNgDonKnKHxYLa9pjqgX17e
 Rvd8pmDpdv2MOg3WP/GMXH5pZGxRG01FGl7SBtEPw2/YXYEskTFSEq6fG4I+tv8X5Ly85MqO9Lj
 9cHsDJOJq0hBFlwxVPg4mvAka59hwWsW69lgA6euCJbibpFCioBMCghtCslqHcxkjZWM/PUGgNE
 Zgf3lcR3ZdkGqSnlQlrowNKspjiwnAe/Q7/uXCEP9N6R5jyGzXlQUqTGFKBPnuzMfXGuvLMm4dg
 RY6CU12eS8wodgZ5W3Ilm0fcBuf2GFwlR9F7fNEmqQh95vO+
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: iMCDRrS0Lpzats-Kz0-G0ZI2Wi0Db7-R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDE0NCBTYWx0ZWRfX1c7tUiJWnbrO
 GcgzFQ/0kwO326qzDXoVJ7tvZqZWLXbOpwX9KGVvy78iMGwgN0qNoKVpR9T7DulKzCgEzxZy5GR
 FgCQaBg+8JipDDg5Y6pZFdMVRiNLKHtVmWkrHgFv+wOiol0IMQeU/qH3gyUuI68hkjF3KGBRSgi
 wEAN3JG5V46enIgZoPnjJU3lQSRmWNCxPE9reTj4aOmSjrQFnOAI4FF/FyGp5wXpoU+f7qv5jI+
 oE+PlAQPhVzVK4uHeGPJWYqSdEp7uAr/jI2hgCRvHdTPpEqEKvsiI3US7CxR9a7phLOlmLjGWfw
 dPY7wc+R+slNl4JjKbHJqX3CVqh2kT5x4O/2phCMrkqasHMChf9HVoqiq61OZ57XFK3Yh3K6DpI
 LYh5SuB9USkjf4TlkYpKyNR+da/k6f6rF8byLgEtD63uQlSr96t/sqkGASXpVvTagT5k//ycWq2
 5gCk5jaBT8Ep7XRKZKA==
X-Authority-Analysis: v=2.4 cv=P7k3RyAu c=1 sm=1 tr=0 ts=695ea2b8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SmQ2dRXw9u10PpR7_9MA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: iMCDRrS0Lpzats-Kz0-G0ZI2Wi0Db7-R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070144

The rest of the DRM framework uses presence of the callbacks to check if
the particular infoframe is supported. Register HDMI callbacks
dynamically, basing on the corresponding drm_bridge ops.

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 94 ++++++++++++--------------
 1 file changed, 45 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index ca6a72a4cf80..ba8ff113cff1 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -123,6 +123,14 @@ struct drm_bridge_connector {
 	 * DRM_BRIDGE_OP_HDMI_CEC_NOTIFIER).
 	 */
 	struct drm_bridge *bridge_hdmi_cec;
+
+	/**
+	 * @hdmi_funcs:
+	 *
+	 * The particular &drm_connector_hdmi_funcs implementation for this
+	 * bridge connector.
+	 */
+	struct drm_connector_hdmi_funcs hdmi_funcs;
 };
 
 #define to_drm_bridge_connector(x) \
@@ -465,12 +473,7 @@ static int drm_bridge_connector_clear_audio_infoframe(struct drm_connector *conn
 	if (!bridge)
 		return -EINVAL;
 
-	if (bridge->ops & DRM_BRIDGE_OP_HDMI_AUDIO)
-		return bridge->funcs->hdmi_clear_audio_infoframe(bridge);
-
-	drm_dbg_driver(connector->dev, "Unsupported HDMI Audio InfoFrame\n");
-
-	return 0;
+	return bridge->funcs->hdmi_clear_audio_infoframe(bridge);
 }
 
 static int drm_bridge_connector_write_audio_infoframe(struct drm_connector *connector,
@@ -484,12 +487,7 @@ static int drm_bridge_connector_write_audio_infoframe(struct drm_connector *conn
 	if (!bridge)
 		return -EINVAL;
 
-	if (bridge->ops & DRM_BRIDGE_OP_HDMI_AUDIO)
-		return bridge->funcs->hdmi_write_audio_infoframe(bridge, buffer, len);
-
-	drm_dbg_driver(connector->dev, "Unsupported HDMI Audio InfoFrame\n");
-
-	return 0;
+	return bridge->funcs->hdmi_write_audio_infoframe(bridge, buffer, len);
 }
 
 static int drm_bridge_connector_clear_hdr_drm_infoframe(struct drm_connector *connector)
@@ -502,12 +500,7 @@ static int drm_bridge_connector_clear_hdr_drm_infoframe(struct drm_connector *co
 	if (!bridge)
 		return -EINVAL;
 
-	if (bridge->ops & DRM_BRIDGE_OP_HDMI_HDR_DRM_INFOFRAME)
-		return bridge->funcs->hdmi_clear_hdr_drm_infoframe(bridge);
-
-	drm_dbg_driver(connector->dev, "Unsupported HDMI HDR DRM InfoFrame\n");
-
-	return 0;
+	return bridge->funcs->hdmi_clear_hdr_drm_infoframe(bridge);
 }
 
 static int drm_bridge_connector_write_hdr_drm_infoframe(struct drm_connector *connector,
@@ -521,12 +514,7 @@ static int drm_bridge_connector_write_hdr_drm_infoframe(struct drm_connector *co
 	if (!bridge)
 		return -EINVAL;
 
-	if (bridge->ops & DRM_BRIDGE_OP_HDMI_HDR_DRM_INFOFRAME)
-		return bridge->funcs->hdmi_write_hdr_drm_infoframe(bridge, buffer, len);
-
-	drm_dbg_driver(connector->dev, "Unsupported HDMI HDR DRM InfoFrame\n");
-
-	return 0;
+	return bridge->funcs->hdmi_write_hdr_drm_infoframe(bridge, buffer, len);
 }
 
 static int drm_bridge_connector_clear_spd_infoframe(struct drm_connector *connector)
@@ -539,12 +527,7 @@ static int drm_bridge_connector_clear_spd_infoframe(struct drm_connector *connec
 	if (!bridge)
 		return -EINVAL;
 
-	if (bridge->ops & DRM_BRIDGE_OP_HDMI_SPD_INFOFRAME)
-		return bridge->funcs->hdmi_clear_spd_infoframe(bridge);
-
-	drm_dbg_driver(connector->dev, "Unsupported HDMI SPD InfoFrame\n");
-
-	return 0;
+	return bridge->funcs->hdmi_clear_spd_infoframe(bridge);
 }
 
 static int drm_bridge_connector_write_spd_infoframe(struct drm_connector *connector,
@@ -558,12 +541,7 @@ static int drm_bridge_connector_write_spd_infoframe(struct drm_connector *connec
 	if (!bridge)
 		return -EINVAL;
 
-	if (bridge->ops & DRM_BRIDGE_OP_HDMI_SPD_INFOFRAME)
-		return bridge->funcs->hdmi_write_spd_infoframe(bridge, buffer, len);
-
-	drm_dbg_driver(connector->dev, "Unsupported HDMI SPD InfoFrame\n");
-
-	return 0;
+	return bridge->funcs->hdmi_write_spd_infoframe(bridge, buffer, len);
 }
 
 static const struct drm_edid *
@@ -591,18 +569,22 @@ static const struct drm_connector_hdmi_funcs drm_bridge_connector_hdmi_funcs = {
 		.clear_infoframe = drm_bridge_connector_clear_hdmi_infoframe,
 		.write_infoframe = drm_bridge_connector_write_hdmi_infoframe,
 	},
-	.audio = {
-		.clear_infoframe = drm_bridge_connector_clear_audio_infoframe,
-		.write_infoframe = drm_bridge_connector_write_audio_infoframe,
-	},
-	.hdr_drm = {
-		.clear_infoframe = drm_bridge_connector_clear_hdr_drm_infoframe,
-		.write_infoframe = drm_bridge_connector_write_hdr_drm_infoframe,
-	},
-	.spd = {
-		.clear_infoframe = drm_bridge_connector_clear_spd_infoframe,
-		.write_infoframe = drm_bridge_connector_write_spd_infoframe,
-	},
+	/* audio, hdr_drm and spd are set dynamically during init */
+};
+
+static const struct drm_connector_infoframe_funcs drm_bridge_connector_hdmi_audio_infoframe = {
+	.clear_infoframe = drm_bridge_connector_clear_audio_infoframe,
+	.write_infoframe = drm_bridge_connector_write_audio_infoframe,
+};
+
+static const struct drm_connector_infoframe_funcs drm_bridge_connector_hdmi_hdr_drm_infoframe = {
+	.clear_infoframe = drm_bridge_connector_clear_hdr_drm_infoframe,
+	.write_infoframe = drm_bridge_connector_write_hdr_drm_infoframe,
+};
+
+static const struct drm_connector_infoframe_funcs drm_bridge_connector_hdmi_spd_infoframe = {
+	.clear_infoframe = drm_bridge_connector_clear_spd_infoframe,
+	.write_infoframe = drm_bridge_connector_write_spd_infoframe,
 };
 
 static int drm_bridge_connector_audio_startup(struct drm_connector *connector)
@@ -971,11 +953,25 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 		if (!connector->ycbcr_420_allowed)
 			supported_formats &= ~BIT(HDMI_COLORSPACE_YUV420);
 
+		bridge_connector->hdmi_funcs = drm_bridge_connector_hdmi_funcs;
+
+		if (bridge_connector->bridge_hdmi->ops & DRM_BRIDGE_OP_HDMI_AUDIO)
+			bridge_connector->hdmi_funcs.audio =
+				drm_bridge_connector_hdmi_audio_infoframe;
+
+		if (bridge_connector->bridge_hdmi->ops & DRM_BRIDGE_OP_HDMI_HDR_DRM_INFOFRAME)
+			bridge_connector->hdmi_funcs.hdr_drm =
+				drm_bridge_connector_hdmi_hdr_drm_infoframe;
+
+		if (bridge_connector->bridge_hdmi->ops & DRM_BRIDGE_OP_HDMI_SPD_INFOFRAME)
+			bridge_connector->hdmi_funcs.spd =
+				drm_bridge_connector_hdmi_spd_infoframe;
+
 		ret = drmm_connector_hdmi_init(drm, connector,
 					       bridge_connector->bridge_hdmi->vendor,
 					       bridge_connector->bridge_hdmi->product,
 					       &drm_bridge_connector_funcs,
-					       &drm_bridge_connector_hdmi_funcs,
+					       &bridge_connector->hdmi_funcs,
 					       connector_type, ddc,
 					       supported_formats,
 					       max_bpc);

-- 
2.47.3


