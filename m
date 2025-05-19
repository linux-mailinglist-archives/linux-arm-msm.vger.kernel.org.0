Return-Path: <linux-arm-msm+bounces-58374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D68FABB6B5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 10:05:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E0F2E16D46C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 08:05:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35784269811;
	Mon, 19 May 2025 08:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G629HJlG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE75418C004
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 08:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747641914; cv=none; b=lSwjYya/NuivhsMXO/XTICMW6x0+j1737zu+C1xS8uiwDOYTaM1Pn8uRJLDvj8F1SKV+tjAxn6Zm8lxlRbo+PkCv37VYWGzkDIJ8K3HoWqDc7gGdMJF86Q/6Hj7TCC11YKAi66BsnXPAxhFwFMCQh6ZqMvpLD9CjmqbWpOKVDVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747641914; c=relaxed/simple;
	bh=eNjYz8w5sMtLPA6MRlmwOuJOvQJcZkOlZvehWvQGnwc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hKy/P8qvHPuixU3Zxk1QqOe4gmn7vjxkTrBDXTpYhz13/USLN8WiQPnDMCnstow4w4wfeof9le4VOSM1s2fplmUgOWkhAmaD1FzrdxlOQfrO9T4SdQx43YvyOkPw2PjIva70ZYqOqZ1ksHCwsWknppJUIQUuAJSGu4Va2CYfHf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G629HJlG; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a362e099cfso389774f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 01:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747641910; x=1748246710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8/uUno12+MugHV7pnu6lW/BQmxMIkNtzIi2L3w3Py9U=;
        b=G629HJlGOK/DqDwwRndxRb7kVPzIaiOhUQ2N7hr31r+aqRcStJXWZy/Cf4qzzv8Cmn
         B70ha21/+0Yh/nPJnuDLImVWLKBSpmAcDu+JgCIjkOdfIdm0Sn/FUB7hD2A4QqBtAvCo
         re/AdMFeEuRqzWaP7v4nmHkhD/HODM16c8hc/p+wsuWUFXFOHP27edJsffZIw3XL5VeZ
         PEJU16/uvPLNK4rgsTUN286sVs9sOZs8Yv6esHlZ+0SWsWPitpvViZZSssUZC1+uuV+j
         H/IL/TieZ5GghwbqknA6T2FP11kHt/oK7lE6V8y9Q87r9D0ptUZFo0BjA4P7yrCMdBpQ
         mfvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747641910; x=1748246710;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8/uUno12+MugHV7pnu6lW/BQmxMIkNtzIi2L3w3Py9U=;
        b=LG6slJqHCoVCC3LY9qsr3diBizQq+5JlhNePLfTTMIzZDP+zh76BKUdKOL7mQnh8Qv
         3+lBWOIcWn4oeB+IfUNTB6CgtVpqXwPQ4j239A5vI0oJh5V36s7OMpNDVMgePTxc685b
         J9cMTI0cQtFBVV5H1zx4Pfs947G6J2qyJKOMgZrdlkCHdcv9y2CuBxDpuDB8AkI1oTNX
         WFrEtwb6lAKj8N+GGtknvTfl1AvIj9GiTtU5trEt2V7PG5E9Sbk3W95eQt4WfaCgtZfe
         eiblDEVTvBxS7sLemynrBOiFhyiBptGiBsMsL03elxKj7UejFjuQksD0gEOGVZJueH5c
         uecQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9B3GCByudJCXC6wkL7buS5gps2P6sTffvRQ2h2vsq0poI0jzU2t/fdfnyVZE3YAM35JgEM+/73LoALDSs@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8N9xi5lRts2rgH63K6+m16k8zCsn5wjL4Bvgj9vb8h9KvOJBD
	p4PiIjZWZvdhCJ4dIqWyXlcX8ci6Q6AEyv1hYaFicgngJ9S8PA+YDpy/V9EICA7FsdM=
X-Gm-Gg: ASbGnctJMTp0rL8GZnwhll7ZP9nR4/uyn6SUWAwxVK2RZdILL/MyVlirsVvLCCIhpPe
	elgW2y2X8ag5eDhBiChxMjq3L2lkUq9X7DX6RauB6RuTlkQ4byITNji1Q3X4EZkecN+u33hWUjR
	PXkb5yxl12s/WdPeM8gfhxecilbN0+2ULVOvw/ZpJWnFOoMrX6QDJd5EeDlJLF0Je1MLNsaLxt+
	jlcK4l583YCy0VnqzRzXlGB59dqnzAgF958oBOLBsS9xlBY+vCQReOa/GV02YUgmhqqAnj8D9/S
	P4eR/MvYfrf6lZPOTq1NKe4yrwuHpFe0Of2pMWa5gRrVU4aeOD+d4pl2+xM7Lw==
