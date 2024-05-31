Return-Path: <linux-arm-msm+bounces-21314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F928D664F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 18:07:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E86031C23B9D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 16:07:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B30815DBB2;
	Fri, 31 May 2024 16:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BT1kbKCV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6C0157E79
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 16:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717171618; cv=none; b=lI0tZoqo3Mau/zQZn0CU3OLArcwNNsNQG/L6Fdn6VY+2KYgUxjmZeJMDoa5Eut969dhN7JdcBR5+ggMi9sxtQV8x14ww+Dw1vjb+Y3FLrJxc7el11bnmLctVylbpN9xr9Ng/QZH2cqsCcaTNbV/mq0zSH9/yuk2VBzVWnS6nZe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717171618; c=relaxed/simple;
	bh=u1d+TMVUZZqkWCg0B+VJb5FPvmrutEqoJRDhebY8iig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YpO+vdVhDglRgycPWgCTY4Me5lzP5hveWc+sbTjEc0jNRclArHublu7A3GYSYqwqpfxy7piPj0UJTWYoFs17CzDL1axgwBB/i3Gyg5wHk0R1at4XJNcI5NRBqDsuYVEP+e0uB0lAvjCj6iZfmQzWxBT5PpnrdWNL3anZVWVZq5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BT1kbKCV; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a683868f463so114228066b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 09:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717171615; x=1717776415; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8mQFkvr8sKfXptqDLSupuErcLr+wa+/nDEhtEgvO86U=;
        b=BT1kbKCVRiNAYdLZsrmnTfblQslR2QtyMXjEoovDUKcIjzhkx+P0AhjkZV2OMu1Oqh
         SrNjqm3Pm47o9I32XOHp/5pjl/M/YLFg4cY51zawmllawXQuKwJlS3UO78ivHU+3XW0s
         /Jzoe7+WrFsoW92uA3A2uswnvSkb9FU8hfw7m0vzINsbLwiq67kWrZX/hedBuwdjCOrW
         y8K4dua4xtoXaY14vl8FyBZyTE55cENaf7hQhws16uEjcVcAbBguGh5OB09RzNwt54+W
         pQ6+FM1wCsx1WAecs020LutgWVv8cAEpgc60KpshaMFotFKK1PeKp70iEZ0vimGc+doV
         QS4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717171615; x=1717776415;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8mQFkvr8sKfXptqDLSupuErcLr+wa+/nDEhtEgvO86U=;
        b=HmMkbWz7a7hizhe8izxn2OB1+jopVVGmQp5vzsaq6u2UGuq4dyxELJUsGHcIaa+RH0
         iXTsyocSwQ/uPwX11rDJtXCiAQp9a70n/nJBB3Jyj5cn09+kt8izKe47HP0lH25Y/cmI
         qD6dyoCE8alxAW9OKwKGEs0u59AvgHXGdQCMEIIYbp4JOZAhpwCaMWn7T3Xm8oZ+cFJH
         GWV8yHTIT8rUm5bGXWjHEugYHnraaluEKaL0GNZNal+dAYtWycbpU1NBe7IRvewEBkJg
         d0vACJeRmfrwEFW0iZd3fFKjG0tMO1cSa9UZWhzlw7QE8Yu44stTEOapXjQ3Fp4s6DE7
         xNug==
X-Forwarded-Encrypted: i=1; AJvYcCV65Tqah0I8YJeRjTDAhPprpdl9RM0F86qRYZ9HxGx+pNMT2wVppi2nBgvfaWQM+8zkyHx8sLriZ4+7uhqdEGFdZSW3GFNvGkrawlGJ/A==
X-Gm-Message-State: AOJu0YyqjR5nWnhFANrO2oqul2ulTwiyrwm5GxG3FxjHVlNfqiWkXBjd
	4ggdiZX5AIy7ycoFutpfE7MGYCJqWo4nMCoObCUrIYUaBcGRSG8b7ogkpQhLgHM=
