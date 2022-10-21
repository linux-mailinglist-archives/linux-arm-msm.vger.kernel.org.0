Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6B94607CC7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Oct 2022 18:53:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230151AbiJUQxN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Oct 2022 12:53:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229866AbiJUQxM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Oct 2022 12:53:12 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B381D28B1C1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Oct 2022 09:53:08 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id c3-20020a1c3503000000b003bd21e3dd7aso5520008wma.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Oct 2022 09:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S1Wbe703KgwRjRnGYT1UQwDcnhEdqY3xQGpBo/iRxEg=;
        b=e5cCay4SFUrpxbbt6ZxM5tOq2iPJacFUiZ6rBvOTWdwCsnj2o12Egu9+sXict2iThJ
         ARwmWdHIKdw0ja2J5x+9MdEl7cs4f2r0tnXfx+0bwPQmKYfzWEViMmx0gVwa6LpxgoIL
         WMkC12dSMmOSXd4nAN+yjqm4NVbfNmSnJx9z3hxtta+lpbDkYftEQBwblf01wD10mSH2
         WrkQnRZcl9eFD80EwYKR0mOxVxbJ4CyOJKkd1bHnSdF0yPHTns9OfXoqRkulvslnEm8x
         0EACz0O1lrr40AYC+zOnZ6F82clKqRStr2Cy39R+iQaZJxa/9ZSPLMYFKiz8QQvYO4vd
         C+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S1Wbe703KgwRjRnGYT1UQwDcnhEdqY3xQGpBo/iRxEg=;
        b=MiMk28+Fn3Dn/3JFq8tFTJ75wV1xFNzsA0KY61ETh5pBTxx8HsRjomq3UTb7/oyS70
         QpZ3PZ680N7pIMMWTy3bNjxb+dxjsK4BuJ3A8wWq4vBVZD5AdYg8vd8ZNBS76u49YIKz
         u+FTpOo7Ho7YHNgfm4rNDX3ioewvhxQXaPvfBON2csMhlM6S+n2WIPAehZ1Pox+DVtQy
         kIcqWOY9siUva2w/MlFzGm3L59BD9QmxeUfvEV3Q7CWp22tk3Gx0j/hM1smLOolZoMzn
         YJI5fDOPmaF/b++XFQIULJzn3weDh08aeIwV3rTgOINXmzSra5Ot9qm7Du3/K57tz0sS
         ocYQ==
X-Gm-Message-State: ACrzQf2WrqlGkqGhyu6irWY+my/MDwCImPwFRJsLMyy5DM5DVmC/WrR/
        djv0uB8whl1FNbcn62Lvksr9izqey7rXWw==
X-Google-Smtp-Source: AMsMyM4Zi4sKLRFeFhu+rJ2yQZJXndMNf9H1NeWhhIfBoirnv4nK0nEdKX+Zia/7SRN0e3AXMTIHEg==
X-Received: by 2002:a05:600c:1e2a:b0:3c3:d770:1756 with SMTP id ay42-20020a05600c1e2a00b003c3d7701756mr14158424wmb.134.1666371183770;
        Fri, 21 Oct 2022 09:53:03 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id n14-20020a5d400e000000b0022ae401e9e0sm19541773wrp.78.2022.10.21.09.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 09:53:02 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     broonie@kernel.org
Cc:     lgirdwood@gmail.com, bgoswami@quicinc.com, perex@perex.cz,
        tiwai@suse.com, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 1/9] ASoC: qdsp6: audioreach: topology use idr_alloc_u32
Date:   Fri, 21 Oct 2022 17:51:59 +0100
Message-Id: <20221021165207.13220-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20221021165207.13220-1-srinivas.kandagatla@linaro.org>
References: <20221021165207.13220-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SubGraph and Module Instance ids take 32 bits, so use idr_alloc_u32
instead of idr_alloc to able to accomdate valid ranges.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/topology.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index bd649c232a06..9a3d9e0eae53 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -44,7 +44,7 @@ static struct audioreach_graph_info *audioreach_tplg_alloc_graph_info(struct q6a
 	INIT_LIST_HEAD(&info->sg_list);
 
 	mutex_lock(&apm->lock);
-	ret = idr_alloc(&apm->graph_info_idr, info, graph_id, graph_id + 1, GFP_KERNEL);
+	ret = idr_alloc_u32(&apm->graph_info_idr, info, &graph_id, graph_id, GFP_KERNEL);
 	mutex_unlock(&apm->lock);
 
 	if (ret < 0) {
@@ -53,7 +53,7 @@ static struct audioreach_graph_info *audioreach_tplg_alloc_graph_info(struct q6a
 		return ERR_PTR(ret);
 	}
 
-	info->id = ret;
+	info->id = graph_id;
 
 	return info;
 }
@@ -94,7 +94,7 @@ static struct audioreach_sub_graph *audioreach_tplg_alloc_sub_graph(struct q6apm
 	INIT_LIST_HEAD(&sg->container_list);
 
 	mutex_lock(&apm->lock);
-	ret = idr_alloc(&apm->sub_graphs_idr, sg, sub_graph_id, sub_graph_id + 1, GFP_KERNEL);
+	ret = idr_alloc_u32(&apm->sub_graphs_idr, sg, &sub_graph_id, sub_graph_id, GFP_KERNEL);
 	mutex_unlock(&apm->lock);
 
 	if (ret < 0) {
@@ -103,7 +103,7 @@ static struct audioreach_sub_graph *audioreach_tplg_alloc_sub_graph(struct q6apm
 		return ERR_PTR(ret);
 	}
 
-	sg->sub_graph_id = ret;
+	sg->sub_graph_id = sub_graph_id;
 
 	return sg;
 }
@@ -136,7 +136,7 @@ static struct audioreach_container *audioreach_tplg_alloc_container(struct q6apm
 	INIT_LIST_HEAD(&cont->modules_list);
 
 	mutex_lock(&apm->lock);
-	ret = idr_alloc(&apm->containers_idr, cont, container_id, container_id + 1, GFP_KERNEL);
+	ret = idr_alloc_u32(&apm->containers_idr, cont, &container_id, container_id, GFP_KERNEL);
 	mutex_unlock(&apm->lock);
 
 	if (ret < 0) {
@@ -145,7 +145,7 @@ static struct audioreach_container *audioreach_tplg_alloc_container(struct q6apm
 		return ERR_PTR(ret);
 	}
 
-	cont->container_id = ret;
+	cont->container_id = container_id;
 	cont->sub_graph = sg;
 	/* add to container list */
 	list_add_tail(&cont->node, &sg->container_list);
@@ -181,7 +181,7 @@ static struct audioreach_module *audioreach_tplg_alloc_module(struct q6apm *apm,
 				       AR_MODULE_DYNAMIC_INSTANCE_ID_START,
 				       AR_MODULE_DYNAMIC_INSTANCE_ID_END, GFP_KERNEL);
 	} else {
-		ret = idr_alloc(&apm->modules_idr, mod, module_id, module_id + 1, GFP_KERNEL);
+		ret = idr_alloc_u32(&apm->modules_idr, mod, &module_id, module_id, GFP_KERNEL);
 	}
 	mutex_unlock(&apm->lock);
 
@@ -191,7 +191,7 @@ static struct audioreach_module *audioreach_tplg_alloc_module(struct q6apm *apm,
 		return ERR_PTR(ret);
 	}
 
-	mod->instance_id = ret;
+	mod->instance_id = module_id;
 	/* add to module list */
 	list_add_tail(&mod->node, &cont->modules_list);
 	mod->container = cont;
-- 
2.21.0

