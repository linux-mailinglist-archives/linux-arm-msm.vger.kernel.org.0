Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7854A73D07B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jun 2023 13:42:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231734AbjFYLmf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 25 Jun 2023 07:42:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231893AbjFYLmd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 25 Jun 2023 07:42:33 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30400116
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jun 2023 04:42:32 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2b45b6adffbso32559351fa.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jun 2023 04:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687693350; x=1690285350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lwdtqkDXqK7iZxcIX1bEzs8baolumoX7/30733m/ZW8=;
        b=csRNaQVYcN5FlY1KPPmbQ3DhS2yDIluczA9prBJjlEis0hj9zyLOJ92+3vWSG3wDPH
         aJXwYnwBhB7nfZ4ZU/BkYzjQow5FL+ttw7WQzRVTWRsWovgYQMYPWJNsEFH1shm9DxEM
         MRw6m6BbZlxeDAAkVWzXRx1B7TtkNNicfCrLeAjQFowxLo1TM0o/L6IUFsH668ogcEcf
         aaKuM1FSW1r5X+W9WZNu7KY0FB/zb4yo/pEvgO00Rvrt/C0Ne7l4AjlelDBp7hA97/c7
         1/LSkEId65dBAiGKPtDbLGQZ3rVH/fWZDpYriqPbjBCZNoKJ1rwoB+GNFbMT4msiXzFo
         x9xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687693350; x=1690285350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lwdtqkDXqK7iZxcIX1bEzs8baolumoX7/30733m/ZW8=;
        b=CBXu1GMlN/+g027WD4JF7LIsZI3PgnnEotv+uvq8386dN9RrDPZZHnh10iUXzT+kOR
         a23rU96S9XJolcQUeNxDIUd+lOP8cVQxQOUDIQqSDnGR0fggSkcXxcL8k3qYVKHu3B9p
         +ldY3VH8zid3oaNP5nsitlnc89e3hiZVac9jGJ9tBgLzkNN0exQDV+NJsOLvKv4AoBKh
         9toLwYUqHXTNnF6Zk23o0xO8LCO1hxZ+SkENLsGcvAx4/4gWXeJ7rMbgwH8YFRNbDZUy
         0V9tNpP62JviRdPyAX4nKxn5ugyPOy2J5X+Z1zLbRX0AAiiMDjy+IfvUC6OkG9g+UdbE
         Ul8g==
X-Gm-Message-State: AC+VfDw9lxpIu3IeVn8+If7Md7DdQ/iGdr6ryZev6LVlM06AoRv5W6ck
        KprRFZlDzxUJI2edskVgEEcQQQ==
X-Google-Smtp-Source: ACHHUZ6JBYjRhM3xUtGku0UohCxWUXppP0M1khuC54BjHXVyboGxygUTxDaw7zl/dBjjx5nQpMp90Q==
X-Received: by 2002:a19:e348:0:b0:4f8:48f3:f06 with SMTP id c8-20020a19e348000000b004f848f30f06mr14544063lfk.48.1687693350508;
        Sun, 25 Jun 2023 04:42:30 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id b23-20020ac25637000000b004f87893ce21sm637323lff.3.2023.06.25.04.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 04:42:30 -0700 (PDT)
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
        freedreno@lists.freedesktop.org, linux-phy@lists.infradead.org
Subject: [PATCH v2 08/15] drm/msm/hdmi: move the alt_iface clock to the hpd list
Date:   Sun, 25 Jun 2023 14:42:15 +0300
Message-Id: <20230625114222.96689-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230625114222.96689-1-dmitry.baryshkov@linaro.org>
References: <20230625114222.96689-1-dmitry.baryshkov@linaro.org>
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

According to the vendor kernel [1] , the alt_iface clock should be
enabled together with the rest of HPD clocks, to make HPD to work
properly.

[1] https://git.codelinaro.org/clo/la/kernel/msm-3.18/-/commit/e07a5487e521e57f76083c0a6e2f995414ac6d03

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 3132105a2a43..0fc3df43aa70 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -248,9 +248,9 @@ static const struct hdmi_platform_config hdmi_tx_8960_config = {
 };
 
 static const char *pwr_reg_names_8x74[] = {"core-vdda", "core-vcc"};
-static const char *pwr_clk_names_8x74[] = {"extp", "alt_iface"};
-static const char *hpd_clk_names_8x74[] = {"iface", "core", "mdp_core"};
-static unsigned long hpd_clk_freq_8x74[] = {0, 19200000, 0};
+static const char *pwr_clk_names_8x74[] = {"extp"};
+static const char *hpd_clk_names_8x74[] = {"iface", "core", "mdp_core", "alt_iface"};
+static unsigned long hpd_clk_freq_8x74[] = {0, 19200000, 0, 0};
 
 static const struct hdmi_platform_config hdmi_tx_8974_config = {
 		HDMI_CFG(pwr_reg, 8x74),
-- 
2.39.2

