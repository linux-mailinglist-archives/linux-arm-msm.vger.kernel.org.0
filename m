Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B2AA490C6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2019 22:04:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726642AbfFQUEj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jun 2019 16:04:39 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:46830 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726455AbfFQUEi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jun 2019 16:04:38 -0400
Received: by mail-qt1-f193.google.com with SMTP id h21so12320579qtn.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2019 13:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hAfYkP7d2WvxOZhRBCRJTvRlF3xI0tTIFNDwNnfuAj0=;
        b=IzC6Yy+dyUFQKAxj9w03NH/zDg/rd4E2TwI45rSFseDlnwX6v6+kw8gp9VzqmxCDIk
         vJB6gvNsKZeEfPQSLfmv0f8EIe9wnUf6b29SjNovXXgi/+5FcZo4I8vsBkGqRnRBL8XO
         5UwD/IvU1nCgpQ49aNWBT9qoVIaZlHeP3dAm+nYmmOxT0hjEWc7nC8OVfaARo5YOXAX2
         ktOc87n3NNWW3Ml6qgLtu2Rda09quP3phgUuyD52cU10F4aJFECK1Q6eqVeL+sCFoI9U
         KgMEtLHvE9NjShWyK6S6KFd1RIIxLzJgJuKZ2eTmlgTSNS5orC2XSbAbpY6KZkuBoH97
         kM0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hAfYkP7d2WvxOZhRBCRJTvRlF3xI0tTIFNDwNnfuAj0=;
        b=GVDjJkFpqLBVk5ShMMd580k8xbCGQZfFHF3zHS1q513VaRgS8Flvn1AB6Kkpb4WHEd
         CRiKmJ2qGUxdHNdnRIclarx9CLdPRFX17MBMI+QtiP57ZMtoVEimnyotRdUyBzMzB6eh
         Jbrh1IoaPEPsDo3fDCWHF25GDRxmjMC05rpYs1pKNlh/9yZQ1hnEKdGDRL20dtI0fKMN
         2URBthyRHl2VFzisPwiBaDPwTHPWrvlgX1+Xa7tdr5K08UBTJ3JZa+BmO5HWndtGqzxc
         sgsZ7WmuNUwftAEr7XO5FKVryyaiVctkw4YXfTGcvBq/7V3FtXf9FILO8IwQlHKOjj0Y
         acrA==
X-Gm-Message-State: APjAAAU6b/FxQbT9WCBA6Vre6YV8w0txaai3nCPAjt7EMNuWQ75etMDM
        GT9xGOeyazayB9SDTLj3lZoDDA==
X-Google-Smtp-Source: APXvYqwF2TgSDN5Rp6djhjPuzRXU95E/oIoie46EqS3shh+tm7T9bkobuH8gat0UT8KQouFk+bGu9A==
X-Received: by 2002:ac8:38c5:: with SMTP id g5mr97751585qtc.299.1560801877766;
        Mon, 17 Jun 2019 13:04:37 -0700 (PDT)
Received: from rosewood.cam.corp.google.com ([100.100.175.19])
        by smtp.gmail.com with ESMTPSA id j26sm8584794qtj.70.2019.06.17.13.04.37
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 17 Jun 2019 13:04:37 -0700 (PDT)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Cc:     Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org
Subject: [RESEND PATCH 02/13] drm/msm/dpu: Fix mmu init/destroy functions
Date:   Mon, 17 Jun 2019 16:03:46 -0400
Message-Id: <20190617200405.131843-2-sean@poorly.run>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
In-Reply-To: <20190617200405.131843-1-sean@poorly.run>
References: <20190617200405.131843-1-sean@poorly.run>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

There's a comment in _dpu_kms_hw_destroy() that reads "safe to call
these more than once during shutdown", referring to
_dpu_kms_mmu_destroy(). Unfortunately that's not the case, mmu_destroy
will fail hard if it's called twice. So fix that function to ensure it
can be called multiple times without burning.

While I'm at it, fix the error paths in _dpu_kms_mmu_init() to properly
clean up the iommu domain and not call _dpu_kms_mmu_destroy() when
things are only partially setup.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 885bf88afa3e..d50afbb37a0a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -729,12 +729,16 @@ static int _dpu_kms_mmu_destroy(struct dpu_kms *dpu_kms)
 {
 	struct msm_mmu *mmu;
 
+	if (!dpu_kms->base.aspace)
+		return 0;
+
 	mmu = dpu_kms->base.aspace->mmu;
 
 	mmu->funcs->detach(mmu, (const char **)iommu_ports,
 			ARRAY_SIZE(iommu_ports));
 	msm_gem_address_space_put(dpu_kms->base.aspace);
 
+	dpu_kms->base.aspace = NULL;
 	return 0;
 }
 
@@ -754,25 +758,20 @@ static int _dpu_kms_mmu_init(struct dpu_kms *dpu_kms)
 	aspace = msm_gem_address_space_create(dpu_kms->dev->dev,
 			domain, "dpu1");
 	if (IS_ERR(aspace)) {
-		ret = PTR_ERR(aspace);
-		goto fail;
+		iommu_domain_free(domain);
+		return PTR_ERR(aspace);
 	}
 
-	dpu_kms->base.aspace = aspace;
-
 	ret = aspace->mmu->funcs->attach(aspace->mmu, iommu_ports,
 			ARRAY_SIZE(iommu_ports));
 	if (ret) {
 		DPU_ERROR("failed to attach iommu %d\n", ret);
 		msm_gem_address_space_put(aspace);
-		goto fail;
+		return ret;
 	}
 
+	dpu_kms->base.aspace = aspace;
 	return 0;
-fail:
-	_dpu_kms_mmu_destroy(dpu_kms);
-
-	return ret;
 }
 
 static struct dss_clk *_dpu_kms_get_clk(struct dpu_kms *dpu_kms,
-- 
Sean Paul, Software Engineer, Google / Chromium OS

