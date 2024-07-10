Return-Path: <linux-arm-msm+bounces-25870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D72BE92D71F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 19:08:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43BB51F25077
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 17:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D910C195811;
	Wed, 10 Jul 2024 17:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LGsgaows"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBAD195808
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jul 2024 17:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720631118; cv=none; b=KGBJHNO+ul+4ZsOt8yqlqTdqDWKsGDcQ45hP1gu7fT94d4OCSMwknJ6F4i5CXWDQURnRAZ/IHDVZzQjdglHy03efTB3vAQ2Ftj7X2g+8RucNoHrGpwjRjWCUEw4h6MdPfbhNXpTU1uJMS9qLzeRyRvHV4K6H5QNRRUFjxJmNSAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720631118; c=relaxed/simple;
	bh=y3mPP+gIzqE00dgxHNQadnkkTkyDIlA2uQAKtot/hqg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FyguxsU7aoxu+zbwIxnicFm1J4idaVfayS671V9moTgNpOlElyXziaXCZGEpRaFwc/WefCGhDEMswxFNWX6uhC59bQGnv2zDiCjiikO1WIifY08a9mLj7pjURyqbtkl3v/U0abkEps8VnnKGaZrWTBUWyv+owMSEndPGSdnTO10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LGsgaows; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42793fc0a6dso67675e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jul 2024 10:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720631115; x=1721235915; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UO6/lK5/7C6XDmsvIs3cVH295usofusy4WKu+UT3LKI=;
        b=LGsgaowsX3M8QYqgcgDSWCJOKe7jb81lRQ25UGmbb1uAUaL8QMvGE9rYLR94cCkUO6
         I4G0HnsJH41LA2vkBUTAtPxobrAQtzOndR2a6+Wdbpo3EE98Kvyu3aU/gK2JoAeC9wmz
         cWFvXu03aYw66M7Y8xGcRzIH150Xi5WGkoL5aSDnT/Udo76NVJL6N7HL/OfA4F2uCHiv
         OndGp+BqwWZJ94cGYL0pHxsMww3pVary4wvLB6d+E1rnwSLbaMpktxh4g61C4QoXSoBw
         iHjFdzCOWqsfUxYDFPomv8qYOlaHmwQNuFiKZF/hL05APMd7NR+D1SpgA1sd5gf+x8hR
         xzDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720631115; x=1721235915;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UO6/lK5/7C6XDmsvIs3cVH295usofusy4WKu+UT3LKI=;
        b=HdLbG2pcDI3fxHVyart7lMmKL1JzNMaCT2rkGvuNozyXMUkA4In6w0Pblb1fvibYj4
         d7ZaHWu8i6cVMFZ/YH1ZSvFwWdxUxVMXIdTXrXOm2KKiZGhc4c81sIo66wLhQNk3sScf
         w7oYSujC5U5voRI8ztvaCuiwD561wkwnb2NezaLOdpp2b1de5FolZfz885CPNivBz/W3
         Ns+HRynsQobY56eRFOUXiUxllfjCi8Ozan3B6ZtbeX/Z4txCYqe71U12lDsJds7UBJHy
         mLcBpnRwbQCT3BnwuH29IPTOeqnk+lGsxG3EuVQXdeS8kzxE3E+wQ9rOPv6DFsJLRe1/
         oWqw==
X-Forwarded-Encrypted: i=1; AJvYcCVeEyzKaBARWgsyqqjrgLQIZHhNOC96evcfkxgN2djgC5EFT9ovfnzBquW98zobHZXUD8iY7HJJ6PRDsWURIs/kcTJNdZTH2XQtiar6qA==
X-Gm-Message-State: AOJu0Yzh6Ajv0TsBu1sLwgXdt9pEIzg1U/8kVUcH25SHKkMW6xPbKPKB
	/3wiK2K4xn00kqWLboZMugbH3WmThlwAdl3pyvVKk/kkEzYLQq+bhLZqP7lvTfA=
X-Google-Smtp-Source: AGHT+IEZ/vduzwwhO5K4kQPX85w5VJ3dB+TYQDHXeHNJPj2YvvMVSizSFMwuGwYgtxvCPlkuMJjVQA==
X-Received: by 2002:a05:600c:5345:b0:426:602d:a243 with SMTP id 5b1f17b1804b1-426707d8a90mr42891675e9.16.1720631115301;
        Wed, 10 Jul 2024 10:05:15 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff1f:b240:65e6:93ca:5f80:ea9b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde7dedfsm5838446f8f.24.2024.07.10.10.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 10:05:14 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: [PATCH 0/5] drm/panel: atna33xc20: Fix the Samsung ATNA45AF01
 panel
Date: Wed, 10 Jul 2024 19:04:56 +0200
Message-Id: <20240710-x1e80100-crd-backlight-v1-0-eb242311a23e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADi/jmYC/x3MSwqAMAwA0atI1gbSKv6uIi60TTUoKq2IULy7x
 eVbzEQI7IUDdFkEz7cEOfYElWdglnGfGcUmgyZdUq0IH8UNKSI03uI0mnWTebmwKrRrJ9cWFTt
 I8enZyfOP++F9P56MXmJoAAAA
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan@kernel.org>
X-Mailer: b4 0.13.0

The backlight of the Samsung ATNA45AF01 panel used in the Qualcomm X1E80100
CRD does not work correctly with the current display panel configuration
and drivers: It works after boot, but once the display gets disabled it is
not possible to get it back on. It turns out that the ATNA45AF01 panel
needs exactly the same non-standard power sequence as implemented for
ATNA33XC20 in the panel-samsung-atna33xc20 driver.

Move the ATNA45AF01 panel from the generic panel-edp driver to the
panel-samsung-atna33xc20 driver and fix the panel configuration in the
x1e80100-crd device tree to make the panel work correctly.

The DT changes are included here for reference and easier testing, I assume
Bjorn or Konrad will pick them up after the DRM panel changes were applied.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
Stephan Gerhold (5):
      dt-bindings: display: panel: samsung,atna33xc20: Document ATNA45AF01
      drm/panel: samsung-atna33xc20: Add compatible for ATNA45AF01
      Revert "drm/panel-edp: Add SDC ATNA45AF01"
      arm64: dts: qcom: x1e80100-crd: Fix backlight
      arm64: defconfig: Add CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20

 .../bindings/display/panel/samsung,atna33xc20.yaml      |  6 +++++-
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts               | 17 +++++++++++++++--
 arch/arm64/configs/defconfig                            |  1 +
 drivers/gpu/drm/panel/panel-edp.c                       |  2 --
 drivers/gpu/drm/panel/panel-samsung-atna33xc20.c        |  1 +
 5 files changed, 22 insertions(+), 5 deletions(-)
---
base-commit: 523b23f0bee3014a7a752c9bb9f5c54f0eddae88
change-id: 20240710-x1e80100-crd-backlight-632f9bf936ef

Best regards,
-- 
Stephan Gerhold <stephan.gerhold@linaro.org>


