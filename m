Return-Path: <linux-arm-msm+bounces-21286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 777B88D63AE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 15:55:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DB0D28EB5C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 13:55:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 693DA17DE1D;
	Fri, 31 May 2024 13:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qpukVY+0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28D917D35F
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 13:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717163581; cv=none; b=Ky0J9l9T6tso2xFuhet7lMzNzDN7Trx0lvG1EaHz/Jlrdogn44pLOSsQ8GqLKLyv4TF5nkc0fY1SohRhZJC/XCm923ayUP0+TglWXfld/5+Abjiu1KsW9PiXtyPt8PoZl90Ft6z6JPZfujfK60+8insZA16qoN7OcZrsEhycrro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717163581; c=relaxed/simple;
	bh=1azua4kGeU/+HHhN4dSXelf6hIt41nJJA8JGWRnUTaE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RmriIZGohf11xo6sx3lXmqYF29Pl1+kCQ2j6BFmqNQYgDzrUvB2kP9zbQkGEo2eJa5KrIoLxmaQbQX8Yavr7x0y8c74o1j3TEmEte1scja0R9a9kiFZ9Zn9l8R/D8L31kOlVBx4Rhm5AEqHYf/6iVYrSsDzFviYxuqCuM3SLgZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qpukVY+0; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42125bfa28fso26319345e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 06:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717163577; x=1717768377; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xxm8Vxw4tCw0GlQ/dnU6gG3Z/463+BJOjiGsiCHJ0EM=;
        b=qpukVY+0h/ngRyFUeefD/63hQLm0gXLedLI5cCNbMqz2zCirjckrlIMI+x8mORTOYM
         UA6clFYiJOjuYfpzoAsrySqIOolaY5VIfLvnFSUfsIJ0K/DgQIg0WK3xXNkyjV88fGpM
         WmTFBJ2pRtUYinx1cpF8F7yiazcvbswgDSZBUw3P9ddgx3WDhWsuglX62/R28D6Rz8Qw
         LSSj6EPxXsit8MzxWiFVFFtYjuPvV9GB5lZuPmUy4FGr2d6FcCEbRgXl6hlaHzU+zsTX
         7OxvfMzrNECPSKPUmH31OIpL8iwIJLWpfbFSd47z9qKLA7UJJIcpcAW+iJyJi9UQ5ohb
         Jzxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717163577; x=1717768377;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xxm8Vxw4tCw0GlQ/dnU6gG3Z/463+BJOjiGsiCHJ0EM=;
        b=AJbds9+ZGrYJ3KThb/ImjLyxC004gLUP13DQhfSc+dJ4y4uz15aVsY3lw852PCItRF
         KwvB3y32GUmZAP3wfQMoqHSIyf+WkGeY+TiN6NRTmUIftozK/JahHrGWHc+Zf//XZy14
         kE3hjl4vMbR6gw7pFljc1eYERNK8Kt6BMJaUG8NG5i5mg008DWvtcNT3Xqn+l2GrPyKv
         Taf7keREMRVmfarmStDqzj/U5FhNc86IE2BgrTJPGm//ezVYjB2iIqce0uWONikGUfPv
         KmJHx7N2XwM6/1nzgpm5ZQeP+sANZlFDkRMVfcTA0iAzg/f061vsppjFAhKKHMqFx9fP
         67ZQ==
X-Gm-Message-State: AOJu0Yy/Rs2NVXWsLU2dTXPf5doxpvUX4KqZb/dd+Y+F0Fw+RPSSXYNq
	bdF5CTeaoXp1EDE0ng8/d66lCrKyQxvGY0/yUgWMzbefaijlhvEi8fp6oPJKzq8=
