Return-Path: <linux-arm-msm+bounces-82689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE13C7467F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 15:01:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 26EE52F757
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 13:54:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BB2F340A63;
	Thu, 20 Nov 2025 13:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kzEwQeEr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E81C34403B
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 13:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763646889; cv=none; b=G1YIExw51ZxKILBLjlMIPZ+H4zsyJ0Ou4DD1gr3jiDvO5ugINi1Ow5RYYYMpvupQc1eeAYwcTQbRpwpSAGQDU3e9d2qJ8pE189WcKE7LMg1LBvFGSb36Zg3QoPJsRD66DE89WJlgWMn/AEkVM5oiUjznHn4RkIHlAPx4fMJER3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763646889; c=relaxed/simple;
	bh=FyQwtlNC7u1DQKxO8khtUake8nXyBTwLkIG8Vwkn598=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E9QLZTHJwwliLHT4GRJtvQmw2CbH+d6rSXRj+KABr/My/ASdBLYmi2jNC98xINWcfxxlJ8/8bM/p8u9zuReY/8m7jwHQNH0dhdKDf5KzleQNE2d9FW1WaoDqF6oyFnfBezjKfSv48D5Ce+W7tvQ7x2UcRpUoVzRlx+pqCfbgmPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kzEwQeEr; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4775e891b5eso4165785e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 05:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763646886; x=1764251686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rIHU9p5z8N+75WnfQpaCAm6p2JQ7k0H+LTu62bmByDg=;
        b=kzEwQeErOPNKJFIUvc1Yf+ErM5WTwemuK4PIs6bsBRISjH9VUwPEwGiEodi0M/MD3L
         /ZmuCHLDQH4Xe9wW/oVIFj9RWoPGNPKgi0/TPfVNgFarXXsjY/Fu+tvF9MfTV4k4XxkV
         itrOxYPlZDvKmm9i+YeQ+jW2vENQIMR3JjoWQXjWxIB5xOG4xe41WwlnXUj3JEzqTI6V
         /YJbI44xwAUI2q6GxGr2gawdfJCh4UHxO9g7kVVtV7aywq/1C4oswbKr/JbGuVOq4czc
         oK4NTYIxy5KgE2lZjZPzUqvrKZi9wlqIsVSJ793qm1ivj155tPS31131OjWqEwm4KeBE
         g1LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763646886; x=1764251686;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rIHU9p5z8N+75WnfQpaCAm6p2JQ7k0H+LTu62bmByDg=;
        b=RnkjRJN4nNguq6s+NmnhWAV4oC/+b/aFF955v26GKaLPzwrx2nYT8jxYmpiasBSyrk
         rguUs2jPfEHtCQwQN3L4l/srjmsXP7wKoGY9SrhuHihBIa1KkEcrBI7QUHqw+clyQ68a
         KPB/zlw5Hs7kUdWLOk+RjGZDw+pyvQ1eSmz6N5kQ7MgYRSDQrmtZ7iZKmrpUWWi9jqh/
         O/wyiUWK/FkmIDB7k92Kuw3ArVRZuQcJFEQi64wpzQZaWh49ewtMZwhxKiMXL486Q9p+
         qPpcNiNMTw98QvnbsglMQUva3PAgolsIwJQVP3uAU1FddCp19OenAp/ui6EkzhfehSP8
         vxzA==
X-Forwarded-Encrypted: i=1; AJvYcCX9xrESymMxXqSaa98llvDnkkY+g3dJ3LFXsGugT7wTlEFUMKYeb35mXXZagXeUSxNB+IhyGti2M6oGYokY@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6/VcD+ycZvpq5kyuoNfG984lj7x/LMOvArYH2hjf6gLC1xYIu
	mXfJ001+cz2tyKgs8n5AU77ZtaXQS0cLHaoktweH3Vcqh4H50g0dUx0j
X-Gm-Gg: ASbGncuaqoFGcrRSD4/aXuvjG3xsdCSSM6JVXYyyqfeZpXCB7N3OT/iJ4mEc1PYrNuu
	so6JdnVuS2D+prXIg6nxGzt3R7tUNDidzMbCCaYuxebWM7+HgB2hZOyhE/QvR6LzKn8T/AxxSUv
	YnbAaobeZRtdk0UfyDN8azhSHZXecR1Vq+FASGzuI1egnRCkny0eBtZSjL5w33DJgoIDNYXb6jj
	v13M3Tfjb9+gBOD6TruRnOSmND5YK9d7axreWzIpriKLLcV21DLOWkPOBz1UDnOlf0fk+SZJc3t
	4vELK3WS4vVlKFQ9AiQYwLGkmp+i0qRiCkkr4uflfefaa/cIjVKRLplfh8ljF7aE/W5vQuAyvIt
	VV0z2FjHJt+XWbVOYPGCpUBz3Ru1qXBV9+lK5JFocEX0IlmFXZi2ymrc3bpK2fABczbsM9A8ZOu
	D/KberrRlmQ60mURb5JDUkVr0xE6JY/4nfwSTDr5Ez
X-Google-Smtp-Source: AGHT+IFvfLlycM3x3L8VWWPzLacq07JlP2EdcX+xFjgzosVN0t/a2zaDf5V9YEcduMxdaXIKpx28PQ==
X-Received: by 2002:a05:600c:1e8c:b0:46d:a04:50c6 with SMTP id 5b1f17b1804b1-477b9e423d0mr31123195e9.30.1763646885721;
        Thu, 20 Nov 2025 05:54:45 -0800 (PST)
Received: from Ansuel-XPS24 (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-477a96aed1esm67367295e9.0.2025.11.20.05.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 05:54:45 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH] dt-bindings: arm: qcom: add ipq8064 board variants
Date: Thu, 20 Nov 2025 14:54:32 +0100
Message-ID: <20251120135435.12824-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document QCOM ipq8064 board variants ipq8062, ipq8065, ipq8066,
ipq8068, ipq8069 now matched by the QCOM cpufreq nvmem driver if
socinfo can't derive the variant from SMEM.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../devicetree/bindings/arm/qcom.yaml         | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 18b5ed044f9f..0eb1619fede8 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -299,12 +299,32 @@ properties:
               - qcom,ipq5424-rdp466
           - const: qcom,ipq5424
 
+      - items:
+          - const: qcom,ipq8062
+          - const: qcom,ipq8064
+
       - items:
           - enum:
               - mikrotik,rb3011
               - qcom,ipq8064-ap148
           - const: qcom,ipq8064
 
+      - items:
+          - const: qcom,ipq8065
+          - const: qcom,ipq8064
+
+      - items:
+          - const: qcom,ipq8066
+          - const: qcom,ipq8064
+
+      - items:
+          - const: qcom,ipq8068
+          - const: qcom,ipq8064
+
+      - items:
+          - const: qcom,ipq8069
+          - const: qcom,ipq8064
+
       - items:
           - enum:
               - qcom,ipq8074-hk01
-- 
2.51.0


