Return-Path: <linux-arm-msm+bounces-21368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D328D6A76
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 22:09:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7957D1F273CD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 20:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 465EF183988;
	Fri, 31 May 2024 20:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DBN3lU2x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CF21822DD
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 20:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717186061; cv=none; b=afNAYG/pwuG8l5sXuV7Ha8aUXh0o1r1X1pJ7zc8mc6PkEc9qub0Ccl/I4vwnSovcZ/9junzwPjydmKXHcdf84qhwkN11vJb4Om1sTUCvh0GKtRlg5ROLqV9IZLllwWSve2Vy+8+up8hedySBMSrMBx7B+S/TclNW9fqSuwjJ3Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717186061; c=relaxed/simple;
	bh=OmtXhjZ3Qtpb8oKDdME4LcvLFljKS2x7aDOlRaG8IZU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kL4Kre78h1z1u/+bq4CqXID5edS4Md6NxGLYtdWdcARfv0xpMH2jw15jXzaKSXhU4WOJN8qf4YSs5u9Yl/Sb+Vt8QIUTpERr0hfQv7s06J2f8QS/8nonZF0czqMTjg7DnKAkjV0u5GxePTKsNtlgr38Q2ua+AsNfz9J+SO3LP54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DBN3lU2x; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2e95a74d51fso37298161fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 13:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717186057; x=1717790857; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xk2JZtrRtwrwL4+NkRD4qshhppX0yY2US+tv9P72R1s=;
        b=DBN3lU2xzAY9akukVQ6gRcISPxTuTOycnlSGfDI2dvp6WLt8W/fnyKPqAsH0uFAmaQ
         IGkxLgxS55DpdfAOLnffjzxE7u/BPSIev4PYCvnEErtd6kmsprXxKCb7jxi52aFoO5EF
         Bg5KqZVMWv57pAscWjPCRlzeBxEcVsYrr+Onqo5BzsJoHOF5cQx6Tw19Rv8rGepfQSx6
         eCAiwBJ3uFJQimUURRvdAiKsmXcQLlWSe9a75D0dLPnQASoZBRdrNq/981dVnIBOJ/W5
         XyqiH1U5IZgVVvLmb3JDm9YGTpMHQX/kWbBppNA7bnLDcslskQo+1hGsu0SQqJWbrJpv
         ng4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717186057; x=1717790857;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xk2JZtrRtwrwL4+NkRD4qshhppX0yY2US+tv9P72R1s=;
        b=Jf1tDwgjfHZoXMNlScFQQNWN1xVfljSqQ/fA6wwjOOYE5ptKtQUqsfZCePlSGjBCwu
         JIWS1i7vPkT4bOqGdsqFMMkcqjzwqpCuJreXRt3d7JYqE1os4tA5JB0uASdl6G5Kgxza
         s1U3oGCunL620gKp6XcNadpRg2gKj/Wa+fMYTp27V1PGJaw58RpI5OkmLXdIvHua8Udy
         fOJ67b2Z75slb11ZN1In6cT11pi/FkjqS4d8LQ8Y287DD91gQ9AsavJcOXpqYLE6roeR
         eizLKAUkkzfMP27SxR0kV/43kSh2zcA1twxmlGeUC5G8YjvBZATQxqcGNpLuUHPOC468
         yGhg==
X-Forwarded-Encrypted: i=1; AJvYcCUm9EzGUDNiVx0yo/M6S7jwa13d+OsQ4gGXhTwX4dq6GIV1KerLBEWD8zRQfxC2cz/F9QXXeBX+9+uBNFnSmb9C1Bq8iBnvyOXKbpibDA==
X-Gm-Message-State: AOJu0YxiYQ+xl3XfpP9k2pDtRQxv+xR2ny3tdQyiQaEVVqTGzbIWM0PV
	eP9sQbD91v5veKW1wD+z6McFBmf5L8odTy/DsVprL8LC1Upls/BWuAMbdDY2xNA=
X-Google-Smtp-Source: AGHT+IFRD2RAUhETt5GmKj4NUTgPNO1iLEY35FHrVeaC1n8sq/OEOXGOfyA8SqPqfUwlY1OycDWcuQ==
X-Received: by 2002:a05:651c:1059:b0:2e6:be3c:9d4d with SMTP id 38308e7fff4ca-2ea9510e113mr26142781fa.12.1717186057247;
        Fri, 31 May 2024 13:07:37 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ea91cf0b83sm4022111fa.116.2024.05.31.13.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 13:07:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 31 May 2024 23:07:32 +0300
