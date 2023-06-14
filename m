Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6406F730BD9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jun 2023 02:00:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229944AbjFOAAK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jun 2023 20:00:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229889AbjFOAAJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jun 2023 20:00:09 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F10D71BF0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jun 2023 17:00:07 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-666520247f8so1190555b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jun 2023 17:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686787207; x=1689379207;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=12VwvcrgEKdN8aqMI+IAU5PLbg9wZ07LVlbgBSIhCA4=;
        b=SupkW8CAI0Bw7NvXheRZO8CdV4l6XkZ7DQMfPL8I5BHIGivTFzK6TWvOGUZkkOLiz3
         dfpnYOLk53Hcih6Thqe8/pCrKhYwQhLkNTAbS5OIrZlPgmFrVdJ+mqMPRt9YQVl92Bwk
         3OCU/mgml8Ah/VXldLJREy9N9ldu3u8c/2Am0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686787207; x=1689379207;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=12VwvcrgEKdN8aqMI+IAU5PLbg9wZ07LVlbgBSIhCA4=;
        b=IGvnKcEI8slQAFv6BADari+4DOi8iJiZaQkZar7otsICyZEtCOBizA5agNgj0055xd
         4/c9HVhQCKtc9pJHSaFz/BOC/92JWCRXSj9c2++SyYb/FcClzsOPmi5k3K6Yl7olhUig
         QD/HPjl58j7rhUg2o2lvzE6ipkNQnJbX492xEt6BVJoEtO9uxnrj22o8BTR8ULGtbWLR
         cfAOW21+eHeTEbl9OytHYXWgAgNZ5dKwlF3xLGXuYVQjFjgtHhVBoDr+LpiQyRNmMxnA
         qBmSB/LBaKFOHwNvvO+ZAprZ6WT7YP98HQZFkrVFCmCXZ56V8pzBzS8MQzJMp7VnUuhT
         ivBg==
X-Gm-Message-State: AC+VfDyvatkchy+0qwvwn+iG/mj/tk3IdgS34CFVOX7UmAZyrpxBbFCS
        6my5C7hFDJ78CYcis1AVzd6UHA==
X-Google-Smtp-Source: ACHHUZ7IDFd9vR4zkugOrFreU36PRCwfKzB3S7DOadFjidUUwSKtsg+FoAfmsv5OaByHRCuS5nrCag==
X-Received: by 2002:a05:6a20:4b8a:b0:f8:1101:c074 with SMTP id fu10-20020a056a204b8a00b000f81101c074mr2310815pzb.54.1686787207415;
        Wed, 14 Jun 2023 17:00:07 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:2e78:108:bcc:767d])
        by smtp.gmail.com with ESMTPSA id z10-20020a170903018a00b001b1f991a4d0sm12766209plg.108.2023.06.14.17.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 17:00:06 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Will Deacon <will@kernel.org>
Cc:     andersson@kernel.org, amit.pundir@linaro.org,
        linux-arm-msm@vger.kernel.org, konrad.dybcio@somainline.org,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        sumit.semwal@linaro.org, Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Marc Zyngier <maz@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] Revert "Revert "Revert "arm64: dma: Drop cache invalidation from arch_dma_prep_coherent()"""
Date:   Wed, 14 Jun 2023 16:59:09 -0700
Message-ID: <20230614165904.1.I279773c37e2c1ed8fbb622ca6d1397aea0023526@changeid>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This reverts commit 7bd6680b47fa4cd53ee1047693c09825e212a6f5.

When booting a sc7180-trogdor based device on mainline, I see errors
that look like this:

 qcom_scm firmware:scm: Assign memory protection call failed -22
 qcom_rmtfs_mem 94600000.memory: assign memory failed
 qcom_rmtfs_mem: probe of 94600000.memory failed with error -22

The device still boots OK, but WiFi doesn't work.

The failure only seems to happen when
CONFIG_INIT_ON_ALLOC_DEFAULT_ON=y. When I don't have that set then
everything is peachy. Presumably something about the extra
initialization disagrees with the change to drop cache invalidation.

Fixes: 7bd6680b47fa ("Revert "Revert "arm64: dma: Drop cache invalidation from arch_dma_prep_coherent()""")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/mm/dma-mapping.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/mm/dma-mapping.c b/arch/arm64/mm/dma-mapping.c
index 3cb101e8cb29..5240f6acad64 100644
--- a/arch/arm64/mm/dma-mapping.c
+++ b/arch/arm64/mm/dma-mapping.c
@@ -36,7 +36,22 @@ void arch_dma_prep_coherent(struct page *page, size_t size)
 {
 	unsigned long start = (unsigned long)page_address(page);
 
-	dcache_clean_poc(start, start + size);
+	/*
+	 * The architecture only requires a clean to the PoC here in order to
+	 * meet the requirements of the DMA API. However, some vendors (i.e.
+	 * Qualcomm) abuse the DMA API for transferring buffers from the
+	 * non-secure to the secure world, resetting the system if a non-secure
+	 * access shows up after the buffer has been transferred:
+	 *
+	 * https://lore.kernel.org/r/20221114110329.68413-1-manivannan.sadhasivam@linaro.org
+	 *
+	 * Using clean+invalidate appears to make this issue less likely, but
+	 * the drivers themselves still need fixing as the CPU could issue a
+	 * speculative read from the buffer via the linear mapping irrespective
+	 * of the cache maintenance we use. Once the drivers are fixed, we can
+	 * relax this to a clean operation.
+	 */
+	dcache_clean_inval_poc(start, start + size);
 }
 
 #ifdef CONFIG_IOMMU_DMA
-- 
2.41.0.162.gfafddb0af9-goog

