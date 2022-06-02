Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB2EC53B413
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jun 2022 09:09:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231574AbiFBHJd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jun 2022 03:09:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231578AbiFBHJ1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jun 2022 03:09:27 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C26911A2C
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jun 2022 00:09:24 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id y32so6385778lfa.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jun 2022 00:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ggm8dWwn5n77WnxXMd/mDAhNCR7LWkn6U+IjNJRGUe8=;
        b=R7o0vs0vgZ5K+zF03ljsPHwO+/UmM03P3aXFYm9vweKxlMnmQfh5YMQKPGjZeD3pSr
         HBOSciK5cW6Fy4SeaPdhSXclEBi8SlKL7sTpEkh4a9+YNYf27w9IXIrSleguJ0WvzyvQ
         D7S4oKKd/DDEecMo/vd10St92rV/KdN6lXkuLuzHj0HdG2sVaL7F85wXnyCMAuEjYPlK
         1iAhrnn9fTxCkAoZUQZnx2RKyleXdu/7YiSZtcc/DKVB1ZYyIeeHyw+aNKudjadcOXoT
         9h91TSKeIRNEF5y4bsqI9wyTnI0zdHns3a3X1QunlHt3uEQN5OeKvKS71xw/6HaoB6Pv
         YFHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ggm8dWwn5n77WnxXMd/mDAhNCR7LWkn6U+IjNJRGUe8=;
        b=qGhJpEE+aiQvzdcUZFnmh82NUElO+22QH56VKyY0KlF4RH/3ppqeKLe57U4HD8FuUH
         QCBW03rnsq+Yx6jxt1zT1nqRY/ELn39q9V0xVn6uNoXcYVjzJAn6cPO4LjeLaitWjLuu
         +UHWKb+rSYfSAhK40CZFtfo8yz2leaImfQTNmDwnXCUq++xOMTmlXvHQ9ifK0VLxRd58
         OAar7xA1se+8gMMmJmxTSmQZoz6vWpd8R0KrTdocY9gH78j9ck5zyLwSqCxxoT5OfN2w
         bc3JQWnZhIb0XdwWMGQ+EXMYAmpc1tIE9FxeApQKPsnhwDN1c3n2Zzuz57P35vcOCTco
         VKYw==
X-Gm-Message-State: AOAM532dPhYoeiX1X5gEfL+ZyuBt+sJr8VZ+zfCRQhkeE/QkqpNzs6h0
        Zb6Q7VpmbwCvySwZLeVTShsfo4kSbn9Wbeoi
X-Google-Smtp-Source: ABdhPJxSiJQAWZgB9U27d9V54c8sjMGlX/4SU2bKIzeqAdXgJCmIRP9ngvUYd6KdlaiXDiBc0WpzkQ==
X-Received: by 2002:a05:6512:545:b0:479:b15:6671 with SMTP id h5-20020a056512054500b004790b156671mr2500660lfl.579.1654153762374;
        Thu, 02 Jun 2022 00:09:22 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d25-20020a056512369900b0047255d21114sm870218lfs.67.2022.06.02.00.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 00:09:21 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [RFC PATCH v3 12/30] phy: qcom-qmp: switch to new split QMP PHY driver
Date:   Thu,  2 Jun 2022 10:08:51 +0300
Message-Id: <20220602070909.1666068-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220602070909.1666068-1-dmitry.baryshkov@linaro.org>
References: <20220602070909.1666068-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use new split QMP PHY driver and remove all monolith phy-qcom-qmp
driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/Makefile | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
index e9e3b1a4dbb0..65f6c30a3e93 100644
--- a/drivers/phy/qualcomm/Makefile
+++ b/drivers/phy/qualcomm/Makefile
@@ -5,7 +5,13 @@ obj-$(CONFIG_PHY_QCOM_EDP)		+= phy-qcom-edp.o
 obj-$(CONFIG_PHY_QCOM_IPQ4019_USB)	+= phy-qcom-ipq4019-usb.o
 obj-$(CONFIG_PHY_QCOM_IPQ806X_SATA)	+= phy-qcom-ipq806x-sata.o
 obj-$(CONFIG_PHY_QCOM_PCIE2)		+= phy-qcom-pcie2.o
-obj-$(CONFIG_PHY_QCOM_QMP)		+= phy-qcom-qmp.o
+obj-$(CONFIG_PHY_QCOM_QMP)		+= \
+	phy-qcom-qmp-combo.o \
+	phy-qcom-qmp-pcie.o \
+	phy-qcom-qmp-pcie-msm8996.o \
+	phy-qcom-qmp-ufs.o \
+	phy-qcom-qmp-usb.o
+
 obj-$(CONFIG_PHY_QCOM_QUSB2)		+= phy-qcom-qusb2.o
 obj-$(CONFIG_PHY_QCOM_USB_HS) 		+= phy-qcom-usb-hs.o
 obj-$(CONFIG_PHY_QCOM_USB_HSIC) 	+= phy-qcom-usb-hsic.o
-- 
2.35.1

