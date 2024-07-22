Return-Path: <linux-arm-msm+bounces-26796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B1D938E50
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 13:49:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC2A4281E74
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 11:49:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6C6416D4F1;
	Mon, 22 Jul 2024 11:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nj4RTrxg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE2716D336
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2024 11:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721648921; cv=none; b=oHF7028W9KNmHhJPMgwkk4ua+l444QjiQJJzjW34YMxdRXvdsRIptHFQpeBuDgSJ1KOoW3PUO5eGY8TIg1p55lxj4cnyOXAKe+wHCTtOLU40Z6scDXGi8Ah87fUWS0Oft5s8CwKiIzAS1aQxu8S1z0csyg37Zd9f6D5iCMeYHvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721648921; c=relaxed/simple;
	bh=wD61BJEe+DtpldLoB47C2K14wZvHYpFBbqDwcS8dm80=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h/po8OETo4yoCNlKG5iMC4ag7vDfEu4MfD5lzr/56bZBk/VtrEmso0vjfcKtF5RAY5PeIN8grOdS4m1fIvYJ+ZWS9BZN08nbIqDdRwIyJrvDyDBEhBjWyqePRyzUHDOR7det7EaHOswpRnUOKpOT8islrMO97jqIyPqNuiMV55w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nj4RTrxg; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-36865a516f1so2918972f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2024 04:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721648918; x=1722253718; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dEQhJ8RmyEK4utl0P1w5rhlSQbA/Z/BVuVsMqnisRQs=;
        b=Nj4RTrxg0pEDFOVQXXBRrYHUGVqlyOio/Qr1x6elE+hrrA0k0WF3HiZBX0FvgVGvHZ
         HNNsFkKR33443N3rJ59zYRyeZS6MIr9lOeROl2Vp8U6U82/MkXdLHYxxvk52qmG1sKSf
         sRPQVxDdPWMlz3X77ZReyujv2DTj78QvKbgRTZ5kwfGlaiOADB7ZeExnfAiP1q3IXNtV
         7KN6LwVRbDWKzjAvADdoVxHaeQNiS0xsY09r1k4Dc/wsGNqqg9MAFnaAHXfnLKmPIAoj
         hV1xZ6whDqLH4K8Qi9zMNZSIkWRH0TAkYyEVwe2RgD/Lwp5HWB7WrpDMuAZ3a3OiwKEe
         fBHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721648918; x=1722253718;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dEQhJ8RmyEK4utl0P1w5rhlSQbA/Z/BVuVsMqnisRQs=;
        b=d8QOGHmh4WeOfX6ZntPEQvS0FbAZeWhcYG6sfdO+fzPWH3h9mAfUQtYI7ZgMMT5e4Q
         hAee0BKDN0Ua/LA3stCzlwTY0SYD3jiXfJ/1QZgLFmVBoWGVUjJBy7h0iaPaQMNZyrMo
         542ZJwRezkEEME60qqVVjZBAfyHsm0aqsw4riuT9dwhw6pcbIdGjQeGBEbSB2/ef/0mg
         8Kja6tuuJ/WhY4f1Xvb7ndEPqys+uxrAcAYJGjEheHzYDEIriDgInBCkMZYQ2RpuQi7F
         rDL9bsfeH29NtooJE/o/sqRMORzJ3NcVIjbCEVrwKkGUvBkojINnhrpqFMR7X/V6UcwK
         oR6A==
X-Gm-Message-State: AOJu0Yx0pherK9DxfmUU+wAAsWIm4EDuRgLHqFOTHFB81rgpt5bW9xNd
	nQt/r5AoPtAzMtTXXbPzEZXEK7Dyh2pS5j6DHB9pt0oVgmIGfoe6ikj15F+ZGInOCTNh6MYA1K6
	D
X-Google-Smtp-Source: AGHT+IGKpS0nQgbe/uD9XJhIjoMoaBtib38Bga2oF1nh093dMGjT066HpoZP92R6DX5gbx4KE+COVQ==
X-Received: by 2002:adf:ce8e:0:b0:368:4226:407b with SMTP id ffacd0b85a97d-369bb2d6213mr4881462f8f.61.1721648918141;
        Mon, 22 Jul 2024 04:48:38 -0700 (PDT)
Received: from [192.168.1.191] ([2a0a:ef40:ee7:2401:197d:e048:a80f:bc44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d68fa17csm125681235e9.2.2024.07.22.04.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 04:48:37 -0700 (PDT)
From: Rayyan Ansari <rayyan.ansari@linaro.org>
Date: Mon, 22 Jul 2024 12:47:57 +0100
Subject: [PATCH 3/3] ARM: dts: qcom: pma8084: add pon node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240722-pmic-bindings-v1-3-555942b3c4e1@linaro.org>
References: <20240722-pmic-bindings-v1-0-555942b3c4e1@linaro.org>
In-Reply-To: <20240722-pmic-bindings-v1-0-555942b3c4e1@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rayyan Ansari <rayyan.ansari@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=998;
 i=rayyan.ansari@linaro.org; h=from:subject:message-id;
 bh=wD61BJEe+DtpldLoB47C2K14wZvHYpFBbqDwcS8dm80=;
 b=owGbwMvMwCXmtuJiX/SRuS2Mp9WSGNLmuQvXRL8Ifr+cN2lii8vj+svTnLoWVdk/fJAxQzplv
 T3b2nmMHaUsDGJcDLJiiiyHm76seb3dSejK9qpTMHNYmUCGMHBxCsBESusZ/mnkP75zcvLWF4pr
 xH0u/dq04Z1/k3cEr83DZ2UT/zbXSL9g+GfBzuvysn210qtahgmv3Yp+cdu+k6gs3RjiMDcm/sd
 DbgYA
X-Developer-Key: i=rayyan.ansari@linaro.org; a=openpgp;
 fpr=C382F4ACEBB74212D4B77ACA46A8D18E5BC49D84

Wrap existing pwrkey node inside a pon node, to conform to dt schema.

Signed-off-by: Rayyan Ansari <rayyan.ansari@linaro.org>
---
 arch/arm/boot/dts/qcom/pma8084.dtsi | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/pma8084.dtsi b/arch/arm/boot/dts/qcom/pma8084.dtsi
index 2985f4805b93..dbf7afcbfd8b 100644
--- a/arch/arm/boot/dts/qcom/pma8084.dtsi
+++ b/arch/arm/boot/dts/qcom/pma8084.dtsi
@@ -19,12 +19,16 @@ rtc@6000 {
 			interrupts = <0x0 0x61 0x1 IRQ_TYPE_EDGE_RISING>;
 		};
 
-		pwrkey@800 {
-			compatible = "qcom,pm8941-pwrkey";
+		pon@800 {
+			compatible = "qcom,pm8941-pon";
 			reg = <0x800>;
-			interrupts = <0x0 0x8 0 IRQ_TYPE_EDGE_BOTH>;
-			debounce = <15625>;
-			bias-pull-up;
+
+			pwrkey {
+				compatible = "qcom,pm8941-pwrkey";
+				interrupts = <0x0 0x8 0 IRQ_TYPE_EDGE_BOTH>;
+				debounce = <15625>;
+				bias-pull-up;
+			};
 		};
 
 		pma8084_gpios: gpio@c000 {

-- 
2.45.2


