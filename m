Return-Path: <linux-arm-msm+bounces-21713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1E38FC57E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 10:10:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5934282724
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 08:10:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58D34191461;
	Wed,  5 Jun 2024 08:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xHbmMJ3D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9C818FDCB
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jun 2024 08:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717575008; cv=none; b=VfjRi+ZzpT+KRp4hqHVdU/lTyFzawGjWymWYaKrAJ897QhGYNTDZBzYQpNWMlsBt+3K9miSQZy4nms1riyfI0LkM48BTfYAsa95JCBfiPpzOvFV2yp/gbzXcVFXgMEpUG/LOcH90Nqz8yTtOevl4BBs2TSDa0B/mcYZOlztaaes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717575008; c=relaxed/simple;
	bh=wpoPYIz7Rrr3GzLq+zakUopF+SJaoNsaOMnUsXqOlZ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ISSOURO9X5NrVcfgMAxKQYckW2o6AulOSwdZFRzyo/LH6GDV9fpFkcT3rz2HpDLQLFhNBrc8EcJ+8jyjer5KxqXjPszBVVOoxmdWbAyMC7gq95xcpmw4rn0llFR/8scs9KmV6Oi5isBp77PFFwrcHMyEOIRVz/jxvtJczih68Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xHbmMJ3D; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42155143cb0so13279245e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jun 2024 01:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717575005; x=1718179805; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r1mDgjmVIUJIo/DIlsBLcvlL2WUeGCqtv4C8WtNuVGM=;
        b=xHbmMJ3DoiD1LgGPyVA2eqQAh6P3i5V7EX1AOaDModdvCVLmur4ZdHwUlg5PjOcK+M
         B1vEBBKuAvMHXcU4ECenKvqkg4m/yHjoaw8C7dIbw5DfOLT1HzzWkOU+yG7d8Qdw7ET8
         WD0jclF1CB8cDM8rqFWmgGe/AwM5wyjhsidHJy+4htVLytGex0ZG4kKDhYTydNiZ4O1A
         itl22VfDaupr+dHY4g7HDSsycaP7vlvqKP4kYd4YrowUafDXWERBw3HXzrfEBSPa6T9D
         0b8i/t97bqYjo+t6/g1TWuY0ytpd4OfXSk8RHO6sOiGU502whOBCPqE+EG2U3JAd5ouO
         sIpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717575005; x=1718179805;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r1mDgjmVIUJIo/DIlsBLcvlL2WUeGCqtv4C8WtNuVGM=;
        b=vFVCYjyHKC2WRCNFjH1WEvA6heJHI+B3A9R3YbBvH8aB28zWcU0GjaVdjQHlSwtfrl
         uW1jABGU1+NMagHg124hbfQ0b2glP7MLEzUcXQpVM2g0IzT7qJH4JFzrxr/0RSKW7NZp
         p8A31xqvznzCLrkokiiYNaVJJz9Nk60dhCzgXE1wl8VOy/C1jrxSJpyaw+Nz/h2IvrTt
         SeGysIK6ma5NvJ+PppFc7gyjelwQrm3BcgsCZWc+QNOEabfQ1j2Hs7PSORNnaJDjrbN6
         hhuf8xUz9+gciVdPmVy7/DE+cNEIxJQ7V6WBSYr0SpMmVdyzvkehJmtlHMlkyMfy+7ET
         Xbvw==
X-Gm-Message-State: AOJu0Yx+8nkoFMiA7t+tte0KKxOcwDJUWAnHobuVQ69AH8nlm/10N+Uj
	j65TioZ6f2aJUDN6sgCaHLQSdrwPuqGme2igO7WKepn+pkKTko4sYVlUWaJmJcU=
X-Google-Smtp-Source: AGHT+IEsW5pPq8yJvKEmEoCIozAGpK3ex0jucIbssbqW/D5fy54g1iquc/I7ovM2FsoQWZ91c1sElw==
X-Received: by 2002:a05:600c:4f8e:b0:421:59b0:f364 with SMTP id 5b1f17b1804b1-42159b0f616mr310115e9.40.1717575004938;
        Wed, 05 Jun 2024 01:10:04 -0700 (PDT)
Received: from [127.0.1.1] ([110.93.11.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421581490e5sm11025585e9.34.2024.06.05.01.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 01:10:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 05 Jun 2024 10:09:30 +0200
Subject: [PATCH v2 03/16] dt-bindings: clock: qcom,dispcc-sc8280xp:
 reference qcom,gcc.yaml
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240605-dt-bindings-qcom-gcc-v2-3-f947b24f1283@linaro.org>
References: <20240605-dt-bindings-qcom-gcc-v2-0-f947b24f1283@linaro.org>
In-Reply-To: <20240605-dt-bindings-qcom-gcc-v2-0-f947b24f1283@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1404;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=wpoPYIz7Rrr3GzLq+zakUopF+SJaoNsaOMnUsXqOlZ8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmYB1KXgKnEXuJ7/bMdcfYRPuV9D+6OlJMJGZKA
 qvZF5/vVQ2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmAdSgAKCRDBN2bmhouD
 15oMD/9Myz+e1PPnBUc0X93EaZxY3fG0mJcN/1zOc4TO3sY2palzy5azV++pP0OpmTj9IzNi0Uz
 D7wzpICdsRIn6lDTQck3Twqw7W+1nEI+DaUSrb9SJiZXVExmPOE3YkxWOA65iPGzB0k+h82RNit
 tCplJVUVVZ7U07cT447S8fIy3xqlWtOOgDyjwtRE/zftxqaDDBrfwcT2TWl4YIFi5f7n+nMAgAY
 BPOmhMlw2N2vaURHWU8D3Fm2pgsFLUiKwHxko/pj5F9/QxkyqVFIDY4dfLo6JbD1SAAi316e4so
 QyQBJ3rEetvyo5NJA+KMj0S7jM64R+EXn4uzCwrU+50hXDoCFbWTYXnswjuliQw1LGhygWAcTOP
 vYlgpGYVMZRrRG6XRhmGzpT+TVwSYtVvGf9ELmDMaaMsGmGWhyJgXZOsYu0fDLpDHOD+gZHaW6V
 jWIv18uk+ZqVoOTTg1z19r8CQeN8bwfmHJOte1/SiuZO24ugv5v9MgFqRPECTgbT4QkYwNazzih
 GwECDoYg0uoybmIepijZkV8CPr11FlGV1AJimm8Nys2xXAcpzEivnEdfPEPVLDiXQSMrrRuQRTX
 AnohIhyYOSRH7rJsrDYksqPGmA2hhpSSNwFEfNC95SS4bpLhX//P7Fezcoe+e0/vOy1Zjo/QEp7
 j8Q8ZJioHz4yWnw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Just like most of Qualcomm clock controllers, we can reference common
qcom,gcc.yaml schema to unify the common parts of the binding.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/clock/qcom,dispcc-sc8280xp.yaml         | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,dispcc-sc8280xp.yaml b/Documentation/devicetree/bindings/clock/qcom,dispcc-sc8280xp.yaml
index 3cb996b2c9d5..ffae037779a1 100644
--- a/Documentation/devicetree/bindings/clock/qcom,dispcc-sc8280xp.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,dispcc-sc8280xp.yaml
@@ -40,31 +40,19 @@ properties:
       - description: DSI 1 PLL byte clock
       - description: DSI 1 PLL DSI clock
 
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
   power-domains:
     items:
       - description: MMCX power domain
 
 required:
   - compatible
-  - reg
   - clocks
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


