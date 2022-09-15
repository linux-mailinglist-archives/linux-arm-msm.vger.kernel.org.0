Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B01665B9AF5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Sep 2022 14:38:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229898AbiIOMi4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Sep 2022 08:38:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229838AbiIOMix (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Sep 2022 08:38:53 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE87880487
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Sep 2022 05:38:52 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id k9so30732542wri.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Sep 2022 05:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=cF5Zvj+Kzci/ADALngKgDuePH0r1ubNxIDC6FLO5nXI=;
        b=xRntcD65ImZt0Qvcy5pgORY8i31L4sVZXe4AvYM+9j8OpHdQxrbHMOiDRsipUHWcCd
         l5AhGGwxRmY+PMQ9DE8rpupkzkthHuG83aHtPMhws4f4NK/xi5uMFP5XOoKW3DFoLC8f
         kz//kloxDtoXlbLKruVBhpBrOJ/0is+k0tZMz6kH2JfWaPWy3awtygdjC+J1Mk5PNpdm
         uxFOVftD1ukCEMga7GQc2mQ1u39oOCHPSCe2O9L/4vvacTP/+ma2gRwko/OzE+TkBscy
         gcOOeMdO1eCw+/p85RqzmwAo3uJB4qwBShSGAW58mIB6Qc8OcqZ7N8NND00Ty9i/Pec8
         /uHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=cF5Zvj+Kzci/ADALngKgDuePH0r1ubNxIDC6FLO5nXI=;
        b=NObDLANEsqAeSVqiXNynvFUGE87tV9k0FpJ4i6w8pkJtnMzNh5+rn9wjOKyW8T9xZ/
         8OKJlOv5ShLn9FQozwRzDnpSq2ysXB/wjFHhT+EvX+dQjU92Nvo2H4D2BX5Zg4rGuMSp
         PO4CE7rDd0d/6lpAclZyoFXfB6aSLm0ogh4X6EKmbS6g+WM/95QcQVZyUbI5DgfC22S8
         YKBW2MQDqESynv9run8r7KQapLHrz+iurstyuC0DN98RTB4fiJ7PD1nrcZsXf+jl6b6w
         KFez02yb/2kp20pvn5Wq0oniBnVNzperiTrvNtVDdW2EQ3k7B2QN5PdRm2pgqrwCU6oZ
         3GLA==
X-Gm-Message-State: ACgBeo3wW0FJDxY8/fA33tZUy9Tm+yjDvUo4cc3Cl5B7MEJF5oAD1dWc
        icN4hGCYqo7XPeZrxH6f8QSAoQ==
X-Google-Smtp-Source: AA6agR6BXpa+AHGkWqlwHEYogbX1by5tJVRtrI+F2Bpc7XdH5DCzlDtGbU/IgmNpyapi98wEYpw7aQ==
X-Received: by 2002:a05:6000:1a8a:b0:22a:43ef:94f0 with SMTP id f10-20020a0560001a8a00b0022a43ef94f0mr17546728wry.279.1663245531516;
        Thu, 15 Sep 2022 05:38:51 -0700 (PDT)
Received: from srini-hackbox.lan (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.gmail.com with ESMTPSA id bg13-20020a05600c3c8d00b003a5f4fccd4asm3112559wmb.35.2022.09.15.05.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 05:38:50 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     broonie@kernel.org
Cc:     lgirdwood@gmail.com, bgoswami@quicinc.com, perex@perex.cz,
        tiwai@suse.com, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 2/9] ASoC: qdsp6: audioreach: remove unused connection_list
Date:   Thu, 15 Sep 2022 13:38:30 +0100
Message-Id: <20220915123837.11591-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220915123837.11591-1-srinivas.kandagatla@linaro.org>
References: <20220915123837.11591-1-srinivas.kandagatla@linaro.org>
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

