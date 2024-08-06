Return-Path: <linux-arm-msm+bounces-28010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF919494DA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2024 17:51:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 52B101F22911
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2024 15:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61A5E374D1;
	Tue,  6 Aug 2024 15:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b="uZ6lNLlc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from box.trvn.ru (box.trvn.ru [194.87.146.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D321946F;
	Tue,  6 Aug 2024 15:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.87.146.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722959484; cv=none; b=Syxwo8As6Hd1lrUVsrJSSykfBXfYdfU2NQzW7X+Hm6gdUgKZsT+obfjA9q9o/S/seTPkxyVgws8WLKaPxmCVpoBMxVgCpGfSCk9eETxhwnmkcaplP9k8BFHJlCCzbx7+lzQpxmDF1ZtLPWZbxeqv0nZKsqPCUv6xC2/vlsg5Loc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722959484; c=relaxed/simple;
	bh=Bbum/diGjtj8IZG5fI5bEHheLxwVs7iMTYDIrvSrG28=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TDANnYvNhZo3QugfWRhkPuMlnQhfM+blMmpI0IMb8yI+W/5czGekTEVhhP9oHj5uhGLToyhnO2VmvMfBJiTgo0F6HYPKFu/87ZEd1lEimRXx0ybCMozZCAksMLVngnPT+gjbFdE0pTBEk01UR4mS3OsxPC+lmtOhhhSRmIGOjMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru; spf=pass smtp.mailfrom=trvn.ru; dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b=uZ6lNLlc; arc=none smtp.client-ip=194.87.146.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trvn.ru
Received: from authenticated-user (box.trvn.ru [194.87.146.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by box.trvn.ru (Postfix) with ESMTPSA id 49990408F5;
	Tue,  6 Aug 2024 20:45:37 +0500 (+05)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
	t=1722959138; bh=Bbum/diGjtj8IZG5fI5bEHheLxwVs7iMTYDIrvSrG28=;
	h=From:Date:Subject:To:Cc:From;
	b=uZ6lNLlcInQZwiiqy8TBPnKywcBLkLe1Z2jevTFxvGhvmdxGivcUqr4W7zLkcppDL
	 klnf9fMTUruCCNr/2sbyhDC0q5kAocvEslUb2P6ksIk0dc/p3kP407FNLBd7r7e9LJ
	 EJrvLh5MfY6HBAohXtu7c2MSziDxB+2vqmGBizQqrEZmzjcVS/TEMTAx9BiM0zv/pv
	 I2S2XNR5swOb31JzhcSADlPkJQMKsEHM8MntXyFK9X4ac140Y97VHQ+vgMO3VoFEpZ
	 oKOl06v6dO99553oCPH17s6JjG+xNya3y9MlKsvyBy/PQ09PijYYWBpzTZ7g3VwHN+
	 8HiCJzecNGUTQ==
From: Nikita Travkin <nikita@trvn.ru>
Date: Tue, 06 Aug 2024 20:45:29 +0500
Subject: [PATCH] arm64: dts: qcom: msm8916-samsung-gt58: Enable the
 touchkeys
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240806-msm8916-gt58-tkey-v1-1-8987b06c5921@trvn.ru>
X-B4-Tracking: v=1; b=H4sIABhFsmYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDCwMz3dziXAtLQzPd9BJTC92S7NRK3ZSkRKPE1KSURNMUcyWgvoKi1LT
 MCrCZ0bG1tQCnbKKIYwAAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Nikita Travkin <nikita@trvn.ru>
X-Developer-Signature: v=1; a=openpgp-sha256; l=913; i=nikita@trvn.ru;
 h=from:subject:message-id; bh=Bbum/diGjtj8IZG5fI5bEHheLxwVs7iMTYDIrvSrG28=;
 b=owEBbQKS/ZANAwAIAUMc7O4oGb91AcsmYgBmskUf7/SqzK7INfpETXwvg0l8LOWlr5Hf+eKEh
 hvOOyStXYaJAjMEAAEIAB0WIQTAhK9UUj+qg34uxUdDHOzuKBm/dQUCZrJFHwAKCRBDHOzuKBm/
 dbTaD/4hlurx7w85pCVcDtMqthPLorfuvOYTLqYfdZ4dYf10225rgokunw9gaEQB1oMerJ+e1JC
 w6bQwT3YIOF9dj+VWWD+RZMrZvILQ6n99yDLme00z8u4Iw8MpIUT+u3vAclyqTpCqdeL1P120wr
 7PS16zGgn2MALe9ZXg/DVc4iHhKcpDRFw1kPdbLSMh1aTDg9gUjPU5LbNJV6eryuSt+DEhqrryf
 zgaplE1JZjOZ/PM1rGZVdzYzoaZPWgGZfLFJb3PJag+FjWcoG80d+m7KuGhU6Yyu87e+H0Pgr25
 QK0r3Xe+m66KyfvlnaYkrwEbCvEKt914O9NNXu9wisaItjDCHI7IHzyzGMlcnLjFJ0qkPvbPvOp
 2lSPOrcSRAP5i2q9me5OPLHqpXJxA8Ff0jxNioPkEAeTXYv0HhTZBjdZG5MNl3aj0nOR1x2jNnH
 AaFVdOXeBI+QZr/xO3i0V9QaCqad8bLXYWP0I8COcaT0cU1xQ+wC32wQqC2eieYWaLRBHgfhbm6
 /9KLnnLdPKsn57GnIu2lVPD/digT9SGO1mx/x6D4cDOIzWZhHDWLPzwwGRNX0lwpZusUjWGHM2o
 RQsKlh+FZmERkYtM5P/JKqpfFdmYGqxP3FDy6yDpiBDZrQc9X1OQkYHeTQZJtDAJD1yVnMxbB/x
 FD/40b9dXjV4+jA==
X-Developer-Key: i=nikita@trvn.ru; a=openpgp;
 fpr=C084AF54523FAA837E2EC547431CECEE2819BF75

The tablet has two capacitive buttons on the scren bezel. Enable them by
adding the keycodes in the dt.

Signed-off-by: Nikita Travkin <nikita@trvn.ru>
---
 arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dts
index 579312ed53ce..3d6d9dd3b8a8 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dts
@@ -75,6 +75,7 @@ touchscreen@20 {
 
 		touchscreen-size-x = <768>;
 		touchscreen-size-y = <1024>;
+		linux,keycodes = <KEY_APPSELECT KEY_BACK>;
 
 		vcca-supply = <&reg_vdd_tsp>;
 		vdd-supply = <&pm8916_l6>;

---
base-commit: 1e391b34f6aa043c7afa40a2103163a0ef06d179
change-id: 20240806-msm8916-gt58-tkey-dba2aebda5d7

Best regards,
-- 
Nikita Travkin <nikita@trvn.ru>


