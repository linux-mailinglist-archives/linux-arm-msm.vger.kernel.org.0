Return-Path: <linux-arm-msm+bounces-20829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8058D2635
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 22:45:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 356BC28FEDD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 20:45:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D42F17F36A;
	Tue, 28 May 2024 20:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cExVx9eq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E68517DE09
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 20:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716929024; cv=none; b=qSl8C2LI9GRwGC9ahyegJVR/nAP9F582wtNJ2uD6f4E3GhyOix89Qfh7lcBvUCFd0Upd90zpavZ9AZnsyhiTeqem1vAQDYbNjpqsT5b0WfU4Uy/O93mLu1hcHP0rHq6ErrapBFtMjrZEfhH0uQvWOK8ddH/SLUSYmZ/aT3F1SnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716929024; c=relaxed/simple;
	bh=07w4w+wcz+s8WoLWWVideIAadh1jMDKIz4U0xNk1izU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RHPq+O+V/oeNdO7xKBH8AHyqEmeERMIybIG32UjpoyBAwg+6NS8cH1bHWkqsdfZEaloJNDO59CDTsKTHZ2bkAcYQeXwCu6OrCnT2lbU0ArdLNqWmeFYB04/WjlyWZasoY8TOPiFdhrABwdomTASLVIxYjPCUYrr8dWzil7m7XRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cExVx9eq; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5295c65d3fdso247586e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 13:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716929021; x=1717533821; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jnc5iU5guGKDIIwBfgQZYLnSXcG7LxADDm3Oopk5kxo=;
        b=cExVx9eqjnlbOmrAR8mJcq5WX8qnNs4jmLufT4q5bGUXHibpkHqC4/8Vozhc7IU9eQ
         FMGBCbEfKMIDi6bG51ipKQ+LZkdtdmLmwVrGpGNX24MRt+lcDRsNNfHppeG/MSKTbhet
         Z1/Eo+pdHXl4v5Y/2riXSPu+xYNhpqjajlA1mamQfazKHWCTRwHFPY8us/IzJMUCAsVt
         hz55Pfqi/fv2RAFqPW29+qP1ScT8aBCaBJUJkUVHFB/UwJ989JSIWBnwd8Hxs8B/vmhI
         a9jURHe78BxvmPLniNu18APHrycK/L2HIQaPIbwDeqSJYx4GEpzwgBsNvnzV0Zl/NM+D
         94GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716929021; x=1717533821;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jnc5iU5guGKDIIwBfgQZYLnSXcG7LxADDm3Oopk5kxo=;
        b=Yx/KMMJFAZ0jZJhEADpfCj/djUyzYFuJHwukl68CBE8s+CRn4jfZKtigNHCojJ9iVD
         Hcsbmv+OMjwre6WZlN9T85ypiEjDYn5frj1RHIk0pY+XBasYbA9xdhJJ9gpcI6sAiUKd
         X21KSHDMKj2hvQtn3C+5othUNzS02KNJXRY1kYDiMSvgXj0dS3kwA3vYuKlJO+zhIpTE
         lpP+QtDxvU4TXpb+BfpXbEOyYxiZmyfAAmlV9Qyg1+XmiDNnpinuFXB7rt//oQ9P1Tw8
         f1pM5R5RUsGsnmOEXzY0Wm/TW/isGwOBCU6ie77EWX9HNNVctgDnC271kYxnugAaq6Ny
         Z0XQ==
X-Gm-Message-State: AOJu0Yzma3A6XgKtw3Iwhxh+JNhDMyhlfAzgMIrQr3lYpmDbNlqwVEJk
	CWATHh6luPmtRG9S3MYu/RZLJGaf/SBUWE7FnNr3XQ8kLDD5GDJw+cPliRGxSxY=
X-Google-Smtp-Source: AGHT+IHcIoMb9PrU5vj1YBCtrYjK933S36hCq6C51LCaF3OkaMGsIdxzkjZ0rhqKdYTBNrJV9tOx/Q==
X-Received: by 2002:a19:7606:0:b0:520:ed4e:2206 with SMTP id 2adb3069b0e04-52a7900dcdemr45781e87.17.1716929019918;
        Tue, 28 May 2024 13:43:39 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5297066b885sm1095493e87.127.2024.05.28.13.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 13:43:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 28 May 2024 23:43:24 +0300
Subject: [PATCH 06/10] ARM: dts: qcom: apq8064: drop #power-domain-cells
 property of GCC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240528-qcom-gdscs-v1-6-03cf1b102a4f@linaro.org>
References: <20240528-qcom-gdscs-v1-0-03cf1b102a4f@linaro.org>
In-Reply-To: <20240528-qcom-gdscs-v1-0-03cf1b102a4f@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Robert Marko <robimarko@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=816;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=07w4w+wcz+s8WoLWWVideIAadh1jMDKIz4U0xNk1izU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmVkH1JVlxhFsDmBqnNXEoEupNMoWbv0zsZYUHR
 jq6uLZmgu2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlZB9QAKCRCLPIo+Aiko
 1bjAB/sF2oaL3QqTuQsxtb9JRW5yMofX0D4ckQRWhuzF65jn3xqEN/qhCXu55vcV6F0wjNScKXQ
 112dQQMozsVEC2O+qlcCc3nOpR3snwQ3ENZwQJ1gLB3igSOGD0XGtmv5m0t6zgdUNKncRq4pQJU
 JjIzct6TiCB5maUvIcUA4vrJE7ot209GHoBEdm0ku/6yu0bs4bbp4MeR+wUuQGTOUBoPX15gAPq
 mTt8OcPoui4hGQz74B7RMM5pCCyxwZ8MgSVSN97MyckDX5xesU+X6x/QRFxg0vsyKj1b6q6KdES
 obR11jgG1szbRyaF7hjDysMlvJSCzVXfOKOBgRbQuwwh8iEj
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

On APQ8064 the Global Clock Controller (GCC) doesn't provide power
domains. Drop the #power-domain-cells property from the controller
device node.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index 11e60b74c3c9..178a3b424670 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -684,7 +684,6 @@ gcc: clock-controller@900000 {
 			compatible = "qcom,gcc-apq8064", "syscon";
 			reg = <0x00900000 0x4000>;
 			#clock-cells = <1>;
-			#power-domain-cells = <1>;
 			#reset-cells = <1>;
 			clocks = <&cxo_board>,
 				 <&pxo_board>,

-- 
2.39.2


