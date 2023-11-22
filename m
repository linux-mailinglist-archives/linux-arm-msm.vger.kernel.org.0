Return-Path: <linux-arm-msm+bounces-1502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A39527F455B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 13:05:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 557321F21AFB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 12:05:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7963C5A119;
	Wed, 22 Nov 2023 12:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O7l+4JBa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D55B510D3
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 04:05:33 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-9ff26d7c0a6so429936166b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 04:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700654732; x=1701259532; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bymm8ioFVVD3dhLMm++/IzfooTvBAxFVOSgxW0vP3RQ=;
        b=O7l+4JBawhFmrtkfqORuV0TIP5EqhOAHHf0S/rFVAGo6sAA0drkZfDu/zRahTDb818
         5k4ZLU0p82ktnLEw8x4+5aZ+6FUqj191+QMJK7FtaD9UoJ0Z5nIMMMjzYhRSIiSZrIfe
         ZXP1jWhGAZ4yTK7JJSj1A9HlZekyP0NdL1X97pkPSwpne4u/3XR4ms7asdtrEn636LJC
         Y/BWxlN42y62y25Ts0MfsLqy0u3QqeLt4a0So6V5RkOi/PDPEAlNiC81j2Xn48JWYxXW
         P3/p2ApyEQ5FXVI5Jsas0Q+2CCzLFj021NNaMaQmii4TA5o3c9tgOwFO9Vz1BvV9YnUj
         O5Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700654732; x=1701259532;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bymm8ioFVVD3dhLMm++/IzfooTvBAxFVOSgxW0vP3RQ=;
        b=HugF/y8gUToDGssHbT+vRS4Nhfgn6Q4zoAukjJUpGFMEIUqzawOuaejm9FJ84EYJm1
         JcT7oZocKyO0fwjw2hDf3v5l/8+bkPn56/YBBYaCBUi1gwqPrTC2s0o8OBR6rz24MG2N
         bhv1k+VFKFj2XO6iHmhbYqOJIumA6U9AsajjS79wPI6svmIezUlB7ICrizWWidnoDr61
         WU48w2HaDg5tvBwxhD5Oa4m2OvW2e/J/hsqIhJg76fXAAbQki2rSW/lwPlfeIlXZ3cpZ
         VwD/vIPF4fajZ31Qvw2UBDZbpoQv+2Nue4INSC0ywB0AiHGLpQ0vHHHnAfE93Si7/2qV
         vbnw==
X-Gm-Message-State: AOJu0Yzs+aDfbWHEWyMJsez6iB0l6qpI3RNRZs378DTzwZu1pHLOel9Z
	2QZFsCshurRJT4UyYq5ZYjPDxKxp+NaYWtIep1E=
X-Google-Smtp-Source: AGHT+IFHxGuasn2hCVAywG1/40UpIxj4n1WBlznP+vAlUpkOgylTp/74MdCSST/XfRt80LCtIdPAHQ==
X-Received: by 2002:a17:906:9d14:b0:a01:c04a:b843 with SMTP id fn20-20020a1709069d1400b00a01c04ab843mr1330938ejc.41.1700654731851;
        Wed, 22 Nov 2023 04:05:31 -0800 (PST)
Received: from [127.0.1.1] ([86.123.99.122])
        by smtp.gmail.com with ESMTPSA id kq14-20020a170906abce00b009fcb10eecb2sm4383416ejb.84.2023.11.22.04.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 04:05:31 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 22 Nov 2023 14:05:21 +0200
Subject: [PATCH 1/2] dt-bindings: phy: qcom,sc8280xp-qmp-usb3-uni: Add
 X1E80100 USB PHY binding
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231122-phy-qualcomm-usb3-uniphy-x1e80100-v1-1-3f5bd223d5b4@linaro.org>
References: <20231122-phy-qualcomm-usb3-uniphy-x1e80100-v1-0-3f5bd223d5b4@linaro.org>
In-Reply-To: <20231122-phy-qualcomm-usb3-uniphy-x1e80100-v1-0-3f5bd223d5b4@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=843; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=Ff/TzKsr6VAOQih2h47SXfwoazhLB1JbDRlKoZrC1AU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlXe6HIiyEgikpop1Wudnzf4cIJEHtKgxjpGy7X
 feKVqqm9OiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZV3uhwAKCRAbX0TJAJUV
 VlM3D/4q4GqU7KihS6jouVBbYJL68SAuWdXSWijx9lTEkmWY1zKy/5+hTyhSCXwTaeK8M4VHuaw
 P6bw68odJ6BAzzfu+vLYtXH3snTgjk0L8MKXKOUrP+ndgFxCHnDi/wb9Xl3nYoOR9JmaQt7J9kI
 jtVER2C2wtBHwH9NI1txuT55Mujy2Kywh4AWzW+UyD/o+5OPBP0pz+UIeH/3bh4fM1o02+8+tZu
 HXI2w0gV75aAOQ/b8l88EI/g3axf36rnevsUeD8DmHvZoiZbBP7w8qvUPqmf0qXyjhw/4wAuOLj
 +cPw5D8rMm3V0O6T3aYnjudWrRBrox/+66kyVlCOHphusYUUGdGaAEHREBqjDc5WPLEecbkLErR
 T6L25nHaIxooyV1JcrSXHsf6OK68JHhNwrXAGuxPvYme6FF+yC/HBi4lKgvYY/gexOgvgEPbSk8
 PrqCB8Bh+UgBJ/566qzbhEKTbAZrwj1hSZ+2yk9qCnTqprP141H0Oav6cDFF1bLIsOIxr804a4y
 +7refNHwhj5KNG9n6fu3RRSnMcye4StU9J7uAcL0onArspVbis7lowN4LWa8VGg59tTOT3HGa20
 skOkzqPLUY1IixvV8sofVvPWhgvviQYtELdFD48RqY0nlPFCu/92D/OPIWMp9RsB3+IvtZpzFhY
 6aqESegYgGlFTRg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Add compatible string for Qualcomm QMP Super Speed (SS) UNI PHY found
in X1E80100.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
index 57702f7f2a46..6041d17c0e2a 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
@@ -32,6 +32,7 @@ properties:
       - qcom,sm8150-qmp-usb3-uni-phy
       - qcom,sm8250-qmp-usb3-uni-phy
       - qcom,sm8350-qmp-usb3-uni-phy
+      - qcom,x1e80100-qmp-usb3-uni-phy
 
 
   reg:

-- 
2.34.1


