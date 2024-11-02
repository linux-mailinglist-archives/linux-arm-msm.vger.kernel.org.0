Return-Path: <linux-arm-msm+bounces-36813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A99A9B9C68
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Nov 2024 04:03:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE131282910
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Nov 2024 03:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D647B147C79;
	Sat,  2 Nov 2024 03:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aNr6Qz2U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E5542070
	for <linux-arm-msm@vger.kernel.org>; Sat,  2 Nov 2024 03:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730516603; cv=none; b=PI86aEEe5Wm1rY/+hAQ7ROtzVVZkEy/Mz60sICYzLkXfs5ToneO9czdHZDIP5NjQ45EIB/iQhUGgQrQFgDqDHKL02F16yGLrX/NAXxu91VV8DG6RVYWi/razvLtLRV/Trq8NZdVS0IpqQrMXeYHo+pqbE8VOuJ/jXoZFM5VO/xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730516603; c=relaxed/simple;
	bh=cQ3VcEbVzocO5eKw8VAg2gdoyPjTPsJjrnDKZrMqr4Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GfAXCk6wV9ZEIX2V+rv5RoZS/lhoKI67Hi54wx5IofTyci7m6b5KNTN6cvxcCbiWoNE8uUlB7LA7T6k/1zcZPoRLQPIkV5SBStMgGSd6sIjSSE3JiFY4FOZVR7CDEaVgh6xGfLc2FMfwgSNIALUT6NfE8OYuMxLe8rzD5Oimk9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aNr6Qz2U; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2fb5111747cso25042441fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Nov 2024 20:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730516599; x=1731121399; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3lc4zrZolV1hIE0NyC0MJMZkGvYZ5ZGDsBfgydMLo8w=;
        b=aNr6Qz2U+X8+5Qtba1BjMui77PLjTJD7q9uzyeH30LOeSa1X7XGjXQr/O+KELZmgU9
         w/9ZRk5fYfu7uT6BtRkgVRlOHbd/pEI0tizAgFiqeARcpVWQ1eI+ZtkiZm0oBr1go90T
         5hZqpQ48BAKi3F8nqcFIm5Xqs7Zskxbo4lsgaRr14HoImnI0HABIMlKV6YnmJB+QKWoT
         r3ND2U1N/HbnkdFAnCfOHxpe95hcUMjfWU23O6Tn2lNsUftzXSSBwws2rmu1WOl1Tgyr
         gFvuPHcOmmwdLhDz9ErjXBeQjBQHmrobv7o4jj68EFdBb1o/c2ChGSaik06E1ePKSan+
         toFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730516599; x=1731121399;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3lc4zrZolV1hIE0NyC0MJMZkGvYZ5ZGDsBfgydMLo8w=;
        b=kDI8zW6cEFcEjBIr/vU6YJINpRD4QVdkq/QTDWT+TgtwzTH9qi0EDw5cF88pSlDNiH
         MYsX8RjzwGRzC4HdAsRIltXo7MVaRobGR1uPUBFzO+svtX0SXVbhjWuSOd3/8mhhMkdH
         V9k3b9rGKnA8NSc18UhorhZ72jyzK8NmTay4fVmIMdH3KIPRAecLHHloll9cbW1TtRJl
         gksO4pZSINAI4VqmiteN2BAb7lvfc4RRrgi0StLq4SszNo9KGxkC6PmMHkkkAk9DL1E7
         1ckVyQeTmvlihGEkjjB3eQK0kHcIC9pvFt4DJkpw7Svzd+Wv89f26kJFF+SbhvjGlwuC
         rWQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoQ3ogHQoQwttljgrgI82dfBC2QPgNjbU1JYPezXn/WAbf+dUnef8wO0dwoEOVvVtti8ZmUgD7ku7+G9Cb@vger.kernel.org
X-Gm-Message-State: AOJu0YyqhoXiXgwxx+0z0I4G/iMcqW/Kle6d1RVh3xBBh/DEzBnq+/cE
	yqsdpNuHVR/ulZ3eOO6FOmV2wNONdAQxTrcCzP7PeEShZq0fKRHttuYyB7B8Q8E=
X-Google-Smtp-Source: AGHT+IH5sNpEjarLeVfFtgk/Qk85kdxNnR7nFXcKkBOWY3SqI2oqPh5Mdehimcd4CX+jcci35+kaUA==
X-Received: by 2002:a05:651c:2114:b0:2fb:5688:55c0 with SMTP id 38308e7fff4ca-2fdecc31502mr47749521fa.38.1730516598893;
        Fri, 01 Nov 2024 20:03:18 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fdef8a6070sm7455811fa.89.2024.11.01.20.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 20:03:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 02 Nov 2024 05:03:12 +0200
