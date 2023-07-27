Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8EB8765506
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jul 2023 15:32:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233662AbjG0NcA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jul 2023 09:32:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233517AbjG0Nb7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jul 2023 09:31:59 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91B0E2723
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jul 2023 06:31:57 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4fdd31bf179so1710200e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jul 2023 06:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690464716; x=1691069516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ozXv1DbyX/9IhURbF1Fhd2b0LEweNNt8AgMpeAaCDSs=;
        b=zb2W3eK/b/MZqCt7dAi/hm5nFrtkgtJjWYhU6x+w9Xxx1XLN4gcWTja2i78xHtff0j
         50KrEssFUgnrWqJlZl/qMwA81/4idRnbxvMUV7AdjfIB8e0Gj2stYz5t1KClNeyyicNy
         d2+qxAlqNenTOok//5/760EMY49VIRAeY7+PTa7roVIYMNbqGwhxZ7+WZo3tBbRt16Up
         6WrW0ntZoyxcx0q+lt/0fx0wu1T1I4RCbRkccFhLGP13FX/N9Y+BctFuN2BuG2l9yA+e
         oEUbZPsnpDXHJoEBqIzSDWHy1jCWeUM67t0GErsjDW4qCsuxT+paBhvJTOjBYDtfR0m7
         VgtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690464716; x=1691069516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ozXv1DbyX/9IhURbF1Fhd2b0LEweNNt8AgMpeAaCDSs=;
        b=LBywe+iDzkGolfSyAPSDBwPDNKbUOXULO2rMg1j0zjTcZU0IU+NYuKWuKtzJpCudU4
         8aJoW1BLab8BAnwFd65Zs8RwtP/G2gnpekJnPhnG1R/0wgxt2kMCTJKqyOCAqfFvuHAy
         LJABuRHuuhGo3niaruQPaxU+UnijMWqD51Xa/f6C3LJVRQTUgybLFLEiBIHb0LI/UXCd
         Jjo4yulvg8pnvnIzr6aGdh/vIXhD91xtoVXAd/r7D/xuP+f+r2eZoQnHaQZiFhEJmf+h
         GXOxw2lwL6nYd86WchZ3gJmY36Q4FgqsVmBO3F1Of0L8vPzrjEv3P0c0UQKJUdwmUMvq
         CLoA==
X-Gm-Message-State: ABy/qLazQSSgU7DhR63eChZUE2KHeuBZz5VS04kKgQ6DghDVb8VHNlSa
        rsGEQPm9MRUmL4Efou67gvmUTg==
X-Google-Smtp-Source: APBJJlF831cH8Viq1+Mko5h4Kwp7fkZvwJT0KjKfc+8mmrWwUZZGZoWb2CRXvfYX6a7ClB6hJqD8hw==
X-Received: by 2002:ac2:4893:0:b0:4fb:c885:425 with SMTP id x19-20020ac24893000000b004fbc8850425mr1700078lfc.9.1690464715891;
        Thu, 27 Jul 2023 06:31:55 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id w9-20020a05651204c900b004f85628ec34sm313511lfq.33.2023.07.27.06.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 06:31:55 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v3 1/5] drm/msm/dpu: inline __intr_offset
Date:   Thu, 27 Jul 2023 16:31:50 +0300
Message-Id: <20230727133154.1421721-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727133154.1421721-1-dmitry.baryshkov@linaro.org>
References: <20230727133154.1421721-1-dmitry.baryshkov@linaro.org>
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

Inline __intr_offset(), there is no point in having a separate oneline
function for setting base block address.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 5e2d68ebb113..0776b0f6df4f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -435,12 +435,6 @@ u32 dpu_core_irq_read(struct dpu_kms *dpu_kms, int irq_idx)
 	return intr_status;
 }
 
-static void __intr_offset(const struct dpu_mdss_cfg *m,
-		void __iomem *addr, struct dpu_hw_blk_reg_map *hw)
-{
-	hw->blk_addr = addr + m->mdp[0].base;
-}
-
 struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
 		const struct dpu_mdss_cfg *m)
 {
@@ -454,7 +448,7 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
 	if (!intr)
 		return ERR_PTR(-ENOMEM);
 
-	__intr_offset(m, addr, &intr->hw);
+	intr->hw.blk_addr = addr + m->mdp[0].base;
 
 	intr->total_irqs = nirq;
 
-- 
2.39.2

