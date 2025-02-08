Return-Path: <linux-arm-msm+bounces-47216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4B6A2D216
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2025 01:28:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C565188DFEF
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2025 00:28:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 204B517B425;
	Sat,  8 Feb 2025 00:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PisdMapP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172C315573A
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Feb 2025 00:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738974444; cv=none; b=ECvP4Gcx0GDCiN+XMdjerRZK1IR41e0dcQKtDA8SHt7EWH4hMboS1uojyA1K8nsXi/CiYEsxzncRAuJ44ZCJjfUhl187HsSZnivw4OxgFfCm9NscIHcrhBShj9dILJ9hutGNLXoTm3k20FQxDvTfXGjKwcKS2Tub9u7/qnkgoGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738974444; c=relaxed/simple;
	bh=Om0VPcrJz02GgKUkGPykuB6u1V2jcE89dUYcHqLMg5g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TxxxaYtgiE5b2ZzG25Ua+6tdStNw5fePC+tMAXXkArtqwv2kXzaOyJvRe2oRKR2KryHTGEJp5Q/5Gbtgq6difyYBZ2G9LiRt1slZJvM9k66DDrifmgeikNVajyyIeat3aYwtzBZH8YfE/9p2xLKxEy7mNZiPFJSKFzkTxU3LYhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PisdMapP; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54412a7d75cso2176779e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Feb 2025 16:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738974440; x=1739579240; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KHzOS4TLAPS/mgdU6Qm1z6QSFXluYdf3CnBXTUtLg4E=;
        b=PisdMapPGQHFnaqG7nkkbhQD2ApmO1GcoLw7ksV8xyUa5uHTTZykknuwoeWQY1CpK0
         mmmGMMEeaA5ISALqSSM3mgt/kiVZwrvM/uu8djIF+APNu0lePxYO0FYaaL4E43JXRolb
         z6/fQnPgArfogK/wDxjG5Js/HwyZApowwyfX8pPhfS+edfOioF1oLbynShH3u4JysKJ1
         2i+P05/ZK7M/BpTdxpGZ4LDuNxo3QblhPMMVkbfxsO5TeqnvTx9jViZ/IZM1FACnxnG1
         x/ErgWLBgY4X6CZbd2MmfMlX9+JNRwvGkXX+ofe86xlhxt3bkBlXVeoARxddN7VpgewR
         t1EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738974440; x=1739579240;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KHzOS4TLAPS/mgdU6Qm1z6QSFXluYdf3CnBXTUtLg4E=;
        b=ccon+y+yGpwWL57OapBrgPa+vicQQCdQRU+oJxO38SKx7nsDvjXY2zT0qcwSDjfPOv
         k0ywubLcIe+xvuKcoPp+oqK8Nm/IPZypny4eAlJGXqlG+tSxZkz73MeQvk/SoVJ4q2T/
         7uh1SsRJH0y9smSNzfXsF583aK1mGOFC+K3/BxJv/huRP99WbyZBt2n8V9JhIFXDni8n
         KzACBEueXpwUTTFfO4icZp099xoy1SU93T46+4hhnhZCCzCz9tkgemkorTBgKt2KPEqE
         HHkY3bES/lBqeeRiG/Oi70RnRuFWT65v8r8z7lgpwv7G4qzcUfsicFZoS4i3sgRWc8hl
         eBCw==
X-Forwarded-Encrypted: i=1; AJvYcCXYInVS3hNO0Sb1ZvhHzLxUbfiaNWw0TZgrd+jIiLSxJBw2IcaVS2cUCehId8xNqwISqsgv168mki2Krtbd@vger.kernel.org
X-Gm-Message-State: AOJu0YwAcg85bnwGME67dtf7MMsDzcSZoyAXIz/TBA2OKF/c1r7lHqQH
	Qx69QiRSnfx9p9q8zfXwiUZm/4nqfShjNbDMVFaC7D64XWZMeBvJtCKeY+JqI2Y=
X-Gm-Gg: ASbGncv+azB4sVHawSpsn0NaxzIatOW/R924VmRUQugnz38fp5WHhiKwpdWvCu/AuGu
	SC+xpvxLoMAJzL0R2vaQry38RtV2AO2mC5bYyyOEOYWxzIdFrRgyCuO9mZgu2qiN5LX8P0S7Z5l
	S8w9yureQSuKdNLCoqiwutXQ9PuPfsY0LxhwHEgW+cQep9LKQEJtX8rSgIWSCvU1Mj8RUMcopNj
	hQNYL01IulLocJMtporhIaX+LA4HFOXEEnsRRL9YmINcSzE0o5JTnqqzrU7rfdW9N3Mum4SIulB
	sZser5ziMYPHGoyLD9Eu5uM=
X-Google-Smtp-Source: AGHT+IFIeDkDLh9w9kCCyBn5gWkAOachdP8D4zs4RWXylREPTH1q7NhFFOk0yfvOnxK0+BZk579XNQ==
X-Received: by 2002:a05:6512:3e07:b0:540:1d6c:f1bf with SMTP id 2adb3069b0e04-54414a962a3mr1533574e87.11.1738974440067;
        Fri, 07 Feb 2025 16:27:20 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5441060413asm588785e87.222.2025.02.07.16.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 16:27:18 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 08 Feb 2025 02:27:05 +0200
Subject: [PATCH v7 6/7] drm/msm/hdmi: also send the SPD and HDMI Vendor
 Specific InfoFrames
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250208-bridge-hdmi-connector-v7-6-0c3837f00258@linaro.org>
References: <20250208-bridge-hdmi-connector-v7-0-0c3837f00258@linaro.org>
In-Reply-To: <20250208-bridge-hdmi-connector-v7-0-0c3837f00258@linaro.org>
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
 bh=Om0VPcrJz02GgKUkGPykuB6u1V2jcE89dUYcHqLMg5g=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnpqTWh+tDswzSq9QN8ptgxcIWoZ/XmGiUhi/p7
 VQJ+4JQjvaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6ak1gAKCRCLPIo+Aiko
 1S+lCAChx1v8ysUrAI5FSlYCPnvFguvdnEb8/8FSxcPaMEb1X9gbx7SQqNW7RbNpgRpLwNBVH+N
 LAZDvJMe58Ma4ZX8urtf+LElOaZ/LzfKv8s9Bcb++xr4QYJDNuy2ndtBlBRRvTChhj9V5aZhP+9
 YGiBBXlWXpyAMyAKq1J5gk4L/CGuXKWA966vI1Vz561kLaoo36g7WZU7TH084iQoP1UKFJ5eLOM
 JCPYWtwR+Mu1tH0TE1uJ4Mqimv5tYxn0mbC8RwyKu9yJuv+t8Sy+YHoBH9z6T588X3c6cbJlSOS
 479F8RS68YFZ7hV/mvp+dq2xMOvRSVWOiwlizdEjOjwGckNU
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


