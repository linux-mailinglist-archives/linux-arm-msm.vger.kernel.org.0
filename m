Return-Path: <linux-arm-msm+bounces-48931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 159EEA3F9C8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 17:00:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F212865445
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 15:53:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFE6E211489;
	Fri, 21 Feb 2025 15:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XNu0+A0a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F156A1DB551
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 15:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740153136; cv=none; b=OqY8KP8cCb2YM1daLT86Jj5hBmfXspc0t0/PPTHxHlpY4i/8TfdrcHEOziQUG4nfaKQTDxBNVxYjB5puSUdEdj4y19IpUM6cxVgQlVtdeQmkVbUUEr3z/bhYiWfHxatnDBL9NTFU2R0wnMK7UnN/+57fDEZ2gxsp3+x6dhNduJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740153136; c=relaxed/simple;
	bh=r63bMyziS5VAUoRIbBTBNVf6CyjstQjiNuFZTwV1jAY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hAYrnd7mheOzxX5E0YmhdoPc8AZchI+TrhyWAT88q+SP4WAXJ9ZfsodbCMhCddtL0he4mU5+DxrokgG204TrKKKMQXB/sq6KPTbIdv8EWSvTl8pQKGCQSb93nGWH33BaP8CO8Vr4fZ29ko6/r0XSyXJlX+Wxm75DQkoJAG1t/6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XNu0+A0a; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5452c2805bcso2541497e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 07:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740153133; x=1740757933; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=md2U+XG4zVBPU+kJo14bBfe09ZT4A11xAQxscpC41RA=;
        b=XNu0+A0aSSTO2CUQQxhsdW5svifJc8etTCYKOVqyFo2LTPgqaEbVLrqrHsCBeiQTkF
         QiGn/tSvACRh/NTJh+L2Vb1Ra+E+FsjcQcpCS9CikJym712DgjilxwuzwusYrVHzXC3s
         6KenJEJVdKccxU61qhWvU/Ue7I1NVNZE3LVVSkw5/qU0NiYi7Ma8ouTItWLBl8ngXwox
         gneoB6o5xJFuHthlncA9dMLHAxZndEPXpCQiFmtBZTDBRP3xf5bCgGdffcas/acGU4U+
         qQ+1Q3oOQs2eQGLOg/whR3/pfLWO/dRmXwDOL2Pk1dzoRUs9/E0lZ3xYKyhQ2TMbkCYv
         b3pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740153133; x=1740757933;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=md2U+XG4zVBPU+kJo14bBfe09ZT4A11xAQxscpC41RA=;
        b=slpesKU8RbYswGiL3QzoTQK1kiKHKxfJzWzmUDfoN5FEtzwzXFs3yZahUY9AEgUFk3
         8FeaFZcfoUWq88KMlHgO/4s2An/PtW0kNdoQa3ntlMMUO7PTqW9F4ZEp5j4MQKYfYntx
         MLdGUFHwnfVRmyEXA7y6qQ+6r0cEuUJSWhm0F+q/2LZxFWo8TkZ4sryX2uZLwaLl1Vao
         kNbjG6auIBWQwpooYLZBSXEsIb6IgqG7qjJ0lKDZAhDwhIoL+FRLuTczABiZCimm1sBi
         YTuO/4/0shbQEXCdLBxWvU2+1OzzCqjpPhIgJyPyWy7XOOm/fmxt3kD5DMTuJVRJRypX
         wUmw==
X-Forwarded-Encrypted: i=1; AJvYcCXJhq+1L+luUzW0K0Tx6Exf+A77+O+L8JYmlyny8wh7qa6hvDcg2DdC0gy6oUtXFMSikCwTtx98r406ozY2@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw3wGqCqrxBduwajCyZ2nEEjcAGI+kr3IXYMQCzjxAJs7eV4wm
	xbHezR9hnTaWtKGSVqA4A31Q7IBgCBIVPAb/XPguEe4J7OzUGfOewJ1umN8DxlU=
