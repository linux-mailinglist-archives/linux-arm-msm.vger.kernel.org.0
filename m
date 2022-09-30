Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0FDF5F0AB7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Sep 2022 13:39:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231788AbiI3Lid (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Sep 2022 07:38:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231637AbiI3Lh4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Sep 2022 07:37:56 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D45FD286C5
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 04:29:38 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id b6so4463858ljr.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 04:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=xzp1n+xXMR0oqgZ0eki3yQt/UeyORWIWI7FE7XVObuk=;
        b=unFiefTZF8EyuLh50hARNTELze3wWqOL0aelmZMEzJEDQLjwMey7RO4IOi/BJeUT+S
         /IwpbqtWujYeDC8HpL8DUpdOJxKkzo86nl17KYEZmwmr9kyhnAQ1HYnbB+ViWulhxD/0
         ncCesPE9nGwuE2ewztzCUGkS1wlyu1cI07XnBnFlPTDPKx/IvjZvgDBOtpYKQU+0dCo1
         k+ZgWqWt4QDohk9FQhrxHSTdTduOiuYMmvssiIWSRBmNkN4Ax7jnw8aHUVDgb7gGCQ7k
         zuFagEDRIj1SxYZs0hQHxxET+chc/C9f1iKuCt3scxgbBJMVtLJuX7ckF7sAJHTKGN9t
         Xirg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=xzp1n+xXMR0oqgZ0eki3yQt/UeyORWIWI7FE7XVObuk=;
        b=patl4Qvxzss+AkoKb8sfSeEpPtMgGcZWLLkErQGaZlC8lABo5u2wx9gqZBRlyAwqzD
         IwGOKSTELbSZOSnX4ZD6K/X9VOH1GV3i0WvKCSb+fvjUJFAp+kphqhomM3vWzYs2Ymo2
         mld107h998Q/ellW7vKx2h4qCpttGvN/B+TAS6S0YFw+ztpXfdRhx6unn9fXJOvuzXFc
         gd33Yn+tCPaSCfZ7aMgErbTjbMPXYm7TAaDP+lfibI72Eso8yUR89b41pi4OdgYFFR5V
         bAMtv9Kr+HVVBAaHRmkEa4l7JMGxG1nnuLZEfm8rdQy1OSKMhFdYoHTHOoV5Vml3aIox
         /oUw==
X-Gm-Message-State: ACrzQf1VAdMB8wQkYQIGtoue/66PvZQoS1K5A0G/Qk/yjcEF8k2aBLm6
        vrSnbzrihL3zAhcyeSukReaknw==
X-Google-Smtp-Source: AMsMyM49+iQJ0gqA9WGzZo6uAWGfSefawXObvTNZdHdC2UHVrLAqUuv+BtbQGFqM7lQeFRhUfMxXTg==
X-Received: by 2002:a2e:b5d7:0:b0:26d:98c2:6ad2 with SMTP id g23-20020a2eb5d7000000b0026d98c26ad2mr2833581ljn.215.1664537376992;
        Fri, 30 Sep 2022 04:29:36 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v18-20020a197412000000b0049493c14b17sm264672lfe.181.2022.09.30.04.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 04:29:36 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v2 12/12] phy: qcom-qmp: move type-specific headers to particular driver
Date:   Fri, 30 Sep 2022 14:29:26 +0300
Message-Id: <20220930112926.638543-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220930112926.638543-1-dmitry.baryshkov@linaro.org>
References: <20220930112926.638543-1-dmitry.baryshkov@linaro.org>
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
 drivers/phy/qualcomm/phy-qcom-qmp.h       | 14 --------------
 5 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 0561df216fb1..3ae02a2287fc 100644
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
index 48b49719b7a5..e73442174997 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -23,6 +23,12 @@
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
index 064435c1b78d..9bfd5b473bfd 100644
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
index 2e3ccf3da0e4..fa955c11a10f 100644
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
index e6f327acbf19..08a3eccaeadc 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -24,28 +24,14 @@
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
-#include "phy-qcom-qmp-pcs-pcie-v5.h"
-#include "phy-qcom-qmp-pcs-usb-v5.h"
-#include "phy-qcom-qmp-pcs-ufs-v5.h"
-
-#include "phy-qcom-qmp-pcs-pcie-v5_20.h"
-
-#include "phy-qcom-qmp-pcie-qhp.h"
 
 /* Only for QMP V3 & V4 PHY - DP COM registers */
 #define QPHY_V3_DP_COM_PHY_MODE_CTRL			0x00
-- 
2.35.1

