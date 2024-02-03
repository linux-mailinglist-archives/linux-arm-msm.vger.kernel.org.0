Return-Path: <linux-arm-msm+bounces-9721-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C2C84885F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Feb 2024 20:12:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78AFC1F22C39
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Feb 2024 19:12:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2E285FEE8;
	Sat,  3 Feb 2024 19:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="RbQf6Ixa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7ADDDB0
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Feb 2024 19:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706987550; cv=none; b=grOauKEahHKtIVr2Yevkb1f0Dtw241CdGM/39tW+jR9WG93O8voaT11PKsCVmANdw59P7oRCH6M4GEod7Q8WH0d/YU6fTZpvNC6Jrf4mkBTSvQzBFAKEXen2DOhWIZHIS4fbTZtZWVYoc8EqcCFORLCTudN4doZvdm0GJEDHzjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706987550; c=relaxed/simple;
	bh=J8IFhoGsohtOpwruk4ziSaGxl/siYh6wsWyTWq71ZEo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r5duFGzNXVrLXZg0KX2dLko773xJfXLI9LQrSLYU1qeRDCTlV+aPOfqWZWX75I6R1Fw7Q2CRMCAbVP4MqF7WpHUQQcIFJ3LZfSitCSxrDGJFFt1PznvZS3v+CvdHjQowFvIMHyXNgOqngKxreSsOcC5yp9wm3xYuUhV+ZokV6ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=RbQf6Ixa; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1706987546;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vh3oMQ24VxcFcdoo1SJYXgM61FClsIuFWkVwGbHbrs0=;
	b=RbQf6Ixa7wrv8TWK2mwKh2qxhRdFjX+XA5YffZ1hkIJC6ejSLJkVj+MwnMozGZtJnlyUTO
	WNNwiygEvq8Up5KioHfUxW30suQSwL4CtcwZnCCyvLaX6pL99uXQiBXId+cZWWhsQ5D+NJ
	a7hpCIT9bQnMzHwNzSdgXiGSfEG9iRfnT192To6pEpRqClL6/+miCM8t3KoSTDi6xkVMWD
	60Jp0A9T7ND4yBr6GdwhocPmgsfpAPQRRC8teFQ9U4v0HjYwUOBmExKD03Qscl9/QeWasT
	SEj/xlk1B8qPXT53Z+JuHc4NgCUeZ7H3FKvgvrIR8IcUIuG5tCKIHN0UI/kWiQ==
From: Anton Bambura <jenneron@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/6] arm64: dts: qcom: sc8180x-lenovo-flex-5g: set names for i2c hid nodes
Date: Sat,  3 Feb 2024 21:11:56 +0200
Message-ID: <20240203191200.99185-3-jenneron@postmarketos.org>
In-Reply-To: <20240203191200.99185-1-jenneron@postmarketos.org>
References: <20240203191200.99185-1-jenneron@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Set names, so they correspond to devices connected to these interfaces.

Signed-off-by: Anton Bambura <jenneron@postmarketos.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
index 49b740c54674..af61acf58d68 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
+++ b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
@@ -362,7 +362,7 @@ &i2c1 {
 
 	status = "okay";
 
-	hid@10 {
+	touchscreen@10 {
 		compatible = "hid-over-i2c";
 		reg = <0x10>;
 		hid-descr-addr = <0x1>;
@@ -379,7 +379,7 @@ &i2c7 {
 
 	status = "okay";
 
-	hid@5 {
+	keyboard@5 {
 		compatible = "hid-over-i2c";
 		reg = <0x5>;
 		hid-descr-addr = <0x20>;
@@ -387,7 +387,7 @@ hid@5 {
 		interrupts-extended = <&tlmm 37 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-	hid@2c {
+	touchpad@2c {
 		compatible = "hid-over-i2c";
 		reg = <0x2c>;
 		hid-descr-addr = <0x20>;
-- 
2.42.0