X-Google-Smtp-Source: AGHT+IFeaCCRDIubiGu54CbK3aqd0Ov35Z88utQJJcSo42eFJKtNFYB/mAl3+BbnejgRY1XpJld7rQ==
X-Received: by 2002:a05:600c:3b95:b0:43d:2318:ed7f with SMTP id 5b1f17b1804b1-442fd5a2cb4mr40169245e9.0.1747641910121;
        Mon, 19 May 2025 01:05:10 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f3951854sm198293705e9.24.2025.05.19.01.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 01:05:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Rao Mandadapu <quic_srivasam@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: soundwire: qcom: Document v2.1.0 version of IP block
Date: Mon, 19 May 2025 10:04:54 +0200
Message-ID: <20250519080453.29858-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1500; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=eNjYz8w5sMtLPA6MRlmwOuJOvQJcZkOlZvehWvQGnwc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoKuYlT1JUthzmjuD+5hZUrrF5hzhw0Rxr6qB8W
 fqh1D8/n8iJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaCrmJQAKCRDBN2bmhouD
 1/ZmD/9yMrVo5Z1OUYC5ystLok/+hkuXW+ZI2t8xpC7liKuSsx+sQGa/mIC6E2dlZArUMyj/IFO
 Vic7WtnzS7PUr5I+EyR4Jj/EnlMIOAvqrUXEUBnzBwYNXcdPfpLKc74oGuLaXsy91AlhfyueNag
 wXcw6tmf2ExFNmzB8QkKh3FQlhwNmuYPt0TOa+xmsjaiOGhqtP+5iahvuQAq83mNwe1zf1UY2rn
 tVqAaMsV/knQga1I7Ut4KKhxtWaLQCT/NyYutJnagPPn7Ez1vPSAkqEebbuvwKdWWns30oRig7h
 a5Y4ycgybvLKRFKn0k6hHDPM2ZOcyIyuoTx0KS0PWWCR/jg5y1Jz05ODeN5sHJ61cqKr8bSmJeS
 dOxeVvxPtDE8+Na+3mYd3NZNYVOH+DgUFidjMqG0G1f0WSTd6yRAH5CjEgORNN4g/wSNNgeKcRk
 dM4gFGIHffItVVYLfr6HZPuSp+eK7LQCvPNU6kbc9WrZlupCGozt8JgvwljcSIo+MnM2ehN3dGr
 HIteZvFVxNBOGtIJoysMRKYQShVVlTDAXrBAuuns53X8O1cCBKUUhzh3h25yJBg3QWAeoOrwe/v
 456r0QTrl+hOYBEji8KtOJJm/6kmpg8lqXzwQqhEjwAf2/7IMqFsbXZ2RvIAJFrmKd37ZB5wmvs zTdOtaBYkfdJpuw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

All Qualcomm SoC Soundwire controllers are version-detectable (even
1.x), however certain unidentified quirks might be potentially needed,
so document v2.1 version used on Qualcomm SM8650 and SM8750 SoCs,
fallbacking to v2.0.

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/soundwire/qcom,soundwire.yaml    | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
index 3591c8c49bfe..95d947fda6a7 100644
--- a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
+++ b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
@@ -15,13 +15,18 @@ description:
 
 properties:
   compatible:
-    enum:
-      - qcom,soundwire-v1.3.0
-      - qcom,soundwire-v1.5.0
-      - qcom,soundwire-v1.5.1
-      - qcom,soundwire-v1.6.0
-      - qcom,soundwire-v1.7.0
-      - qcom,soundwire-v2.0.0
+    oneOf:
+      - enum:
+          - qcom,soundwire-v1.3.0
+          - qcom,soundwire-v1.5.0
+          - qcom,soundwire-v1.5.1
+          - qcom,soundwire-v1.6.0
+          - qcom,soundwire-v1.7.0
+          - qcom,soundwire-v2.0.0
+      - items:
+          - enum:
+              - qcom,soundwire-v2.1.0
+          - const: qcom,soundwire-v2.0.0
 
   reg:
     maxItems: 1
-- 
2.45.2


