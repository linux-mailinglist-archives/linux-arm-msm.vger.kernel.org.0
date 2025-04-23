Return-Path: <linux-arm-msm+bounces-55080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E75CA980F5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 09:32:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12F66188BB85
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 07:32:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A5AA27467C;
	Wed, 23 Apr 2025 07:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yZw4WBUz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C400D26AABD
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 07:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745393442; cv=none; b=UxsTmZXFyJfJqbJ1cR7u02gSiJPV+WBjCgvOeAhrWZ2ZUTk9YVUZ8pgzOwkQajvFLE3toc+Ezz66EdZ1Fz/vigTfDO0TUStjil4Lfp72fn8di/NzoxSLpsziKbms45KWDFzXRKqUv5TL2eiT1qRciecaj9tB6uKYc/xGk2rMeEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745393442; c=relaxed/simple;
	bh=OGFPRiVeOp2qKkd93z5kF2aUIB4+PjN1a56OlgE6zuk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rAmDUdOH3+ORwigl+LQEca3l8PQMRrfe4FQ/WrMXrPCKznLIhR+EH6Lovr4z6NkMG+cKUNc/d8pWja4QANNBpF2ZsAP5ivSN4XZt6fhHnBzY/pmzdw8uTkJfvuD3TXjDh9IsDJk/q73xiG3jhZMjlpy4bASRyW2lforLWOoP6TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yZw4WBUz; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39c266c1389so4476026f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 00:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745393439; x=1745998239; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AEPeEqZil/T5Z7MPC/u/BIquWlke76+jXR6HQnUCPNY=;
        b=yZw4WBUzTiFbv80E63+PH0vaCUOlWrxq8YSh3afFu4DoGPO7w7bKkctbbT5R0hgjkN
         2TClTnTUi7RUh+VwMLvcM4IJCKBzrGYkPockbct2k2xQvQz0Pi4SGxLU+ohxrxPSoWYv
         JllzwaoQnoeCUIQcbpOey2M/qN2vae6jbi20fhpsm13yL4DUwdGjpt7qKHApv2fTWgA3
         FQSvhquFZXIWhdZ6iMtUU/mxeXGeZdm7SQHpcv61jqHvc17NizLdWaIEU93aRcGG1cQG
         G60vAVKfy/3gZFvyiQh1Q6eQjZ2QWBH5oyrVCQ9NIvisztJ/iwLCMjFSk+p1SMR9JY14
         t11w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745393439; x=1745998239;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AEPeEqZil/T5Z7MPC/u/BIquWlke76+jXR6HQnUCPNY=;
        b=K8lVkiXJA7cct2bIGJZpzA8GxL5rAenV1ClR7N/ky3GjPigjIBwOcsJ1E44+aIG+iN
         yD9pzP/qAN48ML3z2opwCARkXBLsiPkEEIGT4ka0TRPGrUUI1RStpaELoCAF/QAfmzlR
         K1JwXBS5xSunRTsTOP4y0ki4INQBh4A9xC9bco/V4aJZw6NvcTHUwCZQrYvyWM38KdoM
         erOSzC2ryOZpKCABnBkdu+tIEMuf1hrM2OzgWPCWQ3jwAhcjHty4Gvt8LfUez1mzmoME
         8tMvyjhIm9KWbbZ1BUKoUiBwfy4lffgPo9iUJi7Eebu6VDGNuPbvYzthhZ8FXEbJrm6u
         r6pA==
X-Forwarded-Encrypted: i=1; AJvYcCVe1Ly2gVxL79BcQYY/oWbIKEqu5pMG5yNQHtiMLqIb9rT/OVwdV05Hqpa88Fnr1Gwy03cfEgk3ChTiArlJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzeB6G1bYa5JaniYO0ZFDZg3XsfjXayZU5UJwDj10SIrZffK4Az
	TH5MElsEvR6atq2pOXtzD/zzMxDQgLHGdgBT4Ir/PLtAQmWR1PYt1YR6beZzJNQ=
X-Gm-Gg: ASbGnctQIYUD1B3VPdWPIUNEvVe6r4p+1XDx3/JsHYDgMiRHwxQoCzXUdhjIVjarDH+
	NcmBs71500btYz4TFQoLPEpa/tYrqRUN/xLU6Exqj2nqquxAAHON3VPUluLqRT9UtwNUT2mX5Hi
	8TwItzaHnDr8iT1tsSVEiawUGIoWFuQhQp124+aVyVZ1pm0yeeHH3YMMZp1wbKtBYzftpKKXrJC
	vLc1Dnw4CiOXG1Sft11PSxxf0p4IyPVDkFy05GrkEj7Rq58a/uIVOF6JPRTzauIKLx4SAmaZHvK
	9tBRainSp0kH9QkkT13gwM2tFR6neW27L6T9/GH1kY77G86ZxWwQwVc=
X-Google-Smtp-Source: AGHT+IG8wc8v/scENBbWgZ3YLGA2Q8Ik+3Q6D9mj1DGO337fBhfOQlX35NB9ynMbOYJsc9Ex9XTJbQ==
X-Received: by 2002:a05:6000:1448:b0:391:2db0:2961 with SMTP id ffacd0b85a97d-39efbace3d7mr15158756f8f.38.1745393439032;
        Wed, 23 Apr 2025 00:30:39 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:67a8:3ed8:e19f:5eaa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493115sm17761699f8f.78.2025.04.23.00.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:30:38 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Wed, 23 Apr 2025 09:30:09 +0200
Subject: [PATCH 3/6] arm64: dts: qcom: x1e80100-asus-vivobook-s15: Fix
 vreg_l2j_1p2 voltage
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-x1e-vreg-l2j-voltage-v1-3-24b6a2043025@linaro.org>
References: <20250423-x1e-vreg-l2j-voltage-v1-0-24b6a2043025@linaro.org>
In-Reply-To: <20250423-x1e-vreg-l2j-voltage-v1-0-24b6a2043025@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Sibi Sankar <quic_sibis@quicinc.com>, Marc Zyngier <maz@kernel.org>, 
 Xilin Wu <wuxilin123@gmail.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Johan Hovold <johan@kernel.org>
X-Mailer: b4 0.14.2

In the ACPI DSDT table, PPP_RESOURCE_ID_LDO2_J is configured with 1256000
uV instead of the 1200000 uV we have currently in the device tree. Use the
same for consistency and correctness.

Cc: stable@vger.kernel.org
Fixes: d0e2f8f62dff ("arm64: dts: qcom: Add device tree for ASUS Vivobook S 15")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
index fb9567817be6f887c9214cafbfbabda8b8cb8203..c94ddba5fbf1cb8ab2bf841cf51ac3553e1f95cb 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
@@ -351,8 +351,8 @@ vreg_l1j_0p8: ldo1 {
 
 		vreg_l2j_1p2: ldo2 {
 			regulator-name = "vreg_l2j_1p2";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
+			regulator-min-microvolt = <1256000>;
+			regulator-max-microvolt = <1256000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 

-- 
2.47.2


