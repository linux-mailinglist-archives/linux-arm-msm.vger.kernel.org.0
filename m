Return-Path: <linux-arm-msm+bounces-25421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A67AA92951E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jul 2024 21:34:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D397A1C20CA7
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jul 2024 19:34:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E66001BF38;
	Sat,  6 Jul 2024 19:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="q/H1I/LB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ixit.cz (ip-89-177-23-149.bb.vodafone.cz [89.177.23.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D268E57D;
	Sat,  6 Jul 2024 19:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.177.23.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720294468; cv=none; b=jlWYmvJ7nKjo5OgLViojeO1duzzVAsV0GyXYHdiAjIupKItzriO3Hmn+AVw8YVuzzDpDgEOXEc4ACGpPVmHgpbAWCqdngTzXgSYwqh3whfSLIqPHiZAwt1jJmCWe94/I0wPNxI0CbZt4HAwvlRPF4T1pD8+9oHjC+hhM7ZeR3Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720294468; c=relaxed/simple;
	bh=5I6LVk7Txwaahax/bricu9HTmCY4s4vm6thseHjOwHo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rgt+3MdxU7PP2+58cSh6SlFXi53TN7sYV0Jo5ion9DJLYOJehMlV5lSGMEAD2WJVSjq89Y/87xEeS/RTpjiNbnPdp5lO25Zlzl6eQWkh9TxfGMA56gCG7byo7n3yoMvq4W4Pb1ktifU4ACMD4fSFZRghk49e8shVLPPYJb8v5Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=q/H1I/LB; arc=none smtp.client-ip=89.177.23.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Received: from newone.attlocal.net (76-224-187-148.lightspeed.sntcca.sbcglobal.net [76.224.187.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 80103165261;
	Sat,  6 Jul 2024 21:34:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1720294461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UfHLKki3pLgKZQ70IUT8yid0txh8OHetOx+0DIT6chM=;
	b=q/H1I/LBDjzphcGjisA3CJybJW6RD41JafCrY48pM/6QL93BT62o6ZwtSY9VzRD/YNiPSC
	eWP7mU6zSeoUCuCk+XnizWu+luR8OemJOc7m/uxW3g+ZxSK+q6jqNwEiU5k5l9sYqKEcjN
	RN3ksbrC2OfVnFQyqTmW8e75sAkxM4I=
From: David Heidelberg <david@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Heidelberg <david@ixit.cz>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: qcom: apq8960: correct memory base
Date: Sat,  6 Jul 2024 12:34:07 -0700
Message-ID: <20240706193415.218940-1-david@ixit.cz>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Bootloader will provide the information anyway to the kernel.

Ref: https://github.com/msm8916-mainline/lk2nd/blob/main/target/msm8960/rules.mk

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


