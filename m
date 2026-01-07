Return-Path: <linux-arm-msm+bounces-87944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CE8CFF5D6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 19:15:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2747B3011AB0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 18:15:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A82135BDBA;
	Wed,  7 Jan 2026 18:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k5gYSI5I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Totbu+iG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B997C35A936
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 18:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767809719; cv=none; b=BO0SCuxSZpfYK5xRC0d9Vp3rcV8ZIkvlgeQ5LoBHIgRYIB/YdqSanNT1PwpY24FGkSF/YzP55nAfeiDyrO8nBecb8aOqsFVVbI45fpO7euwiKXt7eCVgHweDxVzE0u22FBfwVFWegetghdwMnqtUbOikQsbeleEquJFbL1UavWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767809719; c=relaxed/simple;
	bh=h+8kSKyyCVYvuPI9clygzcqBDU+O9Zth6ETXqpeby+g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dYkhjv8frsNLGJ6FCm58CbK8aflZUY+GVpdgSbt1TKevy+PTx1yAktMLXJIPRVIHiOd1BPZtDlXxpaZPUTwOm6+VP+snjupLCHvohwJFifNJUFO5gKKIgol8HLXtCTlmkMPeYs0vmN/Igtc7W+QOi6DJBrETSHWEsdRhFZf3wUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k5gYSI5I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Totbu+iG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607HU5Go3752247
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 18:15:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FuvKMsYdeHCb+qiex5eN4gaDeI4nVkcPpNxIVMGnEFs=; b=k5gYSI5I8dYAg17d
	fM5dOuknFoyC2v0PhhCcQJy5+WYmkaFXDf6UMm2EZAvqWe4PeRQlmErsiIPsumpW
	in/oAbaL16QkUWySHp9122buDOe66yeR+FWY2W9pm1pyNMCL9XIVOxw1jiXIy10Z
	b2rFMNQDtpmySyLiiWrz/ovTSBcd/EoniUTuKfFtxmoPje3jymd0OVP/TOQL21/8
	DR0aQJPIw7VvRe87OUkIAwv0cY7mlToaJtoxlnrYab9Vb8/BrU7tiYHoykcYN+Ey
	3QZ4a2nrlQ09bXti4056YjQbVoGpM//9sWpUq2cuGSYOu1QovfEpiz4ysWexp6sx
	RWp74Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhuxcr5d9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 18:15:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b22ab98226so265613785a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 10:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767809714; x=1768414514; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FuvKMsYdeHCb+qiex5eN4gaDeI4nVkcPpNxIVMGnEFs=;
        b=Totbu+iGlazpiUf07yyH6sGSoLSbZTWjiNCUEooZEn9FjFQ61beYRWuDP1PhWvp2yh
         2MFmmP3d3Ehry5b2RpHu89Dy0ySQ+RnEkFx33g8/5Vv4ifz82aN/tIvnRIzGVL17YlQs
         pgzaa8fg6Buz89N2ExniNGVvG6txCv4eT8dgqLmWnWsfte9dGUtnPnwFnCgnO9TvXyv9
         iBqVoqIMqN8LcPoR+mozT3S+BB2e5nH6Y7oLjJZRWYQC7xFfHQr7Pz/CiVrr6DsXaNW1
         MYO0DVkszg1vRqlIelnfZdzcnrEwK8Txtr1vxAj951mu1wU/frFOsLmugHtebNQmj6Ax
         h7uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767809714; x=1768414514;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FuvKMsYdeHCb+qiex5eN4gaDeI4nVkcPpNxIVMGnEFs=;
        b=VCakXPg2Fq7qQS75ExVTtZdJVg6lHjGZ2T+rdDe+m0E0INhZvwgpG/ymoGplSozGBJ
         9wKFDCwfw2cXrs5tCMHN3PKs7UZKaABFO2VyOEen22NtDNtA1hmDG+VrJIyKgYxy7ZnT
         33COrM4N5ucghfc6Z0W7bILdpb1SkQ6UwHmwCQm6aEDpYtPGkf44GPOB9/wzmbVprdqt
         91kb2xPjvuWo7zzBw/lTs8o92ouCPrycJI4cx8FrVelLtKodB9/NUCu80I48NcK1ujf9
         XBNIQYmhnA1xANcaTN/8mvZi/ei2X9pe6u6bLVeFQKwO7FoG6M0oT+tIPD+l/FOQxKYd
         guug==
X-Forwarded-Encrypted: i=1; AJvYcCUOIBQJG+tHR2JlJhOHOUzA3YocLG4E22eeYNLUh/JXag07rFKo5mgDEktFcdmphMDD3OojeyANUXcmRonr@vger.kernel.org
X-Gm-Message-State: AOJu0YyZw8cixUE4GbnZ5rXK4EiWJ6jL0wBRLEzYvQ6m0k0krn5qWUTK
	+xg4qAdC1AaeZ0/YjL+QPb4f8niAoAY5aRJwlywO4wi+XsNwhyFachT7ZDzN6EVlNrReg1GTwDK
	DmnhkyQfQ8bH8a3WJSFvTeAqV3RQW+igSx4aa9Y81P18MF4LdIcKqDxM+AsqXT4JSPv76
X-Gm-Gg: AY/fxX4T8NfLOHO6CBe7mGGwE7gSHzhZjp/Z/nx0ouHagjEjbERqoHChf29Q1pitrC8
	d8u+sf6NOQ68g5jcM+vZyuJ4fJjknWVeYZzfDAfTFvHeqcHLvtYsnzeNxCPioqAGOCt+oFUwNK5
	9ZriEgN2oWjHknLpKFRvvYDM4aVQwTkP1j/D0XR2QMv40S5oYidXhusGrWrQqyl2RLLojVsk17W
	H7775WFAhlm/7DMNwO9afMq4xZn5SHJ/o0kHW5lAJIm9XgtkFWq1TajFiIpsquz9gRShz2wwNYy
	XZ1GXq77jnGK0hlQ+5ffBKUBS0mjMJvdRd8gzotx/Q9JREAvKjAMY7jUNI4B6B355cXId6r+gld
	oNR5ukT9FY7dYog51Qv3XBadS6/Cmq00vqNf1OQLvv3bKaVn0WNkt3X2cI0HTnirwX1F3/WVAiL
	1J4ZtDZvS4+n3tmfETAqVEUvk=
