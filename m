Return-Path: <linux-arm-msm+bounces-28869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E859556DA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Aug 2024 11:46:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 379E628306A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Aug 2024 09:46:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFA581487C5;
	Sat, 17 Aug 2024 09:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y0QvydZZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B775613B59E
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Aug 2024 09:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723887972; cv=none; b=TFVEXL178ZdTWsplLugB7gDAp3WhvtbvulfZTs0ufzOCWLu5AG1tM3qo3HnJ8dA4E9AS0U5II18ycRbpURmD30M09hXVyx5C5ZgnOLyatjLDE/63bs9iSN6yQ+c2YP6dGPWy5euiIWQD0XHpXeE9ySsQqFfjJuDd94tj6s2yNyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723887972; c=relaxed/simple;
	bh=CWHFcYPRtRY+Qq7QGzuma85hGAjlXR6aFEhWCuiLKXU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ug2TPTBGSuc8U8jhAWChme5Z1wsApGjhz+gdSvlH1DjbgH9vgtAzJdfAyW0Mh94OEhFVmKrAQp+x6O8FdQeLdqgNBNi6CWNq3H0zy24XHJ2MpvgmtIvfZM+YP9VBhcW0FDGZ7qefhJFj+EhQiJcnm7MfyoTfbpObGvs1The3Nko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y0QvydZZ; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2f15dd0b489so38443071fa.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Aug 2024 02:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723887969; x=1724492769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wog6RxrWQdPYSZMlgcH4rB8QP2t+UaAUqZpSk10hqww=;
        b=y0QvydZZyYEJmwRen460TbOhaTGX6Ajqn+cRjUu9IcwMNxirts+7W+XKZVjppPYPL/
         lXQtMtqaGi+FuGZJ0FyM1Y4Q30hMehvxH0Bfi74tOO/Z1Z1RdcGiJDTYb0aPhxuRZfgm
         dThgnP9f3SVrQZRm95mJKjyPCkNKzcQJ0MiWKvfIdf/xJouluGhwQqiWynqfA3OLtyHk
         rGUYbHdMwYbbyU66sXU8wWtCha+WAkP/6FcNKaT6JHV6mfniGrjl6ynqMiq2UO+IkK8L
         EMzPsZ16JGTrNzmtAlCA8tqT68zT9SxkF9iwe0jMIimDycoVRkt6m77WhyJvlS4PYLdk
         VzYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723887969; x=1724492769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wog6RxrWQdPYSZMlgcH4rB8QP2t+UaAUqZpSk10hqww=;
        b=Y45GC63b5pwHw5RWIVutosdyEnZ22DQpCrDpLOCYWCIUuouPy/ZOGB2hVbJm3HOh1p
         9WwJiav87DjG7K7n5a45WsDYxrswaR+0PTn4VaWzEnj/Z7h+SUT0g8clDumLymsy3EP0
         g04fMa4FaI5kphjHhNo2DmDAh6ZbrT/0eYm+wBVzSxRq2C3gRiAzOMaoVha4Xbsog1Oc
         xlL5EdcYInv0+bVXzlodRWW5QIpql7VEw453Fvm0TH1uSuLVkBCBb5JmBJE6iLwPcIOC
         6nd0tjruJp1xjt/dbclffxcutOv0xbw6JdZFxmNfVZgr5UzTwBO+8/2di8lfvdQbZ4r6
         JVeg==
X-Forwarded-Encrypted: i=1; AJvYcCVBZZ0117RcD14mVZuKicx0DeoqLu/slnZVcJRX9lRecovWHBqhwqNOSE74eWwTINg6i6Pg20IrbV50AewZ6SXKt1M68+Fv1dPlinD9Aw==
X-Gm-Message-State: AOJu0YzpH238Dfkql8c3x9a9W9QLXOU5O2+dw6M6je/4jBNXOri82yH4
	hz79g2q2e3E/zGkdbL3A+I6IL1GbF9P4ozUWsBKrYqXuSdS3lAj3Hk9EFij+ppU=
X-Google-Smtp-Source: AGHT+IERuJuUpU+XHOnVB6Mjkl8vgEL7ssVayE3dityP1pBDzL5Rj6MmNxvhvWaQNNpOeGGcTqhoWw==
X-Received: by 2002:a05:6512:3188:b0:52d:259d:bd91 with SMTP id 2adb3069b0e04-5331c6a2764mr3473051e87.18.1723887968567;
        Sat, 17 Aug 2024 02:46:08 -0700 (PDT)
Received: from krzk-bin.. ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded2931asm97641815e9.17.2024.08.17.02.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Aug 2024 02:46:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] dt-bindings: clock: qcom,sc7280-lpasscorecc: order properties to match convention
Date: Sat, 17 Aug 2024 11:46:04 +0200
Message-ID: <20240817094605.27185-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

By convention we expect first "compatible", then "reg" and then rest.
Order properties to match convention and what is in "required:" block.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Taniya Das <quic_tdas@quicinc.com>
---
 .../clock/qcom,sc7280-lpasscorecc.yaml        | 21 ++++++++++---------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
index deee5423d66e..5e6737c39897 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
@@ -18,12 +18,6 @@ description: |
     include/dt-bindings/clock/qcom,lpassaudiocc-sc7280.h
 
 properties:
-  clocks: true
-
-  clock-names: true
-
-  reg: true
-
   compatible:
     enum:
       - qcom,sc7280-lpassaoncc
@@ -31,12 +25,18 @@ properties:
       - qcom,sc7280-lpasscorecc
       - qcom,sc7280-lpasshm
 
-  power-domains:
-    maxItems: 1
+  reg: true
+
+  clocks: true
+
+  clock-names: true
 
   '#clock-cells':
     const: 1
 
+  power-domains:
+    maxItems: 1
+
   '#power-domain-cells':
     const: 1
 
@@ -57,8 +57,6 @@ required:
   - '#clock-cells'
   - '#power-domain-cells'
 
-additionalProperties: false
-
 allOf:
   - if:
       properties:
@@ -125,6 +123,9 @@ allOf:
 
         reg:
           maxItems: 1
+
+additionalProperties: false
+
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
-- 
2.43.0


