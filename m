Return-Path: <linux-arm-msm+bounces-16186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3660989632D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 05:44:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF07E282A67
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 03:44:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE3014596F;
	Wed,  3 Apr 2024 03:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M3SiSxXt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D6344361
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Apr 2024 03:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712115843; cv=none; b=eWWTYICdyUydC9blcVXntyIXzDglP2nFbQ/mMve+6vrJFYleh785n1VQ0B6FVCDSek1Zv3v6rYS0x4S4CxaasePjiVoxtLaqfKLQcuPVRFf/4kJecXCJEmzj3xZ4Z3jD7DcGe9VDMvHz3O5vjNpgd1toQdqDsKoRevkyd87/CKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712115843; c=relaxed/simple;
	bh=ir5CM+jVaND4C9bLuSFQauIuwSNRo2ScqG2rMJDBLjA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CoDsOsRv1tAhNvB/vBHgOh1Ipcc57WolYdAxxqfoC6ohPgjv0pqB0Rsgw3iIQighxQ9Mg51dwUpytW2cf6tm9r3+TbT+vfI9ysa77Rn6C7jgBPWh8PMdO1qMCxHxpf4q2dN0WCkfDsoZwXB57HAduk0KZj3O6KAjsw02mugeA74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M3SiSxXt; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-513d4559fb4so7359356e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Apr 2024 20:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712115840; x=1712720640; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+T+p5YoQyUiQemU/jDWxQz+rt6jIm9aQcddIMzbzpGw=;
        b=M3SiSxXtXEYtp4arg7jmcDdaOLhur5POmN6Bu0+10vkjPAPkvAeopUhzVOMI+qIUKs
         EfO+kkC9KxbxWd5DxY69Vz1HIttoT/Gn4uFMgZn/R25EQUYqqBZBJUOBVvdMcIspTIMd
         1BN1LUA/qGoZT2DLHWryA+ti8ZjpLaA4I7wqOZg4cOwhrS2huDVyS0mFMXSG03SnJZTm
         j3dHwdZAozeDB3fyjo4V+pOUuYte+kcFKRbQBc4IjlKnS5pKZ7JmyR0wBiTaiEF5Kpik
         DSUM1d/wHtt+hwSBZEOrat+DnzWZL15HSMdi0lab8A1YoQoAGBMJl1zO0xF8Ugp236Rb
         NsrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712115840; x=1712720640;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+T+p5YoQyUiQemU/jDWxQz+rt6jIm9aQcddIMzbzpGw=;
        b=IwdPCFLgJMUx6YkKj9RMyBJpaDGKcwYTNC4abt+aKrSf7shEUZ7IFswdICNY1Ipwyn
         k3lF3I+4xrHSifuiC2+VaMA0eMLqIjuXaBIWJayQwBalm0rMhkaqaWIjp97Qzp5xaz2E
         5JPR54H9/RmZANjchhUfTuOc960s/ugDzkM0U+EP0c4/Z6e3NmpMVXHa4b9lkyoZMaWK
         hbnV7vDcTSUDtS/nOFo/GMz40YuMT0zP9n/LL61jVn00qEpxZURHI7o0Yf/zKIiy01l5
         bN07TcxQ1McJXnDja6ixeika3Pc90p/ynVA9v2dPUy43I4p/Etu8Yb3gXepecoASjrVG
         0qiw==
X-Forwarded-Encrypted: i=1; AJvYcCV18/dBbQwTjc3/W2okxztdhF34z/ApbRvDoTqgq00sJI7h1frhKNfBTDXxZZ+gycbwxjj8CBrdNPoV+CarS5wY7DOagHcwEVmowJTEjw==
X-Gm-Message-State: AOJu0Yy7cEc1bykbJ1rcmy3y0o9KLyFZUFLN9UFQ4jFMjG0obJo1lZ6N
	bGBaoO+AmYd6BhphRFXWVFvHV3MpE+3omdn5TUzEwktQzrHuwWQmaTyK+MkfK4IfXiXFuyESPy6
	J
X-Google-Smtp-Source: AGHT+IGtfzqNsIWXjR3lBrH+KbvcO7vtmJYhpysBjIhPrbalUcOtjnu38HJTgTjYUhOp5Z7WdpkgMw==
X-Received: by 2002:ac2:58ea:0:b0:513:d5ea:1d21 with SMTP id v10-20020ac258ea000000b00513d5ea1d21mr10812399lfo.69.1712115839856;
        Tue, 02 Apr 2024 20:43:59 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id br31-20020a056512401f00b00516a69b1dcbsm940985lfb.78.2024.04.02.20.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 20:43:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 03 Apr 2024 06:43:57 +0300