X-Received: by 2002:a05:620a:698b:b0:8b8:dd7f:f032 with SMTP id af79cd13be357-8c38941bec9mr417352285a.78.1767809713461;
        Wed, 07 Jan 2026 10:15:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHoPBA8+usgh8WzBjQcdgLKsyd4pGWZrSMVrhAynD9c1OqnfO2wCskwOefNw7pH9SByyRIHiA==
X-Received: by 2002:a05:620a:698b:b0:8b8:dd7f:f032 with SMTP id af79cd13be357-8c38941bec9mr417342485a.78.1767809712676;
        Wed, 07 Jan 2026 10:15:12 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d6988asm1436884e87.80.2026.01.07.10.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 10:15:11 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 07 Jan 2026 20:15:03 +0200
Subject: [PATCH v4 06/10] drm/display: hdmi_state_helper: split InfoFrame
 functions per type
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-limit-infoframes-2-v4-6-213d0d3bd490@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=35452;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=h+8kSKyyCVYvuPI9clygzcqBDU+O9Zth6ETXqpeby+g=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpXqKkW8YHXV5Ify/ZnGCs1fh2rPNCIYw+Hww1v
 6TTYyGVo26JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaV6ipAAKCRCLPIo+Aiko
 1XMACACCiORH8/VxHuARR4jC9zTWC4weknBPdzh2/dczrn7LnTslSIwwzW/YqMKowkAyvx4QZL4
 Kb9P3cbOnPag/CQdL1Q3wUxPvZMXfhb8+607lpgm2mUUyYvX/zHZrCfzWqQLk6JGqwz4zBg2NUj
 ov1WzfAwXe/UUbwjf+QF6GX4MbBhopo7f86SYAMTe3Fizo5s+4a2jSzeyJxdRGN7WHXr0gSypg3
 koy7NKvt0CRrmph4Ov0bc33YNOeIIk08bklKxwzRhOdynycd+YLuete7Jnneqhf1CD+skA7GY9L
 aKpqoR7OgtZJJm7LITmUXvLy6CBc0SFmJdjXZp3oj0cDWXEB
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDE0NCBTYWx0ZWRfX71ezhT3v5wmT
 g7GMZMZyMgbJtIlKfW6jqvyt//wQiaQfXZ6wzIUWfglOsJqEPrkVDg2nmxhXflFhnYGMz0NRby4
 XVFZ8AwTe5SwBkxB+/NpYc0dZ0flPj2O+vRjxIV+I9YVMr36egXS7Zm4U9nHUcBFt/kejIivlmB
 7nLMMyvoANTLuIyaxFVdWWFDEtjy32T5kymw85jjiImSk5Y4h2H6lylDaQeb5KkgG75tCQSK4Bu
 u6mLUIDmGn7Zc+jjMBxOie0V/GaUltMwmhDK7gelmTeIAfhMapLXrcs5JoNJ8tJPMWUuz7hzI/g
 wJSFwaOOld74ympEmIG8G0YeOt5cp5GRiKQd81FtbmIHIhbRH7VXjysDLYBZNYH2T/1aLOy9GLs
 867yNhewaf+5usWSE+B4vfBa7qIeq29Hq2/s+gE7HGCKBs67+3h1n9+1zh6F/sJPNm8pg/k0fBR
 RPaqT0OWmQq3SKQbYhg==
X-Proofpoint-ORIG-GUID: hNdiUXBhYRnKj4rmDchC_w9S6RlnKr9f
X-Authority-Analysis: v=2.4 cv=SPdPlevH c=1 sm=1 tr=0 ts=695ea2b2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bATBssBWj1biXikgvRQA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: hNdiUXBhYRnKj4rmDchC_w9S6RlnKr9f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 bulkscore=0 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070144

Havign a single set of InfoFrame callbacks doesn't provide enough
information to the DRM framework about the InfoFrame types that are
actually supported. Also it's not really future-proof: it provides a way
to program only a single Vendor-Specific frame, however we might need to
support multiple VSIs at the same time (e.g. HDMI vs HDMI Forum
VSIs).

Provide separate sets of callbacks, one per the InfoFrame type.

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c     | 206 ++++++++++++++++-----
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  86 ++++-----
 drivers/gpu/drm/drm_connector.c                    |   6 +-
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |  39 ++--
 drivers/gpu/drm/tests/drm_connector_test.c         |  14 +-
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 102 +++++-----
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |  82 +++++++-
 include/drm/drm_connector.h                        | 105 ++++++++---
 8 files changed, 455 insertions(+), 185 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index d38519e3923e..ca6a72a4cf80 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -401,8 +401,7 @@ drm_bridge_connector_tmds_char_rate_valid(const struct drm_connector *connector,
 		return MODE_OK;
 }
 
-static int drm_bridge_connector_clear_infoframe(struct drm_connector *connector,
-						enum hdmi_infoframe_type type)
+static int drm_bridge_connector_clear_avi_infoframe(struct drm_connector *connector)
 {
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
@@ -412,35 +411,70 @@ static int drm_bridge_connector_clear_infoframe(struct drm_connector *connector,
 	if (!bridge)
 		return -EINVAL;
 
-	switch (type) {
-	case HDMI_INFOFRAME_TYPE_AVI:
-		/* required */
-		return bridge->funcs->hdmi_clear_avi_infoframe(bridge);
-	case HDMI_INFOFRAME_TYPE_VENDOR:
-		/* required */
-		return bridge->funcs->hdmi_clear_hdmi_infoframe(bridge);
-	case HDMI_INFOFRAME_TYPE_AUDIO:
-		if (bridge->ops & DRM_BRIDGE_OP_HDMI_AUDIO)
-			return bridge->funcs->hdmi_clear_audio_infoframe(bridge);
-		break;
-	case HDMI_INFOFRAME_TYPE_DRM:
-		if (bridge->ops & DRM_BRIDGE_OP_HDMI_HDR_DRM_INFOFRAME)
-			return bridge->funcs->hdmi_clear_hdr_drm_infoframe(bridge);
-		break;
-	case HDMI_INFOFRAME_TYPE_SPD:
-		if (bridge->ops & DRM_BRIDGE_OP_HDMI_SPD_INFOFRAME)
-			return bridge->funcs->hdmi_clear_spd_infoframe(bridge);
-		break;
-	}
+	return bridge->funcs->hdmi_clear_avi_infoframe(bridge);
+}
+
+static int drm_bridge_connector_write_avi_infoframe(struct drm_connector *connector,
+						    const u8 *buffer, size_t len)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi;
+	if (!bridge)
+		return -EINVAL;
+
+	return bridge->funcs->hdmi_write_avi_infoframe(bridge, buffer, len);
+}
 
