Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2619CAC22F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2019 23:48:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404510AbfIFVst (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Sep 2019 17:48:49 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:36472 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404402AbfIFVss (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Sep 2019 17:48:48 -0400
Received: by mail-pf1-f193.google.com with SMTP id y22so5465259pfr.3;
        Fri, 06 Sep 2019 14:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PmbeXR16EILkjisUuUV6rfWxt0BghSuM480d7BBoObE=;
        b=l9KS64BP1B0VVFLP3cG+Fu9U3dUbCksmelSZOoyogDcNDZW7sjsm328l7B9JP6x26f
         DZaO/ojDzSUVS4Il84HxoyaRZCseDaFTbt0s08wXIhLhOunAvz314/stiuohiLGFMmpE
         o3ol62LvFBaKO08hIXHcKu89nLOnrucM/f4gr9kbmXTL/db0eQb2NfDz1gsUIVqf14t0
         QS0EoD8cKG4EdIQwYJ9KgSsGFyxXBCE3mbcRtamjbEN+ffrHwSzbUJ5ryEqWsTz7LGFr
         PJrVc19D7lpchjdUYFkmeYBA9fAiwKYdQ49Fv5Gw7pcbMrSl95PcHvVJdZOvz2bGBBlT
         Gx5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PmbeXR16EILkjisUuUV6rfWxt0BghSuM480d7BBoObE=;
        b=XoAG6P2yCvHQxTQwpe4FYkcVt2PvxpDxRFidG7rt0sxALFogQVfRFCbhJh0VPr0j7D
         ukQ4fJMvguSOtMVZ3SIisTaUiP4h7WFSps0FfKCZOg6N4OzlLWoR0Dnc8EjqzshjQkq5
         RhOpnVZxch4U+ZwkF79+3+vweX7BNWxq9AT0Fd9VzHh/25HAGPdC65L/DK0w1w6ifQgr
         4vcTE1SCCnrKpoqe8wVXitX1uGe5dsU1v4ioVIIohrdm7bCiz1HMv2Nj3LQxUkv8wj0A
         qtPdgycp4ZBD+JOOEGnLsSLoExc4o4ueyc1wjY9AZMRJn6tRCA+4xrHHwn2OIyOEggCD
         knFQ==
X-Gm-Message-State: APjAAAXSqUzevw/p6s5Jgi45bkyxmMCqSnX0JLUH9fucSmtmHyC/rADJ
        ERDHgRO8VlQtflD6gHp8o2k=
X-Google-Smtp-Source: APXvYqxQCd7WFr1bk2mCpZ+S1Nv/UOSK0AKJu6DLOAfsUfGckUthB3lN7nqi/NUB8YzjJgdlC0+ugA==
X-Received: by 2002:a63:4823:: with SMTP id v35mr9858403pga.138.1567806528190;
        Fri, 06 Sep 2019 14:48:48 -0700 (PDT)
Received: from localhost ([100.118.89.196])
        by smtp.gmail.com with ESMTPSA id j9sm6894230pfi.128.2019.09.06.14.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2019 14:48:47 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     iommu@lists.linux-foundation.org
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Joe Perches <joe@perches.com>, Arnd Bergmann <arnd@arndb.de>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/2] iommu: add support for drivers that manage iommu explicitly
Date:   Fri,  6 Sep 2019 14:44:01 -0700
Message-Id: <20190906214409.26677-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190906214409.26677-1-robdclark@gmail.com>
References: <20190906214409.26677-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Avoid attaching any non-driver managed domain if the driver indicates
that it manages the iommu directly.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/iommu/iommu.c    | 2 +-
 drivers/iommu/of_iommu.c | 3 +++
 include/linux/device.h   | 3 ++-
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 0c674d80c37f..2ac5e8d48cae 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -674,7 +674,7 @@ int iommu_group_add_device(struct iommu_group *group, struct device *dev)
 
 	mutex_lock(&group->mutex);
 	list_add_tail(&device->list, &group->devices);
-	if (group->domain)
+	if (group->domain && !(dev->driver && dev->driver->driver_manages_iommu))
 		ret = __iommu_attach_device(group->domain, dev);
 	mutex_unlock(&group->mutex);
 	if (ret)
diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
index 614a93aa5305..62b47e384a77 100644
--- a/drivers/iommu/of_iommu.c
+++ b/drivers/iommu/of_iommu.c
@@ -221,6 +221,9 @@ const struct iommu_ops *of_iommu_configure(struct device *dev,
 	} else if (err < 0) {
 		dev_dbg(dev, "Adding to IOMMU failed: %d\n", err);
 		ops = NULL;
+	} else if (dev->driver && dev->driver->driver_manages_iommu) {
+		dev_dbg(dev, "Driver manages IOMMU\n");
+		ops = NULL;
 	}
 
 	return ops;
diff --git a/include/linux/device.h b/include/linux/device.h
index 1aa341b2a0db..b77a11b8d9bb 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -284,7 +284,8 @@ struct device_driver {
 	struct module		*owner;
 	const char		*mod_name;	/* used for built-in modules */
 
-	bool suppress_bind_attrs;	/* disables bind/unbind via sysfs */
+	bool suppress_bind_attrs:1;	/* disables bind/unbind via sysfs */
+	bool driver_manages_iommu:1;	/* driver manages IOMMU explicitly */
 	enum probe_type probe_type;
 
 	const struct of_device_id	*of_match_table;
-- 
2.21.0

