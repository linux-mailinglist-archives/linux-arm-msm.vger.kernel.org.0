Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03A5445CDFC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Nov 2021 21:25:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234599AbhKXU2m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Nov 2021 15:28:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232422AbhKXU2f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Nov 2021 15:28:35 -0500
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08010C061746
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Nov 2021 12:25:25 -0800 (PST)
Received: by mail-io1-xd31.google.com with SMTP id f9so4763273ioo.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Nov 2021 12:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EsV2SEwRbXH/MiB85OZ9gOtuzuulNPsgUywfp2AegPE=;
        b=wRs57miWUjiAN3yKPWYe1Ff4Rp2qfpsN7anHj65SyTRB3SUa7jliQhYH8SbZy6KGjA
         RWv9bZoBdvG+BwFVGHxB9hu9OPl2AjtmxAXJKsusk0lX4j1NPOSwY/SUj4TobnhI4ipD
         C8p8/hgp0pyMHxPphDqraqPbHcImo73e6R+EG0yIGNQdTYqKDua/MiKD24fKhqL4VSEt
         bkiMOjgyDI4ZLWHOeHjNRHDs3NraKsbumZYaC+jqoUAVEDCTY/6EE40TFYjPBsT4mDdz
         xxfxWMUrYYqT/FKsOJEU4YghDWj6UOMTiF6SXp6CVU42PPGPl9vNeffu3Emr6eZtL/Kt
         8Vjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EsV2SEwRbXH/MiB85OZ9gOtuzuulNPsgUywfp2AegPE=;
        b=EkI1oasXqoYX4WIdMY33ZQJll95BypBsEXRK8FwkX2iRhgJTj0K4+HlT08hHy1Vpxj
         zoj+80Q8w+p+rl/tDrnb33hFKaeNO4d2O8LY1CfbSNxAYtkJUa0HLObvmQBZ7LeTmX6c
         O2pHjBVKW3gJbbb6+RvfXHEZkHO39QdZe6Qf7JVXCHHSEpA5bTWec4BhI7Fc10+G4Qe4
         d/z+7Q5Minb/Cz7HNSpHhpqWSBXF0rP40HPfgA7x1e0gPcv2ps75uBR4gh5OU5WBMsAb
         RaKOK4QvFvvNxcaJk/VRjJ2s2ocaklTz7wEiqQsBVGilgrFxN3FlVwG++VOhhlGf1Bk9
         +RVg==
X-Gm-Message-State: AOAM5307+1ZURGvOltY1vhHGKrMUtXM2r881Yfz3hTNbYn2Q8v2oQNkr
        uZYOvxbv2nBG0TOLRoYxyVFtgw==
X-Google-Smtp-Source: ABdhPJz6abhDsO/1DFeTnORM770ghgL/aQBKugHIxMndKddTitNV9WFH/2HF08BKYJIzM7iN/b02mw==
X-Received: by 2002:a05:6602:14d3:: with SMTP id b19mr18395447iow.17.1637785524195;
        Wed, 24 Nov 2021 12:25:24 -0800 (PST)
Received: from localhost.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id x2sm312795ile.29.2021.11.24.12.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 12:25:23 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, kuba@kernel.org
Cc:     pkurapat@codeaurora.org, avuyyuru@codeaurora.org,
        bjorn.andersson@linaro.org, cpratapa@codeaurora.org,
        subashab@codeaurora.org, evgreen@chromium.org, elder@kernel.org,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH net-next 7/7] net: ipa: rearrange GSI structure fields
Date:   Wed, 24 Nov 2021 14:25:11 -0600
Message-Id: <20211124202511.862588-8-elder@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211124202511.862588-1-elder@linaro.org>
References: <20211124202511.862588-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The dummy net_device is a large field in the GSI structure, but it
is not at all interesting from the perspective of debugging.  Move
it to the end of the GSI structure so the other fields are easier to
find in memory.

The channel and event ring arrays are also very large, so move them
near the end of the structure as well.

Swap the position of the result and completion fields to improve
structure packing.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/gsi.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ipa/gsi.h b/drivers/net/ipa/gsi.h
index ccaa333e37620..75dfc7655f3ba 100644
--- a/drivers/net/ipa/gsi.h
+++ b/drivers/net/ipa/gsi.h
@@ -145,21 +145,21 @@ struct gsi_evt_ring {
 struct gsi {
 	struct device *dev;		/* Same as IPA device */
 	enum ipa_version version;
-	struct net_device dummy_dev;	/* needed for NAPI */
 	void __iomem *virt_raw;		/* I/O mapped address range */
 	void __iomem *virt;		/* Adjusted for most registers */
 	u32 irq;
 	u32 channel_count;
 	u32 evt_ring_count;
-	struct gsi_channel channel[GSI_CHANNEL_COUNT_MAX];
-	struct gsi_evt_ring evt_ring[GSI_EVT_RING_COUNT_MAX];
 	u32 event_bitmap;		/* allocated event rings */
 	u32 modem_channel_bitmap;	/* modem channels to allocate */
 	u32 type_enabled_bitmap;	/* GSI IRQ types enabled */
 	u32 ieob_enabled_bitmap;	/* IEOB IRQ enabled (event rings) */
-	struct completion completion;	/* Signals GSI command completion */
 	int result;			/* Negative errno (generic commands) */
+	struct completion completion;	/* Signals GSI command completion */
 	struct mutex mutex;		/* protects commands, programming */
+	struct gsi_channel channel[GSI_CHANNEL_COUNT_MAX];
+	struct gsi_evt_ring evt_ring[GSI_EVT_RING_COUNT_MAX];
+	struct net_device dummy_dev;	/* needed for NAPI */
 };
 
 /**
-- 
2.32.0

