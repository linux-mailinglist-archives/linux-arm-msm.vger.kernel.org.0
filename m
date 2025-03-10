Return-Path: <linux-arm-msm+bounces-50848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB1DA5974B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 15:16:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40D8D1884C56
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 14:16:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C7DF22D4FF;
	Mon, 10 Mar 2025 14:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TnDzu/4W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910B022B8B3
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Mar 2025 14:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741616126; cv=none; b=Yv+7o/pqVAxEVAzFwWyGh+NG2HAuxVwG8TwCw21rCZ/J6U2sFE+M23z5cvDmbbh52z6etV7Hx79PX2seCVsOi3FLwhheuqOlgcFEGsNjxSiL+TGCMy8VCxMm9cBY0gaPJplNh5JGo5q2KIG9TcvihdAON5y9reSU/VHoKlvXEL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741616126; c=relaxed/simple;
	bh=fqTqMIhWNpfM5LYJZu3n6CNwSGS8W23mDWqQ26Vmdao=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fl8s2KvXGx6pFh1yo5fw5G2m7JJ3QCOEgpkJ1n5FbIvwRKAzxHITh9irKzji6WtBB0o0Wv+ULBmuPTto2uSu5dLgEdqaev0r6lSzCZnNAxqS3HOVFdEfH3NSu5rHy7wjbi0j/+ioo776su9H/EdyuQNif0UZumWhY2Xnjug0Q2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TnDzu/4W; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso1284150f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Mar 2025 07:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741616123; x=1742220923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LmTqTAHRMrZdwKLgsfK2/thaztYYY0csGZPufN3JueY=;
        b=TnDzu/4WKNvtx/XtijuxPIJZZcLUWn+L6CKsnatweFO7z7Bmr4srqtWvqGoRRzWmBQ
         lFq3EX6s0dNQhzHtjH79RdRMtx3bgA4ARMT5lg+8M46CF7V7mvj7D4ygMzCV3C6cWhAt
         Ujuddxr5b/gTquY66kXK4CN5ko7prJeZVscs+Er9VY1HSIyhUsFeFwGm1SAUInpd5bwY
         +Dvt+9wO16srPLSn5Knu5CQ8Zt3nOIVNaJSWni5zyZ06oVIhedUPrT+vNSTWDqf1jq+x
         V1W4W7l2yz2GKqF/IvlKEHqeQQ7WLZW7IMNTWAkpI2mdDJWhQ1Qxd6x9NPJu5YCEdUd6
         Oa0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741616123; x=1742220923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LmTqTAHRMrZdwKLgsfK2/thaztYYY0csGZPufN3JueY=;
        b=f11meqitPWyKU9Y/rsAnMtjDLgoVWWVuCGlNFD590qzvMRVQ+6PeoSVs44SWhQTtXu
         PjiTxBwi7vkEgYIlY/d1PI2Wutl2DoYWbZbwlHCEujRqoKrHzGLR+ZKkL+VXq6dyImaG
         2Z0HdPfMIhkoZakgIcsxjBE2WQTV4XxUvimgBY9YGeJ3843RBqtwVyCi1zEhTwYwFeE2
         R44AF4bopK8fgaqQGCCeqhq9SUZwWP95On1GFRxslgDD1cMvJ5lZOS2fGQ8qczO2tHOd
         bQ5E5CNY65ACtMwfIQDpW7lNHM7FBVeTJJ8Q70q24Be7A6I6wXPm92uOMzFF+sMevD1Q
         gQfw==
X-Forwarded-Encrypted: i=1; AJvYcCVR29jalmtiKdniLvbFTHlHgSm0PYxP2moY9cz2clivIuaa5xHW8V2rrUd12DQPvLX7K6u93f+bQdMl+6dt@vger.kernel.org
X-Gm-Message-State: AOJu0Ywhi9jdTZr7Tk4GFrH+cz6dl0ujqY4vQhvFTgdYSEGuSgqIn4H5
	69h1z2kAPY+iNUfl+bh0zXArjYIcg6414RlSs5aaPTor9EyTHVidn2qOvKSGWCU=
X-Gm-Gg: ASbGncvA1fF0QNgvWswmyb6blglrwqT8O+XhSPtWcmH6YKdjCAkHTWatZ1PlBuJ50Gg
	tH+QfGoua+tPb4DZ+GXZRFp/4PyJfvxJ1kx2rlt2IREwqXcD2gHlx25vFnXLF/uGZD+0UGmJ58g
	wLBa3dwbb3XytB7KSOghkgrCwsIDf4XioiJJxNbt9B+2LqYIYcjD9Fwr8lu5uUtyqlMAOJBsfyx
	Xr7Qq348OW+ExmeoHCf/VH++ZBHHvkYBQ3e6OFIqaTM5jll7eEgAVkHWvLLnSj0HT9nv4FAyMXq
	1SENkaw3cY5aYOCGFP0Dou07INnL35Yo1akI8EeRx5w=
X-Google-Smtp-Source: AGHT+IFGVt+pDHq6EUpM/aSC+I2TplLZ4xEg3fnnc4wQ8YzS/eyx+MSJesISoV8khPoQ4Ai4zCCC4g==
X-Received: by 2002:a5d:6d09:0:b0:38f:4d20:4a17 with SMTP id ffacd0b85a97d-39132d1f8acmr10073432f8f.13.1741616122894;
        Mon, 10 Mar 2025 07:15:22 -0700 (PDT)
Received: from hackbox.lan ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bdd8da097sm149824545e9.17.2025.03.10.07.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 07:15:22 -0700 (PDT)
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
	Sebastian Reichel <sre@kernel.org>
Subject: [PATCH v2 3/3] arm64: dts: qcom: x1e78100-t14s: Add OLED variant
Date: Mon, 10 Mar 2025 16:15:04 +0200
Message-Id: <20250310141504.3008517-4-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250310141504.3008517-1-abel.vesa@linaro.org>
References: <20250310141504.3008517-1-abel.vesa@linaro.org>
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


