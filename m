Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C24E46213C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2019 17:12:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726318AbfGHPMb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Jul 2019 11:12:31 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:37674 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725966AbfGHPMb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Jul 2019 11:12:31 -0400
Received: by mail-pl1-f193.google.com with SMTP id b3so5127645plr.4;
        Mon, 08 Jul 2019 08:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=0ZlZQON9aXZI6W+/rm8yZm1Su8lHYcjbQIV3vB7p7ls=;
        b=WLG9PY/b56egrw6ro2o0M9u014Bd6pXU/gKDM9DWFKxH39OIF3810maRQKFlW5uRIq
         pN+4h9otmfgFm2UMQ05iVf/Mz/oGsvnbZgMWTSNQujR8HC+qUf73scnCmGiRJH+v0k08
         smv9KF8upZ4PAvBORJTFLeotH0hcXF9rwCuDgCTGs1M8R9cApI/vNYc7JLSeqATcqdfI
         h9abqenJJqCvOVVx0LKtp2nIG/lIyiqsEPUtvRfgGJ5jymTuV3QTGxV7KiDXtnfmeQCk
         IVOu6WplVBtQMIhTvR1thGTS8x4ieB5i5f/al64O31QA5Ml7yJ3AQVYX0yGYLoBoqLwD
         PgJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=0ZlZQON9aXZI6W+/rm8yZm1Su8lHYcjbQIV3vB7p7ls=;
        b=uYOct0+wvqNwwBBTyNFFdnU/uVaetnVjvHCWcw+bD/hKA1RXhrTlIJbUqFOXnbKOBm
         nTjoc+1minjXfYby7CAG4xZSJMQZEQTY+H/wCuhOk90B2PJj7RFARc6NnETL4y8xD+W8
         56bV/arjwOG7WCGEGZqhOnAQ87AQNpNeDXEwrVoaKdGO+KAFLTf0ZON/USSruXh4OW53
         6urZ0cChSp6I/BwFrchFaE6G9TLdbA8mJiIBC7xdad4fjnCl4UtuLtF5/tqLyPApX0Sn
         NhAqtEePs20vrrpu8tBDnU2swl6vtQIJ/IgwHKPKOOu72f15lps8KxSZ5EYNA0T8ldL0
         8lCg==
X-Gm-Message-State: APjAAAXUswhjy8T6jwVVp/fNzGQnNRr0NIHcrH0PLZgm/ujCE2Newx5P
        Kl+tXv5j5Y3vRxTWVAVhuzQ=
X-Google-Smtp-Source: APXvYqzGcOLSRTDXNOYk/ZPO4pPqDF4I8CW3Kxig9leWs34URU+rJA8ZvqMFQ9pnLLDKwfcSi1JXAg==
X-Received: by 2002:a17:902:b20d:: with SMTP id t13mr24385288plr.229.1562598750859;
        Mon, 08 Jul 2019 08:12:30 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id q198sm23082354pfq.155.2019.07.08.08.12.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Jul 2019 08:12:30 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v2] drm/msm/mdp5: Find correct node for creating gem address space
Date:   Mon,  8 Jul 2019 08:12:24 -0700
Message-Id: <20190708151224.22555-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Creating the msm gem address space requires a reference to the dev where
the iommu is located.  The driver currently assumes this is the same as
the platform device, which breaks when the iommu is outside of the
platform device (ie in the parent).  Default to using the platform device,
but check to see if that has an iommu reference, and if not, use the parent
device instead.  This should handle all the various iommu designs for
mdp5 supported systems.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---

v2: It turns out there isn't a universal way to get the iommu device, so 
check to see if its in the current node or parent

 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 4a60f5fca6b0..02dc7d426cb0 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -663,6 +663,7 @@ struct msm_kms *mdp5_kms_init(struct drm_device *dev)
 	struct msm_kms *kms;
 	struct msm_gem_address_space *aspace;
 	int irq, i, ret;
+	struct device *iommu_dev;
 
 	/* priv->kms would have been populated by the MDP5 driver */
 	kms = priv->kms;
@@ -702,7 +703,11 @@ struct msm_kms *mdp5_kms_init(struct drm_device *dev)
 	mdelay(16);
 
 	if (config->platform.iommu) {
-		aspace = msm_gem_address_space_create(&pdev->dev,
+		iommu_dev = &pdev->dev;
+		if (!iommu_dev->iommu_fwspec)
+			iommu_dev = iommu_dev->parent;
+
+		aspace = msm_gem_address_space_create(iommu_dev,
 				config->platform.iommu, "mdp5");
 		if (IS_ERR(aspace)) {
 			ret = PTR_ERR(aspace);
-- 
2.17.1

