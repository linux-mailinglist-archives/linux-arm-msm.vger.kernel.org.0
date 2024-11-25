Return-Path: <linux-arm-msm+bounces-39137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 076249D8CA0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 20:11:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF4DB28A7F2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 19:11:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBABA1B6D1F;
	Mon, 25 Nov 2024 19:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qB2ov1bW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A671AC448;
	Mon, 25 Nov 2024 19:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732561891; cv=none; b=HWs6Rnaoyo1Us63pdB1DpfnnxWXtRmMVHGnNjhkcCpTDZHgIo5/prS/qnFFO6Wtvz+ORxDhO59bDhILfUsshkNoS+nN9BATXB5+zwTceiagCq1hjCH+XV302D2Q7rdv2ddgmliwuYXdR+4hYP+F2X/NwXSRase+xmFaGOybuRSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732561891; c=relaxed/simple;
	bh=8sJw68/x7LRX6GAezVBs9korCRxUnf0mjseISjnG5/M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CYhANcw0qPXQF/dSheXl1Yu9Q9Re63ScgqA913pLZe/PmC8AOGZJ0MIXYh3jZQK+cZmNes4rREy4Avvzjn4rzAiUwxM2sCBVGLD7xdDAoTu2gcdv8kSFGeNOk1K5zdGcbxsC2l1EC8gzJIuGK0/HOXW4TaHyRngm4pYpE8PtfIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qB2ov1bW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 30E0BC4CECF;
	Mon, 25 Nov 2024 19:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732561891;
	bh=8sJw68/x7LRX6GAezVBs9korCRxUnf0mjseISjnG5/M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qB2ov1bWH4QCG8eIBFCAijU1v7sO1es4a1kjwJ0z6Sl2iMUyO5jbHnW4PDGFFjJMx
	 Jn318kwEQRKfTt9+VCTu99SDFox46tyX+hBlJ2UYdVEWCY5XqdSamPRB835OjgHwLQ
	 tBzgzqK3lC6lvE5KCVGkHjaEXzwPDVeqyludROMJfZzJqtaSId+UmDv6jEsLjirqod
	 tRxzijEC/W/Cu7ssWQIVD1h1jgQs1LIQGofcGSQ0jepm9032VM9MbBxZ9DQD2GmdPc
	 fcUwkarAtkHkcQtdyTXCDTQwBWAI6sW61E0eNiMKMl4zyFYz0dczKy3ItVGgaVbuKo
	 D7iLaozhRYfjw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E564D59D63;
	Mon, 25 Nov 2024 19:11:31 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maud_spierings.hotmail.com@kernel.org>
Date: Mon, 25 Nov 2024 20:11:18 +0100
Subject: [PATCH v4 2/3] arm64: dts: qcom: x1e80100-vivobook-s15: Add lid
 switch
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241125-asus_qcom_display-v4-2-61a4da162406@hotmail.com>
References: <20241125-asus_qcom_display-v4-0-61a4da162406@hotmail.com>
In-Reply-To: <20241125-asus_qcom_display-v4-0-61a4da162406@hotmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Douglas Anderson <dianders@chromium.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Maud Spierings <maud_spierings@hotmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732561888; l=1659;
 i=maud_spierings@hotmail.com; s=20241110; h=from:subject:message-id;
 bh=dtYV+z9lYSzEf2bGKf8JU+PRYZscyBu18hsPuUz7+R4=;
 b=ghzjrMjlhBAs8cX/JpCUp9nqvj2YH6ZkPiXEliEnVHiyTdizACb8S+EYJpzv8gGccwNj267AF
 KgqBK/3N7YEAB0IwGAtgszOfVHVHepX2nO+ZHvHE2IloJfhKx/YKYtN
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



