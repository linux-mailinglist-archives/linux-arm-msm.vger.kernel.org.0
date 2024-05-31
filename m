Return-Path: <linux-arm-msm+bounces-21313-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9AE8D664E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 18:07:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A928D283BE9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 16:07:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C95615D5AA;
	Fri, 31 May 2024 16:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m9GAWTwS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BBC15B578
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 16:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717171618; cv=none; b=hb7F1TjqbahRq7je8TyOST+11dFnrwTBpPaI1055boP/APgZeGMwRt9md2Kv72RTE/UvFIlP6sSinsg6CDgq55wraKEn9Yh9L4hLcdDyCs1KilVZpeIr9QB9HGb1J+7YAn1e49HnivqKFwTMwy5NAsIlsseJ2sJDaGGS8yl/5zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717171618; c=relaxed/simple;
	bh=grSrVDhSfTbD009pKZqLVmksSuvVt7nHFbOAVP58svo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=K95Rwy2zkHgeAe9HQ/Qi40AOK4ethTKzaApNmmNzf0zb/BmvEUXrl1b9cghoz75P8KsF//+99sRYfVeOCntUB3HlbAcrgiRfxP65vPE+KHmEeUf85c7l1byzIp3wjzsu8Hvc0wRu7mAmuv1FWdT2xQUySCo9G/a/ttBvG+4S4kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m9GAWTwS; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a62db0c8c9cso238657766b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 09:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717171614; x=1717776414; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lAlOyuxLq40uKFygEFg6vCKpbB0JOMz+nnMl6D3JEa8=;
        b=m9GAWTwS9sEqkrJQwiojPPZN85o9mSQk42iC6YLK+eoNXPmdjlpdtA5WnH+NLP4E/T
         /9iKJFc+orE1AzKXEUXU/taocwoELo/uvCykxP6zq8UPiyVaiDkMEQBpPTMPOApcciQY
         jjtYKFW7DuzxjqyZeyYWmL3cAxReRKxSmWobEcacwVlbkltIEad4rxadwJJv2TnIpwag
         6oXZK5mxE/N06og07Qu6xkNGZS8zBT1BBh20ps0Tk0NMeNKoofJALn0fzgkuPTBgkI2G
         4ESXeNKaa21qq97lwIu9qrdXd8v15DKJpSZTXeAeqlbO+ET/FO418Tk2JDLMKYi5zKvR
         +iZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717171614; x=1717776414;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lAlOyuxLq40uKFygEFg6vCKpbB0JOMz+nnMl6D3JEa8=;
        b=WzUUSwWlHiUXLRE8zkyewq5CL1mUQ3Eh4bvKpk80ZIuCQFvjeERYYfib3oqDOpDooF
         zVs2lwbUx9gSdrP2S0JLFE4C7LdTPYfLFzBwm6lsgXKF1MyWaxZ22+JvVksFTOnzT1Ko
         U9OJlk21cO3M9X77aC0zDaTIB75Kmiv0iPo0AYgS0kLPKJVp/+zN/1SgFBsHJAd7cp0D
         69zIndynkDst7/70Nzmel73RGgVJCPyKYJdB4LzN/9YHK5+9M2Ip8tMB12a2f1oM4Avt
         v84a1gudt2LEIR8IBBzK75OJOgR7U7QezBo/JXp6dS8x+qoG3PNy2nufMh6rIG0+1Hs+
         K++g==
X-Forwarded-Encrypted: i=1; AJvYcCVdXi7kUZm5YuFSBy19/M7qM4Q4wE0lqko9EkPVfAx+7kqdeTNyj9BmVXPsRw08o22isuHy/J6NRL4EcePdsoy51gymZgtCdkfCDKo6Kg==
X-Gm-Message-State: AOJu0YyEpPQqUefQpO2Qs7kteB6cxIukn6hvyD6q0iX3fZoYxgY0TtUR
	v4wbwnLxLgJBCf3C/IVP8KcyqZvKBjugvO+pRgBGYAuY/stqOUaLM0HM+5MZ3Dg=
