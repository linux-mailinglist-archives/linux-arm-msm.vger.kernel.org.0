Return-Path: <linux-arm-msm+bounces-11226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B29856C00
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Feb 2024 19:04:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 284251C216D9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Feb 2024 18:04:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ED951384BE;
	Thu, 15 Feb 2024 18:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="jTcrgGbJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30862139562
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Feb 2024 18:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708020218; cv=none; b=qJhurWNmGI8ySZn/cjrVtUvIdl1tX6ClkrWmFamVD95btIBsuL0DOdALt3nKrTL7sFcOcd3MLt2JBHmRBlONk44U0dZeN701pGkAfC7dG4Vt0Eyf++dNOz8kAjR8ZkcgH3RAz1OH+qsYr+LAIbYR3MDiT9MrZM1uzthcnevW4AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708020218; c=relaxed/simple;
	bh=ex2AF5ZFFM+EprQ1680uI/4h5HgPPcyjhAxuJOQpuZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P2y6wzwZSi1RNZJmBTQ5mZpuWyCh4h/X4LtVn7WNfS8F0rhAspyE9plC/2Viz7me8+JNSOxfued5nc4Lh7Ytpxr1R+uFyGLe0QFapwuqgWw73vOttpWCUpwfpfVL9CJmB0BskZlqUwYdHX2SQU61K607fRuS3qFnrmw3GCX71KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=jTcrgGbJ; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1708020214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1T+N7UTG+h3TiTfzEawsi9mJaD3TJv0dy8zUxFf3IF8=;
	b=jTcrgGbJfjJG/LfaZcLgOali27558t+Dh5cZjaJ4nMfW7ZU4h4BR50p45IWNA+NRS71NgJ
	D+EwOT33G617Rnbuwjk/Fj4XFo2MyJgewrTnJmtCmN9MZE73tp9pfxaubg6BOzfpPafgag
	qqrMTnTSoR0gGMeQdKx/6xux+kpQmG5d05MqDleOSIGvyd1e+QhdLHaZGCm8tuFPAxOcqa
	dCMcRbBQRfMFjalBj2zyCVLfS8pPkfx6ONlcPm4S08lHxLR7wrRkxQP6u+8VXxcMHgDYV1
	WPgUgRbPN3ETVQZPe7Lh2554HFkxljGpHt/0AOdBd9/mMRNODcHKPQp3orsdEg==
From: Stefan Hansson <newbyte@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Stefan Hansson <newbyte@postmarketos.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 4/4] ARM: dts: qcom: samsung-matisse-common: Add UART
Date: Thu, 15 Feb 2024 19:02:02 +0100
Message-ID: <20240215180322.99089-5-newbyte@postmarketos.org>
In-Reply-To: <20240215180322.99089-1-newbyte@postmarketos.org>
References: <20240215180322.99089-1-newbyte@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

This was not enabled in the matisse-wifi tree. Without this, it is not
possible to use the USB port for serial debugging via a "Carkit debug
cable".

Signed-off-by: Stefan Hansson <newbyte@postmarketos.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi    | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi
index 24ed2ba85d62..a15a44fc0181 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi
@@ -219,6 +219,10 @@ muic: usb-switch@25 {
 	};
 };
 
+&blsp1_uart3 {
+	status = "okay";
+};
+
 &rpm_requests {
 	regulators {
 		compatible = "qcom,rpm-pm8226-regulators";
-- 
2.43.0


