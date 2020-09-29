Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58F1827D509
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Sep 2020 19:53:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727861AbgI2RxA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Sep 2020 13:53:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728061AbgI2Rw7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Sep 2020 13:52:59 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2ECEC0613D0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2020 10:52:59 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id k13so5334140pfg.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2020 10:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=SCbfk5KhIaeQlvR4Cwr7GsH4vv2lp3s8XkSFmUeV6ps=;
        b=CaelkjsyVnDqqLeG6nKa/oRVZl1X7PiGHuL9W0916QfNpvOs9PX+lbaoySwpk2SF/q
         Kkn6ok1NHNu7HryrR8N8CViiIjsYMCerfQwwV2uMXvJquYX0zQQ1sBJBoGlAeyS8h0vL
         qeROnRLFxVUhpQIowZmlrY8VpGA/Kvl97IHJ6TypHW7ssolgVeZoIJjI16Ty5GcZIl61
         LqbhpyvAZ6hcPYg1bDWflAJXdfoXp78ndiwNCVOocUmLtR7z/O0+yXUTeHOOnGfKIZdN
         3dnD5Nsc2f6t/BGOwZUVdy99YTxapLB23sy9ReHfBMRFDXqsJ3RDP9q65A12uh1oNRCe
         Xu4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=SCbfk5KhIaeQlvR4Cwr7GsH4vv2lp3s8XkSFmUeV6ps=;
        b=JiXDAfYp8UGzcA3b1/VVvQvogy+fGpgHPFYpE66IRjyrV7yhGyjzbIIEiT1mdq5G1Q
         oveiqE5ilJhQms0tyL2s6Vfya+du4OD5ZQAn0zUvKWWsveABskvX3tUTs529a4S8vhN2
         Y4Gfz1tkGALkTbwroxMbAk0QyFMg9iqchDURhtB0C95bv7CXl/b8TJ5HM3VhvQqAzAwV
         K23hgCx16penSZ/f1oLMJUk4hVNap2Z+2VyxtBT2zJb80R2TkUvwOTto4G8pldPAXPYK
         Ll54+yftO3YRpVTkuXxGxCvTREL6WtnVt1FsQFenIIYs8shojAmX0yAhbM1SVoGY663E
         jg5w==
X-Gm-Message-State: AOAM532idElp9LDru4HDyX8jwUXC4rbH8wwzv0ZVo7PvmtN5JH2TrYgu
        5Bnt9JvH6A4zDPWDar6Zf24Y
X-Google-Smtp-Source: ABdhPJxOE2mlXSIh8bsmRUfCw/62BNg7cTPqhUCKLO7Sx7sTNRLHC3jBIFtywrf7iWYIhuxjaDlckQ==
X-Received: by 2002:aa7:8dc9:0:b029:150:e9ad:952 with SMTP id j9-20020aa78dc90000b0290150e9ad0952mr4943478pfr.61.1601401979194;
        Tue, 29 Sep 2020 10:52:59 -0700 (PDT)
Received: from Mani-XPS-13-9360.localdomain ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id r188sm6271046pfc.67.2020.09.29.10.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 10:52:58 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 07/19] bus: mhi: core: Introduce helper function to check device state
Date:   Tue, 29 Sep 2020 23:22:06 +0530
Message-Id: <20200929175218.8178-8-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200929175218.8178-1-manivannan.sadhasivam@linaro.org>
References: <20200929175218.8178-1-manivannan.sadhasivam@linaro.org>
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

