Return-Path: <linux-arm-msm+bounces-46164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F39E4A1CE93
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jan 2025 21:58:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE2121886AD9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jan 2025 20:58:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6594F18A6DE;
	Sun, 26 Jan 2025 20:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="ZnhvVbg7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62575672;
	Sun, 26 Jan 2025 20:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737925065; cv=none; b=Ho0lk0eW9NDn0tMWSlnSwUP1GtPHJGooQbQYP5xkvJy+2bX/JECdSPE4DYfiaqhBNBf7GUhJYN4wFRGNClzqCzrB01er4jvzLnH0bORDL2iaxl2AonmHJgzlvRtlkhSXMmxt/sbOSXKegiK0wbsjTiARAgA6yKjTjkrTvipGTJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737925065; c=relaxed/simple;
	bh=asbDMQ42SDs4b1srxiQIMMXY9QcxxqIiu1L0P2FyiPc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jIGWMvBFxEf7cXHARB1Ilre2tVIjaWck/j14ptjN3fqRU3NjrXoj+cMh6L4N0aBjgBjUlbdzIRJyE7Tj1QBU/FWZSlb5LDk8dUq6yHJSzDrbOERAYUTrlCmL9mKG0XVqu8bHg9dVwlSgNHIlkVYP4PemLYHbyE3yhRTL2AyCOR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=ZnhvVbg7; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1737925054; bh=asbDMQ42SDs4b1srxiQIMMXY9QcxxqIiu1L0P2FyiPc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ZnhvVbg7incZNegJmcuX0IdV7Qmj/FD542qYDf9KbDMJaHrIlqfIdKaKY4OYIBuOX
	 EcJEr8rKK2b7MX19X67vUJ0A0A3E5xEEUCkYygzvJB0n4zlsXSdT9/x74vLVrU3GCl
	 0u/+6h2lphTJojyz69NcLPRDOgnG50NGN0ODsHww=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Sun, 26 Jan 2025 21:57:24 +0100
Subject: [PATCH v2 5/9] ARM: dts: qcom: msm8226: Add node for TCSR halt
 regs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250126-msm8226-modem-v2-5-e88d76d6daff@lucaweiss.eu>
References: <20250126-msm8226-modem-v2-0-e88d76d6daff@lucaweiss.eu>
In-Reply-To: <20250126-msm8226-modem-v2-0-e88d76d6daff@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 =?utf-8?q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=916; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=eB48oZipWmKlZ7VBf2h0qGYYC/OPKdoJotfz6BVVjs0=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBnlqG4kLtRx0Ez+mInLNBZInNTG7x5FsvcObxYk
 uffmJmvo/WJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ5ahuAAKCRBy2EO4nU3X
 VowID/9Ljv8+MUuUrynldZtmINRn10JpoXtEyzULpEKYlk+aYJ22o0w8TsLIFam36op4mrTfQgJ
 ddR1PaWB050MU/DKONFNb2HGRiwkP8N/2/ZLIn4flXcKEEGE/DdIPfKBtGQTMvgGGaONpu7Ze6i
 0Gj7SX41CWTd0mqIDzOAxnU0XO889IdaOa6jnhRJzPZ4glEZVvT3y6dGFIqCq3E22V4VAg8rFEx
 hafQU50BMbQdIOjY+1x0O6XDAjsSHcpxULOyqGk/G69wrMdia/kvKmcQjRRh+HgfJ0JZ2ljgbbY
 Upr8LRVuZjrpUg2vePFxzClOF/a9oDO60gLS8T3p/dmUJQgzfWV/99nC0GYTicp7c3lE5gBoWXm
 CRfWN0XfgBdslx3x05TZ/wj640JlhwzgcAeMkhrxF9MJqFQEYheoOVXDdM1euYHIHhEc2n8yvQV
 B1HjDMombyO32rrsrwPbkVj84xUrdKiIPszg/X3hK4xd12UipmB9/08L2wbZTpKMPgTgwvltE5J
 5Urtsy9xo6k6WYQjaoYVVMZv6SbmqBaosNt8hqx/4ATu9M42OwkabhRDZwAKh+WZWoLr6BqQRbu
 X6hxwdlSWkFH6ZIG2GHZV2Zn5t3J7ANroCO8QAQlvKND9QKgkTs6G0aj7/btnwNl5NQOUm+fM8E
 lWIw2MrfFS0kbSg==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

From: Matti Lehtimäki <matti.lehtimaki@gmail.com>

Add a syscon device node for the TCSR halt regs needed by
modem and other remoteprocs.

Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
index 64c8ac94f352e46dc4a18f902d2c30114ecd91d2..caaeeadf289f78d29403312738bbb714eaad74d2 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
@@ -851,6 +851,11 @@ tcsr_mutex: hwlock@fd484000 {
 			#hwlock-cells = <1>;
 		};
 
+		tcsr_regs_1: syscon@fd485000 {
+			compatible = "qcom,tcsr-msm8226", "syscon";
+			reg = <0xfd485000 0x1000>;
+		};
+
 		tlmm: pinctrl@fd510000 {
 			compatible = "qcom,msm8226-pinctrl";
 			reg = <0xfd510000 0x4000>;

-- 
2.48.1


