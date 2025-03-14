Return-Path: <linux-arm-msm+bounces-51414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C86A6134A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 15:04:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 518697AABA5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 14:03:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59D2C2010E1;
	Fri, 14 Mar 2025 14:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qeP7m0F8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806401FF7C1
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 14:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741961033; cv=none; b=vGWS+ZMetyRhWqYrhMVIbfWeXFP9MDIyrJQcvTp0pBLkn2+s6VHLgJA313gvuy47oDAyieJUYLuP048uRPGSYoSKaFajr1KDXgY3XVJ1qKO4SeCy4XfLNgRhvK8nJ+qMFO2Az2QWIIcks81gF8x8MCJZSQYhaya+A8DLzpaYAi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741961033; c=relaxed/simple;
	bh=BixFMmu9sTqy8BJKh8iJ1ywxzjkEJgvwb4uK0rEz9Qs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qhiE8sKYU9ZxRJ60ctzmxPcTw6uh06qTdmfN0luKUZOyH3OnLsHtQq8JWO+hPhxRYvnEG+8IXkkF371XRhSWhTpURPgCmspjqdOelPIkEYshC/mjtAJwaFCgH+HsHXCYtLxbM4sduHtviKE/afvXeUPW2NdsA7LnRyEDr905Snk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qeP7m0F8; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cf848528aso20354165e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 07:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741961030; x=1742565830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DDupoB9dBc8DfN6WTesxBF7iIJOj9N8IoeENJse5v8Q=;
        b=qeP7m0F89nY48CDaXhm6SB0ydRZt4Q5kurjKi3qRCTfuGBWzP5C5KvekpcI8f8LmoV
         XNBee6tGtooWr4hpgS/rHDi1wBZZtg4CzP80oB2wzAWeGdJ7YBY+cwG5f3/WV6s6cn6R
         ysg85bEvliXLc1ma4NblLevAxFva7S1H4mG4++T5nBy+YM9GZV0GcRnaaFoJh0xU2QcN
         wobsagaE/qJLKMMR+g3l64zg5WL+ylG6z0VtQ3BMlwTvSODlg4nP6NozKU3wziT1wErH
         YW+Knz2zNZyxRCe5EnHb5xxlgcU+oX7gr0nmO2Pq+3tcxz7bJFaRGekG+wu91symVLfA
         +5tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741961030; x=1742565830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DDupoB9dBc8DfN6WTesxBF7iIJOj9N8IoeENJse5v8Q=;
        b=oUJJkKm9NkUtb7B8Lbu2Kgib30CmFscrylV12p0N4DQMctVG0G8mND5sO7UHZnX+n+
         OvZAXd3apddcj+J6t3om3QUm9TvFDhAYPFhQ5+jliKuA8XpiYU2tJe3l+QgsWwa2K3Pz
         bzcBNllt42RGrNkbolf9ii8tVUsdcf9a3TaNy/lvp9XMDhVwHW7aa/4SvLwbMzFT1zzy
         WQWz+6osDkCSffI1l6gYusQVWvKdvKoXYENvq05bd9a1Oif+xKDnrJP5LGE8gomzN/xG
         X4SD7i/EzgONJMysji7iGXPriozlmeEZIw2/4UB+rlrH4PLHnmvqfS6jEpCHjKOXGrN2
         PeWw==
X-Forwarded-Encrypted: i=1; AJvYcCWJWmiCOvycVO/hNmOrttp6v6g9WS+uMdrYboWolinsJ4+QTlckVP64EarDam+PW98K37i44HovTcQuVDZP@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9JH6zrI5a5N7XvlGW5A8NeqZ4LEB3lirbVyEGx1muQVNmNWAe
	snYf/xGckGbGAcuYM6aAK1s91Iv197WPg6CMjVxFWqezQIm9bTfYQzfedR0YXUg=
X-Gm-Gg: ASbGncvGJJEHc1vIFaZ+asnNJ7m5vo57qIrRc8XjHagZDuE6Yr7GA/j9QZuzEhGEH4x
	Og2X1yYA+9g1iE1YQmZpGPK82iqNzj/ILurBrkAGF5tijGQFmkbNB+1W+Nl4Be52JGSeOStLMxB
	VbRKQQKUOUypMGOdmlrSesUimV5deFH08AZHndBUvajT+7wQrwM/XkXOhYkI3Z+EsvwTi/VQ6Pr
	xZwiBvk3L2HN+QKzosacNrysDFGgsCaxFbxNyzDzpBaGGuTuSWqTTku6XIrF0vQ8mouFvGMNmzQ
	ZyK1FlV6LPTw71/7dmeoDKXr7zRZWrAUgpDkbpQj3jw=
X-Google-Smtp-Source: AGHT+IHgPJJb1obTrSTys3+K62ZDhJF/Fy0GpflFQd0zruZg8pn82tMFCsUAsrtNCKhRbgLv89dzDQ==
X-Received: by 2002:a05:600c:1910:b0:43b:cbe2:ec03 with SMTP id 5b1f17b1804b1-43d1ecd93aemr31086405e9.27.1741961029562;
        Fri, 14 Mar 2025 07:03:49 -0700 (PDT)
Received: from hackbox.lan ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d200fae32sm18156455e9.31.2025.03.14.07.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 07:03:48 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Johan Hovold <johan@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sebastian Reichel <sre@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 3/3] arm64: dts: qcom: x1e78100-t14s: Add OLED variant
Date: Fri, 14 Mar 2025 16:03:25 +0200
Message-Id: <20250314140325.4143779-4-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250314140325.4143779-1-abel.vesa@linaro.org>
References: <20250314140325.4143779-1-abel.vesa@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since the Lenovo Thinkpad T14s Gen6 is available with an OLED, add
dedicated a dedicated dts for it.

This is needed because the backlight is handled differently for OLED
panels when compared to LCD ones.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/Makefile                    |  1 +
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts  | 12 ++++++++++++
 2 files changed, 13 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index b54f45b3bec8..df8d63560d06 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -290,6 +290,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e78100-lenovo-thinkpad-t14s.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= x1e78100-lenovo-thinkpad-t14s-oled.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-asus-vivobook-s15.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-dell-xps13-9345.dtb
diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts
new file mode 100644
index 000000000000..be65fafafa73
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025, Linaro Limited
+ */
+
+#include "x1e78100-lenovo-thinkpad-t14s.dtsi"
+
+/ {
+	model = "Lenovo ThinkPad T14s Gen 6 (OLED)";
+	compatible = "lenovo,thinkpad-t14s-oled", "lenovo,thinkpad-t14s",
+		     "qcom,x1e78100", "qcom,x1e80100";
+};
-- 
2.34.1


