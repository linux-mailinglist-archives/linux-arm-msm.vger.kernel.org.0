Return-Path: <linux-arm-msm+bounces-30000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A24964368
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 13:45:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 243AC1C2480A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 11:45:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01DA2191F86;
	Thu, 29 Aug 2024 11:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XWBBxeaz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1361917FB
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 11:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724931897; cv=none; b=pLokQXONO0ayngZ25cq/mNxm6OsoGgIO4Q3O6zXHqmW3pVjiJgKua+cwm9O0wdzphBdNxBarBHJCY+GFBeAcIjGQmBqDQKDp8c1putpw+o0haBfKyZeZMeYO9bJp+hKrga8UAUcbuVP85CqfMi8yn6cIZce0G5d8kigyCkXenn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724931897; c=relaxed/simple;
	bh=rifu9y+wt4GJ7gNsY57utuCZvFmW1ndiWZH64xIQQ/0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=kJ/XcvRJY/s7lMTWfhjJ1ajnXb0k5aDxcAK9cFQIo2zCBQ/Vvo1da6rtu5gCsaPRfAOpL9xHFKprxBr3hOR7reh54HWtCkZhJfK7exKPbbmrFcNKF4BHh0WDm8zHsmWBERc0EJNFg+S5DwRM0PHD15OPpxfialUkQ1dYlnm7eco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XWBBxeaz; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-371ba7e46easo389762f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 04:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724931894; x=1725536694; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UTJJ75BTgCFdOePuEMj8NMovAev5SO8Nt9BRnbnEer8=;
        b=XWBBxeazZn4vPLEdeDtXJfjHr4BNyyYLlB0V6xVqLWooviK/+Y1ayJd3spYYJENVwA
         RyC0HsMhO+JYLD+ESeOvGPfd0eMJ4BN5D9rFmZFPyHb2LaZLLwF+dlqehtsFBF5kLT60
         MbcR7AW+KtpjCMd6Ktz2289Ljp5UjZggbLsAc0vaYgoN0ncsVo5iidTpt61pKk+0RxWL
         TtextXtVPKauhdAzoTrNqGcbkYgsg9t004yqTJ2nAS8QUHNt136k1rfgVfYaO1CP2KUn
         2geILeeLfcIPz+FIzVMxoRKuMTNBU68SWbr7NGPRr19U44Py7UAtHNw5xnK9Z7yajHiF
         AtMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724931894; x=1725536694;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UTJJ75BTgCFdOePuEMj8NMovAev5SO8Nt9BRnbnEer8=;
        b=SVOl4Rbn4UHX+1s9j9k2Wit3PUE9fAYwbv/ZOGfkiFrQsAbJa4evBMRxnqGQBNXvvW
         +eMvFRirYIXeDZBpW80AN0ew6wt7eUgw+qvXdBAJIlxXX/jhkXBL9+fVHF58g7VrGQUA
         /A6mBf2yT59U1REiru7hrfRUK5VnbQfqRJ0Fbf6DQUfZEIJtz19oH/uvWVx4OnuMG+2B
         dpp6xJb7i5dRF15aQVvl7nZjTbxp4V7+cGnFYCjpm4OoddzJUo6LEA4uFXZtsgfUF6Id
         l7M3jKZGZHFgMKxACqEcc9I2K4J28UswlIHFRv796ECNEUoo00RJwcXBJNSA3saWA08M
         Khww==
X-Forwarded-Encrypted: i=1; AJvYcCXEHErnfm6X2t9X6UvqP9M6Cu/cCzcpjRoTAor8+uFRwY7NkcZfPqAUl8EVqN/QJOsKxjU9gJ8xAO1oaLo2@vger.kernel.org
X-Gm-Message-State: AOJu0YxX988n6GWD4FtJ+vvnw3R7ZAugHNo91QP866d7IC5DQ9KM8481
	Namls1iiMgPg4103Ze2eXiuL2zBmysbce36Cora7CS75szFsgPPVK/yWexz4JZT87TEte948/j3
	T
X-Google-Smtp-Source: AGHT+IF3Bb5AHMsn6V83npZkzhEqtl8IHuKliErQzeHRx3A8IjB/2CX1xOcGVq2M/99gZUXtWMfQSQ==
X-Received: by 2002:adf:e5c3:0:b0:371:82ec:206e with SMTP id ffacd0b85a97d-3749b52ecb9mr1705419f8f.5.1724931894469;
        Thu, 29 Aug 2024 04:44:54 -0700 (PDT)
