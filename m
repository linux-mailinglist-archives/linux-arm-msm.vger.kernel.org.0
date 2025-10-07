Return-Path: <linux-arm-msm+bounces-76146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1706BC001D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 04:04:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFC8C3C310C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 02:04:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3EB521C163;
	Tue,  7 Oct 2025 02:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="osb74vfy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DDA219A67
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 02:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759802630; cv=none; b=mEI4ruvgg6NrSImDyCXsl1YttjTxfs5r2vosG5F9wteRai0uEJW7aeF7mxMMrpdfOf0Nmy1xlOqXY0zZOPcMMshZw0YX7zMgTzFm29BWHRfcWl86t4A8rmUNCl9Y0rMDqHzeii7+0uf0AgbopgdTGER32ACVjcfMKJWZWfun1Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759802630; c=relaxed/simple;
	bh=dinlYOq4GNp8S92cG3IIG6xQe9bDgEHO1mWnzU7Enuo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C6ji2q4LFiwvYIFjL/DAoxcv9rI3FBSyotYCFYfMxOfqPxgMB4xUDNxfAjqbDveO8/KMFHEyQ5k+YBMGxQPHgEkghktBT4yx7q2GGQzX8PI/gRMd0p1kcBdSEyrZD6ErHvsmJMsX6hJkrXEZ0NBy//SsTb1F/NbZ1FI9MSj0V2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=osb74vfy; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-368348d30e0so52888301fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 19:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759802626; x=1760407426; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dh2P+1S/rGMae00So34IFmR5edBimGYszi1sGivuL68=;
        b=osb74vfyTFtNpbUrt6ea8gZn4J+VeuJAo7XMmuAdTmvgaNN/zeedIWkisYRjkRCUx1
         Vn5qPyUN8rzlUpEM8s95QHkChU9nfmHQBmTmiQGoBDiHBTlwr8DCb5QxAQ5loQ2RcROD
         NWtOwtX6wetJxP/izoKPGntwXuAFEhZdQJE4NHMXc3iTMyGPO9WgGg3znbapNGYxxLtg
         IFJ3/fIsQiypP2KpfB6xmxmjuimLQtQZez+CK54Y2/XGhNj/qjrzihTvk1IwfPamWDDn
         sGcaxUAEwaC1QUn37TJWa+8zcfWaMkfQL9pLcRAM7y9RntHmcIA9PQE8Z8tw7sXBJkOf
         eQqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759802626; x=1760407426;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dh2P+1S/rGMae00So34IFmR5edBimGYszi1sGivuL68=;
        b=LQ2XbbjJkm2R3oe2x62XfumiDuHsXYLA1HZbG3ugZxBNBOxzgZMjWoW/Hekt17/S5F
         uJkY3kCdq1xK8SEX3lR5G0+kgSr1Rad6rNoz/hP12m15vbjYkAkM70mlTRdM9tqWqGmz
         DSU3iPbbn6D0fIIAw6yohx4Xiejdhq5v5AR5lYZpghG+Ku6lv1ApjBlPd7ZYPdVo+4P+
         G7ZPhy/ACXvG32mW5l7JBJn8GdztM5pdZ47ho3YCzuWKA2DejfLd4E/ZeLl78svZWXEO
         miZ0x9R3pBEGhZo65/cAtxHY+4xeb9tp7juO25gcRTNCErx0ZgrZCxjiDuJOYoWfQ5zn
         ciOw==
X-Forwarded-Encrypted: i=1; AJvYcCXEnrH44925LHxc3iGP/DXHZu0NHF7X476ufGB7z7TkdzS8IejTvzct7uIhxJgOkWKvM1hveNIBstEO606S@vger.kernel.org
X-Gm-Message-State: AOJu0YycIMirMsPiquFzMDct9yyPS3iXWJqYSOkIW0TPbyb2BVUECzQX
	GKFFV8OVAD1Sa6BT6h37DnHQJFPwZVzefeoNkscQp9kZMAAU29e5SBDO+5ewRBrGX58=
X-Gm-Gg: ASbGncspufg11WXUnCPGTTVlOaOaU9YQWIibm9IJxKwPE7tNttuPebjBCgB/pOoaMyR
	7twdCePKL5Z54fE8sVY3m0fKRdcK9cE6tQM4FADRgeMNHS+j/Jv2ZgQPt8Nu658Q6jvZZ2xHV/a
	Ck+bh0dTS5DWJskcKXOKrUoQ/hduB6OxofndQYI2eD98O/gdr30D6jChdU/CsO4tLMs9yTYYXKb
	QLSpxxBeqnsAPoLA3VCAwUGsLj9yrpxS5uvMCaMrnISIclnLhJ1R6NHeZlo3Axgh+zv0TQ5GRmq
	EPBgfgNHOGfrcYRSZSyv2xJvwRpHsaes1gfbRqb6ptqOabj94Rqrh8uoduo9yiVroVCX0Vasnfm
	MAp2fW42UUfdA4MUHKEiN1jGXoJrcda3FqrMSFXVb3p81FOHsLlDnKodw
X-Google-Smtp-Source: AGHT+IFI9nX6DVmCAMZ3FKDjnGx6oV0QSc0nIDHxs6ctW8TRx/vmNB5maIOBRka6gVB6NnvAv1QDrg==
X-Received: by 2002:a05:651c:25c7:20b0:372:8f03:b73f with SMTP id 38308e7fff4ca-374c384e19cmr36666571fa.36.1759802626183;
        Mon, 06 Oct 2025 19:03:46 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7259:a00:22ae:baa0:7d1a:8c1f])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-375f3b81e45sm5150391fa.46.2025.10.06.19.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 19:03:44 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Tue, 07 Oct 2025 03:03:31 +0100
Subject: [PATCH v2 3/4] arm64: dts: qcom: qcm2290: add LPASS LPI pin
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-rb1_hdmi_audio-v2-3-821b6a705e4c@linaro.org>
References: <20251007-rb1_hdmi_audio-v2-0-821b6a705e4c@linaro.org>
In-Reply-To: <20251007-rb1_hdmi_audio-v2-0-821b6a705e4c@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.2

Add the Low Power Audio SubSystem Low Power Island (LPASS LPI) pin
controller device node required for audio subsystem on Qualcomm
QRB2210 RB1. QRB2210 is based on qcm2290 which is based on sm6115.

While at this, also add description of lpi_i2s2 pins (active state)
required for audio playback via HDMI/I2S.

Cc: Srinivas Kandagatla <srini@kernel.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcm2290.dtsi | 41 +++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index 7303aff33814f256a2ea09a71a640db466370eff..02eee364e618358e5ead78c2b97fde12a57ede0a 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -19,6 +19,7 @@
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,apr.h>
 #include <dt-bindings/sound/qcom,q6asm.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -673,6 +674,46 @@ data-pins {
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
+				data-pins {
+					pins = "gpio12";
+					function = "i2s2_data";
+					bias-disable;
+					drive-strength = <8>;
+					output-high;
+				};
+
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
+			};
+		};
+
 		gcc: clock-controller@1400000 {
 			compatible = "qcom,gcc-qcm2290";
 			reg = <0x0 0x01400000 0x0 0x1f0000>;

-- 
2.47.3


