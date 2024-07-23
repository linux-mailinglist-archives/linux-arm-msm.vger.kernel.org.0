Return-Path: <linux-arm-msm+bounces-26887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E8D939FE2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 13:30:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D65AE1C22090
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 11:30:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C6E2153565;
	Tue, 23 Jul 2024 11:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JHQQyBG5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41C81527B6
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jul 2024 11:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721734116; cv=none; b=tt7qOsb5x2XY3pHk6hqd2YG5W+R98kWZzzXiAvDQmHyPzLXL9DAEMr6DeIAeQGx02VxeIYKL+A+3M0Vpp9f6zk3zt1ZKP7CVeOesJ6zqCQYw90rxKN9i8dbt/P6Mw06cMc3bthrwU0tt1Mdw4bwhE7uC0z88FoPV2yF7k9RHRT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721734116; c=relaxed/simple;
	bh=ES7wWrOhhkjynRF1+9BlWZ7LeDgeDZ/7LKOPoPdvMZA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A+aUYtJ4+Y2lX3DjuKmXst0cNsB6xCVnr1zRtVrZdVP34WA8WRiMr/d9eGnsp9NVFcwCjGyOu0YsNM7iLOLjur9WE2ZFm3Rc18t4uJCrouPfs5o/5j2LvJjUKp++QQXHNzq5fbdgmnewa15f2LYxu1hV+656xjkSdgVbBkPwZqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JHQQyBG5; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2eeb1ba0468so72872431fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jul 2024 04:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721734112; x=1722338912; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EBzbMSTI2xw68Bw+2TLir3SBIr1TPeDFMebcN1sCpn8=;
        b=JHQQyBG5t+QrNMxVOka1B8LibJc5IQiQdEyrxCSj5o2c5bU0/B281Ia9hX5xfj5scH
         thjBN+OZJeGJk385hjJRvaFIB992YtOSyGaVFzP2tpKRyLWCTHvMax8W68Ztag953kVO
         vSpjyfH0r0TkOaMlBuRpgBCReRThiM185R3jUnpSSb52cdME406kIlXAdTGqgO/IzxI9
         CKIcP3i5AlycDJYo1peCS/+3uK2yYIgMjiqg+XlzjfRnoaj/C3OhrV0hst1EXSr5C4VR
         VyN+RoGQ7Ava3FUPOjqp5wAKgGeB23IcaWla3WnCXIjOUkeIfS1twz6BzZeno/SDAf3N
         mzfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721734112; x=1722338912;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EBzbMSTI2xw68Bw+2TLir3SBIr1TPeDFMebcN1sCpn8=;
        b=gJVpW3V2V2Vs8283wcURBW6IudupcUYA934WZ9jEZ/d7JgjmL8M92yl9/F6PXHX57i
         tOCtSck20MR/owjzyL1K6KMq5q1NBNIxuukTBJ22Zvp0rNKUaFppWFYvY+k6DTH8M9X9
         nFzfRyBB7sJxXCgP1LPPgC/+TSaOhrLNnTesaKFwyLGOn6bJkwXl097Eei2hZNwr+Ag3
         4ls886RyFl4sTBD3DfWUjt3wABhMNMi++jqvVdbrHaqB04xxTdBCZH1K5sMEvd1xqr7F
         Vl+/ZbqypquZW0d1eeupuM+dE44md1Xc4Es8l9X3GXYiJKIPN6WEXdvAN7jFufHNEIUj
         E08A==
X-Forwarded-Encrypted: i=1; AJvYcCV/i03gbcUPfgFcCCu32K09noShLuPBGx+pdw7jUoXm1I3S9P10vYgLg0SCHreTA9Ag1imUR65g9QqBd7slRJ0Z0L2IcVgG0gJE1zVPxA==
X-Gm-Message-State: AOJu0YzES0CQEZ+QkwHJaEcH6s1jluXCxVJWRmu4i7A1cMvdFrU85iak
	mH6W6mjCMpH8EQIVP5D3HpmA8uGqC4FB27hRXiMHSY05vc8q+FlYMo5wMdLiS0o=
