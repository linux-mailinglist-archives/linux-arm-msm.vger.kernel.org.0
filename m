Return-Path: <linux-arm-msm+bounces-49705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D3CA48196
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 15:38:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 466E319C55F6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 14:27:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4C8C233158;
	Thu, 27 Feb 2025 14:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b="KNxBay5E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from box.trvn.ru (box.trvn.ru [45.141.101.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BEFE22DFB3;
	Thu, 27 Feb 2025 14:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.141.101.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740666430; cv=none; b=PQKrosOAzo12EqiD8wROc1i+Vj5fptBX/XJl0bENnEGRT3z0dyGCZ9j9bzA5xfthbW8Bj7bcwuP3pl0emR3lsFeEYwuqlC+LDGVb473TGBWc3AO3yhKXV3iwxT0IyaxJABVcApFMnN2Mxg/MwwEDR9bEFPMHcQygMygEUxitKPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740666430; c=relaxed/simple;
	bh=Cgdaj47eWFXx5RgbBFHeDHBe4QiPUnPjh9ITiin3LWQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nceS5+yxDueNhWlLn/sOnAt+/NlUSBd2sBhE3tNsQ5B7azFb3ncTKrFDtSbsStS8SmwuruPeQ6qSD7nWbeo9oNYbu4gIrPMnE8IPLSVPfcEIW3i4T5eA9WyB4T0eGqoIIEgQg0183/fI69CURTYlvQK3BmAw67ZBu/YwtQrHdp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru; spf=pass smtp.mailfrom=trvn.ru; dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b=KNxBay5E; arc=none smtp.client-ip=45.141.101.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trvn.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
	t=1740666426; bh=Cgdaj47eWFXx5RgbBFHeDHBe4QiPUnPjh9ITiin3LWQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KNxBay5EeHx6g7yshyez/G0l8GKvUZdBWahqojhEYIqpbL6a9WKBOiF50b91qSxg2
	 2kl/SrIKm12kouLCCWScNYiMlmosxb8rGttG5b/H9K0J02nRB+Jw8yNJ7eL2+1mdcd
	 UpMLsx/3ml4pwiDJ7ICvt0kN0+RWtAB3VhnhIVm7zyltppqUySpx+kyuLZsa9vQvUx
	 46wFloeM1b63SGW/iWiSG70+aFJOy/hwxkMpTkp36BJXhY/vLeqZyUjkHl9O7ihlfm
	 8Uxu0dHKrn+dQx21Yq0cyGRsekN0LIs6JJlJ+sFtUbKzCvAoVDsP13KgYAQOpaK+aY
	 GX2vqDkXhe87g==
Received: from authenticated-user (box.trvn.ru [45.141.101.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by box.trvn.ru (Postfix) with ESMTPSA id D1E7995BA;
	Thu, 27 Feb 2025 19:27:04 +0500 (+05)
From: Nikita Travkin <nikita@trvn.ru>
Date: Thu, 27 Feb 2025 19:26:48 +0500
Subject: [PATCH v2 1/2] arm64: dts: qcom: qrb5165-rb5-vision-mezzanine:
 Drop CMA heap
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250227-qcom-nonroot-overlays-v2-1-bde44f708cbe@trvn.ru>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1565; i=nikita@trvn.ru;
 h=from:subject:message-id; bh=Cgdaj47eWFXx5RgbBFHeDHBe4QiPUnPjh9ITiin3LWQ=;
 b=owEBbQKS/ZANAwAIAUMc7O4oGb91AcsmYgBnwHY2Pz8GTgiO9RrNQPxcWrzcdwYRwhiybtSww
 zVgs3pYtzSJAjMEAAEIAB0WIQTAhK9UUj+qg34uxUdDHOzuKBm/dQUCZ8B2NgAKCRBDHOzuKBm/
 dfDqD/9sfiHWFKjKyWtfY9goH8vz1GIN6LgZJHtKBdb5BAk8n14/wpeCwwYuciTLE5p3TO3PpGg
 MzsxCA2LrDZxJ8uu3rYrvDjDn+RfWD2XLO+ExwROErD8+pSmuneJ3IOJNNZ93bSnk0KQ9Ied8zB
 D8tRPNgdaiy+44+MzdJ3pEsWVtRjgtyPXt0zvIbNCYySpuNWU0WTQxTeKfBE2iiTYTotxGgVD69
 AArfnpLq6DynFZwRQ8Xlab2C4jYNKsvtElQaHh65JduL/acLhuGuHnf433SPRXx/JkwHafr02Nr
 gqoMR6AgeGTaiNF3RVV0yNiibbyzSUvDH1dsLzfq3jif/5oOMFRiuXTI8GMTAFEDnRumFIaJ6ta
 xYDDeNZ5S6Cm9ci8H/3zArgrVPyey3Mpqv+IvQPIvFrmW8EU76egYPCMgD2d9H9YrW83lpnOjgi
 +a71QpTVnGrumzlpgmuaXro22WUjgWab4z6aF3l0//A9IJieXtjviZ8Q92H+OnVLgZft19SGhv6
 SioMQCDJdNO0bbUJNxl/ryGhnimArW7aa2+ouK2IS59miNaFWzI9x5kPmPj1ONkHvz2L5haGJ1I
 9mUWullsiXOeC6zRZD+CJBOuP8o7wGKvsLsgReAAcPb3yj2KgsEa7YJdd1RiJPiqh34ronBbB41
 DH/0xQ6N+sOy0mg==
X-Developer-Key: i=nikita@trvn.ru; a=openpgp;
 fpr=C084AF54523FAA837E2EC547431CECEE2819BF75

Initially added, the cma heap was supposed to help with libcamera swisp,
however a mistake was made such that the node was never applied as part
of the overlay since the change was added to the overlay root ("/") and
not with a reference to the target dtb root ("&{/}"). Moveover libcamera
doesn't require CMA heap on Qualcomm platforms anymore as it can now use
UDMA buffers instead.

Drop the CMA heap node. This change has no effect on the final dtb.

This reverts commit 99d557cfe4fcf89664762796678e26009aa3bdd9.

Fixes: 99d557cfe4fc ("arm64: dts: qcom: qrb5165-rb5-vision-mezzanine: Add cma heap for libcamera softisp support")
Suggested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Nikita Travkin <nikita@trvn.ru>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtso | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtso
index ae256c713a36078afdadc67193f381a19ea8e5d3..5fe331923dd3cd31ff2be047a2228e1c4104e80e 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtso
@@ -9,17 +9,6 @@
 #include <dt-bindings/clock/qcom,camcc-sm8250.h>
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
 &camcc {
 	status = "okay";
 };

-- 
2.48.1


