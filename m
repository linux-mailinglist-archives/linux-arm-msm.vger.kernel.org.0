Return-Path: <linux-arm-msm+bounces-35399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 824D09AA042
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 12:46:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35E1C1F214E0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 10:46:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37585199EA2;
	Tue, 22 Oct 2024 10:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QOLmngRv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556DC1494AB
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Oct 2024 10:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729593986; cv=none; b=q+E9udCh6TYsMFa3NP4Ktmep/IqBFCiPJXehVh4UUC9ZNgMHaLTMy4jaewg/FnSFabPRwyGRz1zLN7Mp5N48KD0xBoMD+wfJ+QUMuR0hs+CuexXaeIFe5SzugnrzoED1yYnRD+lPZT/rHs1HalERd3HS92q/aFtcaHFhEny6nRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729593986; c=relaxed/simple;
	bh=7g7vQ5yuKO/HSCfrYWlV8Si3LPKtIuub+pj7PRO8uSE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FJ+LNpvWcfJZ0tsMRrXckBfHqXOGYzbx3bHCULC3jkZITuX2nFzS2l9UOBBqFNW4WCoz9J8tjsyNj9jKl/wqkVHGwd3nBIIjETkr7I46yJ4bL5+yv61I6nlIeHE0PTN9LiIdqZaP9Xk2HJVf9iUOSvYSzgoV1hLlycGfh46OgS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QOLmngRv; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-37d462c91a9so3941677f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Oct 2024 03:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729593983; x=1730198783; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k0bUlmHe8yPfkbR2fBTcBcntzjqMjAxdwOYNlsKz7L0=;
        b=QOLmngRv6FEzdWdfPUh0x6wM4257WDLvfzh3DGKDUqxfAVDIsTUYGBCsa1WdWUV+QY
         qPZuhacjfRIAcrjyynyxCLjzvWq5M4bIA2ItQaV2BePUTyHhAXjx3VW512EvN/WeWmRT
         N9sa2ahg/tVM8CyQfWChkhZpErmEjxjpuB/k8Jh7x2fPAG2pm0UnMSp0jNxIElf6e4Xx
         EeFXhBCsuR/k4iOs2k5Q2DLMi2eHcMKoSWM9iMGdxw6WmJqZTYCetsflIy91Hub7kBzJ
         eUSmYS1iPw56KfctkMKPTvXEAMG3WvqotfmFi41JsU1CCEDY7VB+qe4GdZhW/cTeeCD/
         g1qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729593983; x=1730198783;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k0bUlmHe8yPfkbR2fBTcBcntzjqMjAxdwOYNlsKz7L0=;
        b=AHUEFY7mlh+vHN2XqQ1yvFRjm73597Uex79RHpGR42AgtOUvKHkM12nbXg2ofYlrPQ
         bEOwk0ZNwhh7Af8dM6sZ1C6VwEMY3yUsmmrqO9G3ue0RRy+NeuuyHLGN8Kvbe6Ztr4YN
         qcPwo4TzJre5uSjVSiYeOc8V38RgIEH6Ufj3pDfUKLljsGxPs4wde/g6ESrx6vKexReO
         ENSOsAs9fKr5daPjwdyoOspXeciCl4Xl6jgH5EqDEkWWZo86oEY8Dg6Ls9fIlt1XPyt+
         N1eanMG64Uw5S22zgrJFoLf6FnilVyN9WyunWPDWZnar7YyAVBfJ7LNH79gmdGSJp3/h
         /thw==
X-Forwarded-Encrypted: i=1; AJvYcCVbmD08O1TzuD7ZYjmEHwCTFMcGMav4ovC2wlnl1dFBGAFVNKZjrjbF0TkgjY6tosQLNmac/bTtO6ur69a0@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4Ja90Kgb/AUTFWufUiEqnQJCF2dRRJQKYWwZ10U0/P6k4gop1
	FB++aRa/Yrbi/LbCsC3az7NJicoCVl0GeZGQPnzEh1aBtxLPipsrJ0XeZE5vCgw=
X-Google-Smtp-Source: AGHT+IHjkP7OfXudHtgygrbzeXxTqnMEgTwZ8qpiEgnwdIBqvFqKickEP/R/t/AUk9YOzmsGIskreA==
X-Received: by 2002:adf:f8cc:0:b0:37d:3939:ad98 with SMTP id ffacd0b85a97d-37ef0b61e68mr1781901f8f.3.1729593982722;
        Tue, 22 Oct 2024 03:46:22 -0700 (PDT)
