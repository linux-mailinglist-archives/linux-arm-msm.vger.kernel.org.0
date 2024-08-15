Return-Path: <linux-arm-msm+bounces-28652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC8B9538BE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 19:06:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6746C2842F2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 17:06:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 997231BB69D;
	Thu, 15 Aug 2024 17:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="he8xmXuV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7901B1517
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Aug 2024 17:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723741551; cv=none; b=S2S1vGgsmP3ljtM7aMntZtuZxuTvkeSrKjxcuVpA0elR2/do5cDo97Aqsu224UBGBGsuPhimikIWYjkckCMPT2SxiVe7mAMqNUPsn37TlZnuFSYk59mfCpIErisJdoFRiYGJCgI1zjl/aUQLhCZKL8QnhM+NJCyOLF9CDPA/nf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723741551; c=relaxed/simple;
	bh=yNAYnrrthvnc92LbkHZu+Lb3N7bb93tsqL1JSAKbnBo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qsmNN79e68NUH6ue9BRZlXW0Js/kBQG+i8C+Euilhc8hn9lazUZ+/qJijVG3tNH1zEz/pCp+fU0rsQgvNc+ViaZdE99ffc9V3W592JHU2Hhaz3N6PpnQL1fo4RTithSsdl+JoGcyJbbde2cPL3nGK7eIt+7kxw7y4C3blUEf3DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=he8xmXuV; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42809d6e719so7895155e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Aug 2024 10:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723741547; x=1724346347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CepgmEounTUrl6P6kxWZPU5dwK4CK5Hpa6rPc4gSVuY=;
        b=he8xmXuVPcd600KNHYRN7dzf7rMyh5OeiR7u9SDClChXNqcsUVn3lNF9WzjaB5qEcm
         e9xa6kPGHTzLGdRWMWltIS9RDX6xulENrPTxSVRf/O3p+BjL/iiYxZ5epyY7Yp9E0uwi
         vp7hwlfTJQ5wh5EZkNGLsTlw5/a99fyYc0k8scYDakQPm8uEMOKLY3RIHb9GmFtBahzt
         O52bQDPh49htPWdp6NeejCkdLdT9faERXqKv0Yubl/mWigAF3ZkE7gLs9X2pnu3IlFpD
         be41vBLVR4zKQtl8cMABmImBxhfSbgDppSm1DApxdzZ3Zx2u6wdRjHxqUkKYzqMIK8Vx
         Rghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723741547; x=1724346347;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CepgmEounTUrl6P6kxWZPU5dwK4CK5Hpa6rPc4gSVuY=;
        b=I3ZnQ/7/fBSJCbyP4I2LSPioZOt3JAGcz9KAJ4PN4DlAg0qePz8VLewCcsYJYVTQ8O
         nnrASnNpjBjVh2L9s+cFgsszjMsd24GNZcmPZ52QSZrSs9sGY4Td6Kw7Dha6tWEu6+IN
         wS4A2orTw7pjsfBnA8Ug5wc4NETqr4oJt2WOP4VAatLiE93FLuXeJKar63ZJdPwo8CRg
         PY+iOpLsvJBnYUSoYNAR0pDJYuLbxCU67sTDK0kbiPlyHp26cERR6n0+epN+mvQ7XqiA
         rhAY9WnK4DxtnboY2ayTiETs49RbiW0MNmcMvO1atoW31TwS9fWh9X86+gtFq4sUAENT
         fsxA==
X-Forwarded-Encrypted: i=1; AJvYcCWKp0bhaflerP7MkvznLy13wjcGcTm1Z9ZijRBgQkV02YcEaoRekuv/WTK0TL4RG6VEBV6fE3D4M6oyztFBfBHeOA+ibwQZvGizNx7V6w==
X-Gm-Message-State: AOJu0YwMLYjKqR3XEiY/ZOLSscWOVZBGZXz+keP5Fp3DIT6HeXiyZxci
	vtUUArbx6jOlpCcxWABAWExrt5gfqNbEq6zD51ssZ/qBS0nF+L+MbcFzkpM9fA0=
