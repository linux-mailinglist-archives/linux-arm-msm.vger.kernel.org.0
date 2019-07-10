Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9083C64C11
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2019 20:28:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727976AbfGJS2x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Jul 2019 14:28:53 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:45720 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727242AbfGJS2x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Jul 2019 14:28:53 -0400
Received: by mail-pg1-f194.google.com with SMTP id o13so1617864pgp.12;
        Wed, 10 Jul 2019 11:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=X2wPmom3sJSwZ6VYG/6JKsbwq16BGxAUHYVA29t4WUs=;
        b=bdE1SnlndmJmWXI4tshCAMHf1y6EjPIbK8Fbzi7N09M0t7c7CXz9jPaAF+U4zpK2Ar
         qgCiZ/PtW4leBd9a9AxyI8AX8KAj2qjw9PES2Zr2jdM0CYFXuuMwafu1VW3XyuIX85ze
         WyeGDguVLVu37gQ+z7B90eyFqfNkom1MP3LikG5lNXvgTOw7RM96ogRtu5S7/ndJUKBX
         SFSf82JGBHHIEmapCMaggiqsSGmD80h/HwjFTvWjD5i1CXq8qlzCKfCl22YLtstT+vsh
         abGOlhy9STPiO77wHf6EZUAMV63/A7eAJBWH/kg8JCzyNogW1v4N+kxJ1fDAn8+Wu7uz
         ddfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X2wPmom3sJSwZ6VYG/6JKsbwq16BGxAUHYVA29t4WUs=;
        b=mJhQbxV02/aZS4ZIhBRHQEWogTHEUOezzeSGhJqHTFL9MsLOlbmzrGdjRNMq4OoHid
         x8p7NBNPgkDKsRroQ+SgbXhb/D98N5DQmCIw9/0VNdCD+BZBhfVSfFrneJE5diTiAoPM
         cAAstayO7G4fm5MARvtbaKlOLV6+P3oCQw50OEObYhV5tu9gBugAqM47oClGvl2d16MZ
         wKebb76nMwIXIP5oVbyCymCX2GAUGj3nTO6azCyGfu+b/vShLSOcB7ORzAKOOqPaYe7H
         Hpm6J+wC+28/gByQzJ3658xnQtwHSLGpV7Td3GJDN7qJkvBmiggwCGf5UFS2wU/mKGzR
         e6cg==
X-Gm-Message-State: APjAAAVIWcVPBAzMksrxkN+KVc0WO4jd7TvNWr5sXRhhD4oFjFYHDYOW
        tQkUfpchd5M+aYBRjWswLjM=
X-Google-Smtp-Source: APXvYqzxVJwORPZh7pa+tFmbtMmG7GfDyUMvQifbBp9D3WGXW+RU3JFqDMMKkm/CNidWkfL1FXSk/Q==
X-Received: by 2002:a65:454c:: with SMTP id x12mr38500524pgr.354.1562783332011;
        Wed, 10 Jul 2019 11:28:52 -0700 (PDT)
Received: from localhost ([2620:15c:f:fd00:4c3b:936:8dc5:a2ad])
        by smtp.gmail.com with ESMTPSA id d16sm2943054pgb.4.2019.07.10.11.28.50
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 10 Jul 2019 11:28:51 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     iommu@lists.linux-foundation.org
Cc:     linux-arm-msm@vger.kernel.org, aarch64-laptops@lists.linaro.org,
        Rob Clark <robdclark@chromium.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Joe Perches <joe@perches.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] iommu: add support for drivers that manage iommu explicitly
Date:   Wed, 10 Jul 2019 11:28:30 -0700
Message-Id: <20190710182844.25032-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702202631.32148-2-robdclark@gmail.com>
References: <20190702202631.32148-2-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Avoid attaching any non-driver managed domain if the driver indicates
that it manages the iommu directly.

This avoids a problem on devices where the bootloader takes the SMMU out
of bypass and enables scanout, such as is the case on snapdragon aarch64
laptops and newer snapdragon android devices.  Attaching an IDENTITY or
DMA domain before the driver has a chance to intervene will break efifb
scanout and start triggering iommu faults.

If the driver manages the iommu directly (as does drm/msm), it can
shut down scanout when it is ready to take over the display, before
attaching an UNMANAGED domain.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
v2. Move the check into arm_smmu_attach_dev() (as I *think* this is
    what Robin preferred; update commit msg to focus on the display
    related issue that this solves.

We also need Bjorn's patch set to inherit SMR and CB config during
init:

https://www.spinics.net/lists/arm-kernel/msg732246.html

 drivers/iommu/arm-smmu.c | 11 +++++++++++
 include/linux/device.h   |  3 ++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index 1a5efa7c8767..4a80710124db 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -1411,6 +1411,17 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
 		return -ENXIO;
 	}
 
+	/*
+	 * If driver is going to manage iommu directly, then avoid
+	 * attaching any non driver managed domain.  There could
+	 * be already active dma underway (ie. scanout in case of
+	 * bootloader enabled display), and interfering with that
+	 * will make things go *boom*
+	 */
+	if ((domain->type != IOMMU_DOMAIN_UNMANAGED) &&
+	    dev->driver && dev->driver->driver_manages_iommu)
+		return 0;
+
 	/*
 	 * FIXME: The arch/arm DMA API code tries to attach devices to its own
 	 * domains between of_xlate() and add_device() - we have no way to cope
diff --git a/include/linux/device.h b/include/linux/device.h
index e138baabe01e..d98aa4d3c8c3 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -282,7 +282,8 @@ struct device_driver {
 	struct module		*owner;
 	const char		*mod_name;	/* used for built-in modules */
 
-	bool suppress_bind_attrs;	/* disables bind/unbind via sysfs */
+	bool suppress_bind_attrs:1;	/* disables bind/unbind via sysfs */
+	bool driver_manages_iommu:1;	/* driver manages IOMMU explicitly */
 	enum probe_type probe_type;
 
 	const struct of_device_id	*of_match_table;
-- 
2.20.1