Subject: [PATCH v4 3/4] drm/mipi-dsi: add mipi_dsi_compression_mode_ext()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240403-lg-sw43408-panel-v4-3-a386d5d3b0c6@linaro.org>
References: <20240403-lg-sw43408-panel-v4-0-a386d5d3b0c6@linaro.org>
In-Reply-To: <20240403-lg-sw43408-panel-v4-0-a386d5d3b0c6@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3976;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ir5CM+jVaND4C9bLuSFQauIuwSNRo2ScqG2rMJDBLjA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmDNB7OkkeRbzXWIfkMtxvOhujgHNt5OQ+MjsZ3
 1J6uivUGSKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgzQewAKCRCLPIo+Aiko
 1YIKB/wNIG3h5bvt1QfaxHeh9v8mtUutT8ei6fGtabLxfRYmUsTbx1DBS3yrCx0395eAQxG3BA+
 5h2/OBHLE/i+T8x6voeANwrABTo4CsGpnli0xD1AqvqNIelZ2GN7YmNLKNHAmZNYjPgTjdteAb6
 GSZe9YJPlHwh8csbFwlfMJvGzot/d5S4Lwt5b5Glp/1OJiX/nnRGckkzdvH2zsxRel1L2uCxAuL
 kuMuzxie2mpRApvdxtGQooOGpO53SI3JEohjWo0ROAKTsmB6+82mzeFQ3Zo3Ik4MHe8CTDdAxEX
 7g7I8BGc1ERvJQQILmE9zcLy97H8Cq4f6R09AM2EYYYT/p0l
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add the extended version of mipi_dsi_compression_mode(). It provides
a way to specify the algorithm and PPS selector.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 41 ++++++++++++++++++++++++++++++++++-------
 include/drm/drm_mipi_dsi.h     |  9 +++++++++
 2 files changed, 43 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index 9874ff6d4718..795001bb7ff1 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -645,29 +645,56 @@ int mipi_dsi_set_maximum_return_packet_size(struct mipi_dsi_device *dsi,
 EXPORT_SYMBOL(mipi_dsi_set_maximum_return_packet_size);
 
 /**
- * mipi_dsi_compression_mode() - enable/disable DSC on the peripheral
+ * mipi_dsi_compression_mode_ext() - enable/disable DSC on the peripheral
  * @dsi: DSI peripheral device
  * @enable: Whether to enable or disable the DSC
+ * @algo: Selected compression algorithm
+ * @pps_selector: Select PPS from the table of pre-stored or uploaded PPS entries
  *
- * Enable or disable Display Stream Compression on the peripheral using the
- * default Picture Parameter Set and VESA DSC 1.1 algorithm.
+ * Enable or disable Display Stream Compression on the peripheral.
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int mipi_dsi_compression_mode(struct mipi_dsi_device *dsi, bool enable)
+int mipi_dsi_compression_mode_ext(struct mipi_dsi_device *dsi, bool enable,
+				  enum mipi_dsi_compression_algo algo,
+				  unsigned int pps_selector)
 {
-	/* Note: Needs updating for non-default PPS or algorithm */
-	u8 tx[2] = { enable << 0, 0 };
+	u8 tx[2] = { };
 	struct mipi_dsi_msg msg = {
 		.channel = dsi->channel,
 		.type = MIPI_DSI_COMPRESSION_MODE,
 		.tx_len = sizeof(tx),
 		.tx_buf = tx,
 	};
-	int ret = mipi_dsi_device_transfer(dsi, &msg);
+	int ret;
+
+	if (algo > 3 || pps_selector > 3)
+		return -EINVAL;
+
+	tx[0] = (enable << 0) |
+		(algo << 1) |
+		(pps_selector << 4);
+
+	ret = mipi_dsi_device_transfer(dsi, &msg);
 
 	return (ret < 0) ? ret : 0;
 }
+EXPORT_SYMBOL(mipi_dsi_compression_mode_ext);
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
+int mipi_dsi_compression_mode(struct mipi_dsi_device *dsi, bool enable)
+{
+	return mipi_dsi_compression_mode_ext(dsi, enable, MIPI_DSI_COMPRESSION_DSC, 0);
+}
 EXPORT_SYMBOL(mipi_dsi_compression_mode);
 
 /**
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 3011d33eccbd..82b1cc434ea3 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -226,6 +226,12 @@ static inline int mipi_dsi_pixel_format_to_bpp(enum mipi_dsi_pixel_format fmt)
 	return -EINVAL;
 }
 
+enum mipi_dsi_compression_algo {
+	MIPI_DSI_COMPRESSION_DSC = 0,
+	MIPI_DSI_COMPRESSION_VENDOR = 3,
+	/* other two values are reserved, DSI 1.3 */
+};
+
 struct mipi_dsi_device *
 mipi_dsi_device_register_full(struct mipi_dsi_host *host,
 			      const struct mipi_dsi_device_info *info);
@@ -242,6 +248,9 @@ int mipi_dsi_turn_on_peripheral(struct mipi_dsi_device *dsi);
 int mipi_dsi_set_maximum_return_packet_size(struct mipi_dsi_device *dsi,
 					    u16 value);
 int mipi_dsi_compression_mode(struct mipi_dsi_device *dsi, bool enable);
+int mipi_dsi_compression_mode_ext(struct mipi_dsi_device *dsi, bool enable,
+				  enum mipi_dsi_compression_algo algo,
+				  unsigned int pps_selector);
 int mipi_dsi_picture_parameter_set(struct mipi_dsi_device *dsi,
 				   const struct drm_dsc_picture_parameter_set *pps);
 

-- 
2.39.2


