Return-Path: <linux-arm-msm+bounces-46114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C98FFA1BE14
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 22:48:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14C743AEFFE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 21:48:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 595321F2366;
	Fri, 24 Jan 2025 21:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JxSgnn0+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CB11EEA50
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 21:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737755281; cv=none; b=oR/t+Ya39d1YVezWVYFnbo2GXpzj970IiOBcXVrLb9Dc/QgB+sYEl/zwP4xaFlZJqqJipjezNWzT2P8ZZxApR5u0KjM22yVnwkueiAdII7Ij9JusGDUEIXZO0hpIf3l0b4odzz3Hj9YNfZq4nAgTyqNloN45p2ZsWsRyAO0K8PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737755281; c=relaxed/simple;
	bh=ypMfUVcMuV2bxzV5D0UKlQ7W+VdrRVJ3N05XywV7S44=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WzuEUvmYKG810dmckiIIUcI6eZeZ3/Oc7MqQmzY4Vaguv4xb9nEAvbc0TAkEl7LSKfMbjsMkPgTfoRJlA+cq/Fe8RSKfgoS02+GtwLcPFyaCKNEjvDXi0bTFe++jnTmazTOzMfq+ToWnamH3EpmDjHi7FdJjZSgrEF+B6TEHqOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JxSgnn0+; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30737db1ab1so23384151fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 13:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737755277; x=1738360077; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iuIjI45U/dcDaX1yFgwDNBXncmV9p95867dXyO4Ck/I=;
        b=JxSgnn0+fqgWrlQ1nRIE6qhBySkdOwWrdrxUi81gNPBEwmsHQF+gfDkVxYZFmwP7iw
         /aoeO2+LW+pkYPUalVy25Sfpq4emFEmIfySKaJHfOv34x6X6gu1N458/gCgmj2gB/L/n
         B1eDLzll800IYHgDItsMG8QzQ7D4gyTVDtgpu9UNBdpHTcY9Fe5QNUM10Mpxq4eavhdG
         MIx1XfjatRiKGw7FiXOTYSaHuPb/zxUphCYZCdxLKb/wTLwBGvgVxPPWInnJZdq790dh
         E5xGa42TjZdSm+fE9EH+ihGnB9OqTgxJ/gRkFnAEepdjkX7/gU1fwHMZ2BaQFZMpV569
         LCWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737755277; x=1738360077;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iuIjI45U/dcDaX1yFgwDNBXncmV9p95867dXyO4Ck/I=;
        b=YpDiqpAt//ak691R+P1FeiUqlBWKDWKK+W4EvU/hD0EBdgExD6LBimeL1Or07SF1ZR
         eC8e2e3PUVKnq7Ox1rukN6b44+mTcTy/T0t/okxaTOQqrfy4aFCSfMqqJyEbZOLDamg3
         YZ628wj81Rs3Y5yNPngz7Big99Ls5mY06+PqBcxZhq3fz5cmP+7Ax4Sxa90/YP5GKSVw
         fZwNzaxFACoX+VUWKUqFDmIYM+AhnuSzDZ/j66A9TbcGbox4h+gcsAKO61FXsIcD4u4X
         iJ2x7NMz6GHe4nVcf6TYoQeNaYEKv6Ppg7/HUd4YSiHYGlZsdHgzh6RxVxYCynp6fUkP
         lGSA==
X-Forwarded-Encrypted: i=1; AJvYcCVQ3cCXJs+6/qVZ/lQ2F4rdHuaxsr/my+naW1UUl12+mDa3p3LA5FhOOURp5uHjkuq1sFs8/x4ClxferGOJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzO0hI3/slFvs3vGqciDamQyU7kt1e+MNshnAiu9icaUZkOkNlQ
	dTXX5WDhaY51NYHN60WRdBQWSiOIBNN/lhbcQ2TbPwF70H6Cxruw43dtoYlC5Z0=
X-Gm-Gg: ASbGncuNjyw7Yg3F2PCCZJyNKmzM+pVPggUa71Sa1wcpcZ19rxnexZ7vQ7mreZtqGyF
	q8CKjY959D9vrI3F9gHju59B2JIGae1vyF7CvpdGPK1BDbzhMlBTbLnuWFzE87RYlZJySSuL+5W
	IEhfflZqd4ShUnu1ALMuW/QqscY64M5ZDJ5jLxh99dkBNt6ms71G70m25sF/0HHxXtLDEdayBwm
	uhx0qwsYXgngFhJgJDgah1JykLvecm+I/agpEGfUhim/DtghVJpGTEuWd1iK58bZiOSPatCS4hq
	KUF9oEwNVyd7DrJEQZZEfKI=
X-Google-Smtp-Source: AGHT+IH2PCxvWSi1I49WChIFLkDY5kjEE00ne3Y+IYzLaQPymzEuXvp0HTsrYDjW9kcThlu1z9dCDg==
X-Received: by 2002:a05:6512:2346:b0:53e:23ec:b2e7 with SMTP id 2adb3069b0e04-5439c2805f9mr12813973e87.34.1737755277237;
        Fri, 24 Jan 2025 13:47:57 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c8237491sm425014e87.104.2025.01.24.13.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 13:47:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 24 Jan 2025 23:47:46 +0200
Subject: [PATCH v6 6/7] drm/msm/hdmi: also send the SPD and HDMI Vendor
 Specific InfoFrames
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250124-bridge-hdmi-connector-v6-6-1592632327f7@linaro.org>
References: <20250124-bridge-hdmi-connector-v6-0-1592632327f7@linaro.org>
In-Reply-To: <20250124-bridge-hdmi-connector-v6-0-1592632327f7@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4721;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ypMfUVcMuV2bxzV5D0UKlQ7W+VdrRVJ3N05XywV7S44=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnlAqA0lig50t0scgDkH3CmByQC7DMPRWpV5iNn
 czXL6JL372JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ5QKgAAKCRCLPIo+Aiko
 1Um7CACk7HhG0jg5KrovBcPX1eeON3Y3nXPBU5xQ8yf/WfdB/qcyiFqj/9VGY7Y+kT7MZDRCyds
 xsBCgvI1q888B61e/8U9C0S2fwFHGqTnnVxqP9Kl4XCtzxOCiXpe8x1SfQd+olVZK5Yrn6FtbUN
 JEhIWS03k1LGKpZ8gI/hgTXyMvyfBKJbg3kFCYqdAAMaQ8pQDe3PxOdtztSo5H0giL3IuFpKhj5
 +EL5qnxutchW8fFGTbhgvbEWWowZJWKPWE2IITtOyH+mopsza0+xecr9N82q6A6z8azHT9fjiuw
 VnyYuRdr0dnmsYtwaWVKnyztEP1Azo3McbYuYYvSEEE0hCNb
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Extend the driver to send SPD and HDMI Vendor Specific InfoFrames.

While the HDMI block has special block to send HVS InfoFrame, use
GENERIC0 block instead. VENSPEC_INFO registers pack frame data in a way
that requires manual repacking in the driver, while GENERIC0 doesn't
have such format requirements. The msm-4.4 kernel uses GENERIC0 to send
HDR InfoFrame which we do not at this point anyway.

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 93 ++++++++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index d2b25bcd8eb8f5cf4623e11c87ac5eea6e4b363d..c31e1d33593de6480c0c2b7cb322a85e645ff332 100644
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
2.39.5