X-Google-Smtp-Source: AGHT+IFgb2o74CXzT1MtmrfykQ4/i2AJtVMDX71IdlMTBxLIaNCfPr5sFGhsNdLtRdZVJpyFNWx/TQ==
X-Received: by 2002:a05:600c:45d2:b0:421:2429:7e46 with SMTP id 5b1f17b1804b1-4212e05019amr23247655e9.13.1717163577078;
        Fri, 31 May 2024 06:52:57 -0700 (PDT)
Received: from [127.0.1.1] ([110.93.11.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4212b85ec87sm26762735e9.27.2024.05.31.06.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 06:52:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 31 May 2024 15:52:26 +0200
Subject: [PATCH 08/16] dt-bindings: clock: qcom,msm8998-gpucc: reference
 qcom,gcc.yaml
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240531-dt-bindings-qcom-gcc-v1-8-b37d49fe1421@linaro.org>
References: <20240531-dt-bindings-qcom-gcc-v1-0-b37d49fe1421@linaro.org>
In-Reply-To: <20240531-dt-bindings-qcom-gcc-v1-0-b37d49fe1421@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Jonathan Marek <jonathan@marek.ca>, 
 Del Regno <angelogioacchino.delregno@somainline.org>, 
 Loic Poulain <loic.poulain@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1259;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=1azua4kGeU/+HHhN4dSXelf6hIt41nJJA8JGWRnUTaE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmWdYdbnMgN/4r+s7a4Sac4o6T0Q5FeMFok7xY8
 jViacz3ZKyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZlnWHQAKCRDBN2bmhouD
 14xpD/wKCL6CwRsu9pWHrxGxZPNiR+RbdKu6ovyWSsMPZ2tWQnfR8Riwa+UaKE16axuuFFbyPPs
 VNoHCpoRzvKexZI4C+ZArBt3gmLiP8PkvygYUt80NH4P10GFy7/8lEEUnChsltxztnUQvqv+t6s
 y5xaYYGyfnEglAF2rDdlopEmH+dmTqIHn5KxZPIWKcz0LCbV24Xchpys9KA7C7MdXps0nAaqseZ
 YBYwVYLlTI6+TKAy38xRIOhbYdwEcjsrs1G7BX4isPCtiFk/+yXxMaDFYhBwlVrr0VY5z0JxfSv
 c8KQ/wjFtx7y4PFox+/UjaKOuIeOd8GZhswjeUcAn3tlttUoE7DYdxbqWIGEKIL91yT4a5uNAJZ
 jZpV8W1qk8AahrgIUj13wjBcNrKM55h1ffmwjcZsumDei+Kqkik/pxL5WRezIoALzbQ9amXOhqd
 ifD802TQYHtRQrQkRsyF84798+u7zKNT26tL0LUU2mwNZSiTPMijKPWOholYARr62RHA8TcjD4I
 OEg6FcNuNCkwVqEx4rG9TZeAL0W+YTkdPPA88Z89EWpGPVdA8mHbpT1LEUMs/SlHe2/VO2aVHy+
 JRbbStDSbaPtwwgIiQNwzCFVuQT6taEEyVUUI7d9VuOrxfOG+YSGw70o3LfXJteYVo4VqzUKKNi
 7XtTTTwKv4gtK+A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Just like most of clock controllers, the MSM8998 GPU clock controller is
also some variant of standard Qualcomm GCC, so reference common
qcom,gcc.yaml schema to simplify the binding and unify it with others.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/clock/qcom,msm8998-gpucc.yaml           | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,msm8998-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,msm8998-gpucc.yaml
index 7b271ae210a3..b9b218ef9b68 100644
--- a/Documentation/devicetree/bindings/clock/qcom,msm8998-gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,msm8998-gpucc.yaml
@@ -29,28 +29,16 @@ properties:
       - const: xo
       - const: gpll0
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
-  reg:
-    maxItems: 1
-
 required:
   - compatible
-  - reg
   - clocks
   - clock-names
-  - '#clock-cells'
-  - '#reset-cells'
   - '#power-domain-cells'
 
-additionalProperties: false
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0


