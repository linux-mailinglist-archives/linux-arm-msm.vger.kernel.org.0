Return-Path: <linux-arm-msm+bounces-48267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F8EA38BB1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 19:57:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18EC2168E52
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 18:57:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58190239095;
	Mon, 17 Feb 2025 18:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A6DydjDV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8AF8237707
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 18:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739818592; cv=none; b=AmSo9G/2bEN/k2RCUo+eqpgWm0cUseR5B/hFGJITknhYFQoxh4c37m1Mc6sE3V87OAB/U1McMc2hbs5O17Nv3FRFdXMUYywZ5qsesWokJaK2yobqLfAYMpzJPMlo34zeT3qh4ecRjDfQwBSegK7YA5iTG8F1/9+IB1xTkfpJkts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739818592; c=relaxed/simple;
	bh=VENCbeTaM23TQPVjYo4xu2jm/G2o+bDbnVccO3nLEM8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ou4k7LBs5YRIoQrCq7CkPnS3vI0GUxo6PDbXlNZHDGiXwwviHG07hk2F+fOuy3fGIccqjNTeg3xwKHqwAupCRt/VVSOEH8ruTCVnR7N+ywWNltmDyUFeAfBfAd+sdlOEFCE6pIwq6PqXfFWFGx2CCRKq4TH02kD8iKkUQuhasXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A6DydjDV; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5461a485a72so1404824e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 10:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739818587; x=1740423387; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/CQE/8APoJI85cJ7o16lk6cKIKl8q/OtIl4FzoAUDek=;
        b=A6DydjDVg+mIVf9/GWo9rSV1DM+ZqmwOb0FJTXj4gopDSF8nt27DMWHCMrIf0n/JQ+
         nXc/ZylJWs+5cvl7hJzkwBpyT8Xs86QJPMx0Az1KEd3AncdUQCHDBIEvUI4RIoiu5QR+
         BaS0WLdtnj+fZf3AlDYm/tVMr1y6RWrfbvl9a5ndOyk39vatbZygS1DsUyOnMuDXB1vb
         zppcreCtGd3SkAuqTVtUygBcOfOO7SARTMNEXNLOUoGyAJwpHnUn0Nfn339EtYM7GoIf
         4pvbyNBaQUXyYmldO0qzi0jgRzaFETDo6etc8tQ4t9bS5iWm7d4bPYXMgTt90QCd46DK
         EM6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739818587; x=1740423387;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/CQE/8APoJI85cJ7o16lk6cKIKl8q/OtIl4FzoAUDek=;
        b=bWsamvHuFeKBBhrs9gxe6rjzsU72KKAFVizlora59ro7zyYWRuPaHMZ65qg4mb8bTj
         VB8rP7I8mRAe6pRjRTqOv2MjmtKYMgMAQ2SHjH7dMYT9oKok80f3Rl/WSfhDhAqwjWis
         3+5iPiaDUwWFj/pz4W+nNI8vLe8c2bPeD1C85Rd8Qv2KZ9ZNA+Sv/DrAxEFRhL+Nulis
         PrIfGGOWeQpmYq0iAzCle8tTN6dJ4r4lf/PzcOJSqkUNVs1nP3LwMsPNAKWci0MSWXMi
         8HCeOsDHjfZgV9bnpuZN6qjF8I0flCHU5O++s0OujAjNc4zDzZcqFJOlBbrqAbTytlDu
         lF4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUIEQ8Y/duC6ki+xIlkGWuuBgoW/6FxNYMUz5O55buIdCoJ2reiO3ijYVqtD+s1Bk5a535wn62+ykvaADc4@vger.kernel.org
X-Gm-Message-State: AOJu0YztlQsRNUpy0648I8+7bDY7vYtE3lt6pGj+m/N25uQW8NolUKh2
	SHL7tUMuf2/q14DbW5SbRuHAlUK+2ybZ4UboTuD6v8llCbD/T9nftIQCv2T43jc=
