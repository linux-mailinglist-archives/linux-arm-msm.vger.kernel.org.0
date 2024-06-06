Return-Path: <linux-arm-msm+bounces-21906-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B21A78FE574
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 13:36:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4822F281DBC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 11:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 875DE195810;
	Thu,  6 Jun 2024 11:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="roj9mpic"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9EC03CF73
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jun 2024 11:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717673766; cv=none; b=UoCQtg5P7iOpJu6KFEhYrCM99LtQHLBDHk4puWcDwWCXt/1/FjFFdymffck99K0PglvMYZCJEPDZzhucs86gzVLnqA/lMPaFKfOv2sdP2StkV/gjCBNLWYgKzwVcaOnDoLFl8KMVLoULvRYPQiVWSMera+lcYGrqFwnwvpXM8CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717673766; c=relaxed/simple;
	bh=nh/cE3Eeu+9iFnpZ9VsfcbkTKdJVkvZjzDWXX9A2c/U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=K+nbh9aiWdxnTuhtTa8C+5yPQVIy3cFixxXUpxf7d1QYr3DU4EKCZzsl9TkdlJ/VNlZOanWNQI7HEUiuAkIN0trmpVWoJ73wGjOL6f13cxkYj0P/3Dy+mwyVj5mwwoy3g2XHEJSiYNuxI9VEIT/RbyNP94UkonD5XUuLt84iuIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=roj9mpic; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a68b41ef3f6so82686866b.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jun 2024 04:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717673763; x=1718278563; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G5WVHvN4hcDFKHXeB2Nr1rayWqDhEYmxUcOfsWZcLro=;
        b=roj9mpickY7udWe8MW95eX9kCWLKBO4cijCH7uFoaOOmDDAckWH01UcgGbCgsbOvR+
         VbSrV165xspyIy9Y3ceQgvVN1BbOb8wRfXcMAs6ZDxDpzE97pHsZd1oA5Id9kbpDzyF5
         a7bQBmSUCmYgIAQezRI48zWu+WIrb3gIjxrNyfHPaJmguBHq3RywmsGlExB3N6YfLpOm
         0eq2w6AgEbznwBymxsrhE1FlSkYMZPMbHmAVxuhFcrln7XgNbrvfIplw/KxVfKZ9T12v
         5FAZT9pXhU3yCJSIxOK4iLrZlnac4ghmJ0hBCzpMm8owhSGJqak23J4CzTiYPVQYL1M2
         LUzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717673763; x=1718278563;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G5WVHvN4hcDFKHXeB2Nr1rayWqDhEYmxUcOfsWZcLro=;
        b=t6+IlqA4erYcN8VYWUz5d8IDbKT0heOnBfs2+MnaLRWP3w2QF745pZTTSU2duSMuc6
         kj7PT4ua3419Wz3tEncKrTmw3ima8bVeYaC5B43XFp5+wQUpuE0KKt2pyhwT2eglpZJv
         SpdOYD2d/KD4ckh6XIklrXLHDRs4lGzVmSupdk84jvLZwB091534hhJZC7go37LsABcU
         hzqRBqG2I/QN4StND3skDPQw1bKjdMKWUXMpWCriZaQc2j+v9IFI9KGywqG5Y1/uRqLC
         JaUao7bkvnTiZunHOTN6EAI+G/00uz6D7e1AluClrLLpsP3oug1hW/0UYVJqDHk75wrv
         ZWmw==
X-Forwarded-Encrypted: i=1; AJvYcCUAFtvDiyOaPVTpMnpG+dI14KGHD3GkKEBDLmYLV+43fgd27J07A6ox+Wu5i2uWAd7586ASIC5IJEM1c1NChSM9KaaGIDEcv3u669tDMA==
X-Gm-Message-State: AOJu0YydkMyViUcYqI8xnfzpaN0h0NebDsXGefbMJQacaH2Ux2C+Xqww
	klzboYsI4vn19Now0Js1OQ99cOQETh16J45+0tsHMdltKXP3UYNz+lOTVtHYQ3o=
