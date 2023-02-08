Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34FE168F6F7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Feb 2023 19:34:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231927AbjBHSev (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Feb 2023 13:34:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231953AbjBHSep (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Feb 2023 13:34:45 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9912530CA
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Feb 2023 10:34:41 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id y1so17730419wru.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Feb 2023 10:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SEEw1gk8nKk8ec0d+OZoGuQ0dljBC15xmWf5pXLD21M=;
        b=JO4r1ax4GcvpRjFFTRLC8KC6CJ+X4ObzFbO1cnhyLCMTXvFsSPqb1N1WFT1P33Qpw5
         w1Y0NWtbmhiCOk+WeRJMTq3GYddcsQ52KQbm+lWOaXLfsXUIGQQHXa9OUHsfA5gpRs/4
         q08v9RHQRWTgbHlFdcGvJUiMNQ66gqQTzRJxTPjyLvtxmXtFCZMB9vKoZmaLCS4O0yMg
         3+g3/kD+TLLSjZL50uR821TG3+XREwumroRNeZO+LE/tDIiNcSaTWbu6jOopl5ENn05q
         8U9k0CSFd+jc8ovjvV7wXlJz8Xi1QSI6ppmrRz/JtFUlTIMVA+TfQFsot99T0SyhUAmV
         oZFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SEEw1gk8nKk8ec0d+OZoGuQ0dljBC15xmWf5pXLD21M=;
        b=1TTuaheUMgQT2TpbnsgSTJqBhDRq9pSQJ/vUUr0bCTf3F6L6Uu/bjRJz+irX+Zl7e+
         sOQkZec74s92/UIN+KSpK9OSF3QPfEzQkDu4AiwSw1LfkzE/yoRK0r9RtZp0Xby9peCs
         AYzGIfTLFfUBHk3cm7R6EmE7rKOOcxRD5iDhQZZrJEZOkd/82LweKuAQL7xiywhyYcHw
         NQKhqHLTuK9NNy7dNllFgDL2XH0dxg9Au09wP+gu9BENMm2824SdmPTv5scYyk9Jc7lz
         lUP+VRVCZV7nwCnIelWLnXCrevNbb/H3Ixx0YZxRypZ6E0LIW04/spgll6DY4oJP0IRL
         O1Qw==
X-Gm-Message-State: AO0yUKXLPiHUjbUaLKF65oXSTptLv0shx4oxgnFep0w8WzakG6mZCsCQ
        NeNLX80hyHfeE4ZhtdezWUUxhQ==
X-Google-Smtp-Source: AK7set+yhRMo8e8rB61Fy+UWbSd7MwN15kw39yo7cm+UT347c0bARKb+5nRJY0wpW0bxfUPk89SBZw==
X-Received: by 2002:adf:fbd0:0:b0:2c3:fb3e:ae85 with SMTP id d16-20020adffbd0000000b002c3fb3eae85mr4380091wrs.44.1675881281481;
        Wed, 08 Feb 2023 10:34:41 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id v1-20020adf8b41000000b002be505ab59asm14591304wra.97.2023.02.08.10.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 10:34:40 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Johan Hovold <johan+linaro@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-phy@lists.infradead.org
Subject: [PATCH v6 5/6] phy: qcom-qmp: Add v6 DP register offsets
Date:   Wed,  8 Feb 2023 20:34:20 +0200
Message-Id: <20230208183421.2874423-6-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230208183421.2874423-1-abel.vesa@linaro.org>
References: <20230208183421.2874423-1-abel.vesa@linaro.org>
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

The new SM8550 SoC bumps up the HW version of QMP phy to v6.
Add the new DP specific offsets in the generic qmp header file.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---

The v5 version of this patch was here:
https://lore.kernel.org/all/20230207114024.944314-6-abel.vesa@linaro.org/

Changes since v5:
 * none

Changes since v4:
 * none

Changes since v3:
 * none

Changes since v2:
 * none

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

