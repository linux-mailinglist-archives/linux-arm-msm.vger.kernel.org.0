Return-Path: <linux-arm-msm+bounces-62389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BC1AE7D45
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 11:35:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D17A1C216BA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 09:33:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C96E62F2343;
	Wed, 25 Jun 2025 09:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="A3D2e6Wz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FE92E0B6E
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 09:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843405; cv=none; b=WVsPiOR5GkojHIzCCPGf7tmAfz+FWy25xHHvzNC3+vq/+MrL6TqAOviRt4WsYC7uerq6jG9/zh53WMPooHytUGPRjzmK0AlZtjYHvgE4SXczfOS3Y6UjRx8OU0aWRW5yJnhtk3Yduvik1DsapeTRbIGcYKNStlTDxnt32Xl9wi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843405; c=relaxed/simple;
	bh=YagMwxq7U7yWw9QLdcfac7nNwnvk1Yv3KEQc1uEZcGo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NVY0E1Hwk8nVKn742lUqGSfcDX7wb23g+kvWHs0JVa3nlEwuROh9RDxNLwkOc+2yvmf8U5DU0dcznlwGlVrz6KcgBNE+3RZTsdKPh8tlrNAsQlK+B/N7ZC88i/9HbGzxp/MzrfwFokwiI7XvxqtjCH1FTm/HtUkY/2t8gK1rTOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=A3D2e6Wz; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ae0b2ead33cso136835166b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 02:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750843397; x=1751448197; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KpVu8A0fOF6COL52SrecDnHkcknnFYzJmrqkhyu0QC8=;
        b=A3D2e6WztMmy4jEZ3O6D1dgczvWWyyjAzEZFNOu2sSsJCYqOlr2kePhIDgigvRMElY
         +lFaLBiLHVk4ZD8KnA19OGBYvrjljoHonQwlRAOQFvI+ku+NfGt5DXsDffQTdR8vOIbm
         orwyEvv+AKaLDURSy+uaok56/Xf4sNkrAVEHGZU3uGlwVsdl0wuttxMC13S8Eg8SoYzU
         Gsx6lTpDF+XGS/6gUubDowRK6rcT5BVfFNgMidaVlaQf0LnajYRXUfZ8FlEeWBfyFidy
         Tl1j+tw2BKTSzMK9C1P657kaKxYxNRXi9yHJQN8eBAOsuoa6vAgOWbQWzOG+m67LIACj
         fllg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843397; x=1751448197;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KpVu8A0fOF6COL52SrecDnHkcknnFYzJmrqkhyu0QC8=;
        b=NuDR/jlFQo8yZ0nuxhBEJUthnHfTJwCqzrqw+AaPkJnmEMJe+NmGnkqLxTOSXrPgJr
         23/TpQVnaG8yDpfwL3V2j3r7EZZzqhkkXXMaVNyYNZrnFeavVslqmN1+0jrEHPy3Vm4n
         Evy+xO13tiR3BDATFOTZ+s/ZhnJsLuMTvjEy1A3W/T1xmRYOEzXMCK8neS1Z6AF+6b5L
         FXhLiGmctJteKU4k2xGsaE8444tK8tjnEux5dlb64WGBqwRQFsqIksbBrBBNnSrc5sES
         +Ks1wNh+sKeKRMRw48X5TwGwJQ6DRscN7xOnU3TM1QZzuwUYFMmM3Sqq0UZQJpE+LNfl
         N0ig==
X-Forwarded-Encrypted: i=1; AJvYcCX6XDugfjKx4UQkeTo7pK9c+79Ig7wGnURbdbQT8ZKLcIEc6+CRdLkFho+Itgpl1i0lgAybIMVxsVjqFKKO@vger.kernel.org
X-Gm-Message-State: AOJu0YwHiGKA5c1c1PO/t2XPQBDaAckU6yGqURA+ET0sZ9jUFdbS5jGn
	UTk+rvHHM8vQLkVxmFyGs5eEc9z940ibSBedU5NByX5iNIHndGKj69/2QfvwgDgsJhg=
X-Gm-Gg: ASbGncv0yre6iJ6SjVo6oUF9nQmT+I/VPGRgAbudVRYZ1KZkYp9tV56f/EnxqEm8pbk
	6Em3GZeHpGbJ4kP6PgRyhJgdGSSw7ih3jGgunw7oxATrE0JKT72FiAPVF4hGN0VgHGuNHUUybhm
	OYpW4AmkuddXgt6t6n6fEewY0irJTIZcG6drTPSIfwsnVZQ2i628aIZ48nfXqwSjO7lwvj/1+yh
	4Vf8Gcm9TsM+hZ6y6Ma3CyAzGgGK/hs7P2rFPlGdgZVauKGe4wDUel+TlorLoCdgVu6/W0I+yrI
	K1K5qr0VK472JDymuiISdFjxXB20veCCOg7+pJxQhy5Mhyj2LXVUkxACnoUgxP49PKKcMInHzjD
	HuoKIQISDnXcDkgaGJzQhYCwWUuMTh7V8
X-Google-Smtp-Source: AGHT+IGs0JOq47ozJxO/VRAvUrQrVeV04oDsRGncO0FlhvJG+pk9vEPKTSD0ngky9ofslW8b5sJSPg==
X-Received: by 2002:a17:907:9715:b0:adb:2f9b:e16f with SMTP id a640c23a62f3a-ae0c07dfb11mr197384066b.16.1750843397407;
        Wed, 25 Jun 2025 02:23:17 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0aaa0a854sm270277766b.68.2025.06.25.02.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:23:17 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:23:04 +0200
Subject: [PATCH 09/14] dt-bindings: dma: qcom,gpi: document the SM7635 GPI
 DMA Engine
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-fp6-initial-v1-9-d9cd322eac1b@fairphone.com>
References: <20250625-sm7635-fp6-initial-v1-0-d9cd322eac1b@fairphone.com>
In-Reply-To: <20250625-sm7635-fp6-initial-v1-0-d9cd322eac1b@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750843387; l=855;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=YagMwxq7U7yWw9QLdcfac7nNwnvk1Yv3KEQc1uEZcGo=;
 b=tKVOirX/O5H1uxQ7HfeyAyYM5D3We6xzlJ6UXlJXIztsBOvAfenyp7TbfJ/uAqV/GmjIz7RGD
 07DUBwDoCwrCGr+c0KI+9cEHz1aYwkDjfvuOUxmsPxCvypnlcx1nV7q
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the GPI DMA Engine on the SM7635 Platform.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
index 7052468b15c87430bb98fd10bc972cbe6307a866..051b90e57d5ff42f82cd803521c48498ce6af35b 100644
--- a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
+++ b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
@@ -33,6 +33,7 @@ properties:
               - qcom,sdx75-gpi-dma
               - qcom,sm6115-gpi-dma
               - qcom,sm6375-gpi-dma
+              - qcom,sm7635-gpi-dma
               - qcom,sm8350-gpi-dma
               - qcom,sm8450-gpi-dma
               - qcom,sm8550-gpi-dma

-- 
2.50.0


