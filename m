Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA85F60F4FA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Oct 2022 12:27:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235086AbiJ0K1u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Oct 2022 06:27:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233280AbiJ0K1o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Oct 2022 06:27:44 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 777CA125030
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Oct 2022 03:27:43 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id w14so1382192wru.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Oct 2022 03:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cF5Zvj+Kzci/ADALngKgDuePH0r1ubNxIDC6FLO5nXI=;
        b=OfmcnN2ATMaOpm5S6kmUIuDgV9Frpxx46brWhLZxI1dy82qO45G2ZGVowls6lCKTWO
         HAqZnnXtVgJrIQP/DUGZqt5mFCCzx5Y7lSMkGOKJx4WW+LGu2Z5nZLcssfuyNcnuC/4k
         JFWkhSpO/CZyeaaJLrou68ss3ypdAP9sZSA71qq9jpwCWmnUFM6zok3vylJKFKDyQgXI
         liThdInxxTImzhJIjRlZIFwJ9f7kMtwXuT2rlaeZRCqkIBy+ig4gi0rACnSq5I4y+ZPI
         Yfr5/Vg57Vhc0aKaSaZ3vLERuUNXYS4R8dZ+9EPd1xc3aShX3CvfmTJvYpSUZt0R5FmB
         x7Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cF5Zvj+Kzci/ADALngKgDuePH0r1ubNxIDC6FLO5nXI=;
        b=zCQF2OG5tMPZRdWXF6ZoDAKmNOMNTIGZHqgYYZeRI95T/0tGKMiESjBZVn3+mVC1kZ
         nNPBIGtXEcL0MvEUB5YLFESlqH86CtA6VmXPSbl106kMWJoeUdDXy+lqzJTfqW3KaLgu
         9A2wF+bSX9WWzbkbbBjhxUwZ0DBlsbaJdbBzYZUSp0j151AV/jaEHb3JVFYzVdMtingO
         QfSpImBY8vdSnQUCNXL6ahEtRE5lVuUnfhRhYBQ357gIscRuiBFiBVFttpgfQpGAO7um
         vMdV+rvIMDpWHp/TXad5i2bKABncz5icaRijSulZTFkOoj5lWzA2zjLavGhRDVKttnoY
         SIuw==
X-Gm-Message-State: ACrzQf26d7vvSU/DBFmmkZBMPrXnDRBgX2MrVXX0RbP9VHHP6pjZcnSz
        aXDRcfLxPwSzlzOIQDsAZJ9LcA==
X-Google-Smtp-Source: AMsMyM6DoyMFwCAihYX8DnGbkz/UnKKCrN0y33wb+sh9AQ/ZFnMVkmJJ8x01wwKJnoT+Hxu81BRRZw==
X-Received: by 2002:adf:e7c8:0:b0:236:6a30:cb2e with SMTP id e8-20020adfe7c8000000b002366a30cb2emr15899887wrn.12.1666866461938;
        Thu, 27 Oct 2022 03:27:41 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id fc7-20020a05600c524700b003b505d26776sm5088674wmb.5.2022.10.27.03.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 03:27:41 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     broonie@kernel.org
Cc:     lgirdwood@gmail.com, bgoswami@quicinc.com, perex@perex.cz,
        tiwai@suse.com, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 2/9] ASoC: qdsp6: audioreach: remove unused connection_list
Date:   Thu, 27 Oct 2022 11:27:03 +0100
Message-Id: <20221027102710.21407-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20221027102710.21407-1-srinivas.kandagatla@linaro.org>
References: <20221027102710.21407-1-srinivas.kandagatla@linaro.org>
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

Remove unused connection_list parameter.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/audioreach.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 3ee8bfcd0121..36779ad1952d 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -595,7 +595,6 @@ struct audioreach_graph_info {
 	int id;
 	uint32_t num_sub_graphs;
 	struct list_head sg_list;
-	struct list_head connection_list;
 };
 
 struct audioreach_sub_graph {
-- 
2.21.0