X-Gm-Gg: ASbGnctPEzN37jGCF1StwoxdYRvJiBrO1bVJfS77TaBL45lMD5mbANOTIYW77xzcHn4
	mri4K2dmxBx9HnS3e9kgHVGziBDjWm4MpxzMrDe4ROKnDjdolyCYKW1gJf2OQY+9YdOkxzb0FCh
	Iq/Kzzg3XvoVBpbgpfgjU6wa5d7CISEoLvZwYrT6P11EXas8ODFfEX96mrLIPWfos2RW8LMOGmk
	7f8P97xggjnmfcLhSXaFKQnJmeBR3Ow623JPd75wDCA+AtKtyTxmZtVnmZajg5XVyRH4sYrB8oE
	65gONQjMdmP9k0X5F8c73mUiaIjfks8cWnaRqlTOzLb1Bx0I9WTqVmjbxfs=
X-Google-Smtp-Source: AGHT+IFVmrRMpyr8AiQMIo8jvfcV8EyiI7d1YzAk9atAVYWUJHE331fK/mdqUltPfDMLqKLvpHbQxA==
X-Received: by 2002:a05:6512:34cd:b0:545:3037:a73a with SMTP id 2adb3069b0e04-5453037a749mr2641447e87.13.1739818587281;
        Mon, 17 Feb 2025 10:56:27 -0800 (PST)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00--782.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::782])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5462006b0ecsm559806e87.160.2025.02.17.10.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 10:56:26 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 17 Feb 2025 20:56:16 +0200
Subject: [PATCH 4/6] PCI: dwc: pcie-qcom-ep: enable EP support for SAR2130P
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-sar2130p-pci-v1-4-94b20ec70a14@linaro.org>
References: <20250217-sar2130p-pci-v1-0-94b20ec70a14@linaro.org>
In-Reply-To: <20250217-sar2130p-pci-v1-0-94b20ec70a14@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=870;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=VENCbeTaM23TQPVjYo4xu2jm/G2o+bDbnVccO3nLEM8=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBns4ZQy9bth64RzHBZKD5it6HGIz23SfQI8zA3l
 dROBLp344WJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZ7OGUAAKCRAU23LtvoBl
 uP/XD/444fJUeWL2n76zyKZgEnIUeCshYpkb71g56j2c/R6Zmwb3PjUGP47tSfhqTutg0RmTeC3
 8OWrsIDiEOKi7XvfKpT873CKwpeK2Tw7f7T4fG8Hno9+9qUyljXbMxuNA6DQ7Pz4dEdWXouhX6c
 GhzxuTjkbtsxeEUk8euBg/CCcb6Fe+ZfgBuJtU/VEq6YAA5NGsT9oQjBXO376HvWh9jRP7MaRlM
 60kFx0rWoa5Y6l7WU5wuL2zWwFNhWetsqIOU8TkkE+gZ92pp9z2uRfTjo+97EOhXOxHiq7dcIt+
 imlrvv7M+liibjmXuMRiNDfaiZeox7DJhuoOrt64x7Lp4j1ZrAWRpIJkSfSwOY1FMK56s5IsQVM
 LvyF2eVubG//8gNXvL9o9f4Pf4nPDq+H0GXzocZaKonkyT0M75b7hHg1Ls6QSmy9pW+1RVVVgfz
 nNTA+/G+v57UzDnBuiX39+fqJErwofjbTpOrdgOXcuXIt+zsd9hVVIlAfKDmYbl4N4Qv0VPu872
 /YfMxQQgieXhzItgd6nbiOWbVfunTtIWGC2bYOtU0Wrl3Mzbel919zFnwhftgOJisPqG9evhgzz
 pczXvyfzoH0H/FUfWRWfps/6LDG9gybtVzcg44JQwxTLUM1kzdioIVGGJzGieOj6jHuCMqU8w90
 IozafB4Z0bUMyJw==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Enable PCIe endpoint support for the Qualcomm SAR2130P platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom-ep.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index c08f64d7a825fa5da22976c8020f96ee5faa5462..dec5675c7c9d52b77f084ae139845b488fa02d2c 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -933,6 +933,7 @@ static const struct of_device_id qcom_pcie_ep_match[] = {
 	{ .compatible = "qcom,sa8775p-pcie-ep", .data = &cfg_1_34_0},
 	{ .compatible = "qcom,sdx55-pcie-ep", },
 	{ .compatible = "qcom,sm8450-pcie-ep", },
+	{ .compatible = "qcom,sar2130p-pcie-ep", },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, qcom_pcie_ep_match);

-- 
2.39.5


