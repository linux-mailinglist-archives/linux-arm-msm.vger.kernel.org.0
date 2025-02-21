Return-Path: <linux-arm-msm+bounces-48782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C2BA3EAF7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 04:06:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ADA69422434
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 03:06:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79F181D63C4;
	Fri, 21 Feb 2025 03:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xOLmF3OK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589FC23A6
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 03:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740107170; cv=none; b=qp0+24Swlgu8OJMj1EL0Xer4+W6LWMMAQs0hxES1r+a+mcu3ML3leUjC0ycXP32AAQ/+PfECAakUyIBP/A6zOD1YDEoaA901wvx70b4fiTnnfHMWRjR8XlnU7Hh/LJyfB+9zlLkweIJ71NSR2fzojggo6L8DCB1Ge/0bL294TnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740107170; c=relaxed/simple;
	bh=9UsApYEDGH2IHjWwMiu0TWBdNEwNiQK7ZA2hUV9JAvw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Bnb5y3M8TFPROVFeB8uIBd6wZXV2QPvZVXPNHeupOgrWFegZ8bgZzrqMwah01o1cxiowXb8lIPWHV13smR1eXSeYN5bGEVDvd2xveUzfF57XyyP6NTxFN0jgWu3KVwJiCBTSUn21kpSrxTa0pc42IdN3oruv/lmMhNZ/YGIfYzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xOLmF3OK; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30a440effcfso27349371fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 19:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740107166; x=1740711966; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PmCF1to7hYwEmQjLMqw9j0vtEKkBlDvJBhrQCO6ksdk=;
        b=xOLmF3OKQp3CQrxbCWVw7Lv05oPPMYMk7yz4RHiE7XWsYxVSN8s498bl151GJ4PQnD
         KXEQap1IyWfLapnC65yGIR42KU9ea7hrGAgzVVXzEadCr/KJgL/ycnMlHuYqM+AVfrTb
         Hb/5UdnWqHMLVjPKPoYV62kBeRHLAYFBEeDkzLJxfhdQir3xbyXykBHmfwv+A5rdHAj2
         gi2kfni3tCYC60ibworFoTh3aR/5CA131ZBL1w4AdMUFEVzkXvvZhYhzbjQMjP0waf2R
         Vrem8U0cNNJVznUtCPpTWRXNZSRu6zqb+TP/3Td2vI88JBKoT4GO6C6oddjh0y/3Bjnp
         SJUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740107166; x=1740711966;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PmCF1to7hYwEmQjLMqw9j0vtEKkBlDvJBhrQCO6ksdk=;
        b=GiT4AgEhMUpZTSRaQvFSGyOVVzeZ5R4ka/k7PxTqZon1lhNCf2SQYTeziG3tfUiaIo
         X9lc+AYkKrDTj+yO579cSRCynPfSah8MZ9PcqloVSpCKMMsisxduebYI2CBG2EqkGO6a
         HyYbiHEvBA7drt9LYFrpsBtkrB3Hid0XBneIMcr9uWvDkvMUJQ6/4wse880mJ+CDjb/Z
         97/KLfDGAwShXVVZIQWR6rj20PrrTs7fj0gwTl2hnQon0tOjRPCezF65XnfP5DDlCU2V
         /Npt8UzlJ9J15vCpjbeOMJ1qLWgQJJFz+arV4xbwP7aAOSyc/puilvTlLexF2wSSximQ
         6JLA==
X-Forwarded-Encrypted: i=1; AJvYcCWhYJ8g9kTEnvg+UgUuIm5cHm7EJtceKScmLYiyyKOSwVKHeE1eiYMVx0HWK7SdB+X0d5mqJeCFScSgnQ+s@vger.kernel.org
X-Gm-Message-State: AOJu0YykpOpDLkP5CYgfvboxo55MZsxFkopJgmWWx0TXrgNt4I4tBrjq
	yhymIwJMVsiZDvyqxMtZoTXZ/4ghWjKuZqFoSxARmFkVdPdAvkOGRWvw8gUXnNk=
X-Gm-Gg: ASbGnctQNcgSMNxxXGxkQIGtjT/iVJf6ksczR4IHpN4I7gEOqisM1nAPGuLwDIeXCAq
	mWjaoIQzmIVQ0a+HbCd46jUuvtmSzwj4wAjY6BIvh73G+RpKhHQm2bM/jUJ9BZOtmFx/SceSqCi
	USmZF7KMozBuMhUODFWIlujuj4vwsi1PNsu196SkKT7Sw/fS2nE2Pa1OvdLegeBeMPt65hDMkyB
	+0docUCDALqcxkVqFtpbbsrz4hMcD33IDwAKUvx3aWiJVJpGmjxITOTYUvdt5TmC8/lE+3dstXy
	eLynKi1i6tiqFDIhqJy59vv3U7gewFL7GTiHEE5EsxO3azaeutg4oKZGqH4jnlCVRUGy4w==
