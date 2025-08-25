Return-Path: <linux-arm-msm+bounces-70784-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9A5B34F60
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 00:58:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F4315E60E6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 22:57:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 081452C028F;
	Mon, 25 Aug 2025 22:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HUxXQ1Ce"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D6E5661
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 22:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756162641; cv=none; b=oWlEbKyfbZV8n6bcgDKWKpEHIqA2l+ZaGAYVp3A8xygwhQt3M72eCq6koSa2uIsJ1KdCMK1qBN88zvJrt5sFQz5SbJeTIjscatU5yuINMHJCtn/8oKW4EsDxBFZVEWH4iAChDyKLqVr8JUb86Gns3gms9tUbG64fHgM++MRnPKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756162641; c=relaxed/simple;
	bh=n+eq93EFZerFCaRW/YU5rAe56h3L7pAing8rZOS9aIo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a2G2U+2hTzpiMc/xWbhV79vhSLE28muJ816WI7PhjEGd20kHzZEDKwRVq8m5SLTJAcje+l2QRGgjjVuIFiFsT4fOnF6Y23zpyrLt2I40/iK2KaA+JvLNQ0OJ01puMQbwsRrsLAPy8U1g5inIQva/wn6uxZ7umaBaQvxLusO4I70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HUxXQ1Ce; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-76e6cbb991aso4287178b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 15:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1756162640; x=1756767440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k5YulMZOBNM7qvzrKYRTd+kawswMfatbXk3R7yzHh5Q=;
        b=HUxXQ1CexVBNSb9y4pxOc2hUVIgVO1IolJw0d6JOodexjFPanShGn2aY3ym2SqzFHQ
         rVQmL2W+7HGeegKJ8LcHW/S/rpjQrWBMtZS2rGz6c+J7+Mno3t97mEatKZJLjsWNk38g
         6OufbNk/DuvaVKAgTFv8HY8x4B4oop6815FgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756162640; x=1756767440;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k5YulMZOBNM7qvzrKYRTd+kawswMfatbXk3R7yzHh5Q=;
        b=DaqwJ3smx6Fc7mcwM/ekpoYYUXcf/e5AQcEqyErAgICR/4uDrLBXo18lfSQkaK4qJC
         lgFhken6EM7RL9x4WtQqkyqGUupAgwdU6zKI+ZocYsNkKbxLu1tcb/waG20DSAbH32VY
         7ri1rDt7MKeIRPlC9DKJbk1qtqinR44o42rwRcfC/z/iLc+Ac9a5n6/7ypVNYctTSIMu
         gvEyiHLeSKcJ5EjWCP8jRNzeO5HkJRKLSsnvC3qG4Ify8SfrKB3PCWVzw/ci5TCXa5CK
         Zhn2Dre8/UVhu8/7b6fqG7GU62D2I3/5ZG8Ze+2FALuVx/WQlqx995dleyeOzPx4JEZ3
         qzyA==
X-Forwarded-Encrypted: i=1; AJvYcCWAOsH+1ppy/2D/Vtytu5ummryvC7pZAvY2YKF7gwTqKO7wVanbFpmGzr2q30U/o30qHv4w3BZo6F7xHQkN@vger.kernel.org
X-Gm-Message-State: AOJu0YxtZZS8rSJ4RzvXAbOtuiplsZWK7c63+CJCo3DKXaQFBtgj74dG
	4s+gvFdqo47mbBzHwJEz0c9eCd6C3ltr9UdpEfCBd1kO4CKlvWx+RedAQZd3XjPYJg==
X-Gm-Gg: ASbGncu7NhCgzKyeVHdoYHQOiCZrla/NeZmNP49o3ij0xn1g2VFduWTvqDeSNOetc9b
	JKweGu1nBMb4NtPTQF2/kIKE77UkYm5Slk3oDXIeCNgr+TrZGP4wsTmlNt2NJMBHTBEMTuiDAeV
	pS9MXgmgFJE/hvLlB1jaIqaGjkU+lINQcr9ekLpZJwlDxIPUNswdV0pysbQwsKIL4Uck51AJmJx
	Gjwk4QGz2HQhScYxqxx6sRMCCNaLp0wpkjlNnVfpLD9dWlvDulsTjEb7823OgPEnUVUejJWXCTu
	cdxu3QW3jHb+corQ3FQkNVnlQ8BRcuzTybSGfEv45X49FMewhAugNSiY2C5Ure0DeL14s5agRHM
	cg//1RBY1FZab8ck6j7h94XNiBTztFNxXJDv30jxhUUIReexNRczaKZ4ir6EY7MoyE4ox
X-Google-Smtp-Source: AGHT+IE+HIZBtyyFvl4JXHn3tOLjF4u9v/mAZN6MHNUlS7TTvkI/So/QqLFhw5/+roUTI74EBRpCWQ==
X-Received: by 2002:a05:6a00:4b55:b0:76b:fab4:6456 with SMTP id d2e1a72fcca58-7702fadbb34mr16821506b3a.21.1756162639731;
        Mon, 25 Aug 2025 15:57:19 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:230e:95:218f:e216])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-7704fb69542sm6529922b3a.94.2025.08.25.15.57.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Aug 2025 15:57:19 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Georgi Djakov <djakov@kernel.org>,
	Odelu Kukatla <quic_okukatla@quicinc.com>
Cc: cros-qcom-dts-watchers@chromium.org,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	devicetree@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 1/2] dt-bindings: interconnect: qcom: make sc7280 aggre{1,2}-noc clocks optional
Date: Mon, 25 Aug 2025 15:55:56 -0700
Message-ID: <20250825155557.v2.1.I018984907c1e6322cf4710bd1ce805580ed33261@changeid>
X-Mailer: git-send-email 2.51.0.261.g7ce5a0a67e-goog
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We've found that some device firmware does not expose all the QoS
resources necessary to manage these interconnects, and that the driver
code that starts using them crashes. Leave 'clocks' as optional for
qcom,sc7280-aggre1-noc and qcom,sc7280-aggre2-noc instead.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Brian Norris <briannorris@chromium.org>
---

Changes in v2:
 * new in v2

 .../interconnect/qcom,sc7280-rpmh.yaml         | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,sc7280-rpmh.yaml b/Documentation/devicetree/bindings/interconnect/qcom,sc7280-rpmh.yaml
index 81c3dff53992..5dbd0563ac17 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,sc7280-rpmh.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,sc7280-rpmh.yaml
@@ -82,17 +82,17 @@ allOf:
           items:
             - description: RPMH CC IPA clock
 
+  # QoS clocks are only valid for aggre{1,2}-noc. Some TZ firmware do not
+  # expose even these, so they remain optional.
   - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,sc7280-aggre1-noc
-              - qcom,sc7280-aggre2-noc
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - qcom,sc7280-aggre1-noc
+                - qcom,sc7280-aggre2-noc
     then:
-      required:
-        - clocks
-    else:
       properties:
         clocks: false
 
-- 
2.51.0.261.g7ce5a0a67e-goog


