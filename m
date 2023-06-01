Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D074871F018
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jun 2023 19:01:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232252AbjFARBS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Jun 2023 13:01:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232279AbjFARBF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Jun 2023 13:01:05 -0400
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D8E5E64;
        Thu,  1 Jun 2023 10:00:55 -0700 (PDT)
Received: from [192.168.122.1] (84-115-214-73.cable.dynamic.surfer.at [84.115.214.73])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id D92F7CFC93;
        Thu,  1 Jun 2023 17:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=z3ntu;
        t=1685638823; bh=tSyVDSi1R0wPUkpeZdZY3/k1LG5m9jxQOZeT/ptDISM=;
        h=From:Date:Subject:References:In-Reply-To:To:Cc;
        b=hYcd9KCffXLP+MqQ9Yk1gcojJniV/6hqkn4x+6rGt0OiW9hoACHAa7QEhd4Q+YOqN
         aqvqyIGsr1x5WwhGHYzEAssTNhI4fpf6+T4j2tuSA8L4DnLlUlDTbeY+yVTH6Ayh8F
         sIqDIX7spisOUEHNIAn6Ng8oVgrtjS3rs1oJgG68=
From:   Luca Weiss <luca@z3ntu.xyz>
Date:   Thu, 01 Jun 2023 19:00:12 +0200
Subject: [PATCH v3 5/7] drm/msm/dsi: Add configuration for MSM8226
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230308-msm8226-mdp-v3-5-b6284145d67a@z3ntu.xyz>
References: <20230308-msm8226-mdp-v3-0-b6284145d67a@z3ntu.xyz>
In-Reply-To: <20230308-msm8226-mdp-v3-0-b6284145d67a@z3ntu.xyz>
To:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Luca Weiss <luca@z3ntu.xyz>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1685; i=luca@z3ntu.xyz;
 h=from:subject:message-id; bh=tSyVDSi1R0wPUkpeZdZY3/k1LG5m9jxQOZeT/ptDISM=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBkeM6gWw6yZiYyLcuYiHJeFcES8vcJvAACJntyd
 Nbdj4N7fIKJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZHjOoAAKCRBy2EO4nU3X
 Vnw2D/9Up8zeyFOejwgiAMUhaF31/KqiqCC7YT64PqkHA4qYVd6Pn6JAieUzK29+3ZgJFJFNXCW
 MJ23bZh3MWKWbiAdUYG+M9hu+dJg5apipkcsf7MOGmrZHQ5RzKLZTttz5pLOVvmeWIZF1QihUSX
 EPQSqQQ42K0Zg+CeKnuOV1IBrblhw5ZtkmIz0IiH8wxmVdzcsb7tnVTSVvk1mmPhgWRB+JeqJcN
 3BsRb80Ln2W4Vj9PvS4Rtjuu/LvCJ5VzmYTZyXlAVePmitehklMg7y8jZ4AsADx6SJu4yQuMDIj
 Cms4DhMENJPQxHu/okxryFfZ0+n88Q2rkuURhg8nSmUI7WOj5tmrXs8S2wwOKuvLdxFJPvcH86s
 gKdu5c0JSOcX5ZsoyxUJQQJKz+lJQp1jkqFWjh5LOf8vpJbmBpCJeeJcwQgHE5DXIQh59QsvDfk
 bWsLM0YsINkBeYyudeuutm6A0oQFhWGIgu5KYN3iShanO1QpOWzlV7fKw4H5SeAByoEy/O5lUZm
 Uy69VsevyV8Hx0Qpel+mIrH5/FwyZc+xw802bH/FCOiBASKahJrOIO4HsPqYe6nHzTn4bJuizk6
 QbNlwUyjZZsY9T3WM+b3+aF7v2md/xypHnAeE0IbgKfhNe3FkYwaczUoMnZnU4NxNJJ7cGXjYab
 2PkBDoyNA9ReVqQ==
X-Developer-Key: i=luca@z3ntu.xyz; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the config for the v1.0.2 DSI found on MSM8226. We can reuse
existing bits from other revisions that are identical for v1.0.2.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 drivers/gpu/drm/msm/dsi/dsi_cfg.c | 2 ++
 drivers/gpu/drm/msm/dsi/dsi_cfg.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index 29ccd755cc2e..8a5fb6df7210 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -245,6 +245,8 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
 		&apq8064_dsi_cfg, &msm_dsi_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V1_0,
 		&msm8974_apq8084_dsi_cfg, &msm_dsi_6g_host_ops},
+	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V1_0_2,
+		&msm8974_apq8084_dsi_cfg, &msm_dsi_6g_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V1_1,
 		&msm8974_apq8084_dsi_cfg, &msm_dsi_6g_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V1_1_1,
diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
index 91bdaf50bb1a..43f0dd74edb6 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
@@ -11,6 +11,7 @@
 #define MSM_DSI_VER_MAJOR_V2	0x02
 #define MSM_DSI_VER_MAJOR_6G	0x03
 #define MSM_DSI_6G_VER_MINOR_V1_0	0x10000000
+#define MSM_DSI_6G_VER_MINOR_V1_0_2	0x10000002
 #define MSM_DSI_6G_VER_MINOR_V1_1	0x10010000
 #define MSM_DSI_6G_VER_MINOR_V1_1_1	0x10010001
 #define MSM_DSI_6G_VER_MINOR_V1_2	0x10020000

-- 
2.40.1

