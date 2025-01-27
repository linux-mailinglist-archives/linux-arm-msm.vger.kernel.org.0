Return-Path: <linux-arm-msm+bounces-46302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A047A200F9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 23:48:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B9011163205
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 22:48:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B99EE1DE89C;
	Mon, 27 Jan 2025 22:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="B6dGu+Y6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33101DE3A4;
	Mon, 27 Jan 2025 22:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738018003; cv=none; b=gMxI/rFRYvhwX6swxDxuumT3yesdfO9DcynkJbmtD/XyGwMfIjWJcv+UhJBwoG2UxIKDzUHGmicGABD23Ni8+Xx10CGbAUz7/YjHtlpTMdCjC6/FF6YotD3IhlRz2ZTlmO9l0SV7ANwMqMw4VCESP9yVu520RRV8CP8uuJEPniM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738018003; c=relaxed/simple;
	bh=6O44VzCK6ZQX9n11tItDrPeEP6WQi0aIao3attwQ2Rs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jp/VfXPnoyHOuitIeyVK+0sxAscvcitc8vS9qj56HkF+TcQSVTr2jNjUXc/z5scgFhZyp2/wV84jrW5U9MgS1gMBl3K4IWdZp/4lQGUNt0SxYVyirr+JgzVVDMscF70i22FwTG/eoEQcVb1i7TmB4/ASR7HzW0zgAuTHGJLyFfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=B6dGu+Y6; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1738017998; bh=6O44VzCK6ZQX9n11tItDrPeEP6WQi0aIao3attwQ2Rs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=B6dGu+Y6WFuUQva/XLayyXfBGrCtId2AeO+0ofs0wQLTrK36t+vzS1dgIa0vsNt6+
	 3vVSIYW2aAcYIm7vSxfVxcgfnPSuJ0tvN5UhI67DEbcQHdQoJ9iljBvLlBe93Av3kQ
	 r/rY85q/2j33MYxT/hKgbqCHOKr5hxaKtjhrz4p4=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Mon, 27 Jan 2025 23:45:42 +0100
Subject: [PATCH v3 10/13] ARM: dts: qcom: msm8226: Add BAM DMUX Ethernet/IP
 device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-msm8226-modem-v3-10-67e968787eef@lucaweiss.eu>
References: <20250127-msm8226-modem-v3-0-67e968787eef@lucaweiss.eu>
In-Reply-To: <20250127-msm8226-modem-v3-0-67e968787eef@lucaweiss.eu>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1651; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=6O44VzCK6ZQX9n11tItDrPeEP6WQi0aIao3attwQ2Rs=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBnmAzH5EVYJppFU8n3K6xsRCc5AYn88vYgo1hZC
 XW+7NttcFiJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ5gMxwAKCRBy2EO4nU3X
 Vv/vEAClQKp7+VOWuVfC1JBa8P657fjfduE43OC8JZnXw/nia/tp7Q7RFmuDQAVbqOYqgKwXTTp
 afQGMt1eRSVS6a2d7br7fg1SZtkKjdu70utsksfYcr+8h1xzIQ4CEuqFkoMKYFGzd/T0FVgVne5
 ypMwYjaByVc3y/gdc0l9sWoZHGy5swpK+O6OqKH60zW+QKYeG0bAcUraTinGj411vrg59V/XQ3B
 E+eYs2lXllnsfrhhf39sJ3OiiPAEoEJN8Ur+zz6s9l/jCeAgirwJLNVf/v8a1uikjaVGY1oIASQ
 6IBOy7aC1J/7WL/rAvRIl/iHjKWWNQf2rUOi0IlzHr0Qeq3Rww8zddIEmCSrcHmBUqA85VAd6DD
 Dw+HiGPPY7GpKbkptcXni/wglp+LDWm7HEB2w4NJD3JRCdelYtdzocBTNTOAnB0tW8910oKSa8c
 cYZdBzSqFOBlIVcUEdv13SfN7CW3CM5E+JSLnv9B1Usro8E5E63yYdF2mpbdF8CEZhjhG9cUaYL
 qdkj8ZNwqS9a7NA7857m6o6/tU6l+rBmmPp/rRJNyZKHsMYV57IHs/xz8rwcSpRfFXajXPwOjxv
 nU9TYT9+aIY1UMuTQzBLOUsRPja4fCkXm9TQgMo2pTxmPvbeTHGrts7M8/i11EuV0wentOTdACj
 9bYOK8tpy8d3t5A==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

BAM DMUX is used as the network interface to the modem.

Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>
Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
index 55bb070dcf489064f5b14902da1acd2762232ef9..1091eb13576c1cce1821a9200d4c344387851583 100644
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
 			reg = <0xfc880000 0x100>,
@@ -951,6 +963,20 @@ modem: remoteproc@fc880000 {
 
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


