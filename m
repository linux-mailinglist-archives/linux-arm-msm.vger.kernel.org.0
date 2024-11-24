Return-Path: <linux-arm-msm+bounces-38956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 73EE49D6D5F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Nov 2024 11:01:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69265281341
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Nov 2024 10:01:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03193186607;
	Sun, 24 Nov 2024 10:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rs2hobgK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBAEA13D24D;
	Sun, 24 Nov 2024 10:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732442469; cv=none; b=tbiQoP45QxkiWud6PnhR1mYAQBIDfZ+OFC8Y4EH1e1+/elRsumLpSNs3DBWr7QLbHfBEy8ok+opj8gwFOKrhLMyTNrN5b1r5UMJqjYsL5QMenFQUVbZQtPypSuvKMEggD9ge3SjQDUSQn2Sh3GRaa1vTPwGFfh1Lsp5BJzLW7gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732442469; c=relaxed/simple;
	bh=pN0XPOk+azMB8nicVtcdNG4JiPjyTuemTD+GjJVRFxQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cKWr5EBMTgaAJGy8Q+99eQjw6XsbH9nLQLtN9wt6LJVnyfusnFWMglCoIyKbPhtcFYv1NtTKxBH9898bNiprm4G4X1wJfl+SbAFcS8G9BGe4ieXwPMpKnktbDQbbOo7sny7BP/upp9VFl71s4VxYhRGZ5i6rA/XL1jSOmiq2LN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rs2hobgK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 78579C4AF09;
	Sun, 24 Nov 2024 10:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732442469;
	bh=pN0XPOk+azMB8nicVtcdNG4JiPjyTuemTD+GjJVRFxQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rs2hobgKyr4qgPaeWqr0+N2H+9KWTmFafybPBKwbmhcJFvk5xS2NdiITnGd/BiJYY
	 YXeBfiO+TD7oWw6GbKyeHV+P7RRolr1MRz8qymGERn+EXtf2WGE6JGqdIlk276x36o
	 cnwqblC/Iaa2g6fDvt9JXt0tm2zqWNTp0Mg9LNXm9tnjKLFKpYSM0QTKAFJeIcZeUH
	 sQ5IEuMo98QTt2WgKfLv7IPDxtPJdwXN0LYRSYd/9R5h6a6m3xsdmqTabm9CggXqvk
	 eNhBWi7GeUGnJVkmfCoa0Eh3ztuErgd6ZuKczxeQ1h0VGpKKdnib7YyBKknKUWqJbX
	 L4Me4CDomVXew==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68CB8E668A4;
	Sun, 24 Nov 2024 10:01:09 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maud_spierings.hotmail.com@kernel.org>
Date: Sun, 24 Nov 2024 11:00:59 +0100
Subject: [PATCH v3 3/4] arm64: dts: qcom: x1e80100-vivobook-s15: Add lid
 switch
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241124-asus_qcom_display-v3-3-002b723b1920@hotmail.com>
References: <20241124-asus_qcom_display-v3-0-002b723b1920@hotmail.com>
In-Reply-To: <20241124-asus_qcom_display-v3-0-002b723b1920@hotmail.com>
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
 Maud Spierings <maud_spierings@hotmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732442467; l=1598;
 i=maud_spierings@hotmail.com; s=20241110; h=from:subject:message-id;
 bh=V0toP94nVQpKY9cawuLUKuZZPhlJQOyZXdc718iCBUw=;
 b=NiqcxiPlcYUWUE1CDRxQjeLFOZPKjvAaOng/FtfE7NUNW1nerc2zfpHWRbhEBYZ1OnYvoKqPR
 4dhKeEaDnM9BGiNPFlW+9zGr8y8yeRUi6RYVGbzw6NIDIHq9puTZ8k1
X-Developer-Key: i=maud_spierings@hotmail.com; a=ed25519;
 pk=CeFKVnZvRfX2QjB1DpdiAe2N+MEjwLEB9Yhx/OAcxRc=
X-Endpoint-Received: by B4 Relay for maud_spierings@hotmail.com/20241110
 with auth_id=273
X-Original-From: Maud Spierings <maud_spierings@hotmail.com>
Reply-To: maud_spierings@hotmail.com

From: Maud Spierings <maud_spierings@hotmail.com>

Add the lid switch for the Asus vivobook s15

Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
---
 .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts    | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
index dbc85aff50a95bfc2ac11528d1901979ec7b1501..d8324e7754e112aa12eca131218335fd3842efc5 100644
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
@@ -537,6 +552,12 @@ edp_reg_en: edp-reg-en-state {
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
2.47.0



