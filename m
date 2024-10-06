Return-Path: <linux-arm-msm+bounces-33208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E33D8991C06
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 04:20:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B62A1C20E3A
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 02:20:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBB371422DD;
	Sun,  6 Oct 2024 02:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="zDDbbItE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E6FF4F1;
	Sun,  6 Oct 2024 02:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728181234; cv=none; b=qDTDeJrR57wMEmCdrp9X3XfZoNhvoMzafKiHKPDH6I0VgHinno8R+qOdKKEfaOd0/LhDYwCAx6QfWyhR2tM5zJ6yEY/AXzcJAGr3YgvTjxGs+RNZZf7Z1ORPHlO0ArTCwTf7gDWMVthJx27RUJQhuS6HyYZtXutjIq8z2nCjxLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728181234; c=relaxed/simple;
	bh=pU9f6Il0HsdSXQfCQF1LkmrUhtQH0V7pP/ulXo66aTA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s0OpUN3RoBF0akRVtHEh5E361lZazj01vfQOjHdclfpAIsA1DE/LQU0jvxtoROSFXGD7L20nS7ZlzafwcQYvTtPD0Iy3Dj/ORjOs5zcbKKwacZkzAwZzqO0OiABWcZDR8enwxPKS9QdEMtDeHxbBsJAV2ehrspqie3oyCKxUE2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=zDDbbItE; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 9215D88CBB;
	Sun,  6 Oct 2024 04:20:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1728181221;
	bh=r4dS+/6yT3O0pj9q3M61LqjfJSNP5SiHbbEqxBmHok0=;
	h=From:To:Cc:Subject:Date:From;
	b=zDDbbItEu8xYXdhsI4KUfSfOv+jsAaGTkO7yUK04zkqRGD1lBl8pVB2NRT7NSXwhg
	 wpgNRSB5YJMjWkyvmkULzFfxSd0oLqpd4IvELY1C1W9it4FIj5vYxkNXPh2Q+hCO0F
	 0gC/iQLM6FOKs+ZRemwF6ELuPZgrQaCMBE7SrjzCH2V6zJeDFlibTdiGTg8p/x4OLq
	 xQCNOAOY1jvol21gSyIZVlDCAOdhwE3lCFh1GwXt6Vs/d6T9ynZOb2Z5NTlMBjUGJw
	 tdygioDnYRyWNZ2R8Dng6AMk0DqEQk/B9Jqx1JgZ8nG0IwRhU1C32BpNIANC/rA8br
	 MSP7Vd105IrAA==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@denx.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: msm8996-xiaomi-gemini: Fix LP5562 LED1 reg property
Date: Sun,  6 Oct 2024 04:19:48 +0200
Message-ID: <20241006022012.366601-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

The LP5562 led@1 reg property should likely be set to 1 to match
the unit. Fix it.

Fixes: 4ac46b3682c5 ("arm64: dts: qcom: msm8996: xiaomi-gemini: Add support for Xiaomi Mi 5")
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
---
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts
index f8e9d90afab00..dbad8f57f2fa3 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts
+++ b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts
@@ -64,7 +64,7 @@ led@0 {
 		};
 
 		led@1 {
-			reg = <0>;
+			reg = <1>;
 			chan-name = "button-backlight1";
 			led-cur = /bits/ 8 <0x32>;
 			max-cur = /bits/ 8 <0xc8>;
-- 
2.45.2