X-Gm-Gg: ASbGncu81RUL8Sjuhzlx6c0VVKBw9MKXElgMJz4fvau+lWQrMUI1ndmeYX7dusMTjzB
	hnuZ6OObbUCUhEs/xsYgfQ1IN2gj5HvJaIOL/odrQB9WzRlRwe6BOna8/0QcNn2WdJuHoHywCOD
	iaUDTZwLI3dI5CLREwGHhduAjVo/DKlA8tJG9kCe8PI6utsiNG6V9JC64XIqT+aDcfQqofS0zJ8
	ZjmZ0w6hRWTRyTxBX5JZfenL5+m94EH31KCadLyIFJ5NsGFw4YX0ikUptCZhm7k4tof9V7myKqM
	/kSnPcMAN+ONqbPPJxX0kLecOvA4/YATO4h3Bs4SJu/i0wbqR/zUVyEiXwYf5unpdojp+Q==
X-Google-Smtp-Source: AGHT+IGbMcerfbwYgeYw6YLssCNVTGm0A7e8f1N/RMimd9WBVnYYr2qhKyh+qBmIMoNFdbv0docIBg==
X-Received: by 2002:a05:6512:ba5:b0:543:9a61:a2e5 with SMTP id 2adb3069b0e04-54838ef78cemr1638320e87.23.1740153131920;
        Fri, 21 Feb 2025 07:52:11 -0800 (PST)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00--782.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::782])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54816a55851sm287643e87.27.2025.02.21.07.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 07:52:10 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 21 Feb 2025 17:52:04 +0200
Subject: [PATCH v3 6/8] PCI: dwc: pcie-qcom-ep: enable EP support for
 SAR2130P
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-sar2130p-pci-v3-6-61a0fdfb75b4@linaro.org>
References: <20250221-sar2130p-pci-v3-0-61a0fdfb75b4@linaro.org>
In-Reply-To: <20250221-sar2130p-pci-v3-0-61a0fdfb75b4@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=992;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=r63bMyziS5VAUoRIbBTBNVf6CyjstQjiNuFZTwV1jAY=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnuKEiMghTZnHdd+xhyWX15/p0yt7X2L/g3fJVA
 V474rUbS7qJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZ7ihIgAKCRAU23LtvoBl
 uIedEACmYKkrGylvmir9udVstpPuKUV6LsfVVylxsAMVdyVj2j4C75HKY5dilcPrULL2IuHR/TO
 hvBxPXwExZ2hAvCSw9IaHCsOGScC4PqHdSYyhRIJn3/qkoRw6HI4qm6TyrLOFLYj7iVAxPUL9c+
 jSqTvqDMHskwYt0fhvzMi7aRPFaT0UJWw9fBEZq9oUczMq0lv7sx92Ut6MukjNqmxjHhOiRBzu4
 uVWMW9TI457V8tqTxz64/PTMpZnECv8oz734AEcAnrfpuSf5yqhEfwWclz6z2IhV0p7yCmoawEm
 h+aBT/ouSAx3FXgOcUaWkCHuVjKI/Bk5auAPcjvCqfKyzRlBsqrnkifoqkLNGDf4mMNcLjEeYO0
 Iwj72vp6yWKBz84VzmmvoWYkmcfjW3lxy3JNSgGpqs28bhL7JcNkeSrrdbLYryyAM2CUhq75FtV
 6PPPqVcv0pwz/XiC5mAX3BP3LXgB8tt1Dhwqf8ico9vtIacs+teN0SCJyoPvMMd6lRhM91V7XD4
 3FvqVdgJxhmrQAQGdwnJlVlaaxDxmPwgGiqM7++XoYaWS/1Bo9jZM/BiRrusMLeFEqgvOWmPsEv
 HHGIysIJTlwbnTBYJ9xQXrjtfGQ/COARIc8Eogn/cem2UVYSEgEAkWALxzcnVPbLQM+PdbTp/i0
 y2F1AHp83SBR4BA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Enable PCIe endpoint support for the Qualcomm SAR2130P platform. It is
impossible to use fallback compatible to any other platform since
SAR2130P uses slightly different set of clocks.

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


