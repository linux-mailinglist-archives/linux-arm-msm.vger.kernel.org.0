Return-Path: <linux-arm-msm+bounces-84468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A336CA7A47
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 13:51:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C642F31AF47C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 12:49:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CA2E335554;
	Fri,  5 Dec 2025 12:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cwA+Xdxy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA4D329392;
	Fri,  5 Dec 2025 12:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764938896; cv=none; b=TPP8FVRPdJn+MtBanoK4hl5TdjDMD00mo+Fn6re+Sm2IhO4hoPyw1NzHeHiKOWcTljD4QWEYLwzRXVHKsU5MpgEXrhh7/GN509iFO3o+xwN8zMti1RORAsxpRJdrSar57ydSK1wKm0/ZX6FsZzDrMXIwdB8Lz2Z2cw2IKwMGDms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764938896; c=relaxed/simple;
	bh=+qT3Ex01GnMgTTe4+17acC/hTM4B7geZlcqoWL9y5xQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KWzJ7eQ7g00taMplU6BDg/i4PP922acJQw5b+0626MDu+Yy27qzLqre5rLlvla+3qhixI/zp8BHM2kDaMdxx5ghzoJqhpDPq4z5FAdrxG9ffCP90Db4vRjt0Qh6KMVwNyZgmlxWfm7Rf+4xTlbXCOujB/qtzG04BpWdJoNme9cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cwA+Xdxy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26A9EC16AAE;
	Fri,  5 Dec 2025 12:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764938894;
	bh=+qT3Ex01GnMgTTe4+17acC/hTM4B7geZlcqoWL9y5xQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cwA+XdxyIFwibY4MgCdWLQfxvH7U9ZQasRg9Ijz6lGETdRrAqQ1tOkwjAPxGtArcJ
	 SdoAV14Z3AdTxZYyJdbWPfc5XYs2lakvvwxvRBOi2Pbe3CztKPzt9PFFaMtFl9JHo5
	 OKJ0Ty9H/05su67KTjLVUGm8i0EOkpHYYqBA/dBNg/tC2GSl8jkICCgFHKaJJWPO/S
	 1lH8Qhn1u2osgrKW5FEO2z8OU3yx0HPfDNDoJqjJDc2PmRBdQOOi1vniqjqsQ1keAp
	 5WCC8YgT9He/5TRi12yUQx1UJ+GGBPT77qeBP8w+xmsCiXLG7wm8gBWKe0gr+3XY2l
	 5HX4ZFqbK0Bnw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 05 Dec 2025 13:47:28 +0100
Subject: [PATCH 09/10] arm64: dts: qcom: x1-zenbook-a14: Fix BT RFA supply
 name
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251205-topic-wcn6855_pmu_dtbdings-v1-9-165611f687c8@oss.qualcomm.com>
References: <20251205-topic-wcn6855_pmu_dtbdings-v1-0-165611f687c8@oss.qualcomm.com>
In-Reply-To: <20251205-topic-wcn6855_pmu_dtbdings-v1-0-165611f687c8@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, 
 linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764938851; l=931;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=PIRj/Gn12EhO8XwjSRk9wRbCz1c5yHGPwZ4Pacs5Dx8=;
 b=GipClvTENjnKJxRIvQeqihupyhj9m0Tu4qcU/Mn+19RyyCN7Ffr+qnAEdSH29k598QwTTcww9
 gnlx6EKYD7UC9TBCMeEXPJgitiBtoznOXnjFzzXfHrd7Wm5k5lbFQQn
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Fix up the supply name to align with bindings.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtsi b/arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtsi
index 22470a97e1e3..7f5860d2b6cc 100644
--- a/arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtsi
@@ -128,7 +128,7 @@ bluetooth {
 		vddbtcmx-supply = <&vreg_pmu_btcmx_0p8>;
 		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
 		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
-		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
+		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
 		vddrfacmn-supply = <&vreg_pmu_rfa_cmn_0p8>;
 		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
 		vddwlmx-supply = <&vreg_pmu_wlmx_0p8>;

-- 
2.52.0


