Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 483B854A1F6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jun 2022 00:14:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233430AbiFMWOS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jun 2022 18:14:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231964AbiFMWOR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jun 2022 18:14:17 -0400
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD2872C66C
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jun 2022 15:14:16 -0700 (PDT)
Received: by mail-qk1-x72b.google.com with SMTP id o73so5114492qke.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jun 2022 15:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DUiAeAfmEZIvnaedz68FdfSLl3Zzr0m6IgnYQsJx0+M=;
        b=L+MVtYj3pR9bGDgWW1ZLh6MEJL2EQuCpnYM8vbzG/AZc/TBQPbd5vwrc1jSCxsampk
         bDLP9XlkJpzVtfLiX6GJwl/7eZ+ooP+cOkck5THn2TZOmDlb0ItuoiArFCtKfuX0xWRi
         2SZD13n1AUaET9GxI3D6Y8qeqM4CIMesN2KBpO7+Rn5w/sUPtySQ90rNHUuUhu7/fYBX
         YzMXPg2zpJpcTXdpC8ftkbyUEXsv5PFHCcISDkPc23cPcaBJYbzjZ83/0DXASvENCMHc
         2S7+RfLPulb9pZJurQTv7Zt70tMZmNeVXMQH1nUcxQrfJYL/z9PQz7mUEgmKPnBPmMoj
         DnTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DUiAeAfmEZIvnaedz68FdfSLl3Zzr0m6IgnYQsJx0+M=;
        b=yND/RBjmwj0q1/ifIz/25QIFBq0bgBALUABO2wns+8zJRsUGPeclS+NxeeZXLknITA
         CxnKQzVgeHvOfI1KUJqHctZx0es2fvOJlHuaIZ29tqhnLD9Mmc8AwDvacATnWxdNgoC8
         YZxTa2jXFvJPEUjs10Yt0pm3+Z0YAL46yVNKP+/a5qpWmbsDHh4Itk4Y/F07KTY1+Mwb
         fn3rF7ztXl9eEK8ZC4u1WJGIxOLFLfRMSFZqztWFu5J4Wqly9V0GbSx3KOXLN3jN4XmZ
         2tac8m9eGbpvewwMpRVnbDlgaygY5KtXRtZlz35mBj9KSd3lzwz/6v13qa2ib1JqZTht
         64wQ==
X-Gm-Message-State: AOAM5336GPDPOZXvXReXt72fDwVRdOSKqd98t03s6KRmQPY3w22D/RY4
        m+b3EOwEOm0uPyREmz5qqNti/w==
X-Google-Smtp-Source: ABdhPJz8SZxKA/0hDuOp4+Jhg9OT2Vji6pJSqJnR7maEE5yHqeZHat7TCXVM+y1Uv/5GzBpK9Bpq3w==
X-Received: by 2002:a05:620a:4252:b0:67e:8977:db80 with SMTP id w18-20020a05620a425200b0067e8977db80mr1813022qko.483.1655158455792;
        Mon, 13 Jun 2022 15:14:15 -0700 (PDT)
Received: from localhost.localdomain (modemcable134.222-177-173.mc.videotron.ca. [173.177.222.134])
        by smtp.gmail.com with ESMTPSA id l11-20020ac84ccb000000b002f92b74ba99sm5700569qtv.13.2022.06.13.15.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 15:14:15 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     freedreno@lists.freedesktop.org
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] drm/msm: use for_each_sgtable_sg to iterate over scatterlist
Date:   Mon, 13 Jun 2022 18:10:19 -0400
Message-Id: <20220613221019.11399-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The dma_map_sgtable() call (used to invalidate cache) overwrites sgt->nents
with 1, so msm_iommu_pagetable_map maps only the first physical segment.

To fix this problem use for_each_sgtable_sg(), which uses orig_nents.

Fixes: b145c6e65eb0 ("drm/msm: Add support to create a local pagetable")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
v2: use for_each_sgtable_sg and update commit message

 drivers/gpu/drm/msm/msm_iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index bcaddbba564df..a54ed354578b5 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -58,7 +58,7 @@ static int msm_iommu_pagetable_map(struct msm_mmu *mmu, u64 iova,
 	u64 addr = iova;
 	unsigned int i;
 
-	for_each_sg(sgt->sgl, sg, sgt->nents, i) {
+	for_each_sgtable_sg(sgt, sg, i) {
 		size_t size = sg->length;
 		phys_addr_t phys = sg_phys(sg);
 
-- 
2.26.1