X-Google-Smtp-Source: AGHT+IFHXdcth1w6OSj7/CMbouJhrEFHe2wNKQ7rU3x9ZDg6f1eOa3maRdFlyqQ/E+5fOMtWOHAHRQ==
X-Received: by 2002:a2e:904a:0:b0:302:3356:35d7 with SMTP id 38308e7fff4ca-30a599af5admr4079381fa.18.1740107166420;
        Thu, 20 Feb 2025 19:06:06 -0800 (PST)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00--782.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::782])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a2be45876sm16021071fa.68.2025.02.20.19.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 19:06:04 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/6] PCI: qcom-ep: add support for using the EP on
 SAR2130P and SM8450
Date: Fri, 21 Feb 2025 05:05:59 +0200
Message-Id: <20250221-sar2130p-pci-v2-0-cc87590ffbeb@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJftt2cC/13MQQ6CMBCF4auQWVszLWCRlfcwLGoZYRLTkqlpN
 IS7W1i6/F/yvhUSCVOCvlpBKHPiGEqYUwV+dmEixWNpMGgajdqq5MToGhe1eFYdjo7q1l0sdVA
 ui9CTPwd3H0rPnN5Rvoee9b7uUIvmH8paobo2D4PkLTrd3F4cnMRzlAmGbdt+s7VQcakAAAA=
X-Change-ID: 20241017-sar2130p-pci-80dae35a67e8
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Mrinmay Sarkar <quic_msarkar@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1482;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=9UsApYEDGH2IHjWwMiu0TWBdNEwNiQK7ZA2hUV9JAvw=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnt+2ZDJv/U4UT/2kI4DlpFLm9NwHsC2dpNgv+l
 oFN2nz1Xf6JAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZ7ftmQAKCRAU23LtvoBl
 uC3ZEAC+Z7R4UVrh4IYMMo2C4ZHT53ykjxHNkmsSr30b1Jzx/2U7M5+GoMveEo3ji6gJ0CcmcAB
 wYkgbUk7VQVstQY4cIypyLSl6O0XLbPFHr3GavLAqOtrb/Fa0FjF9+ZgYLJFLeP0CFzquJvB7Kf
 8cn4nzAeO5jczYKbUAf2R1qI6S9jRxWxTH3WcEq8VJh/cyGiw/pHJeVVTI9FwPgjbkcAHbIO3Ei
 IrBd7fA45s/Hui1T6RGd0ohm/gGBaxE2OsfqEtElMoCwXWNljyOsB4TbD0r19yG4Xet1mPJXZIU
 +rKMvHFXizfAVwhLZjKT/7w7kCfOO1iLyWEfWefTi61KfzAIa80aLUNarczHFACybLJUAL5WFvf
 lp7yjNl9A/NnaShFinraIYOOqd4wOcSWsO9GL/pnPpQNAEOmb+q9gsbrxQVZ/OJordzj6A/oNVT
 D0lIiVj1G4SCNSbJydpD+3pHnvBQ+DZhpK+qWrTKuhm5P3/20StCqdrKjch1zHh8eF+dw0Tvy0A
 VHw2QTnj5eietIUWfIwhXWyCxSPQxywaCeUGa1ANiyUrtB5JJrPZC3GlRsDWQasEmLOBViFrxYb
 h2hkH+f1b2+KTOa3FeDyTDzbn/8o212OoTXXgrhiLeHrM4tw/OxgM4/ohIeEnmzkcr+YogBHJxr
 g3FoRgoJDlpjWyg==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Update the incomplete SM8450 support and bring in SAR2130P support for
the PCIe1 controller to be used in EP mode.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Rephrase IOMMU commit message to stop mentioning eDMA (Mani)
- Explain why it is impossible to use fallback compatibles (Mani)
- Reformat names to vertical lists (Konrad)
- Use ACTIVE_ONLY for cpu-pcie interconnect (Konrad)
- Use tags for sm8450 interconnects (Konrad)
- Link to v1: https://lore.kernel.org/r/20250217-sar2130p-pci-v1-0-94b20ec70a14@linaro.org

---
Dmitry Baryshkov (6):
      dt-bindings: PCI: qcom-ep: describe optional IOMMU
      dt-bindings: PCI: qcom-ep: enable DMA for SM8450
      dt-bindings: PCI: qcom-ep: add SAR2130P compatible
      PCI: dwc: pcie-qcom-ep: enable EP support for SAR2130P
      arm64: dts: qcom: sar2130p: add PCIe EP device nodes
      arm64: dts: qcom: sm8450: add PCIe EP device nodes

 .../devicetree/bindings/pci/qcom,pcie-ep.yaml      | 69 ++++++++++++++++++++--
 arch/arm64/boot/dts/qcom/sar2130p.dtsi             | 61 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8450.dtsi               | 62 +++++++++++++++++++
 drivers/pci/controller/dwc/pcie-qcom-ep.c          |  1 +
 4 files changed, 187 insertions(+), 6 deletions(-)
---
base-commit: 34598f5b38950c59f15caa5194cfccbf6ec03c99
change-id: 20241017-sar2130p-pci-80dae35a67e8

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


