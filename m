Return-Path: <linux-arm-msm+bounces-89634-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F79D3A756
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 12:48:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6653D30695E0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 11:43:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BAF5314B84;
	Mon, 19 Jan 2026 11:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h2xVgPe9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588D2313285;
	Mon, 19 Jan 2026 11:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768823001; cv=none; b=JnH8oZx0cZYXjxmRvH84KlRcHuD/albJMCFBpXkkHBmFu162IWTWSkEwkMEFt68epAvdAm9PCdwaO0deTKyjx8Py/Tmk+UIdG+oQ7NSHHOdCAipBA/YTWAljDUXLffob0lWo0z1Os9w1MEgnwdYM+lybP76JuqbbtJxBcwnEsIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768823001; c=relaxed/simple;
	bh=c4fYD1uabnTg2Y3YGXef3SyhWLDKug/8DPbDTe0wgkw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dYP+WdZJM68YMdi27P7TaNAs+EuoOvrIk+m9FkURHhfI8QuBxVChS+XzayN5vdKNTaaxVR7Ty7aG/JLnw5sy/SigJqJxvMTu8SDYuuYLaZjzrAW8G8vRR9DmV48jaK24HMnKeHDJcVe4MEJvKU6mFYqv6Sl/VN4HbxEYwJmRQPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h2xVgPe9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6217CC116C6;
	Mon, 19 Jan 2026 11:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768823001;
	bh=c4fYD1uabnTg2Y3YGXef3SyhWLDKug/8DPbDTe0wgkw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=h2xVgPe92FI7+IBBCzcKP4VxsqsdhWIwiN3FNtehzx1jGebgiHra1q8XN2tu9clO0
	 wONfeSJP7vLFzwsxKg/ii1zgGJblzqQf5vj5riPIEesCTX5RhGNpfMlOzpCQbiiQpz
	 nixTH/GpvKF5Neo7clIOFYBfQvBpsIZEcEe52CMOrB3FPeMgRf5co/rtUUxaR8MtPp
	 7HPcLjUYatP09KV+AiBKIPOKBVJX+6Bx7h02mqES0e6Xgfla/RZkmgiMTAoZJ6cTy+
	 ov41yW+hNGJIqvBHwTwW2KlGLFMubj6NiJltuJoZM6diJWLPuSjaY/g7IOo+bQEyLY
	 6SF9PnYvVIK/g==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 19 Jan 2026 12:42:31 +0100
Subject: [PATCH v2 09/10] arm64: dts: qcom: x1-zenbook-a14: Fix BT RFA
 supply name
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-topic-wcn6855_pmu_dtbdings-v2-9-6d1c75608bbb@oss.qualcomm.com>
References: <20260119-topic-wcn6855_pmu_dtbdings-v2-0-6d1c75608bbb@oss.qualcomm.com>
In-Reply-To: <20260119-topic-wcn6855_pmu_dtbdings-v2-0-6d1c75608bbb@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, 
 linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768822946; l=1057;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=HJWVOsKuE3+yAD8luM6AKUlLWyMYMr8aaeSiz49gRFo=;
 b=PtSRbu9CH36Epl9KUGeaqtQJqzpt8JWQbHOhWeqtTHrtAarwxTxg10NxQyrPwroyejZ7gvNCw
 FOyQG7AOZkCCTRQRDUpsj6tvpU3DgJYxrqW+CmpxFqz4UHpANqT2kSc
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Fix up the supply name to align with bindings.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
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


