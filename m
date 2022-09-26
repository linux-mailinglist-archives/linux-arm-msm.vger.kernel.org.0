Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CF3A5EAED6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Sep 2022 19:57:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231308AbiIZR5g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Sep 2022 13:57:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229819AbiIZR5G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Sep 2022 13:57:06 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D25854D17C
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 10:34:42 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id x29so8307114ljq.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 10:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=3e3cQ74Y/JA5vVePYbQS/YusMBYX3fuhrdntX7uBS3U=;
        b=tmyP53QUXFzOp9SLY1CoGF+hY1IeGXbhzqP9dn2Qvm7k+SKowB2uBjxUiljWOuTrq1
         LZcvdrxufduLaTwXpTDOmuhWrzK3fk6wOmAi2Stfdo+4ZikMyg0SU3wGcIVWyYDGIfjE
         rACcJEzkQippph2lqQcSBxGnZklpqCPaGA60LpM2jgblD2cIaELVPVVo6V3He9lnaXk4
         l4EoDHKvkj52rsEaoCwS3Q56LV4sgQw9+qOLPqVT4e7YGtP4RN2oj5ms3fB5xJ1hdkwG
         429xQL/j23Oexxu+074VHCisu91237kfMNCFqgU6LODRQFuVhpXkm83UswtC9u10mnrB
         Aewg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=3e3cQ74Y/JA5vVePYbQS/YusMBYX3fuhrdntX7uBS3U=;
        b=xCxvZ5wPXnrrg3Ii60ORgKW7PFC0AqyLwmZ826m57AbZ35D+iNAjx6TV5Ac0SZrlad
         o3QABHDCSFatLg+qmb/JQJM8eDeuShJBTHFBNtmv6hm6CbwUZAPvsFG24RI5yQIiLY/C
         SKL/ki7KH7fIA4jG6LrJl+UfPFmkAJ2IswKNDbtIc9SQKd4ozMw21ttQPRM481va0mDk
         +t8iiF5EbKJsmehRLAlm0FrNifyyMGGZgOhNhREAPaiYtTL76y3a7lzScvk8PtVZ+we3
         WkSw2RGLuCKkSIS535Nheh76YONgZ13XER6kx3rpNwds+ZElXBSYt/Br++PjMjsXea8k
         2McA==
X-Gm-Message-State: ACrzQf3ha8Sw3auhmdTVJeHTHYafZ8zhiHvfXA3zvuskvExd2efymffW
        jNBlihnXhnQ0q9V2Z8VRJQjBVw==
X-Google-Smtp-Source: AMsMyM5hNPwJODDaBww/H/VnqGj2ast7kHgpwgltri59XzriXHUkEQhqnYIlplq8QvivFpiSsC35Nw==
X-Received: by 2002:a05:651c:b08:b0:26c:6911:4e37 with SMTP id b8-20020a05651c0b0800b0026c69114e37mr7917669ljr.336.1664213680686;
        Mon, 26 Sep 2022 10:34:40 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v8-20020a2ea448000000b0026ad1da0dc3sm2402640ljn.122.2022.09.26.10.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 10:34:40 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v5 4/5] PCI: qcom: Setup PHY to work in RC mode
Date:   Mon, 26 Sep 2022 20:34:34 +0300
Message-Id: <20220926173435.881688-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220926173435.881688-1-dmitry.baryshkov@linaro.org>
References: <20220926173435.881688-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Call phy_set_mode_ext() to notify the PHY driver that the PHY is being
used in the RC mode.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 66886dc6e777..1027281bd6ff 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -22,6 +22,7 @@
 #include <linux/pci.h>
 #include <linux/pm_runtime.h>
 #include <linux/platform_device.h>
+#include <linux/phy/pcie.h>
 #include <linux/phy/phy.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
@@ -1494,6 +1495,10 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
 	if (ret)
 		return ret;
 
+	ret = phy_set_mode_ext(pcie->phy, PHY_MODE_PCIE, PHY_MODE_PCIE_RC);
+	if (ret)
+		goto err_deinit;
+
 	ret = phy_power_on(pcie->phy);
 	if (ret)
 		goto err_deinit;
-- 
2.35.1

