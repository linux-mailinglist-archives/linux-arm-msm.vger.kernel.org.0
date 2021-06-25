Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 481A93B4367
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jun 2021 14:35:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231655AbhFYMhd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Jun 2021 08:37:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231668AbhFYMhT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Jun 2021 08:37:19 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 910A7C06124C
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jun 2021 05:34:57 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id z3-20020a17090a3983b029016bc232e40bso5439358pjb.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jun 2021 05:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b0yKlt0Q933fIPy75KLLXBy+WqH1A4lfhq0nnaDRBRU=;
        b=KQDZCGGrHOpBRTIYyrFjiZEwN6JsbSca425T2JQftRpS8XvxZQRM/pIRawG6i9Kbnv
         /hVmNOTe9nQ2Dyr86ikFax0IHHMTFCFoajwDaMlWNgonsj+FnOujuBLQeLmj6m06BSYF
         o5t5On6kSxv50RAMmvSsfU9/RDC/MnkBESVmgvTvwCaQ66QTcsk8yvQi0kLBp0gsq3G2
         yxmGmjhjRl74s/1OeiIrdA+LhVgClHUk9qgbMzkTj3aPB3UsPo7ZHw/usmQmZKP1747w
         IS4wyWv+GxT/j278wdUo45tR61PYIdRrglNAcTbCrWMQuaJ2NczAE/iwygGu/qLKMCsi
         jERA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b0yKlt0Q933fIPy75KLLXBy+WqH1A4lfhq0nnaDRBRU=;
        b=DdkRXRbdbn71ytJJVRJr7BDda+CiiXzP72abA8rRe0GEhaqzqJ9TfeKn1ucOyA5JTS
         KOGhCo8I0Ns05unMIwoyHPXMwyyYiKth5M4tCeJTTdHb4KVZK6s3Avsgwnc9QmqZAHlT
         FKz8CJDg1xJB4H4y/j4t6V4d17yb7ENVi4Owu23/KP2jqfu09NFCb4y06etJL9HhUhHl
         /JJJkoOkcBEceDP+WWgoZZ1wXfNfZKZ9vSph3F9Ilyqf6pjwcL3kT2hnyt5fW6TX2nux
         8PFjGopagXJex/wIQSpsxNNmZ/cjOYXRqvPzUVvIQrMmfmn2RjuLFj22xySPnEevF7+T
         EKRQ==
X-Gm-Message-State: AOAM531WS3OuSAfrvnhghQBRzInNz8loim75cNNsUnHCWXZFAXmJ3ZUg
        fzIvZaSaN3hiXCjntkvRHF33
X-Google-Smtp-Source: ABdhPJyM4IeXphBP8q2KP4gPQvEMc7MqleS9KFuFXPJtcvk9PVUlpoYSrvvcVLMZTwBBaFZ+PPnCaA==
X-Received: by 2002:a17:902:bd09:b029:ec:7e58:a54a with SMTP id p9-20020a170902bd09b02900ec7e58a54amr9136372pls.62.1624624497069;
        Fri, 25 Jun 2021 05:34:57 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:600b:2a0:ed5d:53e7:c64e:1bac])
        by smtp.gmail.com with ESMTPSA id y7sm6077780pfy.153.2021.06.25.05.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jun 2021 05:34:56 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
        kvalo@codeaurora.org, ath11k@lists.infradead.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 08/10] ath11k: set register access length for MHI driver
Date:   Fri, 25 Jun 2021 18:03:53 +0530
Message-Id: <20210625123355.11578-9-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210625123355.11578-1-manivannan.sadhasivam@linaro.org>
References: <20210625123355.11578-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bhaumik Bhatt <bbhatt@codeaurora.org>

MHI driver requires register space length to add range checks and
prevent memory region accesses outside of that for MMIO space.
Set it before registering the MHI controller.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Acked-by: Kalle Valo <kvalo@codeaurora.org>
Link: https://lore.kernel.org/r/1620330705-40192-5-git-send-email-bbhatt@codeaurora.org
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/net/wireless/ath/ath11k/mhi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
index 27b394d115e2..e097ae52e257 100644
--- a/drivers/net/wireless/ath/ath11k/mhi.c
+++ b/drivers/net/wireless/ath/ath11k/mhi.c
@@ -330,6 +330,7 @@ int ath11k_mhi_register(struct ath11k_pci *ab_pci)
 	mhi_ctrl->cntrl_dev = ab->dev;
 	mhi_ctrl->fw_image = ab_pci->amss_path;
 	mhi_ctrl->regs = ab->mem;
+	mhi_ctrl->reg_len = ab->mem_len;
 
 	ret = ath11k_mhi_get_msi(ab_pci);
 	if (ret) {
-- 
2.25.1

