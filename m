Return-Path: <linux-arm-msm+bounces-31226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEA1970A7A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 00:41:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB41E1C209D1
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Sep 2024 22:41:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D881A176252;
	Sun,  8 Sep 2024 22:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SKO99+Z2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C60114D420;
	Sun,  8 Sep 2024 22:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725835256; cv=none; b=RQ+tsJU+R/aXeZmEHwPq/yEMCg8/rWCuSuZCjrSKJVlCdNLlPwkeXcYGk8r0dLetsY8rCuUIk8jpUHKaxiSu9fx2Kw/Rp4c0OkU6gGHQIu/FxmjMxIdEl4yg860ZyPqMpgdacyhl7qW6u62/wAh9w/rNoe6ZO7mLoHlUO5k2enA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725835256; c=relaxed/simple;
	bh=X5q/4quCzG4F83jGJS3OIZIk4uVa+btfsAT1Fsn+06c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VCD9dj+r+SymXvIkB2cKSrEtxXWJTlXEqDd0pvXYLlzIPUl5uAeognkwxBnKs0EZrSsxbTbQwslFPGkMtK/xbvn+qOsIrokpea77+p37QOM6UsHC1jcYr8Swscq3N+iXsmEp9zkSzDfu56CtWFAv3qL3I3FXpJYcAYu9hsivcQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SKO99+Z2; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42cb9a0c300so33045e9.0;
        Sun, 08 Sep 2024 15:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725835253; x=1726440053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZFvHRy15mVoNEuxCo+R3TYqGZa7Awd0sq9cO2j8mkAs=;
        b=SKO99+Z2tW4qIvl0A4PWwbYxT6GZowZY+wGAYpsfk92VWtsTnn0cAEXtvJL+8Uo1Fm
         fb6wzSTx9WcamYL6s4y/RMtzm6w0opD6w/hwEMXkgMHJMN4qodCqPr98IKAs56FEp0uL
         NLV3Fz38+iB0BiHFLs0831WkWUX07WAI1g/GMI780aQwlEK/PLK181aJcuAToqREgXFH
         YM4m/p+HhG/t2WwfFq2sco8J2Dxgaq1/LdvU2lxdnIl4HRLxViZibK5Yk2vp8TpZ0ypL
         CSFjsFR5S0zqHHf4FkuKcCy4jr25gNGdXNYMPhSJq1YJrencOaDI4LPgQLVAqUPHrJn6
         gQdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725835253; x=1726440053;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZFvHRy15mVoNEuxCo+R3TYqGZa7Awd0sq9cO2j8mkAs=;
        b=hZ24gb4xaemJRiOaqFPmFF+57q+XzyzESM6D8JoSl7iZWSSnGOXYsN6zGej/k/io3B
         7ZP5e/PLJsVQo3NN5kc1z/IPL4PxBdIrX1N3Qnhn59Z1nOhS1UyDBbkTFPpfzY9N/EQx
         h5IGI0AqpopxO0riT3zwcObdHdibj5PzoLVJX13qWX7UiRFvVNlr4ijpcWqvwDGKmXbM
         cENWUIeHKONELPUOEirJXNBCsAvW44sje7y2h6VPYuuYb1zWn9FmHE1ONqHyVqp0Ucoa
         lXaxy6XPq1U46NYLByfVrv0hQNjNlIs9CbblCR9fUNmacdZFMpu8eulx1jCLyhIN9Tej
         IlNw==
X-Forwarded-Encrypted: i=1; AJvYcCV4VibuC1kVGbtUWFXhMaEaXv9pAF+l4EioJ3jxT5wk7jdBX1zZClwNo6iSgAPBTBCy4ZuvUg+a6tNgA+Fadw==@vger.kernel.org, AJvYcCXP4KyBiGRsqRU44xFL7j3KzT2xsRuVHDHsVAI2H4jzOzDrMMRMz0xSwOP0dd1glSr4jTPzmoytxs/aKymQ@vger.kernel.org, AJvYcCXVvX9S/CjTE+XGtmE95vNaRipXUmPkeOI2caTQ0hY2IBPVaODhRM4rV5aomcqV0Bkox6ITQ9FeBKFJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwDraAY1JHUrWUpunkVj4YhZfTr2MwyHUbYQq+oJmChIhB/x8f/
	df5vwiilR+sAGf85OKWAqodWU4eP7CjFA3m8OBmJ3FVEwuDrcMo=
X-Google-Smtp-Source: AGHT+IFvhv/dZnQMlwMkX8KEgvmhs93ZuA/rmnJ/PN4oT/Jk8njw2e9kBTDg802mCNVs9QC3c+jR9g==
X-Received: by 2002:adf:f8c1:0:b0:366:ee9b:847 with SMTP id ffacd0b85a97d-378895ca759mr5803583f8f.14.1725835253043;
        Sun, 08 Sep 2024 15:40:53 -0700 (PDT)
Received: from surface.home (2a01cb080508df00ca9665fffed23409.ipv6.abo.wanadoo.fr. [2a01:cb08:508:df00:ca96:65ff:fed2:3409])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ca0600651sm90883925e9.32.2024.09.08.15.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 15:40:52 -0700 (PDT)
From: =?UTF-8?q?J=C3=A9r=C3=B4me=20de=20Bretagne?= <jerome.debretagne@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maximilian Luz <luzmaximilian@gmail.com>
Subject: [PATCH v2 0/5] Microsoft Surface Pro 9 5G support
Date: Mon,  9 Sep 2024 00:35:00 +0200
Message-ID: <20240908223505.21011-1-jerome.debretagne@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series brings support for the SC8280XP-based Microsoft Surface
Pro 9 5G.

Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
---
Changes in v2:
- Style fixes
- Rename the devicetree to sc8280xp-microsoft-arcata.dts
- Update the audio nodes to use codec@ instead of wcd9380-rx or -tx
- Document which node corresponds to which physical USB Type-C port
- Reordering to get property-0 followed by property-names consistently
- Add a dedicated Wi-Fi calibration variant
- Remove gpio-reserved-ranges in tlmm node as not needed to boot
- Add support for Surface Pro 9 5G in surface_aggregator_registry.c
- Switch to the upstream "microsoft,surface-sam" binding
- Fix uart18 clock from S1 to S2
- Include Acked-by: and Reviewed-by: tags
- Link to v1: https://lore.kernel.org/all/20240903224252.6207-1-jerome.debretagne@gmail.com/

---
Jérôme de Bretagne (5):
  dt-bindings: arm: qcom: Document Microsoft Surface Pro 9 5G
  firmware: qcom: scm: Allow QSEECOM on Microsoft Surface Pro 9 5G
  platform/surface: aggregator_registry: Add Surface Pro 9 5G
  arm64: dts: qcom: sc8280xp: Add uart18
  arm64: dts: qcom: sc8280xp: Add Microsoft Surface Pro 9 5G

 .../devicetree/bindings/arm/qcom.yaml         |    1 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 .../dts/qcom/sc8280xp-microsoft-arcata.dts    | 1032 +++++++++++++++++
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi        |   48 +
 drivers/firmware/qcom/qcom_scm.c              |    1 +
 .../surface/surface_aggregator_registry.c     |   17 +
 6 files changed, 1100 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts

-- 
2.45.2


