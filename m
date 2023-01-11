Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0890A66639D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 20:20:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233540AbjAKTUa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 14:20:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233812AbjAKTUR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 14:20:17 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB94D17590
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 11:20:15 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id f21so12639527ljc.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 11:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3AhipNdUlWN9AbhRoLOzZ2NK2gpWaDz53TgzowVTocw=;
        b=tw+J9F+ewI/lWZU5ILCXu7Qz+Ks3dg452r8lBkwcpoU4WIQOAz3+lX0hLwCkaJCOs+
         Yz/tG4eAAz4sqLc3YK893Yi0hTf/X0bE3Y1nklgKDtxwfhQtMsR93FZNoFSfnesmA6sn
         DvlFo0wp/+5XCP304n49w8xzhnm82uLRNHQYti7nNRjFcbX3PStemGJl+302IfdCAtTm
         rSsD2pBQuUMliMoqvoI/UWlKFHP+f1e7NrfjLGMVJOdzvfuWt5wJ+icok1spNAz9kA5e
         L3vD72Ntz+999uY5C4jM8Euk64knziL4Gdyv65hEgF6nmBgq/pRgch1mNksh1NA7AN3l
         5Veg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3AhipNdUlWN9AbhRoLOzZ2NK2gpWaDz53TgzowVTocw=;
        b=5mXv0PW7ElXNQTBT42K5mYdXTu6/4NTG6Wx6fuw+IdrRCXeWFJI6460izgg165B9RQ
         1BhhekburX3eqE4d4CSGrBAXnwT4HiWSoMh4dUH3Dod6XMUpUaePZWuQj+BDnS5Tfd1G
         d7PHbXfgjIQCuGu3Qb4VafCon/14DtHGqo9WMJzH9j02aW/sT1nCROS8qQ4R91wPaQWL
         iKyXd+0Hb7eHVBupdRuVYUQBb5VZRD28QBHIFJQdd/Yjg9Hb0Cf6bfs+jcIcQ5z4eI1U
         fszU1rvUo/R+pjpAEG8+M3+IWN/Ubv3zrJX7k1Meq4cuX1h+8DdqgWYutU7y+kTdmvJ/
         wI7Q==
X-Gm-Message-State: AFqh2kqMxWYmrhi4MrL3dUK18yXhkilE9s8D/mxynd0Y+otAIZyUDbUz
        BXw5tC+o4ePbQ7gCLXkWoUnu6Q==
X-Google-Smtp-Source: AMrXdXsrq7udCWnA0KOBV+AUSbStJ4mL5AVT2az27PjmkrmvZ3znPHYeYs1NEO9QkxoeyTzXka/vJQ==
X-Received: by 2002:a2e:9d86:0:b0:286:f883:f082 with SMTP id c6-20020a2e9d86000000b00286f883f082mr2318684ljj.42.1673464814176;
        Wed, 11 Jan 2023 11:20:14 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id bj36-20020a2eaaa4000000b0027ff2fabcb5sm1807787ljb.104.2023.01.11.11.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 11:20:13 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 10/13] clk: qcom: cpu-8996: fix ACD initialization
Date:   Wed, 11 Jan 2023 22:20:01 +0300
Message-Id: <20230111192004.2509750-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230111192004.2509750-1-dmitry.baryshkov@linaro.org>
References: <20230111192004.2509750-1-dmitry.baryshkov@linaro.org>
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

The vendor kernel applies different order while programming SSSCTL and
L2ACDCR registers on power and performance clusters. However it was
demonstrated that doing this upstream results in the board reset. Make
both clusters use the same sequence, which fixes the reset.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-cpu-8996.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
index 47c58bb5f21a..1c00eb629b61 100644
--- a/drivers/clk/qcom/clk-cpu-8996.c
+++ b/drivers/clk/qcom/clk-cpu-8996.c
@@ -475,9 +475,9 @@ static int qcom_cpu_clk_msm8996_register_clks(struct device *dev,
 	return ret;
 }
 
-#define CPU_AFINITY_MASK 0xFFF
-#define PWRCL_CPU_REG_MASK 0x3
-#define PERFCL_CPU_REG_MASK 0x103
+#define CPU_CLUSTER_AFFINITY_MASK 0xf00
+#define PWRCL_AFFINITY_MASK 0x000
+#define PERFCL_AFFINITY_MASK 0x100
 
 #define L2ACDCR_REG 0x580ULL
 #define L2ACDTD_REG 0x581ULL
@@ -498,21 +498,17 @@ static void qcom_cpu_clk_msm8996_acd_init(struct regmap *regmap)
 	if (val == 0x00006a11)
 		goto out;
 
-	hwid = read_cpuid_mpidr() & CPU_AFINITY_MASK;
-
 	kryo_l2_set_indirect_reg(L2ACDTD_REG, 0x00006a11);
 	kryo_l2_set_indirect_reg(L2ACDDVMRC_REG, 0x000e0f0f);
 	kryo_l2_set_indirect_reg(L2ACDSSCR_REG, 0x00000601);
 
-	if (PWRCL_CPU_REG_MASK == (hwid | PWRCL_CPU_REG_MASK)) {
-		regmap_write(regmap, PWRCL_REG_OFFSET + SSSCTL_OFFSET, 0xf);
-		kryo_l2_set_indirect_reg(L2ACDCR_REG, 0x002c5ffd);
-	}
+	kryo_l2_set_indirect_reg(L2ACDCR_REG, 0x002c5ffd);
 
-	if (PERFCL_CPU_REG_MASK == (hwid | PERFCL_CPU_REG_MASK)) {
-		kryo_l2_set_indirect_reg(L2ACDCR_REG, 0x002c5ffd);
+	hwid = read_cpuid_mpidr();
+	if ((hwid & CPU_CLUSTER_AFFINITY_MASK) == PWRCL_AFFINITY_MASK)
+		regmap_write(regmap, PWRCL_REG_OFFSET + SSSCTL_OFFSET, 0xf);
+	else
 		regmap_write(regmap, PERFCL_REG_OFFSET + SSSCTL_OFFSET, 0xf);
-	}
 
 out:
 	spin_unlock_irqrestore(&qcom_clk_acd_lock, flags);
-- 
2.30.2

