Return-Path: <linux-arm-msm+bounces-77674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 66681BE6598
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 06:59:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 54C804E3D53
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 04:59:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C53130CD91;
	Fri, 17 Oct 2025 04:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rP4RCeeo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60EF14204E
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 04:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760677167; cv=none; b=faa6v6TJDlDs1j3SU0WbuEFS0U65fnH5y+DNLFK1QSngdvT2Oq9FVvBTPuIwUjEIvFiwVE7gct0mm/WXcNy5F/DEFQ55svxzYDdxRj6WQfsBWygUq6yfDoBI7TGwPxSW8NTcxOZvANcCUGj9lAu0TR3EmPII5C2EP3ioFfkLvX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760677167; c=relaxed/simple;
	bh=zIxLGjbus2Nm+UNtns2PpMFy6y32gwr6ft1KacyPH6E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IDryUnML4R+ohmrVypIuyqug58rS/bruiRN7LFkdwkQMAqnwGiQVmlH8mirOJ5dsgSg0oz+zsJVNCT8IVFA2UiiRAf4yZC0ZWrjESXH05aoC1ilnqlq5Xq0aHQ/8oEITtSQcrn69t3u6RJQx/grBn8gv1vYnAWGN1sJ1fjiGWqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rP4RCeeo; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b3e8f400f79so23379466b.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 21:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760677163; x=1761281963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FUnCnObHtvExaoAwWKhjWqhVzitq0j5khgwEsaU6beU=;
        b=rP4RCeeom2ius2iULpO90/E5ogtzTW1BJ8jE0yXoFGeY2KuILwHq+OlhOzNxZBOEkr
         24Gz16uTxnCkWqV5WZpNk3ZY4rJQXMlNid4OlYpmCerYy1rDdHOwO66pDgarKu1QU5Ss
         loI1WscHCA4iZF5hEGkd/PieBcwPEN8rH9T2PCn8n3qMqazlOlHiVjWlbDQY8tYJdSe3
         GrTb8MtpLoOWSrOuIWwXAgzlIA05TAByftes2Lpji9rS+71WJNpR3wOdQOhdnrTmq0Z2
         MHwoJ8LxF85EffyEg65gnHcqaGdRzml1yLBuKvj5CCI4MYdD/2z8PXg3Dhat9dMBtIEu
         RnHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760677163; x=1761281963;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FUnCnObHtvExaoAwWKhjWqhVzitq0j5khgwEsaU6beU=;
        b=TCkMTcR/F22cNm4yVzwtFETlk6RNPHIKH9DjhyGimZpLxi/5OzJvZaFPMGcD/RCelw
         pFWTLjBmCV3YhGWLHZ6P3zZS5VL6ge4d4OM6ZYppSSvngeqjo7a4fsQ6kPsByiReeoN5
         Rr7Mnxm7J5EjrD5BjJbAf9vqhtW7/QvHP9PeHcivdbWEDKPJkH6qzvl/N9ze8dpquqSA
         OPC/+7VWqCCSWSteqcH5i5DjCcfJf1sW3X0VJo+RPe08jQ8ooqshRlCqny2wpIQBU7PN
         P4caNbroKGyO2Tqd8ZI7FRlry9khjFEV6x2q4EkHzzVGRyxBVp3u9SMgRAvO0995hnyU
         PwWg==
X-Forwarded-Encrypted: i=1; AJvYcCXRv6ZW2YgZFhI6n4rd4h82cJ16/ymafadgPV89kCNg+dgj5O8eHmPJt7e2xcilIFZ9pY1NnIpnyqH4SVUf@vger.kernel.org
X-Gm-Message-State: AOJu0YxevXDm82KJMI4aa+A713IWoz4hRmMSQHD+v0WY4yYAnZ53ctno
	LHP5noqzf9iQ7GADCLb9WSCzh+iVgoQ1fCWFg+g8MEXk3L8wQRrUj/shjHM1HDYmnwMwOM1vg3U
	jD81B
X-Gm-Gg: ASbGncubIz61f7vOciiealh8dePsbYB9hKEi3nfSnl0Op6fCNGWbwjeEeeUZ5KYQNWh
	+K0GIHh7TQjnvWJbrQRW8WcyDdOk4/yY34TgD0jpHyCve+8bKbQeRbA3Olp8JzmMXXTfaxTAzuw
	mNWi+X1gA+/S0ONGx2QMnrt14q9WFrR6GXhbM8D8ffxGnc9i86niZoI9by2HOyhAzVqsIQBuEXR
	+qi+cjob2YaiFdQhmmYGFP9aUHq7s+ndh5RkDAzu7wAq75UdlcYmZV9elb9FbzHWqV8+d7q9ach
	sYIP4bPuZPdXnZ1/kjLmfRZvlmwt8zk8frIY3RBqrnOul3dqgvZBODtXu/NvjCkJZ7fQFmYRHUp
	rl/VNxU1PWJeGla3xJOddc6Pj1zq5w4RMAoonXlvz1TVjtM4FVv8dQqBen6HODDtfq8+bjABmjy
	G9iuq7giMwtZY=
X-Google-Smtp-Source: AGHT+IFYxqz0Ttcz8UykimpyIaiCfE30akXHB7FNTj96qec06NuAlaW4UjbM/IwFrLs2OKOR1FkUpw==
X-Received: by 2002:a17:907:7f21:b0:b42:1324:797b with SMTP id a640c23a62f3a-b6474834edemr124163266b.9.1760677162690;
        Thu, 16 Oct 2025 21:59:22 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5cb965c599sm718858666b.11.2025.10.16.21.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 21:59:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Restrict resets per each device
Date: Fri, 17 Oct 2025 06:59:20 +0200
Message-ID: <20251017045919.34599-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Bindings should be complete, thus complete the constraints for the
resets by adding missing compatibles for devices with two resets and
"else:" clause narrowing them for all other devices.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml          | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index 119b4ff36dbd..9f5f9af6f6cd 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -215,15 +215,23 @@ allOf:
             enum:
               - qcom,sm8550-qmp-gen4x2-pcie-phy
               - qcom,sm8650-qmp-gen4x2-pcie-phy
+              - qcom,x1e80100-qmp-gen3x2-pcie-phy
               - qcom,x1e80100-qmp-gen4x2-pcie-phy
               - qcom,x1e80100-qmp-gen4x4-pcie-phy
               - qcom,x1e80100-qmp-gen4x8-pcie-phy
+              - qcom,x1p42100-qmp-gen4x4-pcie-phy
     then:
       properties:
         resets:
           minItems: 2
         reset-names:
           minItems: 2
+    else:
+      properties:
+        resets:
+          maxItems: 1
+        reset-names:
+          maxItems: 1
 
   - if:
       properties:
-- 
2.48.1


