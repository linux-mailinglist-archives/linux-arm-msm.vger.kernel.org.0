Return-Path: <linux-arm-msm+bounces-84829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C08ECB1837
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 01:38:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 957E9310333C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 00:37:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F87D1DEFF5;
	Wed, 10 Dec 2025 00:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ek/7y7xT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952E419309C
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 00:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765327066; cv=none; b=EjwfsagsH43gK4QInem1GgBcE/tSRwFJ2R2m5o+PGSRZEuT+10nU3FyiSNhXBLlyBB19jshb2Fzmkif/RmBPovN3y5Iw9koHaDIYvKN/JYpe2WnNDb69Q/XpRP4hy/t88K+YZJgRZhNEoAJZra0SCNHdFLkhYhUEFE/BZd7C+LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765327066; c=relaxed/simple;
	bh=kMV2klR1DStzeKF01dgOaxxEEFLWBWwy94a3z1Sv2lM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e0OdkYgD4BsBE8MdVQwjCtGqYJrBlLJm/NSLwUgmL0AQ/RjS1xBzDuS7ouRdaWIWZaa35PAkN7D7ugF0r9IDxWI29VHDzIfxp2TH2c7d/Ablg0Zfqi3e6X1puQdLL8d09tfjRyadGMtTlr1AYvSSY2F+TsaTccMXeIOCukoICb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ek/7y7xT; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-3e89d226c3aso3617295fac.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 16:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765327063; x=1765931863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cTnBfhCPlftBcGJdY/ReLgnu94bb7n8RiqGchanYiDU=;
        b=Ek/7y7xTnPtM6ZvYYrhiuJ8zoWIsOh3W8CvyjYjorDjpDgW44/80kZ1pWAG6BJmQPh
         DAt1bYMzjvvHFzVVQoQGv4xY0s5FDeEXl8ziMZ2g8qj1y21Dd4GnEaQIfVki7G5XyJqL
         Z6nmEvtglTzAUlmjz2z7p7N9V7DJygqwM4NnFnzMc4QSvqXvzsTJMOuHPxS5DUScxkH1
         xXrz2Frv6f90hedYiA9daM+9ohmOP69aZfvYVzOOfMa4i9UXF3KmGbznC+XCnIHRQXDs
         npz46EcfWgxeA26I0i6vHJFvKs1Fmue2/0HFE/qN9MrbbAErr2WEuwnhoIWAd1UwF6dO
         OOEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765327063; x=1765931863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cTnBfhCPlftBcGJdY/ReLgnu94bb7n8RiqGchanYiDU=;
        b=nGdfdISU7+WWPvckF8X7sYXAr8W/BnW8Ty6ZqeRwkz93wV9Fg9oK88HZara/OZqEn9
         3aQBMZHx8qbgkKMJsQF+UhtNR824lM+xgJxkmhOsO5sCu+PiUJFW6BVmapL2PO3+HD94
         vTGW1pBMSx+FMeGBKtyn3bl9oKig8d3/hN0YgF2apmSk6mLSdqVSRRB/3xGQI0SvlIAk
         /ee1Y8ClyQrKC+WgnhRRSjcVydnJsBHka0sFwsINd5n4T6sWChIsELNrVmLZTur1DDba
         tV1Oy+u3MuAhV8CQtcjZOJ6JUnZZGaNc/0LSdEjyGldSiOQ8f8mIubhGP87MS4inZYZr
         FidQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdX8tMMooM/9vH4halPYB3Lg+B0e/FekS/3a5VjkYPX+EGChHGQWMLt+rnl+AxSoh6+7Zj17eV36OcBXpA@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3IC6e3p9SkdMuE0QZkRL+VXmNugWLhVptHrrL0/5AMl0mJNZf
	Xr3XyhGjUUBY4dPoDeNb9fBE/+CvwouxMiDY2dT7SJ1X64lSqNbVZX4V
X-Gm-Gg: ASbGncskthVbsG8tiI9KRdE63PSljvuIRGaBDvioHu2ZQqw0pLT211vNIHyxNWxobXV
	ry2sCk4LpLGnfEF3Gv210IMWb9l1fgugd66q4o/qlxs6jBNLufE63W4xG4Vu0/uW7SvEMu6VgWS
	O/U2bz0uo9wOyhORPraHiofsaozEv8Nn+BKgnI4JqMU+Ie5DwCXQ2dBepEBlCuZtij1dgKwkdl8
	m8j1BKd3vU+PO2Q5gdpVeup7hbKYO+qk5SNtA9uZ//HymQT5eH+bGIsyy7CeES75ONc30PkTBBP
	FW/kjpPu93qUUZ9gE33WZw3LeyxAXEZHds1NvrAsE3NOwd/8/sx7I7DgaHFzM1I2brC4gIRqWQg
	AelVF5NLlctLrvrS9debvzmW1/PtEerWxC6t/XnnSjVT7yGjflkfFNGmX+9A9+PCviJoJvENdu7
	a7+Zn8bo1M9E/ipR28wVuOClDrh8VhK3ZxB1yveC/VY+2RP1Q4Upk45Azd8OY6QqfXczmnLJmZm
	V7eV4NWInciyjqIY6bd2ve473fb
