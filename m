Return-Path: <linux-arm-msm+bounces-49937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 30246A4AEF7
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Mar 2025 03:50:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC26A3B5210
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Mar 2025 02:50:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F421142A9B;
	Sun,  2 Mar 2025 02:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cZcvDFSX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C0C1925A2
	for <linux-arm-msm@vger.kernel.org>; Sun,  2 Mar 2025 02:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740883810; cv=none; b=tgqK6tvY7zk1CZJQKbusJjydg+sTedFBF0NeB0Umri9fGFpoYwtefAXl43s/lnIBEtroU2iQzn2MCwVK3iCyuSTzQe/yC127p77zii3YUilmox3fudLuLG000o33bDhD1zxzTXiCWEGt4ur+rCKVFd5GJLknvnQuR/R++pTOnDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740883810; c=relaxed/simple;
	bh=SlByiTDxYgd85794TFUJfJk6EJELUYRPQB26XL4VOA4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oj6FzZJgYPccIo4JuceabMNFrQOEeFxCsrYMxk3SV6HQ5Z8XZWUc4pLsq29uAt/afhKtCynliqml8aVBJSeLDNXaA3+oLfR3cploECHp5LqWadc/Rp3EWAsNCMYXp3w7HlWX+KDk2+fBaV+x9ZSVSmH2ejv80Ih1/GlTVKwxpmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cZcvDFSX; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4398ec2abc2so30046035e9.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Mar 2025 18:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740883807; x=1741488607; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DVE7MMoQ2WthyPOL2l/3V1MXkj9hPNOqHWuQkJid+/c=;
        b=cZcvDFSXjVmoD2eTQZoU5dkAFcuB9Pa6Xf4E2ICzrRF8acb1OmMdW4iFf2zhA1iK5q
         az2aQQ3tZEGyJHKxQhrenZx/IqhpC8GxLl77npYBLzRFo04XpVfY/p1CiD47aJ5ChZUK
         f1vgSBd35MH3I8Mmq4KvcUCTTh7sYZIUdeNmoaqcxjZMKfL8L2e3FFkUeJgw/+o+lWYI
         K6Zp7T1ZPvXfY2uogexDbmcAIzzbJNDUMN62cVW8HUfilfJ2uNabHb06NO8cSwsop7FT
         w51WVsAJZynDLtAeRbqDD7Z2mt/CaVKMaAjz3oTzHfxaX6hENfCI7AbqB0k/xiDm/S2V
         4xfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740883807; x=1741488607;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DVE7MMoQ2WthyPOL2l/3V1MXkj9hPNOqHWuQkJid+/c=;
        b=c7udbU3Fwmu1wm5FbwLhZLWf0W5+6V8UbPr0D6vaQNtq+h01Orb0h4ejxZqbXxkw5s
         CI8eZTPn9xSDDCRtg2THB1ZfCV+GfmfOURvM+SyYviUD8w4317iYZt2bW2o6nB2dQMuM
         Cx6LTMr7xldpw+zqGo1BMm90ANWgJ+93FYyvYLtHn0+nzFZeCBWU9+1bblsHHRSLv8F5
         WKB/dbB6+mB6YdtcSFavnHiVWi9L0E926ytrb+y62f2fhp9+ioOzl9l9lg1BtivW5XKN
         4qnGQwZcOBw2bov3mTVrC8ak1aLp45swr+jYA3bWAsWAO+ZEg3u6bV/VUTbI9PFpzcWA
         rdcQ==
X-Gm-Message-State: AOJu0YyL2kYj6UnSy3W3NV0xaf2uJbPpNV49rQtwECF7NONTVqQZowoM
	k3D77XS9G2MWrZ+5+SEGlzYhUunz+SOzudbDM/rUrBuIw5ObxriNd4t3np1lcJo=