-	drm_dbg_driver(connector->dev, "Unsupported HDMI InfoFrame %x\n", type);
+static int drm_bridge_connector_clear_hdmi_infoframe(struct drm_connector *connector)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi;
+	if (!bridge)
+		return -EINVAL;
+
+	return bridge->funcs->hdmi_clear_hdmi_infoframe(bridge);
+}
+
+static int drm_bridge_connector_write_hdmi_infoframe(struct drm_connector *connector,
+						     const u8 *buffer, size_t len)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi;
+	if (!bridge)
+		return -EINVAL;
+
+	return bridge->funcs->hdmi_write_hdmi_infoframe(bridge, buffer, len);
+}
+
+static int drm_bridge_connector_clear_audio_infoframe(struct drm_connector *connector)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi;
+	if (!bridge)
+		return -EINVAL;
+
+	if (bridge->ops & DRM_BRIDGE_OP_HDMI_AUDIO)
+		return bridge->funcs->hdmi_clear_audio_infoframe(bridge);
+
+	drm_dbg_driver(connector->dev, "Unsupported HDMI Audio InfoFrame\n");
 
 	return 0;
 }
 
-static int drm_bridge_connector_write_infoframe(struct drm_connector *connector,
-						enum hdmi_infoframe_type type,
-						const u8 *buffer, size_t len)
+static int drm_bridge_connector_write_audio_infoframe(struct drm_connector *connector,
+						      const u8 *buffer, size_t len)
 {
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
@@ -450,28 +484,84 @@ static int drm_bridge_connector_write_infoframe(struct drm_connector *connector,
 	if (!bridge)
 		return -EINVAL;
 
-	switch (type) {
-	case HDMI_INFOFRAME_TYPE_AVI:
-		/* required */
-		return bridge->funcs->hdmi_write_avi_infoframe(bridge, buffer, len);
-	case HDMI_INFOFRAME_TYPE_VENDOR:
-		/* required */
-		return bridge->funcs->hdmi_write_hdmi_infoframe(bridge, buffer, len);
-	case HDMI_INFOFRAME_TYPE_AUDIO:
-		if (bridge->ops & DRM_BRIDGE_OP_HDMI_AUDIO)
-			return bridge->funcs->hdmi_write_audio_infoframe(bridge, buffer, len);
-		break;
-	case HDMI_INFOFRAME_TYPE_DRM:
-		if (bridge->ops & DRM_BRIDGE_OP_HDMI_HDR_DRM_INFOFRAME)
-			return bridge->funcs->hdmi_write_hdr_drm_infoframe(bridge, buffer, len);
-		break;
-	case HDMI_INFOFRAME_TYPE_SPD:
-		if (bridge->ops & DRM_BRIDGE_OP_HDMI_SPD_INFOFRAME)
-			return bridge->funcs->hdmi_write_spd_infoframe(bridge, buffer, len);
-		break;
-	}
+	if (bridge->ops & DRM_BRIDGE_OP_HDMI_AUDIO)
+		return bridge->funcs->hdmi_write_audio_infoframe(bridge, buffer, len);
+
+	drm_dbg_driver(connector->dev, "Unsupported HDMI Audio InfoFrame\n");
+
+	return 0;
+}
+
+static int drm_bridge_connector_clear_hdr_drm_infoframe(struct drm_connector *connector)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi;
+	if (!bridge)
+		return -EINVAL;
+
+	if (bridge->ops & DRM_BRIDGE_OP_HDMI_HDR_DRM_INFOFRAME)
+		return bridge->funcs->hdmi_clear_hdr_drm_infoframe(bridge);
+
+	drm_dbg_driver(connector->dev, "Unsupported HDMI HDR DRM InfoFrame\n");
+
+	return 0;
+}
+
+static int drm_bridge_connector_write_hdr_drm_infoframe(struct drm_connector *connector,
+							const u8 *buffer, size_t len)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi;
+	if (!bridge)
+		return -EINVAL;
+
+	if (bridge->ops & DRM_BRIDGE_OP_HDMI_HDR_DRM_INFOFRAME)
+		return bridge->funcs->hdmi_write_hdr_drm_infoframe(bridge, buffer, len);
+
+	drm_dbg_driver(connector->dev, "Unsupported HDMI HDR DRM InfoFrame\n");
+
+	return 0;
+}
+
+static int drm_bridge_connector_clear_spd_infoframe(struct drm_connector *connector)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi;
+	if (!bridge)
+		return -EINVAL;
+
+	if (bridge->ops & DRM_BRIDGE_OP_HDMI_SPD_INFOFRAME)
+		return bridge->funcs->hdmi_clear_spd_infoframe(bridge);
+
+	drm_dbg_driver(connector->dev, "Unsupported HDMI SPD InfoFrame\n");
+
+	return 0;
+}
+
+static int drm_bridge_connector_write_spd_infoframe(struct drm_connector *connector,
+						    const u8 *buffer, size_t len)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi;
+	if (!bridge)
+		return -EINVAL;
+
+	if (bridge->ops & DRM_BRIDGE_OP_HDMI_SPD_INFOFRAME)
+		return bridge->funcs->hdmi_write_spd_infoframe(bridge, buffer, len);
 
-	drm_dbg_driver(connector->dev, "Unsupported HDMI InfoFrame %x\n", type);
+	drm_dbg_driver(connector->dev, "Unsupported HDMI SPD InfoFrame\n");
 
 	return 0;
 }
