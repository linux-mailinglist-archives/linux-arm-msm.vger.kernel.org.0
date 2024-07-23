Return-Path: <linux-arm-msm+bounces-26888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E5C939FE4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 13:30:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1993283805
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 11:30:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 433171509A1;
	Tue, 23 Jul 2024 11:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vt4LDr4O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CE0152E05
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jul 2024 11:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721734117; cv=none; b=JYdafElHmFw/W++6TFrs61r22tPcVkd4qRRqy7Ejvxv5aMVFKpvbV9VQKyEP73vQEDz0XdI0qoFgsxua46/+1fRpUQqACWxH5Xh1YlmAGvujUfRW9Ll8nT6GE3P3/aYN6AhZpwTcZNpnqcBqMIcB33zhjqbe0xTAsCFyY+UqmeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721734117; c=relaxed/simple;
	bh=/WMSg+LlgRAuEa4etqLB3vJsRG6cywu5axWsmygeE5Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dOvEBNk8tAJbx3s8UgOy7dQfeMfqT7IBJb2KfaDk0FvMBBSxfI8qZYLySzvrJnni3VVMJuhBozsRoM9wiCNUQjn3EodG/R9M4Z7sLN9sCKwh/9rm4ctoZgPx3AFuhxWr9gkveDQIi9x7hsTLZDWRIpqRPyVFFXS7t/lCBi/QGJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vt4LDr4O; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52f04b3cb33so3893088e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jul 2024 04:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721734113; x=1722338913; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KRv8ryOt7Cujtjsq7qyqL7ux649fUM5EGhiMHj7wxS8=;
        b=Vt4LDr4O7S7C66enQJ30j9KO8NLcGehwCjFNzT6zybece6XCmrDpDF4B1ocCRYvYYI
         JXIK4zJxD5vB5EQJovvGWvADvU0YZZAu+fXPRbX03U0X/CW4tm/4R6lEHdiZeR2DT8ew
         3f4YY/NWVSvipvzdERw+AWdeYDO1ELIaZS3fDtlZfKsnPqMi8CGRrVK8BUaW7KIaU19W
         pWaiXKwYvxhKceEj82fCFvYtbahxJKAQkqQoCEsQOHgQD5RaREGN8cyPwgOx9XNM8AlX
         56nIKJJDWHSjTDyDCmc9Nyc4bDWwotqfAved65LG4clCVFvCBhMldWuqSBmP256Pvux0
         iJig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721734113; x=1722338913;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KRv8ryOt7Cujtjsq7qyqL7ux649fUM5EGhiMHj7wxS8=;
        b=Rqf0d4jsENzhcU+20xrE7/OA8jVr+SgHJwQbf3oIQkqjwsfDIBrdMn6OXZ1Hr1Ze5Z
         t0EPtGMCHentPcRNPtsyOY59Gd9rcy6rAcW826VIGVYuSShSz9uKFpVTpEVODGTtO90B
         DPz8h9c1dQT1zO5irsoKkknqhdDwJZJ4YAgibiLeIgb0qPPTDmJfjhqPJAyh2ctsR/c5
         ATgmDF4LBAGtY7w/cCvJWojKPhAH5DTJ2aRlmEok89/gRKGEhFI5wQ78ZSU/N/BwfvDM
         2356pXvch7qwN1D9J891bljxlM4r3Xry8YDn2UMpK9TuwyesIqNtyTEy5qZeJY6jBOzS
         S8Kw==
X-Forwarded-Encrypted: i=1; AJvYcCV+G4eMkHwzvEap3bwJTKRZqO0ETdvO6/TUmBeE+Jwlh7HNwrsncqj1r8SsUMXD43vta1BVdO4n+Hob8tEM7e/5aNDOXQLYIp1kEgc8xA==
X-Gm-Message-State: AOJu0Yykv7geN921481By9S8cLb36mI9oSSLCjcGcMpUDDwsfFyILaU9
	U9L4kHHe8OFuTbl8HAWmVzFWS68K7Ljj58E6RvtmRmFTtP9IXLdkvk3XWwTU6oDLc1On0U9zMyf
	d
X-Google-Smtp-Source: AGHT+IGxjcctex4LhZS0msKgIdjGIEaiQCQowswJM9r6j4WS8S3n86GcEdKVnVxxA88NVtjUrLPPbA==
X-Received: by 2002:a05:6512:3053:b0:52c:df83:a740 with SMTP id 2adb3069b0e04-52efb7480edmr6910800e87.30.1721734113386;
        Tue, 23 Jul 2024 04:28:33 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52f01552b43sm950871e87.286.2024.07.23.04.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 04:28:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 23 Jul 2024 14:28:30 +0300
Subject: [PATCH v2 3/5] arm64: dts: qcom: msm8998-lenovo-miix-630: enable
 VolumeUp button
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240723-miix630-support-v2-3-7d98f6047a17@linaro.org>
References: <20240723-miix630-support-v2-0-7d98f6047a17@linaro.org>
In-Reply-To: <20240723-miix630-support-v2-0-7d98f6047a17@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1487;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=/WMSg+LlgRAuEa4etqLB3vJsRG6cywu5axWsmygeE5Q=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmn5PdbQUG7mmTIQQsOQJOTa91cmR4AqhCBENDc
 E1tOV6n7UyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZp+T3QAKCRCLPIo+Aiko
 1flwB/wNnqm30tMYXP1qnVBoz/GuAUpIgtlc5DWOR0/a4kHj8ryaXAfGRpbBFz9fkC15K5/GyEy
 iVvAe6FUI0K4+HxLZbwxm4Xi6vQGIteYAy9vYIkccekJiWWxi6UqT9aor1hnacX8iFg3Z8mermH
 QLSP96U8IR0IaPmBXoxCSV/9mJSdHDYMlnrp3I8Tqs5X+p66rH28BdGCJnWX/iFH3c5kKSKNfUA
 8CiadRK+cHus9ei9DD87JDIUc+ggniRr6Nau4CQAflTqX44Wf78MrV9Nnae5AiGvtLWG4mgCCEu
 GbmlANTS8REEiUs6INjKxlSiXq4Wn+TT96WCdQFp6yHSQBzf
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add gpio-keys device, responsible for a single button: Volume Up.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../boot/dts/qcom/msm8998-lenovo-miix-630.dts      | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts b/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts
index 2430f17b2356..fad5f390171a 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts
+++ b/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts
@@ -3,12 +3,29 @@
 
 /dts-v1/;
 
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include "msm8998-clamshell.dtsi"
 
 / {
 	model = "Lenovo Miix 630";
 	compatible = "lenovo,miix-630", "qcom,msm8998";
 	chassis-type = "convertible";
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		autorepeat;
+
+		pinctrl-0 = <&vol_up_pin_a>;
+		pinctrl-names = "default";
+
+		key-vol-up {
+			label = "Volume Up";
+			gpios = <&pm8998_gpios 6 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+			debounce-interval = <15>;
+			linux,can-disable;
+		};
+	};
 };
 
 &blsp1_i2c5 {
@@ -43,6 +60,16 @@ keyboard@3a {
 	};
 };
 
+&pm8998_gpios {
+	vol_up_pin_a: vol-up-active-state {
+		pins = "gpio6";
+		function = "normal";
+		input-enable;
+		bias-pull-up;
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_NO>;
+	};
+};
+
 &remoteproc_adsp {
 	firmware-name = "qcom/msm8998/LENOVO/81F1/qcadsp8998.mbn";
 

-- 
2.39.2


