Return-Path: <linux-arm-msm+bounces-25514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F2B92A8A5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 20:06:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5AF59281AF0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 18:06:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40297148FFC;
	Mon,  8 Jul 2024 18:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KeaLQbf2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C449214A619
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jul 2024 18:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720461952; cv=none; b=JFDNGBGzjOEEUGkvb7i+lCOeWrx7ydTr0AxuX/1kqFRhEqZvPHHEzl6Ot7/nuayb3y/B2G2V/oxmVUrUrFbe75gfmIhSSAQv6+iWe8ZwYfQwMsvtCLCPFRf/XR5yLyE3hw0ZnrBrF662DaM82MjRhYf5WeOyw9eNHKltC4nIVS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720461952; c=relaxed/simple;
	bh=sQurFjBE9L3fAEjeupv9dzjJcGbx0I4IJJjL3X9WlHE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RB3hQRwfd9qnlsp12X37Z39RYXD5BcfHhHMbLG6sQRTqvC0eNBI++D0Q+4JXHe4aIhYLEfpP5oKo2pwAeNSOwn/qvialcE6J9/yalUmCunHeX5DtAkzfCavEey1Ye67HsBv3ViSQxKTXPLLLfOBcI4S+VCe2zBHo+bL3qpfD0rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KeaLQbf2; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6f8d0a1e500so3918370a34.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jul 2024 11:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720461950; x=1721066750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qYngg2/AvD5ABD/9akPCHM96QJ+CMJBmjqIZiNK6u3U=;
        b=KeaLQbf268m2mnCh//+CQ1tbqfpeXynd5ZCLBgYHjLnUM5GzEJonArueM+iKZH184s
         Q1AmcFw9bP/eZZv5vKZ6mC8NuUUniwA/VT/WHFxAKWmBXjRq2fYKbtVYdWQQz2c+giMw
         Y0vPCnNW1PFopbFP6fhwEmvFIGMQL0YU9WUXAvSpwkRhIqyY0AMBQHGj/gI1HktKtYLU
         SqFSwrCLCG2FP6uJV78fNnsKvq8RgE5nT8vB92GgBiaYRgwfqn4qTOATCSommvZ/XtAH
         LX4lHySvrtArDPdmzcBPo5QDBIkBBLUWHnC9Ufb8ftEw0qWKLIrRcLr7kOd2H2oHrAWK
         v/XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720461950; x=1721066750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qYngg2/AvD5ABD/9akPCHM96QJ+CMJBmjqIZiNK6u3U=;
        b=P3KEDve8hOnFoxBI/F+z5qdLY42/4tL4T7rkVJDZevCXdh7vViePXWo2Ouc1FYhH6O
         SqXlkoIlkw56nZNEHKZDSNbCxaazKfg89NNn/vV+Gm6oL2lbgNPZgZ7G+4Dseg9wvMQ4
         x2xOAqRKWUEZIDUewtGMOa9JTG2z/C1ObVC7sdwasdLytUylZSGzEeD7C8n3AidVg+v+
         u51sTGxVPi4Vu7BeyLOKNxEwCP0Ylbk8Q8B7bviHn3g3Q9XJHXz3LaXZFd4uckqDH5If
         rDKXf6K94hi4CzEQaoj6MAddN0WfkyTDgVJoVe2LAOzlTfDsQdiU8T9qXBVWgO8Lb8h3
         Tx5w==
X-Forwarded-Encrypted: i=1; AJvYcCXRENHQr1I4RaeyOhCIGaUfHKQuDeC6mIUJV/28kYWreYMLu3hi85G2n6ogSXTbs3/9uv9nFZLVfFc17urtrY1JHBrDziXgLydrzd9tgg==
X-Gm-Message-State: AOJu0Yx+zynmuwQs1GjyKNIjilPB+4VzJGF7aTngvv2Qfgt8SRKB19m8
	9B9ji4EPsDjJyxWq63hPUIC00E0O5wWHfq7BoSL8Ab4KUgqOW4maHc+ZDszd4rDPC/SsApqyyPI
	E
X-Google-Smtp-Source: AGHT+IFotg/OqzVapLsDoyFgjgyedblYoClmUMzMboNvrP7Hf0zFKYNPw6ZcbTQzYlbt4UCndKAUOw==
X-Received: by 2002:a05:6830:91d:b0:703:5fba:5e1a with SMTP id 46e09a7af769-70375a0512dmr309192a34.9.1720461949870;
        Mon, 08 Jul 2024 11:05:49 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:cdd0:d497:b7b2:fe])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-70374f7a2d3sm86559a34.32.2024.07.08.11.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 11:05:49 -0700 (PDT)
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Krishna chaitanya chundru <quic_krichai@quicinc.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] PCI: qcom: Potential uninitialized variable in qcom_pcie_suspend_noirq()
Date: Mon,  8 Jul 2024 13:05:38 -0500
Message-ID: <20240708180539.1447307-4-dan.carpenter@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240708180539.1447307-1-dan.carpenter@linaro.org>
References: <20240708180539.1447307-1-dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Smatch complains that "ret" could be uninitialized if "pcie->icc_mem"
is NULL and "pm_suspend_target_state == PM_SUSPEND_MEM".  Silence this
warning by initializing ret to zero.

Fixes: 78b5f6f8855e ("PCI: qcom: Add OPP support to scale performance")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index e06c4ad3a72a..74e2acf4ae11 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1633,7 +1633,7 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 static int qcom_pcie_suspend_noirq(struct device *dev)
 {
 	struct qcom_pcie *pcie = dev_get_drvdata(dev);
-	int ret;
+	int ret = 0;
 
 	/*
 	 * Set minimum bandwidth required to keep data path functional during
-- 
2.43.0


