Return-Path: <linux-arm-msm+bounces-40376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3EE9E46C0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 22:35:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA2DB163C6C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 21:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 608D9192B88;
	Wed,  4 Dec 2024 21:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cV9y66yL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC5E18FC9F;
	Wed,  4 Dec 2024 21:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733348111; cv=none; b=jEGBWsA9uW2zoYRo047vDY+PqleW5FCZRnhpuDLSEeE0iUfOA5ojb+GfB9eLQLgQhc5NzI0kCNkqRo/7/mRNbMq0rm87g09l/XA9yK3dxW20Vdr5Y48AenhrfxlHsVrIS5JjfeWaGPB3hst3Y4fDHDQhIouKBpknIslEP4XyEEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733348111; c=relaxed/simple;
	bh=02z0LV2dQuUQp+TnhrC9XL4LwOyBHz6IzTcdaN+LWyU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mBBF/KUHIwXkDO1c0gLHSxRYO+ihjvoqnK97URMFYVAXOnEzaMFbVVzZsWBRNOAWhwm7tsj/k0xPXZfF96GR5TP1lIudq7X3AE33qvw8HC4oKOzGyQj4dlBzJ89AEttBCAy10VKCmVzkoV4FPyfrPcgHpZi/SdypNwnEwn9HUII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cV9y66yL; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53de556ecdaso311241e87.1;
        Wed, 04 Dec 2024 13:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733348107; x=1733952907; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Fb76RS5ZLHLloxCRTmC8GhW3Ha398bRNcaTT2D2OEo=;
        b=cV9y66yLJ6DHt96B7tI9vpeEdafCNbx4m4pBmjYVfpufE5oNRNopG161NgxsIB0H+Q
         mGIqe6zZ3M4R/jZOcs78j6ZBH+PuVxyz1oEkj8T7xvAEohP0e2quqpwC5mTksNYUjlYo
         1riBVCIQEIhLagRZoFU9wnIpENX1anxgDdyhmlZHGlRj3LBAObxp4TEvXPsnNgLnCBPK
         7hqQ4W52uoV1NlwbsRlWf3i+4UYEF0CnbkY1hc/KdqwzJ3pYSRKB+8TonJYiJpd58U/H
         gRenr22N+encufe1lU3GkGp6s+eZKq6xuwVRyhN43SfZuI9HqUdPDpP6y2QYhhG8kTnr
         gQIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733348107; x=1733952907;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Fb76RS5ZLHLloxCRTmC8GhW3Ha398bRNcaTT2D2OEo=;
        b=MuSezyovQz13FD2mOEdy6Q33iZHmBeJqO3B5YYqHL8aECAhpTxaZTl9cjS+AdKtvMH
         m9wW76zu0Ma+yRq/4kLuzSGbK8tuX/BKjaFifq92DtzF2qGyP4TMZ5ziKASkBpTKttuA
         QcUpyM+sTHnpZQ5d/LahW24Dty4DoFgAjcuoMg63Q45JHMVHegsycOnT7bhkiZ4/sPPX
         g1WoRRRpHHLXoy/KtZkZRbqkUrpeEm1zLaPJxc7cvYytun4j2stk5DuMQf7ZrZaAnHiz
         46Itg6Wq0pm7TAMViKlNWe8gVxhQ3HUpgx2gqJF8YYHYkgOa7n6X5Et9AjAxpqeJmerq
         pVbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIIJ6vXPumszAQaAtPYJdHVs5l4uk9FALtD835EC8AF/xQZy8YgSXZXgz/ICQ/j5baGLvMSIGfPHwA@vger.kernel.org, AJvYcCV1Q8GGczS40MnwGh6uRIgTt+zene+7fua3r/xpsIMgwpcJw03abqm4cCPG4Yh+VlS2CyTbtrwVamNyR2Q=@vger.kernel.org, AJvYcCVVfGC8yfAGlvO++PX0f2lIcWMafykv8fIIh0TevRsB8Sqj2nwbbUSPgNxRAdCHr5rHI+uTvj3lSyuvutCW@vger.kernel.org
