Return-Path: <linux-arm-msm+bounces-49706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9424DA481A0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 15:39:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80930188CB8E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 14:27:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0B8623496F;
	Thu, 27 Feb 2025 14:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b="43dOkDkN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from box.trvn.ru (box.trvn.ru [45.141.101.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8862309AA;
	Thu, 27 Feb 2025 14:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.141.101.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740666431; cv=none; b=t51LVgSLsLrQBZIPygYjpTruV+BMPZ8A3LV6wJ5Z20bjMahZ307ySdFQSJgcipr95MROB3d2d6IC0aex7Lj32tyscDH1n24j/vqd73+XcvXfonofMEZeg0d031QN1XFK9XriB/J/cgj3WuM43D2lmFc35Uovs05Nk17lFnU0Gfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740666431; c=relaxed/simple;
	bh=dyyzHix7FsjYghq8qoqSFkJvh7rVpVdTIin/CCYr2f0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kfSo7n1PVw0QQrn97BwAsxV1Rv31iaDXKJNjJHZDXcr675wIfZGN6dpUCRUZWewJ/6cLwhf4cA/EkvdTrfx1j1jxB0rnXteBDtLeIotBa5DGbiCAFLYd/DI3fBgyOq3yX/YigKEX7J1gom+BKrlUAStaMIkA/AVzruWFZldxj2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru; spf=pass smtp.mailfrom=trvn.ru; dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b=43dOkDkN; arc=none smtp.client-ip=45.141.101.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trvn.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
	t=1740666427; bh=dyyzHix7FsjYghq8qoqSFkJvh7rVpVdTIin/CCYr2f0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=43dOkDkNeW12CX6HVHrQBWxjyOLO824YbGjbNZipf/6EbOlsoW57gGsEKGyhqMopH
	 6BYCzQeTcFrtZwcHD+SC3cEHViLHh4dU/Hu+RjvnQP41H8cCanteRry+j0y6pPx9bQ
	 LBrSaPdrtFQ/M1bTIt+AEL8QDHW+cOQ7yrHlsdbtekuNIK+0ZoXQa+dSFge58CNTv+
	 ftMZ0N9HvPVdz9rpWdMtBUHTT1NEn663aGkccMCm5D5d5fT6TWLpFpKOcVEaeTMewX
	 op2VWrOcxGKcYjaJlD/5G31/TqDJ1S2R2vecwCQ8My0Bb5gdRqB+T2JzAt562Z++9w
	 BPFO+0lakXmRw==
Received: from authenticated-user (box.trvn.ru [45.141.101.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by box.trvn.ru (Postfix) with ESMTPSA id 7FD5195BB;
	Thu, 27 Feb 2025 19:27:06 +0500 (+05)
From: Nikita Travkin <nikita@trvn.ru>
Date: Thu, 27 Feb 2025 19:26:49 +0500
Subject: [PATCH v2 2/2] arm64: dts: qcom:
 sdm845-db845c-navigation-mezzanine: Drop CMA heap
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250227-qcom-nonroot-overlays-v2-2-bde44f708cbe@trvn.ru>
References: <20250227-qcom-nonroot-overlays-v2-0-bde44f708cbe@trvn.ru>
In-Reply-To: <20250227-qcom-nonroot-overlays-v2-0-bde44f708cbe@trvn.ru>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nikita Travkin <nikita@trvn.ru>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1652; i=nikita@trvn.ru;
 h=from:subject:message-id; bh=dyyzHix7FsjYghq8qoqSFkJvh7rVpVdTIin/CCYr2f0=;
 b=owEBbQKS/ZANAwAIAUMc7O4oGb91AcsmYgBnwHY31v/qUb+Ww0+Cy5RNOAZPfXCgmUlag56Av
 yalMvI73RuJAjMEAAEIAB0WIQTAhK9UUj+qg34uxUdDHOzuKBm/dQUCZ8B2NwAKCRBDHOzuKBm/
 deyAD/44FkhDxt6L5t9CJ0wPuFvwCLuC18CrmMuVthy73E95n4tEhCtDrJMJOKhxfGhLwPmtuDw
 AXDbj4OnNYfwEjycNl7nYNcruWmRq726qnVpvjTgtHxnxDiJTGK8VPe9kIRgjBlOutuwWuvIh2j
 0P6AuwTH+9gnQa7uXUOQA1l9QZrgDKG7MHIys99ZVxUsqGuTkLG2lCHRnHqLNAJvr6+5FYEW/ks
 0UYtKjdOptdIuzEOuIU7X9Wcf+Bqn8gDWS9JUfnkM69GzH1d2a/xlLdztzboi7txzO5PT2QvO/j
 7/8lnJDrlJoRjYC8YleqYALh3/ZiOM999PHkDZ8vPnwGQ3lrqOpPdOrjp57WukqDDlETtlW8ddD
 9yrVU3TubCB4C5DiFrQALf51oz6MKkIyhtDxob7ts9EvGztNyx4f8zYLE7R9ZpjybWKXaxK8hh8
 Yf/Bs19lkQMs4pYk79j87EHB9XWmPa1l36yfGizMYnw0FMaH9fQZRD3jv4T0x87dR3FKvRwOE3k
 WZcNmrToXEkqOGpEp7+PCCelYxWh2qQQ09S203AfdiO8izlGeb6Pv6pNk92QNxU9CziZ+lPdbTQ
 fGd9/J9fK6oRmrbNzcFgl+fY/muavTrF6ZP+M3+GA8RjFkDx4ktvwJGi8kXADtQulqVE2mA34Ii
 VHa75qyfQaDC/ag==
X-Developer-Key: i=nikita@trvn.ru; a=openpgp;
 fpr=C084AF54523FAA837E2EC547431CECEE2819BF75

Initially added, the cma heap was supposed to help with libcamera swisp,
however a mistake was made such that the node was never applied as part
of the overlay since the change was added to the overlay root ("/") and
not with a reference to the target dtb root ("&{/}"). Moveover libcamera
doesn't require CMA heap on Qualcomm platforms anymore as it can now use
UDMA buffers instead.

Drop the CMA heap node. This change has no effect on the final dtb.

This reverts commit d40fd02c1faf8faad57a7579b573bc5be51faabe.

Fixes: d40fd02c1faf ("arm64: dts: qcom: sdm845-db845c-navigation-mezzanine: Add cma heap for libcamera softisp support")
Suggested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Nikita Travkin <nikita@trvn.ru>
---
 .../boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso     | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso b/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
index 59970082da45203311146cc5249298f6188bf67a..51f1a4883ab8f0ee7c66fab89c6e1a88c868d2f8 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
@@ -9,17 +9,6 @@
 #include <dt-bindings/clock/qcom,camcc-sdm845.h>
 #include <dt-bindings/gpio/gpio.h>
 
-/ {
-	reserved-memory {
-		linux,cma {
-			compatible = "shared-dma-pool";
-			size = <0x0 0x8000000>;
-			reusable;
-			linux,cma-default;
-		};
-	};
-};
-
 &camss {
 	vdda-phy-supply = <&vreg_l1a_0p875>;
 	vdda-pll-supply = <&vreg_l26a_1p2>;

-- 
2.48.1


