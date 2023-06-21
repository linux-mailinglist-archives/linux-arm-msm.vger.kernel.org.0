Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67BD07388F1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jun 2023 17:27:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229867AbjFUP1Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jun 2023 11:27:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231661AbjFUP1Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jun 2023 11:27:24 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 462F599
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jun 2023 08:27:23 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2b477e9d396so52552661fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jun 2023 08:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687361241; x=1689953241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cinDdKc7qcFMBG/ILqluH58R0lxOnWl8AXgWQvYj7y8=;
        b=L7XZYrLRMVdNrNT666kAmLVpx0UuAEJm1JszHztq+eVasTX4GMDmNddObn/0Ta9JgW
         gxQjSGO28UPlxUf3AeIRe8n/HouUdNa9U/72YAp920k7SzDNUz1OyPitDS4p2H7OPRj+
         9xDbjJqXa74BuLabUS38U64LlXcjYYkOrv191gUGPc4lF42W01mQx1gz7b1mggPH6Fpo
         uMwgf44GN64W3quBKjx61T+FxfM9QAaVOx2Lz3ZfDpWufjnB7D/uPAP19XIr0H3nmBcx
         +DSqZ3skJiq5baHf+ZFCwUocRs8rbd8NjBBx1gqEGHrIsmMPOYJXPEeZzt1OIQZsd2z0
         a4eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687361241; x=1689953241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cinDdKc7qcFMBG/ILqluH58R0lxOnWl8AXgWQvYj7y8=;
        b=JApX0mk2psoK5dcDSAvXvDYzWkYBPTxEUoTLuxdFS5fW/jMyD4olh7zmzeAumy7I9Y
         jXb3PTBX7tHIhYMXpGmJMINx4vH9QfO78Oqpx9cQY8Qp0aZ0PjutNzTqdOXmrYnyUKeI
         YzZdBIHfI0yhYOGKzGxlV8BzgbmIr1d15tw10eqtzwkW6viBaphkd8tM5UntEMZzwoLQ
         a+eoQ0OJ8WimR0fxhzEC/DH3vjAr0TQSvLamCysNYf7L0zL/9NgWKdia9IvIBhufZiYX
         Lwpu0fOkilKXasH8A6apvXP6g2irQcS/RzA2N7q4CiPBmdi6uxypcfR37xoSN14+U0oc
         Nv9w==
X-Gm-Message-State: AC+VfDyC4ByQoXaxh6c5Ji6lbdDxEAFqF+C4XZyoArWftU9oB4gIGESJ
        gJJbmrD4BChkkR/A+JKL6u6xxQ==
X-Google-Smtp-Source: ACHHUZ5DrUiscoavdt2iyHRYadcld7Szp4rZOkCpzgtMW1bpfECW3qcwqzyL93OSiZjSm09amAPr6w==
X-Received: by 2002:a2e:848a:0:b0:2b4:6c76:332f with SMTP id b10-20020a2e848a000000b002b46c76332fmr8882032ljh.9.1687361241467;
        Wed, 21 Jun 2023 08:27:21 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id o11-20020a2e9b4b000000b002ad5f774579sm926408ljj.96.2023.06.21.08.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 08:27:20 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 1/7] phy: qcom: qmp-combo: correct bias0_en programming
Date:   Wed, 21 Jun 2023 18:27:13 +0300
Message-Id: <20230621152719.1025801-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230621152719.1025801-1-dmitry.baryshkov@linaro.org>
References: <20230621152719.1025801-1-dmitry.baryshkov@linaro.org>
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

