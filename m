Return-Path: <linux-arm-msm+bounces-20946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F048D39B1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 16:47:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7E689B24B28
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 14:47:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83E4817F376;
	Wed, 29 May 2024 14:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sXlC1aid"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F46216A379
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 May 2024 14:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716994029; cv=none; b=L3SM0VXd2+uUXY/tHEaZ9CzRfTm820f8vZAb84xmK2rgs4RMaJqYv7zmclcQlNUgl8PC9CxXEn6Gk/lryEyD7YI/6WYf3y5SasNMMGN1ZRvcOqUStOie5zK56jqI+zrxbqpjwPzx7yzPKHBDogGYIS0Mp0e6TE05Go55mC1qKpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716994029; c=relaxed/simple;
	bh=TIUEEL0zWVDZXHy4dYjykNO8VTxvqnQRk1eUuik+L54=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QX6gOmFH0t9ByOXvm05LsSJL5tfCKXA/OguaLpnNVWzV05RX3Crt0Rv+yNh3fcdMPzQr9Wjv+tRet0Q6Sy/Zzo9Bb/iRu3GWiajBUBR2As1KMUhAyrSxfThasBkkRIpbnFmfMbBXqtnoso+yyj57ZbO8eeWz2eZpAtFlv30aVRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sXlC1aid; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2e724bc46bfso23772291fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 May 2024 07:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716994025; x=1717598825; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/quN7i5JwAFNFz24vQKdgeyQcj221jNzz5gL0pGS6+E=;
        b=sXlC1aidW3ae/IDXr9BuXRZkU/GTeDJoHJ0FISA0p5Dz2cGQ7XArrtLlJdNmu0PGtK
         rh0q5UE+henfOf4xnbtzyeTMCMKpmw3qyYqMOWsiLO75w5R69tZEXPQF0MCA0+YyPZvb
         44c73hWiH95yxxf498d/IJ83LVh9jt2V//Om+j1S3s8VKONptc2BOdfaaw+kI+a0muM5
         tdloDTeSBfzik5i+K4tx2YI0DgAla9K50ypUzhOADOzHf35WQ7v/yW/TXJDdgmWQteER
         J3ZxpgQyBsyM0fUsgz0kCDSIvZDc4sd+tbAc3xrluxcbquD3a+gEaKOu5dd0UYJ6lPmL
         f2pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716994025; x=1717598825;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/quN7i5JwAFNFz24vQKdgeyQcj221jNzz5gL0pGS6+E=;
        b=L2C6xYEUXZSIp3+CnNg/GzhWXcPJGx6A64nVbMBSEL0jmKsKbnqP5PoynSvJlxnZv4
         /Dp3Yyp8kfyQwyyagpuANlnRGDd+MGhZa6ncte7q4QP+mAhj/TOcyYzYJlPcYNEqGDgN
         hxndqcOvNIItxhKjItFDpWxakpip0Fh3Pg+SB37j/P8RA58fYz1JIdRIXLdnGQIsRbT0
         0SQJmaWib9scHpDbnpitqp/YPhcS6KuAZlzwWiHg7sKek+P7cma+YaFXPYdIUwDKC6e3
         7ervcsfJVnC8JRtIO73DwI4nigsGKujy0i5QVYa+F9Kg4FGoI4Gc94jPOS72bxq0xF2C
         R+aw==
X-Gm-Message-State: AOJu0YzIujFhRj9mFzWoIHwkQZl7DKJT2vRGKDX2Ic1Kcc4Bk1p4p9YM
	aRAGL712l99klhOLL1rHiPqfbb9Km6DGrro0NKlXDzN3i1e35k0rnhWj4z2VsVs=
X-Google-Smtp-Source: AGHT+IFzyXnvMEccVyQXAQkd00PNj4In0S6yHUBxLi5sKQS4f2VGKoHWSEkTSPWFgHqATdDQM2+xMA==
X-Received: by 2002:a2e:9c05:0:b0:2ea:8143:6880 with SMTP id 38308e7fff4ca-2ea8143690amr2792061fa.22.1716994025375;
        Wed, 29 May 2024 07:47:05 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e98c45df0csm3791951fa.68.2024.05.29.07.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 07:47:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 29 May 2024 17:47:01 +0300
Subject: [PATCH v2 03/14] dt-bindings: clock: add schema for
 qcom,gcc-mdm9615
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240529-qcom-gdscs-v2-3-69c63d0ae1e7@linaro.org>
References: <20240529-qcom-gdscs-v2-0-69c63d0ae1e7@linaro.org>
In-Reply-To: <20240529-qcom-gdscs-v2-0-69c63d0ae1e7@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Robert Marko <robimarko@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1680;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=TIUEEL0zWVDZXHy4dYjykNO8VTxvqnQRk1eUuik+L54=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1q4/ZMLtvzBFvqxb/2+TtnNnrfL5UzBKSPbmc8PJrocL
 2Gduqy3k9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQATCS5n/x+/4YKj/qY0V+7N
 jhdurQ/ZeOn/gnO69bXKs7dLKf0OrI7qP+ovVTLjluWlRTZzP4XHFyzOu2/y5nmrx7LjJe6TxQ+
 d3f9u3bS+Vb4LEnrlSrN2Re45Ka3p/XxH05XcHVtkG+viVGMWcjg/KPCLtXO/2KsvV3xEy7L7at
 EeKx6Ryn/3Tm8S8lhebhHycu6SGENZNbtKZWXmrk3B4b6m96YUnXWZtnyzBxOPlXS709f6Dd9Y7
 OevFvBJFrq0jftHOLPVG/WHQn8jphjVfWc9n/m6S1PtrJ5KjRsn0+GWF9tPHRXcfqLskrimsK+4
 5jLFFKme+8pLvVQyNOM1XiS8qigpjfXu2Zk7ZWIc54dzAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add schema for the Global Clock Controller (GCC) present on the Qualcomm
MDM9615 platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/clock/qcom,gcc-mdm9615.yaml           | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9615.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9615.yaml
new file mode 100644
index 000000000000..418dea31eb62
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9615.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,gcc-mdm9615.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Global Clock & Reset Controller
+
+maintainers:
+  - Stephen Boyd <sboyd@kernel.org>
+  - Taniya Das <quic_tdas@quicinc.com>
+
+description: |
+  Qualcomm global clock control module provides the clocks, resets and power
+  domains.
+
+  See also::
+    include/dt-bindings/clock/qcom,gcc-mdm9615.h
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+properties:
+  compatible:
+    enum:
+      - qcom,gcc-mdm9615
+
+  clocks:
+    items:
+      - description: CXO clock
+      - description: PLL4 from LLC
+
+  '#power-domain-cells': false
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    clock-controller@900000 {
+      compatible = "qcom,gcc-mdm9615";
+      reg = <0x900000 0x4000>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      clocks = <&cxo_board>,
+               <&lcc_pll4>;
+    };
+...

-- 
2.39.2


