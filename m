Return-Path: <linux-arm-msm+bounces-8082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7F483A313
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jan 2024 08:38:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34FB7284D68
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jan 2024 07:38:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BF06168DF;
	Wed, 24 Jan 2024 07:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bOiVoWCP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF97B179A1
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jan 2024 07:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706081837; cv=none; b=Ew9PnsUn1uKQjOkxN7/XJ6Jt0VV17Rq+MOc8/2OdYS0+XbOv+StY20BWBx64N8M8zGE9z+O5+/zPWv7OOtqbeuLgJsEXPQ5CvI34TvDzKtoHiZ3JmcBlFdlaAQJ9WK+oyRarvsGW4IeF97QGYbqyWRVRlyafAuNrFjHDUVaW5JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706081837; c=relaxed/simple;
	bh=zeX+jh65HInrDo/RwQDt8aTaE8xiSCz2Utb21fD2lmY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iWTVx7Myd0kYy6Mk1b0hNhjH6F5U5BubhvyIEr9YRGmc4S/YcBIxNd02GeombzpDFYgCh7TKK8fDdsD1RPxunO3mm3YU6P9/S8x6pZId2GWlwDBNqgeGh6L6pyRmm6xMjE2eGeNisIINwKlvMPdXIQyOcPqGmByIVUq3D7ADcgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bOiVoWCP; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1d71e24845aso29723135ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 23:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706081835; x=1706686635; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CNpTFIF16BG7YGRQCCrKfm7GwY9WoZx+GmuixbAdH6M=;
        b=bOiVoWCP5ubGhCirCyhK2VBjJs1q9w/iFJmT16KGM4cc3NRRs5ADyBj8MgErfV8Qo+
         fwu6A0je3kLLYvhXrMnwT0xxSoIF45G3iFZb8WrBB9InAZL2yfTPUHf0MUwc9Q95DO40
         Ieat7EVDu655j+DbRykBg796e6u2ADr+IhGD2BcnMZVMVGSn/GwNN96+xsFBW/nvw2MX
         PAPHUtEkd7XR93qwsKfv6fmD77GA6MfGKFoBxfNtIxt8UVVVV6FOzLJRbNHZUuNvs2/t
         cC2zQlUNnllMGCLJgnLFdQbPqTDNyS5cInjiz5r8SuBEypHzbmJp8YTbqkhycqb5iR/i
         84ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706081835; x=1706686635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CNpTFIF16BG7YGRQCCrKfm7GwY9WoZx+GmuixbAdH6M=;
        b=DXYQVDcmM3LX9o6tLEpJM3/L4JalM0eKE0Sj3oyiKxOXg5Cc4kcFfWQ8CYeqC2ZmvQ
         7nRutxNL10x56zCDNhqyuoPHX9jutFEA0kg/uG5ycVYAzvwCsegaP/l+hiDnQn1GQrKJ
         k/WIL+UwrbPSQz6hT9FnvzuIZT/3H3fl8hVR15VLS8uGA0bqTGzFwtdXGyBaedCmE3rP
         ayBpht7EbCNNgpUfTLg7cTK0gLjCmD0GHWOY7Xv12dPJ9QBjAKL0XpZ02q0vEnRMKgGr
         neKJY5qFCOIPJFaTKRv9gtRYNgu8TIDy5O5SB3FGENjFLIVXM+bms9B/dN9D0FMBm6y1
         66sA==
X-Gm-Message-State: AOJu0YyM+RS0sotCXM4gvU9svASWHLGn5wJlT9a6ITu00d8nr2f27O9V
	dGYlVlmKkH2lnKX3jDY1NfwUYLIw1AUx0z/BXeUo6F+seUDBnMXsTgCh1Mj/EA==
X-Google-Smtp-Source: AGHT+IE3jPeSwyuGuMyRlRHopR8kJWwDY/R6l4wnlHb2ZcILwydWkelUDnM75QY0zsO1jxoWEPgN7g==
X-Received: by 2002:a17:902:e802:b0:1d7:6f5a:d390 with SMTP id u2-20020a170902e80200b001d76f5ad390mr360391plg.55.1706081835084;
        Tue, 23 Jan 2024 23:37:15 -0800 (PST)
Received: from [127.0.1.1] ([117.217.189.109])
        by smtp.gmail.com with ESMTPSA id t3-20020a170902b20300b001d726d9f591sm7386982plr.196.2024.01.23.23.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 23:37:14 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Wed, 24 Jan 2024 13:06:34 +0530
Subject: [PATCH 06/14] phy: qcom: qmp-pcie: Add a new compatible for SC7280
 SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240124-pcie-aux-clk-fix-v1-6-d8a4852b6ba6@linaro.org>
References: <20240124-pcie-aux-clk-fix-v1-0-d8a4852b6ba6@linaro.org>
In-Reply-To: <20240124-pcie-aux-clk-fix-v1-0-d8a4852b6ba6@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=941;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=zeX+jh65HInrDo/RwQDt8aTaE8xiSCz2Utb21fD2lmY=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBlsL4DPIrhoZpasm0P2lW3phBrp9L8uQenezf2i
 GE6tEIxzAGJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZbC+AwAKCRBVnxHm/pHO
 9ei7B/9RToHX5l2RmHvp4lJTQYUyyAWAKvGhetr7g8UkSowxxLzt9SI0p28kQVEWSeR5q2TlaOE
 fAwneBwub3bWVMESD+kmppRH5QblNn09PQHyw0yHQat1Zd73WI+qADs5cH6epiSkGxXnbOleJKN
 lD7oo9jgQ2AXnpVt7PU+dKYjgWakTEGwoXwX+Uv3FgbQnU8UonNs/7al7khJ2BPIXIuqUUw8iz5
 vBX8JYDX6nDOW7ER8lYt7R9Ku47EUof15a3zXe1K5et4wHusFYsAt5jKx6XgSzZg7Bx4fjR3YSn
 bUmZ7IF5jCwOuX+6J21ks3UoA4mLdVR8pqbmT5zUMCSxYKfb
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

Since this platform requires different clocks compared to SM8250, use a
different compatible. But the drvdata of SM8250 can be reused safely.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 2af7115ef968..9a220cbd9615 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -3822,6 +3822,9 @@ static const struct of_device_id qmp_pcie_of_match_table[] = {
 	}, {
 		.compatible = "qcom,sa8775p-qmp-gen4x4-pcie-phy",
 		.data = &sa8775p_qmp_gen4x4_pciephy_cfg,
+	}, {
+		.compatible = "qcom,sc7280-qmp-pcie-phy",
+		.data = &sm8250_qmp_gen3x2_pciephy_cfg,
 	}, {
 		.compatible = "qcom,sc8180x-qmp-pcie-phy",
 		.data = &sc8180x_pciephy_cfg,

-- 
2.25.1


