Return-Path: <linux-arm-msm+bounces-27022-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5F693BF0D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 11:26:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 285F71C21536
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 09:26:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0036198A1A;
	Thu, 25 Jul 2024 09:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U56l5fuj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C61C198837
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jul 2024 09:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721899531; cv=none; b=RMp74FYAXSIQzESZmrKb1z8BTwjXGyMpY1yOaRkRM6G9ur0ShEGOutEBftemsVemAxj88rNmP0Q4Dqi0++DE5VZ7BJ0Fhc/A/AP5YaJQArnga4p+rmuaw9Ob3VIqV2Zwe0us0WlYfe3fNSLz+qvY8TrZmuNjvWLfQh0JmwlNFr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721899531; c=relaxed/simple;
	bh=ZGyu1iam/f8QMG+ZI015E1GdA61ydsF353p+jP4kVVs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ICn7wVwLgfD7Ao43TTsg9bA5gLlqK0hQstbFkpU/winfYQb2Q1l05OtxSqkQJWETEv7FYplyaXM5sB8BfGcmQ7QxM2EtA4OWqqqH59HH+v1fmPS2TBBntTfkFbf2C6EoC1XfGrSuannBl1VxNSZ/8cqtaxIA/TafhpOw5/4S3ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U56l5fuj; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3685a5e7d3cso412857f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jul 2024 02:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721899528; x=1722504328; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4/XnTsd0ASwIAAtgdCdlniqk+AC1SN901GHKCdkQP8Q=;
        b=U56l5fuj+yt1d2btAunfLFE4yNgx65z0BhFDeoz9/qV3tKu4i5T0bBs9Kutl/MvPXj
         7BzKtStSy6s6FDnRwBh7eeeCnViA8NXqBnsIQwv1bYrveSOwLYOMoGlYK3OhQZVcO3zb
         bYhJVYR2H10bvfoFDtC5oiyQzRDL2dbim8DhUCr6/Q1GcS9u1elVmkFWnhOpM7LjLiVq
         DFnBFhvNu48nExL2xSK9+W+T4664WAVbvyZ3oT6ZyC//wbQBugfA9pqVxYCVL03UHq+k
         OP4f8uoVjlgerVLsChO9d4t+L0TNlQz9lCQi8JcsgNc6lB8dMI0YsrK+VqdAYo+x9Uqe
         /IWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721899528; x=1722504328;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4/XnTsd0ASwIAAtgdCdlniqk+AC1SN901GHKCdkQP8Q=;
        b=O5YbwlEMNCX/q/2Q5MT++FzRzdQgW5OWGpBEhbgy/HZRH31BYEAKY8BTHCm8BrVCE3
         ttIpCZ/w61wUALqtqumYMeOn93P7zoyqEAcIQbf9qEabn/dc2/k7eDRQAqZk2IMwWfCx
         2ZDNFrHNOK11AonlO37njX56ZrkcZQOIomW7YbWCAnKFOaNXovIQgxWURAYnC017g/r6
         jiH/GX41P/c7fllRPimGPQQ2yVS/kR0PHmJT3abnskxeqk1bH4so2NkcD93L1fMcrTup
         biyp3DaoRuO43rXEXa+N6dcVYNJpS8C5iDhfDILv4PzQWxm2/0jvW3qYGDoN17dZMfsw
         lipg==
X-Gm-Message-State: AOJu0YwfG5Sa0GayHmALc8kgSZMQuSm1MU4vFCUBkQCAvPOFJzUyT+Kl
	2YODUJY2RdfJ7VXS0AXVTTH9hWTHpv0BVmhhGJfjyq+RoOBxpMEAww7MnoWUrXk=
X-Google-Smtp-Source: AGHT+IG/tMGsI92gfpm89Z3TfAPnZ4BU6U8GjbpIFbpBW6QWo8V/SjGA39d45G2Rv1td443//OsgWQ==
X-Received: by 2002:a5d:5f43:0:b0:367:8f81:f9fc with SMTP id ffacd0b85a97d-36b31b4d037mr1942869f8f.50.1721899527745;
        Thu, 25 Jul 2024 02:25:27 -0700 (PDT)
Received: from [192.168.1.191] ([2a0a:ef40:ee7:2401:197d:e048:a80f:bc44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427ef3f45cfsm65830385e9.0.2024.07.25.02.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 02:25:27 -0700 (PDT)
From: Rayyan Ansari <rayyan.ansari@linaro.org>
Date: Thu, 25 Jul 2024 10:25:17 +0100
Subject: [PATCH v3 2/3] arm64: dts: qcom: pmi8950: Remove address from lpg
 node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240725-pmic-bindings-v3-2-d7f6007b530d@linaro.org>
References: <20240725-pmic-bindings-v3-0-d7f6007b530d@linaro.org>
In-Reply-To: <20240725-pmic-bindings-v3-0-d7f6007b530d@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rayyan Ansari <rayyan.ansari@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=791;
 i=rayyan.ansari@linaro.org; h=from:subject:message-id;
 bh=ZGyu1iam/f8QMG+ZI015E1GdA61ydsF353p+jP4kVVs=;
 b=owGbwMvMwCXmtuJiX/SRuS2Mp9WSGNIWSbHuXh3wdEa8zo75UaYynOq2f6Nz+XVit+lznOT8e
 UkpfmF0RykLgxgXg6yYIsvhpi9rXm93ErqyveoUzBxWJpAhDFycAjAR2wUM/+ykj/zhNBMP+r17
 zsXFe7SnJh8PW6u2Y5K0fc3f0EvLF3AwMhzKL9fi1Wow4Tc+u/emUZvZg5D9q265TjXVjnK1K1F
 LZwQA
X-Developer-Key: i=rayyan.ansari@linaro.org; a=openpgp;
 fpr=C382F4ACEBB74212D4B77ACA46A8D18E5BC49D84

Remove the address in both the reg property and node name to adhere to
the bindings.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Rayyan Ansari <rayyan.ansari@linaro.org>
---
 arch/arm64/boot/dts/qcom/pmi8950.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pmi8950.dtsi b/arch/arm64/boot/dts/qcom/pmi8950.dtsi
index b4822cb17a37..4aff437263a2 100644
--- a/arch/arm64/boot/dts/qcom/pmi8950.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmi8950.dtsi
@@ -84,9 +84,8 @@ pmic@3 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		pmi8950_pwm: pwm@b000 {
+		pmi8950_pwm: pwm {
 			compatible = "qcom,pmi8950-pwm";
-			reg = <0xb000 0x100>;
 			#pwm-cells = <2>;
 
 			status = "disabled";

-- 
2.45.2


