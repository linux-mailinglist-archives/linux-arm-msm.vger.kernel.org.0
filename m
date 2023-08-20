Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFF1B781E23
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Aug 2023 16:25:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231169AbjHTOZY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 20 Aug 2023 10:25:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230151AbjHTOZV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 20 Aug 2023 10:25:21 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DB1B2D65
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Aug 2023 07:20:42 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2b9c907bc68so42910671fa.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Aug 2023 07:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692541241; x=1693146041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xaz/Z2gROgUqdCrbEqE7kf2HF6hn0xEJoeMLqJ3bPE4=;
        b=ZZsXwtszIOND0lf3DmKyw1O8R5HC8fh3ZyTcg+3uAHgZpzPr/m1WfGFDeub0yPt5Y3
         H1ZMlxF4bsDI72TNwH+mPF+wR2f6rF1Aqicuc/9p792F7uE2I/bK1G8jDlLXmtvQ2rxP
         Wtbc41mIDBzGh4mNPcfwCoVkKXjnJtz2p3fRQ5MMQE9vCyLFOFna2QPDVmDUf3dlkRZE
         Ziof1Gw88Sk479MArNTWBrt6MUnnQBY7XOLg4Y8LbZfEvy5Zqnc6IbnWFbQTNrUj+Yjd
         NI8ej4DQxLMyJaajz7SMrpicovHNNjWmfkzfr6LjQrUxhYX24iyXY3P8tgPdGfkfmzBJ
         WM7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692541241; x=1693146041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xaz/Z2gROgUqdCrbEqE7kf2HF6hn0xEJoeMLqJ3bPE4=;
        b=DE6FMphS6AjbeyxK8QGo7ybVKwoD1FyDVTo/0qyu7LycxbtD1HCNnSSG2gInXfd7SC
         4rM4x2/D6MsrI+nH9J9CkiarJhRq/fL4YvQ4OLoWx++MDWKqTk0P0ZOLpUReruGPLWBu
         +U8dhpqVeOaiTNb1s3s+QV7v55FYjcO/r71joh9TxnUFzb9HSOmYf0D0qUnmCe1t64NF
         dliRhW36PBfHfjnDOTVD4X5F8qxA4szoCUYI6sQJznGgO9Hmvp263DOf6tZLad0uGNQU
         TYrtRRujG8RVSnnha4wxrzvZqAaWeI8hjwumyr0sa/MX3JnPxUJaw3tgAqtZKBGeL1oi
         LtPA==
X-Gm-Message-State: AOJu0Yyve5rbmVtWtp5k4njwjO62WDQxldWPiNule6GSC4NVndKbkG/C
        0dQXdwruykkm28387rZ2HUgAww==
X-Google-Smtp-Source: AGHT+IH9U5D+XGWeGrx7lfxxHLGL8yPvLKJS7Cr9a8UqUWnqXSy0Aw/utFw/0B/57QB/xdSWn6gx2A==
X-Received: by 2002:a2e:a310:0:b0:2b7:3656:c594 with SMTP id l16-20020a2ea310000000b002b73656c594mr3345023lje.3.1692541240850;
        Sun, 20 Aug 2023 07:20:40 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id n9-20020a2e7209000000b002b9e501a6acsm1706222ljc.3.2023.08.20.07.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Aug 2023 07:20:40 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v3 04/18] phy: qcom-qmp-pcie: keep offset tables sorted
Date:   Sun, 20 Aug 2023 17:20:21 +0300
Message-Id: <20230820142035.89903-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230820142035.89903-1-dmitry.baryshkov@linaro.org>
References: <20230820142035.89903-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In order to simplify adding new PHY configurations, keep register
offset structs sorted by the version.

Fixes: a05b6d5135ec ("phy: qcom-qmp-pcie: add support for sa8775p")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 373f959e439d..cdee109c398d 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -2323,17 +2323,6 @@ static const struct qmp_pcie_offsets qmp_pcie_offsets_v5 = {
 	.rx2		= 0x1800,
 };
 
-static const struct qmp_pcie_offsets qmp_pcie_offsets_v6_20 = {
-	.serdes		= 0x1000,
-	.pcs		= 0x1200,
-	.pcs_misc	= 0x1400,
-	.tx		= 0x0000,
-	.rx		= 0x0200,
-	.tx2		= 0x0800,
-	.rx2		= 0x0a00,
-	.ln_shrd	= 0x0e00,
-};
-
 static const struct qmp_pcie_offsets qmp_pcie_offsets_v5_20 = {
 	.serdes		= 0x1000,
 	.pcs		= 0x1200,
@@ -2354,6 +2343,17 @@ static const struct qmp_pcie_offsets qmp_pcie_offsets_v5_30 = {
 	.rx2		= 0x3a00,
 };
 
+static const struct qmp_pcie_offsets qmp_pcie_offsets_v6_20 = {
+	.serdes		= 0x1000,
+	.pcs		= 0x1200,
+	.pcs_misc	= 0x1400,
+	.tx		= 0x0000,
+	.rx		= 0x0200,
+	.tx2		= 0x0800,
+	.rx2		= 0x0a00,
+	.ln_shrd	= 0x0e00,
+};
+
 static const struct qmp_phy_cfg ipq8074_pciephy_cfg = {
 	.lanes			= 1,
 
-- 
2.39.2

