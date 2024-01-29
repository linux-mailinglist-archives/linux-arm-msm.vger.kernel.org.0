Return-Path: <linux-arm-msm+bounces-8823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C876784038F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jan 2024 12:11:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06D131C21A03
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jan 2024 11:11:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 707015FEE5;
	Mon, 29 Jan 2024 11:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B8SklICA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A012C5C8E9
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jan 2024 11:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706526643; cv=none; b=UPxIhVEToirIAU2r1lfZOyq56yMkFYfvsKtxWd8d39D6NFJBgIrNYNNFEWvJdQXJLyIkv3xTrpa/y+KSSnKYw+Kdr/kYH2ceek6I1HA5YG3CyD0MS//0lf8F2FYdd+7F9U5kz72RoOLzapp47wTm5xxBJ7GXT3rW5bB9yb8HsYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706526643; c=relaxed/simple;
	bh=8EuammNvz7q0zLsv/fNHGrCFJkNOTUOv7xYPFDSydtM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j6VZV+pdQ6Tan/f+RXDW16YulvPOzAwEPyxvZLYtA8Wky1Z2w5G53bfd1nVf7+w1Lpt0wlbeAe467VxYij2QE31YObfa9GND4u7/qcOOy40Kzj3FLQA1N+0PtkPoONqdqqSpt4zAV9yXl193OkZrEaMBIxgjGa8nw8pukXfjDjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B8SklICA; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a35b32bd055so96547266b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jan 2024 03:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706526640; x=1707131440; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L2ZdJpKQBRnfaS4iSb7zJfUhDZu3ZFuYALkM/QlvKws=;
        b=B8SklICAx022Lv67Iee5iVyJGekUI4syUq71fUgaHDz8hjReFC3BIQIIdx8f8CONQk
         OFZj02JEf1Acn0yVFpasAxp9VfWOEoAFlIWS1l1+5rhBdr83NlcIjXJMUxfH9V+SNuph
         CK5gdxDPwOO9rc7yeahpryZM4/NlQXnjIsIbQ7n7AOaSj4orzDVC2XweqWuCHZ+l+gd5
         oUv7KomaqjW8NLTRvLePSzR9Y1sHItZOz/LsTXyQlQIJtIkscCgnzoJtBfPcvg+Zsz32
         wHWE4AG8o0MqFydu1j0X7ux1P9qJpNbT0TLkuBZxR5bI2MDBbn3UnogQMkKHsISCnNQY
         sePQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706526640; x=1707131440;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L2ZdJpKQBRnfaS4iSb7zJfUhDZu3ZFuYALkM/QlvKws=;
        b=XYM5bMC9mvVNi/V6HtTTz4xzZY7ttWEhzddtw/7YujbyCM2Hq/wRUBvYFVwuw75aPn
         kITy1Sky6h+nXdTDJD5mx97eBoPsjIIt5YZfqQAwjrrq+Dil/acRESMOd7+hoSIa6V8X
         CfnWdutU4ShAU3P9NBzTug0KWB4htjtMV+GwMyOrjVN40CwfOw7YGdLNIDSW+tv1derl
         Z74BlHY8ktGI7RYa1OzE/Z9D97ibrMrq57/mj0LBKa34FowkcUrdSQjA8VjBYQor1JbJ
         LvD/jBbcI5yabwNEWH9zikOsZxSPWD4RZsKHCw2TYyGtdBM6797KoUFDla98MPjvd991
         +L8Q==
X-Gm-Message-State: AOJu0YxFP961wxxnkxwbzuKZ1XbPomuou35WPaoiz25ngF9QqIo84LAd
	n0JhYWEmBBmIrtqXOlDapUc878GXDN2Jr64KVkowEZ0KXYlS5OjBos0836uurDU=
X-Google-Smtp-Source: AGHT+IGAZENcpm/0S5OSxltI6B5d6wcqy/QdB1c3/GHjkwf4bfaL0FekpPfwhxKE5akGn5ihpxauIw==
X-Received: by 2002:a17:906:71db:b0:a27:9bb7:622c with SMTP id i27-20020a17090671db00b00a279bb7622cmr3714658ejk.63.1706526639767;
        Mon, 29 Jan 2024 03:10:39 -0800 (PST)
Received: from [127.0.1.1] ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id tj4-20020a170907c24400b00a352f7a57a4sm2934620ejc.178.2024.01.29.03.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 03:10:39 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Mon, 29 Jan 2024 13:10:27 +0200
Subject: [PATCH v2 2/2] PCI: qcom: Add X1E80100 PCIe support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240129-x1e80100-pci-v2-2-a466d10685b6@linaro.org>
References: <20240129-x1e80100-pci-v2-0-a466d10685b6@linaro.org>
In-Reply-To: <20240129-x1e80100-pci-v2-0-a466d10685b6@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=785; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=8EuammNvz7q0zLsv/fNHGrCFJkNOTUOv7xYPFDSydtM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlt4er8jIwuUe3lH5Fd/YkeceijfJtwLD8JEWgT
 IO95XM3TAyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZbeHqwAKCRAbX0TJAJUV
 Vj8AD/90UMoF2ZHpC0USCER/mY8HfUzShRLdnodKJERNlQD2yHvIqJZydsbeQ3mvURuo65EmmjE
 rca2HUmjKTT8omc6Mp2oA/Pqn4LgCGpxXmLvcFljCzIqylEsAigK4g2GN7WFtH50gnXhqheSJrn
 u1whlX6w1M5kEr2IVGsgcTaH6CNH8RqDALJJFLsjUyGa4zk5hUgoVjUkHN6hQONQL7Dk9fNa7D1
 Lc5lDS/JiCDOEbzlNfuVJht2DGAFCqVtpODgOERDTjhdIsSVSh+m3enGCZo6KuuIAdhi3LI18tO
 6bmPlelwPeLcx1FREip6DK/5C9JjqlRON9rpGLbQhzCiLUalET1WHsbkG56wQLS8gAj906lg6k6
 J2ji2bqbuCw1v8VZRCHlyUGmfUpfNxqGwx4VVLG2pJZimoR82DyVmpNwnFkbfl02e2fxkDGUjnf
 KPiHAPi9exFnKKUILyGxQoI6MeBUeSR9Gu+aLoUY5GBHcC283Mi/fzm/UkNm/CXHhtV69PTVoR+
 ZizJyptcXs25iXpQst7NiU5qbm9Tl5C4za9B7dbf5Sz2XkglRmpkURfTIbyOcQ3TzO5CraPR4x8
 AyPE8p+JuWy7CITDG8T43RfoLGofVn90aqFEk6Sp+UIwbGjK31TAlz3Gl7PhyP5pACrf0WOheNQ
 MFouH6u5MK0Aw9Q==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Add the compatible and the driver data for X1E80100.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 10f2d0bb86be..2a6000e457bc 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1642,6 +1642,7 @@ static const struct of_device_id qcom_pcie_match[] = {
 	{ .compatible = "qcom,pcie-sm8450-pcie0", .data = &cfg_1_9_0 },
 	{ .compatible = "qcom,pcie-sm8450-pcie1", .data = &cfg_1_9_0 },
 	{ .compatible = "qcom,pcie-sm8550", .data = &cfg_1_9_0 },
+	{ .compatible = "qcom,pcie-x1e80100", .data = &cfg_1_9_0 },
 	{ }
 };
 

-- 
2.34.1


