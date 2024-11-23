Return-Path: <linux-arm-msm+bounces-38912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3239D68C0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2024 12:06:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7EEAE16140C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2024 11:06:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C438198A0E;
	Sat, 23 Nov 2024 11:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uL1ifB10"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB97189B80;
	Sat, 23 Nov 2024 11:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732359975; cv=none; b=TLH2ud6SARSNH48qKeb4e2rEd1W8orEY9Tm9n9Qued3Bd0vZyxmoHHE0y58h1zn1DUDSq2PNlYrxwobSW3g+uARV4zMNt+rWNJzQbIbKKAuR2xk9DuwcyiQCEXuZKVLjju5m5mmyItxhw4CqYjeLfCHEGjK9rWxIqPIBUNtLNeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732359975; c=relaxed/simple;
	bh=LHfsO5qRzd6WqqQsGBjv8BrVc2ugUkxtkoGwPGbCg3c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uZWDSaDHNppRJlwwl9gnk8kPAg/4WuNv50qDyVoutilqzodViWeT431p4dC+JVYp2GGDRU5RoSdwSyEpDkRTTzHxjY19OHevO7WthuPpdYECjmtnwc44Abmd6y2x0KCr4DpIs/OJduAYLZOtao5av8xZP/aRl/+v6/uD1how90Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uL1ifB10; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id AC12AC4CED8;
	Sat, 23 Nov 2024 11:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732359974;
	bh=LHfsO5qRzd6WqqQsGBjv8BrVc2ugUkxtkoGwPGbCg3c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=uL1ifB10vwZGhR+3cBk2edR6kyfFWToeNM/rIBxV4XIhQ+oyUjzP3OjsBFSu81N7p
	 nw0x0Y/T08qPx1ZIivNY79JdD6xog4RTD9YiFSErCRpMiCcGIMLaWv3/AADk6pDKx+
	 J5+hp2OfijDSG7JtINDB6ItrWuPiO8xjksLbDxFx5Pmd+jcXtdg9ZCHRrHHrujUS4x
	 t9dtojXOrJ3GQXtwdDo5vtYH8SEjR9zeaHGnOe0nQN096gdifAAywACOexurulTdPy
	 mKB0IfOTYje+rWL3doDffXWZtzQ9szJopn/Quab5+igKLbTDt4gmNlIWVS65d3Zz4k
	 8lr07f9i9aB7Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0D1EE6ADF7;
	Sat, 23 Nov 2024 11:06:14 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maud_spierings.hotmail.com@kernel.org>
Date: Sat, 23 Nov 2024 12:05:53 +0100
Subject: [PATCH 3/4] arm64: dts: qcom: x1e80100-vivobook-s15: Add lid
 switch
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241123-asus_qcom_display-v1-3-85a9ff9240aa@hotmail.com>
References: <20241123-asus_qcom_display-v1-0-85a9ff9240aa@hotmail.com>
In-Reply-To: <20241123-asus_qcom_display-v1-0-85a9ff9240aa@hotmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732359972; l=1398;
 i=maud_spierings@hotmail.com; s=20241110; h=from:subject:message-id;
 bh=2Fsv6gofTnQRjFCbk36VF6plX1Xp9Ps/3F/wjNK21VE=;
 b=Um8NXi0h8NeArK/WBUEadfl1aT/oMvEnxcaHDshwHy+Y1tzpsA2MGi46Hw25Te+E0YS1lt1DH
 I4a6W+NvsPqBpY8Y/PONwP6Pyo2mTdUv0LnEHhq0qIwCqVYOpp9yznZ
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
 .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts      | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
index dbc85aff50a95bfc2ac11528d1901979ec7b1501..109b9d8816d26550ccfcb9906d69f2745d02f1d3 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
@@ -17,6 +17,19 @@ / {
 	compatible = "asus,vivobook-s15", "qcom,x1e80100";
 	chassis-type = "laptop";
 
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-0 = <&hall_int_n_default>;
+		pinctrl-names = "default";
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
@@ -537,6 +550,12 @@ edp_reg_en: edp-reg-en-state {
 		bias-disable;
 	};
 
+	hall_int_n_default: hall-int-n-state {
+			pins = "gpio92";
+			function = "gpio";
+		bias-disable;
+	};
+
 	kybd_default: kybd-default-state {
 		pins = "gpio67";
 		function = "gpio";

-- 
2.47.0



