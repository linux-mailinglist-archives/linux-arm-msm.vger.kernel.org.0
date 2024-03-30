Return-Path: <linux-arm-msm+bounces-15805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E47E89292D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Mar 2024 05:00:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98A641F21FA6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Mar 2024 04:00:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 964FBBA26;
	Sat, 30 Mar 2024 03:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wbXSA4pc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4D0847B
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Mar 2024 03:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711771176; cv=none; b=CVYaUm+EVAM/YJJx2oTnLJ1nLCQQSPxFZRCzHnaXgmBxpyw6Ahl4vF+TijMJOnuPBoKZGRuUjmRn0tYHCzB47oaNeXk2Q+yUlnm4193EgrVYiR1LJN+1nma6mi/8HJQZSabiH6UQPibVwO7Vm5NtPThHspR8xRSwMqFp43HRAYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711771176; c=relaxed/simple;
	bh=1dHUwNPq/ZE2lZqujLo0paqKG5T8bLmbO34BUbpj00o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A730ZKA5ZG3Jf99TX35MUF+3/aqmI3dlKtDg0PQPUQO9gIRR/BdOG2pH/RE6TnrAQIshCxMo9sGny0wE3G0q1kfJ6ruzLaheCAbXHruT7n0bMOx0zQtB7D67dc7cttWHWtqYIRknsKSYGK8Iw0SqIGezggxawqKk0blT/BvViMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wbXSA4pc; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-515c198e835so2760642e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Mar 2024 20:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711771172; x=1712375972; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gXi248XgYEI1aNqzH18MSPcwgnE2Ghs0byyxqmpezB8=;
        b=wbXSA4pceBAT+JanKxYoSV0QT1ODm2PVY6mSOjfJUVpirr789WP7mcSeYGWKudR2lK
         C+Wpw9eUVt3jAV2xuZ3zB98ee5A/ORFEt1GNsmH/PwrrVhwWE5uEe1xDODrGuH2JgXEg
         YwmaJjKkdzmgTNGDl3bQrcXVVL1SwDaIQyWEAq5TDPO/DhRXi0hWX5x3GxZyg7CnAPVM
         P3nQbJBBD+TTzC9FY8ijqNU8f+61Yy/LVVP5W30TvGSQtwGMf8LrmnM0OjaH8tXPk+jO
         2A9859m9YcfDMLfrs+pZHmsZPFF1EVoGpsAQ0ng35H+yzvKt+wF5QbRAJjH4+y/KRsc4
         Wgvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711771172; x=1712375972;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gXi248XgYEI1aNqzH18MSPcwgnE2Ghs0byyxqmpezB8=;
        b=Hx7cHX6Cn8L7+iTql8XCh/B4UEV/dco4dGCiaj61dP8oTkmop5QMN2JERJFlfb0R6x
         y6ZaOMRFl85dboaUx1svJvjwNqh4E3RMaM8YP1aGbJ8B2yd/Rk6jnD6kXvHE4LqbAyQm
         xuGyD0+3kabpptnJ3KsjRdrHnhLt3fd3J5YN125JFqM0F8y0JIycMwfplnfdbMgwXVh4
         JpcFk8UAOrnSotTkgxc6fh8Fp731ssQ0v3J/0syzyzEJLEnx8wDx3FjSAZcO1RzEFdWr
         WhFdnZjC+iCn84ehew3f+bNP9gCa/0j/1i6HEF3/HE4Gq8MQCklz8ftjCUYXhj+EAIyr
         1XCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUc6Hw8TkGnGzUUJK8cCtLFSwYvmM2MMgb4iyi3VM+Za/eZMJmENBnXGpa2xjOg/tG1ifklRFggb7r+Z0W8y3IlOuXRSlakAr4EB7dIpw==
X-Gm-Message-State: AOJu0YxKV2/sC+ac9Vqb1uiqp9lcxtB30MOJTt2EFD2vcCbectZw7Xas
	GTggYam/Dcy6Db0cLrpdx6aMNr4Ir3HykPav1bWYPo15/YB+sXk9/9uc5djJJilCmcwk1FMppMR
	G
X-Google-Smtp-Source: AGHT+IExcqjcMc4gAFYkWcvF9qS8XkNUfR5sfZy2OcV9JbTxQHLoeNf+8x0CjweH/JN0g99cIN+OxA==
X-Received: by 2002:a05:6512:48d:b0:513:cb0a:9632 with SMTP id v13-20020a056512048d00b00513cb0a9632mr2244206lfq.50.1711771171680;
        Fri, 29 Mar 2024 20:59:31 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id br2-20020a056512400200b00515d1393f3csm423957lfb.104.2024.03.29.20.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 20:59:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 30 Mar 2024 05:59:29 +0200
