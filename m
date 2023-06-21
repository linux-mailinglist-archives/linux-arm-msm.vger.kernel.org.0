Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A8A773894B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jun 2023 17:33:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232855AbjFUPdh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jun 2023 11:33:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233268AbjFUPdX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jun 2023 11:33:23 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19DE410D0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jun 2023 08:33:21 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4f7677a94d1so8361359e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jun 2023 08:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687361599; x=1689953599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cinDdKc7qcFMBG/ILqluH58R0lxOnWl8AXgWQvYj7y8=;
        b=b9Uw8PP6PLmB5enJ+YN/gAWstIZcK2d6cPFFyC+HnhzhIc4frOT4XfJBKmua/afreb
         IDZChcMC5maApOrqooiLfSHE02o2EiXZesginJJzWeZeqlUHRrG7jR80XtE3AiI7VmtC
         HZI4aSI1i9RimFa0fI3huEzlOcx4k5B7HTtBTVo8pPX928LSi/n+Gm7Ydzk80Bodg6W4
         32pdtMhAkfrKubVOvWraqT0AGWi0lueXE5aqgqRb0pQK8xF4e/GBqKld5i8nFHpkZ3IK
         GxJDe2d8G19zTxKfCBHCpquAI37gAW+/c5doRep6NLvS6/FgoagpIE5JH9jYpF4uYU7G
         beAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687361599; x=1689953599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cinDdKc7qcFMBG/ILqluH58R0lxOnWl8AXgWQvYj7y8=;
        b=HjROk7i50wbbHCQAReattmaM6zI5hi/8mGwKzaD1r6daW/Hy51iuwMgyb0BvEfa/58
         QN5GT5Qj633wRrWi1hML3j8Pvt9QWyYi4XSk4w0o5huLNVJKmIb1FjjxmP8KJnfV5+e/
         0kOs0yd7HZnzAiF9KlnEkXPa7LzYXhwLO8w46ld9jcM1JhK70Xt+afXKcFB2NCastxzd
         iJlXXFHJhHlbGzP5BCG0ABV1b0FvnHe7iaL9OJ74uPFe7riPtmqUcetA73VzH0w8dFJt
         1dmSVR+6WZt6s9sAGn38rKzDYQOpHH3emyZJpxyw9jdMuxBou0DHUkbkH0RTHLbMoDeo
         wXuQ==
X-Gm-Message-State: AC+VfDwZOCAhONMG33T45d3QsNmbcdQZRuDh+pBZ75HGByjA2M+GLA2n
        kH0EmEUJR5dsnIvMwydy1RmJmg==
X-Google-Smtp-Source: ACHHUZ4Swfo7lJHYU8UGgmXXrp9UT8Vv0+TqrSkf2YR9MicmmVjGVh7uzAoR2yPbD5YuFHbEZVPeCQ==
X-Received: by 2002:a19:6d0c:0:b0:4f8:4245:ed57 with SMTP id i12-20020a196d0c000000b004f84245ed57mr10106450lfc.35.1687361599343;
        Wed, 21 Jun 2023 08:33:19 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id o3-20020a056512050300b004f8751285a5sm804888lfb.80.2023.06.21.08.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 08:33:18 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        freedreno@lists.freedesktop.org
Subject: [RESEND PATCH 1/7] phy: qcom: qmp-combo: correct bias0_en programming
Date:   Wed, 21 Jun 2023 18:33:11 +0300
Message-Id: <20230621153317.1025914-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230621153317.1025914-1-dmitry.baryshkov@linaro.org>
References: <20230621153317.1025914-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It seems the commit a2e927b0e50d ("phy: qcom-qmp-combo: Add sc8280xp
USB/DP combo phys") contained a typo for selecting bias0_en values.
First, bias0_en and bias1_en are expected to be symmetrical, and then
the vendor driver also uses `flipped : 0x3E : 0x15` statement for
bias0_en. Correct bias0_en programming to follow this.

Fixes: 49742e9edab3 ("phy: qcom-qmp-combo: Add support for SM8550")
Fixes: a2e927b0e50d ("phy: qcom-qmp-combo: Add sc8280xp USB/DP combo phys")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index bebce8c591a3..9d03b7b8e00c 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -2322,7 +2322,7 @@ static int qmp_v5_configure_dp_phy(struct qmp_combo *qmp)
 		return ret;
 
 	if (dp_opts->lanes == 1) {
-		bias0_en = reverse ? 0x3e : 0x1a;
+		bias0_en = reverse ? 0x3e : 0x15;
 		drvr0_en = reverse ? 0x13 : 0x10;
 		bias1_en = reverse ? 0x15 : 0x3e;
 		drvr1_en = reverse ? 0x10 : 0x13;
@@ -2382,7 +2382,7 @@ static int qmp_v6_configure_dp_phy(struct qmp_combo *qmp)
 		return ret;
 
 	if (dp_opts->lanes == 1) {
-		bias0_en = reverse ? 0x3e : 0x1a;
+		bias0_en = reverse ? 0x3e : 0x15;
 		drvr0_en = reverse ? 0x13 : 0x10;
 		bias1_en = reverse ? 0x15 : 0x3e;
 		drvr1_en = reverse ? 0x10 : 0x13;
-- 
2.39.2

