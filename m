Return-Path: <linux-arm-msm+bounces-22076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D3F9004AC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 15:24:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9E7D2B26F50
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 13:24:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4864F197A7A;
	Fri,  7 Jun 2024 13:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cyOR3OF+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECB119596C
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jun 2024 13:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717766596; cv=none; b=tu/DCzVv+RQWRWISIGRmbQ9bCyw/+FCOe7E4AO1h3NMC2ehryknCs/axfJEc7lR4MBCS0gpOpiW9pn82zaZK5Yax2cL92m44zARSWrvJkUPOFPxZhG6mrQkvDqER6fWWraFIxVYMcbtCYYaVtCHDjm3is3OQBlhUe9t09uEq6oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717766596; c=relaxed/simple;
	bh=OmtXhjZ3Qtpb8oKDdME4LcvLFljKS2x7aDOlRaG8IZU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l1/2kE1+T4IePEXEdQtBUlpjn0WGgeGNvI29ayj9xziZiKjTVaAVcnkfhcLx/cPJuN4Z7YZrgFm7XVBVynEU6smWhFphzbV/26cGDMz38ajosBS41FrCnZEmmENY8Ha446Fwe2vMKOeuvN0As4WwJd6l6bu2XBzXLfVaT28ppSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cyOR3OF+; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52b992fd796so2245792e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jun 2024 06:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717766592; x=1718371392; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xk2JZtrRtwrwL4+NkRD4qshhppX0yY2US+tv9P72R1s=;
        b=cyOR3OF+89f+zwLi9VV6yiY92v2F8UzdGNpl5B+K8JvQ+c9YhOw0U1L+kPFYDL9Hi7
         D6O8ByEtqnQBdrLc0tB3gZtjv+kl+RVGIfKX+15dJBYZDJ7nAw/hWT6JOHTGuZhkqDsC
         WC6/J4WwUTR/y6C+bWwOooieVDY91ucq7o2gOHNJvVHzMEwSR/l7tVunWO/Smc0MyCeZ
         9O1SN1fWE1hwUR6dm0jBrdfk4oFmlT6qQciAZWn7vS6Mw7SMyPsKEm48cXipPrko7Fhp
         rxIre9KZNr0hphiH2IoJo9hF9b/xsEa1sjrPLbIRNBeADFWLv+CGqtxf+NhewdWjBFHh
         RPVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717766592; x=1718371392;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xk2JZtrRtwrwL4+NkRD4qshhppX0yY2US+tv9P72R1s=;
        b=He9emfLKzxm0/vghGu9eI7gq+95m9mKI7DZl3QvTxvHIJEoZtAWGkyJsjeaPvpJBwx
         x37Zn5BjBEjoJt/fQxJF1CHzxxXSOaRJImXHcNK6z+5YEepxEvHCGCiVTeoK2kc2EZ3c
         MiYiwlywn3HRjGIe58WuHO9Ja6mCpBUzG1v55bTcS4prNVn7BhWc8BFCeW42p2BK8rtn
         QoiK4D/VWNFJDlM1clUnPv0LzPDGqLS19t9syau++6ovojJ8D7WTJNAUCo4IKDvVYZXI
         f1iDB1j+MPh11HuF3p6pPqeCc3XZSbUhZX4thg1wBsLh9ReeUr6weKC/rvi1ECeMmERg
         68MQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgnKwCgJhHHDd/Qwq00O5BsMIeJ9hwmamdlzirQS5oW7/HRNmJpg8EhWCoCVx5xGuijs8YS/g+4B45fygKBlGWPSxgrPCsFrXpne7TLQ==
X-Gm-Message-State: AOJu0YyoofT1LM60ObgOMDCHI8LlxMEiltfaw9Y+uVkAdDgOGnnqekoD
	C5kUgZSSWcpSJ2cFt5rwpDodvo1jl1ENvT3fqw8xmE0qZlX3lRInppfEGrlkOR0=
X-Google-Smtp-Source: AGHT+IEtVSc28/MM7GrtUCOZP0ECjv9PS5r8QH3dphese9FTqeAHNA05vy8pF9hv1GQpjHfasTAzRQ==
X-Received: by 2002:a05:6512:2109:b0:529:b712:e6d5 with SMTP id 2adb3069b0e04-52bb9f805d9mr1439643e87.31.1717766592471;
        Fri, 07 Jun 2024 06:23:12 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52bc27640easm80944e87.104.2024.06.07.06.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 06:23:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 07 Jun 2024 16:23:06 +0300
Subject: [PATCH v5 9/9] drm/msm/hdmi: also send the SPD and HDMI Vendor
 Specific InfoFrames
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240607-bridge-hdmi-connector-v5-9-ab384e6021af@linaro.org>
References: <20240607-bridge-hdmi-connector-v5-0-ab384e6021af@linaro.org>
In-Reply-To: <20240607-bridge-hdmi-connector-v5-0-ab384e6021af@linaro.org>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmYwm3Vv0fiW83ykL6I4HH01Ryv7CLLl50kocSo
 jWFjuZQyqiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZmMJtwAKCRCLPIo+Aiko
 1XLsB/9eGSmRclfirO4LoI0+ATKayXjmJcJIO5Gn3p36eE3zrzi0SB5aNCO4stXsOEtA3RqZpC6
 5bPGbabD3hiuR2tdCGgRAIXXG80uey+UFdmoLhvfQEM3aC8js7VGKuBIdwzr1pr2TjkgrDxDbVo
 19ZkVX9C9BON4Iscb7HeE9SPqiVE0q2Iy7bB7Q49YqsueQqTkUarstlbPvXu1vRvZBOCgLNPrjp
 hRcSRfYYrj8CGgURiGsZ5BG6qpBTuxkIdMSbaIX1IkyaQMb+PqrUYauz9r97+klYM65QPCIJSjY
 0tYraAr7rvIQ5uhsTszRdNLEQcxz0b1uxXjAOKwdzhFdsA1a
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


