Return-Path: <linux-arm-msm+bounces-12073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3420885DFF5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 15:39:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5ED61F2460C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 14:39:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E4378061A;
	Wed, 21 Feb 2024 14:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yszqM2Jh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E0D8003F
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 14:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708526342; cv=none; b=ELjOIqISj9o7H0WjyUMZPrPrKO+ctBffi5oMr/QkonVMOo8G3ZnDf8Av85oiwwI1EVUKeBID+ZHWYqlWw78qrqu36IRMh2uWPFpu6D11QFgdpzfND8h522lsb8thD6s5AThy3HdEA5T85dCUuX09botY+DQXG4y+DgLQ68Mxd38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708526342; c=relaxed/simple;
	bh=z4YNe3s7RiXrMcr2v5VUfWKjyjugl9g1ARc3B5J6qzY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T7kX4jOHAkpFlYDJd8mqELyvdeIR957LmWLCebxQvzeld7gD7TVhsmD3Ejmp9YjrjXk5kZiA4O2QrqQXuuoNwEz/7UI8nfC3wzgYedrxS1DeEnGbeZ5bLpw6wyGud2soxomLr+0FZwikq1nXqoRVce5h0DOmplfE0SzLsSF5NHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yszqM2Jh; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a3e6f79e83dso481160966b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 06:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708526339; x=1709131139; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dKUMaq5+YKpoNioR5AAEOHPi2LIHBpnQYMn+N71VaCk=;
        b=yszqM2JhiwrhiAQrLsY9DrorWw/loI8BBYNBKyqOgugWjXzzf6IX3pzEoGpNEMxAoJ
         5hYnAMMifZEUEeak92bIhzET0TKHmNhhjSpUGwmPfjEXP8wBVK8S+VF5mAnQF/18P5jo
         g7VotQ9Ww8o5B5TgyXZjPeL0+h5B4THagi9shVgyjikAPHkD/oWGXtp5pafXI1kqJZ1o
         kUILzL8Oh+yxQO+E9qjrFYX3T2OnrDhBhy1Ho6ra+F4R1TtjKJ3zTUPGHX7sC8bT9pI0
         VqSQeE5FhuPSN5rPwMhiWm32RLDRt6sU+7aVzRdrS0Hb3tdEU3gpGLOV1xurS8/EsgOk
         h6GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708526339; x=1709131139;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dKUMaq5+YKpoNioR5AAEOHPi2LIHBpnQYMn+N71VaCk=;
        b=svMXaC7R3rYEW/a8tWj/Hwv5tN+kwxL8go15F1fZuvUSeHefx/Mnoy/yZ/o1AnNr57
         l1txS4BBuqBKZBqi41WPQyTWp5gvnkKrynI1FL7FPyJmjMqxEwRFgFIEWzT/b7MJN2DI
         KSvwI+nQ6Sr3089UYLw9o84SczQKrGjjz0v8QYoOX6om5+lB/gWq8ZANDqRHJ0UdbSco
         qHUpHZffUmuGHh6et/W8ZdHTP2n7EkESXVtvLACePGzGp2iI/ejfp7ekk7G0CTu5cUbx
         hkRQgoflkYZPw6jR5ZQJxs095wL9nHHdWV71ojPOtjREohg59hBPibVcucOWAYJ9Yycs
         XiWw==
X-Gm-Message-State: AOJu0YxJ6wg/lR2/foS0/27Arj5NkVo7cLXo55zONsLhwgWtNS0EUcfa
	8P0KpIrHjL47VeAz63MtImw1goMfkXyPD8TGrN/lNIEnq5eJYWwffs1OoHbt4HOngjp1/x13fbf
	X
X-Google-Smtp-Source: AGHT+IGUJ9PB2acoyDH7oWw8uuJAjHjCsyJYmolBPapY1iBP9Ej5l6SjqJWFlrHqLeqAWIpJOdXXtg==
X-Received: by 2002:a17:906:a0ce:b0:a3d:8f37:c37f with SMTP id bh14-20020a170906a0ce00b00a3d8f37c37fmr13958935ejb.6.1708526338852;
        Wed, 21 Feb 2024 06:38:58 -0800 (PST)
Received: from [127.0.1.1] ([188.24.162.93])
        by smtp.gmail.com with ESMTPSA id wp12-20020a170907060c00b00a3eb953335esm2653970ejb.44.2024.02.21.06.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 06:38:58 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 21 Feb 2024 16:38:33 +0200
