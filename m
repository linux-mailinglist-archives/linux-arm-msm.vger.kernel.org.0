Return-Path: <linux-arm-msm+bounces-23959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A508F914ED2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 15:36:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C9D151C211B9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 13:36:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35FA514430B;
	Mon, 24 Jun 2024 13:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UiCUyehH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CD513F445
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 13:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719235967; cv=none; b=XQmwKA4VtqNX73W5hTZFXqfFJUfVw/v9Fbo4xP03nO1piNjtMXvzEqa4OBm7u8Zu0uTcwxEWyS/LDxUbOP7vm/VAgyDP62iS+kai1StMXNnI37JYg+e+SqK/ospmmakJ8xGrHMCjsstI+05Aa/ox+uz3NwngbVWIhLcU5VW2xHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719235967; c=relaxed/simple;
	bh=eN0nSauQHWzcpR3ztkX7wbxGkq9GOgpa8mxkvBiq8XY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ReVhfahmH78we6FefFYnGntV0+QkgAal+R402JogzXJ4JerYnVKwDa3LzEUeIGU2+xLDmm2YHmAabOHJ3XqSWGcf9EBJLEpUI8qy028qIC6I0QRI29EDx3tcHUrXjcQ6v1TwHFTjFfJ1kJiiug4VcSSodqCxgL052MEGr9zWjXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UiCUyehH; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4230366ad7bso47628775e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 06:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719235963; x=1719840763; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vw7X1i/YW4Fd35XXIuhTMVk8l2VygEA6NsiqdF81ctI=;
        b=UiCUyehHlVF3QlOkt8YxF14puKwa6UVXy0HIxiX7wbcTLoAqw4zDkzeekPAICiNGVc
         bdp1iNkoibhZdJHT/iqsPu5XirS5R1MFjOR9BM6nfOllzM7qKgHFR2GV6+8JMNv9USjE
         DW/yqmbHRBQ/8NDbOyMHCGXATu0fHwb8QD3w7Ii0bXOnHTJ2sOvL9yRwo83tMmerhDse
         w+VGVaV1mih9GJoRvI9TupNig9gH+dI0ns9Lz4m9lNjRSxv2H3KW1ssS5EC+dkQYXXKR
         WsnDEb/0tOHhYVjkQki5Sg28cyoI4AgJ9pAXbSnUfhTNA9CoR9nROvoREqWKdLiStjvo
         r1gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719235963; x=1719840763;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vw7X1i/YW4Fd35XXIuhTMVk8l2VygEA6NsiqdF81ctI=;
        b=dFqg0EOct+8gjSQxg9LISFkjcYDsgufklE9jJF4BNpAi5BUsS/Vo/9Gz2AGHA5CCh9
         YenCw6+blO2UffCXEALgeQA0HimffRJ8OxAsUTthwB4SSyE70VQZVI1IwRPaONpDhx6h
         VKS0kvamz2H19DpMXQgMDkVxZt1C72Jh7IcCE/0tSG2UFen3ggSzKPoBV51jJua4V222
         RFMM3Y6qTtwF4J7BXdxe2Hv9i9BWip4BCGxjBxrrUX4RUYO1+/toi2hXPpBob8+rNTva
         cGi05VQL1bTB0kcoM1t60jUM23lLNSWl5j+tMuo9LcqwjdV/Px4rpV5V/0X/4FWUmzEA
         v1gA==
X-Gm-Message-State: AOJu0Yz6KxP+NEmDQZBjPZmY+wYrMXquul72AIFfM4XpO+P56GqwDfpa
	2tFsQ5YhQufChvLV0ekSDbv/ByikziErJpynX3F2wYlVldYTcAH+fOTrty2KLac=
X-Google-Smtp-Source: AGHT+IEgSlC8kOk4n5zGcYbrm4UVR+/pKyMI2r0uK52iKU9PJF96Pp4Mxxo/Cfh0h6Le8yNYvftc8w==
X-Received: by 2002:adf:f84e:0:b0:35e:ebe7:de43 with SMTP id ffacd0b85a97d-366e9499cacmr3125369f8f.21.1719235963682;
        Mon, 24 Jun 2024 06:32:43 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-366f7406f4dsm1888274f8f.114.2024.06.24.06.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 06:32:43 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Mon, 24 Jun 2024 14:32:38 +0100
Subject: [PATCH v2 3/3] arm64: dts: qcom: x1e80100: add soundwire
 controller resets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-x1e-swr-reset-v2-3-8bc677fcfa64@linaro.org>