X-Google-Smtp-Source: AGHT+IFL18lLK7vMYwu6+uF/LnNLPc34++B4phx68OGmbRd11N7yB5ph4XVMRy/fIrBvldkaE2G3bA==
X-Received: by 2002:a05:6512:32c6:b0:52e:9958:1a66 with SMTP id 2adb3069b0e04-52efb6356f2mr7400142e87.23.1721734111815;
        Tue, 23 Jul 2024 04:28:31 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52f01552b43sm950871e87.286.2024.07.23.04.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 04:28:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 23 Jul 2024 14:28:28 +0300
Subject: [PATCH v2 1/5] arm64: dts: qcom: msm8998-lenovo-miix-630: enable
 touchscreen
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240723-miix630-support-v2-1-7d98f6047a17@linaro.org>
References: <20240723-miix630-support-v2-0-7d98f6047a17@linaro.org>
In-Reply-To: <20240723-miix630-support-v2-0-7d98f6047a17@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1653;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ES7wWrOhhkjynRF1+9BlWZ7LeDgeDZ/7LKOPoPdvMZA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmn5PdfmX0MSLna5RfQDOiud5GvUIB8TrDx/7g8
 YScg/ylLO+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZp+T3QAKCRCLPIo+Aiko
 1UORB/4zJkaO1UgTrir4/fJ1lPBnYA8z16RmLwGVqq1hdPpg6qSbZpr62ipwahb1F3xIv/ZAUzT
 kvbD2F0JmtlbDnpF4sZDM26+hl0zCu53RATmjBdrsh2C8eP9XtiGeY0ibkd0H7wF3pPFKDCDOch
 3aUujdJieU9s+6Pp4C9MBm56720ALbXLuTy+nnw8MtcQbKQUQMOAYfyV0CpiPnM3c2DAkJqLGlo
 q1KyGMDEcgRw9ARmveKt7jnXrmtMP/4Hepg+m5gGeYNSu9RmgSCKkXf49SSAcZs7GtLGnabTgVt
 QOL6R61Mdt+uhkJoOukxWq9NGGauXWPKaZf59xuoed7WKgMt
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

There is no point in keeping touchscreen disabled, enable corresponding
i2c-hid device.

04F3:2608 Touchscreen as /devices/platform/soc@0/c179000.i2c/i2c-0/0-0010/0018:04F3:2608.0001/input/input1
04F3:2608 as /devices/platform/soc@0/c179000.i2c/i2c-0/0-0010/0018:04F3:2608.0001/input/input2
04F3:2608 as /devices/platform/soc@0/c179000.i2c/i2c-0/0-0010/0018:04F3:2608.0001/input/input3
04F3:2608 Stylus as /devices/platform/soc@0/c179000.i2c/i2c-0/0-0010/0018:04F3:2608.0001/input/input4

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../boot/dts/qcom/msm8998-lenovo-miix-630.dts      | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts b/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts
index a105143bee4a..133999a7ed2a 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts
+++ b/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts
@@ -11,6 +11,22 @@ / {
 	chassis-type = "convertible";
 };
 
+&blsp1_i2c5 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	touchscreen@10 {
+		compatible = "hid-over-i2c";
+		reg = <0x10>;
+		hid-descr-addr = <0x1>;
+
+		interrupts-extended = <&tlmm 125 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-0 = <&i2c5_hid_active>;
+		pinctrl-names = "default";
+	};
+};
+
 &blsp1_i2c6 {
 	status = "okay";
 
@@ -35,3 +51,12 @@ &remoteproc_mss {
 &sdhc2 {
 	cd-gpios = <&tlmm 95 GPIO_ACTIVE_HIGH>;
 };
+
+&tlmm {
+	i2c5_hid_active: i2c5-hid-active-state {
+		pins = "gpio125";
+		function = "gpio";
+		bias-pull-up;
+		drive-strength = <2>;
+	};
+};

-- 
2.39.2


