Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FEC93EE1A2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Aug 2021 02:56:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236873AbhHQA4Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Aug 2021 20:56:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236773AbhHQA4K (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Aug 2021 20:56:10 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5080C0619F6
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Aug 2021 17:55:25 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id y6so13343160lje.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Aug 2021 17:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TpzWYLTlVm4a1u+cpDX/DibFOc/Y83As8pftjQgWXKY=;
        b=q9pVfUjjkZl1dsYvBgGfBt7HOGtu8qETGZwnHj79FxZbGPuB6WTuhL+bUDVxMkCegv
         WEQR1iewhQkT/FqzCRDxANG/lounhB5oawM+/8Wvjz87lWryGQuJU1Ie+0L8IS/wI9xd
         6MQqcTbuWam46/QnO7n0r47+m4ZYylm/I0O1HTHqkqs/KB85IKXpeGKM+en0wo82yZ/W
         +wePJePJbzKU5tK97xy6yr5AwOC5V53tgIhaJs1E6spLUJAM9eiDG+8iQodQveBAnmPE
         Cr4OTMeadYhTN6g7Gvg91Z1gyUXuIDc2CvtECs4MkTfSy29nmzr39Mte6ecmEI1CyRtK
         aeKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TpzWYLTlVm4a1u+cpDX/DibFOc/Y83As8pftjQgWXKY=;
        b=ELIhTNMgjOlzqHqSFfNIEEoUh7o8LWtkzA7KS3E9koF0eTfVDhStNZpPomvQH9ipm+
         OVaV4qp3z5gz/kI6YrFpE8RLp7gLPBqRmKBrZxCNksF40AL4GxptiEYueXnWvA+H+tht
         y5XxFtW2JVZGlt3AvxmCkFvXSrcqYeotwyHOU3m0veGKVtrClO+WpE398GuH0/R85bYq
         BnKDJzxESPVcFxkJ0NCWvYuMfh6DGN4jzYeJZJ54y/Kc8cyco/9DzSKbTwEHcbH0pfY5
         TNO42oz/ycCf1B61eALvZw6lr963S29syfu9D2uNJ03QtDCwvI2+ibpvIirNdGnJ7zBX
         QEMw==
X-Gm-Message-State: AOAM531fcviLAUelQ4kplzrMGawaxyS3AeR1ee3LZcU07RA6FXF/8WJk
        oFhTnHWWuhChu2C+2YvpLnrD8A==
X-Google-Smtp-Source: ABdhPJzVEZqzzw5axwOZZ57yFH4IQjnro9z1ocsbY1Qd55La4H98eGgaiJDN30TJHy6/Q48qtg1yYw==
X-Received: by 2002:a05:651c:1142:: with SMTP id h2mr776331ljo.289.1629161724341;
        Mon, 16 Aug 2021 17:55:24 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id z6sm40719lfb.251.2021.08.16.17.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 17:55:24 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Kalle Valo <kvalo@codeaurora.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
        netdev@vger.kernel.org
Subject: [RFC PATCH 14/15] WIP: PCI: qcom: use pwrseq to power up bus devices
Date:   Tue, 17 Aug 2021 03:55:06 +0300
Message-Id: <20210817005507.1507580-15-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210817005507.1507580-1-dmitry.baryshkov@linaro.org>
References: <20210817005507.1507580-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use bus-pwrseq device tree node to power up the devices on the bus. This
is to be rewritten with the proper code parsing the device tree and
powering up individual devices.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 13 +++++++++++++
 drivers/power/pwrseq/pwrseq_qca.c      |  1 +
 2 files changed, 14 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 8a7a300163e5..a60d41fbcd6f 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -23,6 +23,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/platform_device.h>
 #include <linux/phy/phy.h>
+#include <linux/pwrseq/consumer.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
@@ -1467,6 +1468,7 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 	struct pcie_port *pp;
 	struct dw_pcie *pci;
 	struct qcom_pcie *pcie;
+	struct pwrseq *pwrseq;
 	int ret;
 
 	pcie = devm_kzalloc(dev, sizeof(*pcie), GFP_KERNEL);
@@ -1520,6 +1522,17 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 
 	pp->ops = &qcom_pcie_dw_ops;
 
+	pwrseq = devm_pwrseq_get_optional(dev, "bus");
+	if (IS_ERR(pwrseq)) {
+		ret = PTR_ERR(pwrseq);
+		goto err_pm_runtime_put;
+	}
+	if (pwrseq) {
+		ret = pwrseq_full_power_on(pwrseq);
+		if (ret)
+			goto err_pm_runtime_put;
+	}
+
 	ret = phy_init(pcie->phy);
 	if (ret) {
 		pm_runtime_disable(&pdev->dev);
diff --git a/drivers/power/pwrseq/pwrseq_qca.c b/drivers/power/pwrseq/pwrseq_qca.c
index 3421a4821126..4107f0a9c05d 100644
--- a/drivers/power/pwrseq/pwrseq_qca.c
+++ b/drivers/power/pwrseq/pwrseq_qca.c
@@ -1,3 +1,4 @@
+#define DEBUG
 // SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright (c) 2021, Linaro Ltd.
-- 
2.30.2