Subject: [PATCH 2/3] drm/mipi-dsi: add mipi_dsi_compression_mode_raw()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240330-lg-sw43408-panel-v1-2-f5580fc9f2da@linaro.org>
References: <20240330-lg-sw43408-panel-v1-0-f5580fc9f2da@linaro.org>
In-Reply-To: <20240330-lg-sw43408-panel-v1-0-f5580fc9f2da@linaro.org>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Caleb Connolly <caleb.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3402;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=1dHUwNPq/ZE2lZqujLo0paqKG5T8bLmbO34BUbpj00o=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQxp7n2LDer59c2eE62z6cLjhcvt1pn18ebOVrm3jbOacZ
 XOrNXp6J6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAm8oeJ/a9MuG3iCbHu+3Y/
 ivvue7oeWlJ+I/HySrsnf+J/5AcJvXoqIOivkp8c9urdu3iRhXyT/P4uO82181qg+b32U591bby
 N1dZJcProb4/sUuk2Td1+RCC9Ymt/G1PW6yxNdzGLkEOyTNFX1JXnVPpfjzu/uF3xtmvKpYdXis
 ybTuUWZy9Sr0uvnV7z8li88pZdcxLfOTmXLpfRfNjTM1N18bmazvhn10xCXTwm6QbP9+yavOn03
 ObZutxeF46d9eXUvapwZAOH4cKulZpWQmmmoaoWv8J4c2Yc99+7+uGrtv47sfzSdf3bzc5HHLlW
 evmzq6zyvcgQVrOIwD2XIs0bllVu2Zt391DC1/KVE+WNAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The LG SW43408 panel requires sending non-standard data as a part of the
MIPI_DSI_COMPRESSION_MODE packet. Rather than hacking existing
mipi_dsi_compression_mode() add mipi_dsi_compression_mode_raw(), which
accepts raw data buffer and length.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 34 ++++++++++++++++++++++++++--------
 include/drm/drm_mipi_dsi.h     |  1 +
 2 files changed, 27 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index ef6e416522f8..f340d1e0a9a5 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -645,29 +645,47 @@ int mipi_dsi_set_maximum_return_packet_size(struct mipi_dsi_device *dsi,
 EXPORT_SYMBOL(mipi_dsi_set_maximum_return_packet_size);
 
 /**
- * mipi_dsi_compression_mode() - enable/disable DSC on the peripheral
+ * mipi_dsi_compression_mode_raw() - control DSC on the peripheral
  * @dsi: DSI peripheral device
- * @enable: Whether to enable or disable the DSC
+ * @data: data to be sent to the device
+ * @len: size of the data buffer
  *
- * Enable or disable Display Stream Compression on the peripheral using the
+ * Control the Display Stream Compression on the peripheral using the
  * default Picture Parameter Set and VESA DSC 1.1 algorithm.
  *
  * Return: 0 on success or a negative error code on failure.
  */
-ssize_t mipi_dsi_compression_mode(struct mipi_dsi_device *dsi, bool enable)
+ssize_t mipi_dsi_compression_mode_raw(struct mipi_dsi_device *dsi, void *data, size_t len)
 {
-	/* Note: Needs updating for non-default PPS or algorithm */
-	u8 tx[2] = { enable << 0, 0 };
 	struct mipi_dsi_msg msg = {
 		.channel = dsi->channel,
 		.type = MIPI_DSI_COMPRESSION_MODE,
-		.tx_len = sizeof(tx),
-		.tx_buf = tx,
+		.tx_len = len,
+		.tx_buf = data,
 	};
 	int ret = mipi_dsi_device_transfer(dsi, &msg);
 
 	return (ret < 0) ? ret : 0;
 }
+EXPORT_SYMBOL(mipi_dsi_compression_mode_raw);
+
+/**
+ * mipi_dsi_compression_mode() - enable/disable DSC on the peripheral
+ * @dsi: DSI peripheral device
+ * @enable: Whether to enable or disable the DSC
+ *
+ * Enable or disable Display Stream Compression on the peripheral using the
+ * default Picture Parameter Set and VESA DSC 1.1 algorithm.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+ssize_t mipi_dsi_compression_mode(struct mipi_dsi_device *dsi, bool enable)
+{
+	/* Note: Needs updating for non-default PPS or algorithm */
+	u8 tx[2] = { enable << 0, 0 };
+
+	return mipi_dsi_compression_mode_raw(dsi, tx, sizeof(tx));
+}
 EXPORT_SYMBOL(mipi_dsi_compression_mode);
 
 /**
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index c0aec0d4d664..321d2b019687 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -242,6 +242,7 @@ int mipi_dsi_turn_on_peripheral(struct mipi_dsi_device *dsi);
 int mipi_dsi_set_maximum_return_packet_size(struct mipi_dsi_device *dsi,
 					    u16 value);
 ssize_t mipi_dsi_compression_mode(struct mipi_dsi_device *dsi, bool enable);
+ssize_t mipi_dsi_compression_mode_raw(struct mipi_dsi_device *dsi, void *data, size_t len);
 ssize_t mipi_dsi_picture_parameter_set(struct mipi_dsi_device *dsi,
 				       const struct drm_dsc_picture_parameter_set *pps);
 

-- 
2.39.2


