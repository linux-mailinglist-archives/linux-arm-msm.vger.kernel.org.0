Return-Path: <linux-arm-msm+bounces-84469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 782B8CA7AC9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 14:01:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 75D1032163B9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 12:58:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C39EF313294;
	Fri,  5 Dec 2025 12:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JS5waypy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3EB331210;
	Fri,  5 Dec 2025 12:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764938902; cv=none; b=WYyFcTQrlaWLDBqBWbuIAainzDGd+31zGZI8sG7g6yfrmEp4AoiYFkIH1thEghTYc81mKStQJyJLpz7OX01mUruUQWVM/rQyWlMZvUCB3i6LCM0FEFOB+aCANCgLBPhGnBr3PLQJQgDLKoNDnsv363EooyKeACgrcHTU3K0VAyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764938902; c=relaxed/simple;
	bh=Ai0XL/rEqdg4fKzx1hPzCDfZgmgmHN7GcRLB+pKSxyc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mcHXhZpJbuukIPPLbgfsqdW9X8x2wO/4Gy5BMdtrAINnAO1Ma4x1nMfbkgvUqiYrGxoYWWcb5sjCBfXfZ8F5kl0u/aRkjX60LUdiUBMKUqWeuUkce6Wl6+gGaraPHx2zejDrZEdFAEhv6huM/pIIrm0bz4TvfrxSDjVq3Wn4zn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JS5waypy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A692C4CEF1;
	Fri,  5 Dec 2025 12:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764938898;
	bh=Ai0XL/rEqdg4fKzx1hPzCDfZgmgmHN7GcRLB+pKSxyc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JS5waypy9prkYwOZQf/O3E7RqqEyPgExfLlXyX1vf4F6EIYhFaH2lK2ktrR+/b118
	 aJfQLCtvZl4Ul8MjEpXNC+Dn+n/o2PqqKvxUHCHPPLIJW1dV1gWBE/3EeX+WfIBLcZ
	 t3JJwjbSbMOlGYV+T3T8jP/6WtgLj72JaSrgUIKoxbpdAr0WaKH3+2LU6c08wckSd/
	 f/f9eFLftvXE1jRCmRrvJMvW0yB9hwVZO93sp+LwsbtqH8FoAVXHRqWhamv6KPFiwc
	 0axRjfXP9txEMrniiuq1b0Xde/HDM7ILWQ6GHTI6aqDi3gpx0RqoItdco0BskSuFPA
	 QBcfOacuhyR4A==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 05 Dec 2025 13:47:29 +0100
Subject: [PATCH 10/10] arm64: dts: qcom: lemans-ride-common: Fix up WCN
 power grid
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251205-topic-wcn6855_pmu_dtbdings-v1-10-165611f687c8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764938851; l=2322;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=3dp5C5HMXp/1Z+9Y4SVZNMQFZXiUBgxXrgev7YSQma0=;
 b=kpS9agG2WNK3VYAqHsavDbymkBGzvMGZGB37LEthnF+VOKmBZucGJUDnf3gYAxernEd6790G5
 7X5Nbl5Q/anBlDdWAh4VA64Kz3erE2PtO08O9AL85n2cK7LuiY4GaVH
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Make the dt checker happy by filling out the required properties in
line with the schematics.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 32 ++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index c69aa2f41ce2..069d58e6b6c5 100644
--- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -79,6 +79,18 @@ vreg_3p0: vreg-3p0-regulator {
 		vin-supply = <&vreg_12p0>;
 	};
 
+	vreg_3p3: vreg-3p3-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_3P3";
+
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		vin-supply = <&vreg_12p0>;
+	};
+
 	vreg_conn_1p8: vreg_conn_1p8 {
 		compatible = "regulator-fixed";
 		regulator-name = "vreg_conn_1p8";
@@ -95,6 +107,22 @@ vreg_conn_pa: vreg_conn_pa {
 		gpio = <&pmm8654au_1_gpios 6 GPIO_ACTIVE_HIGH>;
 	};
 
+	/*
+	 * TODO: These two regulators are actually part of the removable M.2
+	 * card and not the mainboard. Need to describe this differently.
+	 * Functionally it works correctly, because all we need to do is to
+	 * turn on the actual 3.3V supply above.
+	 */
+	vreg_wcn_0p95: vreg-wcn-0p95-regulator {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_WCN_0P95";
+		regulator-min-microvolt = <950000>;
+		regulator-max-microvolt = <950000>;
+
+		vin-supply = <&vreg_3p3>;
+	};
+
 	wcn6855-pmu {
 		compatible = "qcom,wcn6855-pmu";
 
@@ -104,6 +132,8 @@ wcn6855-pmu {
 		vddio-supply = <&vreg_conn_pa>;
 		vddaon-supply = <&vreg_l2c>;
 		vddpmu-supply = <&vreg_conn_1p8>;
+		vddpmumx-supply = <&vreg_wcn_0p95>;
+		vddpmucx-supply = <&vreg_wcn_0p95>;
 		vddrfa0p95-supply = <&vreg_l2c>;
 		vddrfa1p3-supply = <&vreg_l6e>;
 		vddrfa1p9-supply = <&vreg_s5a>;
@@ -974,6 +1004,8 @@ bluetooth {
 		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
 		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
 		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
 	};
 };
 

-- 
2.52.0


