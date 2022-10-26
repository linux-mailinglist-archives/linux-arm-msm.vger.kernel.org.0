Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1765860DF21
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Oct 2022 13:02:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232748AbiJZLC2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Oct 2022 07:02:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233339AbiJZLC0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Oct 2022 07:02:26 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBA68B56D8
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Oct 2022 04:02:25 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id v130-20020a1cac88000000b003bcde03bd44so1186091wme.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Oct 2022 04:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y4sQJzVrHni1WLAuaAcAXcY4IxBG/K5oBIjFNgyTIGU=;
        b=TAx4tjE+S9rXc/zlFGGPRl0uwIS/mtGtuJhj7IGSzfeIMVzaco9BF+sU98thou5Lgj
         C0JW8r0zxjpHDi8rzTS5doOZ8Gz3TnF3Ko47ZbObPbEtOiV/XczTTpCtT5Ba2yMs4k+B
         pVNYj0RW8tOCU53hk3rl0NmNgNTk52yI7qQ9ts6Ifjz2dS5epGUYe8Act0oylQB5oh8y
         wayfnhvtZhP+CWjdF+iHl2nGWhus+jPR+QftOAj4Kjkr93LT4qw8p5NssmqKSpWWYc9f
         2xK+G3bYSycJwqnyByA0N5cIel8sF93aBKc2HqMaOr+na6uDjdvC/uMMj9ms4PKkYBBI
         zDPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y4sQJzVrHni1WLAuaAcAXcY4IxBG/K5oBIjFNgyTIGU=;
        b=QrIDctC1V/iHvsfN+gDL3l3UwULHf5t1aWHo9/zB8EFSrcypjKVDvT5TUeNx4OljcX
         f5oIhIt6gRZXJ2i5oBdKE9GEpcihUxAbpwyzESn/3YWlgfHNfoqu1AwrFgqEttw7SsQR
         IoLG5aHpGshKP7Px0OG1AVyLuBF9wiq3ITL5g3F4DysGSdxo4W3eewL8a2X5zZqZ4C3I
         ie5KOABd6QQ++HwoUYAS6l5d8EaLJBgZAApBY77NmWHGy/ojz15iswZiW63Wb2iMlfPv
         t6irmum8ysapxvAytTjD3sg4jdzkR+Ukkn8XcHD/lL2J4Rq6uDI9KmRVRQjNHBMS1mTa
         XnaA==
X-Gm-Message-State: ACrzQf2ZkdTCikHvHV0IaopW0YpoMdYlay9zVFbN1ausjrjkltN+2fUw
        e8n12JFr6BMQWYMbEToq8wcMsA==
X-Google-Smtp-Source: AMsMyM4t3DrevQscMkmgZc4rCImgXYHUyH8qdu8R1qhL4s0qQ6jxINMjpcMiDIDbfXGoqF8UFpXVBw==
X-Received: by 2002:a05:600c:244:b0:3c6:bc2f:421b with SMTP id 4-20020a05600c024400b003c6bc2f421bmr2040804wmj.32.1666782144503;
        Wed, 26 Oct 2022 04:02:24 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id z7-20020a5d44c7000000b0023672104c24sm5237415wrr.74.2022.10.26.04.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 04:02:23 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     vkoul@kernel.org, yung-chuan.liao@linux.intel.com
Cc:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org,
        pierre-louis.bossart@linux.intel.com, sanyog.r.kale@intel.com,
        srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        alsa-devel@alsa-project.org
Subject: [PATCH 2/6] soundwire: qcom: check for outanding writes before doing a read
Date:   Wed, 26 Oct 2022 12:02:06 +0100
Message-Id: <20221026110210.6575-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20221026110210.6575-1-srinivas.kandagatla@linaro.org>
References: <20221026110210.6575-1-srinivas.kandagatla@linaro.org>
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

Reading will increase the fifo count, so check for outstanding cmd wrt.
write fifo depth to avoid overflow as read will also increase
write fifo cnt.

Fixes: a661308c34de ("soundwire: qcom: wait for fifo space to be available before read/write")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/qcom.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 8f1a1eb017a2..cee2b2223141 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -380,6 +380,12 @@ static int qcom_swrm_cmd_fifo_rd_cmd(struct qcom_swrm_ctrl *swrm,
 
 	val = swrm_get_packed_reg_val(&swrm->rcmd_id, len, dev_addr, reg_addr);
 
+	/*
+	 * Check for outstanding cmd wrt. write fifo depth to avoid
+	 * overflow as read will also increase write fifo cnt.
+	 */
+	swrm_wait_for_wr_fifo_avail(swrm);
+
 	/* wait for FIFO RD to complete to avoid overflow */
 	usleep_range(100, 105);
 	swrm->reg_write(swrm, SWRM_CMD_FIFO_RD_CMD, val);
-- 
2.21.0

