Return-Path: <linux-arm-msm+bounces-52576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D57EBA72867
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 02:52:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1EF53BC26F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 01:50:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CC621A3A8D;
	Thu, 27 Mar 2025 01:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nuLsRp+e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108531A3177;
	Thu, 27 Mar 2025 01:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743040088; cv=none; b=cV9hIdLX1EzcK8wZpIfKriyepBdnjys8KaTJzBKQvz9q/Z3CCIbH+o2X7R6LKpjF+9xDWiDt6YX/B4mxIsIhQ3YrgFYOlITO9XIxw658/jEWh0/RzJGXg2izB/Ur1/ABe/bDS3FeoX26PUfzOJ4r2FIet5ChyQA4Yr5g1dyja5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743040088; c=relaxed/simple;
	bh=/4YdO1GJGLD0jC6z9VrLqBYptJUx2VKG3GF0pPUl6GY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c4Gc6Diti9UjpeoXPjTbT5KrdAmtWRlRYdjsoGlUjbUD431+/GyQxAPJE1am11iVdxm9ErG7BHG8FCk4EnHsHXDgGDr/0vz5ef0jr3Xp0eLtczGOQBJXIya+c3+ABI+ej7yz+N7BpvPf/EfUI7Se/Mh8Ez86HtW4ITVp2RnNjJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nuLsRp+e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60DF6C4CEEA;
	Thu, 27 Mar 2025 01:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743040086;
	bh=/4YdO1GJGLD0jC6z9VrLqBYptJUx2VKG3GF0pPUl6GY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nuLsRp+eElFmwW4AriAzHEwVhukJ9yZh23Ne/Vy1I39AcPgVD624Z7J9qxyrd61Zh
	 kAYR40EwXQr2lf1y0B458SXyASK9i5iuB73PDem931WnJ/8lmjbtkilJwyAmJjWgCs
	 /E/USGuEt+yZ8/W63sZIEt/pohAqjgf6BdZqVPz+BtFuwLnt7EnR3rJh/aDb/Vs57h
	 SYBU+blt4ivg3gBElxKSCqw7tXu6QeNy55BKuKVm1+q+hhYqPgIGJW4bmajAF2snip
	 VYFwVThu/495DiGfl2XfRV3Z1+TS4qJpoySAbuYkkPKSDN7hFU2VeGrXHx/hTscOqd
	 lDRrCScxX8KZw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 27 Mar 2025 02:47:12 +0100
Subject: [PATCH v2 10/12] arm64: dts: qcom: msm8996-oneplus: Add SLPI
 VDD_PX
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-topic-more_dt_bindings_fixes-v2-10-b763d958545f@oss.qualcomm.com>
References: <20250327-topic-more_dt_bindings_fixes-v2-0-b763d958545f@oss.qualcomm.com>
In-Reply-To: <20250327-topic-more_dt_bindings_fixes-v2-0-b763d958545f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Marc Gonzalez <mgonzalez@freebox.fr>, Dmitry Baryshkov <lumag@kernel.org>, 
 Arnaud Vrac <avrac@freebox.fr>, Sayali Lokhande <quic_sayalil@quicinc.com>, 
 Xin Liu <quic_liuxin@quicinc.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743040027; l=2079;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=D7BUCHgow6Uq1lac6jP+0pbyBvLSvmyf4g7T5vPXdQM=;
 b=QxG65m9suuVHFSqAlPMZRoJSoEuTYvRp202g7KgLARb45ddzBVJjcBUGC7DWGwb7s76nB+dX5
 hZWkM31mUZQBz23trfiltG3AGrC3zWcQQyzNBnfxqJ0qfaWgiIjoO64
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The PX line powers some hardware related to sensors. Assume the board
doesn't reinvent what MTP has established and hook up LVS2 @ 1.8V as
such.

This fixes the 'is required' type of bindings validator errors.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi | 5 +++++
 arch/arm64/boot/dts/qcom/msm8996-oneplus3.dts        | 2 ++
 arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dts       | 2 ++
 3 files changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
index 38035e0db80be9c4829b67233ba5c4ce8a2baa21..b263d3a204e54a88642bdb6bd7b9e9d7f8fdb2f2 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
@@ -492,6 +492,11 @@ vreg_l32a_1p8: l32 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 		};
+
+		vreg_lvs2a: lvs2 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
 	};
 };
 
diff --git a/arch/arm64/boot/dts/qcom/msm8996-oneplus3.dts b/arch/arm64/boot/dts/qcom/msm8996-oneplus3.dts
index dfe75119b8d25fce4a6a14e0ab4f07414aadc8c5..220eeb31fdc70b89b3e237d1f6643c465bda5238 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-oneplus3.dts
+++ b/arch/arm64/boot/dts/qcom/msm8996-oneplus3.dts
@@ -41,6 +41,8 @@ &mss_pil {
 
 &slpi_pil {
 	firmware-name = "qcom/msm8996/oneplus3/slpi.mbn";
+	px-supply = <&vreg_lvs2a>;
+
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dts b/arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dts
index 51fce65e89f1142cff98fcdecde9744b87decdc3..f772618e80c702cb8995965dffbf5992a9f66490 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dts
+++ b/arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dts
@@ -42,6 +42,8 @@ &mss_pil {
 
 &slpi_pil {
 	firmware-name = "qcom/msm8996/oneplus3t/slpi.mbn";
+	px-supply = <&vreg_lvs2a>;
+
 	status = "okay";
 };
 

-- 
2.49.0


