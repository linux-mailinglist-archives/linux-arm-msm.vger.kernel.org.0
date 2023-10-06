Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 492B87BB930
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Oct 2023 15:37:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232277AbjJFNh3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Oct 2023 09:37:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232082AbjJFNh2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Oct 2023 09:37:28 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA3229E
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Oct 2023 06:37:24 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-50573e85ee0so2594933e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Oct 2023 06:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696599443; x=1697204243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=plrtfO8h25uUoR+D2Ur8tutbh5oxCszjqqN/PL1rwNQ=;
        b=AMK7ffUqFbktmBDpkkH/kHwbuguYVYk6Ft4FwA1v6NZtSSRtXJ9+35i0DjzRXpPQmB
         VvAyxWyry/bzhFp1ts4s69RBphVA/ieVRVpDrW+4PguzqmC1u3r1P3ZKoPlzBYT8S9Lf
         qjPIYshHBxMCEtw67x3fN7MWLfBNtRSKT8BV9w8D56QF5ixhST1OIfBoaK6u3Z26Oiy5
         g92q4TYJoViWYfq1BFwCwzaZVKPk6CXc+EuX5blsG5Yks2E30+fkfYv2dHHLQq738HlH
         NYXmadujHxxrigj78nId0wpikuCA4/kBK55FpzCIVC+Weeq3dKEzHT5Bw9KEn0fOoTRy
         P/OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696599443; x=1697204243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=plrtfO8h25uUoR+D2Ur8tutbh5oxCszjqqN/PL1rwNQ=;
        b=pklvZR44YPTluBfE8UITvcWkzQetazASD90O3AhhmwJL1JIDPqOhXOrWKAJ2Ucw35C
         F8Y9eFTqLT9mAAtVW3e16j+UlNeCMj0lxli+OhebB4Smvsd/N52DsPtgcKbLHESO33md
         ujruEOZWA+U7YYFuM7Sziyca1ZM6x4wz/NxMpsC/pGTaCJC6lsvSZ1D7Narqwj/4Eq7O
         fENmA+IeuGm9wvrpxnZ0H6V4Jxqmwx8893ed08ZGXxXiwsnUYfxoq2tZQ/8f/ScwSowr
         mAQ1HUVIF2CboXmF8ed85j9tP978ZnyKbkAfBg1BIIurHQROd0TqW6zoCC+5FHA7FTPH
         WdRQ==
X-Gm-Message-State: AOJu0YwRM8mBQLQZWs3Ay1MbnO5bKFM0pFBDQBq2BXgGIHbtKuymsjDW
        cat1VO+J0I1ypqwlxm7HSXB0cQ==
X-Google-Smtp-Source: AGHT+IF0aCUsyxayOk5nYHN7LEgt7M/V+gnGLbc7RMgQ3Q/sol+ZdeG75i01bUgm8c8YVyBTiGCMIQ==
X-Received: by 2002:a05:6512:ac5:b0:503:2eaf:1659 with SMTP id n5-20020a0565120ac500b005032eaf1659mr9547303lfu.41.1696599443020;
        Fri, 06 Oct 2023 06:37:23 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id m27-20020a056512015b00b0050567cdb8f6sm303534lfo.239.2023.10.06.06.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 06:37:22 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 1/5] drm/msm/mdss: generate MDSS data for MDP5 platforms
Date:   Fri,  6 Oct 2023 16:37:16 +0300
Message-Id: <20231006133720.2471770-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231006133720.2471770-1-dmitry.baryshkov@linaro.org>
References: <20231006133720.2471770-1-dmitry.baryshkov@linaro.org>
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

Older (mdp5) platforms do not use per-SoC compatible strings. Instead
they use a single compat entry 'qcom,mdss'. To facilitate migrating
these platforms to the DPU driver provide a way to generate the MDSS /
UBWC data at runtime, when the DPU driver asks for it.

It is not possible to generate this data structure at the probe time,
since some platforms might not have MDP_CLK enabled, which makes reading
HW_REV register return 0.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 51 ++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 6865db1e3ce8..4d98ef45c10d 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2018, The Linux Foundation
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/interconnect.h>
@@ -222,6 +223,49 @@ static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
 	}
 }
 
+#define MDSS_HW_MAJ_MIN		GENMASK(31, 16)
+
+#define MDSS_HW_MSM8996		0x1007
+#define MDSS_HW_MSM8937		0x100e
+#define MDSS_HW_MSM8956		0x1010
+#define MDSS_HW_MSM8998		0x3000
+#define MDSS_HW_SDM660		0x3002
+#define MDSS_HW_SDM630		0x3003
+
+/*
+ * MDP5 platforms use generic qcom,mdp5 compat string, so we have to generate this data
+ */
+static const struct msm_mdss_data *msm_mdss_generate_mdp5_mdss_data(struct msm_mdss *mdss)
+{
+	struct msm_mdss_data *data;
+	u32 hw_rev;
+
+	data = devm_kzalloc(mdss->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return NULL;
+
+	hw_rev = readl_relaxed(mdss->mmio + HW_REV);
+	hw_rev = FIELD_GET(MDSS_HW_MAJ_MIN, hw_rev);
+
+	if (hw_rev == MDSS_HW_MSM8996 ||
+	    hw_rev == MDSS_HW_MSM8937 ||
+	    hw_rev == MDSS_HW_MSM8956 ||
+	    hw_rev == MDSS_HW_MSM8998 ||
+	    hw_rev == MDSS_HW_SDM660 ||
+	    hw_rev == MDSS_HW_SDM630) {
+		data->ubwc_dec_version = UBWC_1_0;
+		data->ubwc_enc_version = UBWC_1_0;
+	}
+
+	if (hw_rev == MDSS_HW_MSM8996 ||
+	    hw_rev == MDSS_HW_MSM8998)
+		data->highest_bank_bit = 2;
+	else
+		data->highest_bank_bit = 1;
+
+	return data;
+}
+
 const struct msm_mdss_data *msm_mdss_get_mdss_data(struct device *dev)
 {
 	struct msm_mdss *mdss;
@@ -231,6 +275,13 @@ const struct msm_mdss_data *msm_mdss_get_mdss_data(struct device *dev)
 
 	mdss = dev_get_drvdata(dev);
 
+	/*
+	 * We could not do it at the probe time, since hw revision register was
+	 * not readable. Fill data structure now for the MDP5 platforms.
+	 */
+	if (!mdss->mdss_data && mdss->is_mdp5)
+		mdss->mdss_data = msm_mdss_generate_mdp5_mdss_data(mdss);
+
 	return mdss->mdss_data;
 }
 
-- 
2.39.2

