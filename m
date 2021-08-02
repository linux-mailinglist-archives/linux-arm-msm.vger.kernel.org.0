Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EE443DCFF8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Aug 2021 07:13:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232257AbhHBFN5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Aug 2021 01:13:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232128AbhHBFNy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Aug 2021 01:13:54 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B838C0613D5
        for <linux-arm-msm@vger.kernel.org>; Sun,  1 Aug 2021 22:13:42 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id s22-20020a17090a1c16b0290177caeba067so4059804pjs.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Aug 2021 22:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7vND1lDijA1/aEOaxshYmLS5yaC8jR5VWy3q3nA4GNE=;
        b=hrghld4pcyQBlZRe951zP4r9uptCsjo/XXvCkJwCIMHQVXFfBf76tPU6On9SOzNoru
         R97CZYYRbSGauMMtk2/Jo4qUrAP6wsA8qkd6NnwagF6gJ7R8Si2Mbsd9oTm76wAl55Kx
         +UcDNU8ZIQI5TF2MyFeNFORdmZDfnjte0NrU6UsWU/RIiVI3+GoupTLDKfdrCzMkqATp
         vPYCvI5LhdB8p47Ws8OVQO/Bbex5ucjJUboL/+uOJMsdFpJUmBifHP94kuOiJ4zNeji8
         TtHJkCxSTwosUMnnpmGT8K3z5UV4kppOSExWep9xZpNI9473I4svfdXY9XQqHM0m31yt
         7y0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7vND1lDijA1/aEOaxshYmLS5yaC8jR5VWy3q3nA4GNE=;
        b=ql718S0LgxetPfweZHlEJEX3vHXqyn764eZPetSyRaRih0yc34k+KkPuoUeDuaDnsE
         QirY5ek7NMinLAeKcuZPePGx+fNPjO9VTEj6MeNFAs8KpKkAmWTtdnD/8B6gGw9jdRVL
         pssqvIdCPBHZHKBHBnYHE2paOfMi1G4R9e/+atLw9IEu6JG/EIBftBFtwwKvgmwmIFAL
         cPCndAsfWLLcUw28vxgW34gx01EckV92VrrPABWO5xfRG5OxnemVaSQ8XCh5jQ93KIrD
         edTbSAwDG6z8laI0ENkvJ7IBLgQY4ohXYRqH8z9AYaPzPzSkqZ/tTCP/sc2USHBN7eep
         npwQ==
X-Gm-Message-State: AOAM530eMXxqXpaSgbh8rJ+Sgb5kHQcX+j7fn88dArE6msSuYA3/d3I+
        jNMU3IDqvr5N64f6086T9geDk9Fo5T/q2ZU=
X-Google-Smtp-Source: ABdhPJyvvLzgWcPAHx2DNtie8USWW5RHbOvZn8z2z2E5U+gvRMhnKUvfj+SVkwF1LJUep8sOO6aI9A==
X-Received: by 2002:a17:902:bc82:b029:12b:a074:1fae with SMTP id bb2-20020a170902bc82b029012ba0741faemr11206329plb.29.1627881221879;
        Sun, 01 Aug 2021 22:13:41 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:6e99:242f:6391:b1b4:1ad8:fbdf])
        by smtp.gmail.com with ESMTPSA id x26sm9947000pfm.77.2021.08.01.22.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Aug 2021 22:13:41 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 06/10] ath11k: set register access length for MHI driver
Date:   Mon,  2 Aug 2021 10:42:51 +0530
Message-Id: <20210802051255.5771-7-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210802051255.5771-1-manivannan.sadhasivam@linaro.org>
References: <20210802051255.5771-1-manivannan.sadhasivam@linaro.org>
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
index 75cc2d80fde8..26c7ae242db6 100644
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

