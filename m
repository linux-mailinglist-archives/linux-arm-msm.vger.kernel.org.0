Return-Path: <linux-arm-msm+bounces-48297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FE1A38EB4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 23:10:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED9663B439F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 22:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99EB81BEF87;
	Mon, 17 Feb 2025 22:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="SOy7HgH1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFADC1B0103;
	Mon, 17 Feb 2025 22:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739829963; cv=none; b=FiNYIhZBjj4mwzbJjJzkHEU3PxGfLrqm+Q6Afi3U+5krz1IEtXDnHZxbB0Rp2iOngHnWuCbnb/I5eMIos123eFAp+6aHIqaBrxdtGSxaPIxZsxeu6IEUOpSG1ZlbIC6fUl+faTk5qxsUAkf6TFP1OpvvuZG9v5nKqzmqne1JQ9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739829963; c=relaxed/simple;
	bh=sGfPDtDxBQh/dYA1FcKq943zfL3D9IzXqjda20D20wc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dyu858bsIoxhd3g0uBpD7E/28NXYyKF3FComRJr/ZHDt3wy4O7uAjM/yOEAyyr9yXEs1mEuowIkU0l9/kEM0oYDHzsR6zYRXAkt+5VTu6Rk8FAlBVYsxl+S3RbcTqF3cxZPROTp1lwSSvbL+eJJosnChCtm6i+5KZ9I0/QTRhdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=SOy7HgH1; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1739829950; bh=sGfPDtDxBQh/dYA1FcKq943zfL3D9IzXqjda20D20wc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=SOy7HgH1ny0pgjIkHqbOAZXjBhMcSMJFsD9Dim7cTNPy5S/LPi8MrfUjXpbGgcQ3+
	 RmmuiDxc0rps/wgQPtoiNb1SJ4Fp1YqrqE8hhVn3bur5xXJAJ4HL8VPDLWRvLvzq+S
	 YL9YmRqj9uckwdH9+qnhrIix0p66jWVmynksJfcQ=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Mon, 17 Feb 2025 23:05:24 +0100
Subject: [PATCH v5 10/13] ARM: dts: qcom: msm8226: Add BAM DMUX Ethernet/IP
 device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-msm8226-modem-v5-10-2bc74b80e0ae@lucaweiss.eu>
References: <20250217-msm8226-modem-v5-0-2bc74b80e0ae@lucaweiss.eu>
In-Reply-To: <20250217-msm8226-modem-v5-0-2bc74b80e0ae@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 =?utf-8?q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1652; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=sGfPDtDxBQh/dYA1FcKq943zfL3D9IzXqjda20D20wc=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBns7K453EuxkjQrjxiprXBt1FvJ+Q4boisvnI5m
 yIIpPj4HfeJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ7OyuAAKCRBy2EO4nU3X
 VnYeD/4wxu1xD93+8KLb2SqlX6odehREUQv3mQuBAv0jdLJABt+G5MZtllv1H3m9afQQ+Oo+ZmG
 wuWzkzcFlw1l6XBD/v5qK3PRqewTQUEUoEFzIXmHnAV+osx1qIVUj1Jmz859arITMOw7Aq/u7BF
 JXvMHtAcEWVIBrMZAuj0+yhBg8DoxH94jvp6zPFeUrp8q+Ibghys3dRDaC3MxJU/CK0ZbBzbjl3
 s8OW69bKHiz1EMjkTwEV7br+MnpelI4bGyFLHcSirmts2giLzNFoM7OU6wdelxmyF2JiJg3HhgW
 rkK2kZGzJOSq+DED3VzC4P9cjHLJQWDLn2EYtxkhpLCn+G2GQ+tVdbsYD5KgNzESwOnbDAQLp9H
 J6Gril1y0oEIFdxqv8qXWQea2El3DWRwS80zn+sQm5hRVEARJx60uvgeVKKJZ9R3mSXJPNpwDWU
 A/wyHmWGKh4//s6d5gPzKl9+C7PoDxzTckvRPtKc+XWLCH0+EJb+7VSsEZW91DLfBQEg/vReDIH
 eFU4bvMf4sKoI3ha3gBC0qwyXUje7i9NQK2NS2iHpK9iJaw8WSbWzYRpNDDm3XpajKbt/r7/x0w
 BXWXeLlUHbnShfsPPS43kcBFoOxsGhOfzgqG7SGJLDrrl2xZ8dr0+6aTMmTWcOavTLxfpC1hnPp
 SRxm7bu+JUUffYg==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

BAM DMUX is used as the network interface to the modem.

Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>
Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
index 662911f4cf163c3a5bdd1a4d5d79713074accc20..32defb08b9094956a04f490015383c263901a907 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
@@ -916,6 +916,18 @@ spmi_bus: spmi@fc4cf000 {
 			#interrupt-cells = <4>;
 		};
 
+		bam_dmux_dma: dma-controller@fc834000 {
+			compatible = "qcom,bam-v1.4.0";
+			reg = <0xfc834000 0x7000>;
+			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+
+			num-channels = <6>;
+			qcom,num-ees = <1>;
+			qcom,powered-remotely;
+		};
+
 		modem: remoteproc@fc880000 {
 			compatible = "qcom,msm8226-mss-pil";
 			reg = <0xfc880000 0x4040>,
@@ -959,6 +971,20 @@ modem: remoteproc@fc880000 {
 
 			status = "disabled";
 
+			bam_dmux: bam-dmux {
+				compatible = "qcom,bam-dmux";
+
+				interrupt-parent = <&modem_smsm>;
+				interrupts = <1 IRQ_TYPE_EDGE_BOTH>, <11 IRQ_TYPE_EDGE_BOTH>;
+				interrupt-names = "pc", "pc-ack";
+
+				qcom,smem-states = <&apps_smsm 1>, <&apps_smsm 11>;
+				qcom,smem-state-names = "pc", "pc-ack";
+
+				dmas = <&bam_dmux_dma 4>, <&bam_dmux_dma 5>;
+				dma-names = "tx", "rx";
+			};
+
 			smd-edge {
 				interrupts = <GIC_SPI 25 IRQ_TYPE_EDGE_RISING>;
 

-- 
2.48.1


