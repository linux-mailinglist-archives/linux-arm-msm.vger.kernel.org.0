Return-Path: <linux-arm-msm+bounces-83197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 985FBC83EB7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 09:15:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8958C4E6A5D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 08:15:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44FAE2D9796;
	Tue, 25 Nov 2025 08:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="VP8+kPsv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794C92FC875
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 08:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764058412; cv=none; b=NHqU3ZfdAAqHgKhkYywmU2MWd45PP9ts2ttp1GTsN2PCPjpnB8JcRRDCICuXkRAfYiOZtVNe+VnY1W6W6UEyr643pe8X4v3C99yxwG6Xa5z0v/geafjSHHaxqF7MVFN3C/bpszIzbl+5frDj7xB+F+5SFD3B6GUiu4NIh7PcAoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764058412; c=relaxed/simple;
	bh=6947H6/xb4Y9TK51M02+1TbH/f9gjvhWQorDiD4X0co=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JFb/90CbrRcFB1UIJBeOooCS/8LfvmIEt5S6J0AyX+ezhC0fPLNTllTlBY1i/HlOZy+r+xj1z4yjlEm6rusT9y//mjuRSSweNy08jGg6szkDXRjLwqfqrj1uddWbDkwLJKwB2RCm16m7TVfval1zHQEh4YuteB7QPhWcrm4EJr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=VP8+kPsv; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1764058408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TILqy4gjWRXZMMm8Uq0oNN64z2L+nTHnVZZo76yzAaE=;
	b=VP8+kPsv075ZI5m71pYfxMlSpUSUv4EZJ9XiQD/6encHIYsF64tDBBn7VrutxS8DfxedKh
	0+N4ZQsTbU19VdG5VPGhTnOBZ1pC3h65YbNcgvN/qC6BOVkII3O5W/bFgK0lqS9b5rBcqx
	Ki42EsDmXiel/S+KnKRzUtjTB0ev+N/JxAposxFxAyXaJwiKjavcsniUVXIhpHVXNsKqIW
	t6fGJuSJQBNAVVN1lgT2JELvTG+TI/hZU1ZkwOfgWkMczqOlOpz/ImRlhTlNMTHvl0CcsF
	IPwAwfHcU/HA14v+ORvIFA0/Wg13hfRUZcfmbcx9ad4Kxipayq2rXAcHUzSOPw==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Tue, 25 Nov 2025 00:12:39 -0800
Subject: [PATCH v4 09/12] arm64: dts: qcom: sdm845-lg-common: Add camera
 flash
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251125-judyln-dts-v4-9-a5a60500b267@postmarketos.org>
References: <20251125-judyln-dts-v4-0-a5a60500b267@postmarketos.org>
In-Reply-To: <20251125-judyln-dts-v4-0-a5a60500b267@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Amir Dahan <system64fumo@protonmail.com>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764058372; l=950;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=6947H6/xb4Y9TK51M02+1TbH/f9gjvhWQorDiD4X0co=;
 b=27mvmMJxCeD96eMXOSIOVJgxsyVw19KUZ1mvb5fV5ga0qbO1t9YupZAy1LbIzE6mW+U0sQ6w1
 6d2DXjx1lumDSC388+4KcqnlshoaOBFhjAy9WAZlQOqTAVLKkrsTRzJ
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

Camera doesn't work yet (imx351), but we can use the flash as a flashlight.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index 93b9a0246510..fa664b5120d2 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -494,6 +494,19 @@ &pm8998_resin {
 	status = "okay";
 };
 
+&pmi8998_flash {
+	status = "okay";
+
+	led-0 {
+		function = LED_FUNCTION_FLASH;
+		color = <LED_COLOR_ID_WHITE>;
+		led-sources = <1>;
+		led-max-microamp = <100000>;
+		flash-max-microamp = <500000>;
+		flash-max-timeout-us = <500000>;
+	};
+};
+
 &pmi8998_lpg {
 	status = "okay";
 

-- 
2.52.0


