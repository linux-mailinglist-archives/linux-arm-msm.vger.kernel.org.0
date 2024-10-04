Return-Path: <linux-arm-msm+bounces-33147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81769990FBC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 22:07:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B33AF1C21D7B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 20:07:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F5EC1DD525;
	Fri,  4 Oct 2024 19:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BN9Ss0xr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36A51D8A09;
	Fri,  4 Oct 2024 19:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728069934; cv=none; b=jS1vf+hYxi1lhhHww2x4E8rG99uxhp7wgR736Q8lGLpFjoCgJofWbexLGyME9pVjOvsQ8CbzgSBCidfbXLacFzMpID+KMsMnFuApGuCBD6D6Zml4eq4KzCY4FpmdhfrJYGadXES6uhnSRbDT4shKDrkGdLHJk4JY2d1EWJ7Nqk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728069934; c=relaxed/simple;
	bh=K1FynadGlz7V3pHQQA57EuCuje0t0xMwDt4S8EOAfVo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oNmqjJCmDpphWB86hjd7nqWfNTWy7/I8ZBA68dR9yRQlIhn+b5rKwvvbq26OnT1qHWC30NlVr8oYDSJxVJrjbZisnBS24XXCd5/MizX3neAmUxi/wDcglpzN5Tkk4EqoE1B0KUefXibLKu81z7NxAAAXMBjo/YqDZ4OpWCCEucc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BN9Ss0xr; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a8d6ac24a3bso476972666b.1;
        Fri, 04 Oct 2024 12:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728069931; x=1728674731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TFvtVp7qirynZb3z2+4/4h9Ar96qEvmsqtgrcr31hec=;
        b=BN9Ss0xraVhUKb7edYSmRagGvYPU7GKz96SrmTW4U98Z6SACZCBcxKrKbiV6mbm64p
         cNnBrtlzQV0bCSBbVKWUVb3tTspNi0dFi9H0UER5lK+R/LxbD8/AOmt+FABchPIQbt/S
         fzxj2d/Ytd+zI+apPeozvVUF6oufMl6ALXU+pHb0JM553DIvkTFwHaVspj3OigoqzpMO
         k4hWq3Tyt4hQ/d8hy0bvAeK0CJc/rWfYP3XcrsrkLdHoaDaHGFjFFgKs0ojSOngrYytK
         Axhyx4k+MF8xgD+XJWVs2WaDCKOHbPRob2Uw73/pKftzw4xJjdqNv1PyuTIwEYrCLNv8
         P2qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728069931; x=1728674731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TFvtVp7qirynZb3z2+4/4h9Ar96qEvmsqtgrcr31hec=;
        b=MfeQkuHQUXOm6rpmp3qnioEVlbYM/ExyqeyY8pRKkloGuDcuT3sBc7qgm96hmFw6Sr
         AjXR+IYtAgALu6AahvsVg7yz2OhTrMEw2ABDMyBL4F+Dzu8bLluWSWH5boqA+geK+X7u
         jb5wvgfEM9nFWqlb5eiCDm+ultHy+RQhAmLrGtBZunYVFxyoPfcOlRdRwzCjrq1q2E1t
         Ave8Kow81cb3ucze9iuWLmdI2ucaij2gvkiFDjnBKFT21MrWQ7ceAmNl6MGmmqTgHQ/0
         Jy9fssoseKnwDCL2/3CRE4Y6vjzlTOBOTr5htBZoGWEAaoQFE7uzyQ9EotMU3XQHiJr5
         7EMQ==
X-Forwarded-Encrypted: i=1; AJvYcCULYVsWvM8xhSpBaXt2N0+Pnmy2ldRRJuVImfWtV9A9LwuHZ0q8u8bXSMFw7LpwqKCFnbiO+7KGBc0d/2RXLg==@vger.kernel.org, AJvYcCVEAgo4A4WXNqIF+sMvrSe4tZDWI5j16S3nHGcTr0oI8mORPuf11LVqFMh6BJu2Dwk7NFkxrkzyBhebwGKx@vger.kernel.org, AJvYcCXC8TtF3a4dd4SVE2n0uyAYyBEU3hlBV+lI7AKmKNiNqKt6S7FxXifgGGCoFR9Hw6xRLdBHaHeErA/v@vger.kernel.org
X-Gm-Message-State: AOJu0YyWJojdMZy+kQjz1phqhsWJ8Ewd6q9ytoj/yEr/SgsoB5pArsOf
	zUQB+OqJjafIEXu8z/6rPrgNXWmwzu4hsJ0/0OaYWF67ZynrGQqNO6G7XA/o
X-Google-Smtp-Source: AGHT+IGmho45+TPI13RGkzc9JQ1tKVu2tM0a3OakI2HB6lBsgAaaG0POhSm+BGjnDz5rxq9qO9fNMA==
X-Received: by 2002:a17:906:1b0a:b0:a99:1929:40fc with SMTP id a640c23a62f3a-a991929414amr365172866b.10.1728069930780;
        Fri, 04 Oct 2024 12:25:30 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a311:80b0:1c80:9433:9060:39fc:2954])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a992e784a3asm31136966b.111.2024.10.04.12.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 12:25:30 -0700 (PDT)
From: Maya Matuszczyk <maccraft123mc@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Maya Matuszczyk <maccraft123mc@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: x1e80100: Add debug uart to Lenovo Yoga Slim 7x
Date: Fri,  4 Oct 2024 21:24:36 +0200
Message-ID: <20241004192436.16195-2-maccraft123mc@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit enables the debug UART found on the motherboard under the SSD

Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
---
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts   | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index 3c13331a9ef4..1f292cd4a713 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -15,6 +15,14 @@ / {
 	model = "Lenovo Yoga Slim 7x";
 	compatible = "lenovo,yoga-slim7x", "qcom,x1e80100";
 
+	aliases {
+		serial0 = &uart21;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
 	pmic-glink {
 		compatible = "qcom,x1e80100-pmic-glink",
 			     "qcom,sm8550-pmic-glink",
@@ -883,6 +891,11 @@ reset-n-pins {
 
 };
 
+&uart21 {
+	compatible = "qcom,geni-debug-uart";
+	status = "okay";
+};
+
 &usb_1_ss0_hsphy {
 	vdd-supply = <&vreg_l3j_0p8>;
 	vdda12-supply = <&vreg_l2j_1p2>;
-- 
2.45.2


