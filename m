Return-Path: <linux-arm-msm+bounces-39935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C02DE9E0BBE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 20:10:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6F01EB284E0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 18:18:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C59CD1DDA32;
	Mon,  2 Dec 2024 18:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A89GfAx5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981E81DACBE;
	Mon,  2 Dec 2024 18:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733163503; cv=none; b=kaiUWtuAokrIH/WZWtM3DzCRLoknpGkRwlZp2Nd3T7VRK4UXpW3RHf6EzKwJ9KcSoVCVKweJn8biZCRSGxThn3VcNvF7B1yavdQCvBuWtHY0ABMxwehws38f/ibxvR+Lpgj1hniJttH7cEmbcHdAbobPQS4O5mzQm81Ohqu9Ofo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733163503; c=relaxed/simple;
	bh=8sJw68/x7LRX6GAezVBs9korCRxUnf0mjseISjnG5/M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RJJsfq1utkFVIr6Ccep18nfYrPymDiPjIgq6PtM++1nFBt7Dca5R3DqPHwtvCz7vv+MvLHDYtXmTe7KJneDe+Snmf192inQP7RFvSTp+nL8DIivjceEoO2ne2zhTLT23JxIXg7SJ8PsV5MyfjJeQea3IRepHLiBTM6o9+7YZMQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A89GfAx5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5E782C4CED9;
	Mon,  2 Dec 2024 18:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733163503;
	bh=8sJw68/x7LRX6GAezVBs9korCRxUnf0mjseISjnG5/M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=A89GfAx5cX1ythx96t5ytOB/Vcyb0cf86xZJySBmCPytP0WGHq/4kxzW3PBGrGUNY
	 1CSdG66d9hOtJHiUu/aFtmVP1hSj3FlvwwuIkg4oCViHwtScClytrrClkdp+K1RbMg
	 IkJ3lDYgvJnHUJcVJ5nW7xXdrYadfq+GVPBD8zq305IlXarcSfvK0MVn2DAfY22jYq
	 4g29QWxSodYkPQDg2t42zDlrwMj/IMtMefG4S7GeGwA0KjiVw6SA8kujabdkpTEoOr
	 zmjFfhrkvVfqpBKMsJlyUraos90YP4gBR0Y99uvMnCS3pF6GwzAXNR8CbLnibufBrp
	 WVD0DCnslWr9w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C0D4E69E85;
	Mon,  2 Dec 2024 18:18:23 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maud_spierings.hotmail.com@kernel.org>
Date: Mon, 02 Dec 2024 19:18:12 +0100
Subject: [PATCH v5 2/3] arm64: dts: qcom: x1e80100-vivobook-s15: Add lid
 switch
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-asus_qcom_display-v5-2-e0d3752ff71f@hotmail.com>
References: <20241202-asus_qcom_display-v5-0-e0d3752ff71f@hotmail.com>
In-Reply-To: <20241202-asus_qcom_display-v5-0-e0d3752ff71f@hotmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Maud Spierings <maud_spierings@hotmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733163500; l=1659;
 i=maud_spierings@hotmail.com; s=20241110; h=from:subject:message-id;
 bh=dtYV+z9lYSzEf2bGKf8JU+PRYZscyBu18hsPuUz7+R4=;
 b=oFexVHzJ+JHXkTZSw77tN0eIKNWlVe1xOEP2WEw7dp4PyYUK/X7uJqwCH/VcifJihPkJ4okiM
 7C7HG/KnkILDCyXQdDFvoOmuKia0bkBKUUjvdZ3evuOso0R3No4d3oq
X-Developer-Key: i=maud_spierings@hotmail.com; a=ed25519;
 pk=CeFKVnZvRfX2QjB1DpdiAe2N+MEjwLEB9Yhx/OAcxRc=
X-Endpoint-Received: by B4 Relay for maud_spierings@hotmail.com/20241110
 with auth_id=273
X-Original-From: Maud Spierings <maud_spierings@hotmail.com>
Reply-To: maud_spierings@hotmail.com

From: Maud Spierings <maud_spierings@hotmail.com>

Add the lid switch for the Asus vivobook s15

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
---
 .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts    | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
index 8cdb2888d10a1dfc0c28480b6636584ab06853bb..7269f8e7709988657b363004875163a69142f16c 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
@@ -7,6 +7,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "x1e80100.dtsi"
@@ -17,6 +18,20 @@ / {
 	compatible = "asus,vivobook-s15", "qcom,x1e80100";
 	chassis-type = "laptop";
 
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-0 = <&hall_int_n_default>;
+		pinctrl-names = "default";
+
+		switch-lid {
+			gpios = <&tlmm 92 GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_LID>;
+			wakeup-source;
+			wakeup-event-action = <EV_ACT_DEASSERTED>;
+		};
+	};
+
 	pmic-glink {
 		compatible = "qcom,x1e80100-pmic-glink",
 			     "qcom,sm8550-pmic-glink",
@@ -539,6 +554,12 @@ edp_reg_en: edp-reg-en-state {
 		bias-disable;
 	};
 
+	hall_int_n_default: hall-int-n-state {
+		pins = "gpio92";
+		function = "gpio";
+		bias-disable;
+	};
+
 	kybd_default: kybd-default-state {
 		pins = "gpio67";
 		function = "gpio";

-- 
2.47.1



