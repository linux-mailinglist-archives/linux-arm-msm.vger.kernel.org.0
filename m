Return-Path: <linux-arm-msm+bounces-61333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C969ADA39E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Jun 2025 22:36:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 81E667A7B03
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Jun 2025 20:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D3F4280321;
	Sun, 15 Jun 2025 20:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C3pnOs5X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3284C27FD5A;
	Sun, 15 Jun 2025 20:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750019750; cv=none; b=OINDBU6TS079qlVFrZuaD7n9yQfgtM9kuE6crORjO/U90dG58IsfzXKGIHa2R5iEUoMeMQw9Uac2rHphBo/NxkfhzmdEvsjl9YnrKIsComeoG+6vsgjbEzN5roYDs9Y+Mt/awLuOBEjAmXFjiKuFZ1Jc2Fld+R3MzWWeuFJ9wUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750019750; c=relaxed/simple;
	bh=GEPOptWrzkj4yqJFk/yNGCsDOX4oiMbzC3UhE89PzQU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xi7pRDXkAyYAvt+FSeL+n0W/N5hszIAkc6tiCq/18dkysQDIXodEdys4oGK5W739YySIwLepbW98cRwNtclKFk4WTb5BV1TG16vSFLBiU71fN2hDpLPozOUIcij+A+/Eh2kipOEZiG06S3p6Edqx1DOc93oCeHbb5Nw9vgBRMGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C3pnOs5X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id ACA05C4CEF9;
	Sun, 15 Jun 2025 20:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750019749;
	bh=GEPOptWrzkj4yqJFk/yNGCsDOX4oiMbzC3UhE89PzQU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=C3pnOs5XSJizJ+MuQPuCv9NVgy4Slo3gNTg9gSxfm6cYfRdCy+H7pp/ka1lV3fdIq
	 p9IrNJg/3Pa99bkvOA3cduczh1tnrxF/rXe0TRD5Q7p1L5PvmsX6yDDqoRyRiWW63F
	 zYFuZCgiJfzjcU47KTWUldM6pd15ErogV0mR3wquZqkykw7ReEWyc0CMMNehf4UxPY
	 dyL7VXso2thbCKDTrVTc0sTKT0f9m09vp1TkgaADRW0mX7/w/Wh6J6s8lQLIMF2sQh
	 lct5MMoScRRiq5SiTGtSMhoGY4F+BkQCXzBpOmUA3vfwZep5JQNP4giIVbHFTj6dat
	 /q8usKBenr98A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B44FC7115A;
	Sun, 15 Jun 2025 20:35:49 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Sun, 15 Jun 2025 22:35:05 +0200
Subject: [PATCH v2 3/4] arm64: dts: qcom: msm8976: Add sdc2 GPIOs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250615-bqx5plus-v2-3-72b45c84237d@apitzsch.eu>
References: <20250615-bqx5plus-v2-0-72b45c84237d@apitzsch.eu>
In-Reply-To: <20250615-bqx5plus-v2-0-72b45c84237d@apitzsch.eu>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750019747; l=1549;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=pHim4zTcI1zPighoZ6+v0/0r8e8R848pZckDF2/W8QA=;
 b=VRDWgDOraNRiBI3Pgg4AP7ksyB8wqXOeFjFram8SpHlIICeMb4/1NSzuH8hUeTw6A8h8fxneW
 fepDfuEXmmACDwXieh0+58U+ZMyUFiW/wgiHQf+MJjjQsN6DFwz76Ek
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: André Apitzsch <git@apitzsch.eu>

Downstream vendor code for reference:

https://git.codelinaro.org/clo/la/kernel/msm-3.10/-/blob/LA.BR.1.3.7.c26/arch/arm/boot/dts/qcom/msm8976-pinctrl.dtsi#L223-263

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 arch/arm64/boot/dts/qcom/msm8976.dtsi | 36 +++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8976.dtsi b/arch/arm64/boot/dts/qcom/msm8976.dtsi
index 2a30246384700dac2ec868c6f371248cfcc643fc..f9962512f243d6c1af4931787f4602554c63bb39 100644
--- a/arch/arm64/boot/dts/qcom/msm8976.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8976.dtsi
@@ -782,6 +782,42 @@ blsp2_i2c4_sleep: blsp2-i2c4-sleep-state {
 				bias-disable;
 			};
 
+			sdc2_default: sdc2-default-state {
+				clk-pins {
+					pins = "sdc2_clk";
+					bias-disable;
+					drive-strength = <16>;
+				};
+				cmd-pins {
+					pins = "sdc2_cmd";
+					bias-pull-up;
+					drive-strength = <10>;
+				};
+				data-pins {
+					pins = "sdc2_data";
+					bias-pull-up;
+					drive-strength = <10>;
+				};
+			};
+
+			sdc2_sleep: sdc2-sleep-state {
+				clk-pins {
+					pins = "sdc2_clk";
+					bias-disable;
+					drive-strength = <2>;
+				};
+				cmd-pins {
+					pins = "sdc2_cmd";
+					bias-pull-up;
+					drive-strength = <2>;
+				};
+				data-pins {
+					pins = "sdc2_data";
+					bias-pull-up;
+					drive-strength = <2>;
+				};
+			};
+
 			wcss_wlan_default: wcss-wlan-default-state  {
 				wcss-wlan2-pins {
 					pins = "gpio40";

-- 
2.49.0