X-Gm-Message-State: AOJu0YwdtvDGyjM/I3NtFeCBgMOL9Qd+pDUMvpzj86S3kUXDmAy2oH43
	tWVDlq9MBO9Uhdwbd6yhBcQNwa+7xzFw9t3dYHv/SSMB+DCzVNI4BI0KIw==
X-Gm-Gg: ASbGncumdZ1b1RqPj92NVvmG2qP07ovhzCmZ7l3CqiCJBppfk+aznbiIqcCAsL8e74M
	GpBRA/vFhwi7+/j8aLyDwyTyo1m7fy5vXRph44W8itVM3xgt4sREKucleVm/6xvM6VZZd8LObae
	pSjH+X5CYdM6XtlmiSOaqh5iqtZ2L4X8eFcU96IyVyaRVxT75bp/hpZ76pvX11LDMHxN+Te17Pc
	TxBCLRvstkLK5Io35osgM614i4C9xEvv9bpT5n9EqHJlnJ5
X-Google-Smtp-Source: AGHT+IGOIfMXCNfEiVIihLL7kC7uMDCNR3FrLKu0MbCTB68XrLCygugc076Fd7eMylbYxoJAQ15F0A==
X-Received: by 2002:a05:6512:b8e:b0:53d:d3ec:de8c with SMTP id 2adb3069b0e04-53e129fdf0fmr5441906e87.18.1733348106970;
        Wed, 04 Dec 2024 13:35:06 -0800 (PST)
Received: from [127.0.1.1] ([46.53.242.72])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aa62601b5ddsm4506966b.118.2024.12.04.13.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 13:35:06 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Thu, 05 Dec 2024 00:34:48 +0300
Subject: [PATCH v7 01/14] ASoC: dt-bindings: Add bindings for WCD934x DAIs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-starqltechn_integration_upstream-v7-1-84f9a3547803@gmail.com>
References: <20241205-starqltechn_integration_upstream-v7-0-84f9a3547803@gmail.com>
In-Reply-To: <20241205-starqltechn_integration_upstream-v7-0-84f9a3547803@gmail.com>
To: cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733348104; l=1583;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=02z0LV2dQuUQp+TnhrC9XL4LwOyBHz6IzTcdaN+LWyU=;
 b=D3aUYxHPZJ9GD8wGiu9IaHLRA4akwwzfpdynGQ77aC8mqNhXBwP9AOg4E35RCteoeUTqxnrwy
 gHA7MJkS0PlDVLnbJinLqTKQKRq6UsH0Jp/S5HeSOrhXkVfGnSl0s9Q
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Add bindings for the DAIs available in WCD934x to avoid
having to use unclear number indices in device trees.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 MAINTAINERS                              |  1 +
 include/dt-bindings/sound/qcom,wcd934x.h | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1240e75ecf4b..b25a196c5fab 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18984,6 +18984,7 @@ F:	Documentation/devicetree/bindings/soc/qcom/qcom,apr*
 F:	Documentation/devicetree/bindings/sound/qcom,*
 F:	drivers/soc/qcom/apr.c
 F:	include/dt-bindings/sound/qcom,wcd9335.h
+F:	include/dt-bindings/sound/qcom,wcd934x.h
 F:	sound/soc/codecs/lpass-rx-macro.*
 F:	sound/soc/codecs/lpass-tx-macro.*
 F:	sound/soc/codecs/lpass-va-macro.c
diff --git a/include/dt-bindings/sound/qcom,wcd934x.h b/include/dt-bindings/sound/qcom,wcd934x.h
new file mode 100644
index 000000000000..68c3d43ee898
--- /dev/null
+++ b/include/dt-bindings/sound/qcom,wcd934x.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef __DT_SOUND_QCOM_WCD934x_H
+#define __DT_SOUND_QCOM_WCD934x_H
+
+#define AIF1_PB                 0
+#define AIF1_CAP                1
+#define AIF2_PB                 2
+#define AIF2_CAP                3
+#define AIF3_PB                 4
+#define AIF3_CAP                5
+#define AIF4_PB                 6
+#define	AIF4_VIFEED             7
+#define	AIF4_MAD_TX             8
+#define NUM_CODEC_DAIS          9
+
+#endif

-- 
2.39.5


