Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C2B4516E46
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 May 2022 12:42:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384600AbiEBKp5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 May 2022 06:45:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384655AbiEBKpn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 May 2022 06:45:43 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DFA1205D3
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 May 2022 03:42:07 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id s14so12138062plk.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 May 2022 03:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k5HAh8ngAVPFB9BApz5vRyzeAzX7yXOYLyScd179RCI=;
        b=uOEY1LPQQJfDZn4ittpZjnYRqf2uREgsqUIs3DQ1yLqiiDgnA0b26ayC3UN8gKuhsk
         wr+kXmEQ+gDKMH8wOf56loM6L3Jjg3Vrzyxhw0KuIICdmCuAFKAigUHZBLhpXW7fzv/O
         FYUZTpS8VX0EF1e9BFnhrBqAhZGsCbVsy5BczbGyzF2BVkC6C0r7t9kArxe5WhqrlJHE
         NArAxMWJTWnFp3ULVPy+fAjph3lk4gvzuRzgd2e4O4JS9tKSlGVi0ybCsC7WfnyzP/hn
         zffbaVX0NMP1P09hz34wyYRPUONU2tozxBMUmI2cOzx0obvzMDMB9JNKj5XYJiiMuGLL
         /SbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k5HAh8ngAVPFB9BApz5vRyzeAzX7yXOYLyScd179RCI=;
        b=srOy/DwwWKpci8T7cUoDE1ZPyeOflPbqG7RG9l4m2Z98fu+Tk8UOrghHw9pBQbvwhv
         BFHsxbcq0dp2qwAfv+MWsVdMd8HUosXXN8L0vTvNIqml4AbQ6GPz3zc6XxszJUfbVX7Q
         kam5fRyxLGSX4OlzBEmvCOtIUz17hGlhMj6sqHORfj1F0yKgM4AJP+vpacJR+3zk4/R6
         +GkxUZNO6SfiZn5Z0m3ccjLHoDF6C9cLiEsaoyjW4xObNL0dTU0KvzX6xY87tTuDeUvD
         jL5F0qfb0QSPzbUKPjzla7fPuzHj7/RVXY690yB2ovrhqYoH1HbfxB8droieV0G80WYp
         LdJQ==
X-Gm-Message-State: AOAM532OUJyWsdrTnreXBwQ8G1rAWqeUpzZdgUTocJNQ+k38ksQlE/C+
        ueNygxVp1uw6HjxEo40u5mkvxL3OBNxu
X-Google-Smtp-Source: ABdhPJxcDuQwcxprePCJ9P8ujm+ox0ns8BfIT2VUCWkUlpI+Q1viKa0+CO/t90f0uGR0QrT/elsPkw==
X-Received: by 2002:a17:90b:3b43:b0:1da:284f:7792 with SMTP id ot3-20020a17090b3b4300b001da284f7792mr12633082pjb.189.1651488127155;
        Mon, 02 May 2022 03:42:07 -0700 (PDT)
Received: from localhost.localdomain ([27.111.75.99])
        by smtp.gmail.com with ESMTPSA id x10-20020a1709029a4a00b0015e8d4eb2ccsm4368434plv.278.2022.05.02.03.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 03:42:06 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mhi@lists.linux.dev
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_hemantk@quicinc.com, quic_bbhatt@quicinc.com,
        loic.poulain@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 5/5] bus: mhi: host: Remove redundant dma_wmb() before ctx wp update
Date:   Mon,  2 May 2022 16:11:44 +0530
Message-Id: <20220502104144.91806-6-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220502104144.91806-1-manivannan.sadhasivam@linaro.org>
References: <20220502104144.91806-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The endpoint device will only read the context wp when the host rings
the doorbell. And moreover the doorbell write is using writel(). This
guarantess that the prior writes will be completed before ringing
doorbell.

So there is no need of an additional dma_wmb() to order the coherent
memory writes w.r.t each other. Even if the writes gets reordered, it
won't affect the endpoint device.

Cc: Loic Poulain <loic.poulain@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/host/main.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index 966ffc2458b9..6706a82d3aa8 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -138,11 +138,6 @@ void mhi_ring_chan_db(struct mhi_controller *mhi_cntrl,
 
 	db = ring->iommu_base + (ring->wp - ring->base);
 
-	/*
-	 * Writes to the new ring element must be visible to the hardware
-	 * before letting h/w know there is new element to fetch.
-	 */
-	dma_wmb();
 	*ring->ctxt_wp = cpu_to_le64(db);
 
 	mhi_chan->db_cfg.ring_db(mhi_cntrl, &mhi_chan->db_cfg,
-- 
2.25.1

