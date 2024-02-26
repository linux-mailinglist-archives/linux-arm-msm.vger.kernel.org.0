Return-Path: <linux-arm-msm+bounces-12559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A1D8674E4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Feb 2024 13:29:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8510287579
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Feb 2024 12:29:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54BCB604D7;
	Mon, 26 Feb 2024 12:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jXT/K73t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7385604C5
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Feb 2024 12:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708950541; cv=none; b=BL17xLde4TJZ8hX7hzNecwWLaKxY8EP3QinTCibJTmEqhLnGyME8pGU+KPfbH1IbeZgJ1Xin5C6kjUXP+d+y/xxwEo5QMnN67xiu2E9A3FMr26wkx/SUIEVsuOWFXF1Mv3+evUefUbRIlIDYZSLuW/KKcI0AzZYs6r+IRdncUw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708950541; c=relaxed/simple;
	bh=60//XUMfZ76Nh6bqEO3zLMyyLkjiyM71acrIwzF5ypI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HKymtIccDDxOT26tX859499EKpHtUWb+OOHgb471CKPZuN3RqSycOf7wGhcLd4DG1BblPMdXdAfFi/5FYkZoZP/pwl2ooLKW41TPby8blwn1fkfUk2HMAWCyi+7sKn93l+tmGDSojyplkzwpi0jxZNf/13++VnUqWhfqaslIA9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jXT/K73t; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a3fb8b0b7acso383132366b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Feb 2024 04:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708950538; x=1709555338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zh+/RCKjqlmGphkaMQmnBQf7xeNe6+FLKo+we5BQZGw=;
        b=jXT/K73t+U6tStth3htUwg43/+e9AErItutRcMPzaHXFUblmPnfhwTDUEPUqzilkKq
         G1pAHZDGURAeIF3ggMERJ8meE6PCd9Fpq2DYmOdr+yRYCee3+DyZH/DGpjGRcC8ILOO9
         YgjdUNzJvNWN/mc7GPM4+if/OsIZjDehkwzQaIe0LLSCAB+CUHo0hwqi0NxsT1cOExF1
         +Vy0CApXL7MZUWRwtMLL6drk5isuPgM2a72yuc7zvN2lQlDiMEGrunceima5Ri3X7JIf
         LVCgZenY39x6RQlcT/rNIcsWI8eGHvYdMbqRET+i4DMXF5P9fIS+rDJuS5cJZSsJPJ5E
         KNrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708950538; x=1709555338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zh+/RCKjqlmGphkaMQmnBQf7xeNe6+FLKo+we5BQZGw=;
        b=EH4f6MUeHuKZxZbTwdhoSyU9QZv6dw9ul4vkB1ddF77wsf5xKbqBywsl0S99KYFL7G
         tPMple7Lvg4Cw+/3rhufXWGXewz0z8Akw0gsLmmr3T+Sc3N3HCdohGxdoMQnXlI8TBoy
         pM11cJeChNs5ih4g8Eo868+aTmBRtUC3LRHaWBzRmc00FfvZ9VjBIAANhtPX+KIicGMM
         gUoVLMgnlAzxWbMt9Hw0rDkdqjVw+BDsVpAKquAtR/0/9u+Mk9aD/hyBBKdBofvVf+2P
         kfJdZXTEkoB6VjZmaVlQPNuGItcJk1P0ZbWpqIOtsNRVlvtKAjepj4WnwIKCE8SgndhO
         I/yQ==
X-Forwarded-Encrypted: i=1; AJvYcCWghZYpxMO5zT/CCgGYtfDwj6t6zo+d175Lo9Py1M4rKWUW1bGBkzrDJ/0WAqYJQF40TD9RuF5qkaJg51XvyUW9qJkaW69+Auao9cIpqg==
X-Gm-Message-State: AOJu0YxAbBWUFYwYeepqRatcrCFA3Fyy6/G2ArfAse/0YmSnjI3SOR+Q
	iGFWTJAIZjZ2XsaYj8OokAMKvIR01OfatuLMBSCOYJFVGYjDrzdVFAKRnr8BePU=
X-Google-Smtp-Source: AGHT+IGJflBwnkc8vd71Co6kRAm4WJGoXl/qpscO8NUz7R0TYuOlHyOJufveR7aHg5Jcx6N5/IA9IQ==
X-Received: by 2002:a17:906:46d3:b0:a43:8916:15f0 with SMTP id k19-20020a17090646d300b00a43891615f0mr275324ejs.64.1708950538058;
        Mon, 26 Feb 2024 04:28:58 -0800 (PST)
Received: from krzk-bin.. ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id s16-20020a17090699d000b00a4330ad159dsm1340882ejn.179.2024.02.26.04.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 04:28:57 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: remoteproc: qcom,glink-rpm-edge: drop redundant type from label
Date: Mon, 26 Feb 2024 13:28:54 +0100
Message-Id: <20240226122854.86197-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dtschema defines label as string, so $ref in other bindings is
redundant.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/remoteproc/qcom,glink-rpm-edge.yaml      | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,glink-rpm-edge.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,glink-rpm-edge.yaml
index 884158bccd50..3766d4513b37 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,glink-rpm-edge.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,glink-rpm-edge.yaml
@@ -18,7 +18,6 @@ properties:
     const: qcom,glink-rpm
 
   label:
-    $ref: /schemas/types.yaml#/definitions/string
     description:
       Name of the edge, used for debugging and identification purposes. The
       node name will be used if this is not present.
-- 
2.34.1


