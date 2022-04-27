Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A81F9510DF0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Apr 2022 03:34:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356741AbiD0Bfk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Apr 2022 21:35:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356739AbiD0Bfj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Apr 2022 21:35:39 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1331646B27
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 18:32:29 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id a15so312831pfv.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 18:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=E4TARPsvw/6+T5xnBdJYIvhddKnceWXOgm76kowYwB4=;
        b=eBoaI9KnKdjcjCGhUBWnufouBY5PH1rYH44I3Jf8h9NKLIuR81SA2zDiglWU+lzDkp
         WCszhz5uvqLHug4eDyFdMjLzVUf2YD7v1eCtzM/8LLixnPZ99nyqqa0qpF9UavlbgVs1
         9e2s1ql4hz+dpB+eaWXi5VT+xnRNf7m1LDtLA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=E4TARPsvw/6+T5xnBdJYIvhddKnceWXOgm76kowYwB4=;
        b=4dkLcZRE87XCcqZMUkYG9KdtS52zScUL6cDqfs1aORLk0LxP8Dvcz/pNquYU8xalVN
         3wPy+9UOCoh0CSff7fM6lSSiaJckU9iG/v2D2PX3vSSPFQFt4jAZE38obrQoceagfnnG
         mNctkFAZCFmH/fHVx7Y9BnyosU5DrMWtNTsyF7aEyW3pyQfGyiO7dGDBSUCiLlTmUwby
         7hPw/ewZnjMLCiNWsys1iRfRCU5vvXpjBo1Uw8+Jm3SzJpChpg0vT3PMVskExUOw7md/
         /jj8fk5UTwlXkOPIcpr56w66V0mOV8rlY8rHg6kQGNpegNGtvyZZqovSDBjlr9pQY6L3
         O2oA==
X-Gm-Message-State: AOAM532zBRTHAzTNexVTCw0zRzVRj7/KAnH19ImkDWUrWQf8YuQu/xwS
        SY36gJjTLL1E+CCKyQQkRcrWcg==
X-Google-Smtp-Source: ABdhPJxiRnUb0EOiLoh+dgt8l52uaf+WN6GBsR2KA/LrzuMlZVFfpWUZAXKIMi9G1qMoHiAv24I/Bw==
X-Received: by 2002:aa7:82d9:0:b0:4fa:2c7f:41e with SMTP id f25-20020aa782d9000000b004fa2c7f041emr27548617pfn.1.1651023148003;
        Tue, 26 Apr 2022 18:32:28 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:482e:60bc:84d1:bf5c])
        by smtp.gmail.com with ESMTPSA id n20-20020a634d54000000b0039d18bf7864sm14019589pgl.20.2022.04.26.18.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 18:32:27 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Georgi Djakov <djakov@kernel.org>
Cc:     linux-kernel@vger.kernel.org, patches@lists.linux.dev,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Alex Elder <elder@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Mike Tipton <quic_mdtipton@quicinc.com>
Subject: [PATCH] interconnect: Restore sync state by ignoring ipa-virt in provider count
Date:   Tue, 26 Apr 2022 18:32:26 -0700
Message-Id: <20220427013226.341209-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.36.0.rc2.479.g8af0fa9b8e-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Ignore compatible strings for the IPA virt drivers that were removed in
commits 2fb251c26560 ("interconnect: qcom: sdx55: Drop IP0
interconnects") and 2f3724930eb4 ("interconnect: qcom: sc7180: Drop IP0
interconnects") so that the sync state logic can kick in again.
Otherwise all the interconnects in the system will stay pegged at max
speeds because 'providers_count' is always going to be one larger than
the number of drivers that will ever probe on sc7180 or sdx55. This
fixes suspend on sc7180 and sdx55 devices when you don't have a
devicetree patch to remove the ipa-virt compatible node.

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Doug Anderson <dianders@chromium.org>
Cc: Alex Elder <elder@linaro.org>
Cc: Taniya Das <quic_tdas@quicinc.com>
Cc: Mike Tipton <quic_mdtipton@quicinc.com>
Fixes: 2fb251c26560 ("interconnect: qcom: sdx55: Drop IP0 interconnects")
Fixes: 2f3724930eb4 ("interconnect: qcom: sc7180: Drop IP0 interconnects")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/interconnect/core.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/interconnect/core.c b/drivers/interconnect/core.c
index 9050ca1f4285..c52915a58b22 100644
--- a/drivers/interconnect/core.c
+++ b/drivers/interconnect/core.c
@@ -1087,9 +1087,15 @@ static int of_count_icc_providers(struct device_node *np)
 {
 	struct device_node *child;
 	int count = 0;
+	const struct of_device_id ignore_list[] = {
+		{ .compatible = "qcom,sc7180-ipa-virt" },
+		{ .compatible = "qcom,sdx55-ipa-virt" },
+		{}
+	};
 
 	for_each_available_child_of_node(np, child) {
-		if (of_property_read_bool(child, "#interconnect-cells"))
+		if (of_property_read_bool(child, "#interconnect-cells") &&
+		    likely(!of_match_node(ignore_list, child)))
 			count++;
 		count += of_count_icc_providers(child);
 	}

base-commit: 2fb251c265608636fc961b7d38e1a03937e57371
-- 
https://chromeos.dev

