Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70FD13AF9EB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 01:53:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232347AbhFUXzm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Jun 2021 19:55:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232396AbhFUXzf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Jun 2021 19:55:35 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95AD6C061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jun 2021 16:53:19 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id t13so3653259pgu.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jun 2021 16:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=THKoO1RWudj0KxP+z9XOrOgTVnvtbYYdvVkwmldz9OE=;
        b=DSphfoFZ7DM95K+RvdByDg8W0x0HzT372m/CTEnE3pqPeq323dI65P/rlVSfLPKJQ1
         28O9oN0CLLEtsLKgQ6MlMRXyKqjvpu/VGmk9AAzNr4tU542Ko0Ca8Ro0ReN1BsCsYzhm
         FrHRvl46FXtYmbbghamYqJa+AdyJraOwaTHvI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=THKoO1RWudj0KxP+z9XOrOgTVnvtbYYdvVkwmldz9OE=;
        b=PPBOx7hBzOGKPIudQnHpYcoqcSxR+f/Ejpg2Q40/vNME/D+kN+P0WwE3Uf0rFcUXxc
         UIWNa2uuI7wu1FFAjeY4Qbq+fcZpBoQYzZC0/EG5xNcmzKm4D4teK033U1fBfvVT02rT
         J346OsKFXycJOHeKGCsYj12AprIGPaYQz+SzJ9CS2oqfpxt8K48KGaoiDePvMpMDF+Un
         /BuC/pZ+MRVW+NmFK95eyWKpArGxXSJdYm6i9MhaFwEJxEqyHGTkWFyFlz7ltgy6qG1R
         IVxtwfRulgahoLHvx4+tjXglD44q0REb61IPEMUmGtg9F1F6+4d171FFcWNMAQl7pe0H
         JPAg==
X-Gm-Message-State: AOAM533vR2wX1XeDCFkYBaFlmKia5UECFPintpN5EKKNtJkh60hyw5MK
        xQkv8mpwjfP+QDQMuUsTdONvpQ==
X-Google-Smtp-Source: ABdhPJxcsyNJ4PVOdLaM5phhP72ONpeV+ZJ8ppg8iQL6bG+AB2umwHT1C064i27TPx/qxhDHxLJD1g==
X-Received: by 2002:a62:1d8c:0:b029:300:73d5:f35f with SMTP id d134-20020a621d8c0000b029030073d5f35fmr723439pfd.36.1624319599173;
        Mon, 21 Jun 2021 16:53:19 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:bdc1:a4b1:b06e:91d1])
        by smtp.gmail.com with ESMTPSA id s27sm4339663pfg.169.2021.06.21.16.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 16:53:18 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     gregkh@linuxfoundation.org, rafael@kernel.org,
        rafael.j.wysocki@intel.com, will@kernel.org, robin.murphy@arm.com,
        joro@8bytes.org, bjorn.andersson@linaro.org,
        ulf.hansson@linaro.org, adrian.hunter@intel.com,
        bhelgaas@google.com
Cc:     robdclark@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, quic_c_gdjako@quicinc.com,
        iommu@lists.linux-foundation.org, sonnyrao@chromium.org,
        saiprakash.ranjan@codeaurora.org, linux-mmc@vger.kernel.org,
        vbadigan@codeaurora.org, rajatja@google.com, saravanak@google.com,
        joel@joelfernandes.org, Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] iommu: Stop reaching into PCIe devices to decide strict vs. non-strict
Date:   Mon, 21 Jun 2021 16:52:47 -0700
Message-Id: <20210621165230.5.I091ed869d3b324a483a355d873ce6bf1dc2da5ba@changeid>
X-Mailer: git-send-email 2.32.0.288.g62a8d224e6-goog
In-Reply-To: <20210621235248.2521620-1-dianders@chromium.org>
References: <20210621235248.2521620-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We now have a way for PCIe devices to force iommu.strict through the
"struct device" and that's now hooked up. Let's remove the special
case for PCIe devices.

NOTE: there are still other places in this file that make decisions
based on the PCIe "untrusted" status. This patch only handles removing
the one related to iommu.strict. Removing the other cases is left as
an exercise to the reader.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/iommu/dma-iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 7bcdd1205535..e50c06ce1a6b 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -368,7 +368,7 @@ static int iommu_dma_init_domain(struct iommu_domain *domain, dma_addr_t base,
 
 	init_iova_domain(iovad, 1UL << order, base_pfn);
 
-	if (!cookie->fq_domain && (!dev || !dev_is_untrusted(dev)) &&
+	if (!cookie->fq_domain &&
 	    domain->ops->flush_iotlb_all && !iommu_get_dma_strict(domain)) {
 		if (init_iova_flush_queue(iovad, iommu_dma_flush_iotlb_all,
 					  iommu_dma_entry_dtor))
-- 
2.32.0.288.g62a8d224e6-goog