@@ -492,9 +582,27 @@ drm_bridge_connector_read_edid(struct drm_connector *connector)
 
 static const struct drm_connector_hdmi_funcs drm_bridge_connector_hdmi_funcs = {
 	.tmds_char_rate_valid = drm_bridge_connector_tmds_char_rate_valid,
-	.clear_infoframe = drm_bridge_connector_clear_infoframe,
-	.write_infoframe = drm_bridge_connector_write_infoframe,
 	.read_edid = drm_bridge_connector_read_edid,
+	.avi = {
+		.clear_infoframe = drm_bridge_connector_clear_avi_infoframe,
+		.write_infoframe = drm_bridge_connector_write_avi_infoframe,
+	},
+	.hdmi = {
+		.clear_infoframe = drm_bridge_connector_clear_hdmi_infoframe,
+		.write_infoframe = drm_bridge_connector_write_hdmi_infoframe,
+	},
+	.audio = {
+		.clear_infoframe = drm_bridge_connector_clear_audio_infoframe,
+		.write_infoframe = drm_bridge_connector_write_audio_infoframe,
+	},
+	.hdr_drm = {
+		.clear_infoframe = drm_bridge_connector_clear_hdr_drm_infoframe,
+		.write_infoframe = drm_bridge_connector_write_hdr_drm_infoframe,
+	},
+	.spd = {
+		.clear_infoframe = drm_bridge_connector_clear_spd_infoframe,
+		.write_infoframe = drm_bridge_connector_write_spd_infoframe,
+	},
 };
 
 static int drm_bridge_connector_audio_startup(struct drm_connector *connector)
diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index a561f124be99..5a3817271d91 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -891,21 +891,21 @@ drm_hdmi_connector_mode_valid(struct drm_connector *connector,
 }
 EXPORT_SYMBOL(drm_hdmi_connector_mode_valid);
 
