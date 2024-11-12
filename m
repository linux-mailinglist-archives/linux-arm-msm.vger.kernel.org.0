Return-Path: <linux-arm-msm+bounces-37538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C659C4CDC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 03:54:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E57601F21B4F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 02:54:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55D38209674;
	Tue, 12 Nov 2024 02:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jzudQ6IX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0EE208203
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Nov 2024 02:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731379999; cv=none; b=KgHeVaSy/xwSVvmMUz9ulS3J2iqJ84xPnE2nCR90b15wBQUUDwiAp4erzDv7gP/mHWHfkNtr0O/DO0qpQmr+FbAt9T6ACu74JXE+T4yDwEj8S+PZGMNsQadffFTv3KXa2S9Lcr6ail36fDy+uYmpZZml2oEm1eKHujxW0ayzQe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731379999; c=relaxed/simple;
	bh=REvlMMxx0XAJybhZSmB310utOAbwLWPvmzpZTyrvIuY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Eud2BXSC/xzupINjIg9HtY85U0LrrdtoY2OF9kolAnC+FMWGZonP6F60jzfYv/26mwC/PQ1O26Ecx8N3Em1bTC2ryWn/+uYixWVJ1UQbWh3fYBHZljFsG/umWUHGtnD45c5XycD4i4JjW19WbzTjyvmdWs5rmHDuymkNcVAF1tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jzudQ6IX; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4314c4cb752so45380315e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Nov 2024 18:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731379995; x=1731984795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Lorw65PtQ4cm8iqjexRvk/cRJr+lEVzhB14Mwt3cdQ=;
        b=jzudQ6IXcq6zylUew8J4c7ND21Fivm26rnbW39CiC09GFjtfG/ROCRKbahgElPV4I5
         7ruzqXr+SV9FRDh+p2+8SRwP1L/z70W+qH/gztfnQs/R6VdMaFPg9k5QoZ/bkcmpkQMI
         sbb5KQQS2O8Mltx70AuJsDzm4UmrZUMPFLSzhIzY/QlLvanXP/7/r/fAkOMBB9J9ZTJf
         wNbxGda1p1uHgpMAFeGnkybvw4PqXh+dzyZaAH3XKn2I039b7dEbv0SMZCdJlqXqyz8r
         S93hjsS7tIuwPZzrAIWD0lo7ltuAOIz+IKe2lvkR1rfpJ0pqqcVsbTfavanHt9GbtylC
         B98g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731379995; x=1731984795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Lorw65PtQ4cm8iqjexRvk/cRJr+lEVzhB14Mwt3cdQ=;
        b=EnilOnsKUu80vMBgafI7FTHV1brluOsSkSgfwVCfUmaqARpGHa5rVhKX9vQs775mRo
         Gbk29/EKV+x83xXp6/K58KfJBotOEwrtoG5s7Pdf42P9dDAx4SaacUKckhhfVxy7A6iP
         R3YOTHpWge4RyFbBueBC+b/u11dzYLO0AIamKBsiGt0y8reoIZR6htyVCZuw4HbHru7W
         x9882X5zCN4Lm9yvxd0JdCwK05CNrVHVhAmX6E78T872GxykL0uhzG4VOhg6LalxdJLk
         BvM4/VvqE/NbDorH9fU1bh0z3iiAWSyj2nWr2IVESnlTa8heO6ysBf5rjlu4SG0DL7ye
         821A==
X-Forwarded-Encrypted: i=1; AJvYcCX8YAumQGNHwyOcyHlLbzmEfvY1gqJIaFsPVok2BxwG2f9biBk8KcFwOqrRHZyUVYSWKk1/N/DuFp8GhAcP@vger.kernel.org
X-Gm-Message-State: AOJu0YzlUiIt+8pv2aGgZ5chZBJih3JVdYdaEuvKaNyOKuCdSZSr4K2e
	FiwLgsHMFfw+2LOJTS1ZRB/Wi8w7Q0gGadjTF4qelUHYMA4GuOzrBvx81DW/AXU=
X-Google-Smtp-Source: AGHT+IEXkJ1aBj0V8ruILZdaXYACOVbungEyelI77L3kEH9tEoDfZehKRKzAE7Jp6HasezXgUkm9Zg==
X-Received: by 2002:a05:6000:2d11:b0:381:f604:4aa8 with SMTP id ffacd0b85a97d-381f6044ed7mr6571685f8f.53.1731379994783;
        Mon, 11 Nov 2024 18:53:14 -0800 (PST)
Received: from localhost.localdomain ([2.222.231.247])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed999e0csm14056380f8f.59.2024.11.11.18.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 18:53:13 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: linux-sound@vger.kernel.org,
	srinivas.kandagatla@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dmitry.baryshkov@linaro.org,
	krzysztof.kozlowski@linaro.org,
	caleb.connolly@linaro.org,
	a39.skl@gmail.com,
	konrad.dybcio@oss.qualcomm.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/4] arm64: dts: qcom: sm4250: add LPASS LPI pin controller
Date: Tue, 12 Nov 2024 02:53:05 +0000
Message-ID: <20241112025306.712122-4-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241112025306.712122-1-alexey.klimov@linaro.org>
References: <20241112025306.712122-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the Low Power Audio SubSystem Low Power Island (LPASS LPI) pin
controller device node required for audio subsystem on Qualcomm
QRB4210 RB2. QRB4210 is based on sm4250 which has a slightly different
lpass pin controller comparing to sm6115.

While at this, also add description of lpi_i2s2 pins (active state)
required for audio playback via HDMI.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm4250.dtsi | 39 ++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm4250.dtsi b/arch/arm64/boot/dts/qcom/sm4250.dtsi
index a0ed61925e12..cd8c8e59976e 100644
--- a/arch/arm64/boot/dts/qcom/sm4250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm4250.dtsi
@@ -36,3 +36,42 @@ &cpu6 {
 &cpu7 {
 	compatible = "qcom,kryo240";
 };
+
+&lpass_tlmm {
+	compatible = "qcom,sm4250-lpass-lpi-pinctrl";
+	gpio-ranges = <&lpass_tlmm 0 0 27>;
+
+	lpi_i2s2_active: lpi-i2s2-active-state {
+		sck-pins {
+			pins = "gpio10";
+			function = "i2s2_clk";
+			bias-disable;
+			drive-strength = <8>;
+			output-high;
+		};
+
+		ws-pins {
+			pins = "gpio11";
+			function = "i2s2_ws";
+			bias-disable;
+			drive-strength = <8>;
+			output-high;
+		};
+
+		data-pins {
+			pins = "gpio12";
+			function = "i2s2_data";
+			bias-disable;
+			drive-strength = <8>;
+			output-high;
+		};
+
+		ext-mclk1-pins {
+			pins = "gpio18";
+			function = "ext_mclk1_a";
+			bias-disable;
+			drive-strength = <16>;
+			output-high;
+		};
+	};
+};
-- 
2.45.2


