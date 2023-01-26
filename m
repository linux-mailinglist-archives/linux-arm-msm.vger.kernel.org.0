Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2BD367CBE1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jan 2023 14:16:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236593AbjAZNQv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Jan 2023 08:16:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236539AbjAZNOv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Jan 2023 08:14:51 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BCB766FBD
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 05:14:27 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id c10-20020a05600c0a4a00b003db0636ff84so1105716wmq.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 05:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L8S/k5EZmNceNC6Mb6iquS22SFOybuz/c5edVTjpSWQ=;
        b=jbUFuQbr46utCUyThNoFkNjZt0H9yAQO8Dsi5ZT1Oz4vwUbod+B+DYeXw1mMuIW8yk
         2T2KB525Cb1YDINUCh1d/8VpAggbNU2f7sjpKNV+3Zcdio4kcojcA5ByVaUI9svZtYH/
         JR4aoPaqYDP9qgM3n4YToJywCnVh8ki3bhQte/sZrcVMf7dAe9AlrGFJ+VfKGq+p9o3k
         7artgLWuj85uQVV1G6GRsE6x4PSxQrXs79hOWX0cu3A04xAyYccVP8n0gSaow9WXZFVK
         x0r0iuznEfWpAC9govDHAET72/UDWqBSHF4fAMaWR5xvZPcJBRDBnatQ8hjoB7+efUDp
         Sd7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L8S/k5EZmNceNC6Mb6iquS22SFOybuz/c5edVTjpSWQ=;
        b=fQM/M3e6ruAjjIBhp7FfHVQchiufkPKZfBhdBdfkzmvPUiaFv8zoIHuZzb6K3c6L8S
         0vYTWBh2OQaAWfbxtU2wl6/h4+3oFqacjwjz6RmuWhwwSAPdVEhgHyOVJwkOzy+Q9CGA
         63SEsl1199qQEKTX1pBaFC1tIZEOknTx9T0u5UUD6oPJ89U6OeESdtBLiwWhCKQz5T4J
         nEe0+Hz+xehlMBWTnBXV11ciS4EXYh/ld0RZNQWd+u8DWEalWCF4EmBZKtB8YDQRDcFz
         bEeqQaXVNazwTTBpvGhrEnRTYDst+/6vgYQBbxonzvWXjm7GKW0fbdR5/wAj/BEK3Pay
         iZZw==
X-Gm-Message-State: AO0yUKU0cxZYjZie1aROwDKkskTYgQj1conhMfbCvJAXnVhbOX3kuFD3
        1LXxrve/+eOr1yKpxfk50zirUw==
X-Google-Smtp-Source: AK7set9Mipn93fBan5Mm1jnzFa/ECppqiDj0Cy/gwDUPPO3En4NlVsc+jfJJDQwJX7brzeHc8Ky7+w==
X-Received: by 2002:a05:600c:a42:b0:3dc:1050:5553 with SMTP id c2-20020a05600c0a4200b003dc10505553mr9772874wmq.23.1674738865812;
        Thu, 26 Jan 2023 05:14:25 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id 18-20020a05600c26d200b003da28dfdedcsm1719804wmv.5.2023.01.26.05.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 05:14:25 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-phy@lists.infradead.org
Subject: [PATCH v3 5/8] phy: qcom-qmp: Add v6 DP register offsets
Date:   Thu, 26 Jan 2023 15:14:12 +0200
Message-Id: <20230126131415.1453741-6-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230126131415.1453741-1-abel.vesa@linaro.org>
References: <20230126131415.1453741-1-abel.vesa@linaro.org>
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

The new SM8550 SoC bumps up the HW version of QMP phy to v6.
Add the new DP specific offsets in the generic qmp header file.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---

The v2 version of this patch was here:
https://lore.kernel.org/all/20230126124651.1362533-6-abel.vesa@linaro.org/

Changes since v2:
 * none

This patch did not exist in v1. Since then, the DP support has been
added.

 drivers/phy/qualcomm/phy-qcom-qmp.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index 148663ee713a..7ee4b0e07d11 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -134,4 +134,8 @@
 #define QPHY_V4_PCS_MISC_TYPEC_STATUS			0x10
 #define QPHY_V4_PCS_MISC_PLACEHOLDER_STATUS		0x14
 
+/* Only for QMP V6 PHY - DP PHY registers */
+#define QSERDES_V6_DP_PHY_AUX_INTERRUPT_STATUS		0x0e0
+#define QSERDES_V6_DP_PHY_STATUS			0x0e4
+
 #endif
-- 
2.34.1