Subject: [PATCH v2 3/4] arm64: dts: qcom: x1e80100-crd: Add repeater nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240221-x1e80100-dts-smb2360-v2-3-037d183cc021@linaro.org>
References: <20240221-x1e80100-dts-smb2360-v2-0-037d183cc021@linaro.org>
In-Reply-To: <20240221-x1e80100-dts-smb2360-v2-0-037d183cc021@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1720; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=z4YNe3s7RiXrMcr2v5VUfWKjyjugl9g1ARc3B5J6qzY=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBl1gr7F3smlX41csaZupE+3mQ0hDrNTFwSP+em9
 FMLmZqtSuaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZdYK+wAKCRAbX0TJAJUV
 VrrYD/9sELQf6ABYKykIiiQihXS8+cee52Mkcb8PRB8cu3K72rT2YxPF6zxEK9JC/t8gZF1ZFzn
 kBwx+6qHK07ue+rGJBzWIAsIo/HqKt15/wKS2XedeeaFYOg2CdwHK/Asaidrg/6dG9Nn5Zezpmx
 5ESV5A86nEVBTht5RiPkP/+VIK4XyRC6N9HpQcUo4HOeQPF/OJp5a6bRquC5NUyiafw91Db4QWS
 47w/HzymnCsEJ+7LYOeQdBGBHBBTfdVfovAPGqx2arkydSLtu8htwnyv+8QQ2Rr+ViBbkUXsNYH
 fII9urSefC1uM8VIWEgKhB0NVIJiaVmSqVqJSz2RbbnzDPi9HfjPD/iEHBPM0ocX77WVyr41ln0
 qPNXmJz627FxtRV5swPc17advyWV/5vq2roAwDcbjF+I2lXkze0O3pXgCnqMbueW8yQyCly/1JM
 ajKq2T1ZslOvS3+Alp2U8R2djjaSeTYEbb++JAYcp/ZL3GsdTvQV4t7BNVR8PXOCy+XGGtPnkih
 gti0KQvbSE+zc1XAHjcYRDYsP4DpUgrkekF94xS14Snaluce0YZixYG2vAOPExEWn86pNDePpuE
 Y635Miv8LXNSOJ1tbdvk00fh68HHyqzXQt98XJ7o8TWLsEqsFuCp+oqacF9gnLYSZYD9SqrXrvM
 LEr/YPQPapOk4XQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Include the SMB2360 and add regulators to each one of those 3 eUSB2
repeaters. Tie up the repeaters to their corresponding USB HS PHY.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
index 6a0a54532e5f..37e19c0aa236 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
@@ -9,6 +9,7 @@
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "x1e80100.dtsi"
+#include "smb2360.dtsi"
 
 / {
 	model = "Qualcomm Technologies, Inc. X1E80100 CRD";
@@ -680,6 +681,21 @@ &remoteproc_cdsp {
 	status = "okay";
 };
 
+&smb2360_1_eusb2_repeater {
+	vdd18-supply = <&vreg_l3d_1p8>;
+	vdd3-supply = <&vreg_l2b_3p0>;
+};
+
+&smb2360_2_eusb2_repeater {
+	vdd18-supply = <&vreg_l3d_1p8>;
+	vdd3-supply = <&vreg_l14b_3p0>;
+};
+
+&smb2360_3_eusb2_repeater {
+	vdd18-supply = <&vreg_l3d_1p8>;
+	vdd3-supply = <&vreg_l8b_3p0>;
+};
+
 &swr0 {
 	status = "okay";
 
@@ -817,6 +833,8 @@ &usb_1_ss0_hsphy {
 	vdd-supply = <&vreg_l2e_0p8>;
 	vdda12-supply = <&vreg_l3e_1p2>;
 
+	phys = <&smb2360_1_eusb2_repeater>;
+
 	status = "okay";
 };
 
@@ -837,6 +855,8 @@ &usb_1_ss1_hsphy {
 	vdd-supply = <&vreg_l2e_0p8>;
 	vdda12-supply = <&vreg_l3e_1p2>;
 
+	phys = <&smb2360_2_eusb2_repeater>;
+
 	status = "okay";
 };
 
@@ -857,6 +877,8 @@ &usb_1_ss2_hsphy {
 	vdd-supply = <&vreg_l2e_0p8>;
 	vdda12-supply = <&vreg_l3e_1p2>;
 
+	phys = <&smb2360_3_eusb2_repeater>;
+
 	status = "okay";
 };
 

-- 
2.34.1


