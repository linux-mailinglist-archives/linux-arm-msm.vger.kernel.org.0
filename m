Return-Path: <linux-arm-msm+bounces-37416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB9C9C320E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Nov 2024 13:46:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2BBD21F212F4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Nov 2024 12:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52D1F15820C;
	Sun, 10 Nov 2024 12:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u1fUOyOs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2512F142E7C;
	Sun, 10 Nov 2024 12:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731242783; cv=none; b=a4BgKC4G/S9+G59UQEkYgFNd923c4R1c3q/QYBz+sPeu2xHIACiy6x8+LX2qeTmQ+0ip7TXvo0RGEx33g42knysFSOP02iRIa3bFwsy4a884n8QaWyGu9Q1HcvAflqZlxlgayzLFXh807RNzgN94Y7bXGrs3BIk8IJFul4ksD/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731242783; c=relaxed/simple;
	bh=ElkLMRZRMv9XJWjsopnKZFC+Gem4zHcyAOxbtRxcg8g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=kux9ZA2iKtSopVmrYThm19OMUA639Q50WsIti+JHDs7GUeXpJON0Ukk9aeOU2U1sxr4VnxpOEQNn0cAt0iwFy2l5tBduNf11JFGdddsZO6hJJY4T24PrD1z5ohg5qEa5H0u+/Y5xngubZAWo/VV0Sr2QDbuErXdYARD52MiIhDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u1fUOyOs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B156DC4CECD;
	Sun, 10 Nov 2024 12:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731242782;
	bh=ElkLMRZRMv9XJWjsopnKZFC+Gem4zHcyAOxbtRxcg8g=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=u1fUOyOsGG1MHxtnIOBClBP5NVPdIeCrg7M+h2jl3w0joJVwtfW0rx1FlNuKi0eGG
	 X1kIVwiNZ3v73cCO4HZeQU/viIYkR4S4jZDoyW2y5QFxoT5sq+8u4PANJd/O8B1bjW
	 rch0ShXmIbB0EgxSTT6C06wn54jmWQR/JkIvOHTt6CvcVxU6wwY/LKpJyAtwep8Aq+
	 vs+Pje3+km+zjXabYDCAOB7b+maZsRBUKKyWBiUN3Ia3ESeIvX5lEpbAtzaMaI401d
	 9iUWemkLTCR5qkUe9g6lR7eV1qs1JSdahfaq+/kJuirlZXbxccJ+ihDp4dORhCFIO6
	 0MkNwl8ap6a8A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8270D5E382;
	Sun, 10 Nov 2024 12:46:22 +0000 (UTC)
From: maud spierings via B4 Relay <devnull+maud_spierings.hotmail.com@kernel.org>
Date: Sun, 10 Nov 2024 13:46:12 +0100
Subject: [PATCH] enable the gpu node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241110-qcom-asus-gpu-v1-1-13d7b05784b8@hotmail.com>
X-B4-Tracking: v=1; b=H4sIABOrMGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDQ0MD3cLk/FzdxOLSYt30glJdC3ODZPNkIyNLY9NkJaCegqLUtMwKsHn
 RsbW1AMtWuORfAAAA
X-Change-ID: 20241110-qcom-asus-gpu-870c7c22935c
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, maud spierings <maud_spierings@hotmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731242781; l=1072;
 i=maud_spierings@hotmail.com; s=20241110; h=from:subject:message-id;
 bh=r3QqlTk6/PdijpA+1hzU7uSYno80RzxewgsClzl2Gxo=;
 b=uz7Ftt5vnXmdUh012LFdLEbFGUKoaVnsAceQDCjeb1yYRh2yL3NhijBx8qekuLKRIKLTrHVSj
 lohsU+0kM6CAzhd0g59n/a23dmGmQ5y+UirXSPhHAymGi1ZLnnu+LY0
X-Developer-Key: i=maud_spierings@hotmail.com; a=ed25519;
 pk=CeFKVnZvRfX2QjB1DpdiAe2N+MEjwLEB9Yhx/OAcxRc=
X-Endpoint-Received: by B4 Relay for maud_spierings@hotmail.com/20241110
 with auth_id=273
X-Original-From: maud spierings <maud_spierings@hotmail.com>
Reply-To: maud_spierings@hotmail.com

From: maud spierings <maud_spierings@hotmail.com>

enable the gpu node on the snapdragon powered asus vivobook s15

---
enables the gpu on the asus vivobook s15

Signed-off-by: maud spierings <maud_spierings@hotmail.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
index 8515c254e15868a5d7f378b0dc0bf8f339fc7b19..f25991b887de3fca0092c5f81c881c5d8bd71aac 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
@@ -328,6 +328,14 @@ vreg_l3j_0p8: ldo3 {
 	};
 };
 
+&gpu {
+	status = "okay";
+
+	zap-shader {
+		firmware-name = "qcom/x1e80100/ASUSTeK/vivobook-s15/qcdxkmsuc8380.mbn";
+	};
+};
+
 &i2c0 {
 	clock-frequency = <400000>;
 	status = "okay";

---
base-commit: 929beafbe7acce3267c06115e13e03ff6e50548a
change-id: 20241110-qcom-asus-gpu-870c7c22935c

Best regards,
-- 
maud spierings <maud_spierings@hotmail.com>



