Return-Path: <linux-arm-msm+bounces-46300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5110AA200F3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 23:48:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A1CE160B9D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 22:47:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32A721DE4E7;
	Mon, 27 Jan 2025 22:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="pVDR+DhI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB4F1DE2BA;
	Mon, 27 Jan 2025 22:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738018003; cv=none; b=bodm8/Q7EI6FtlFb9AF4cmSjSJroM4W1SW6E7yGTmdLdUYYcYT75GfrKq5Rz6d2GvOJ2erRqvkmk7TBTFMzI9t8yRCmEuzZMVGYZF6lrf26NLUDoEgBfW9+8CRUV3LJoad6KmHhDcyfEwe6AJcsR4rCPyzUFr1MOmC/4yUnqWtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738018003; c=relaxed/simple;
	bh=c3OdZXsHQl8Hpj942CA3+f4fIQmaWKu9wILF5OxwWc8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rKiHHDN0HgPRfjCEUA9D8GsUjPQCm2n/qtdWtLubjPjHpZxaKicoTVknGZZWHjjuznOlHDNxeuVkOmbQXfQBPEgTg9Il6igkAY1UisuM2aLjPhiisHybGEv+J9vshm51i8nz0Dk/uBXGsgOEM6QzVxLCGE2Ddg91FbHOOBSEHoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=pVDR+DhI; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1738017998; bh=c3OdZXsHQl8Hpj942CA3+f4fIQmaWKu9wILF5OxwWc8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=pVDR+DhIatgq6Pw2w0H6796kOwPg6LICoCBWMLC1zhnGAdnJk+YYuuxpW7MrKJOE7
	 qtC/W4pMWqG5+TMv1rYt3ydkExcE6u/q0pDhd8kQkKK+LRJ8vo8PSNuM2f31uBLuw7
	 XfzhaqZ8PhH8pQenWYx8SBplS5ZkjJHfyK+kJdVk=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Mon, 27 Jan 2025 23:45:40 +0100
Subject: [PATCH v3 08/13] ARM: dts: qcom: msm8226: Add smsm node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250127-msm8226-modem-v3-8-67e968787eef@lucaweiss.eu>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1545; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=eoHX87/Yfz6a9HStDewruF7nDlvvxRzf55C1aXv2xuE=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBnmAzF1tqAQ8fKJpHx5o7eoXVPQBp7i+j51G7zo
 fsOuAvTwn6JAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ5gMxQAKCRBy2EO4nU3X
 VjgvD/4uo7Ya4Lf5BxLiEqfl/mESJIIWZjuRA/Xz0yorTCcWPRUHtnzhW5bvye557fN8MQFqJdK
 9uvl+ubghWLrQcOK/nz/WsOGTqW9wIAF9BiSQqpVPdd7A46Tk9eO/0GESWRgpI4oOhiviECIpck
 MRgm2QvWo1vb9beNPIDAwD+KkOiZlz1tqnDvQ1NqyUUscEOk+XfP4ODS/io/52mBs4h6K2VNq+p
 JYRNcNOVoEh3ixcIcxV/G/G5sPVFwty0YQSh1GfKBHujP3cpaabw/LccQFBs/Apz41JNfhEcaw7
 4iwdvMw+se+nbNLtOBFYIfNBLqg0OxtvUS5vaFIpc7M+ssTtlQ+8lZmzOT+L5H5Xaz7b+/iPgEx
 nZu1y4veZrI/2ST3eXxw1BQyiFHQeuAwWpKLLK22YfAmOKmbATeY/coeMauZvUjtyNj7bi4dz2R
 RTIM73JtUAXC1eoBfcrQF0liSdj8JliVYRlhM38l9B3W2Aw8jkw8/lzZ0gmqNbcgkM1rxVYIYyl
 ToSLpUJVqO54y/0mX5pV45cmeYP+G8I7ydAJ2muFp0oNE5bPeYq0ZBQkxbPTUKrhRywo/DNPezw
 uv+vY0Dh8OaAiCChDNzCuuNc0XeYbZvX71ofgHkJVWqcAlTM3IOFjo8uejXbfgJqCYSDvvrYWIL
 0m/H7F5Y6EjMNqg==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

From: Matti Lehtimäki <matti.lehtimaki@gmail.com>

Add smsm node for remoteproc cores.

Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>
Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
Co-developed-by: Luca Weiss <luca@lucaweiss.eu>
Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi | 34 ++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
index caaeeadf289f78d29403312738bbb714eaad74d2..7e0838af6c2d0dc26e0082471b70578bc627491d 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
@@ -253,6 +253,40 @@ adsp_smp2p_in: slave-kernel {
 		};
 	};
 
+	smsm {
+		compatible = "qcom,smsm";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		mboxes = <0>, <&apcs 13>, <&apcs 9>, <&apcs 19>;
+
+		apps_smsm: apps@0 {
+			reg = <0>;
+			#qcom,smem-state-cells = <1>;
+		};
+
+		modem_smsm: modem@1 {
+			reg = <1>;
+			interrupts = <GIC_SPI 26 IRQ_TYPE_EDGE_RISING>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		adsp_smsm: adsp@2 {
+			reg = <2>;
+			interrupts = <GIC_SPI 157 IRQ_TYPE_EDGE_RISING>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		wcnss_smsm: wcnss@7 {
+			reg = <7>;
+			interrupts = <GIC_SPI 144 IRQ_TYPE_EDGE_RISING>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	soc: soc {
 		compatible = "simple-bus";
 		#address-cells = <1>;

-- 
2.48.1


