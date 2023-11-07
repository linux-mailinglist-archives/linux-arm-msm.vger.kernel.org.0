Return-Path: <linux-arm-msm+bounces-47-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B5A7E38E7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 11:21:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7CE6C280FA6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 10:21:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 528C514007;
	Tue,  7 Nov 2023 10:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FPm9yH6v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3768C13AE9
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 10:21:18 +0000 (UTC)
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53B1411F
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 02:21:16 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-9c603e235d1so817900166b.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Nov 2023 02:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699352475; x=1699957275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LbHY8GAPAEL3LtP7aLdc8wgTK9Cumu0+Rrjz3dq0kEI=;
        b=FPm9yH6vZDZXtunJvSbS4dZve3ULDZPo6BdKECNqv6wFzajG6A50wk1cfDC/l8HgY/
         5C7+MiKW8TC+xsIbpLQXjXw044F6dmMliVqlzkH7hAJ/YjS1oGHA1GJWtl3m79Q8PL3k
         hbZUO+RlQMca8YKu1qB2niDz25CmZm40h9lwOwqvz6O4pFPj47SJCekIgLfpLhuOX6NQ
         d4vqYhjt+wSxEG+tmF8m5Jq0G9wE45xoetQie3f5w3OfvjBpAhW3uwHhU8j4PSsCfv6U
         upr1p31SLxE+QWeM882hG5KvAZcAyUo5HhN4nM5aEOUfRLUOAIh6dPt9gIOx304y1nur
         0nKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699352475; x=1699957275;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LbHY8GAPAEL3LtP7aLdc8wgTK9Cumu0+Rrjz3dq0kEI=;
        b=Iau+o5W47eZRm3scU3kZby2xn6UYqUSAfBqIsTIPTisl3C7HTIxfhPv1zDirX7m93x
         DjjIQUnNrHZd/7tqjEResvElmylS+RmFhS6l3fQN4+pDGC2BRafK3+zTrPRUQNlgxsBC
         4fALMK40FNHVy1I8lPQtojqrTkOAIlxlLoB0nlOb53UAQlJ84uTGHcW7bqz9AosBKxht
         sDVK5qghOr5eGhSC4FYt6hF4ctsq4+ygZpv0uml3peYilQXaBWYv76YyiNENSPc3/Cum
         OPfnKLNEhl1LjVMFxlo1trsabH0DbQwbsmQ5sXMFLwuXdh5sd7lNVoHLXinnUXnNIVGO
         nEaA==
X-Gm-Message-State: AOJu0Ywxht4+ncJuXXOt9f+vxGUMHr7bGKhWuvbiFpmFTy9u+lb8aEsU
	3jI9RcSPBKQN8jC2Ttpdf7DVBg==
X-Google-Smtp-Source: AGHT+IHhOxt3k1xxBC+RvB3+y16vDtfztqH98fVnIEZDJpjQJqNOpq8YmL2kBEfF5/8qwrPSAfbTUw==
X-Received: by 2002:a17:906:7309:b0:9d2:414c:b92 with SMTP id di9-20020a170906730900b009d2414c0b92mr16617407ejc.68.1699352474849;
        Tue, 07 Nov 2023 02:21:14 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id h25-20020a1709062dd900b00988f168811bsm862729eji.135.2023.11.07.02.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 02:21:14 -0800 (PST)
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 1/2] arm64: dts: qcom: sc8280xp: correct Soundwire node name
Date: Tue,  7 Nov 2023 11:21:10 +0100
Message-Id: <20231107102111.16465-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Soundwire Devicetree bindings expect the Soundwire controller device
node to be named just "soundwire":

  sc8280xp-lenovo-thinkpad-x13s.dtb: soundwire-controller@3210000: $nodename:0: 'soundwire-controller@3210000' does not match '^soundwire(@.*)?$'

Reported-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index e5bc9c51ceff..3af3625dd5e6 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -2730,7 +2730,7 @@ rxmacro: rxmacro@3200000 {
 			status = "disabled";
 		};
 
-		swr1: soundwire-controller@3210000 {
+		swr1: soundwire@3210000 {
 			compatible = "qcom,soundwire-v1.6.0";
 			reg = <0 0x03210000 0 0x2000>;
 			interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
@@ -2806,7 +2806,7 @@ wsamacro: codec@3240000 {
 			status = "disabled";
 		};
 
-		swr0: soundwire-controller@3250000 {
+		swr0: soundwire@3250000 {
 			reg = <0 0x03250000 0 0x2000>;
 			compatible = "qcom,soundwire-v1.6.0";
 			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
@@ -2843,7 +2843,7 @@ lpass_audiocc: clock-controller@32a9000 {
 			#reset-cells = <1>;
 		};
 
-		swr2: soundwire-controller@3330000 {
+		swr2: soundwire@3330000 {
 			compatible = "qcom,soundwire-v1.6.0";
 			reg = <0 0x03330000 0 0x2000>;
 			interrupts = <GIC_SPI 959 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.34.1