X-Google-Smtp-Source: AGHT+IGQEWGD2uTt4JOylXLFOS6tTAzZOetE/pp1JGV9+vPDEgebW+ZIc3n8HhA+45q5YWGxxcf3FQ==
X-Received: by 2002:a05:600c:3547:b0:426:647b:1bfa with SMTP id 5b1f17b1804b1-429ed780642mr127135e9.8.1723741546729;
        Thu, 15 Aug 2024 10:05:46 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ed7841a1sm89765e9.29.2024.08.15.10.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 10:05:46 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: andersson@kernel.org
Cc: konrad.dybcio@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	amit.pundir@linaro.org,
	dmitry.baryshkov@linaro.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH] arm64: dts: qcom: sm8250: move lpass codec macros to use clks directly
Date: Thu, 15 Aug 2024 18:05:42 +0100
Message-Id: <20240815170542.20754-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Move lpass codecs va and wsa macros to use the clks directly from
AFE clock controller instead of going via gfm mux like other codec macros
and SoCs.

This makes it more align with the other SoCs and codec macros in this SoC
which take AFE clocks directly. This will also avoid an extra clk mux layer,
provides consistency and avoids the buggy mux driver which will be removed.

This should also fix RB5 audio.

Remove the gfm mux drivers for both audiocc and aoncc.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
DT bindings changes to fix the incorrect number of clocks is available
at
https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/thread/BWBTJHLNBQIMPUQNR274CPYXRBIBAYP5/
CHECK_DTBS=y might fail without this bindings change patch.


 arch/arm64/boot/dts/qcom/sm8250.dtsi | 31 ++++------------------------
 1 file changed, 4 insertions(+), 27 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 9d6c97d1fd9d..630f4eff20bf 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -8,8 +8,6 @@
 #include <dt-bindings/clock/qcom,gcc-sm8250.h>
 #include <dt-bindings/clock/qcom,gpucc-sm8250.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
-#include <dt-bindings/clock/qcom,sm8250-lpass-aoncc.h>
-#include <dt-bindings/clock/qcom,sm8250-lpass-audiocc.h>
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
@@ -2633,14 +2631,13 @@ tcsr: syscon@1fc0000 {
 		wsamacro: codec@3240000 {
 			compatible = "qcom,sm8250-lpass-wsa-macro";
 			reg = <0 0x03240000 0 0x1000>;
-			clocks = <&audiocc LPASS_CDC_WSA_MCLK>,
-				 <&audiocc LPASS_CDC_WSA_NPL>,
+			clocks = <&q6afecc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_CLK_ID_TX_CORE_NPL_MCLK  LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
 				 <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
 				 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
-				 <&aoncc LPASS_CDC_VA_MCLK>,
 				 <&vamacro>;
 
-			clock-names = "mclk", "npl", "macro", "dcodec", "va", "fsgen";
+			clock-names = "mclk", "npl", "macro", "dcodec", "fsgen";
 
 			#clock-cells = <0>;
 			clock-output-names = "mclk";
@@ -2674,20 +2671,10 @@ swr0: soundwire@3250000 {
 			status = "disabled";
 		};
 
-		audiocc: clock-controller@3300000 {
-			compatible = "qcom,sm8250-lpass-audiocc";
-			reg = <0 0x03300000 0 0x30000>;
-			#clock-cells = <1>;
-			clocks = <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
-				<&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
-				<&q6afecc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
-			clock-names = "core", "audio", "bus";
-		};
-
 		vamacro: codec@3370000 {
 			compatible = "qcom,sm8250-lpass-va-macro";
 			reg = <0 0x03370000 0 0x1000>;
-			clocks = <&aoncc LPASS_CDC_VA_MCLK>,
+			clocks = <&q6afecc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
 				<&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
 				<&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
 
@@ -2792,16 +2779,6 @@ swr2: soundwire@3230000 {
 			#size-cells = <0>;
 		};
 
-		aoncc: clock-controller@3380000 {
-			compatible = "qcom,sm8250-lpass-aoncc";
-			reg = <0 0x03380000 0 0x40000>;
-			#clock-cells = <1>;
-			clocks = <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
-				<&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
-				<&q6afecc LPASS_CLK_ID_TX_CORE_NPL_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
-			clock-names = "core", "audio", "bus";
-		};
-
 		lpass_tlmm: pinctrl@33c0000 {
 			compatible = "qcom,sm8250-lpass-lpi-pinctrl";
 			reg = <0 0x033c0000 0x0 0x20000>,
-- 
2.25.1