X-Google-Smtp-Source: AGHT+IFXtFBZQ4Phs+DA2gIk8zEB/PSTinPp9kLxq66H0kohPSDEsTuKzeL4L4ahy6FStdu0aIQDxw==
X-Received: by 2002:a05:6820:168a:b0:659:9a49:8eba with SMTP id 006d021491bc7-65b2ad5bca7mr509385eaf.62.1765327063516;
        Tue, 09 Dec 2025 16:37:43 -0800 (PST)
Received: from nukework.lan (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6597ea6807esm8588826eaf.0.2025.12.09.16.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 16:37:42 -0800 (PST)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: mathieu.poirier@linaro.org,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [PATCH RFC 3/3] arm64: dts: qcom: ipq8074: add remoteproc nodes
Date: Tue,  9 Dec 2025 18:37:25 -0600
Message-ID: <20251210003729.3909663-4-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20251210003729.3909663-1-mr.nuke.me@gmail.com>
References: <20251210003729.3909663-1-mr.nuke.me@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the nodes for the WCSS remoteproc loader on IPQ8074, so that there
a use case for the DT bindings. GCC_WCSSAON_RESET is not implemented
by the GCC reset controller, so use a placeholder value for now. Leave
the node disabled so that remoteproc doesn't start up with the missing
reset.

Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
---
 arch/arm64/boot/dts/qcom/ipq8074.dtsi | 79 +++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
index 256e12cf6d544..86369fa680553 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
@@ -108,6 +108,11 @@ memory@4ac00000 {
 			reg = <0x0 0x4ac00000 0x0 0x400000>;
 			no-map;
 		};
+
+		q6_region: wcnss@4b000000 {
+			reg = <0x0 0x4b000000 0x0 0x03700000>;
+			no-map;
+		};
 	};
 
 	firmware {
@@ -390,6 +395,11 @@ tcsr: syscon@1937000 {
 			reg = <0x01937000 0x21000>;
 		};
 
+		tcsr_q6: syscon@1945000 {
+			compatible = "qcom,tcsr-ipq8074", "syscon";
+			reg = <0x01945000 0xe000>;
+		};
+
 		spmi_bus: spmi@200f000 {
 			compatible = "qcom,spmi-pmic-arb";
 			reg = <0x0200f000 0x001000>,
@@ -1003,6 +1013,50 @@ pcie@0 {
 				ranges;
 			};
 		};
+
+		q6v5_wcss: remoteproc@cd00000 {
+			compatible = "qcom,ipq8074-wcss-pil";
+			reg = <0x0cd00000 0x4040>,
+			      <0x004ab000 0x20>;
+			reg-names = "qdsp6",
+				    "rmb";
+
+			interrupts-extended = <&intc GIC_SPI 325 IRQ_TYPE_EDGE_RISING>,
+					      <&wcss_smp2p_in 0 0>,
+					      <&wcss_smp2p_in 1 0>,
+					      <&wcss_smp2p_in 2 0>,
+					      <&wcss_smp2p_in 3 0>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack";
+
+			resets = <&gcc 0xffff>, /* GCC_WCSSAON_RESET */
+				 <&gcc GCC_WCSS_BCR>,
+				 <&gcc GCC_WCSS_Q6_BCR>;
+
+			reset-names = "wcss_aon_reset",
+				      "wcss_reset",
+				      "wcss_q6_reset";
+
+			memory-region = <&q6_region>;
+			qcom,halt-regs = <&tcsr_q6 0xa000 0xd000 0x0>;
+
+			qcom,smem-states = <&wcss_smp2p_out 0>,
+					   <&wcss_smp2p_out 1>;
+			qcom,smem-state-names = "shutdown",
+						"stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts = <GIC_SPI 321 IRQ_TYPE_EDGE_RISING>;
+				label = "rtr";
+				qcom,remote-pid = <1>;
+				mboxes = <&apcs_glb 8>;
+			};
+		};
 	};
 
 	timer {
@@ -1182,4 +1236,29 @@ wcss-phyb1-crit {
 			};
 		};
 	};
+
+	wcss: smp2p-wcss {
+		compatible = "qcom,smp2p";
+		qcom,smem = <435>, <428>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_SPI 322 IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&apcs_glb 9>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <1>;
+
+		wcss_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		wcss_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
 };
-- 
2.45.1