X-Google-Smtp-Source: AGHT+IGOPdQFC+VdmXdg6Gug4F6QB5XA1KL/TuwuNHEa+43ASEYHZmFqskROXFVIXRrqrnt7rPC08A==
X-Received: by 2002:a17:907:b96:b0:a68:2bf0:91 with SMTP id a640c23a62f3a-a682bf001c3mr140911966b.31.1717171615063;
        Fri, 31 May 2024 09:06:55 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a67e73fc1b3sm100802566b.74.2024.05.31.09.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 09:06:54 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Fri, 31 May 2024 19:06:44 +0300
Subject: [PATCH 1/2] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Document
 the X1E80100 QMP PCIe PHY Gen4 x4
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240531-x1e80100-phy-add-gen4x4-v1-1-5c841dae7850@linaro.org>
References: <20240531-x1e80100-phy-add-gen4x4-v1-0-5c841dae7850@linaro.org>
In-Reply-To: <20240531-x1e80100-phy-add-gen4x4-v1-0-5c841dae7850@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1417; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=u1d+TMVUZZqkWCg0B+VJb5FPvmrutEqoJRDhebY8iig=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmWfWaD9g789Rn/DmA84+GH9CJ85XBpmwwrsvIM
 bPXAyX/0+2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZln1mgAKCRAbX0TJAJUV
 VoebD/4jshJ9++Z5KeNra3Usv2Etjlie/jaVDHxXbtth1rZYbUq8X0EHYAKaxAxtfWfrYx9OQQo
 SZP9ihFnVazUFxbNUsQ1sj0BRkDfqrXapvmgZvzhUjATEk0uFRKBu6FNOYTtttGPas+lteY3mPV
 QWb/cIWSsZMIjSzotbpAu7BUijGhQZyBnyf63ZLhWmhSR7JBrJBhHt6F6fBzsu5KKg2sDmfNoL3
 1QXnwgGp7Pq/OX9VirsWXKbb/781HGyL6KpgaJS8A6aoxoBTCfAGUHIDKafCv4nsshDDc9WCoAv
 2f11vzjB3+COA4B13zcCvE/f4rpvhee1XNpGLPi2UjaV6+O9PX07afIFBcpb0IUvQib+RhgEEgi
 p7H7Rb55T74OF+PxRzBlx3FLlJqy1NQE35FA4Q23rtV8BZRvTu3bm+NFBrxbguXBvr7B8iursvv
 Ck+ey84wCkJeMLT25o5o/NPZIEO7AJHXzdYJQ3m5kdA5kyPsUzYp4O6dQjZWX7BZGYAguWmm+gc
 NOuatHR3A8UarHC4snGlpvJPA/PpHTSfjxterb/4deGbDaWX0ebP5kaOfWSiuHMRADUzRhYpTjI
 Ca+uWtbc/nKROkhfG7AzG1nCzEi5BaQknja9EElCxss99I0M/UOdvGwbXA7S9ob7LQshyuftxTC
 6AEi67lbAa5x+Vg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The PCIe 6th instance from X1E80100 can be used in both 4-lane mode or
2-lane mode. Document the 4-lane mode as a separate compatible.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index 16634f73bdcf..f96f692c9ee5 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -40,6 +40,7 @@ properties:
       - qcom,sm8650-qmp-gen4x2-pcie-phy
       - qcom,x1e80100-qmp-gen3x2-pcie-phy
       - qcom,x1e80100-qmp-gen4x2-pcie-phy
+      - qcom,x1e80100-qmp-gen4x4-pcie-phy
 
   reg:
     minItems: 1
@@ -119,6 +120,7 @@ allOf:
           contains:
             enum:
               - qcom,sc8280xp-qmp-gen3x4-pcie-phy
+              - qcom,x1e80100-qmp-gen4x4-pcie-phy
     then:
       properties:
         reg:
@@ -170,6 +172,7 @@ allOf:
               - qcom,sc8280xp-qmp-gen3x1-pcie-phy
               - qcom,sc8280xp-qmp-gen3x2-pcie-phy
               - qcom,sc8280xp-qmp-gen3x4-pcie-phy
+              - qcom,x1e80100-qmp-gen4x4-pcie-phy
     then:
       properties:
         clocks:

-- 
2.34.1


