Return-Path: <linux-arm-msm+bounces-15811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 525798929EA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Mar 2024 10:13:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C80F282E43
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Mar 2024 09:13:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59ECDBE5B;
	Sat, 30 Mar 2024 09:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nKh2BVHH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7192BB67F
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Mar 2024 09:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711790001; cv=none; b=WyLGxigHEZ8Cy9/B8Ufebk9fa54/P0qGcEMknSpx4JE30Y069442QBmYnzva4i2Snw/kLDCrThQ78fvc1JKTysSh0RUDhVIXG8IplN5bxIWxQ9c7mNIx4BfG5OZiE2GhapZmX+MSMH01iWnr3tOi/coy165sixMlSLXXVhV5o34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711790001; c=relaxed/simple;
	bh=Pd61hkxq0jQRKuAepCysIm0E2ZXvmOgEfKC7Zg70avM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IOQjFlJgBDioLwpNXguRzu0NEoLUlcio/I6v+j9cwpjLo2UAhFi0ScH2RheREqoFAJ5vQp4pKxJpIEOJ4PZUmv/3n4EcE3hQf3abrFz+Dzqgq4sbHbF8ZH8Sp6aZIkvT8nj6qtD+c+rJlEmitzQF92enlb0EG0BcaivG2V9HMuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nKh2BVHH; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-513d599dbabso3332655e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Mar 2024 02:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711789997; x=1712394797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n/ahHhuh0l5k5iEy47fRvRUIFY5jJwWirUcq7Vi4bcI=;
        b=nKh2BVHH7qFeO715HmLEmFFhndp5dUL5gxhobj3LMdJWBeX32CJX9Ix5XzIBdDucXG
         NpjgLc2sQBgB9bz9/mzFcvxajiohQ02XZ4SOvR99htMLbSnpENxaWL7tcNakEAJOJvHS
         LzP4yjhDK954YIP8kuc4dJIAilzePjrU+5qsB2X0tQ4zlZG42tZHT1wOqAleanO3okju
         +qcjYKhwDJ2ZZkIK88sEG2nCaa971MxyAISOrDN+XQ7FPADmffDIPBzRU9+z2Gyy6eEe
         pS71RjzNE2TG9J19wMTNSfRJBJWv79yJOnIc9G5ANpXgVWa3WpxGZOsoKjnqEc87mboJ
         e7kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711789997; x=1712394797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n/ahHhuh0l5k5iEy47fRvRUIFY5jJwWirUcq7Vi4bcI=;
        b=NzW4b0nG1C5SCk+9KhNeOu/ItOMMlr32vCNXU6NI+HOnPshXO0Mrwiluu+PD2Y7NdM
         WjjotK5yXX1ptka+rOi9SJ/uM+yxXeuC/C2c2nzSsMQqyAE3QdnRx+DLubefS60X0MZd
         p5mfhp+hnKaXDQOezlQSJ8l5rMxI6Kr3Tl6JQvVXJzGnKeiITGAPumIOwdckM1fh92SA
         SDTSmRpFoU5eMXcFSVNpuX+Lbq3/3kNvX6mQx6XHzXYIGknIigx1ZjxyAJAPEz/kYU3b
         zZJ2siUNERizsyiJYLlVmt2CIprilPvkJvFyq3oqSO/+Gb7luhJeNnpsP1xlkjgluMV7
         yK3A==
X-Forwarded-Encrypted: i=1; AJvYcCWLkSpuuZFt9Q4zNS6X+LGyDc1Amhu1hkVLo7JbU4uPA8ibMYz+2ahuIuRwdM51hQ4ziCAanlm883sLg0+Aq0kE0Ps7FzNWjTytnxTwpQ==
X-Gm-Message-State: AOJu0YzUNMVwP9T8Jw3IUO5pe8wOrsEWJdQZCjeAwi6VFUkvhz4wbyNa
	ZFhJ7yQbT5TTVtgKfce1fVZ0uNO/S5bA7bd7eSIMHYBRuukQxaWFXo4X7Jm7uLM=
X-Google-Smtp-Source: AGHT+IH/4O8sS4VNtDSD98CNJBK78k1IeHbJpO+5na8hAgvlTBSKhJTlTsjQF+7s/5YHfYpe8r0j2g==
X-Received: by 2002:a05:6512:3ba0:b0:515:d12c:8464 with SMTP id g32-20020a0565123ba000b00515d12c8464mr3562774lfv.31.1711789997306;
        Sat, 30 Mar 2024 02:13:17 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id az15-20020adfe18f000000b0034335f13570sm3984261wrb.116.2024.03.30.02.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Mar 2024 02:13:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danila Tikhonov <danila@jiaxyga.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/2] arm64: dts: qcom: pm6150: correct Type-C compatible
Date: Sat, 30 Mar 2024 10:13:10 +0100
Message-Id: <20240330091311.6224-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The first part of the compatible of Type-C node misses ending quote,
thus we have one long compatible consisting of two compatible strings
leading to dtbs_check warnings:

  sc7180-acer-aspire1.dtb: pmic@0: typec@1500:compatible: 'oneOf' conditional failed, one must be fixed
  sc7180-acer-aspire1.dtb: typec@1500: compatible:0: 'qcom,pm6150-typec,\n qcom,pm8150b-typec' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'

Reported-by: Rob Herring <robh@kernel.org>
Fixes: f81c2f01cad6 ("arm64: dts: qcom: pm6150: define USB-C related blocks")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Correct warning msg
---
 arch/arm64/boot/dts/qcom/pm6150.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pm6150.dtsi b/arch/arm64/boot/dts/qcom/pm6150.dtsi
index 11158c2bd524..b20a639cddf3 100644
--- a/arch/arm64/boot/dts/qcom/pm6150.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm6150.dtsi
@@ -71,8 +71,8 @@ pm6150_vbus: usb-vbus-regulator@1100 {
 		};
 
 		pm6150_typec: typec@1500 {
-			compatible = "qcom,pm6150-typec,
-				      qcom,pm8150b-typec";
+			compatible = "qcom,pm6150-typec",
+				     "qcom,pm8150b-typec";
 			reg = <0x1500>, <0x1700>;
 			interrupts = <0x0 0x15 0x00 IRQ_TYPE_EDGE_RISING>,
 				     <0x0 0x15 0x01 IRQ_TYPE_EDGE_BOTH>,
-- 
2.34.1


