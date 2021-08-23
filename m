Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83E0F3F461E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Aug 2021 09:54:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235427AbhHWHy6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Aug 2021 03:54:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235241AbhHWHy6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Aug 2021 03:54:58 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2354DC061575
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Aug 2021 00:54:16 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id mw10-20020a17090b4d0a00b0017b59213831so6235817pjb.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Aug 2021 00:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=P2vk1dPujyHe2bA8wdfK7wJXlS4mwNbr7mrDNm9VQV8=;
        b=dUuW965dWK7Gm+redpLnqPY9wdCCtIQCQnz4YRdFgSqtLLS23ZcQ2y6D2FTNqPKcLZ
         IM7RBCjsw8iGv2CdKPthaBP+LMnYNfzP3A3LGuHsvL4sSkljIr/ACBJsqG1s29qkOBaZ
         Oz+dIe8WZ21Eh7qhZNEroFEF6L1+KVl5yGAi69pYka0ReMAc8eF9C2l4oaChltyo0TgA
         1+Ia7bfHVTD7JzNYZRmWT6lYM3ojl2gpYC0/E944nK4aoA39tZf8TMh9zS0siGTCMmI5
         6E+7w0Stjs3gNVpqI0dI3+pyhWazIot3OqksmQz66bZwHPYDe6ww6VA8WyBW2budw0NW
         rPcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=P2vk1dPujyHe2bA8wdfK7wJXlS4mwNbr7mrDNm9VQV8=;
        b=Ko1RZQW5AESVY4tmefpmqzzvPTUSIQb76SYZZGofKJvk5/k5TT0gLbgxOVnSAhN4XJ
         iXJfN5FJ53i620HHJqCxL6YmmLtVYi4iqlQkun/KEPzT/8s15OPG+Lznc7sHE6S/qeKE
         4ITz3lKFSZuues+UPt9k/1NIzdruPLgFnE0wD9ubYOCidUaOb1nSy8/VU96tNWwB27EJ
         k0u7aICU5cXC+K7lvMbO6BclXWgp4D69aHvdjaZSyl3rLKDRxjM0mI+H0MdI4MWbwr2P
         vkWrtZKnxFYd1opwIwlz6ezGwCyswn7vryeTzTFXEqIFrWjQU8CF5Atygea7i9FRTvN5
         HBHQ==
X-Gm-Message-State: AOAM53382K7cwj2b4Fp4DvYZVyEUigol1O/Qgg47ps120pFGhEG5QW4u
        uItOGJpe4NmGya24I4CRU86Y6EgkcYBKmQ==
X-Google-Smtp-Source: ABdhPJxOx6Me2c5i80oP8llIoKFi+Y/W6XvJbvtM9bIhbsGNP32rdqwEFSNXPZCfsrVLPcXHqYvZ7A==
X-Received: by 2002:a17:902:7585:b0:135:2585:e261 with SMTP id j5-20020a170902758500b001352585e261mr1309187pll.21.1629705255690;
        Mon, 23 Aug 2021 00:54:15 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id p17sm18587793pjg.54.2021.08.23.00.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 00:54:15 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Georgi Djakov <djakov@kernel.org>
Cc:     AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH] interconnect: qcom: sdm660: Correct NOC_QOS_PRIORITY shift and mask
Date:   Mon, 23 Aug 2021 15:54:05 +0800
Message-Id: <20210823075405.382-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The NOC_QOS_PRIORITY shift and mask do not match what vendor kernel
defines [1].  Correct them per vendor kernel.

[1] https://source.codeaurora.org/quic/la/kernel/msm-4.4/tree/drivers/soc/qcom/msm_bus/msm_bus_noc_adhoc.c?h=LA.UM.8.2.r1-04800-sdm660.0#n37

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/interconnect/qcom/sdm660.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/interconnect/qcom/sdm660.c b/drivers/interconnect/qcom/sdm660.c
index ac13046537e8..c89c991a80a0 100644
--- a/drivers/interconnect/qcom/sdm660.c
+++ b/drivers/interconnect/qcom/sdm660.c
@@ -44,9 +44,10 @@
 #define NOC_PERM_MODE_BYPASS		(1 << NOC_QOS_MODE_BYPASS)
 
 #define NOC_QOS_PRIORITYn_ADDR(n)	(0x8 + (n * 0x1000))
-#define NOC_QOS_PRIORITY_MASK		0xf
+#define NOC_QOS_PRIORITY_P1_MASK	0xc
+#define NOC_QOS_PRIORITY_P0_MASK	0x3
 #define NOC_QOS_PRIORITY_P1_SHIFT	0x2
-#define NOC_QOS_PRIORITY_P0_SHIFT	0x3
+#define NOC_QOS_PRIORITY_P0_SHIFT	0x0
 
 #define NOC_QOS_MODEn_ADDR(n)		(0xc + (n * 0x1000))
 #define NOC_QOS_MODEn_MASK		0x3
@@ -624,13 +625,13 @@ static int qcom_icc_noc_set_qos_priority(struct regmap *rmap,
 	/* Must be updated one at a time, P1 first, P0 last */
 	val = qos->areq_prio << NOC_QOS_PRIORITY_P1_SHIFT;
 	rc = regmap_update_bits(rmap, NOC_QOS_PRIORITYn_ADDR(qos->qos_port),
-				NOC_QOS_PRIORITY_MASK, val);
+				NOC_QOS_PRIORITY_P1_MASK, val);
 	if (rc)
 		return rc;
 
 	val = qos->prio_level << NOC_QOS_PRIORITY_P0_SHIFT;
 	return regmap_update_bits(rmap, NOC_QOS_PRIORITYn_ADDR(qos->qos_port),
-				  NOC_QOS_PRIORITY_MASK, val);
+				  NOC_QOS_PRIORITY_P0_MASK, val);
 }
 
 static int qcom_icc_set_noc_qos(struct icc_node *src, u64 max_bw)
-- 
2.17.1

