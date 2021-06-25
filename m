Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EF993B4365
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jun 2021 14:35:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230274AbhFYMh3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Jun 2021 08:37:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231666AbhFYMhO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Jun 2021 08:37:14 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32465C061766
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jun 2021 05:34:52 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id 21so7954112pfp.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jun 2021 05:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4vCP14x51ZT3xHTsGRwNOFfupBHNf+HcNjz+uJv37tc=;
        b=ktHLP1O9pdgttROJ/3d/zqYT2d35eagqTUHjpN0GfpcWbPh7NmalFXQtu1zu/5tXsw
         Xvbdhc4o67mkTGwm6o+sVB7IRHNMPMtU4HvrruA2ocB4SRyeqMtU8VsZ00zxspnkPavM
         Z60HD6xD5u9uBTB0ChMeaNa2cPkxVXw3wW2Ync+7cJu+5qb+VHjaPRyLjXiVgdXzKldw
         1EB63Ag0x8+SRu0ahaJJnn3nBZXkzSYipqu/XKY5IrbCXV1RM/6nGJZc8otYplg1zgiI
         5Uk/i8znvTY2xXXPPpmko1myRwptIkqzqj42Yr5iri2at2qR6RSBmHN5oUXnWSHaUmLZ
         SGjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4vCP14x51ZT3xHTsGRwNOFfupBHNf+HcNjz+uJv37tc=;
        b=VJSO6Hm2GRdNH+ksuf0mV99CD43L0Ls3KTF+VvmuoPgfJs5VYyDIPrx33cnyQBLN39
         G3Q9/qrPjlwt84XULJete8fZDzaBWlmbyT1ueMyn2lKhV61mkajGuITy5meqdplUmN2K
         YpIJJFm794nPEVw6pahvEcuUQrKm2ACSTIuQ8TiKlcRJQxSfyLPoiyRUiGNrpD/ZG0QL
         p1cLKDHG4YoD32u9JX6GPy4R85qJ01LIBUf55UGsg1PAJr7u8JTN/9yWsVo2OPp+QAb7
         P3KZx+1af22YkpWm5pBPOsXaV7RiOUamujo6Ic8MJV4iX3iQoIyeHbF3mX8Tumt0Autq
         aiZw==
X-Gm-Message-State: AOAM530ffimnSm31aT50pl7AZYFrt6fZAfAiT4kSKe4/osJ5MA9oXtsM
        FolThSjDTdfSIRqtzlEOds3J
X-Google-Smtp-Source: ABdhPJxOLpaI+xyCcJi2T4fIruA0AEc9zcnx9kzOu5Fnn388vqnpNnzKNpU+fs7F08jiVCaAIDup0A==
X-Received: by 2002:a62:53c1:0:b029:2ef:25e8:d9e5 with SMTP id h184-20020a6253c10000b02902ef25e8d9e5mr10439876pfb.74.1624624491735;
        Fri, 25 Jun 2021 05:34:51 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:600b:2a0:ed5d:53e7:c64e:1bac])
        by smtp.gmail.com with ESMTPSA id y7sm6077780pfy.153.2021.06.25.05.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jun 2021 05:34:51 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
        kvalo@codeaurora.org, ath11k@lists.infradead.org,
        Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 07/10] bus: mhi: Add MMIO region length to controller structure
Date:   Fri, 25 Jun 2021 18:03:52 +0530
Message-Id: <20210625123355.11578-8-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210625123355.11578-1-manivannan.sadhasivam@linaro.org>
References: <20210625123355.11578-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bhaumik Bhatt <bbhatt@codeaurora.org>

Make controller driver specify the MMIO register region length
for range checking of BHI or BHIe space. This can help validate
that offsets are in acceptable memory region or not and avoid any
boot-up issues due to BHI or BHIe memory accesses.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Link: https://lore.kernel.org/r/1620330705-40192-4-git-send-email-bbhatt@codeaurora.org
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 include/linux/mhi.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 5e08468854db..b8ca6943f0b7 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -303,6 +303,7 @@ struct mhi_controller_config {
  * @rddm_size: RAM dump size that host should allocate for debugging purpose
  * @sbl_size: SBL image size downloaded through BHIe (optional)
  * @seg_len: BHIe vector size (optional)
+ * @reg_len: Length of the MHI MMIO region (required)
  * @fbc_image: Points to firmware image buffer
  * @rddm_image: Points to RAM dump buffer
  * @mhi_chan: Points to the channel configuration table
@@ -386,6 +387,7 @@ struct mhi_controller {
 	size_t rddm_size;
 	size_t sbl_size;
 	size_t seg_len;
+	size_t reg_len;
 	struct image_info *fbc_image;
 	struct image_info *rddm_image;
 	struct mhi_chan *mhi_chan;
-- 
2.25.1

