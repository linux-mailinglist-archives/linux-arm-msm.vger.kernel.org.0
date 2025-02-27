Return-Path: <linux-arm-msm+bounces-49600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6B8A473C2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 04:50:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB638168850
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 03:50:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04FE81E5211;
	Thu, 27 Feb 2025 03:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NLfTY1Vs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D28617A30F;
	Thu, 27 Feb 2025 03:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740628246; cv=none; b=hv+5v/CCbb1XC9gteEXyexZQ8L8Tkwn4/nVlqnfJMtncm3OeLLKnOTI0w/8rBvHtSMKYcEY6Boixe47K1e19/xdiErLLA9e5YPtQK3MNeWGvHZ4V7dMrCCcWsvZsZfB9Qqx7NaVsEieSVNV0oY97JHVtElgNQ49XNxdjpzHqrfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740628246; c=relaxed/simple;
	bh=DKExh+hXSFy3Pql8dGV3gy+idOhavP6W8pL/wBZXDzw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rlM97AHLXv8cK6sSQle9aTxHyTXUME4agiurhhzi4R3oh1HeOmyOtZqeU5rLWSrIcp2/qJjuMCsLrJ6LDlfBg1JhWeJO9jALpuUoBvshqAb7Ir1AyHnF0/2XFcS67vybxthS8klw1PYeMZ48MVVdpcZJypzEU850gMHIym8YaPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NLfTY1Vs; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2fc6272259cso888014a91.0;
        Wed, 26 Feb 2025 19:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740628245; x=1741233045; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CAPaousAGnnshOVTZJzCkPLGIWX6zIjKLrBwAHTDRTs=;
        b=NLfTY1VsORG7dIAJ2PN7OtoNG71Uef0xgjI1QBM8Rdz5iV3D4WAWHs+dbMI0ite2ns
         XLhzX5F6Od6WaXh2vcPhyuy3EoRh11RmxNi9UbC3vp+x1X7sB+e4w7Tv8SOpwTWgxv1p
         T7Jc8eiaxYu+BrOYyV7/EuUnr6fTrst9T5o7ex79VqnxZgpAc9T7Mt91lMF0dMLJ01tP
         y6s1txdTVMEdib02PVHtTM18kBSzQ0MWOl1X1w6IY8IOPw8KlDaBOZl4HTDZWe6GdW0r
         GvNQuP7mQYMTlSe82ETvjZLLz07zV9EzVwtqHx9aCrJz3P3/QTCXcEvvTWDQczg+Xbyg
         NnDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740628245; x=1741233045;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CAPaousAGnnshOVTZJzCkPLGIWX6zIjKLrBwAHTDRTs=;
        b=oJvx0pb+Rz42kDHEDugPwH4GnPgZXckE8W+3NhD9iQjBUVCKnYWecx6qHNzeTdbUv8
         MzA6gix5MSyLkliqpqqHjUpau5ZokRl8XD98yPW1HmZpYZxJe7pTpLC1R8WAvGOV1dib
         ROi8A/PxWlcsZvyi/wqxI4eCGK1RpYvppmZtyPx/1BHhaGIieZCEOpvbcaNNa9khaqIP
         RV7jpPXlI9rrFNrPOlwk7tGFspXQ4z2OiPsdSodGwmy33oO+oFgZ100iyhgK5tesOtNz
         aNVk8C6k2KQar4u4X5lhHga6EODJuz8VC+E6axII6+JwYyz+bq8zBRdlJ/B0QqoKXWAj
         i+OQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUxPo7Zo7f5WZN90lJuoheHAlNVWG3SBTGJuCOtkWi8LNfoR/lyOJg0yy3MxdbN8VnKCQOSnBkp0qS4F0f@vger.kernel.org, AJvYcCWISuDOOMJI2Szt8OjJlhFT4ClkBWQp6w3HJGtDNylPPZbuVw2Z10LUBnejIt/RLm8V5O4g8XHOVA6v@vger.kernel.org
X-Gm-Message-State: AOJu0YztXxVsnUY6fztLJQqu+l8yCq9Uw8O9HSk87V5DxekGwjPmOc31
	VxcDc8SE+Z9jSzBsrt5/c2wigM30MoXxBlbGdPSJmFJ0s0czh4x8
X-Gm-Gg: ASbGncuUw3URXKlyU47Kgb7b2pwy9isNM+50wbMiICjzr+rXJYZXNvXF9TgzFuOf+bC
	xAMcV/xAj4ceZFe/jpCpjN6LdFAcxfb0ORvQi2IqvQCDR5Ic86gRB5at8SUVAtE27stQ15woEmw
	NTgApvdL3DaMrk4ussQh214jg0uq+3mL/wd90ovxvjxvkFO8gjRjdm9k7DD6/Kds9KqzygImf29
	/N++TErsiDvSF9LdAOY2jM+aandlEVBFhGQ0R7AZm2hH1RsGqWOyAPelCp/aADyfjkX0JhkiYX8
	Kd/z1qba5BvZpwq6n4iFSW9CjtU=
X-Google-Smtp-Source: AGHT+IF1l/YmHJlFhqmVcAQYW6GFFR8ENh6S4C+qOz/xZ0tmt4YIhvgkmL5hh5rzI+mq6avvX4bUNw==
X-Received: by 2002:a17:90b:2551:b0:2ee:a583:e616 with SMTP id 98e67ed59e1d1-2fe68ada3ccmr16545846a91.9.1740628244743;
        Wed, 26 Feb 2025 19:50:44 -0800 (PST)
Received: from [127.0.1.1] ([2601:644:8501:1640:6614:eaf8:94e4:479f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fea67a7ddesm411530a91.27.2025.02.26.19.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 19:50:44 -0800 (PST)
From: Rudraksha Gupta <guptarud@gmail.com>
Date: Wed, 26 Feb 2025 19:50:41 -0800
Subject: [PATCH v3 1/2] dt-bindings: nvmem: Add compatible for MSM8960
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-expressatt-tsens-v3-1-bbf898dbec52@gmail.com>
References: <20250226-expressatt-tsens-v3-0-bbf898dbec52@gmail.com>
In-Reply-To: <20250226-expressatt-tsens-v3-0-bbf898dbec52@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, wctrl@proton.me, 
 Rudraksha Gupta <guptarud@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740628242; l=832;
 i=guptarud@gmail.com; s=20250208; h=from:subject:message-id;
 bh=DKExh+hXSFy3Pql8dGV3gy+idOhavP6W8pL/wBZXDzw=;
 b=URoIPEOGSsoKCBvsT7tTMRS1nTQ/IjxnW3vOdQSY2TSwEi0GwxegHMDEnELtDXDnCR3+3pn/v
 S6DYMrXAU1dAzJpUPcE0qIbnjaJUEjluq4+xo7OCIcpH/tmQ36Me9yv
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=5lJNaiR/Bu7edToWFLriO5zXOrVqSQWrBKbAKwuEw04=

Document the QFPROM on MSM8960.

Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
 Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
index 80845c722ae46611c722effeaaf014a0caf76e4a..37282e89c8ad78b088f0a447891cd9301c750db2 100644
--- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
+++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
@@ -26,6 +26,7 @@ properties:
           - qcom,ipq9574-qfprom
           - qcom,msm8226-qfprom
           - qcom,msm8916-qfprom
+          - qcom,msm8960-qfprom
           - qcom,msm8974-qfprom
           - qcom,msm8976-qfprom
           - qcom,msm8996-qfprom

-- 
2.45.2