X-Google-Smtp-Source: AGHT+IH0GwuBKMyEd7qzHgXQK6TawsZtYrpdIeATwNspSXc/G36o6tAJpE8Z9zi1e8gFHLgQatIzjg==
X-Received: by 2002:a17:906:22d3:b0:a61:ac3e:2b4c with SMTP id a640c23a62f3a-a68209f9535mr204682366b.40.1717171613800;
        Fri, 31 May 2024 09:06:53 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a67e73fc1b3sm100802566b.74.2024.05.31.09.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 09:06:53 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH 0/2] phy: qcom: qmp-pcie: Add support for Gen4 4-lane mode
 for X1E80100
Date: Fri, 31 May 2024 19:06:43 +0300
Message-Id: <20240531-x1e80100-phy-add-gen4x4-v1-0-5c841dae7850@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJP1WWYC/x3MQQqAIBBA0avIrBsYUyO6SrSwnGo2FgphRHdPW
 r7F/w9kTsIZBvVA4kuyHLFCNwqW3ceNUUI1tNRackZj0dyTJsJzv9GHgBtHWyyuvjfknSM3d1D
 rM/Eq5T+P0/t+K4+2tGkAAAA=
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=870; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=grSrVDhSfTbD009pKZqLVmksSuvVt7nHFbOAVP58svo=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmWfWWvNZyiI9ri2SCtVX2wfHjvNyelu8aaTLZK
 83w8uDrJpaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZln1lgAKCRAbX0TJAJUV
 VtktEACsB0QeRG0nfQy0mlvsp5CDJXhoWS3qoGUhJfVVJCyiysZQwHeGoIPgNrI3n4WzY2a0E5S
 mesVvMoNSnopY5uxL1qibkiEnvffRtwB9O8GqKqogRIr9tlmG/3NfylM+f/DHLgWyFReYXZX2XL
 77XdRpaw/VvtsRuSXE6OBPxbhheRS1PF0T8faJT0CTTCp5AbBeYmUXXYJuYQfIuZs+tcq6EBT8L
 tfbb1Ir2ogA4qTdkVeKrEUKMYW26fKmJ+qN6Y5Ypb63LLslTQMzphtcYxU6jOE/uMOjndkPqGv6
 Tv5h+F+lxRe6l9gRZ5APbY++NgbPFYGhb62kfYRltsxnRofRmHyNe/BGnDU/JUu6+BCDp6Zt5z0
 hB0QevQAzyEardkpuj8O6hoQZMowRly/GliYPUhP33kRDNMSUWTPT7A6yOJo20wR3IuwNq9DYH+
 1SYdLsF73mKcO9t+k4aeONBBkdN60DFNomjFl0LUy4jA47zSf1tf4b5SoPAgielcMDWJCnxdGCN
 Zmt09DkmCIepuo+rXVFzRqMWQKuL/KavRuXSbbvVHAShLF2D4FSpPNmhf73xFxf+wVwmwGvJL9m
 hiTRALa3Fl2uU4BwYBi1QDDrl38sms/qrspJtIC/SFp/DiEOA8Ag6mHcyV/xK3WO4r1byoZnDkc
 s3q51jZzCfvpZxA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

On both QCP and CRD board currently supported upstream, the NVMe sits
on the PCIe 6. Until now that has been configured in dual lane mode
only. The schematics reveal that the NVMe is actually using 4 lanes.
So add support for the 4-lane mode and document the compatible for it.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Abel Vesa (2):
      dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Document the X1E80100 QMP PCIe PHY Gen4 x4
      phy: qcom: qmp-pcie: Add X1E80100 Gen4 4-lane mode support

 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   |  3 ++
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 42 ++++++++++++++++++++++
 2 files changed, 45 insertions(+)
---
base-commit: 0e1980c40b6edfa68b6acf926bab22448a6e40c9
change-id: 20240531-x1e80100-phy-add-gen4x4-fa830a5505b6

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