References: <20240624-x1e-swr-reset-v2-0-8bc677fcfa64@linaro.org>
In-Reply-To: <20240624-x1e-swr-reset-v2-0-8bc677fcfa64@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2919;
 i=srinivas.kandagatla@linaro.org; h=from:subject:message-id;
 bh=eN0nSauQHWzcpR3ztkX7wbxGkq9GOgpa8mxkvBiq8XY=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmeXV3JmURE/5lysOEoqtpbe95ged/33DXxhuI2
 4zfPndTSOiJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZnl1dwAKCRB6of1ZxzRV
 NyRZB/9jIVWgTzLtdOV1vvd9C6m8ZdWzEiZwaINjLMXUxmzQNXLVdfwEs/wUfn+P54aCLEjEbky
 +lBO0MJ+MUnwDQ44QfxkX633WqFSV0ce3XiRqAf3QNwAAzLgPyUdjFjEwD1jJwo1Q3DSBAc8nuy
 SvPw657GNW5W+tMkkOFSVR8pKFuTVvDJ8cV25fmJBZHLAd6JrMd/y/Ae9KgQg25DdXurCyXyGC5
 ymG1grMxf3EAHxd+l4Cx3UHEBhX4eHV5OlX5GnysFocqt4U7hZFxfM5XzN0bLzo0ALW7PZHD/KX
 PWjDs9fyoLWEar2C8/sCC8UhlIeGX/KIF9xq+cu2zEhJjIgy
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6

Soundwire controllers (WSA, WSA2, RX, TX) require reset lines to enable
switching clock control from hardware to software.

Add them along with the reset control providers.

Without this reset we might hit fifo under/over run when we try to write to
soundwire device registers.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 09fd6c8e53bb..fa28dbdd1419 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
 #include <dt-bindings/clock/qcom,x1e80100-dispcc.h>
 #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
 #include <dt-bindings/clock/qcom,x1e80100-tcsr.h>
@@ -3177,6 +3178,8 @@ swr3: soundwire@6ab0000 {
 
 			pinctrl-0 = <&wsa2_swr_active>;
 			pinctrl-names = "default";
+			resets = <&lpass_audiocc LPASS_AUDIO_SWR_WSA2_CGCR>;
+			reset-names = "swr_audio_cgcr";
 
 			qcom,din-ports = <4>;
 			qcom,dout-ports = <9>;
@@ -3225,6 +3228,8 @@ swr1: soundwire@6ad0000 {
 			pinctrl-0 = <&rx_swr_active>;
 			pinctrl-names = "default";
 
+			resets = <&lpass_audiocc LPASS_AUDIO_SWR_RX_CGCR>;
+			reset-names = "swr_audio_cgcr";
 			qcom,din-ports = <1>;
 			qcom,dout-ports = <11>;
 
@@ -3289,6 +3294,8 @@ swr0: soundwire@6b10000 {
 
 			pinctrl-0 = <&wsa_swr_active>;
 			pinctrl-names = "default";
+			resets = <&lpass_audiocc LPASS_AUDIO_SWR_WSA_CGCR>;
+			reset-names = "swr_audio_cgcr";
 
 			qcom,din-ports = <4>;
 			qcom,dout-ports = <9>;
@@ -3309,6 +3316,13 @@ swr0: soundwire@6b10000 {
 			status = "disabled";
 		};
 
+		lpass_audiocc: clock-controller@6b6c000 {
+			compatible = "qcom,x1e80100-lpassaudiocc", "qcom,sc8280xp-lpassaudiocc";
+			reg = <0 0x06b6c000 0 0x1000>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
 		swr2: soundwire@6d30000 {
 			compatible = "qcom,soundwire-v2.0.0";
 			reg = <0 0x06d30000 0 0x10000>;
@@ -3318,6 +3332,8 @@ swr2: soundwire@6d30000 {
 				     <GIC_SPI 520 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "core", "wakeup";
 			label = "TX";
+			resets = <&lpasscc LPASS_AUDIO_SWR_TX_CGCR>;
+			reset-names = "swr_audio_cgcr";
 
 			pinctrl-0 = <&tx_swr_active>;
 			pinctrl-names = "default";
@@ -3474,6 +3490,13 @@ data-pins {
 			};
 		};
 
+		lpasscc: clock-controller@6ea0000 {
+			compatible = "qcom,x1e80100-lpasscc", "qcom,sc8280xp-lpasscc";
+			reg = <0 0x06ea0000 0 0x12000>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
 		lpass_ag_noc: interconnect@7e40000 {
 			compatible = "qcom,x1e80100-lpass-ag-noc";
 			reg = <0 0x7e40000 0 0xE080>;

-- 
2.25.1


