Return-Path: <linux-arm-msm+bounces-505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDBA7E8BB3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Nov 2023 17:42:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC1C8280E0E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Nov 2023 16:42:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67EAF14F68;
	Sat, 11 Nov 2023 16:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wTlH0Zxy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C6C1B287
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Nov 2023 16:42:42 +0000 (UTC)
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 033643A9B
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Nov 2023 08:42:41 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2c50fbc218bso39242231fa.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Nov 2023 08:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699720959; x=1700325759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rDBwdEU+qwBWbhBWrVEXRUbPBd2Xn2/yAt3QN4v7vT0=;
        b=wTlH0ZxyJm/xJmO1686STVL5irlWb0n3jgPfuIQdMfm2jySIVz+Nyahu47rmAig/x8
         Ovbtf/BlxEkb5f4IuOfUJkre5ZRR3iO832CGrvN7NDRhlsPKlFekI1Rt72L3CTJkFb3L
         MWuXeq3ps9vjoTn60NVRs0CxUSeQgrRFjp8Lyx8ivEv4ghebIWsMs8BvnSnhtggbL5Hd
         MiA4LAecDeA7zaDGheAt+J2jupR0RncbNYcfRdZmNDBcAcbJm9Ro66Q5fTLyP7XVlM9j
         BAMDH5nz0BH0D9OgMfDTH2MQx/JWhsXbdJz6j1p1GVLLK7C9DmHZIuAY5kpLk8jSKvy4
         x0kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699720959; x=1700325759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rDBwdEU+qwBWbhBWrVEXRUbPBd2Xn2/yAt3QN4v7vT0=;
        b=K7J745avZFfoxS70vir42SJc9SlpTS6Z39ywv137DTkgVLAeyzuR6b2MVs1hcMwHJ9
         6VGtyWPHZOLXJpT/CVktH/9uUPVMJLxIfcvtcMHgMn3yA6ZK8SEKWwiwFI73li5pAhSe
         KfZDv/y8/2fs6JUPInjn1lNR7YwK06joRNtOL2iBzmVTo3gk6irkS6tyEWZ4kWLuHFXY
         ts3Nm5jk4hTo0hHlwsteDETtRYIARyFi/LaGZwGZ7SdXmXqxt61uFK9KSOqle8RF7rVB
         FD/lbNxwvCW6RFpLI99JRBUSkx09UHJFnktWsSwIFlaEOq0xX7PionFLZvnqbGAsx3QN
         xyDg==
X-Gm-Message-State: AOJu0Ywf9NqWd6dOE7HfUgNn7xOyi6mCphekKhX2WzgsfFDqXLjyTSjS
	+7J59S6PS1+PQW2PDNql06MU1g==
X-Google-Smtp-Source: AGHT+IGA5Um6eZ8w+XIjkvSbSY+xRa5jdvMH29dPL9q86wtvX01UoF6SWPfBnwSHz9f44JNmgVAqHw==
X-Received: by 2002:a05:6512:2214:b0:507:a12c:558c with SMTP id h20-20020a056512221400b00507a12c558cmr1632967lfu.46.1699720959161;
        Sat, 11 Nov 2023 08:42:39 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id k25-20020aa7c059000000b0053dd8898f75sm1161917edo.81.2023.11.11.08.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Nov 2023 08:42:38 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFT PATCH 5/6] arm64: dts: qcom: sm6125: add interrupts to DWC3 USB controller
Date: Sat, 11 Nov 2023 17:42:28 +0100
Message-Id: <20231111164229.63803-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231111164229.63803-1-krzysztof.kozlowski@linaro.org>
References: <20231111164229.63803-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add interrupts to SM6125 DWC3 USB controller, based on downstream/vendor
code of Trinket DTSI from Xiaomi Laurel device, to fix dtbs_check
warnings:

  sm6125-xiaomi-laurel-sprout.dtb: usb@4ef8800: 'interrupt-names' is a required property
  sm6125-xiaomi-laurel-sprout.dtb: usb@4ef8800: 'oneOf' conditional failed, one must be fixed:
    'interrupts' is a required property
    'interrupts-extended' is a required property

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Not tested on HW.
---
 arch/arm64/boot/dts/qcom/sm6125.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
index eb07eca3a48d..1dd3a4056e26 100644
--- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
@@ -1185,6 +1185,10 @@ usb3: usb@4ef8800 {
 					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
 			assigned-clock-rates = <19200000>, <66666667>;
 
+			interrupts = <GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hs_phy_irq", "ss_phy_irq";
+
 			power-domains = <&gcc USB30_PRIM_GDSC>;
 			qcom,select-utmi-as-pipe-clk;
 			status = "disabled";
-- 
2.34.1


