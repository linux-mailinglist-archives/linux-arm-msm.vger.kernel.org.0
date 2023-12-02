Return-Path: <linux-arm-msm+bounces-3060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAA9801FD5
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 00:56:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AAF541F20FC0
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Dec 2023 23:56:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3B05224CF;
	Sat,  2 Dec 2023 23:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="2G7M9k8K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ixit.cz (ip-89-177-23-149.bb.vodafone.cz [89.177.23.149])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 121F3C8
	for <linux-arm-msm@vger.kernel.org>; Sat,  2 Dec 2023 15:56:09 -0800 (PST)
Received: from newone.lan (unknown [10.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 6562E16111A;
	Sun,  3 Dec 2023 00:48:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1701560919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nZjIU5MJKvgjwk7z55wUJKQnInGSZnc0867XkiDqWYE=;
	b=2G7M9k8K2ekhp8DEdI3G6++8rj1zScJ/dNoNjuN44tPeOO+V4ziNdoG6m3r2sVByqBmUaB
	OgnXIQC8ii41gdZ1qwDQgj0XG92z+xADonDhFUxsb7MrHPLfNYKbOWSW0Tnf5xDPBw8HbE
	rkIKfEjEXBDkdST8AS+5TRByZMmb9MY=
From: David Heidelberg <david@ixit.cz>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Luca Weiss <luca@z3ntu.xyz>,
	David Heidelberg <david@ixit.cz>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/3] ARM: dts: qcom: include cpu in idle-state node names
Date: Sun,  3 Dec 2023 00:47:18 +0100
Message-ID: <20231202234832.155306-2-david@ixit.cz>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231202234832.155306-1-david@ixit.cz>
References: <20231202234832.155306-1-david@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Required for dt-schema validation.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 2 +-
 arch/arm/boot/dts/qcom/qcom-apq8084.dtsi | 2 +-
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index 59fd86b9fb47..d2ae13a67382 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -87,7 +87,7 @@ L2: l2-cache {
 		};
 
 		idle-states {
-			CPU_SPC: spc {
+			CPU_SPC: cpu-spc {
 				compatible = "qcom,idle-state-spc",
 						"arm,idle-state";
 				entry-latency-us = <400>;
diff --git a/arch/arm/boot/dts/qcom/qcom-apq8084.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8084.dtsi
index 2b1f9d0fb510..bdf64895c55c 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8084.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8084.dtsi
@@ -79,7 +79,7 @@ L2: l2-cache {
 		};
 
 		idle-states {
-			CPU_SPC: spc {
+			CPU_SPC: cpu-spc {
 				compatible = "qcom,idle-state-spc",
 						"arm,idle-state";
 				entry-latency-us = <150>;
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
index 76006c3c4af2..e82b2d184735 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
@@ -85,7 +85,7 @@ L2: l2-cache {
 		};
 
 		idle-states {
-			CPU_SPC: spc {
+			CPU_SPC: cpu-spc {
 				compatible = "qcom,idle-state-spc",
 						"arm,idle-state";
 				entry-latency-us = <150>;
-- 
2.42.0