Received: from [127.0.1.1] ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a37e1asm6351943f8f.20.2024.10.22.03.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 03:46:22 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH v3 0/3] arm64: dts: qcom: x1e80100: Describe SDCs and
 enable support on QCP
Date: Tue, 22 Oct 2024 13:46:07 +0300
Message-Id: <20241022-x1e80100-qcp-sdhc-v3-0-46c401e32cbf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG+CF2cC/23NwQqDMAyA4VeRnteR1Kp1p73H2KG0UQvDunYUh
 /juq8JgA2/5A/mysEjBUWSXYmGBkovOjznKU8HMoMeeuLO5mQAhEaDhM5KCPPGnmXi0g+FYmQZ
 rq20ra5bvpkCdm3fzds89uPjy4b2/SLhtv5o60BJy4LajTppWaCrx+nCjDv7sQ882LokfAuURI
 TKhakUNaCUqgj9iXdcPot7dx/YAAAA=
X-Change-ID: 20241007-x1e80100-qcp-sdhc-15c716dad946
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1594; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=7g7vQ5yuKO/HSCfrYWlV8Si3LPKtIuub+pj7PRO8uSE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnF4J1i0qmBmvrG1iJVbTDyDMZ1/SA5/1XP1Mt7
 C/A5DcDHIeJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZxeCdQAKCRAbX0TJAJUV
 VuOOD/9PPJgG8sKRS74RVrlkrUmpPGm6aQU8gprzYfkYD0aBMiR+O33MmxZAI2OE0mXmIO+X+8l
 Rj3UpejB4hRCRPm9oIW6YbC6dLFN5u81iD6Au1R1lMwz69Z11u/vxQ7M6dYsU0Hc271D77iav49
 1i/wT6DR8Zv1HMBQAY1L7J1t5K6UErW22+MX6l62Llg7qxQKYNEyg4wV6/ckc64GiD4CQdXjBGY
 IacuXidIkC8nUOrdVCDePN2lJ+udfuHQ3DImo9CGwgG7j6f/5eaLN6K+hQ4jgWwwYDwKY26uGve
 iTCtWEMgu0NUpOFItPeD07A8dY30jT4UzwijQ8Sadls/5Gw2bl2bcJDgIVPkixKKXoA1QfNkffV
 0DOlhJReLP5NMk9U0lgCYyiFZ+EEvA2kmNKhffuyHBgpmWxSJHpVKiCIAYkzvC2XYk1uvUW+o7c
 kbw+vdKFDC3TuvjXTrVkE2WAxYDOcuLaO0NqF6yZjDIi8HCeGFpjhHtYPUIhnSW3+caS/uG4dpd
 24BssnnYETWycP4scLLfi+UVFmMzMEijRsaVfjcDH2F1KuZlyyZT68JP8Ngt/uEixZTDCBbsxc/
 pJN/RJ/TnNW2KeV45cXTkv6r5xnitPhrTGaeO7pn0spXPFXJ9Xi1oFrQcjs+GyfwyI4bXVPOteJ
 QHDvPLfwc3lIBxg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The X1E80100 has two SDHC controllers (called SDC2 and SDC4).
Describe both of them and enable the SDC2 on QCP. This brings
SD card support for the microSD port on QCP.

The SDC4 is described but there is no device outthere yet that makes
use of it, AFAIK.

Didn't include the SDC4 pins yet because there are some bindings
errors that need to be addressed, and since there is no HW that
actually uses it, we can describe them at a later stage.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes in v3:
- Reordered the default and sleep pinconfs. Also the bias and
  drive-strength properties. As per Konrad's suggestion.
- Link to v2: https://lore.kernel.org/r/20241014-x1e80100-qcp-sdhc-v2-0-868e70a825e0@linaro.org

Changes in v2:
- rebased on next-20241011
- dropped the bindings schema update patch
- dropped the sdhci-caps-mask properties from both
  controllers as SDR104/SDR50 are actually supported
- Link to v1: https://lore.kernel.org/r/20241008-x1e80100-qcp-sdhc-v1-0-dfef4c92ae31@linaro.org

---
Abel Vesa (3):
      arm64: dts: qcom: x1e80100: Describe the SDHC controllers
      arm64: dts: qcom: x1e80100: Describe TLMM pins for SDC2
      arm64: dts: qcom: x1e80100-qcp: Enable SD card support

 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts |  20 +++++
 arch/arm64/boot/dts/qcom/x1e80100.dtsi    | 142 ++++++++++++++++++++++++++++++
 2 files changed, 162 insertions(+)
---
base-commit: d61a00525464bfc5fe92c6ad713350988e492b88
change-id: 20241007-x1e80100-qcp-sdhc-15c716dad946

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


