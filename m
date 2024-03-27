Return-Path: <linux-arm-msm+bounces-15459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5549388EF80
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Mar 2024 20:49:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A6557B25BB4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Mar 2024 19:49:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D522A152DF8;
	Wed, 27 Mar 2024 19:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mniBoz6B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A02152525
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Mar 2024 19:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711568963; cv=none; b=usZbOLJx72DZxTj40R7AuiIDaiqzXZG9/WRCDwUBlxOvbdgtF9hMqs0NgUSKy06TO9Y3qsbsz6vzAgPN9m9oL2L/25XX+ap8HwHBLruZM2FAQieOdyWBhkzXfO+p+bRkyXOXyDn6T/Oqgro19UJFIGYqDMupv9xDg6FSFb0eWW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711568963; c=relaxed/simple;
	bh=hyb4nCa6GTMXIPIyyPkfmWSqe8vLXeZZGANtO8EElCw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KLjiP6RRELjdvYNbxi4V4SVvbzZYFdii8KFBPEPqwIMVg5iWVlXbPGeI3IN5NHJajT8iQzlGUuJ6Raa0H5QA+vtAAEosHTTEKNEpxydWv+QM1bIHkzVIcIy+Chb8c3lbjNnDoR51apygnUsfjrfGmMMjGvQ5M6d5/K/422BCh+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mniBoz6B; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a44ad785a44so20355966b.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Mar 2024 12:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711568959; x=1712173759; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GdrCqRLP6ya3YQbbJc1fh8/e8plc2dNTz1EytkeTGUo=;
        b=mniBoz6BmFX5d3mVojNZTF5eGgvVX/AYT+OWwJ8i9sAQYh8XEQcEB7TnKu+IURBbzE
         RGAWBVgxkz+Y3i5QyDoMCCsFhCu/TCAogYy7UsDJHTv1RSSij/tNEHZlGXQyubjH4W34
         W89cmMsZIwv8XmXT1kRSizpj0Sp6UNtK4hCVmugvJL+z1KjcmJmx7MRw3DEwrpuIKNjm
         q2pi5oaSw3n7YtWmt84uNpU3ImNX7doQ5y8sLpH0hq56QF/gNm6JGYrEvm+2Vr2DpEUf
         Vrrr4L78hCU2imhVir/oFdborebY+6bdPWhyxXYzFW+Tzvoi+WGMSkpER0sE0Mzy3RIO
         B7PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711568959; x=1712173759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GdrCqRLP6ya3YQbbJc1fh8/e8plc2dNTz1EytkeTGUo=;
        b=VYqh/mLr4XI0HrKCf54oIMfSCmStWRccQz4iLR60dIbFQayUvcBBuOMXtijdhMXWZ3
         D/52IJmD9qL6j0aInBGrlAFNCYMkrWe/dzktVBLJ/l+nZwj44AtAxhBORjXI30ew4KgL
         7wfDSFjS34cp8gwdZTb0u6zn3Rcmg+6RNShIG5o/lq+turofHCxQWKFp5lcZ12abZ/uy
         20Vj387ppTzZFlynTDZHhf7Dsx6SDNRhSctjmEYK/QICXIvPi+XiVD+uml9oXT6BWZ2g
         LP+WBXCB73yQ7VGqBvYYcajxAlnURQ8YHAPz3xYX/ElfC2KMCRlSj2pHRwjJKDpVMcPm
         rIAA==
X-Gm-Message-State: AOJu0YyeSTcofpNQo7kBtVhEkJcSjSqFpHOieW7SE+3aysBncWgys2jE
	7hlOq8My1Wx6FAgNPR1oByH1sL+Vs4hjsE2H477FyY1kInORDYQMJAKkLcknYXg=
X-Google-Smtp-Source: AGHT+IFnvUvd9ydbURWEPMMMQv6qbs/kiHTgw2uCBsHIki5jSRIBmRQIpWE9Gl9Pzn60TtlBl19Jww==
X-Received: by 2002:a17:906:4ac9:b0:a47:3def:c69c with SMTP id u9-20020a1709064ac900b00a473defc69cmr328201ejt.72.1711568958983;
        Wed, 27 Mar 2024 12:49:18 -0700 (PDT)
Received: from [192.168.92.47] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id jw22-20020a170906e95600b00a4e0ce293cfsm582147ejb.41.2024.03.27.12.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 12:49:18 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 27 Mar 2024 20:49:08 +0100
Subject: [PATCH v3 1/2] PCI: qcom: reshuffle reset logic in 2_7_0 .init
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240210-topic-8280_pcie-v3-1-ee7af6f892a0@linaro.org>
References: <20240210-topic-8280_pcie-v3-0-ee7af6f892a0@linaro.org>
In-Reply-To: <20240210-topic-8280_pcie-v3-0-ee7af6f892a0@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711568954; l=2316;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=hyb4nCa6GTMXIPIyyPkfmWSqe8vLXeZZGANtO8EElCw=;
 b=TcE5CbT27TtAWe/BmUFQbK3BjNiQEFILDDS4t6vkzOk3J7hlh17vlzfod6hROAC+Wk/dRSE8S
 uQUmuUGTlvBD0lRIkW8HJ8gurJkmolyVKDSIfUWQdutyoQGzWP78/Yo
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

At least on SC8280XP, if the PCIe reset is asserted, the corresponding
AUX_CLK will be stuck at 'off'. This has not been an issue so far,
since the reset is both left de-asserted by the previous boot stages
and the driver only toggles it briefly in .init.

As part of the upcoming suspend procedure however, the reset will be
held asserted.

Assert the reset (which may end up being a NOP in some cases) and
de-assert it back *before* turning on the clocks in preparation for
introducing RC powerdown and reinitialization.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 14772edcf0d3..d875a9b2b7be 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -925,27 +925,27 @@ static int qcom_pcie_init_2_7_0(struct qcom_pcie *pcie)
 		return ret;
 	}
 
-	ret = clk_bulk_prepare_enable(res->num_clks, res->clks);
-	if (ret < 0)
-		goto err_disable_regulators;
-
+	/* Assert the reset to hold the RC in a known state */
 	ret = reset_control_assert(res->rst);
 	if (ret) {
 		dev_err(dev, "reset assert failed (%d)\n", ret);
-		goto err_disable_clocks;
+		goto err_disable_regulators;
 	}
-
 	usleep_range(1000, 1500);
 
+	/* GCC_PCIE_n_AUX_CLK won't come up if the reset is asserted */
 	ret = reset_control_deassert(res->rst);
 	if (ret) {
 		dev_err(dev, "reset deassert failed (%d)\n", ret);
-		goto err_disable_clocks;
+		goto err_disable_regulators;
 	}
-
 	/* Wait for reset to complete, required on SM8450 */
 	usleep_range(1000, 1500);
 
+	ret = clk_bulk_prepare_enable(res->num_clks, res->clks);
+	if (ret < 0)
+		goto err_disable_regulators;
+
 	/* configure PCIe to RC mode */
 	writel(DEVICE_TYPE_RC, pcie->parf + PARF_DEVICE_TYPE);
 
@@ -976,8 +976,6 @@ static int qcom_pcie_init_2_7_0(struct qcom_pcie *pcie)
 	writel(val, pcie->parf + PARF_AXI_MSTR_WR_ADDR_HALT_V2);
 
 	return 0;
-err_disable_clocks:
-	clk_bulk_disable_unprepare(res->num_clks, res->clks);
 err_disable_regulators:
 	regulator_bulk_disable(ARRAY_SIZE(res->supplies), res->supplies);
 

-- 
2.44.0