X-Gm-Gg: ASbGncueIDDPetxfDZR9i8Al+lRzhzK/zSKJSfmeqIgkXq3xzn8tffym+KWSDsW2oDU
	hswxEjxhOCtutot3zwyLpRvTjvDLb0KXfnE2cDv/d4llWPy8Q4Z0aIBbCYEEU79CsItbWCThQcH
	GWCLdLL0WW+Inaohmo2b18Ac2dBwEXzyY0oZj/lVemFZl7MUil1Nr5qk336E+1SsopBXi7SKFuK
	PZzOCaXBPqAMv6KqE6WelL6CAvP4jwayuBTzusQWNsSLCIjrKog6QKD1Uki3BlAJBaZ4VsFjLsX
	MhRkWWBWeKgDenVNyhy8lksIWxnSAZ9zu5RnlDSKHyJdYES0Y3mV/A==
X-Google-Smtp-Source: AGHT+IF1OyUGX9QaED/sDZkS9eJZ9gYij7zwJ8c8ovq4U+BP6af7VsWqnEYCb6d6Amdd2x4tpI0G/Q==
X-Received: by 2002:a05:600c:1550:b0:439:6dba:adf2 with SMTP id 5b1f17b1804b1-43ba66e7550mr81082225e9.15.1740883807490;
        Sat, 01 Mar 2025 18:50:07 -0800 (PST)
Received: from [127.0.1.1] ([2a02:c7c:7213:c700:e992:6869:474c:a63f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba532b0dsm137845975e9.13.2025.03.01.18.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 18:50:07 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Sun, 02 Mar 2025 02:49:54 +0000
Subject: [PATCH 4/5] arm64: dts: qcom: qcm2290: add LPASS LPI pin
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250302-rb1_hdmi_sound_first-v1-4-81a87ae1503c@linaro.org>
References: <20250302-rb1_hdmi_sound_first-v1-0-81a87ae1503c@linaro.org>
In-Reply-To: <20250302-rb1_hdmi_sound_first-v1-0-81a87ae1503c@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.2

Add the Low Power Audio SubSystem Low Power Island (LPASS LPI) pin
controller device node required for audio subsystem on Qualcomm
QRB2210 RB1. QRB2210 is based on qcm2290 which is based on sm6115.

While at this, also add description of lpi_i2s2 pins (active state)
required for audio playback via HDMI/I2S.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcm2290.dtsi | 41 +++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index 2c90047f7dd867580836284721c60ed5983f3f34..623046ba833b6da284ffa4e30e65ea4ae5fb77a2 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -18,6 +18,7 @@
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,apr.h>
 #include <dt-bindings/sound/qcom,q6asm.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -650,6 +651,46 @@ data-pins {
 			};
 		};
 
+		lpass_tlmm: pinctrl@a7c0000 {
+			compatible = "qcom,qcm2290-lpass-lpi-pinctrl",
+				     "qcom,sm6115-lpass-lpi-pinctrl";
+			reg = <0x0 0x0a7c0000 0x0 0x20000>,
+			      <0x0 0x0a950000 0x0 0x10000>;
+
+			clocks = <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names = "audio";
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&lpass_tlmm 0 0 19>;
+
+			lpi_i2s2_active: lpi-i2s2-active-state {
+				sck-pins {
+					pins = "gpio10";
+					function = "i2s2_clk";
+					bias-disable;
+					drive-strength = <8>;
+					output-high;
+				};
+
+				ws-pins {
+					pins = "gpio11";
+					function = "i2s2_ws";
+					bias-disable;
+					drive-strength = <8>;
+					output-high;
+				};
+
+				data-pins {
+					pins = "gpio12";
+					function = "i2s2_data";
+					bias-disable;
+					drive-strength = <8>;
+					output-high;
+				};
+			};
+		};
+
 		gcc: clock-controller@1400000 {
 			compatible = "qcom,gcc-qcm2290";
 			reg = <0x0 0x01400000 0x0 0x1f0000>;

-- 
2.47.2


