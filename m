Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 683D35AB20E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Sep 2022 15:49:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237977AbiIBNtr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Sep 2022 09:49:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238052AbiIBNt3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Sep 2022 09:49:29 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86145133F1E
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Sep 2022 06:24:15 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id t5so2649939edc.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Sep 2022 06:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=f3juMO/QwGZ+BjBeOfHfdqcLNOZRF7cyhCYwluCkxeQ=;
        b=FsvfCD4fFri9ZLt4icWNoxumI89IaBr46swWniyCuaSJIEgzeprtbrHKzzgjqYIfNp
         KRGG4CvVTRTSNNsyAVq50oSjSh6Cl57nmqnEyucaCudM+mpqOLwWccWUSX6fuOetOoNk
         y3iccoLOQLwA8swtNmI+xqQKdMN8GUCoBAH37dzl0Hcrx/age5SuN/Yk8JAs6f+C24Gc
         nzzr7PupYNEukcZLFi4LHdvNiqJO3DBrreLnasJ2PvE4ij9pAP2x1ClvMopst7yMCKEG
         ylLL7HQuzcu8ESuSP0uKw3KzL1NqeAiTqdieUM44xfsRh+63UfXvfS2wRJZCvy3G4pbe
         o3EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=f3juMO/QwGZ+BjBeOfHfdqcLNOZRF7cyhCYwluCkxeQ=;
        b=sIYESdKNY381CRYp06f+3zzvY6qbHAljb+5xgsCZvPBygVhtu/h0kBOdp4S9wDy7h9
         MShnjhQH998AfZ8JXBZzJMkHrTkRJEe15Rim4sc+NiFt1qxanGs8XtextnmOONanK/1V
         cpng/4/2BYnLUF3g1J9vsAw/vW32T9rVcfzbhdYQQbUdbAq1eJ1pfvwp9Y5cBuV81XZA
         JVPqeZAjer0A3G0QeENaQ+L2D9luXeZWhhsg0YdXRpm6mpKpo0xYUgyIOUJH+u61s/H8
         l/PaBkqWM7tB1v8NcX9bodDEOpW0prrzuaqwX4Ky6hhLELsiskB+oAdAQhl1GW7+1MSu
         ZLjw==
X-Gm-Message-State: ACgBeo2rh/QoHUD+K/t6eAOpllfv/jusEuUyn/NSSdPXg8hU+x4Vl123
        NL38uypETjh5rSSLRU+g5tyGfSjuLaAp/bd0
X-Google-Smtp-Source: AA6agR6OqKinT5/4EHt46gGsDbPUCuf9XqOtGSv0Ynobk2lD+nB1338peyuhMf7gWAERZgPSG/KbGQ==
X-Received: by 2002:a5d:46d0:0:b0:226:d133:3a4a with SMTP id g16-20020a5d46d0000000b00226d1333a4amr16789519wrs.400.1662124472225;
        Fri, 02 Sep 2022 06:14:32 -0700 (PDT)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id v14-20020a5d43ce000000b002253fd19a6asm1766253wrr.18.2022.09.02.06.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 06:14:31 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorande@qti.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Ekansh Gupta <ekangupt@qti.qualcomm.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [PATCH 08/14] misc: fastrpc: Use fastrpc_map_put in fastrpc_map_create on fail
Date:   Fri,  2 Sep 2022 16:13:38 +0300
Message-Id: <20220902131344.3029826-9-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220902131344.3029826-1-abel.vesa@linaro.org>
References: <20220902131344.3029826-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move the kref_init right after the allocation so that we can use
fastrpc_map_put on any following error case.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/misc/fastrpc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 6730aa324e10..5eececd9b6bd 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -745,6 +745,8 @@ static int fastrpc_map_create(struct fastrpc_user *fl, int fd,
 		return -ENOMEM;
 
 	INIT_LIST_HEAD(&map->node);
+	kref_init(&map->refcount);
+
 	map->fl = fl;
 	map->fd = fd;
 	map->buf = dma_buf_get(fd);
@@ -771,7 +773,6 @@ static int fastrpc_map_create(struct fastrpc_user *fl, int fd,
 	map->size = len;
 	map->va = sg_virt(map->table->sgl);
 	map->len = len;
-	kref_init(&map->refcount);
 
 	if (attr & FASTRPC_ATTR_SECUREMAP) {
 		/*
@@ -801,7 +802,7 @@ static int fastrpc_map_create(struct fastrpc_user *fl, int fd,
 attach_err:
 	dma_buf_put(map->buf);
 get_err:
-	kfree(map);
+	fastrpc_map_put(map);
 
 	return err;
 }
-- 
2.34.1

