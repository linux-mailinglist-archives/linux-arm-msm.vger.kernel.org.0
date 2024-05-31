Return-Path: <linux-arm-msm+bounces-21287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 872EC8D63B1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 15:55:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 040491F2194B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 13:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 246E617E457;
	Fri, 31 May 2024 13:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O2ih0J4G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65ACA17D893
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 13:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717163582; cv=none; b=WWJ8DP0zpJqbWKMXjjnDnNuiyQqbaxCjheHJaKyUQAkIep6I1ANPQvObfVT8ugw9Kr976Tr00mJkEAwyTgOeQ/XfAHdkUUQva855pJ1FY5yh5DmRsbczw4gGV/FRpKnmTqwrxL31LCPRDtREUm+i8TukvPvRI/ZYGgfFJZhUhR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717163582; c=relaxed/simple;
	bh=5BeSec7v1AMmHJLUmsh4VrTtxC8xluSUQXjLGhBn7JY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KnRRcoWthTrEIy+OmDN8R2IbExtC4FW/eT/d6JQP7jH4L0FugkyyYC5ep3eM6OG7NwxxCJo9I1YKZM+jlWIXkqdltH/MiSZ6kMwTFyHLqEYuNtYLtZPfz2YmL85DgelRvH+FoKZUOKj5yiKbipD3H+EBO1pp0Awpy92YGcDeq+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O2ih0J4G; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-421338c4c3bso1594655e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 06:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717163579; x=1717768379; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Kp3FlZL3vpl8RQdH6FMVgYMrc5D3pZNNwarcB18kV8=;
        b=O2ih0J4G16T1ztqKxegE/b4l8S6cRI0NANM66Hfu4i1+tmfA+509QNuzCiLK768eKp
         KwsPIFestU5g8vfpy6zzl8gT0yZPSUGrdJTCIj9u8EeptVfwdVhyHKKQ/Dg2snmDYFRX
         Ml2g7nAQFe/16uGIwByjlkXcKYUrb04v4TbOixWjLB+taNf38hdA1tMzpIjrt4dTleQA
         H8QVBU2s91sYN9QRSVE5My4ayreC4QWuXz/7rNOizYibxTPnPEvSGM80JY7auvMXul5L
         nPxZTbDlrvjNVXWEGIMObHPkO4NxdppPPWGbQlqZ3kNSC5YPRGrj+l6S9ZwmbzDdilDD
         huRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717163579; x=1717768379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Kp3FlZL3vpl8RQdH6FMVgYMrc5D3pZNNwarcB18kV8=;
        b=oIc6dIirwGdTkBCY0VCzxEe0DMAf1dZ567mGertTkQAdG6hONIsWFIcPKAlVzbS/JB
         ncG/KA9/cj2FtImcE8Pf2i9MfV0v625lDSEEQ20Q1liS8VQ65THR76/BRY2I7pobjD/a
         Ce/ObeLe2mnU9dO+o2QZoOS2AUKouUAtTqmaEk4MuNroXVBSb74ka+rDYh/KHQNHrW1v
         ounbiuukyaquWn+qWb37LKlVgpcM8OReDk3PftRAfebQGnASfYxCPeNCjhB1NkkD6U+v
         meWffbI0jtqCi/HCQUpUH9G3NxT5vC5L3i+GBJ16I9PMAWT0Ivdt9TIf8N8t/B2BmsNY
         0n5A==
X-Gm-Message-State: AOJu0YwBtqYTgzHCqPrSrx9/AfCykOTV7RqWFnN45b5sPxzr1yOx35Q+
	AesT0bfSvm9VxQ/hW4bBVxLafBwFI/tJQBMRyJk8RQDCRZjLHvGgqQp1rBHMw+s=
X-Google-Smtp-Source: AGHT+IFhbxFrTxcXw01ChCjyphZ7CDGcjK1s33QeGmXcDWQv/pSQHjDZTPJf2ilHOsyhzJmx6hxlyg==
X-Received: by 2002:a05:600c:4eca:b0:41b:ca45:8263 with SMTP id 5b1f17b1804b1-4212e049f20mr17762725e9.12.1717163578888;
        Fri, 31 May 2024 06:52:58 -0700 (PDT)
Received: from [127.0.1.1] ([110.93.11.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4212b85ec87sm26762735e9.27.2024.05.31.06.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 06:52:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 31 May 2024 15:52:27 +0200
Subject: [PATCH 09/16] dt-bindings: clock: qcom,qcm2290-dispcc: reference
 qcom,gcc.yaml
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240531-dt-bindings-qcom-gcc-v1-9-b37d49fe1421@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1308;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=5BeSec7v1AMmHJLUmsh4VrTtxC8xluSUQXjLGhBn7JY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmWdYeyye6EFnWtGQHltgbK1S1pyh5H6awgyeEc
 cP+6jo9QTKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZlnWHgAKCRDBN2bmhouD
 1+yGEACFz3LEw79i465InaFZ8RCwsxuKDhiIVtZRdfL1T6ZqTbw+Nx5+p5DdN2+d1KVMsJXm2Ld
 5vlF0YrK2dWrCbPLtgqCtXUbryj608qcPWHVIru3Mlektbj7OadMWLzyBAXsZl/kxasX4nii6mM
 c9uQLw+H3pyjbSVlZznhAu3kVhwHpJPSTt9bX4w2QI4gQZvb7W505WHG4fXwD4movcwL1d0fRur
 mRJhBit3tzc0stQ4Fp6AN9bl4vLn0PlTgWiedSjlKZlYZ22y6oGoYqSP/769TYLmJfHr2zwe8nQ
 IOwvLcNS/DM/nlliFJFIgnRbGtIpFI8x2C7Gd2KD13p60uSOjREJj7uXwkFKFU9+X3Qjdw06zPh
 NJZ79R3voXuyP38zGwO7cxthm88ofpshAvKwuoBv1E41m1ZM2SLJlUa1thjUBbSbOuAkP+F06Ym
 XOvy71Rg7VSUlCWYm5MbECpb4YNIcV3hpijo4JhYatTQIkPQIIoRSxzTEAvn3SkDstfDkIAjjD1
 Q5SSKtgXYQF3yKkEK1z2nrbBIXuRmPiQflAPjiRnsABZVqtBWia3mFvJJ9KJCnemZSZn3raIvUN
 eVUexsjvRaa1ZIjv3+9Mrf8B5c/uCApOGkj23hxF17FrcnZL44J6frWZSPUGJ/uloBF5yRm09IJ
 oX7y7eXanpTzA/w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Just like most of clock controllers, the QCM2290 Display clock
controller is also some variant of standard Qualcomm GCC, so reference
common qcom,gcc.yaml schema to simplify the binding and unify it with
others.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/clock/qcom,qcm2290-dispcc.yaml          | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
index 4a00f2d41684..243be4f76db3 100644
--- a/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
@@ -37,28 +37,16 @@ properties:
       - const: dsi0_phy_pll_out_byteclk
       - const: dsi0_phy_pll_out_dsiclk
 
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


