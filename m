Return-Path: <linux-arm-msm+bounces-9755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D03848FC5
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Feb 2024 18:35:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD8F328366E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Feb 2024 17:35:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A4E8249EE;
	Sun,  4 Feb 2024 17:35:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21C4249E4
	for <linux-arm-msm@vger.kernel.org>; Sun,  4 Feb 2024 17:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707068151; cv=none; b=sFdVDco/5xiC774C2/rYOaJEOCrI47BHYbIDQyT/kjrx0qOqxcp/y08C1Z0jhtNeVVRrMmvkKUxbze/RQet3dLhqfrgpAGEZp2mEnpKrNLX9MaJddRk4T8Ux4qaxRxjkDDR1gO61Oz/yptMxOyKkpcBmAQNXq+noqGF5Gihgfx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707068151; c=relaxed/simple;
	bh=oYJMOCwPyaX5sr3C8ht02ltCESTYiMyacCQTJL4xgEk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=XXxcCcbyUfeAk+/IEz1ZA9FQz8zmMhGaBiKcDLXIQSmcOcx3dFBdbZCtRKxJnGnUDw1yWrQnlJ/pPhMzM8Mw9grVw/Art0xQ/ibbAoHhVX+ieHkE9gmrM188WmiICwSAv373PoselMcCDa2F2WLwyegcWuBfHgx2w5OCXacOppQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from Marijn-Arch-Book.localdomain (2a02-a420-67-c93f-164f-8aff-fee4-5930.mobile6.kpn.net [IPv6:2a02:a420:67:c93f:164f:8aff:fee4:5930])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 2A7E73F0C8;
	Sun,  4 Feb 2024 18:35:47 +0100 (CET)
From: Marijn Suijten <marijn.suijten@somainline.org>
Date: Sun, 04 Feb 2024 18:35:22 +0100
Subject: [PATCH] arm64: dts: qcom: sdm630-nile: Enable and configure PM660L
 WLED
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240204-sdm630-nile-wled-v1-1-9f5c4f8147f2@somainline.org>
X-B4-Tracking: v=1; b=H4sIANnKv2UC/x3M0QpAQBBG4VfRXJsaS5RXkQuZH1Ms7RZK3t3m8
 rs456GIYIjUZg8FnBZt9wlFntG4DH4GmyaTE1eJk4qjbnUp7G0FXyuU4UpthkInGUEpOwImu/9
 l17/vB03ahC9iAAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Marijn Suijten <marijn.suijten@somainline.org>
X-Mailer: b4 0.12.4

The board-specific (electrical) configuration was removed from PM660L in
90ba636e40cb ("arm64: dts: qcom: pm660l: Remove board-specific WLED
configuration") as it is platform-dependent.  We reintroduce it here in
the Nile board configuration (with a slightly lower current limit, as
per downstream DT sources) and enable it for use in the dsi0 node.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
index 87d0293c728d..852aecfba95a 100644
--- a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
@@ -241,6 +241,16 @@ led@3 {
 	};
 };
 
+&pm660l_wled {
+	status = "okay";
+
+	qcom,switching-freq = <800>;
+	qcom,ovp-millivolt = <29600>;
+	qcom,current-boost-limit = <970>;
+	qcom,current-limit-microamp = <17500>;
+	qcom,num-strings = <2>;
+};
+
 &pon_pwrkey {
 	status = "okay";
 };

---
base-commit: 01af33cc9894b4489fb68fa35c40e9fe85df63dc
change-id: 20240204-sdm630-nile-wled-e23d7a1df0ce

Best regards,
-- 
Marijn Suijten <marijn.suijten@somainline.org>


