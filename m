Return-Path: <linux-arm-msm+bounces-25424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC5E929561
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jul 2024 00:01:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 156731C20B69
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jul 2024 22:01:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FF7423741;
	Sat,  6 Jul 2024 22:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="jbQ7oxWu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ixit.cz (ip-89-177-23-149.bb.vodafone.cz [89.177.23.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898E71BF58;
	Sat,  6 Jul 2024 22:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.177.23.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720303255; cv=none; b=tDrQ4SExq+mb2GJj7JcAShhqjZl2KU4b9plg0K8zU/M0g0jlKrRvSQjWMA9WG4v4CZUu3ezeC1RaDPxdx4PIARKs/AogZxAtt7+hqs+Fm9f+eL7m2Bt5m5Lbsa7S5AIeZqIz7Nb0FYzS9wsvYF92jqEkJXb4wdZpW6DwbOaIOs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720303255; c=relaxed/simple;
	bh=L0DmlBrywElD3FskQlMVzfQTsHLaAQHxjythqqbokUI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HOrk+ySp3UomykT5aReUxL3UuL5ANzIOT479Bw5uZMNf1VBlmk3L/HNd5P5o1EyctwH4FzH21kbQc7w1ssYavFt8mLL/i1ZEIAxDVHrzS0fpIExErwHhiJU6Na8A9tGyato9sD2iQdkiAsMgqwdLJ+9SxL7D2MCa0gfH/99b8Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=jbQ7oxWu; arc=none smtp.client-ip=89.177.23.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Received: from newone.attlocal.net (76-224-187-148.lightspeed.sntcca.sbcglobal.net [76.224.187.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 02E911650ED;
	Sun,  7 Jul 2024 00:00:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1720303247;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PqfZG+GyBCV/bwFst3yoT6QdmPT89Y9QsWEZ0NJOICM=;
	b=jbQ7oxWu0iK1ODnOkFb8/aL7t9anC92oBIiTqoP11ejxyx8vfwu4QJDRCPbpObbjLew+go
	gzE6avDQYUlTdklw3Bomx3gDwbZbyCru7NE3X9QT4fncWjkBHHhYlDsGQ3EFgrKlTL5lEe
	U8PFdBIZVCDjbvwTURleOkEao8aM+/Y=
From: David Heidelberg <david@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Heidelberg <david@ixit.cz>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: qcom: msm8960: correct memory base
Date: Sat,  6 Jul 2024 15:00:30 -0700
Message-ID: <20240706220041.241839-1-david@ixit.cz>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DeviceTree validation requires a unit address on the memory node, adjust
the base to match [Ref] and use this as unit address.

The bootloader will update the information with the actual values during
boot.

Ref: https://github.com/msm8916-mainline/lk2nd/blob/main/target/msm8960/rules.mk

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git ./arch/arm/boot/dts/qcom/qcom-msm8960.dtsi ./arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index a9c6d2dbb460..ebc43c5c6e5f 100644
--- ./arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
+++ ./arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
@@ -47,9 +47,9 @@ L2: l2-cache {
 		};
 	};
 
-	memory {
+	memory@80000000 {
 		device_type = "memory";
-		reg = <0x0 0x0>;
+		reg = <0x80000000 0>;
 	};
 
 	cpu-pmu {
-- 
2.45.2


