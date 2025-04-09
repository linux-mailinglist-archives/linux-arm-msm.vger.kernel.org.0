Return-Path: <linux-arm-msm+bounces-53663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B580A82994
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 17:12:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C98717A635
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 15:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A60EE265632;
	Wed,  9 Apr 2025 15:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JLUwm1ZZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79EFE19D092;
	Wed,  9 Apr 2025 15:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744210812; cv=none; b=iFPcgYBzFHZf7N+oenP0KNKcvz6rlVCIvt04CsK/Ns6ApQcPg7oTfKJjFp12fSydHugDgdfZOPoMYKsHVQuJph9WImP9/QoE1XmlTpos29Yk/2Rb7xREjaFmKFffNo4RBKZBvdoYei4jqbnXatrSQJiUI0jsrEGNjLNpSMA/ta0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744210812; c=relaxed/simple;
	bh=Xguhch1N2KldbiU8p48xOrZmfr5Gn7vzSKF2YJppjSQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DCEdQDPzhl6aC/wXE+MQ/w+80lPrnM4dZDLd+YjlsiHy9vr1dlCciZ2M5c3CX+8uycq2LazcwMP3fFY6sHcR4p6YJn1qDJjAloECzAN2kb6bkeB6OOIuDkRT+icH6xR5xch+IVkcNy8djQwcRnwl0N/vNjohv9i0oNK236ZE92A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JLUwm1ZZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0654C4CEE2;
	Wed,  9 Apr 2025 15:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744210812;
	bh=Xguhch1N2KldbiU8p48xOrZmfr5Gn7vzSKF2YJppjSQ=;
	h=From:Date:Subject:To:Cc:From;
	b=JLUwm1ZZbp5kQVxIfSD90qtwuA91T6f/0OS1fZPPto6kfen2z8TPF1OMAsMqy/Phu
	 h2FHyCEAbd8QgxJn2vx7lmT7+SoGFAjp/zSYEFcAwXndwKm623S1FnXqWxxxuW1Vvv
	 8udQPlnnLvYjH7WSp8zxa4UnDSa9iTp60pr4ipKQwUqPB8XoHLyMVI2c+E8kTW1+x6
	 az7Kd5rQl0M9eYYGSC4YrwFYzs+WtmuUnAuBX10EiakFcMxj+EZgtnJjf5DY5GqbmW
	 R2h3neYULEl94TBJSazwjzhVeToFHLfU+dDYhhORBSW5qB9N8+RQNCnYvnoiS2Q91w
	 fH7G5sa0U78uw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 09 Apr 2025 17:00:00 +0200
Subject: [PATCH] arm64: dts: qcom: x1e80100-hp-x14: Fix up BT pinctrl node
 name
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-topic-x14s_bt_tlmm-v1-1-b159395b7922@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAG+L9mcC/x3MTQqAIBBA4avErBPGUqKuEiFpUw30h0oE4d2Tl
 t/ivRcCeaYAXfGCp5sDn0eGLAtw63gsJHjKhgorjQpbEc+LnXikCsZGE7d9F41GObt6slYh5PD
 yNPPzT/shpQ8atuLdZAAAAA==
X-Change-ID: 20250409-topic-x14s_bt_tlmm-7501fc3dbb40
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744210809; l=1127;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=g/jCMBUeZ1puAUYyMVD0Lk/ca0mKdtUU4vVbTMC8Iio=;
 b=ecn6I/SXo9L7KVU+lYfpTyu0tihHG6B/5N7J9q/ude8wT/xySE/sh2mV+OjO/iGmMn8wihsuq
 hCIS/CVuCPaBhgrArQ6nGt28dGkSBfIPJOecCc7oaTHxDFedZtRLIrz
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The schema expects all TLMM subnodes to end in -state.
Fix it up.

Fixes: 6f18b8d4142c ("arm64: dts: qcom: x1e80100-hp-x14: dt for HP Omnibook X Laptop 14")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts b/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
index 28298021cc367c279eebc08be6165fc1af9f2033..6280d23d2d8b50064a49f28919a490cebe247035 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
@@ -1429,7 +1429,7 @@ &tlmm {
 			       <72 2>, /* Secure EC I2C connection (?) */
 			       <238 1>; /* UFS Reset */
 
-	bt_en_default: bt-en-sleep {
+	bt_en_default: bt-en-sleep-state {
 		pins = "gpio116";
 		function = "gpio";
 		output-low;

---
base-commit: 46086739de22d72319e37c37a134d32db52e1c5c
change-id: 20250409-topic-x14s_bt_tlmm-7501fc3dbb40

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


