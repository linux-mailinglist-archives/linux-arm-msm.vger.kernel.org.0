Return-Path: <linux-arm-msm+bounces-46435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A86AA2151F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 00:37:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7FAA8188788E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 23:37:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72DCE1F76C4;
	Tue, 28 Jan 2025 23:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="vrxSjhZt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6841F5608;
	Tue, 28 Jan 2025 23:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738107392; cv=none; b=HnEwjWbzg+RTnPESQqEQPSeBej/90TaiXpDW2FqqL00bXIy4Tqr2Zn74otI1K1larpr2DZgljCd911EKKjx6c/3Qpa7BRkwXJlKaDaC5QnbDt9bcChlKp/CDoB3aMB/r0q8WHgvT0hVqh54RGMtv0x7F41N4cQjElwRoWkA7he4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738107392; c=relaxed/simple;
	bh=DLjfEGxFWMNPCYEaP5OzjsuwOiEesmoVFxG+cMzU00A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gy+/2CJd57BGJ7zpr5A/lJMry7mp6ECEHS8NA/hakOvOYSPCteU6I/oJDn1Yng/+IZ+XwK5V8QQJeW6getpdMeuNplZOgs+UKi8BGTixlQeGB6pyF+7nfmuGasT88GlM+fGZn3dUwSfhA1DoCtRYiSEsoDqcBwDvfx9SN2A5WLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=vrxSjhZt; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1738107381; bh=DLjfEGxFWMNPCYEaP5OzjsuwOiEesmoVFxG+cMzU00A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=vrxSjhZtEvM97mqDOsXs4Lvio/jBPiwgbWQRbf5//mrYCXNCVuR6z8mw/7KBl7swD
	 HXcRiVT9jupSYY+aNKa7zN1RbrixmUW+LueMOJ8rmMB5dqPK4zx9mTpEh3qm4f0kvy
	 46UYc1pnDBadJKZ1RY4YglOrk8ym27EEMLLr25OQ=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Wed, 29 Jan 2025 00:35:44 +0100
Subject: [PATCH v4 12/13] ARM: dts: qcom: msm8926-htc-memul: Enable modem
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250129-msm8226-modem-v4-12-2b02ed7b7f1c@lucaweiss.eu>
References: <20250129-msm8226-modem-v4-0-2b02ed7b7f1c@lucaweiss.eu>
In-Reply-To: <20250129-msm8226-modem-v4-0-2b02ed7b7f1c@lucaweiss.eu>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=950; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=DLjfEGxFWMNPCYEaP5OzjsuwOiEesmoVFxG+cMzU00A=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBnmWnw7OClG5N8dfAM31fXMNFFPsX4F6QNcswVt
 4ZyQpqp9K+JAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ5lp8AAKCRBy2EO4nU3X
 Vhh4D/92gXPvTLaSOPUE0rX6W5pDk0TCocJnSsKajBSiOM2cGT+3D3Hizs7UTDFsgC2DmQGcqbF
 VLzbKS7eK4jzURgvRe60N/1wZo7XEOP2iGtGOKT20oQqF91FbyikCl12tVDiWHIlHIEsd06BY46
 j1Xlh3lrnAxhImQ93j+taclUs+LMX1+AoOwy5KeIHKula8prIghrgMnRRlRqAFXvOE+ZEcHgPtT
 21PMqx60D85N+m+1PGChNbzXWIEB8aUKgjGhYQ5lUqPkCWXLr0KihPVtV77qEeOQjZCpfZnIoy1
 9opQkjooD6uiXa1KYcghz/d2S3G2c9Ee7Y4VYC1x3jo+kOwW6jMyDtazwR433+Jk2rUFI3BOZTG
 RVb/xJFFQuoCMexxjP1XdZSkG3rC6NRNX9RYAK7P4LqfA+f7roomvhT7jOQa/uNP0jvPajwwnQk
 4mnb9IjPH0g5exqyw5AY0nVUhB4jEsdjsmwB/KWYUOXWr1pysBswVCfCNATzl9AgXYRmev4GY82
 ozTLoD1xOSoHEjveSVhbtfKXrkEW0SU+rF161632DOYZ9WbAv3h3R5YIO0sbNuk2XNz+YXLKMON
 ujRHURUIL6onYxdfCfdps9I57hK+SAQGVqD1zdLG9d8J5UrrM7m/a5IyQGgHp/VAgXGqk/8llIf
 MLj+83JHnBpHrxg==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Enable the modem found on the MSM8926 HTC One Mini 2.

Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>
Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts b/arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts
index d6eaa82cee4daf6a1386902f537f1351811d4a06..cb571aa13c11598182dc020f064fe8268bcc061f 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts
@@ -195,6 +195,16 @@ &blsp1_i2c6 {
 	/* TPS61310 Flash/Torch @ 33 */
 };
 
+&modem {
+	mx-supply = <&pm8226_l3>;
+	pll-supply = <&pm8226_l8>;
+	mss-supply = <&pm8226_s5>;
+
+	firmware-name = "qcom/msm8926/memul/mba.b00", "qcom/msm8926/memul/modem.mdt";
+
+	status = "okay";
+};
+
 &pm8226_vib {
 	status = "okay";
 };

-- 
2.48.1


