Return-Path: <linux-arm-msm+bounces-64697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 812CFB02F96
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Jul 2025 10:09:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F37EE3AA968
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Jul 2025 08:09:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8216721FF3F;
	Sun, 13 Jul 2025 08:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="rhCmBe63"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9CA1EF375
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Jul 2025 08:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752394051; cv=none; b=HKcmwmjMTXTdAMnqkcSBojKlyOoMDlxgoH1LGvw8kcICGised2hEw9n44Yad05g+ukydWYLwxiyvki21jBjEjKfkoV/6IqblRf2OPwkFuPAtZW5gRY5ZxLSkMZthvE30YcX98H6Oo0mR/IvzQRkW7T4+/VhlWigyRvi7QNs1ado=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752394051; c=relaxed/simple;
	bh=cmEjmUIEwJdszNuha6SGlHW2o0fXW5xz6+LSWPvZsgg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mEaI0WvjpPXbePPPMmlkLWc6ZZVbMw5iFGB15ZAMyAoyZ8fWRx9OC5tw6xqGvtsXXFBXLujWmWJ1KQ22iATzjZEWabL9sdBZcdgMMBTomnUN0bBi2ohWWETXd6Gb623ZFiJzXVIxG3s+GiwlEA9pAtAKfygXK1QbxVHEcxUqggs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=rhCmBe63; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45610582d07so3280075e9.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Jul 2025 01:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752394046; x=1752998846; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HAOuh0e5PjdM5Thiks9XcjQnZt1mrG00zqw/b7U8tlE=;
        b=rhCmBe63rQcKHBXGf5EHrUzC/Dzyy9df2hTQQco/McWi33I6jERrxoswYpCVq2pMTC
         ioz623171BTrfBfPuxeDTQ4qfIaJdwe4lsh9T3T8rmCQABJNUXM3h4bKudmxtnUNDgpO
         ndepDwaMbhlRVJ3HuGgYVhkv2a9qjK6AlTyayqWKELm9gL+Yc2jI+9K4VuEZesA06kIy
         wtKhOFDARDhqQeRqWcq1QTBiwYrDM4bGd7RAfNUIvPKMg9jEc+IvNuQGsvDx4tZmSYA8
         olHDRBckQIXEE8VOzPFrg/jYLWJgIRNERXYePXJfRdocIWgm02CD66ZYZzyBEbDOFZNG
         5ULA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752394046; x=1752998846;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HAOuh0e5PjdM5Thiks9XcjQnZt1mrG00zqw/b7U8tlE=;
        b=lDSSopppDbui2Xbbx29X7ihwPZCcheOF1MUfCuBqyPD8d6oaSz2xiEvbP7gT7yWRDQ
         euSEYUr+fY6DjkuHXQzkAh/MmR/QrxsgsGF7X6EbKA0gv2+JqRnyPiQlOj0shqKHLt3I
         wE6oLVPvXaPDkOKg2ccS9Xwe9folJ35I0w3YwXrRS156d3tflVVyGLke45cJdUG561nA
         3gfItt5RyfnJmD/rXJm9xhQ4NsCbwaVZfenCdifrDGV5D/CepSIdEZh+xdb6Kao/9G4V
         +OeHWSGCbaapqLJExsuOR4yfZSB7skJ7cvNP2k9UWZ9JgxeKg748ez34fHhjzcBpWk6d
         L2XA==
X-Forwarded-Encrypted: i=1; AJvYcCW9Ueayj3d9rhG/dbXkjYnnyI/kQGuwY3VKQTya+shLnmNU3guTLhY7yr0+pdEG0yrfPtETbbytKjEGWXMl@vger.kernel.org
X-Gm-Message-State: AOJu0YxyEVGk6UmSwM83kcFxuEGuzjquWuaz81ZtWZDEefbCRkWrQ/OG
	95HHvllxEISex/YQM7v0ZN9OzcmiPnM8+S6y17m+HdGbaPV/NhjJkhlRYiqtKw7WyfI=
X-Gm-Gg: ASbGnctNcSWL1eUwy7hkMGI5LWSJoQ7M+ip6rUNX8AYh6fL08nI6b4JSncZpvuMfnt5
	DL5sTeoRFRNnljfzk0mFjX1iRXBmVSwn6T7yRfF2g8QpaBVZhD60IvtQU5hjP1cTt7ErWKSTK09
	gtwjTid1XFOWlr5JVbgXQknYdrdyLgmXmPmK4brvN53VHehq++qo7ljezwIim4uCF07ZbqoNxFk
	31f1vs6BNBpT2otU4sthDfaSpqYsVwe2Oo8xTrywB0CVvVDZcOkEuS5DKlNJL9fAL4wi8iGNInr
	gXWYbwtl/dYGvVT5A93S0V2wwKOuGpWioybBPVE37zal6aWeuwTFuIcbVMH0WpTIJ8uOiJOqtvm
	yThy0VMxuT+U3+DU/8qYL6yGql/57AD3WMZi/
X-Google-Smtp-Source: AGHT+IHNat+zEG/luHBNIINd5V8v6XlcBVNxebQV2Q9VeRLv4kxzRp8ULT+stMytttEuuhYWEbWuVw==
X-Received: by 2002:a05:6000:2086:b0:3a5:67d5:a400 with SMTP id ffacd0b85a97d-3b5f18b3eaemr8361545f8f.33.1752394046075;
        Sun, 13 Jul 2025 01:07:26 -0700 (PDT)
Received: from [192.168.224.50] ([213.208.155.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc22a8sm9386608f8f.34.2025.07.13.01.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 01:07:25 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Sun, 13 Jul 2025 10:05:31 +0200
Subject: [PATCH v2 09/15] dt-bindings: dma: qcom,gpi: document the Milos
 GPI DMA Engine
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250713-sm7635-fp6-initial-v2-9-e8f9a789505b@fairphone.com>
References: <20250713-sm7635-fp6-initial-v2-0-e8f9a789505b@fairphone.com>
In-Reply-To: <20250713-sm7635-fp6-initial-v2-0-e8f9a789505b@fairphone.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Das Srinagesh <quic_gurus@quicinc.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Amit Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-mmc@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752393945; l=809;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=cmEjmUIEwJdszNuha6SGlHW2o0fXW5xz6+LSWPvZsgg=;
 b=PdARDzzFMZy7Ut6DdJtISA7htSoj0AT2jFnSpJ6mCPR7xKdPfXUdr9NJCuHBaBjbgQNs+Hcav
 9Qi/8P7T+qNBz/thYmFy0Bn74Jp3O9N12GTa6rI4xDYY/rk8g6EpebR
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the GPI DMA Engine on the Milos SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
index 7052468b15c87430bb98fd10bc972cbe6307a866..1655f21a4f64c588851c48381a18965c946e2df0 100644
--- a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
+++ b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
@@ -24,6 +24,7 @@ properties:
           - qcom,sm6350-gpi-dma
       - items:
           - enum:
+              - qcom,milos-gpi-dma
               - qcom,qcm2290-gpi-dma
               - qcom,qcs8300-gpi-dma
               - qcom,qdu1000-gpi-dma

-- 
2.50.1