Received: from [127.0.1.1] ([82.79.186.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749eead49asm1195550f8f.64.2024.08.29.04.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 04:44:54 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 29 Aug 2024 14:44:47 +0300
Subject: [PATCH] arm64: dts: qcom: x1e80100: Add orientation-switch to all
 USB+DP QMP PHYs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240829-x1e80100-combo-qmpphys-add-orientation-switch-v1-1-5c61ea1794da@linaro.org>
X-B4-Tracking: v=1; b=H4sIAC5f0GYC/x3NTQ7CIBBA4as0s3YSwJ9Wr9K4QBhkFgVkiNY0v
 bvE5dt8bwOhyiRwGzao9GbhnHrowwAu2vQkZN8bjDInNZkrrpompZVCl5dHxtdSSvwKWu8xdyk
 12zqB8uHmItrgxnAJ5qyPI3SzVAq8/n/zfd9/tQIK/X8AAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1450; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=rifu9y+wt4GJ7gNsY57utuCZvFmW1ndiWZH64xIQQ/0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBm0F8xa5YEAa9FuZRS1OBycE6xcniCbIbOGS/y6
 U98evK+7nCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZtBfMQAKCRAbX0TJAJUV
 VlxED/96h+XA+71H2rlUxudo8nM7UQhWz1VsyDaw7UJ7fUeSR0pWL8NbSj/arcGnPGFGxaT+nX8
 u69xWz/sFyobU0BJU/z+bTI5Ckf07eVK5F/gJAp3YW0LTYXibvSH2f9RloTox4Er2pyw4AlpqMz
 hhfpsLPjgBrSqtvztwIVyKwGueiz4EBIkvNzUgBawPHanxTaub+QSWypvyGjt1UUfwQ3biwgUY3
 IsKKeAstIGWe/ZEieLfvCHZSNz6UBEaNB2myQs31BosoSo/G7hHS1v9zWNoT78f58VZrvbjBBVf
 RJUjUtPY6qnKwsPGzxBTfmUIzYUbUEDzEnaOdZ/kQWw2NKVxWU23Hvi3rsI03LgcCYTnNPZkF71
 3bjiRPL4+YiEA2BMvYp7JCOzG7GVdBeVFhW1seQtaZvn7VDqErRzmdJShHTFsBTeTY5sWbL5OO4
 iOrbk75ZFQrR/pmRl3wBmDT+iBpzo3BXVaArLmjVs030KQBRtx0ub3AXkGi63LH0+CCTAlr2A81
 +vjU3jMI0+oDkCC9TQyRxbm+HpFQORPE168gDyVCMRK6x9YazlvXenz06ctAZQ0Tex2GIyF2s9C
 lIZ3qEV8koIHAIriNTxGm1SKMOZXu4nnRANykQ9kKEtfeFGOsVGaiffdx+5awaHsaCUeTlhzxsY
 fwaAXbb+OEzjIXg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

All three USB SS combo QMP PHYs need to power off, deinit, then init and
power on again on every plug in event. This is done by forwarding the
orientation from the retimer/mux to the PHY. All is needed is the
orientation-switch property in each such PHY devicetree node. So add
them.

Fixes: 4af46b7bd66f ("arm64: dts: qcom: x1e80100: Add USB nodes")
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 6abff8258674..8a577f29d4d4 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -2604,6 +2604,8 @@ usb_1_ss0_qmpphy: phy@fd5000 {
 			#clock-cells = <1>;
 			#phy-cells = <1>;
 
+			orientation-switch;
+
 			status = "disabled";
 
 			ports {
@@ -2672,6 +2674,8 @@ usb_1_ss1_qmpphy: phy@fda000 {
 			#clock-cells = <1>;
 			#phy-cells = <1>;
 
+			orientation-switch;
+
 			status = "disabled";
 
 			ports {
@@ -2740,6 +2744,8 @@ usb_1_ss2_qmpphy: phy@fdf000 {
 			#clock-cells = <1>;
 			#phy-cells = <1>;
 
+			orientation-switch;
+
 			status = "disabled";
 
 			ports {

---
base-commit: b18bbfc14a38b5234e09c2adcf713e38063a7e6e
change-id: 20240829-x1e80100-combo-qmpphys-add-orientation-switch-afc7f6f25137

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


