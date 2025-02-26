Return-Path: <linux-arm-msm+bounces-49458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E529A45944
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 10:00:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0008B189725A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 09:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8626E2459CD;
	Wed, 26 Feb 2025 08:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bF6KmQEm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A56238162
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 08:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740560386; cv=none; b=JyxJq5DJn+gm+g9KRmFE5o5WGQiEwlJKIpqYKEBU5Z8zOi0nBhCeD9nteFKqgqTGlRfXQuveZJBoWOfE2u3JuaFybuXVt+cyQjVf4RBOcJkdXnpIYX+9H2gq+RvVb1M5DhO0o5nnaDAKWVtHkAjOW5i1+FrwcNvhmtmIXtKRxcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740560386; c=relaxed/simple;
	bh=spKKvIsUEXwYtFbU2ADRWxlKua9ZC3kOdX8BM/6IO2g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gxZBQbcF09SPkhPuLOwHbVqJwWBiN8MjXtKP63Bme4E1WlOqTEPRoc+xn1zgA6jLhj+a1LW9pAft8OiSa+uScA3nkclfOyz6/94GNJIZUk6VcqnhWkNwNseP1NDSoGAR2ProbFm5L/J/RddJUNwIgdvHCw66g2ykFnTlHkpRXlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bF6KmQEm; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5461dab4bfdso7780072e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 00:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740560383; x=1741165183; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HxAcg2Edh0LLCX/q03x2dqp484sdB8Gfc9kAJ/WMpN4=;
        b=bF6KmQEm6fC8ufMAkCad4UNvibDbEiQgHqcLsIo57g+EV97jpMn+yzyMngi4mao1Tn
         bFo4yioA5IuU8E5e5MR2tNYN7jy62lp4euZurHV5iv/yzB6ItM4JjvWr8oDjwIH0tQ/t
         RwVheWAQphyNPdHSy2usxT50Fo3pr+rH+pLkx2/LERAwsxuZdnPgkPN72qIq3aueQz3t
         ljtSm/wRk9EHPv6tQL7LULaSXKBlLr4o5Wijq0wSixHiX0HoHHMmxppuH4Q7iJjc6gr2
         Eo39L+nwgxk6tE0WfOxIj+Cl7A74CwNs4oraSzc8exg5T9Ndmr/GEZb0YtZh3mihChou
         G9mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740560383; x=1741165183;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HxAcg2Edh0LLCX/q03x2dqp484sdB8Gfc9kAJ/WMpN4=;
        b=QB3xLfUO3Qpi1RMQjOsCmNp4sY0RcKlCtN26pcgOA6mQkTjoy9KrPP/zXEgm2tAved
         0hk5IvPj7ECmm4VHfhE4rqiK/GJWQ1YX7Q3g21e2wEFdHenyd52zV/75X05SeFNzPkrg
         PN88vZFH/VhVOP+SbknZIa6JR2KVd3xv/tafRZvqrL4Un5zN6N69QSpHVc+YgZ3jTXQj
         oD0+oju7uyemL/v4O3xDVyC0xBbENV45HZgAdjNZtOaLsWvjkX4WWDCGvN8MAOI9qI79
         HcZ1Is+rKQyKjd0GcTfN3s1dF/JMeyJjg49eeFf+RQb12lRsaRrY9Cz/5IBtH/QZlqHK
         cFxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDCH7qIB6jQZceZDFHhnjV3pKe0grMgGfeAW4litwzAkHWVjpscI1GmrVbpU/v4wIy339nI8OiOWheAxtu@vger.kernel.org
X-Gm-Message-State: AOJu0Yw32v+36SIrSEpvQSuvjShAPUbqwiug4/1T2LO4HjzzLarOk3CH
	/tEUu2LlLmHlZyRVQ8zR8WcmgFrhItpeZfk52MPLfCM2IPSpyhfKr1wx46pd9yM=
X-Gm-Gg: ASbGncsHcPVDHpum3rzAZK/17hW0pnOgy1kZmxtqRZdGinxrGXzpOuoHuMT/r2vQKIS
	f7y4ZtaNDqNhwxVzlov7UUQDb9fEEbiCDCjELkxFyKThCZvNupVrFT6ge9Ot6UV6qBFEdSuH4nR
	NTGTBKi4TkGR0Fes9kROYgV80EXzfeIKP87JapM1G9krUs2ZKssZv9wLGYC1BC9M7g5oGZ/ZJ8V
	lrjlJ4bZ8XSGpVjOQa6r85Gy3V++RWjl6ECtzv8F3t6X0Ma9rNIf+Dmj7KpxppSVxHJCFX5halT
	ky3qTD3rVAJu4fRM9lSwFRqcqIxGX3Wznw==
X-Google-Smtp-Source: AGHT+IFo+WGQZv/2HHPDxvc16/ldl7ZK79qJBQmkGWyMeSV3pDc9yvGidvBoz4ORQ7EVM5XREMFT6g==
X-Received: by 2002:a05:6512:3b06:b0:545:2e85:c152 with SMTP id 2adb3069b0e04-54838f4c9d8mr11853120e87.34.1740560382489;
        Wed, 26 Feb 2025 00:59:42 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a819e0c49sm4556641fa.10.2025.02.26.00.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 00:59:41 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 26 Feb 2025 10:59:29 +0200
Subject: [PATCH v8 6/7] drm/msm/hdmi: also send the SPD and HDMI Vendor
 Specific InfoFrames
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-bridge-hdmi-connector-v8-6-340af24b35cc@linaro.org>
References: <20250226-bridge-hdmi-connector-v8-0-340af24b35cc@linaro.org>
In-Reply-To: <20250226-bridge-hdmi-connector-v8-0-340af24b35cc@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4777;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=spKKvIsUEXwYtFbU2ADRWxlKua9ZC3kOdX8BM/6IO2g=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnvtftXifKCqVrCyjGdTISkAmAEKpl+UusHqw7J
 liRrBG3F8KJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ77X7QAKCRCLPIo+Aiko
 1YE5CACuM/zNqvGkIJ71dxbuQhP4b4ogbNqVS6jh+xo6Is38O6E90kX3zS3FVweT5SqnmJXy//0
 H0vvA5pf5YVLDM+M4m6bRTLA7XJs1eNrN9/Qw3kPoxKeR80jn8nPvECyVME3UvD47OgUjSI/3zQ
 O3RbWP6zs8/nLA6PoYyc9UvXBaDEl7qkO9Oxvmo/7paHsP2HBcdYaTUF22+x6UqC6njkPEk4oxB
 ngmCOCf16/J92GxV1qxo80XsECIruO037m+iIl6LdeL6vhKygL1AO+68VH4pgsD2hAvNqYQALTY
 uFPXleqUNTS28xjOs7Iu6tvODgjah7n6ZA5i7XX8F+ZNcqm5
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Extend the driver to send SPD and HDMI Vendor Specific InfoFrames.

While the HDMI block has special block to send HVS InfoFrame, use
GENERIC0 block instead. VENSPEC_INFO registers pack frame data in a way
that requires manual repacking in the driver, while GENERIC0 doesn't
have such format requirements. The msm-4.4 kernel uses GENERIC0 to send
HDR InfoFrame which we do not at this point anyway.

Acked-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 93 ++++++++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 15ab0858105328c2f774ec1f79423614bbbaeb41..aee75eee3d4244cd95e44df46d65b8e3e53de735 100644
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


