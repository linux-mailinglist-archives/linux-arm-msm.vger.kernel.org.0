Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8A1B60F506
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Oct 2022 12:28:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234812AbiJ0K15 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Oct 2022 06:27:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234928AbiJ0K1s (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Oct 2022 06:27:48 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E57ADDB4B
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Oct 2022 03:27:47 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id g12so1376629wrs.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Oct 2022 03:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8PzGOU3cHi3C/xmeEh0jzvedpAW9sTnCtCJCz/dvKXw=;
        b=kmV7eRAwmX8oQYf73+tBJXu8eVBs3MEay0gi6/jZolwjNmntD04cdJrbfmVKBYB+CV
         r9lpGwwm2qZhvgMLWHLMc2LbSjONA7zBfHof42h3Ri4DgnMaRT06/ORl+SYOupi+jfdP
         4m+yh8AiGtfzvWMiqzIGXu1hDGRWKy/qPaNZ2a9CYqZjyAFczd+78pW0rX+32BrYBmf3
         ql+5TjspKrIkVn79k35TiRprdY9j5r22rErgkm0pksOT7htanoBuY+mnodh+ZgAutGrL
         zYj4tjKGrjebdTjxzsvzUNrAo/7IXblaM3iPc8u3iq6SuS2wChxQDx9Lvi87SLE7HZEp
         f+qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8PzGOU3cHi3C/xmeEh0jzvedpAW9sTnCtCJCz/dvKXw=;
        b=AYnxoPzbVgbtsi7QhzIbk8aJ79xn/0eGHTafVz3Ez3fe2CZAzU1KMNvbTQU0PBRtEB
         5nfpxst9oOM8PUQTmLV2DGB8AIe+/ov3/fhThJpzg5hf43C2/eUVqg3qYempu7p+54gr
         TBE5k4x1W/f8vBc90FuehrF66DZagE/YOHDtfNTQlUuNLQql6vIbBs+7CFoDwawVkAJg
         Xwu3oNIT/2tu9dIxBscS1lNRBYaAHTBXSkXQDfsIwSYeYvADSrN0pwDtQsFt55z/bbYW
         VpP4cjSL+l2fuQfI8etNdOTQsdRcFj3KPW9sJnWOJsgt3w+G+qnxh2IZxiTOcq4O8bWO
         rX+g==
X-Gm-Message-State: ACrzQf25bnlOuYK2tB+oybQU49iU5tortNStHT/nPXbRAEnQkCV7s1yd
        Tw5R9qAF3/WB9UF3U3Sm5gqkOw==
X-Google-Smtp-Source: AMsMyM4oW1eAyDqgv6Txm8fwAyZp2AlhsWI2Ho4+c1Tv2pcgZRqCElLkiMSTBdHOgDUCMidAwPNocQ==
X-Received: by 2002:a5d:5988:0:b0:236:6e28:a493 with SMTP id n8-20020a5d5988000000b002366e28a493mr14754569wri.66.1666866465783;
        Thu, 27 Oct 2022 03:27:45 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id fc7-20020a05600c524700b003b505d26776sm5088674wmb.5.2022.10.27.03.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 03:27:44 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     broonie@kernel.org
Cc:     lgirdwood@gmail.com, bgoswami@quicinc.com, perex@perex.cz,
        tiwai@suse.com, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 5/9] ASoC: qdsp6: audioreach: simplify module_list sz calculation
Date:   Thu, 27 Oct 2022 11:27:06 +0100
Message-Id: <20221027102710.21407-6-srinivas.kandagatla@linaro.org>
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

Simplify module_list size calculation by doing inside modules loop.

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

