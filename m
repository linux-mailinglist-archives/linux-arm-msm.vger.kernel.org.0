Return-Path: <linux-arm-msm+bounces-89635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BB2D3A726
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 12:43:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ED3063008766
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 11:43:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07E11314B97;
	Mon, 19 Jan 2026 11:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aoEn4DSn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D803A3148AC;
	Mon, 19 Jan 2026 11:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768823006; cv=none; b=UYgMoJEFqxJRd3Ek1tzcmLA3MM2jd9y9iCj6DyWr7AZSx71NFlV6wYKEbw2PFo7hYlW4DkXFM+RoaLrSUIEUdvNEHJ966kb3Qk2ZnhHEJ73qNzIzhmw6FMVk9/jTMssXDTDC1ufqATQIHubZT7r3GdY5MhToH0rzYNzTxXN1Qg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768823006; c=relaxed/simple;
	bh=HlxDuIUJ4CIb8AABUH3nSxedc6wHlisddm3UisadGfk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=flo69uhm2tlW391RBul+RaeGGsrriTcKBF1wEd6HDERcJi8mIYlk9bGK/SImXSBa42VcmrZRxR1gyvkcyQ8oE4NC6TUUWz4xquTbxcpZMZrAMkWN1K/XCMkzdb0lgOXK01f8oaeI8Ij2+oT6mdhfLwF+I/9xjFmYKIJYktW2ORE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aoEn4DSn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8555EC116C6;
	Mon, 19 Jan 2026 11:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768823006;
	bh=HlxDuIUJ4CIb8AABUH3nSxedc6wHlisddm3UisadGfk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aoEn4DSniKudbt0XnwC7PyIJK8bJ2T3/GW3MvvpLstR0YdiarTei+aXvxXwsmpMsW
	 nGn7SwvNV2Gb8MYXvntAfaGfIjcubTf9R91FfwDLg14NGepgHLnxdOyIbYDzOxsOAE
	 pRaQ0MdHqezNe8PFqWRXqCXoLDtD2D/WPn9NSl6FBfS24svR/MdN38kfkFcZALxAAf
	 0mX75Ay1aNkLVyyWY2/Er/tDxbLROApbuiWOOuCzji1Z7bnjpn28eM95AhPJGrtk0Q
	 Pq7j+EgVEruN0641JXsLRigJoiVREpt/nKHGb3zcp9tSUv1KfpUgJYibjWRvB+14ok
	 zhP167f1q3QIw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 19 Jan 2026 12:42:32 +0100
Subject: [PATCH v2 10/10] arm64: dts: qcom: lemans-ride-common: Fix up WCN
 power grid
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-topic-wcn6855_pmu_dtbdings-v2-10-6d1c75608bbb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768822946; l=2448;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=pt5WfOoWjwVgQjUoCs5WtSNvxy47amyc0bGnLFyp/+E=;
 b=vLsAOtzIlPeyJFHbYWZtpfrk+H6ri1hIhcnhY0/xfuwhK8ml6PF9m+MrNXENWc6hG/5Vh4w4e
 y77Y5jMX6LTCYovaZhCiZe6kstQEdGItFlrTvLg0I3AiWgA8AR1DfJi
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Make the dt checker happy by filling out the required properties in
line with the schematics.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 32 ++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index 8fb7d1fc6d56..7ae5f8447b42 100644
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
@@ -982,6 +1012,8 @@ bluetooth {
 		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
 		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
 		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
 	};
 };
 

-- 
2.52.0


