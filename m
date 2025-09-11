Return-Path: <linux-arm-msm+bounces-73171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BB2B53BAD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 20:39:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5A3037B9E1F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 18:37:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 900282DC79D;
	Thu, 11 Sep 2025 18:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NlWFOPvr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B16E2DC77D
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 18:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757615930; cv=none; b=FrnRlyTOc/yTPHP1XpZccu4DZqphUTIajhYUhKJD4k4Fpuu/M16gt9UW89QJX8dD6K5fidkcu/aUDx772cC9yKWxCPx5eLE4XuqCj0tDxgs0GWKNv+f8v7BhUTfx16XmsJyaSGWAbhg3XJSbJ9M43Lk1VMVK/L2pw2whtBwhUpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757615930; c=relaxed/simple;
	bh=CivzybVT6femLa3DyANzOoNr5Zw6tJRLE5//4WZ20nw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T4BrRN1bl5A/PKLJwAgJCp4oi8U1I0smTIf5liVTZBfj3psyMTCg/6rg2TZo2UD3F3VscBlSL0t1zVDIsKBZMJhA2DvqC5+pOUGAs1CRF6YIkpwUGyjQ688yuqO/xCrDrIVpEtZe+hL2vyJ0JDD5xEKnonfkZASciJmrLmDo/oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NlWFOPvr; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b00a9989633so218640966b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 11:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757615927; x=1758220727; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xFBNEsy8Ttzp7cjciSXICukNb+BZxKqaUl/2TE24rqU=;
        b=NlWFOPvrKIoC3T4X5bM2X87OEqr8V+WnrrMlNDUTv3sJmRhU1Xbwixo4mwfjDzdlDJ
         3F+J4P59MEch/LkMSZn3rF8OtBq9VXhVz61ZcynZJ4uoR4mhCbS56Fhf85damWcO14Mb
         V8yuWcrp3A1heDS/7lHNwGINBuyc0+63bR4+uByOIY08+aYuiTBbqVPLvH+Sw0M6gzJf
         Sxabw/MgQNFJhL10DN42plaYeprmjnaOZxZLxsfKMPIfDcaJ7htyyOx6fiplt5b4enkf
         +LJkIi715PGjccXb9h7irMBQ1GXZJnHtb3+zvpd0A3j8ddku657epv0ju/HFEDRs/t6U
         7Nug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757615927; x=1758220727;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xFBNEsy8Ttzp7cjciSXICukNb+BZxKqaUl/2TE24rqU=;
        b=RL5lHl2D1dhf2k1RVmZAoQgwqiUuTFLv03h7IocvI27Es87fzeNGvg7HcQQmHP6BjE
         hmfa3wGVVKUj2y0CrK4RqP7M7zkZrgvJ7Ne20bZNXkjQ+uG+PUQxUQYDAI4wZdL7hWZB
         FhicCvoVEo7o/Wdoqv23u6js+f66DTgT3WaLqyRvvGOrZRTqGD+rt9cg3jflPjabHTSn
         5Pass2l6F0o4maCsfxxtrXipDxwV3KuhonUBK1tG0C1BRFreVGOTJQ9bFrsCVF0R1F2C
         AYCejzcLi5NzwuI8UrDKpHqAmm5ZFJ2EGvbdko1EmtFNKdZNOFCDkIC4bIzK5Am4+v4v
         BkOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUveRzTL+EdcnI/EoeucrQu3EUd6YmDbQWL+8Ro5s9vTG+NHMoPNQ9JNGLD59TdyBanzz/Ei+fpvG893OoC@vger.kernel.org
X-Gm-Message-State: AOJu0YyE5EddmBSO6utx6cgBV54Fk65PJXvWT0P17XKhGJF82d14crDE
	BWD5CEB1uPpwpZ4fjviPmcgnKXDIdLRhD3kD8hxOKkWbFmoYcvEcUkyc1F8VTZVWvMw=
X-Gm-Gg: ASbGnctGov6YePdfs4i9GM+vglC0QYZV3dOLEq8ZLsqo7z+8IV2lAvpJPyUAEOFXtDE
	vt9EjphxMmvdgQ3wM2x7rwAG+y+Y1LQaxo6ERgtuG4Gqo0GJfoSiq6YPrq74MHAPKnQGwStnf/Q
	QJtdOIMmh6HjEPQBrATQSBCPtNqhPA5BXjFSJx/7u2nEDK5wa7LVFCGvMnlqhkqSv0wL9IRFUbj
	AqjTZ8REJygj/aQfvqZRBUlD31O8duH2kIyJ/MILldSTOPaUFZb/ssJ9Z+jgtMw4gWTtNEEx6m3
	vscrhehenM1FeRHLCieqD6YtiNRzkQ1IYno9fEwYiOVgb5AbRr1CQ/WwkMfvNFl/qAEGT5aiI5c
	6FT7s+n0ZaTxhyfrgJpK2qqf65tMujsDW0M9ljJOZSkjdhDSzQSfAex0=
X-Google-Smtp-Source: AGHT+IEIEJ/a6KzzrDZCaJ+KLuB4J/84EJLHbvJ08OMC1rr6H2HpSczkvwGDXTGRT+cJBZWD51EhQQ==
X-Received: by 2002:a17:907:96a4:b0:b04:25e6:2dc2 with SMTP id a640c23a62f3a-b07c254393cmr35772866b.22.1757615926925;
        Thu, 11 Sep 2025 11:38:46 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:41:725:1e09:bed1:27ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b31715fdsm183999166b.49.2025.09.11.11.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 11:38:46 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Thu, 11 Sep 2025 20:38:26 +0200
Subject: [PATCH 3/4] arm64: dts: qcom: x1e80100-crd: Enable IRIS video
 codec
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-x1e-iris-dt-v1-3-63caf0fd202c@linaro.org>
References: <20250911-x1e-iris-dt-v1-0-63caf0fd202c@linaro.org>
In-Reply-To: <20250911-x1e-iris-dt-v1-0-63caf0fd202c@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2

IRIS firmware for x1e80100-crd is already upstream in linux-firmware in the
default path, so enable IRIS for the CRD to accelerate video decoding.

It looks like the X1P CRD might need a different IRIS firmware (possibly
even changes in the Linux kernel driver), so keep it local to the X1E CRD
for now.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
index 976b8e44b5763b2d6c0f4786bf5809fee29dcecc..dfc378e1a056a8af27ef4b646f7589e7198dbaf8 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
@@ -16,3 +16,7 @@ / {
 &gpu_zap_shader {
 	firmware-name = "qcom/x1e80100/gen70500_zap.mbn";
 };
+
+&iris {
+	status = "okay";
+};

-- 
2.50.1


