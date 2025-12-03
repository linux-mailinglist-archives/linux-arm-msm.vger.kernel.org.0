Return-Path: <linux-arm-msm+bounces-84187-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CC5C9E8A9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 10:43:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6818E4E04FE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 09:43:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EBA62E62CF;
	Wed,  3 Dec 2025 09:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="a8Q6cpgK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27BE2E5B2A
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 09:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764754942; cv=none; b=nmkahtcJYtwUzqMgZLhuCa7Rvw4AzSngNRttRL1UtKUWGbksuMHJHGOBz/aUyRvGOuwOxCouiDXzMBu4+PtuW5AEe2LpC0T2C77gsqPws1Un8+gi6d1GNi2PK4MV3P5bs+gc7sTzl4LT/1VFX9z2lmKM1Qj1m6nZkTWm4cJL8uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764754942; c=relaxed/simple;
	bh=+sat0IOyv7dYibuZzWaDTfnS78SGXYiAHyot4raeY3s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IXbKzSqlqiJwWvQHqyQo+TjKMRHlYrJcu0p98kv1rsvsZkFK+tgnRdQA09SsXHnm7LbLby/30OGa1CP4y469XqpF0wLK260DR/D8y5Eq+uezVjJ3cS5QRYI33wCNmbbiX5B2O4LcOCyYEPm0scWaSl5zQSIE+egMUEyNSwIgUFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=a8Q6cpgK; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1764754938;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AR/mQ+VHrTE4fKWsWqOutsuZW/BoYfxy/HGFAzx2pPQ=;
	b=a8Q6cpgKepQbcBt3kktHcakXZTz9Pv9HD+BPFWS68j+LoKgVksfT1tjbFNyCONqy2YuYhD
	rGnca0vPrXvEHYZHQx+iiDqjT0oAzx1jsS1XMHPUYV1yJwOj7IfbmKs+UFsirWwvuF9btg
	v4YHAm4PkHa8Qvr0FYeh8JARUhnrU0y2W7QZIAzNUrV9P+b41iLs2ZP5R88tadeFBQyWZu
	v2D3CtcqBvUpSZwofv+qt0j3GNhxuouIkdgO98jECsBNhvi75oxQ7Nsk61gGuqBb45LR0X
	GXNOA5p1yDTkaAa2KcxZxZ0bOIG4Zd/9YGXLcz/hNClLtxwQUG0G6AHWktTfyA==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Wed, 03 Dec 2025 01:40:52 -0800
Subject: [PATCH v5 03/12] arm64: dts: qcom: sdm845-lg-judyln: Add battery
 and charger
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-judyln-dts-v5-3-80c1ffca8487@postmarketos.org>
References: <20251203-judyln-dts-v5-0-80c1ffca8487@postmarketos.org>
In-Reply-To: <20251203-judyln-dts-v5-0-80c1ffca8487@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, Amir Dahan <system64fumo@tuta.io>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764754921; l=1341;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=/TDsTUZwCmIaaywK/fEl2z5Hc9nDVuyFYpoIyMntrUE=;
 b=ITT/ys7inb4wVplB0QY+fs8/V+XdQvxM991A6MvHDQPzW6Sv3UGTHAeYWkmK9XMY/DqSebINQ
 9XZFZ5ypkMxDeCzGTWeAIFJqwGaaAG011wrr5pWKbWls3PxtHaS6pOG
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

From: Christopher Brown <crispybrown@gmail.com>

Values based on lineageos kernel

https://github.com/LineageOS/android_kernel_lge_sdm845/blob/lineage-22.2/arch/arm64/boot/dts/lge/sdm845-battery/LGE_BLT39_LGC_3000mAh.dtsi

Signed-off-by: Christopher Brown <crispybrown@gmail.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
index e530a08f5e27..55bfddab3afd 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
@@ -37,6 +37,14 @@ key-thinq {
 			interrupts = <89 IRQ_TYPE_LEVEL_LOW>;
 		};
 	};
+
+	battery: battery {
+		compatible = "simple-battery";
+
+		charge-full-design-microamp-hours = <3000000>;
+		voltage-min-design-microvolt = <3200000>;
+		voltage-max-design-microvolt = <4400000>;
+	};
 };
 
 &adsp_pas {
@@ -63,6 +71,12 @@ &mss_pil {
 	firmware-name = "qcom/sdm845/judyln/mba.mbn", "qcom/sdm845/judyln/modem.mbn";
 };
 
+&pmi8998_charger {
+	monitored-battery = <&battery>;
+
+	status = "okay";
+};
+
 &tlmm {
 	thinq_key_default: thinq-key-default-state {
 		pins = "gpio89";

-- 
2.52.0