Subject: [PATCH v4 1/3] dt-bindings: arm: qcom: add QAR2130P board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241102-sar2130p-dt-v4-1-60b7220fd0dd@linaro.org>
References: <20241102-sar2130p-dt-v4-0-60b7220fd0dd@linaro.org>
In-Reply-To: <20241102-sar2130p-dt-v4-0-60b7220fd0dd@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Kurapati <quic_kriskura@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2500;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=cQ3VcEbVzocO5eKw8VAg2gdoyPjTPsJjrnDKZrMqr4Q=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnJZZxlgfZWVVapUO7CFbkVJjVbdLAAsn8nDCzf
 5WXCL0PDvSJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZyWWcQAKCRAU23LtvoBl
 uMsOD/92gxjdRxlmrKPhtNurmyfa598qRmWEDrTbwcF6N/3AQ3vI/K/dQ++creyqai8xbZ/wlu2
 nWABQ3T3RY0fnKEXN2twVFcz/COb4tb1cEbLvnDi9jLRK+ZqnJn/yMLnYUsQ9iSYZJUftTyutw3
 k7fVHLWpr+w4ASsytOS3un/71dzrNDYzMVCOmlX8BnODRpFPacyq2zisOBZtq7ork5VCQgub8kn
 QdZC/0sAt4cscP2zRtbZbjSQb363nmeM6CaxPzy1sSohgifSVwtfQIMAVDNRDMLa++/VkpjZLAW
 LtqkVvGAtNRVTaIFelIqkW/9Y2lI7+SCxXN1yrqfV5FGnTV/oKxWQZ7lhp6OSwb/3v5o1SqkmdZ
 CeLut+z2ivEbRa3MTcH074OXa5g2kA6xV8KPZQjMNk3Jk206NXFD9C44zSGPBl2EDaIoNixBOwO
 NkQpSfpuR0bJu2YDwMLSEO2BHSxnXJWNUlKPARQ+9xF8SPmjSedPChQSNS8GlDLycw2azOtVyAV
 qicEH2tIrJvAincuiKEQDnLss897j/2gOodNnA/s3Hl9KKeIsz7MIZsEu9XTkYnHq9AOmDb9dgW
 emUkKBvQzkTS8vhQb3O+G6BEeLBBsWQVbGuESPzPbfDf4+BtHNIGh9aD3HFmt0JDItZ59UTrKMo
 tr7+3ns0uyWYwOg==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add the Qualcomm QAR2130P development board using the Qualcomm AR2 Gen1
aka SAR2130P platform.

The qcom-soc.yaml chunks use explicit 'sa|sar' instead of just 'sar?' to
be more obvious for reviewers and to ease future extensions. Overuse of
the regular expressions can easily end up with the hard-to-read and
modify schema.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom-soc.yaml | 3 ++-
 Documentation/devicetree/bindings/arm/qcom.yaml     | 7 +++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
index d0751a572af39eecbbd2f8323a6c3c94b3fdeeac..2ea6d3f65478157a1a373a8d1fdf35497f30e7c3 100644
--- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
@@ -23,7 +23,7 @@ description: |
 select:
   properties:
     compatible:
-      pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1e)[0-9]+.*$"
+      pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|x1e)[0-9]+.*$"
   required:
     - compatible
 
@@ -32,6 +32,7 @@ properties:
     oneOf:
       # Preferred naming style for compatibles of SoC components:
       - pattern: "^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1e)[0-9]+(pro)?-.*$"
+      - pattern: "^qcom,sar[0-9]+[a-z]?-.*$"
       - pattern: "^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$"
 
       # Legacy namings - variations of existing patterns/compatibles are OK,
diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 0f18cb35c774aec48967eddbef4b4480dbc8edbe..02b2379ccf7741a0fba345d83d0ce7db731a3772 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -52,6 +52,7 @@ description: |
         sa8155p
         sa8540p
         sa8775p
+        sar2130p
         sc7180
         sc7280
         sc8180x
@@ -407,6 +408,12 @@ properties:
               - qcom,qru1000-idp
           - const: qcom,qru1000
 
+      - description: Qualcomm AR2 Gen1 platform
+        items:
+          - enum:
+              - qcom,qar2130p
+          - const: qcom,sar2130p
+
       - items:
           - enum:
               - acer,aspire1

-- 
2.39.5


