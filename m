Return-Path: <linux-arm-msm+bounces-30994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B7796E00C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 18:42:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AB4E5B240C5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 16:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F87A1A0BF4;
	Thu,  5 Sep 2024 16:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MAM8jn0c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7B21A0B06
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Sep 2024 16:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725554519; cv=none; b=j6LHw4KFhvlpVzp6vUz3ObFhkWmDSSbX8oM1sFD3/IhP2ee7q0x8L1mntug1xdYSz76kE2H79NoI3Ub9Ujaat79FU7jsb65Vf3sx9V2ZXhpgSGP4nXe3bSbVnqgnCp8T79n3orxs7ec84yYcKPtFeMARbK4Myuq5tQmK6S/gaOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725554519; c=relaxed/simple;
	bh=Df+f94eTmtd8M71QfZz7Mr2exyp+VlvM4cUESxGqcg0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oQvYHDnTWORMVzfbZfg3PXFeNEnksOjtk+Y5zr+KmZnlXFosaGeqpuwpFCsPDLgFIbYQMHyUzvB5GLM8bWMga42iZ/v/Xe7rCwPrM0wsQKMEy0ao5DK9L91Dma9Kl15fibnmHZHlf6A+zSA6a32IBdJQWtse/lU2a5SIjzCVdYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MAM8jn0c; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5356d34ef19so166796e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Sep 2024 09:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725554516; x=1726159316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p3JBUQ7jHTE/FgZRB+XWIAgRtRxZUTOLo+A5MSb649Y=;
        b=MAM8jn0chtbRpqV/99DBS2bR1FsI07BR1XbCdCq85yrHClVdT36fdmLQ8kBbok1jLd
         Gv4duWNshc8mqonGBzBonhghbaVeFhWepJlHH2N1d5c1nen3SOja91rZA4kH1asPmXbj
         zJxvVbkrYo4NtRUJDmidM425ybcTXA6xP6XmUZC7rufL7g6A1FkGqIyjRJ+eJE6tj1Ph
         /CU19f0O9X3sQ4wJfeokjxjs7larJh+zrNnOdpcdUXFuozKTqUgEkAMckrvE4Zxnf2M9
         U90qwd8bXV+wzO5QmP2XdR3oXnZcPKR+tFF1y3CEqiOzE90KdVaHJRBDDg3Jpe9x17mn
         9QRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725554516; x=1726159316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p3JBUQ7jHTE/FgZRB+XWIAgRtRxZUTOLo+A5MSb649Y=;
        b=fwkGCtzbpy0CdzP/0ZXTODukHSKKhGleSPTrU1461vyIJYjqwunEZFdrHmjzQXhrcD
         2MXFzCgsMSPJKHVQc2ZgBvOKuUvtW6vkpWgBBS95F20dYr+uMkCqidgJJ/OQ6VuV+F+S
         x3Qdn7naMuh+eNcZ1TP/x+ayTB+HXZDH6+bJxVARQFvrp8yPsyc2HwPoH8vkw89jGRNY
         e/gnahGPHx4Pv0ofWuYx2PW5kZyLwneCev4RYmIlswB7pEJU5AX6ytlPT8Zyosx1UT2+
         H2DJ03cvynjXbiKiJHniFMlLMrhE9uhJ0ZWMAkQngECWSALmS3uaiSKBlnN8btORg1uR
         gk1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUGfpW0IvIg39DWSvxDQIgY+sTgsh7I6swLnt1HHSa5ddZTMZ+K2zA/iUjK7fbAOf92foW1ZC6Bwrfz2OxL@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9Il1Kd+5yTUQcCkm+Y0SJKvpWWJ1BIPFN55P8/V/DRBCqKRTO
	6VQWGNNuJm+vdGQcyXLSPd+rpTQLKq9QOnUVCj5fQseg0V57RFKQv2n60A5zsjU=
X-Google-Smtp-Source: AGHT+IGonFzyECAUs1kcKBHbA+lC1vtvMtEv2GgeX6qF+pSppU2t7u3ynf8yEnld5Zzo7SxQPz6cNQ==
X-Received: by 2002:a05:6512:3193:b0:52f:c285:323d with SMTP id 2adb3069b0e04-53546b2be87mr9271638e87.5.1725554516346;
        Thu, 05 Sep 2024 09:41:56 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53655182c91sm100674e87.306.2024.09.05.09.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 09:41:55 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 5/6] arm64: dts: qcom: sdm845: Fix interrupt types of camss interrupts
Date: Thu,  5 Sep 2024 19:41:41 +0300
Message-ID: <20240905164142.3475873-6-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240905164142.3475873-1-vladimir.zapolskiy@linaro.org>
References: <20240905164142.3475873-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The expected type of all CAMSS interrupts is edge rising, fix it in
the CAMSS device tree node for sdm845 platform.

Fixes: d48a6698a6b7 ("arm64: dts: qcom: sdm845: Add CAMSS ISP node")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 54077549b9da..0a0cef9dfcc4 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4326,16 +4326,16 @@ camss: camss@acb3000 {
 				"vfe1",
 				"vfe_lite";
 
-			interrupts = <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 469 IRQ_TYPE_EDGE_RISING>;
 			interrupt-names = "csid0",
 				"csid1",
 				"csid2",
-- 
2.45.2


