Return-Path: <linux-arm-msm+bounces-55078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F36AA980FA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 09:32:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5071A17B158
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 07:32:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC8142741C8;
	Wed, 23 Apr 2025 07:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HAj6aLjx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82A226B2A3
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 07:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745393441; cv=none; b=asVG/RTAtCvHFWwVVUmy2KLwhFQ6VtQFKYo4vHYAc21GOtYySE5DDTRBKtOHc1bfI6H11XPxizMPYAK7XjaAoxkjZcijMCYKWgQSeAm23Ww6KfG+dFW++3MYsyj8+PNHpNYr+QF1K0UxqqafWS2dJSv4uqVszTSlD54WkfogRpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745393441; c=relaxed/simple;
	bh=S6odiCi3j39rnfA12G7xzuyLfwGU/y2NQFlu0xGB+Pk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BuTvlhjMibK2GPqMf2SBbrjXBCspsD6dZUSVP/Nk/EFSIoQ4/LD5RlC3b7wgG6A0Fp2gAT0CNOpiyn65s+YxIxH8RyTHBEYyChmEg8bSjQw8+NU191Rt4q3A+65dTMrycGhp5x3nw3avC3gVo0CF+nvBWZPnqxUmcSPu49u8G8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HAj6aLjx; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso42090055e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 00:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745393437; x=1745998237; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tF1AwFDumw3UVNit2m0kQw0zJqe/q3et1UYoR7HMBN8=;
        b=HAj6aLjxPKuGNF5YNQgPOGiCxkeyU58aJuQ+aiy4L9HT+I40xT2tfilpidUDFmDIf2
         L89aAp2Hzb0/W45cFpV1GvDOxGIbLagG3UFLI2cU2UNxJs/obmda7LHCuVpmvP1On3f5
         taB9l1juYB6Q809QmC04Dki+K+2RS7LubunbZtH98WpQdnMmOxMu/LmUSYo8tJ5XFbDl
         7MfO+bv5Vz8t+8AZ+XckE7JbGYcI1hnTVVOpAhtWS903dy9Cld/XoY+nCuyqXZEPM7y9
         s6OzQPqJgpxS/BH7AKhijDduunmDun0XBL2dxMQ0CtOr1X1A6/HpN4pdTe3Qe+dckRKV
         /cGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745393437; x=1745998237;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tF1AwFDumw3UVNit2m0kQw0zJqe/q3et1UYoR7HMBN8=;
        b=WBbl+zGuaXII9ZUy2v9XbR7iS2kN/MmrCxfNc+mtTzyvL0vZk65hHLYvbgsg4q70Td
         5rLs20P52UvCWYCiXcoTfEZq/qtYyv9keiJfYaC4YEejWMJ6WH6r2DyDkAWQWjcPL1l4
         YQH9qfl2PFd4OCw5GdLhv00DOQQIB66Nairc4vYRu1ZK75BkJ3aU6q7x0Tm3n3y3UxwZ
         lipx7f56JEfu/MyKsjG4H/w2E5Nz2ly+PE43w7V+eSRHHh61Mncn2c1Fkj17ZC/4twZd
         3VICAK1SHeRLD6cReBB8pN3RzX0qBMPBaNnykaJByRj9auUW1H+exn4MNYCMLPQLtODs
         9u3A==
X-Forwarded-Encrypted: i=1; AJvYcCXAgs0o7bKW9LRJ9K0xIvyulL6+b4zTLj6nfa7Lwac3wRCREZpd+4ARf/JE4Q7nCPdVXV/2K13qr0KnWKos@vger.kernel.org
X-Gm-Message-State: AOJu0YxjCu+7eeaz+VhE005I8dpbe/19xhQJpFXO9QknLj9Q533OeZGr
	UHNlWjAL1fxzZkFoaggacvEnjF+2GdMh2nynyY306XaMD595um5PgT6+7rtOCyk=
X-Gm-Gg: ASbGnctr8A0j3EQj7W94mshOqZYL/v3K4v3mN9xjqSo3TQx6fTFatflgYRIJzMizGnZ
	cxJHFActruchUm+HUjXgbdfKdoe90XHKYOfYATv9zO91O3LsHKFpXbKEpXBgOXxGxCdfA10F/bU
	Utc2Mk/oW2aIdKIsz/ohZHnuUCAsdol6rwCHOY5WyZ0J3n6B1gJwws9OWTEjO1sHRrbbojyKtKs
	kPuuhQWz1sILQx2sO4hR0rY3KhvZGG5XfFQiB9ofIb9MdtNTAtPT3lXN56m5eCeXXZV4Lt8zAfg
	XlYAauCrQoCbyK7HFILEb/SYT4hku1vsdMSvltuHpbPRbgTpJ2q/lkk=
X-Google-Smtp-Source: AGHT+IGUNupoHscjHh6R1ET7M+ji3vwdx1hKnT6AJp3tTymPpE723vt3TtbJSrUt781amFhWAPXmnw==
X-Received: by 2002:adf:ee0b:0:b0:39f:b62:8cb2 with SMTP id ffacd0b85a97d-39f0b628d40mr6545976f8f.38.1745393437079;
        Wed, 23 Apr 2025 00:30:37 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:67a8:3ed8:e19f:5eaa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493115sm17761699f8f.78.2025.04.23.00.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:30:36 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Wed, 23 Apr 2025 09:30:07 +0200
Subject: [PATCH 1/6] arm64: dts: qcom: x1-crd: Fix vreg_l2j_1p2 voltage
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-x1e-vreg-l2j-voltage-v1-1-24b6a2043025@linaro.org>
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
Fixes: bd50b1f5b6f3 ("arm64: dts: qcom: x1e80100: Add Compute Reference Device")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1-crd.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index f73f053a46a08d875acdeeef9ac195a9b857ae3f..dbdf542c7ce5132ef37a68bfae293a09488b0a0a 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -846,8 +846,8 @@ vreg_l1j_0p8: ldo1 {
 
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