-static int clear_device_infoframe(struct drm_connector *connector,
-				  enum hdmi_infoframe_type type)
+static int clear_infoframe(struct drm_connector *connector,
+			   const struct drm_connector_infoframe_funcs *funcs,
+			   const char *type)
 {
-	const struct drm_connector_hdmi_funcs *funcs = connector->hdmi.funcs;
 	struct drm_device *dev = connector->dev;
 	int ret;
 
-	drm_dbg_kms(dev, "Clearing infoframe type 0x%x\n", type);
+	drm_dbg_kms(dev, "Clearing %s InfoFrame\n", type);
 
-	if (!funcs || !funcs->clear_infoframe) {
+	if (!funcs->clear_infoframe) {
 		drm_dbg_kms(dev, "Function not implemented, bailing.\n");
 		return 0;
 	}
 
-	ret = funcs->clear_infoframe(connector, type);
+	ret = funcs->clear_infoframe(connector);
 	if (ret) {
 		drm_dbg_kms(dev, "Call failed: %d\n", ret);
 		return ret;
@@ -914,39 +914,28 @@ static int clear_device_infoframe(struct drm_connector *connector,
 	return 0;
 }
 
-static int clear_infoframe(struct drm_connector *connector,
-			   struct drm_connector_hdmi_infoframe *old_frame)
-{
-	int ret;
-
-	ret = clear_device_infoframe(connector, old_frame->data.any.type);
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
-static int write_device_infoframe(struct drm_connector *connector,
-				  union hdmi_infoframe *frame)
+static int write_infoframe(struct drm_connector *connector,
+			   const struct drm_connector_infoframe_funcs *funcs,
+			   const char *type,
+			   struct drm_connector_hdmi_infoframe *new_frame)
 {
-	const struct drm_connector_hdmi_funcs *funcs = connector->hdmi.funcs;
 	struct drm_device *dev = connector->dev;
 	u8 buffer[HDMI_INFOFRAME_SIZE(MAX)];
 	int ret;
 	int len;
 
-	drm_dbg_kms(dev, "Writing infoframe type %x\n", frame->any.type);
+	drm_dbg_kms(dev, "Writing %s InfoFrame\n", type);
 
-	if (!funcs || !funcs->write_infoframe) {
+	if (!funcs->write_infoframe) {
 		drm_dbg_kms(dev, "Function not implemented, bailing.\n");
-		return -EINVAL;
+		return 0; /* XXX: temporal until we stop generating unsupported frames */
 	}
 
-	len = hdmi_infoframe_pack(frame, buffer, sizeof(buffer));
+	len = hdmi_infoframe_pack(&new_frame->data, buffer, sizeof(buffer));
 	if (len < 0)
 		return len;
 
-	ret = funcs->write_infoframe(connector, frame->any.type, buffer, len);
+	ret = funcs->write_infoframe(connector, buffer, len);
 	if (ret) {
 		drm_dbg_kms(dev, "Call failed: %d\n", ret);
 		return ret;
@@ -955,27 +944,17 @@ static int write_device_infoframe(struct drm_connector *connector,
 	return 0;
 }
 
-static int write_infoframe(struct drm_connector *connector,
-			   struct drm_connector_hdmi_infoframe *new_frame)
-{
-	int ret;
-
-	ret = write_device_infoframe(connector, &new_frame->data);
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
 static int write_or_clear_infoframe(struct drm_connector *connector,
+				    const struct drm_connector_infoframe_funcs *funcs,
+				    const char *type,
 				    struct drm_connector_hdmi_infoframe *old_frame,
 				    struct drm_connector_hdmi_infoframe *new_frame)
 {
 	if (new_frame->set)
-		return write_infoframe(connector, new_frame);
+		return write_infoframe(connector, funcs, type, new_frame);
 
 	if (old_frame->set && !new_frame->set)
-		return clear_infoframe(connector, old_frame);
+		return clear_infoframe(connector, funcs, type);
 
 	return 0;
 }
@@ -995,6 +974,7 @@ static int write_or_clear_infoframe(struct drm_connector *connector,
 int drm_atomic_helper_connector_hdmi_update_infoframes(struct drm_connector *connector,
 						       struct drm_atomic_state *state)
 {
+	const struct drm_connector_hdmi_funcs *funcs = connector->hdmi.funcs;
 	struct drm_connector_state *old_conn_state =
 		drm_atomic_get_old_connector_state(state, connector);
 	struct drm_connector_state *new_conn_state =
@@ -1005,9 +985,15 @@ int drm_atomic_helper_connector_hdmi_update_infoframes(struct drm_connector *con
 	if (!info->is_hdmi)
 		return 0;
 
+	if (!funcs) {
+		drm_dbg_kms(connector->dev, "Function not implemented, bailing.\n");
+		return -EINVAL;
+	}
+
 	mutex_lock(&connector->hdmi.infoframes.lock);
 
 	ret = write_or_clear_infoframe(connector,
+				       &funcs->avi, "AVI",
 				       &old_conn_state->hdmi.infoframes.avi,
 				       &new_conn_state->hdmi.infoframes.avi);
 	if (ret)
@@ -1015,18 +1001,21 @@ int drm_atomic_helper_connector_hdmi_update_infoframes(struct drm_connector *con
 
 	if (connector->hdmi.infoframes.audio.set) {
 		ret = write_infoframe(connector,
+				      &funcs->audio, "Audio",
 				      &connector->hdmi.infoframes.audio);
 		if (ret)
 			goto out;
 	}
 
 	ret = write_or_clear_infoframe(connector,
+				       &funcs->hdr_drm, "HDR DRM",
 				       &old_conn_state->hdmi.infoframes.hdr_drm,
 				       &new_conn_state->hdmi.infoframes.hdr_drm);
 	if (ret)
 		goto out;
 
 	ret = write_or_clear_infoframe(connector,
+				       &funcs->spd, "SPD",
 				       &old_conn_state->hdmi.infoframes.spd,
 				       &new_conn_state->hdmi.infoframes.spd);
 	if (ret)
@@ -1034,6 +1023,7 @@ int drm_atomic_helper_connector_hdmi_update_infoframes(struct drm_connector *con
 
 	if (info->has_hdmi_infoframe) {
 		ret = write_or_clear_infoframe(connector,
+					       &funcs->hdmi, "HDMI-VS",
 					       &old_conn_state->hdmi.infoframes.hdmi,
 					       &new_conn_state->hdmi.infoframes.hdmi);
 		if (ret)
@@ -1062,6 +1052,7 @@ int
 drm_atomic_helper_connector_hdmi_update_audio_infoframe(struct drm_connector *connector,
 							struct hdmi_audio_infoframe *frame)
 {
+	const struct drm_connector_hdmi_funcs *funcs = connector->hdmi.funcs;
 	struct drm_connector_hdmi_infoframe *infoframe =
 		&connector->hdmi.infoframes.audio;
 	struct drm_display_info *info = &connector->display_info;
@@ -1070,12 +1061,17 @@ drm_atomic_helper_connector_hdmi_update_audio_infoframe(struct drm_connector *co
 	if (!info->is_hdmi)
 		return 0;
 
+	if (!funcs) {
+		drm_dbg_kms(connector->dev, "Function not implemented, bailing.\n");
+		return -EINVAL;
+	}
+
 	mutex_lock(&connector->hdmi.infoframes.lock);
 
 	memcpy(&infoframe->data, frame, sizeof(infoframe->data));
 	infoframe->set = true;
 
-	ret = write_infoframe(connector, infoframe);
+	ret = write_infoframe(connector, &funcs->audio, "Audio", infoframe);
 
 	mutex_unlock(&connector->hdmi.infoframes.lock);
 
@@ -1097,6 +1093,7 @@ EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_update_audio_infoframe);
 int
 drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector *connector)
 {
+	const struct drm_connector_hdmi_funcs *funcs = connector->hdmi.funcs;
 	struct drm_connector_hdmi_infoframe *infoframe =
 		&connector->hdmi.infoframes.audio;
 	struct drm_display_info *info = &connector->display_info;
@@ -1105,11 +1102,16 @@ drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector *con
 	if (!info->is_hdmi)
 		return 0;
 
+	if (!funcs) {
+		drm_dbg_kms(connector->dev, "Function not implemented, bailing.\n");
+		return -EINVAL;
+	}
+
 	mutex_lock(&connector->hdmi.infoframes.lock);
 
 	infoframe->set = false;
 
-	ret = clear_infoframe(connector, infoframe);
+	ret = clear_infoframe(connector, &funcs->audio, "Audio");
 
 	memset(&infoframe->data, 0, sizeof(infoframe->data));
 
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 40e025712c9b..4f5b27fab475 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -600,8 +600,10 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 	if (!(max_bpc == 8 || max_bpc == 10 || max_bpc == 12))
 		return -EINVAL;
 
-	if (!hdmi_funcs->clear_infoframe ||
-	    !hdmi_funcs->write_infoframe)
+	if (!hdmi_funcs->avi.clear_infoframe ||
+	    !hdmi_funcs->avi.write_infoframe ||
+	    !hdmi_funcs->hdmi.clear_infoframe ||
+	    !hdmi_funcs->hdmi.write_infoframe)
 		return -EINVAL;
 
 	ret = drmm_connector_init(dev, connector, funcs, connector_type, ddc);
diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index 6263ee15880a..a50f260c73e4 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -40,27 +40,19 @@
 #define drm_connector_to_sun4i_hdmi(c)		\
 	container_of_const(c, struct sun4i_hdmi, connector)
 
-static int sun4i_hdmi_clear_infoframe(struct drm_connector *connector,
-				      enum hdmi_infoframe_type type)
+static int sun4i_hdmi_clear_avi_infoframe(struct drm_connector *connector)
 {
 	drm_warn_once(connector->dev, "clearing of AVI infoframe is not implemented\n");
 
 	return 0;
 }
 
-static int sun4i_hdmi_write_infoframe(struct drm_connector *connector,
-				      enum hdmi_infoframe_type type,
-				      const u8 *buffer, size_t len)
+static int sun4i_hdmi_write_avi_infoframe(struct drm_connector *connector,
+					  const u8 *buffer, size_t len)
 {
 	struct sun4i_hdmi *hdmi = drm_connector_to_sun4i_hdmi(connector);
 	int i;
 
-	if (type != HDMI_INFOFRAME_TYPE_AVI) {
-		drm_err(connector->dev,
-			"Unsupported infoframe type: %u\n", type);
-		return 0;
-	}
-
 	for (i = 0; i < len; i++)
 		writeb(buffer[i], hdmi->base + SUN4I_HDMI_AVI_INFOFRAME_REG(i));
 
@@ -68,6 +60,21 @@ static int sun4i_hdmi_write_infoframe(struct drm_connector *connector,
 
 }
 
+static int sun4i_hdmi_clear_hdmi_infoframe(struct drm_connector *connector)
+{
+	drm_warn_once(connector->dev, "HDMI VSI not implemented\n");
+
+	return 0;
+}
+
+static int sun4i_hdmi_write_hdmi_infoframe(struct drm_connector *connector,
+					   const u8 *buffer, size_t len)
+{
+	drm_warn_once(connector->dev, "HDMI VSI not implemented\n");
+
+	return 0;
+}
+
 static void sun4i_hdmi_disable(struct drm_encoder *encoder,
 			       struct drm_atomic_state *state)
 {
@@ -244,8 +251,14 @@ static struct i2c_adapter *sun4i_hdmi_get_ddc(struct device *dev)
 
 static const struct drm_connector_hdmi_funcs sun4i_hdmi_hdmi_connector_funcs = {
 	.tmds_char_rate_valid	= sun4i_hdmi_connector_clock_valid,
-	.clear_infoframe	= sun4i_hdmi_clear_infoframe,
-	.write_infoframe	= sun4i_hdmi_write_infoframe,
+	.avi = {
+		.clear_infoframe	= sun4i_hdmi_clear_avi_infoframe,
+		.write_infoframe	= sun4i_hdmi_write_avi_infoframe,
+	},
+	.hdmi = {
+		.clear_infoframe	= sun4i_hdmi_clear_hdmi_infoframe,
+		.write_infoframe	= sun4i_hdmi_write_hdmi_infoframe,
+	},
 };
 
 static const struct drm_connector_helper_funcs sun4i_hdmi_connector_helper_funcs = {
diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
index f356ea695ae7..86860ad0861c 100644
--- a/drivers/gpu/drm/tests/drm_connector_test.c
+++ b/drivers/gpu/drm/tests/drm_connector_test.c
@@ -25,22 +25,26 @@ struct drm_connector_init_priv {
 	struct i2c_adapter ddc;
 };
 
-static int accept_infoframe_clear_infoframe(struct drm_connector *connector,
-					    enum hdmi_infoframe_type type)
+static int accept_infoframe_clear_infoframe(struct drm_connector *connector)
 {
 	return 0;
 }
 
 static int accept_infoframe_write_infoframe(struct drm_connector *connector,
-					    enum hdmi_infoframe_type type,
 					    const u8 *buffer, size_t len)
 {
 	return 0;
 }
 
 static const struct drm_connector_hdmi_funcs dummy_hdmi_funcs = {
-	.clear_infoframe = accept_infoframe_clear_infoframe,
-	.write_infoframe = accept_infoframe_write_infoframe,
+	.avi = {
+		.clear_infoframe = accept_infoframe_clear_infoframe,
+		.write_infoframe = accept_infoframe_write_infoframe,
+	},
+	.hdmi = {
+		.clear_infoframe = accept_infoframe_clear_infoframe,
+		.write_infoframe = accept_infoframe_write_infoframe,
+	},
 };
 
 static const struct drm_connector_funcs dummy_funcs = {
diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index cfa14a6eb97f..1c60947a13a1 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -78,22 +78,26 @@ static int set_connector_edid(struct kunit *test, struct drm_connector *connecto
 	return ret;
 }
 
-static int accept_infoframe_clear_infoframe(struct drm_connector *connector,
-					    enum hdmi_infoframe_type type)
+static int accept_infoframe_clear_infoframe(struct drm_connector *connector)
 {
 	return 0;
 }
 
 static int accept_infoframe_write_infoframe(struct drm_connector *connector,
-					    enum hdmi_infoframe_type type,
 					    const u8 *buffer, size_t len)
 {
 	return 0;
 }
 
 static const struct drm_connector_hdmi_funcs dummy_connector_hdmi_funcs = {
-	.clear_infoframe = accept_infoframe_clear_infoframe,
-	.write_infoframe = accept_infoframe_write_infoframe,
+	.avi = {
+		.clear_infoframe = accept_infoframe_clear_infoframe,
+		.write_infoframe = accept_infoframe_write_infoframe,
+	},
+	.hdmi = {
+		.clear_infoframe = accept_infoframe_clear_infoframe,
+		.write_infoframe = accept_infoframe_write_infoframe,
+	},
 };
 
 static enum drm_mode_status
@@ -106,8 +110,14 @@ reject_connector_tmds_char_rate_valid(const struct drm_connector *connector,
 
 static const struct drm_connector_hdmi_funcs reject_connector_hdmi_funcs = {
 	.tmds_char_rate_valid	= reject_connector_tmds_char_rate_valid,
-	.clear_infoframe = accept_infoframe_clear_infoframe,
-	.write_infoframe = accept_infoframe_write_infoframe,
+	.avi = {
+		.clear_infoframe = accept_infoframe_clear_infoframe,
+		.write_infoframe = accept_infoframe_write_infoframe,
+	},
+	.hdmi = {
+		.clear_infoframe = accept_infoframe_clear_infoframe,
+		.write_infoframe = accept_infoframe_write_infoframe,
+	},
 };
 
 static enum drm_mode_status
@@ -120,8 +130,14 @@ reject_100mhz_connector_tmds_char_rate_valid(const struct drm_connector *connect
 
 static const struct drm_connector_hdmi_funcs reject_100mhz_connector_hdmi_funcs = {
 	.tmds_char_rate_valid	= reject_100mhz_connector_tmds_char_rate_valid,
-	.clear_infoframe = accept_infoframe_clear_infoframe,
-	.write_infoframe = accept_infoframe_write_infoframe,
+	.avi = {
+		.clear_infoframe = accept_infoframe_clear_infoframe,
+		.write_infoframe = accept_infoframe_write_infoframe,
+	},
+	.hdmi = {
+		.clear_infoframe = accept_infoframe_clear_infoframe,
+		.write_infoframe = accept_infoframe_write_infoframe,
+	},
 };
 
 static int dummy_connector_get_modes(struct drm_connector *connector)
@@ -2449,19 +2465,21 @@ static void drm_test_check_infoframes(struct kunit *test)
 	drm_modeset_acquire_fini(&ctx);
 }
 
-static int reject_avi_infoframe_write_infoframe(struct drm_connector *connector,
-						enum hdmi_infoframe_type type,
-						const u8 *buffer, size_t len)
+static int reject_infoframe_write_infoframe(struct drm_connector *connector,
+					    const u8 *buffer, size_t len)
 {
-	if (type == HDMI_INFOFRAME_TYPE_AVI)
-		return -EOPNOTSUPP;
-
-	return 0;
+	return -EOPNOTSUPP;
 }
 
 static const struct drm_connector_hdmi_funcs reject_avi_infoframe_hdmi_funcs = {
-	.clear_infoframe = accept_infoframe_clear_infoframe,
-	.write_infoframe = reject_avi_infoframe_write_infoframe,
+	.avi = {
+		.clear_infoframe = accept_infoframe_clear_infoframe,
+		.write_infoframe = reject_infoframe_write_infoframe,
+	},
+	.hdmi = {
+		.clear_infoframe = accept_infoframe_clear_infoframe,
+		.write_infoframe = accept_infoframe_write_infoframe,
+	},
 };
 
 /*
@@ -2552,19 +2570,19 @@ static void drm_test_check_reject_avi_infoframe(struct kunit *test)
 	drm_modeset_acquire_fini(&ctx);
 }
 
-static int reject_hdr_infoframe_write_infoframe(struct drm_connector *connector,
-						enum hdmi_infoframe_type type,
-						const u8 *buffer, size_t len)
-{
-	if (type == HDMI_INFOFRAME_TYPE_DRM)
-		return -EOPNOTSUPP;
-
-	return 0;
-}
-
 static const struct drm_connector_hdmi_funcs reject_hdr_infoframe_hdmi_funcs = {
-	.clear_infoframe = accept_infoframe_clear_infoframe,
-	.write_infoframe = reject_hdr_infoframe_write_infoframe,
+	.avi = {
+		.clear_infoframe = accept_infoframe_clear_infoframe,
+		.write_infoframe = accept_infoframe_write_infoframe,
+	},
+	.hdmi = {
+		.clear_infoframe = accept_infoframe_clear_infoframe,
+		.write_infoframe = accept_infoframe_write_infoframe,
+	},
+	.hdr_drm = {
+		.clear_infoframe = accept_infoframe_clear_infoframe,
+		.write_infoframe = reject_infoframe_write_infoframe,
+	},
 };
 
 /*
@@ -2800,19 +2818,19 @@ static void drm_test_check_reject_hdr_infoframe_bpc_10(struct kunit *test)
 	drm_modeset_acquire_fini(&ctx);
 }
 
-static int reject_audio_infoframe_write_infoframe(struct drm_connector *connector,
-						  enum hdmi_infoframe_type type,
-						  const u8 *buffer, size_t len)
-{
-	if (type == HDMI_INFOFRAME_TYPE_AUDIO)
-		return -EOPNOTSUPP;
-
-	return 0;
-}
-
 static const struct drm_connector_hdmi_funcs reject_audio_infoframe_hdmi_funcs = {
-	.clear_infoframe = accept_infoframe_clear_infoframe,
-	.write_infoframe = reject_audio_infoframe_write_infoframe,
+	.avi = {
+		.clear_infoframe = accept_infoframe_clear_infoframe,
+		.write_infoframe = accept_infoframe_write_infoframe,
+	},
+	.hdmi = {
+		.clear_infoframe = accept_infoframe_clear_infoframe,
+		.write_infoframe = accept_infoframe_write_infoframe,
+	},
+	.audio = {
+		.clear_infoframe = accept_infoframe_clear_infoframe,
+		.write_infoframe = reject_infoframe_write_infoframe,
+	},
 };
 
 /*
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 4cfb7ebc0c81..9fe605a42df7 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -727,6 +727,66 @@ static int vc4_hdmi_write_infoframe(struct drm_connector *connector,
 	return ret;
 }
 
+static int vc4_hdmi_clear_avi_infoframe(struct drm_connector *connector)
+{
+	return vc4_hdmi_clear_infoframe(connector, HDMI_INFOFRAME_TYPE_AVI);
+}
+
+static int vc4_hdmi_clear_hdmi_infoframe(struct drm_connector *connector)
+{
+	return vc4_hdmi_clear_infoframe(connector, HDMI_INFOFRAME_TYPE_VENDOR);
+}
+
+static int vc4_hdmi_clear_audio_infoframe(struct drm_connector *connector)
+{
+	return vc4_hdmi_clear_infoframe(connector, HDMI_INFOFRAME_TYPE_AUDIO);
+}
+
+static int vc4_hdmi_clear_hdr_drm_infoframe(struct drm_connector *connector)
+{
+	return vc4_hdmi_clear_infoframe(connector, HDMI_INFOFRAME_TYPE_DRM);
+}
+
+static int vc4_hdmi_clear_spd_infoframe(struct drm_connector *connector)
+{
+	return vc4_hdmi_clear_infoframe(connector, HDMI_INFOFRAME_TYPE_SPD);
+}
+
+static int vc4_hdmi_write_avi_infoframe(struct drm_connector *connector,
+					const u8 *buffer, size_t len)
+{
+	return vc4_hdmi_write_infoframe(connector, HDMI_INFOFRAME_TYPE_AVI,
+					buffer, len);
+}
+
+static int vc4_hdmi_write_hdmi_infoframe(struct drm_connector *connector,
+					 const u8 *buffer, size_t len)
+{
+	return vc4_hdmi_write_infoframe(connector, HDMI_INFOFRAME_TYPE_VENDOR,
+					buffer, len);
+}
+
+static int vc4_hdmi_write_audio_infoframe(struct drm_connector *connector,
+					  const u8 *buffer, size_t len)
+{
+	return vc4_hdmi_write_infoframe(connector, HDMI_INFOFRAME_TYPE_AUDIO,
+					buffer, len);
+}
+
+static int vc4_hdmi_write_hdr_drm_infoframe(struct drm_connector *connector,
+					    const u8 *buffer, size_t len)
+{
+	return vc4_hdmi_write_infoframe(connector, HDMI_INFOFRAME_TYPE_DRM,
+					buffer, len);
+}
+
+static int vc4_hdmi_write_spd_infoframe(struct drm_connector *connector,
+					const u8 *buffer, size_t len)
+{
+	return vc4_hdmi_write_infoframe(connector, HDMI_INFOFRAME_TYPE_SPD,
+					buffer, len);
+}
+
 #define SCRAMBLING_POLLING_DELAY_MS	1000
 
 static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder)
@@ -1684,8 +1744,26 @@ vc4_hdmi_connector_clock_valid(const struct drm_connector *connector,
 
 static const struct drm_connector_hdmi_funcs vc4_hdmi_hdmi_connector_funcs = {
 	.tmds_char_rate_valid	= vc4_hdmi_connector_clock_valid,
-	.clear_infoframe	= vc4_hdmi_clear_infoframe,
-	.write_infoframe	= vc4_hdmi_write_infoframe,
+	.avi = {
+		.clear_infoframe = vc4_hdmi_clear_avi_infoframe,
+		.write_infoframe = vc4_hdmi_write_avi_infoframe,
+	},
+	.hdmi = {
+		.clear_infoframe = vc4_hdmi_clear_hdmi_infoframe,
+		.write_infoframe = vc4_hdmi_write_hdmi_infoframe,
+	},
+	.audio = {
+		.clear_infoframe = vc4_hdmi_clear_audio_infoframe,
+		.write_infoframe = vc4_hdmi_write_audio_infoframe,
+	},
+	.hdr_drm = {
+		.clear_infoframe = vc4_hdmi_clear_hdr_drm_infoframe,
+		.write_infoframe = vc4_hdmi_write_hdr_drm_infoframe,
+	},
+	.spd = {
+		.clear_infoframe = vc4_hdmi_clear_spd_infoframe,
+		.write_infoframe = vc4_hdmi_write_spd_infoframe,
+	},
 };
 
 #define WIFI_2_4GHz_CH1_MIN_FREQ	2400000000ULL
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 4543833acdec..7eaec37ae1c7 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1222,44 +1222,24 @@ struct drm_connector_cec_funcs {
 };
 
 /**
- * struct drm_connector_hdmi_funcs - drm_hdmi_connector control functions
+ * struct drm_connector_infoframe_funcs - InfoFrame-related functions
  */
-struct drm_connector_hdmi_funcs {
-	/**
-	 * @tmds_char_rate_valid:
-	 *
-	 * This callback is invoked at atomic_check time to figure out
-	 * whether a particular TMDS character rate is supported by the
-	 * driver.
-	 *
-	 * The @tmds_char_rate_valid callback is optional.
-	 *
-	 * Returns:
-	 *
-	 * Either &drm_mode_status.MODE_OK or one of the failure reasons
-	 * in &enum drm_mode_status.
-	 */
-	enum drm_mode_status
-	(*tmds_char_rate_valid)(const struct drm_connector *connector,
-				const struct drm_display_mode *mode,
-				unsigned long long tmds_rate);
-
+struct drm_connector_infoframe_funcs {
 	/**
 	 * @clear_infoframe:
 	 *
 	 * This callback is invoked through
 	 * @drm_atomic_helper_connector_hdmi_update_infoframes during a
 	 * commit to clear the infoframes into the hardware. It will be
-	 * called multiple times, once for every disabled infoframe
-	 * type.
+	 * called once for each frame type to be disabled.
 	 *
-	 * The @clear_infoframe callback is mandatory.
+	 * The @clear_infoframe callback is mandatory for AVI and HDMI-VS
+	 * InfoFrame types.
 	 *
 	 * Returns:
 	 * 0 on success, a negative error code otherwise
 	 */
-	int (*clear_infoframe)(struct drm_connector *connector,
-			       enum hdmi_infoframe_type type);
+	int (*clear_infoframe)(struct drm_connector *connector);
 
 	/**
 	 * @write_infoframe:
@@ -1267,18 +1247,42 @@ struct drm_connector_hdmi_funcs {
 	 * This callback is invoked through
 	 * @drm_atomic_helper_connector_hdmi_update_infoframes during a
 	 * commit to program the infoframes into the hardware. It will
-	 * be called multiple times, once for every updated infoframe
-	 * type.
+	 * be called for every updated infoframe type.
 	 *
-	 * The @write_infoframe callback is mandatory.
+	 * The @write_infoframe callback is mandatory for AVI and HDMI-VS
+	 * InfoFrame types.
 	 *
 	 * Returns:
 	 * 0 on success, a negative error code otherwise
 	 */
 	int (*write_infoframe)(struct drm_connector *connector,
-			       enum hdmi_infoframe_type type,
 			       const u8 *buffer, size_t len);
 
+};
+
+/**
+ * struct drm_connector_hdmi_funcs - drm_hdmi_connector control functions
+ */
+struct drm_connector_hdmi_funcs {
+	/**
+	 * @tmds_char_rate_valid:
+	 *
+	 * This callback is invoked at atomic_check time to figure out
+	 * whether a particular TMDS character rate is supported by the
+	 * driver.
+	 *
+	 * The @tmds_char_rate_valid callback is optional.
+	 *
+	 * Returns:
+	 *
+	 * Either &drm_mode_status.MODE_OK or one of the failure reasons
+	 * in &enum drm_mode_status.
+	 */
+	enum drm_mode_status
+	(*tmds_char_rate_valid)(const struct drm_connector *connector,
+				const struct drm_display_mode *mode,
+				unsigned long long tmds_rate);
+
 	/**
 	 * @read_edid:
 	 *
@@ -1293,6 +1297,47 @@ struct drm_connector_hdmi_funcs {
 	 * Valid EDID on success, NULL in case of failure.
 	 */
 	const struct drm_edid *(*read_edid)(struct drm_connector *connector);
+
+	/**
+	 * @avi:
+	 *
+	 * Set of callbacks for handling the AVI InfoFrame. These callbacks are
+	 * mandatory.
+	 */
+	struct drm_connector_infoframe_funcs avi;
+
+	/**
+	 * @hdmi:
+	 *
+	 * Set of callbacks for handling the HDMI Vendor-Specific InfoFrame.
+	 * These callbacks are mandatory.
+	 */
+	struct drm_connector_infoframe_funcs hdmi;
+
+	/**
+	 * @audio:
+	 *
+	 * Set of callbacks for handling the Audio InfoFrame. These callbacks
+	 * are optional, but they are required for drivers which use
+	 * drm_atomic_helper_connector_hdmi_update_audio_infoframe().
+	 */
+	struct drm_connector_infoframe_funcs audio;
+
+	/**
+	 * @hdr_drm:
+	 *
+	 * Set of callbacks for handling the HDR DRM InfoFrame. These callbacks
+	 * are mandatory if HDR output is to be supported.
+	 */
+	struct drm_connector_infoframe_funcs hdr_drm;
+
+	/**
+	 * @spd:
+	 *
+	 * Set of callbacks for handling the SPD InfoFrame. These callbacks are
+	 * optional.
+	 */
+	struct drm_connector_infoframe_funcs spd;
 };
 
 /**

-- 
2.47.3