Subject: [PATCH v4 9/9] drm/msm/hdmi: also send the SPD and HDMI Vendor
 Specific InfoFrames
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240531-bridge-hdmi-connector-v4-9-5110f7943622@linaro.org>
References: <20240531-bridge-hdmi-connector-v4-0-5110f7943622@linaro.org>
In-Reply-To: <20240531-bridge-hdmi-connector-v4-0-5110f7943622@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4619;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=OmtXhjZ3Qtpb8oKDdME4LcvLFljKS2x7aDOlRaG8IZU=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1qUHmOs3zv3HzrSh5vv6Puem/94qpnJQncHH45k58lcP
 b/5FyzoZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEOI3Z/7vpsxyRLTr613x2
 u5rT+gslhbZs9UuMrO8JJieIPHY6ED798pnW2JcXZwk8We4XWX327m5/Fu0fBW9utD5wOuAww7L
 Bx4bX94nQgdOSczSXJPkb2vjfu7smniPkbVJ0V8MiJjdGtx3CxSceXNeOz9HaIKmR/KHH90h02l
 njeAl/1pOFl/r6GBv2nxHdEWHA+zhXQfnY+h8H9+sJTlRIs3zhUZhVktHGHKa7bsdPD58q4YNff
 v7L+XJtkl5QXz5PNfPvfY3KM7pY50/N5+t5/iVcK8aa98uPOvELymrPm42UT/xbWSg285bLitWd
 vu+9potFTylyO1b59dZTr3YHzquf5iuXCqRkv9bW19oBAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Extend the driver to send SPD and HDMI Vendor Specific InfoFrames.

While the HDMI block has special block to send HVS InfoFrame, use
GENERIC0 block instead. VENSPEC_INFO registers pack frame data in a way
that requires manual repacking in the driver, while GENERIC0 doesn't
have such format requirements. The msm-4.4 kernel uses GENERIC0 to send
HDR InfoFrame which we do not at this point anyway.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 93 ++++++++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 9258d3100042..ad6258a2017a 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -69,6 +69,8 @@ static void power_off(struct drm_bridge *bridge)
 }
 
 #define AVI_IFRAME_LINE_NUMBER 1
+#define SPD_IFRAME_LINE_NUMBER 1
+#define VENSPEC_IFRAME_LINE_NUMBER 3
 
 static int msm_hdmi_config_avi_infoframe(struct hdmi *hdmi,
 					 const u8 *buffer, size_t len)
@@ -142,6 +144,74 @@ static int msm_hdmi_config_audio_infoframe(struct hdmi *hdmi,
 	return 0;
 }
 
