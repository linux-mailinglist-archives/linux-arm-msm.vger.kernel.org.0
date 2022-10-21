Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C2B9607CCE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Oct 2022 18:53:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231210AbiJUQx1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Oct 2022 12:53:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231225AbiJUQxX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Oct 2022 12:53:23 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80A9D28DC13
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Oct 2022 09:53:14 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id bh7-20020a05600c3d0700b003c6fb3b2052so2447623wmb.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Oct 2022 09:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JOZVp/Ggs8l86OX0u92Nyg/+QC7QhjHhV1ZLVFPgdYY=;
        b=RnL67RMkA+EJ3Aokp+TMvkQH8J/bZTNsUsG+3rsseURrIibiPD3Zf5PxOiguP7S1CR
         2Jxd3581YdcKRV153AIqR/ys8GrkxkExOkxJsPNh+2p2lsb3X9QbxOYEdNxSSe9hu+aG
         MQMKqAbuDh8wvfHw6AF7I/Jzs2sZ2kzoYzhO0o3o3f/5M3oDynSaxQchvYm3dmqXhHso
         RJG15erItdianrV6fjqWuTKenHcBP9q+umC9i50q/FY4iOIKMrN5fUa52OTB66JD5Amu
         5TbU/qzw7zofHnmW4TPL4nX8444lXIWY5M5KhNoL8IWZLTG5RbIOhKMh4fEum+YVyGvD
         PHBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JOZVp/Ggs8l86OX0u92Nyg/+QC7QhjHhV1ZLVFPgdYY=;
        b=3qc2HDXC9e4+fthn3iMdaz6H7ol192ZaosGY5HX5qh5kYgV7B41sLap/QC2NJU12I6
         lXJsQfR02Z00WE1gMhQ8FOcMvnVNdeLsjAVqSTllB3jaN4N+6f9cGFroqysB4b73sOJh
         HYN/gETULXIuuDMV48DFK9Ip6MbzL9aHb/D7fVjmYcDxbT+fbOnlTLteJL1/3Ex0PbL7
         Yux9jwb7qck05qVMyEt2Ao7VzdUHLRsUEEZCUAiiBqbAoUQ+lx8BhPieG3/+I7JMAmd3
         qxHaFWQL4FjVpF7ND01vwVzJdA3/Xmt1ghj2e+RxXsIy1o7VXaot84CePAiIU3dUSa+C
         3AnA==
X-Gm-Message-State: ACrzQf0RrbfbcH6Lh9gFozpQjClX+DC8gcA4fnq4pDFskvSB525etizm
        d+xNRVlaYswN1H+epjHBilEyjA==
X-Google-Smtp-Source: AMsMyM6bZ7Fut46UXEJXz3eujYSaD80z2+GiG97gw0xTThTm7k6gES7WQlr3TWe++w7wEw6MgmtBuQ==
X-Received: by 2002:a05:600c:4e50:b0:3c6:faaa:1e7d with SMTP id e16-20020a05600c4e5000b003c6faaa1e7dmr14310340wmq.9.1666371191002;
        Fri, 21 Oct 2022 09:53:11 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id n14-20020a5d400e000000b0022ae401e9e0sm19541773wrp.78.2022.10.21.09.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 09:53:09 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     broonie@kernel.org
Cc:     lgirdwood@gmail.com, bgoswami@quicinc.com, perex@perex.cz,
        tiwai@suse.com, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 5/9] ASoC: qdsp6: audioreach: simplify module_list sz calculation
Date:   Fri, 21 Oct 2022 17:52:03 +0100
Message-Id: <20221021165207.13220-6-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20221021165207.13220-1-srinivas.kandagatla@linaro.org>
References: <20221021165207.13220-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Simplify module_list size calcuation by doing inside modules loop.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/audioreach.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 0015ec89d90b..87a3fd1f8107 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -430,7 +430,6 @@ void *audioreach_alloc_graph_pkt(struct q6apm *apm, struct audioreach_graph_info
 	struct audioreach_sub_graph *sgs;
 	struct apm_mod_list_obj *mlobj;
 	struct list_head *sg_list;
-	int num_modules_per_list;
 	int num_connections = 0;
 	int num_containers = 0;
 	int num_sub_graphs = 0;
@@ -451,6 +450,9 @@ void *audioreach_alloc_graph_pkt(struct q6apm *apm, struct audioreach_graph_info
 		list_for_each_entry(container, &sgs->container_list, node) {
 			num_containers++;
 			num_modules += container->num_modules;
+			ml_sz = ml_sz + sizeof(struct apm_module_list_params) +
+				APM_MOD_LIST_OBJ_PSIZE(mlobj, container->num_modules);
+
 			list_for_each_entry(module, &container->modules_list, node) {
 				if (module->src_mod_inst_id)
 					num_connections++;
@@ -459,11 +461,11 @@ void *audioreach_alloc_graph_pkt(struct q6apm *apm, struct audioreach_graph_info
 	}
 
 	num_modules_list = num_containers;
-	num_modules_per_list = num_modules/num_containers;
 	sg_sz = APM_SUB_GRAPH_PSIZE(sg_params, num_sub_graphs);
 	cont_sz = APM_CONTAINER_PSIZE(cont_params, num_containers);
-	ml_sz =	ALIGN(sizeof(struct apm_module_list_params) +
-		num_modules_list * APM_MOD_LIST_OBJ_PSIZE(mlobj,  num_modules_per_list), 8);
+
+	ml_sz = ALIGN(ml_sz, 8);
+
 	mp_sz = APM_MOD_PROP_PSIZE(mprop, num_modules);
 	mc_sz =	APM_MOD_CONN_PSIZE(mcon, num_connections);
 
-- 
2.21.0

