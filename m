Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECF0F3B349D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jun 2021 19:18:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232300AbhFXRU5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Jun 2021 13:20:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232186AbhFXRUt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Jun 2021 13:20:49 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CB0AC061767
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jun 2021 10:18:29 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id p9so5290307pgb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jun 2021 10:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ltzQtO7QGv7ihuZ03SI1P6XFOPcuSJGUvlCT/41r+iE=;
        b=E3OBm6d+DSXVCCSeW92dikvGwmwuqWU/DsoUwEYgJrR2tlg8YH4d/NZF7DVqR7/He+
         LenZJUO1mfAjegUrPWjAnmmG5S7PCCZ42geQk165WsFmQEdnb0Ad39+HwartwwMFYgMQ
         9jjJUrS+i22102pFcWK6Q0jsikCiBKGzI6+UY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ltzQtO7QGv7ihuZ03SI1P6XFOPcuSJGUvlCT/41r+iE=;
        b=KXEQ7gU+3nrMf4hRqrlgCa58AfraGV2wjuTNzFa85oC00mAm5AEpT4J+zXr2dB49vD
         CMZiUO6pnMRB7eMLa3Lo6CY+6skpGSuBZnPshbK/ab+inz/JhmnltFJH4PAqWmI5VGuE
         SVFwQcEdxgb92SCPZ01iIG+m4c28t1lbSsKTQTyAAI+5E2gBRbK858m6TRG3hkiI/a6Z
         ZcOUExoqBwJV3JZu9zDsTMgtSk30ZvlANH8HuKz6N99YeZX66pocroYLRDxgumRGuss0
         q9KGgZRll5fRONyLPK4OBFO/Df2UQocdQsvh3/H1Mg/KgXWVOkHlbbFm7mjrb2X9ccpQ
         7gOg==
X-Gm-Message-State: AOAM532akHdTYOhLksYowOGvoXTkHasjQ11DmNYf46vAcK/Q8WkjVr8U
        ISEtNPmdffyEFHr/ksdvAXamag==
X-Google-Smtp-Source: ABdhPJy3hQDCnPl6h1dVLCWoQFoDYGjFrg2/1rsYH0TJwFbq3jVshaM62dCqdnk2IUlzQb/NxFXZ3A==
X-Received: by 2002:a63:1263:: with SMTP id 35mr5496773pgs.221.1624555108972;
        Thu, 24 Jun 2021 10:18:28 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:fd74:62bc:19e3:a43b])
        by smtp.gmail.com with ESMTPSA id z9sm3365960pfa.2.2021.06.24.10.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 10:18:28 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
        bjorn.andersson@linaro.org, ulf.hansson@linaro.org,
        adrian.hunter@intel.com, bhelgaas@google.com
Cc:     john.garry@huawei.com, robdclark@chromium.org,
        quic_c_gdjako@quicinc.com, saravanak@google.com,
        rajatja@google.com, saiprakash.ranjan@codeaurora.org,
        vbadigan@codeaurora.org, linux-mmc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        iommu@lists.linux-foundation.org, sonnyrao@chromium.org,
        joel@joelfernandes.org, Douglas Anderson <dianders@chromium.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] iommu/arm-smmu: Check for strictness after calling impl->init_context()
Date:   Thu, 24 Jun 2021 10:17:58 -0700
Message-Id: <20210624101557.v2.2.I0ddf490bdaa450eb50ab568f35b1cae03bf358f0@changeid>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
In-Reply-To: <20210624171759.4125094-1-dianders@chromium.org>
References: <20210624171759.4125094-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Implementations should be able to affect the strictness so reorder a
little bit so we call them before we look at the strictness.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Patch moving check for strictness in arm-smmu new for v2.

 drivers/iommu/arm/arm-smmu/arm-smmu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 6f72c4d208ca..659d3fddffa5 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -761,15 +761,15 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 		.iommu_dev	= smmu->dev,
 	};
 
-	if (!iommu_get_dma_strict(domain))
-		pgtbl_cfg.quirks |= IO_PGTABLE_QUIRK_NON_STRICT;
-
 	if (smmu->impl && smmu->impl->init_context) {
 		ret = smmu->impl->init_context(smmu_domain, &pgtbl_cfg, dev);
 		if (ret)
 			goto out_clear_smmu;
 	}
 
+	if (!iommu_get_dma_strict(domain))
+		pgtbl_cfg.quirks |= IO_PGTABLE_QUIRK_NON_STRICT;
+
 	if (smmu_domain->pgtbl_quirks)
 		pgtbl_cfg.quirks |= smmu_domain->pgtbl_quirks;
 
-- 
2.32.0.93.g670b81a890-goog