X-Google-Smtp-Source: AGHT+IFZDyPLftilahlXIrsCVup26qyzLoFoIOhmxBf4lqFjcysdyrdECYXgfHHXe4PPxiS99o1Pwg==
X-Received: by 2002:a17:906:eb17:b0:a68:b335:76b2 with SMTP id a640c23a62f3a-a699f663bcfmr329014866b.20.1717673763099;
        Thu, 06 Jun 2024 04:36:03 -0700 (PDT)
Received: from [192.168.128.139] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6c80581c05sm84014866b.7.2024.06.06.04.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 04:36:02 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v4 0/5] A702 support
Date: Thu, 06 Jun 2024 13:35:59 +0200
Message-Id: <20240606-topic-rb1_gpu-v4-0-4bc0c19da4af@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB+fYWYC/33NSwqDMBgE4KtI1k35TWJMu+o9Sil5qQFJJFFpE
 e/e6K6UupyBb2ZByUZnE7oWC4p2dskFnwM7FUh30rcWO5MzIkAYkPKCxzA4jaMqn+0wYWq10Fx
 QoIKhbJRMFqsove6y8lPf53KItnGv/eT+yLlzaQzxvX/O5db+m59LDNgQDo0UFauhvvXOyxjOI
 bZom5rJISeZE0MNl2AUMPjh9JDTzAVveF0LXtGL/OLrun4AIa58Tz4BAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717673761; l=2655;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=nh/cE3Eeu+9iFnpZ9VsfcbkTKdJVkvZjzDWXX9A2c/U=;
 b=nGY80AP0d0VIs7gnv8FCTsEISM8QTnBIrWhwxBlI6ydA0HbEtTobZPMQbLh87zZ6ga3Mq0dNK
 Xhbwvdok6dUBaFXUV1NCuGe5m2RJl9N1McKcJaloweiCl8YHBMNINMl
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

To: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Changes in v4:
- Rebase on next-20240606
- Do NOT change the wait in the HUAYRA_2290 configure to a poll, as that seems
  to not work correctly..
- Link to v3: https://lore.kernel.org/r/20240219-topic-rb1_gpu-v3-0-86f67786539a@linaro.org

Changes in v3:
- Use EXPORT_SYMBOL_GPL in the alpha pll change
- Drop applied patches
- Pick up tags
- Link to v2: https://lore.kernel.org/r/20240219-topic-rb1_gpu-v2-0-2d3d6a0db040@linaro.org

Changes in v2:
- Drop applied smmu-bindings patch
- Fix the gpucc bindings patch to be even better
- Reorder HUAYRA_2290 definitions near HUAYRA (..Add HUAYRA_2290
  support..)
- Replace weird memory barriers copypasted from msm-5.4 with readback to
  ensure timely write completion (..Add HUAYRA_2290 support..)
- Keep my super amazing commit message referencing the 3D accelerator
  official naming (dts)
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20240219-topic-rb1_gpu-v1-0-d260fa854707@linaro.org

---
Konrad Dybcio (5):
      dt-bindings: clock: Add Qcom QCM2290 GPUCC
      clk: qcom: clk-alpha-pll: Add HUAYRA_2290 support
      clk: qcom: Add QCM2290 GPU clock controller driver
      arm64: dts: qcom: qcm2290: Add GPU nodes
      arm64: dts: qcom: qrb2210-rb1: Enable the GPU

 .../bindings/clock/qcom,qcm2290-gpucc.yaml         |  77 ++++
 arch/arm64/boot/dts/qcom/qcm2290.dtsi              | 154 ++++++++
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           |   8 +
 drivers/clk/qcom/Kconfig                           |   9 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/clk-alpha-pll.c                   |  47 +++
 drivers/clk/qcom/clk-alpha-pll.h                   |   3 +
 drivers/clk/qcom/gpucc-qcm2290.c                   | 423 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,qcm2290-gpucc.h     |  32 ++
 9 files changed, 754 insertions(+)
---
base-commit: ee78a17615ad0cfdbbc27182b1047cd36c9d4d5f
change-id: 20240219-topic-rb1_gpu-3ec8c6830384

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>