+static int msm_hdmi_config_spd_infoframe(struct hdmi *hdmi,
+					 const u8 *buffer, size_t len)
+{
+	u32 buf[7] = {};
+	u32 val;
+	int i;
+
+	if (len != HDMI_INFOFRAME_SIZE(SPD) || len - 3 > sizeof(buf)) {
+		DRM_DEV_ERROR(&hdmi->pdev->dev,
+			"failed to configure SPD infoframe\n");
+		return -EINVAL;
+	}
+
+	/* checksum gets written together with the body of the frame */
+	hdmi_write(hdmi, REG_HDMI_GENERIC1_HDR,
+		   buffer[0] |
+		   buffer[1] << 8 |
+		   buffer[2] << 16);
+
+	memcpy(buf, &buffer[3], len - 3);
+
+	for (i = 0; i < ARRAY_SIZE(buf); i++)
+		hdmi_write(hdmi, REG_HDMI_GENERIC1(i), buf[i]);
+
+	val = hdmi_read(hdmi, REG_HDMI_GEN_PKT_CTRL);
+	val |= HDMI_GEN_PKT_CTRL_GENERIC1_SEND |
+		 HDMI_GEN_PKT_CTRL_GENERIC1_CONT |
+		 HDMI_GEN_PKT_CTRL_GENERIC1_LINE(SPD_IFRAME_LINE_NUMBER);
+	hdmi_write(hdmi, REG_HDMI_GEN_PKT_CTRL, val);
+
+	return 0;
+}
+
+static int msm_hdmi_config_hdmi_infoframe(struct hdmi *hdmi,
+					  const u8 *buffer, size_t len)
+{
+	u32 buf[7] = {};
+	u32 val;
+	int i;
+
+	if (len < HDMI_INFOFRAME_HEADER_SIZE + HDMI_VENDOR_INFOFRAME_SIZE ||
+	    len - 3 > sizeof(buf)) {
+		DRM_DEV_ERROR(&hdmi->pdev->dev,
+			"failed to configure HDMI infoframe\n");
+		return -EINVAL;
+	}
+
+	/* checksum gets written together with the body of the frame */
+	hdmi_write(hdmi, REG_HDMI_GENERIC0_HDR,
+		   buffer[0] |
+		   buffer[1] << 8 |
+		   buffer[2] << 16);
+
+	memcpy(buf, &buffer[3], len - 3);
+
+	for (i = 0; i < ARRAY_SIZE(buf); i++)
+		hdmi_write(hdmi, REG_HDMI_GENERIC0(i), buf[i]);
+
+	val = hdmi_read(hdmi, REG_HDMI_GEN_PKT_CTRL);
+	val |= HDMI_GEN_PKT_CTRL_GENERIC0_SEND |
+		 HDMI_GEN_PKT_CTRL_GENERIC0_CONT |
+		 HDMI_GEN_PKT_CTRL_GENERIC0_UPDATE |
+		 HDMI_GEN_PKT_CTRL_GENERIC0_LINE(VENSPEC_IFRAME_LINE_NUMBER);
+	hdmi_write(hdmi, REG_HDMI_GEN_PKT_CTRL, val);
+
+	return 0;
+}
+
 static int msm_hdmi_bridge_clear_infoframe(struct drm_bridge *bridge,
 					   enum hdmi_infoframe_type type)
 {
@@ -176,6 +246,25 @@ static int msm_hdmi_bridge_clear_infoframe(struct drm_bridge *bridge,
 
 		break;
 
+	case HDMI_INFOFRAME_TYPE_SPD:
+		val = hdmi_read(hdmi, REG_HDMI_GEN_PKT_CTRL);
+		val &= ~(HDMI_GEN_PKT_CTRL_GENERIC1_SEND |
+			 HDMI_GEN_PKT_CTRL_GENERIC1_CONT |
+			 HDMI_GEN_PKT_CTRL_GENERIC1_LINE__MASK);
+		hdmi_write(hdmi, REG_HDMI_GEN_PKT_CTRL, val);
+
+		break;
+
+	case HDMI_INFOFRAME_TYPE_VENDOR:
+		val = hdmi_read(hdmi, REG_HDMI_GEN_PKT_CTRL);
+		val &= ~(HDMI_GEN_PKT_CTRL_GENERIC0_SEND |
+			 HDMI_GEN_PKT_CTRL_GENERIC0_CONT |
+			 HDMI_GEN_PKT_CTRL_GENERIC0_UPDATE |
+			 HDMI_GEN_PKT_CTRL_GENERIC0_LINE__MASK);
+		hdmi_write(hdmi, REG_HDMI_GEN_PKT_CTRL, val);
+
+		break;
+
 	default:
 		drm_dbg_driver(hdmi_bridge->base.dev, "Unsupported infoframe type %x\n", type);
 	}
@@ -197,6 +286,10 @@ static int msm_hdmi_bridge_write_infoframe(struct drm_bridge *bridge,
 		return msm_hdmi_config_avi_infoframe(hdmi, buffer, len);
 	case HDMI_INFOFRAME_TYPE_AUDIO:
 		return msm_hdmi_config_audio_infoframe(hdmi, buffer, len);
+	case HDMI_INFOFRAME_TYPE_SPD:
+		return msm_hdmi_config_spd_infoframe(hdmi, buffer, len);
+	case HDMI_INFOFRAME_TYPE_VENDOR:
+		return msm_hdmi_config_hdmi_infoframe(hdmi, buffer, len);
 	default:
 		drm_dbg_driver(hdmi_bridge->base.dev, "Unsupported infoframe type %x\n", type);
 		return 0;

-- 
2.39.2


