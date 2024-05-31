Return-Path: <linux-arm-msm+bounces-21285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C39F78D63A9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 15:55:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D7A4DB2AFB0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 13:55:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 217E617D34F;
	Fri, 31 May 2024 13:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wVf3OcQU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A41C17C9ED
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 13:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717163578; cv=none; b=hexUX12NwbUqrER35yHeyrEpo8hFEJw9VLDq0NoTnL7axEM3hAgBRekNZs0g6JmxKez9ptR9As5DFrCp82d4/zKvcpbIYu3+/OFD/VlajRUcmjiYiUNwlonJ5GcV1LtZtuXgyB3wtm2rUvrYH7YJs4UKl1Ff6vVZb7qntm9xYKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717163578; c=relaxed/simple;
	bh=Vfvm+u4fvg+iw8i2GnUcIDJyAUHsHEkvgi7QuRpdSjI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pv+Abc47YBfmcPyi4P+stI4oC+y6Ma3H6K1ee2/OD7cAt3SjzyNvFh8ooMhXVScUbkJmHAwJFc2Y+vhaPiskgqy/MbY4N8umW7yR4iP9k63yIZdKQEgtBgYHMBAV6z2aPOKo0WcOtzF5XeL6Q5R60Y4gMOmAI7YWMzvW9EhPZGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wVf3OcQU; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2e6f2534e41so13044861fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 06:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717163574; x=1717768374; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8n/jTL+LmHdAYlGgXlxxyFJOJwKdK3jauSwSYZvCZqE=;
        b=wVf3OcQUYRE+TRnQchCx7ETaRiUtSNU9TjxiS4YtiD9+OD5NCvP0c6UjIE9/6kuF2+
         4tgvOODoXhIKRit7LGjm1AFtdLWhUX/4NTTNkZG4IumkigTXGOrtnseQ9VHCy2/Ueyfh
         5agAU59mfOdNN11x5/06LlnNdWjiItTzMRWqAUb737gGEbjf1kIdYpL2VBmiDsG23uCE
         aZu0Zf++mJ5U9uTfvMJ+R0PTDFq2xLsn+1liwapX86fZHDRjydb++tFhnS1NvvGzMNF+
         I6G0G9uzZeB0nD0yX1aCe3mxDTU2gGsQobJeCiv8YWrvEx3NzR2U7WlX3jU5BMWSV/fP
         q5/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717163574; x=1717768374;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8n/jTL+LmHdAYlGgXlxxyFJOJwKdK3jauSwSYZvCZqE=;
        b=XxE1oQijXXGxw5bVPkqS4RKWLJT04XFI1mVoiCytI6ymTSCHOWGAr4Le3x4vGB8ecj
         xFLAJh+u5XV4AX/XM59P3UCe78g5fcTXE1mO8F+Itnv8XnQeDVpoEgOq/lczPgBW5Ytc
         KGwCwhxLjHDhcYDoRh40FSsBJqmPV5xw6JNWserAAYRD40Er34pu5CkSIHvBRbqkH75M
         M3Qxk/UnAFEaWtg6QbowkPDzxy+rYxWkKaKLkWooMd8lnhxCebdYahhz3MKgryzBvm9G
         oYY7rtC9dajk/DBP7eohVJejj3N69eleErZn5lZBlhcJGltbH0v91N3gU6OGyxC2xPGD
         MZRQ==
X-Gm-Message-State: AOJu0Yw8NRxrjD8Es3Jvxet615Z6smTJF57qNFA8Q49hqNwaFUDDVSsv
	CglU6M4ANTJNOGmT8EPWxfLVJ9R3L8KJDGMyVJsWYfdiNdmL0T43a0S1huIqApI=
X-Google-Smtp-Source: AGHT+IFWLW3O/JdqTmbPA3g3aW6gRBJrnE7c5Iv8Xr9ShVYjF3EAZktdHQLo5Pq/+gYNIjfbHCwlog==
X-Received: by 2002:a05:651c:14c:b0:2ea:8125:604 with SMTP id 38308e7fff4ca-2ea950af013mr14357891fa.4.1717163574563;
        Fri, 31 May 2024 06:52:54 -0700 (PDT)
Received: from [127.0.1.1] ([110.93.11.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4212b85ec87sm26762735e9.27.2024.05.31.06.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 06:52:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 31 May 2024 15:52:25 +0200
Subject: [PATCH 07/16] dt-bindings: clock: qcom,gpucc: reference
 qcom,gcc.yaml
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240531-dt-bindings-qcom-gcc-v1-7-b37d49fe1421@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1425;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Vfvm+u4fvg+iw8i2GnUcIDJyAUHsHEkvgi7QuRpdSjI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmWdYcOIMbR1GOog8+d9B+GKxE1eUuatlyl6Nbm
 PJgaEL3R5+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZlnWHAAKCRDBN2bmhouD
 1x8OD/4ydcEWWBvDYBh5NQigqFRUX3wKeSwjmVij9WJm0TmBXNusA9xbLXZUJ/kcq92kj7smF3Q
 H7Sq4vujrzOicY2UwygNYs4RCjieZqWgkN5pRe6nXKRa3jKADVM/Epb5CGfe0IFlD7yS5VquBRY
 sVBTtxLdnifwOOeqd/Vgd5YpLdWv7+Z6CTIxLU+OwL5QpQNTAif2jmAefxKGJyNd8X0rA7kN72F
 3Tv/p7mn3J63LpInmoYaa7uKbT/yhnWJisP2frrnCmVt2yFLcav8YYZYPoU+DcPE6y8bqpwCuVY
 lm3crh+0JdrJYTvZhY5LK0C7o8SgIaLuGCKhV08wTlP8MStlp1y/quvFi6jCt2Lfxj6JeXnEXuK
 +PNwMzQecFokEA+GjhZ8pN+etDhdG9X+3/8jlaUXMx+U348aDHRBd6rSgMspW088jVYbcnOzr5K
 dhEYIvQIxXEe4vp9rRUAAnZ1AKVpA+srSP//BNGHKBkouFg5/in5nzXKx7nPX/5+khumdt8nRzW
 axBBeRFU5szkq8XmtLZ4y/N3xRIOUgrkk5mYugMuejlKPEXU/w/2khJl0+K6bWdnOVE1mfJ2/QB
 cX/8T0tn4vleW3LClxbsXJBeBfpDzT6a17Ixj4PUfg40uIZd/y2dwmVfW7PUpGGDzZ/1CwKPSNU
 N0kaosUF6py2Jsw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Just like most of clock controllers, the SDM845, SM8150 and other GPU
clock controllers are also some variant of standard Qualcomm GCC, so
reference common qcom,gcc.yaml schema to simplify the binding and unify
it with others.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/clock/qcom,gpucc.yaml        | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
index f57aceddac6b..0858fd635282 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
@@ -56,25 +56,10 @@ properties:
   vdd-gfx-supply:
     description: Regulator supply for the VDD_GFX pads
 
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
 
 # Require that power-domains and vdd-gfx-supply are not both present
@@ -83,7 +68,10 @@ not:
     - power-domains
     - vdd-gfx-supply
 
-additionalProperties: false
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0


