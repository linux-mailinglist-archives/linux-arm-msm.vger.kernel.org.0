Return-Path: <linux-arm-msm+bounces-23297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C2190F83B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 23:05:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 86B28B24C4B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 21:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 739C2161306;
	Wed, 19 Jun 2024 21:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="ZqGAiD7+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0D315CD77;
	Wed, 19 Jun 2024 21:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718830992; cv=none; b=CQtBceq2NYUw4Th4nWEOnx7zIf/fgjgyMLb/5krKZjfdPGzS5r57sp0eKS60i8rY57SQb3f83BGrL8uC5GIx7LmkdYRMSXECkneyuHEx3UBIz3fhEnSBacqIhgbfRygcyA7/mTHho7FHHRIKmVlv3XoHp6fFvhvwEmInWEBHOY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718830992; c=relaxed/simple;
	bh=QWyXpCDytX4xqVrRXmt0Xo2P70w0iAdxTSeodVhUvG4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H9Fb3YWccA2i+WJkNSkOMUGHFXVcLtDDgRe+loZBV537s7JK8Mvl29vl8Xrf15Vdv7emokqUJxI0COGU8VTHXNy0KCioUXHbB/Ya0wPM+o1OSrap3a5uh7C/iq/Zd8Zir8uv9OTJ2vGTiX3ELnRx6w5Esy6seeoCa+ismfbotl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=ZqGAiD7+; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1718830987; bh=QWyXpCDytX4xqVrRXmt0Xo2P70w0iAdxTSeodVhUvG4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ZqGAiD7+wLxqoKOocyonnzsQBQjVYYpbVWEh7eTV15N2MS6mfVlezhxMJyxuFwPyP
	 9LR8pZZL1RbJuAJPg9DtkssoYpIE+9aaNEIqriRNdeO0dfmXabJjEbtr15iWonIJzE
	 TwPLEoSklldP0wJ22Zgr21g7JTIvFNAif/gb+8lI=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Wed, 19 Jun 2024 23:02:51 +0200
Subject: [PATCH 7/7] ARM: dts: qcom: msm8226: Convert APCS usages to mbox
 interface
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240619-msm8226-cpufreq-v1-7-85143f5291d1@lucaweiss.eu>
References: <20240619-msm8226-cpufreq-v1-0-85143f5291d1@lucaweiss.eu>
In-Reply-To: <20240619-msm8226-cpufreq-v1-0-85143f5291d1@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1217; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=QWyXpCDytX4xqVrRXmt0Xo2P70w0iAdxTSeodVhUvG4=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBmc0eH/A+cTeCKbuN2F/m0lto1DGSCF9uaeDnV3
 Un/rUvRLbOJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZnNHhwAKCRBy2EO4nU3X
 VoLXD/9AP7duQM9JB397TIT24WwGlwFSyqkmoLTejECN0M6AnlBw4XpWpQeozxo1dTDaa7pkB6S
 bCY1rvt7t8mokSZU5st6OhXbuipuZ+J5ejFCYooLCCWkrhs1U/w0+iE93lftQgdGRNfA9LhIWSV
 XKGyPc54c0EIT4HNA5bsz4CSa+L974CDSyifoenBndahUrBu2ZgQEzdlkJwjqD1fkyJRHd9CSw7
 jU/PD035nI3jnL/QO4AF7IHBeK7kiNiChdjaLnVa7KBHge4Xg5oPlxAKh85AAUsXx1lW7kK1O2f
 P/YZfNKrQVkzzrOa3IqQ9eJk1ORjgxrHRAwyrGLvJyJ1OVeGXyHJo599fMTvH/lfUwfp+OeI9v1
 wXcyLmHrPpeQi2m9uQvCuqchC1Bmur5tUnAEFfVVkUCfosspWVJrhfjrXKESkJBx+zw7gAdf/KQ
 WY1vhyNy/Pube3NYkkRjSKI+8azOwSdGvLQ+Pj8aD8kOqSqwVq9U2g+30+SlsLniOlTW+hoUwGm
 QZEVbWTEAOpXPVHbVCMcsxuhno7zqocu8R8dOYU6TluZjm8xlz25Kw6k3gSqDHAdfyuZZkFpz1n
 r6uw5Wd5kdTvvGO0VUsY9xRVKis8f6rqKvSKJFGTjUm13ieuSDVPSsQ9QiM3korawPjcob+kKKB
 g10h5Lx5eJJ9oWg==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Since we now have the apcs set up as a mailbox provider, let's use the
interface for all drivers where possible.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
index 9deee34fc5ca..5c1122f93054 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
@@ -157,7 +157,7 @@ master-stats {
 
 		smd-edge {
 			interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
-			qcom,ipc = <&apcs 8 0>;
+			mboxes = <&apcs 0>;
 			qcom,smd-edge = <15>;
 
 			rpm_requests: rpm-requests {
@@ -235,7 +235,7 @@ smp2p-adsp {
 		interrupt-parent = <&intc>;
 		interrupts = <GIC_SPI 158 IRQ_TYPE_EDGE_RISING>;
 
-		qcom,ipc = <&apcs 8 10>;
+		mboxes = <&apcs 10>;
 
 		qcom,local-pid = <0>;
 		qcom,remote-pid = <2>;
@@ -1232,7 +1232,7 @@ adsp: remoteproc@fe200000 {
 			smd-edge {
 				interrupts = <GIC_SPI 156 IRQ_TYPE_EDGE_RISING>;
 
-				qcom,ipc = <&apcs 8 8>;
+				mboxes = <&apcs 8>;
 				qcom,smd-edge = <1>;
 
 				label = "lpass";

-- 
2.45.2


