Return-Path: <linux-arm-msm+bounces-84467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEFECA7A1A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 13:50:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1EF00303D750
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 12:49:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95E9F3314A1;
	Fri,  5 Dec 2025 12:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B5kQvP4m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACF7334C0A;
	Fri,  5 Dec 2025 12:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764938891; cv=none; b=lCr791KLTkBmu8EQntAnlSIDL23nLODVyAICr0k47KTTLvnZStr++DRPpLXMjP9ouInDBke4jX1b8W5wVLm8Rkp08yE1CbAZ9u1G93Afzg0cZHPcRvzyO6+ztKuKf030xm0K+t59o5jxsT3gyts1kTQGqxotb8M2dFQfLo6gQbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764938891; c=relaxed/simple;
	bh=m07ytSYiiaFKzxrsdig5VveXN+PeCOvFjkIsCHv0Aa8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hKjbgSgsyyfIEqYHTtiBC13D5HdJbs0jP8zNUdROkGJbDJa9O9m0AAHhaVkzqW/+CsjkCV07nMCMgwqcydDzeX6y2Oi7APGhhXS469JxXexJ57QV3G02qxgp+X+H7QaLz+hHbccIccO5Ry/0xr2+k7JCik8FHEPDUWZ4QAIFjsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B5kQvP4m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14251C4CEF1;
	Fri,  5 Dec 2025 12:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764938890;
	bh=m07ytSYiiaFKzxrsdig5VveXN+PeCOvFjkIsCHv0Aa8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=B5kQvP4mGqhU7az5cq84D7UnaOlK+1pY1iMsCHBSFJZ7LK3H2fW9Tw9nVvYCxoPs5
	 Fjm5N7YvqK3+lHPk7rk7aHTCwehtRIonxSh+OpqMcbvdkb1HVK5iWoWRNtrKKg4tor
	 r5OqM6X7rN5O9rvm7OIii/9pRo/pl3Y+K6Zlx6+Mwz6RBqtXtZ813CffVhdqRFstnQ
	 xV3hyXSjGlmkoxJ7Ia9HWMbM/pBRWhNRcpZYaNJ9/0jnmpCVNQzBWvfxgeq40Wrd7B
	 9co0iNFpg8/DcuuH9wjJ/iSyL/sULCZqQPbHZ3ePGfJ7yEvCMD34ntaAQfkX9aMrx/
	 KAOmwxCx00y0g==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 05 Dec 2025 13:47:27 +0100
Subject: [PATCH 08/10] arm64: dts: qcom: x1-omnibook-x14: Fix BT RFA supply
 name
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251205-topic-wcn6855_pmu_dtbdings-v1-8-165611f687c8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764938851; l=778;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=j4VXIrHfVeHYi+7whYInVFeaeqfVmJciG1juR2FR7fg=;
 b=U8xpstR5jwX3G2rQ/9NKuL7OS6/rOU0SgOPqbhz7LHQRt0Ai+qWKJygXA6sxNLdXvEtepT3Oo
 l6UKqvBfdacA5rbJCj0MiS2fm4L+0u5MPZU4s5b5MUIedNP8EdORD+D
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Fix up the supply name to align with bindings.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi b/arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi
index a4075434162a..30f18c8cbcbc 100644
--- a/arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi
@@ -1450,7 +1450,7 @@ bluetooth {
 		vddbtcmx-supply = <&vreg_pmu_btcmx_0p8>;
 		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
 		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
-		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
+		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
 	};
 };
 

-- 
2.52.0


