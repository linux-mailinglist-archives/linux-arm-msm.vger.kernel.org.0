Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC4CD27A62D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Sep 2020 06:11:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726645AbgI1ELA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Sep 2020 00:11:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726603AbgI1EK7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Sep 2020 00:10:59 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93C07C0613CE
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2020 21:10:59 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id y14so7131143pgf.12
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2020 21:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=SCbfk5KhIaeQlvR4Cwr7GsH4vv2lp3s8XkSFmUeV6ps=;
        b=QgP6YMRe9W0moxUsSUcMTvkEySzzxbKPx4352s7GySLUMaQ3C2PecB4QuBMTKWZtxe
         eO4I2+/C0Z3OkOCRkeOv2sifn+et6uZmNBRPT6+GMJJLep26Fl/32aqUJi/PtXoE3ejO
         taAbWm9Y4EW9SWYIFCFiVkgcwifnvjWvvbbYG68nd+zmbFVmWIcrh1Ia9q3CMEv1tUie
         sCd9PQn2CQsWsgwVzxrzvXtgVWUsoB8vSOmn3adjPzc1f9CV3pRbNvk1UPjhJruR+DGy
         4n23/rHhuiHsNrl7DpFRgg73FqYQDq6TBDS1oa78SZEWTw5sBttKnPc/xjlANYOAEFUe
         tTQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=SCbfk5KhIaeQlvR4Cwr7GsH4vv2lp3s8XkSFmUeV6ps=;
        b=sgiqoDCFJobWInqlT5/NxvwMbS3JCD68c5jE4CJmxhocZx3Du7dmMF9Bzlcxx/0uP4
         veGuF6bRnTyXBrlE7RWN9NtV4s+XBJlpZQ+7GNRGkfrNYEzMElTqUVuk1FuRqNI706Ye
         UyZManyfl7t0kEccHxR9ZYI5toj3ggGe4hb10f/6OXe59U6bvi2Y9xSbt1SfA3dC6IF/
         96oulsSfq8v7Amm8U2ZbPNVyZfN5GIbnhDXoIVIwpaGH1IRBJTTDD+LawtoNJ8hktvTh
         9qWJpWqk4FKDraIsAjd085mqvmi9vd6wdV8vgP4rrrS39RR6UagU5VpqW0E72B/au4dt
         IJyA==
X-Gm-Message-State: AOAM530KK8YrYaQrXD+ZEpLjsukDPvM93RD/fcU/exDSRLXbULcJZqQP
        FsSxbhjjRZi9eczgC+D8iulU
X-Google-Smtp-Source: ABdhPJwThe1gR/zeva+rBcg5zMxyuxLMlqYqCgfXcaiOxVpKx8M3wuVH8pPKNRFbnDqh0ILT8usJJg==
X-Received: by 2002:a17:902:6803:b029:d2:42a6:312 with SMTP id h3-20020a1709026803b02900d242a60312mr9590562plk.24.1601266259136;
        Sun, 27 Sep 2020 21:10:59 -0700 (PDT)
Received: from Mani-XPS-13-9360.localdomain ([2409:4072:6003:40df:7c40:5a87:eb86:87b0])
        by smtp.gmail.com with ESMTPSA id n21sm8306322pgl.7.2020.09.27.21.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2020 21:10:58 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 07/21] bus: mhi: core: Introduce helper function to check device state
Date:   Mon, 28 Sep 2020 09:39:37 +0530
Message-Id: <20200928040951.18207-8-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200928040951.18207-1-manivannan.sadhasivam@linaro.org>
References: <20200928040951.18207-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bhaumik Bhatt <bbhatt@codeaurora.org>

Introduce a helper function to determine whether the device is in a
powered ON state and resides in one of the active MHI states. This will
allow for some use cases where access can be pre-determined.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/internal.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
index 1bbd6e99d38d..5a81a428c4aa 100644
--- a/drivers/bus/mhi/core/internal.h
+++ b/drivers/bus/mhi/core/internal.h
@@ -598,6 +598,11 @@ int mhi_pm_m3_transition(struct mhi_controller *mhi_cntrl);
 int __mhi_device_get_sync(struct mhi_controller *mhi_cntrl);
 int mhi_send_cmd(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
 		 enum mhi_cmd_type cmd);
+static inline bool mhi_is_active(struct mhi_controller *mhi_cntrl)
+{
+	return (mhi_cntrl->dev_state >= MHI_STATE_M0 &&
+		mhi_cntrl->dev_state <= MHI_STATE_M3_FAST);
+}
 
 static inline void mhi_trigger_resume(struct mhi_controller *mhi_cntrl)
 {
-- 
2.17.1

