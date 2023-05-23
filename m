Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8DCD70DC36
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 May 2023 14:16:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236734AbjEWMQE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 May 2023 08:16:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231621AbjEWMQD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 May 2023 08:16:03 -0400
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAE5218E
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 05:15:58 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-4f3baf04f0cso3287206e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 05:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684844097; x=1687436097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=enXMayXRzHH3oByKOYNfSsDWlN3ph9R0cvur3PtJ7ms=;
        b=GgOuR/mBHkSar7s0Nq/XxGnf14MrxbwcDNTCNamb0kCxl6mw7on0TwmCUUcd5yvDEZ
         xkdovIonZ6mLa8iqAurAuOdW3v6I00EoT0PP0HuqTGCJ1oEMsEwzZxnhUv5gX0gsoZoq
         nN5cUlV5NpjXrVg3HaTQthzV9XPF/h+gGjspwMbRcW03qPEajJg1BygcKK+Q9VdYVgPI
         k7k4wRunYgMWFD+h0OjzE1pRerv3SSAGrHur2dbQzGlD2k5+MGI/RUuRDiEKse1YEn0g
         pRoMum/gT2lrfjOuAs3i+ZRguXVD2TzbLbLv6bVvuKi/sOvsE3zqQI6xXGr5msLsuSbF
         cXvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684844097; x=1687436097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=enXMayXRzHH3oByKOYNfSsDWlN3ph9R0cvur3PtJ7ms=;
        b=JURdQzrjeSXyIMRAw6vB7h1J7A46x3Bqd25SxtxfOrkBm4ZcWdpn8BphMfuzn3YHIC
         iao28FeRKFJEVQRDavBgoNi8MCqHch1aS4BdJE7AN+FmAXuyXKDnQoEbRjc3dathxiKh
         PjiiLcKDoXxOzx0NZH9+m0sZnV6l+UPBJMWjeRq6Cl+NdT5EI52GAxObbCzm3XlnYJAg
         eBSWi71w0WstOEmK75m/SNe/qY4rLg+WU+M3kQB90R0XF8sg3kPSR6tr/7Y2oq87pffI
         gTvTcFs/IMvZVQ5URpIClFCB19IhCXtiJ+C0CoiGwQPEeXYKvOlwqH45lFUD690Iwl5z
         Zo2g==
X-Gm-Message-State: AC+VfDzFQfHER9BWouV/ru2aKCdCKCkI91O7ztwxiHX5lHniLHN5j6/U
        +z5BH/taYsxkAmk6cO0EYx1SEA==
X-Google-Smtp-Source: ACHHUZ4vMMeapHmDZhf0XR9q/6ZhAQ2GX3q8enToq80E9pn+2TNU+/BW9JtkjjWBEAiAkysxIU6lHQ==
X-Received: by 2002:ac2:5925:0:b0:4f3:7a01:f0d6 with SMTP id v5-20020ac25925000000b004f37a01f0d6mr3942481lfi.67.1684844097087;
        Tue, 23 May 2023 05:14:57 -0700 (PDT)
Received: from eriador.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c26-20020ac2531a000000b004f160559d4asm1319616lfh.183.2023.05.23.05.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 05:14:56 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-phy@lists.infradead.org,
        Sandor Yu <Sandor.yu@nxp.com>
Subject: [PATCH 01/15] phy: Add HDMI configuration options
Date:   Tue, 23 May 2023 15:14:40 +0300
Message-Id: <20230523121454.3460634-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230523121454.3460634-1-dmitry.baryshkov@linaro.org>
References: <20230523121454.3460634-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sandor Yu <Sandor.yu@nxp.com>

Allow HDMI PHYs to be configured through the generic
functions through a custom structure added to the generic union.

The parameters added here are based on HDMI PHY
implementation practices.  The current set of parameters
should cover the potential users.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 include/linux/phy/phy-hdmi.h | 33 +++++++++++++++++++++++++++++++++
 include/linux/phy/phy.h      |  7 ++++++-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 include/linux/phy/phy-hdmi.h

diff --git a/include/linux/phy/phy-hdmi.h b/include/linux/phy/phy-hdmi.h
new file mode 100644
index 000000000000..73a32eb535b0
--- /dev/null
+++ b/include/linux/phy/phy-hdmi.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2022 NXP
+ */
+
+#ifndef __PHY_HDMI_H_
+#define __PHY_HDMI_H_
+
+enum hdmi_phy_colorspace {
+	HDMI_PHY_COLORSPACE_RGB,
+	HDMI_PHY_COLORSPACE_YUV422,
+	HDMI_PHY_COLORSPACE_YUV444,
+	HDMI_PHY_COLORSPACE_YUV420,
+	HDMI_PHY_COLORSPACE_RESERVED4,
+	HDMI_PHY_COLORSPACE_RESERVED5,
+	HDMI_PHY_COLORSPACE_RESERVED6,
+};
+
+/**
+ * struct phy_configure_opts_hdmi - HDMI configuration set
+ * @pixel_clk_rate:	Pixel clock of video modes in KHz.
+ * @bpc: Maximum bits per color channel.
+ * @color_space: Colorspace in enum hdmi_phy_colorspace.
+ *
+ * This structure is used to represent the configuration state of a HDMI phy.
+ */
+struct phy_configure_opts_hdmi {
+	unsigned int pixel_clk_rate;
+	unsigned int bpc;
+	enum hdmi_phy_colorspace color_space;
+};
+
+#endif /* __PHY_HDMI_H_ */
diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index 3a570bc59fc7..93d77d45b1d4 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -17,6 +17,7 @@
 #include <linux/regulator/consumer.h>
 
 #include <linux/phy/phy-dp.h>
+#include <linux/phy/phy-hdmi.h>
 #include <linux/phy/phy-lvds.h>
 #include <linux/phy/phy-mipi-dphy.h>
 
@@ -42,7 +43,8 @@ enum phy_mode {
 	PHY_MODE_MIPI_DPHY,
 	PHY_MODE_SATA,
 	PHY_MODE_LVDS,
-	PHY_MODE_DP
+	PHY_MODE_DP,
+	PHY_MODE_HDMI,
 };
 
 enum phy_media {
@@ -60,11 +62,14 @@ enum phy_media {
  *		the DisplayPort protocol.
  * @lvds:	Configuration set applicable for phys supporting
  *		the LVDS phy mode.
+ * @hdmi:	Configuration set applicable for phys supporting
+ *		the HDMI phy mode.
  */
 union phy_configure_opts {
 	struct phy_configure_opts_mipi_dphy	mipi_dphy;
 	struct phy_configure_opts_dp		dp;
 	struct phy_configure_opts_lvds		lvds;
+	struct phy_configure_opts_hdmi		hdmi;
 };
 
 /**
-- 
2.39.2

