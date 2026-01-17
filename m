Return-Path: <linux-arm-msm+bounces-89491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 871CED38C1B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jan 2026 05:07:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CED813034A0F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jan 2026 04:06:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A4F23093B2;
	Sat, 17 Jan 2026 04:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Aj/T3tJI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72EA2EBB8A
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jan 2026 04:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768622812; cv=none; b=kGl3EkGtEuMGrqokqBCTbLwaLKoxyFLd4H+y7YylFWcziAPwE1KBhCI/i9Ik6k8bprSmGwrOevl9hfZynOXCZWnrPoeVB9ySmcXtsi5nYdiGGm9EtuiiIGDS0YZm4eYcbJPi/oBpP9xNcq4T/pELPqNmmQ3Id5n+jm8M2rJaq7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768622812; c=relaxed/simple;
	bh=qdzZ4n+LNV/PsoK+uJu2XlZkWbAHoGmAnFcee+ROIho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fQAR6QFO8m7zsPDlWr9QxnUvFWU8zWZnxpA1zbUrZnkr3tNY10XqPkmMhAHJZU+v/mUcqFh2a32bQ6FD7fy6V6EKEXp7lWiz0qh0afe3n3UnAtkAq3CcZ2hpn3TzwfRqwYs8wsucLSYzXa1o0vrrOU4CLia90La8J8BimSdFhSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Aj/T3tJI; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-88a2f2e5445so33330396d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 20:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768622808; x=1769227608; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ahSJ784Agrct7hUV5mLfOvTi+Ib0YPHnSuXQC3QM7fc=;
        b=Aj/T3tJIVfjqHAgjMCmWBpypr6/63+EAPxUK5+Vb0/sfCwElVsZXqZDdIm2Xc3dY+u
         ztS9zYsGvt89gL/i5qs+HrDEus+igkRiLU9tCYGC6Jq1/ICCFNrBpXn1+2sbT179Dwdz
         R3eUGMZnlWCJ9DyFdMPSjZTBkLrruLui8aHr2eKK2F3gK/CAvQPGGL8zDxt68xQ4rwat
         KX9rdZaDnkRMUtuDOJFeghkeyt9LDkND601DsHGJtKWRMKXKYkqkj56tgOWTBUr/hqbd
         Cd1o14nfFSXNSXKSOl7xZ4HH3gjIniiBKSurs1sQS9hP9Zd+4ZqBhCWrKkoV+a3TXayr
         AZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768622808; x=1769227608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ahSJ784Agrct7hUV5mLfOvTi+Ib0YPHnSuXQC3QM7fc=;
        b=EvVtQifJBR/Dx7ZYyCzr8AEucatRPaCU9g2LIstJtLRgJdW9EV3bJnpFptQ/rhkloD
         Hc2otLeqPAGd1TPzTF9P3oOxtpZjys5uzjNjdJwazxhWlvDMkQ78Ua+aVrZQAcsheHtS
         IVP4PoOSVwOSNwzbNl/AmiIVlDRLNtDXum4R9b9eRfINI6YXSBFItH0HDrOq/r8ej0qa
         J5J6rJMvGyr6pKm3GYfjS1ADdX3XeqTz60tSR7HFHapzPFCJwCX1ZzK+VnQ3nOE0iisO
         3up6BZRi8gtRPOmxqVQ8gn4kG0tAGfzY3Ae/aLyUJau5eDkQ9+O77rZkeGfgWZKJJDz7
         ehVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXT1GTpU8Eyd13+u/7f44KMsv+YmYtHjqeJDNnZn7g2Nejk7GzxOtH5Ns12QuVBNQYshbsA+XUOQ9dCsLK1@vger.kernel.org
X-Gm-Message-State: AOJu0YxWBww9TypflasBFRuj+h7PckT59Qi5/xYw4m9rAE1d7kxQOanu
	A3h4ozuikSwk0B9Dw6eh6Sw+M+5AkKS2icZkHi0acHEDm6Lf39kRjZUs
X-Gm-Gg: AY/fxX4q+GzJnG8RH07gwXpsiZD2Kjofqq5oFTTMFeC8xDnP95ZTbzcjEKUPTR6XO23
	OwFGVOend56pDe1NnITw1JwR9izrzLt+ZDDy9jYKpdAx9Tbyej301I9Z46rq0vKesfQx+QEc+Q1
	n0l9PKMNdqLCdz5S456ppUg3BNZO3oxDtRnk5RFTMLLiaX2Vi0Qmdw6xJIYistGg7RlMDTLhytr
	fGxDTGMLgW6rbLPGmF0Jk505XTKmdbCG3xuBWsdOczZR3ajwSAecZXknOR/zpVF6ZvO/WMaonLR
	X3oQlHI/bQ3DNF1VlCbgbG2UunXppwqArHPM7BwS1zBi915Abi1NWuobyZ2Cmb+Qb6fg4HcIIiS
	ML510JABEqreZtXBSxOERGTfNmAQha2nC4Ya9jlzU9iejliPRP8EsnLgyKyxYTnWgXVlLXOMOO3
	px5WZBDvkZY/kDn1foVJ9Y/HvSYEfQX2GH0SYdmKH1nSoItT6x1C1urysB7ck7W6O/sZea+LuH4
	lQ=
X-Received: by 2002:ad4:5dcb:0:b0:886:3be3:9e5d with SMTP id 6a1803df08f44-8942e2f7434mr76298886d6.16.1768622807837;
        Fri, 16 Jan 2026 20:06:47 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8942e6cd63esm36994196d6.49.2026.01.16.20.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 20:06:47 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v7 4/5] arm64: dts: qcom: sdm670: add camera mclk pins
Date: Fri, 16 Jan 2026 23:06:56 -0500
Message-ID: <20260117040657.27043-5-mailingradian@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260117040657.27043-1-mailingradian@gmail.com>
References: <20260117040657.27043-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The camera subsystem is added for the SoC common devicetree, but the
mclk pins should also be common across the SoC. Add the mclk pins for
the cameras.

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Link: https://lore.kernel.org/r/5135823c-f2e4-4873-9e3a-9d190cac0113@oss.qualcomm.com
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Reviewed-by: David Heidelberg <david@ixit.cz>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index 3eb4eaf7b8d7..f21e60a6a2ef 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -1196,6 +1196,34 @@ tlmm: pinctrl@3400000 {
 			gpio-ranges = <&tlmm 0 0 151>;
 			wakeup-parent = <&pdc>;
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio13";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio14";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio15";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio16";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_default: cci0-default-state {
 				pins = "gpio17", "gpio18";
 				function = "cci_i2c";
-- 
2.52.0


