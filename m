Return-Path: <linux-arm-msm+bounces-8195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B6D83BB6D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 09:13:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 01C9D28D510
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 08:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 110D117585;
	Thu, 25 Jan 2024 08:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iTHcs++q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C677A18E25
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 08:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706170422; cv=none; b=AMHnLzDLRHGX+QMJsG0V8Hy7+KsgG0Ys7v5kz4HywJgbEbwN2aMWXC23V78lvP0vNzUJGrjdk5FVu2R+323+uiOejt70wWoT/rLNteyudmwl/u6P+zmFwTTwEfMJAIXR78tzwjhiyWnZ9B3QIMZKvg8OUdRNc/aiLILfF8n1ySA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706170422; c=relaxed/simple;
	bh=1PjAFbLu+QatkpIULOJu+tdaaDskbNtEhNTIImAUfzI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GIcUBylk/CizPJCMB4riWF4nklMK3Y2r7zflnW1LTihm2Khp5TZH9RZTRDU1LvUsBAxTDU78KvZMs6UgBFc1x9r6tu5tBqUg3oiYCW9Fuj0ybLXRrvbotC+BU8QqvC20Rs93znylT2VwFZJIRY3ob7UBsCiKaG65WarmCKonIDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iTHcs++q; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40e8fec0968so82198845e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 00:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706170418; x=1706775218; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SCQe/+k3llTSJdQx+Lotjl3qv3Ze8JJbbwzIaaR7inc=;
        b=iTHcs++qqYACQNulobQJaYDcRqn96SEwZ9hJDTOruqVyifkEpO3puPeMjuZPB17ZOo
         2WraGDv8gY1qKTx1+ql3tTAlOpXk2Lrqhigq2wNL5yoPvAmOoZ1N0SRwQvrHZLinyPYu
         FK41pnBKugHMxfRBGLx2PlpdaWBEdQ0McGEEQj+3wHmCDdZjWsnujRF75GtpgEOV4SzF
         O0mvqnz45VMY8Z+Mj993RoMUdttChf+b/R2hYeiIUOP651BLakO9nXdlonRqbIPhCdHW
         bkKj6T/hBXemeVCZnndSRO87p1YAAZHQN4WgBTBUKwNLRY9ak/6dOq6fb3BXK3eMr00y
         NCpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706170418; x=1706775218;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SCQe/+k3llTSJdQx+Lotjl3qv3Ze8JJbbwzIaaR7inc=;
        b=feGTIEU5vc6je6ZJe2RFq3lE0nLqxrlNFIqN1LRRbKeCr+5FKgJAqutroWJ21ZSMo0
         psViwoO0OHLHsBxMexlsekr6O8z/l60cqnS8LDMm5vbl+JIPJfllg5FCPqurhHF/e915
         E1xojEX1vo/A397fMwesncyaeoR3BHbxLhudKcxhqTXH0UH21e3dA8c/gFjHuQ5v9JHR
         qZo1t/IdqqXnU1H6lJm578/PF+Sn6JSNOw/FQOxwfL/g7qz5F2msSgenOfasKjWLHpIR
         M6AL+BqyhFZefuetgNGW8ZTx0niJicwT8kjFYBhT9KN1ZfKI3Jjwj7N6SAD7dFuOHU34
         NrgQ==
X-Gm-Message-State: AOJu0YxeQPsbVUEyv//tJMJcWpSAPSXyYhsue11IACuYdIAAKznHYUTe
	JwqOOhPXrYbG5Q2QgTIv6nAxiKi6es4cZkR5qElhJTGImOSKi7qvI5YIerUQ6l2FB0Y4j7i5AES
	FsRL1cA==
X-Google-Smtp-Source: AGHT+IE4nmhn8ZT67QzXSj5JfT4WLUw+FPOzC7wAh+EDKFvvB1jXtCdIzQ18pHfiVb1Z4PrxqQexsg==
X-Received: by 2002:a05:600c:c0d:b0:40e:c709:dcc2 with SMTP id fm13-20020a05600c0c0d00b0040ec709dcc2mr294491wmb.43.1706170418196;
        Thu, 25 Jan 2024 00:13:38 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id i19-20020a05600c355300b0040e4a7a7ca3sm1638350wmq.43.2024.01.25.00.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 00:13:37 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 25 Jan 2024 09:13:34 +0100
Subject: [PATCH v3 1/2] dt-bindings: arm: qcom: Document the HDK8550 board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240125-topic-sm8550-upstream-hdk8550-v3-1-73bb5ef11cf8@linaro.org>
References: <20240125-topic-sm8550-upstream-hdk8550-v3-0-73bb5ef11cf8@linaro.org>
In-Reply-To: <20240125-topic-sm8550-upstream-hdk8550-v3-0-73bb5ef11cf8@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=948;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=1PjAFbLu+QatkpIULOJu+tdaaDskbNtEhNTIImAUfzI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlshgvUbveyw0aDRQjDYSJvghOX7q6oyOz6eje4d1L
 9NnsluWJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZbIYLwAKCRB33NvayMhJ0f5AEA
 CpbBo8e542kVcIWHZDdsXj2gybtqv3eRfdsRMQxSTOXb0bIO6fSuetXP+5opaGONh8j2pQoeTpnqVG
 Dc7jsVqHo9Y555MYPCDxaae6PURkU9V8IYdN0l4y6sdkygA/IGns2+ghCGVOfcxijHbum8bZ2+K3ze
 pl0uUoH60YyJJ8M1lMwp4YnmCFLXc3jyB/HrCBnypyMlpwS77mVxYaaf4nnJ2iVABvko3nVYA095fO
 O7wE4OWQGvtUFToTqBtyxrQ4jSIpoekXMQMV/kgX6AvV4ayUZe96wPk+AEAaFY/PfzhaRdD1kKu+Ru
 M2tEH/yvoqYsCEziWlwlgrAEn3PNbdRLI2Ewl6Z+7W63jHdn3XAD6T4pc5iYW12yUDJVpn7a0uDsnL
 +TxnAhzH2vwDDYZ/qCybChFLSYbUQq9pNPduYbbODnJPHI3LmpBctphZljk4Yr4P0E7Pf1glIUgcT7
 KhaimHIX6SjuVexa2S6nvSwpt5ydutltxv8DWBZ0l5G8whqoxDgz6OsaH7SN42xuw9QnRplhbifD0s
 huWQ1ATb0XN0Z9qbCgM9/1MCbLKaIA+ii0zJUZl2L9jPkL9RaV3saDgsq9nLW1b84y8xHUGmdrpyXN
 RtaDPBizBTIGRRP9j1B4gHJy+513FtDc4wMOFXtUuikFziElz62DvrBO73Cw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the Qualcomm SM8550 based HDK (Hardware Development Kit)
embedded development platform designed by Qualcomm and sold by Lantronix.

[1] https://www.lantronix.com/products/snapdragon-8-gen-2-mobile-hardware-development-kit/

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 1a5fb889a444..c1720dd960c1 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1035,6 +1035,7 @@ properties:
 
       - items:
           - enum:
+              - qcom,sm8550-hdk
               - qcom,sm8550-mtp
               - qcom,sm8550-qrd
           - const: qcom,sm8550

-- 
2.34.1


