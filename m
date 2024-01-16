Return-Path: <linux-arm-msm+bounces-7300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F195382E77F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jan 2024 02:48:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93DCD1F231FA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jan 2024 01:48:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F14A941C87;
	Tue, 16 Jan 2024 01:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E5k7RSk5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D075341C8A
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jan 2024 01:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-50e78f1f41fso9819234e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jan 2024 17:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705367319; x=1705972119; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KjAbofYbgQMqfe5mB6yt5wPFLv87tIF7emGg5eJbAI8=;
        b=E5k7RSk5o66HMgYXDHQh4IqTUrQCKZR2v4Ez00J1NirS7jafI0tU3WGAjdEmvQL9S7
         yxA71tpvUSxrEdgOQcf9CLBzt5xl0ycQSFKlft8W8fW02zGlExqKTCBozLb6kCqyeBZh
         xXXLRg5Mk6rYZypMXF2CkrMpcAyggG2E5g/gp9cKQlwh3UrxiyQm99tEzyMoJda2A5mA
         YGN2klvwBRU4U4dfEFjn5ZpnqhpXGo+YaphvGarKuBoj4WpIHYUIGzozWRlnGh4Ps8FC
         6p/SDLnt+6WUaN4DyqkCEw7WaI9qyVnLnG3Gj8wgBRDRcGyFQ3ONgUOGZkcE13QRotSR
         jPPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705367319; x=1705972119;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KjAbofYbgQMqfe5mB6yt5wPFLv87tIF7emGg5eJbAI8=;
        b=f1ScgFGBLZ6iuPxQ7WLkcl5L7xkFaXRTNGtXKhcoMKxcvce8h1gCYWU0jP1cFCEgJa
         D7PYUPWxaN9zwnP2uh2QvAm50nGjGogULzdHqKjyy6P8y5J4vcTEupqEsf2nJagJvx/2
         pZumuMxD6KnF82ZaMqyheKc8jOmVTpI/J+TOgkipcZxstqBrxADW9CbVWu40f7xEumpS
         wSdE/GKqyMiPhgZqB3BVrw+eP03WtiCdgEXxLJtpofDTjaXiLeQZDXoj16HOGV+4liz3
         8Vl0qeLhLxkVCqi9AxkSOlGRCT+b9K5j+EZP4owuzIMIjDSD9MQ8I2vrGzIoOmg/jg/T
         Mtug==
X-Gm-Message-State: AOJu0YyTNYS/yclyjqB4kVgUuZZC3QBxzV1DShP8/qrwKFHtZcDzJxgY
	9EQ8wo/ZmQN1Ki69V3W8wO8YvUEoyaa8YHsnGwt0n2/TjEnYAw==
X-Google-Smtp-Source: AGHT+IFueQXJ8ShoFoz9nVCNU/s/96Gc66MS/UQ/2dpc5943PKJcBsJx9cP1+tPjLfKxXUs1ZrgMAg==
X-Received: by 2002:a05:6512:403:b0:50e:9dbe:e565 with SMTP id u3-20020a056512040300b0050e9dbee565mr2488449lfk.8.1705367319015;
        Mon, 15 Jan 2024 17:08:39 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t3-20020a056512208300b0050eb2325472sm1615507lfr.37.2024.01.15.17.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 17:08:38 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 16 Jan 2024 03:08:28 +0200
Subject: [PATCH 2/6] dt-bindings: phy: qcom,msm8998-qmp-usb3-phy: add TCSR
 registers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240116-usbc-phy-vls-clamp-v1-2-73b2da7691c5@linaro.org>
References: <20240116-usbc-phy-vls-clamp-v1-0-73b2da7691c5@linaro.org>
In-Reply-To: <20240116-usbc-phy-vls-clamp-v1-0-73b2da7691c5@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-phy@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1603;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=aBcQF7l7ykn1twMJr9c0QhEVt66OcJk/Ki8m8VZZ5gA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlpdcUwW7a37xFdBCpgcJhqWckj1rXkxGi7snJH
 SLCros33d+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZaXXFAAKCRCLPIo+Aiko
 1a1LB/0R8F87C2htTQS4hraLPGVNqIStbZfamJwSeJQO2gOpDAdXtp9pZdR7iwfDEqosWps99jA
 LpaUXEyagmbPmyqgJUkUBoDBaZ/GD6C/fuC7UhRPINF6DsCDt68VIQBeA77Gkv/U9/mhhb/MNll
 JA0i+lZwYuFXf6CIN6HgRmrhbunt3ZJyLxcC19CUg81yvQzJ7SYOrEATxliPYbeMq8ETLFQu6ZB
 vvWXJ+Vmn3WpcjbzsHplCeB2sIsOYvVlaA+hilh9O3ssflu7UPqySGu29Wmyasj3rzAf7wqujQd
 0ofGcqFLJiQ+g+fpugm4ANRZKMW9iwuWmWg/QZPfMyEwRMiF
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The QMP USB PHYs on msm8998, qcm2290 and some other platforms don't have
the PCS_MISC_CLAMP_ENABLE register. Instead they need to toggle the
register in the TCSR space. Declare the registers accessible through the
TCSR space.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml    | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml
index da5d4cbca24c..140843347d1e 100644
--- a/Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml
@@ -55,6 +55,14 @@ properties:
       Flag the PHY as possible handler of USB Type-C orientation switching
     type: boolean
 
+  qcom,tcsr-reg:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to TCSR hardware block
+          - description: offset of the VLS CLAMP register
+    description: Clamp register present in the TCSR
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
     properties:
@@ -78,6 +86,7 @@ required:
   - "#clock-cells"
   - clock-output-names
   - "#phy-cells"
+  - qcom,tcsr-reg
 
 allOf:
   - if:
@@ -148,6 +157,8 @@ examples:
 
       orientation-switch;
 
+      qcom,tcsr-reg = <&tcsr_regs_1 0x6b244>;
+
       ports {
         #address-cells = <1>;
         #size-cells = <0>;

-- 
2.39.2


