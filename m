Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3F3F7B1A7A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Sep 2023 13:18:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231843AbjI1LSn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Sep 2023 07:18:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231808AbjI1LSa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Sep 2023 07:18:30 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AAEE7EFF
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 04:16:39 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-503397ee920so20315438e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 04:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695899797; x=1696504597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZUcCOVu6ZaxzHiAf2no1lacr8/uO1deQMwqsfTD0Nwk=;
        b=Ryf+KYOzF8pv+Md0byv9Ai9wy17ExdSUdkMQ8Klf0wKDDulXnUjkiqKEwdWdZCiq8z
         nFSd5LhLwbIOoqptGgUkIukXHobBNxvGdLRkK71rwRHaCtHL7ILE0eDtLs+RrHzkf+0Z
         xUIaIq/YSLQelpbOcNmI/hioBtqOEpmSTuo1pWGgoRtAxIhOCTTUKR1y9yvt11HUjQ2D
         Vi65gIeKgKvR7gKAGsdfX5dhYcWIvmtcX4jTul5q6ofzV1wo8ECUCMmxoaDuEeoPVVm4
         vdJ/hQZ6gLZTFt9xENkiPEVhkk78ZwewUUp5ck6+s2twCHqKiflDQeThS9eW2j2zsste
         cWvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695899797; x=1696504597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZUcCOVu6ZaxzHiAf2no1lacr8/uO1deQMwqsfTD0Nwk=;
        b=nVzxPIsVrspupIDYVFe81yqI6hCl5o6jlxeumt0Zb6CgbAJLhxcI2U8+AfSC2UF38e
         Jk9RnnjpBLY/fR8MC3KiaQZMkZUV4TCkP5P4zBThMdWhYR3Tmc0zc0N14LmVUyDu8ndL
         bXfJ0aw7YLWMKEpKnva4WuOlmW5KIzereDUMR9Yk5kAnIqW+A1sAtk6ArMwNaVJlAWhT
         /RFDVm438KSCUgb/xn/NiODEqRHmGs8Sp87z/vypKz7x0ZgAKodKce4/g0taPv3o+Odq
         deO+Zi0tORXyVI3rBzB056DjNYwovZEjtyv348CDws6q0gpMvTl8g5HHaNRol68sWrvt
         e23w==
X-Gm-Message-State: AOJu0YwaS4dp4OEEBiGe/JeD3UOaHTkJaVbmCOJYK1aZzJEOnD+8dMfI
        pBseKPJ/yjkGYJxRnL+v2oUd9Q==
X-Google-Smtp-Source: AGHT+IGayXiNU18owRcbSjsnuEvUZI+a5/Tg0pK7lvyHa0cMWTUPF+pJZOcVu6K1HD5AKpwp7dZ+ww==
X-Received: by 2002:a05:6512:447:b0:503:9a4:26f7 with SMTP id y7-20020a056512044700b0050309a426f7mr844038lfk.40.1695899797684;
        Thu, 28 Sep 2023 04:16:37 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j18-20020ac253b2000000b004fb738796casm3086623lfh.40.2023.09.28.04.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 04:16:37 -0700 (PDT)
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
Subject: [PATCH v3 08/15] drm/msm/hdmi: move the alt_iface clock to the hpd list
Date:   Thu, 28 Sep 2023 14:16:22 +0300
Message-Id: <20230928111630.1217419-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230928111630.1217419-1-dmitry.baryshkov@linaro.org>
References: <20230928111630.1217419-1-dmitry.baryshkov@linaro.org>
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

According to the vendor kernel [1] , the alt_iface clock should be
enabled together with the rest of HPD clocks, to make HPD to work
properly.

[1] https://git.codelinaro.org/clo/la/kernel/msm-3.18/-/commit/e07a5487e521e57f76083c0a6e2f995414ac6d03

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index b6bcb9f675fe..75644efe23cb 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -250,9 +250,9 @@ static const struct hdmi_platform_config hdmi_tx_8960_config = {
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

