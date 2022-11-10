Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2463624A96
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Nov 2022 20:23:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230224AbiKJTXB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Nov 2022 14:23:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230184AbiKJTXA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Nov 2022 14:23:00 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C5A842F52
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 11:22:59 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id l8so2049027ljh.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 11:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a1gdeRXCMD4G+HSEczKSTuxNPEtL/W00tRuw9hUzYKI=;
        b=bgymazws3x4oheAcwKgFE/qnAiIzb6PrxXawDSDpUvqNJApc2h3+Un3iDTupiZ/q+5
         J0Tsp5HIfM5HzTyx8O6f0IMQtgpv+HR26tESzdTfdc2t1NlL+Sahf9wjP8ePDKjr2lS6
         XE8ccT3fbqvyZS9c7SGWxwFrlqchtiVY7ZmV/cBjv5e5sLPYQADg7wdkXjOnWHGu6q/H
         Wp3PM1sVnwlyfEBHcmb36GxFLPpk27x7vij6kjIlAvqS+H3Jf1VtIQBKEycTsLsu8Kcz
         lPSV16/EgLpQEdHHFSa35Qz22RjZFtTLuWt5gmLgqpYxbRfqo7rUh9SKOXl8t0/0iYQn
         E3XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a1gdeRXCMD4G+HSEczKSTuxNPEtL/W00tRuw9hUzYKI=;
        b=WlMazPFjfQcNVIYsF4af00bcE7oAt3uP9oT42CT2qTVLNIEDBQzDBjvcgHbuVWLpSi
         uyVauXr5kPxFZTFQdq9wbbYSW5XaTcjwZOP9OjvNxEkAkJLLWIkQrLZv7iqOtUGgWa2m
         dMM1FjXHLT8uOC65mdimKsp+9QFXp7Uhg5eQYi8XaVX4jQmeXVNuH9+5e+EBkgOjQ8j1
         5o/h/g4gxsrU930Be29o34aQVqxfvf4XWlwXKIL9RTrL9JOkBNBDVEqxHMzFtCXMAsAh
         yXIOAwESjSScsoyIIINkc/ZFnSELtnMthykpcsVC9nL55uyZRd5ykVzOlBjJid8YW643
         m84A==
X-Gm-Message-State: ACrzQf3PE/M1wlL3I86gxpff8So22iQHhAgQBtNZeyyhpFejTGTv/QqD
        PJTWI6z0pYO5LOkTiBiNbFHNTg==
X-Google-Smtp-Source: AMsMyM5ajXcPPQP6552t0oVu+ptZunsUkWvEdl0O+Vur6Rv10UI4hb5EuqP87gPQSG21AJPb+mKQrg==
X-Received: by 2002:a05:651c:1304:b0:277:115a:1acb with SMTP id u4-20020a05651c130400b00277115a1acbmr9764679lja.350.1668108177927;
        Thu, 10 Nov 2022 11:22:57 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id h8-20020a05651c124800b0027758f0619fsm40345ljh.132.2022.11.10.11.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 11:22:57 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v3 13/13] phy: qcom-qmp: move type-specific headers to particular driver
Date:   Thu, 10 Nov 2022 22:22:48 +0300
Message-Id: <20221110192248.873973-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221110192248.873973-1-dmitry.baryshkov@linaro.org>
References: <20221110192248.873973-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Remove QMP PHY type-specific headers inclusion from the common header
and move them to the specific PHY drivers to cleanup the namespaces used
by different drivers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c |  3 +++
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c  |  6 ++++++
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c   |  4 ++++
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c   |  3 +++
 drivers/phy/qualcomm/phy-qcom-qmp.h       | 15 +--------------
 5 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 5e11b6a1d189..f6f6dcb8bc66 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -23,6 +23,9 @@
 #include <dt-bindings/phy/phy.h>
 
 #include "phy-qcom-qmp.h"
+#include "phy-qcom-qmp-pcs-misc-v3.h"
+#include "phy-qcom-qmp-pcs-usb-v4.h"
+#include "phy-qcom-qmp-pcs-usb-v5.h"
 
 /* QPHY_SW_RESET bit */
 #define SW_RESET				BIT(0)
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 4bab804a2ed8..783b45486788 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -26,6 +26,12 @@
 #include <dt-bindings/phy/phy.h>
 
 #include "phy-qcom-qmp.h"
+#include "phy-qcom-qmp-pcs-misc-v3.h"
+#include "phy-qcom-qmp-pcs-pcie-v4.h"
+#include "phy-qcom-qmp-pcs-pcie-v4_20.h"
+#include "phy-qcom-qmp-pcs-pcie-v5.h"
+#include "phy-qcom-qmp-pcs-pcie-v5_20.h"
+#include "phy-qcom-qmp-pcie-qhp.h"
 
 /* QPHY_SW_RESET bit */
 #define SW_RESET				BIT(0)
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index c9698e17b617..081ee526492a 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -23,6 +23,10 @@
 #include <dt-bindings/phy/phy.h>
 
 #include "phy-qcom-qmp.h"
+#include "phy-qcom-qmp-pcs-ufs-v2.h"
+#include "phy-qcom-qmp-pcs-ufs-v3.h"
+#include "phy-qcom-qmp-pcs-ufs-v4.h"
+#include "phy-qcom-qmp-pcs-ufs-v5.h"
 
 /* QPHY_SW_RESET bit */
 #define SW_RESET				BIT(0)
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index 74c04cb497f8..2d2136cb1723 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -23,6 +23,9 @@
 #include <dt-bindings/phy/phy.h>
 
 #include "phy-qcom-qmp.h"
+#include "phy-qcom-qmp-pcs-misc-v3.h"
+#include "phy-qcom-qmp-pcs-usb-v4.h"
+#include "phy-qcom-qmp-pcs-usb-v5.h"
 
 /* QPHY_SW_RESET bit */
 #define SW_RESET				BIT(0)
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index 60c52a55f119..fd99a5d02703 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -24,29 +24,16 @@
 #include "phy-qcom-qmp-qserdes-pll.h"
 
 #include "phy-qcom-qmp-pcs-v2.h"
-#include "phy-qcom-qmp-pcs-ufs-v2.h"
 
 #include "phy-qcom-qmp-pcs-v3.h"
-#include "phy-qcom-qmp-pcs-misc-v3.h"
-#include "phy-qcom-qmp-pcs-ufs-v3.h"
 
 #include "phy-qcom-qmp-pcs-v4.h"
-#include "phy-qcom-qmp-pcs-pcie-v4.h"
-#include "phy-qcom-qmp-pcs-usb-v4.h"
-#include "phy-qcom-qmp-pcs-ufs-v4.h"
 
 #include "phy-qcom-qmp-pcs-v4_20.h"
-#include "phy-qcom-qmp-pcs-pcie-v4_20.h"
 
 #include "phy-qcom-qmp-pcs-v5.h"
-#include "phy-qcom-qmp-pcs-v5_20.h"
-#include "phy-qcom-qmp-pcs-pcie-v5.h"
-#include "phy-qcom-qmp-pcs-usb-v5.h"
-#include "phy-qcom-qmp-pcs-ufs-v5.h"
-
-#include "phy-qcom-qmp-pcs-pcie-v5_20.h"
 
-#include "phy-qcom-qmp-pcie-qhp.h"
+#include "phy-qcom-qmp-pcs-v5_20.h"
 
 /* Only for QMP V3 & V4 PHY - DP COM registers */
 #define QPHY_V3_DP_COM_PHY_MODE_CTRL			0x00
-- 
2.35.1

