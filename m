Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E62F144DD88
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Nov 2021 23:02:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233901AbhKKWFO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Nov 2021 17:05:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234146AbhKKWFN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Nov 2021 17:05:13 -0500
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9349CC0613F5;
        Thu, 11 Nov 2021 14:02:23 -0800 (PST)
Received: by mail-io1-xd2f.google.com with SMTP id w22so8804682ioa.1;
        Thu, 11 Nov 2021 14:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Mbanz3Hfm4S/C9DnDL7HTgcmeqSrMpcM5u5NhVQnBuE=;
        b=DmXCdbRBoMWI1VYMI2YRL7P5zoc6R1p7G+fy2Hx3MJid/seCHRkz+7bbuoHcUvt6Ru
         SC2WGtzWNjxOriGj6/8Dt8wQAEe8TH9nmjiySsQzyrJrCcOaz3NMmCWeIzeLYIuHZo6M
         3RwTgvE4FEMrUG1qmnh4pk2RTbNUCwVk7G2C5M7/MtDOpYq+Jm1pqUCityV3cDWmt8vE
         mW0fx35QuyYmGiORKMD23vCRBK0sOkD+n5KrGduqOHSm3rCf1Q9VVBEvXHPnR4PS7Ky0
         pJZ/tuLKXLFECbEY+Npir6CmwXm+9eJyaPxZNzQTc2VWwR0pmBHH5Oy7oqfOGwTSAHi+
         Rfrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Mbanz3Hfm4S/C9DnDL7HTgcmeqSrMpcM5u5NhVQnBuE=;
        b=AMEnZ9Lf3N4iIAdU6/GR7d7V3jlR/WHQlGP6PAamGfLr90rQD4PEUpsgCY4Cmx2QDV
         NvR9QJ+qoe1Wi/lnvl6Bd3g62c4CayFptfKWUbE+2JE42pMAD5RGe668BTCETS6oYMJk
         dBD2o0ubk6KMYVL0rUbAV3YlNSIcFpw7i2zsEsoisAQ/IWcY7p2HgCF/UuIWp3tg+Fcg
         L4Sm0sAG3P0HhY/w9VllXkmN36HHtb3Y1N0re3ceotcmyP5NQwx2Il50usLZ/X+4FKOQ
         +AbPR5ycX5KuKZRQP26hJ2M0/S08XW2rf9kjXJmP+WHqtOd4ujd2FU6A26IujnrSMF3x
         Hdvw==
X-Gm-Message-State: AOAM531biyskzwhMd5SvRZq7j806/ZtSZMJ1Y4LaH/mVHixvDTL1TEYv
        XraW67Hl3up2GpbeBmJL0MA=
X-Google-Smtp-Source: ABdhPJzaxVowbpjY4Enj6gZEXCpcUzdifKZ5Ri/ujMA2V+WrooRclNivztuFNXyAwaCrp8fxJYvabw==
X-Received: by 2002:a05:6602:2a42:: with SMTP id k2mr6924715iov.132.1636668142992;
        Thu, 11 Nov 2021 14:02:22 -0800 (PST)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
        by smtp.googlemail.com with ESMTPSA id t5sm2612315ilp.8.2021.11.11.14.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 14:02:22 -0800 (PST)
From:   Jim Cromie <jim.cromie@gmail.com>
To:     jbaron@akamai.com, gregkh@linuxfoundation.org, robdclark@gmail.com,
        sean@poorly.run, daniel.vetter@ffwll.ch, seanpaul@chromium.org,
        lyude@redhat.com, linux-kernel@vger.kernel.org,
        rostedt@goodmis.org, mathieu.desnoyers@efficios.com,
        dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        intel-gvt-dev@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org
Cc:     quic_saipraka@quicinc.com, will@kernel.org,
        catalin.marinas@arm.com, quic_psodagud@quicinc.com, maz@kernel.org,
        arnd@arndb.de, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, mingo@redhat.com,
        jim.cromie@gmail.com
Subject: [PATCH v10 02/10] drm: fix doc grammar
Date:   Thu, 11 Nov 2021 15:01:58 -0700
Message-Id: <20211111220206.121610-3-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211111220206.121610-1-jim.cromie@gmail.com>
References: <20211111220206.121610-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

allocates and initializes ...

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/drm/drm_drv.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index 0cd95953cdf5..4b29261c4537 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -486,7 +486,7 @@ void *__devm_drm_dev_alloc(struct device *parent,
  * @type: the type of the struct which contains struct &drm_device
  * @member: the name of the &drm_device within @type.
  *
- * This allocates and initialize a new DRM device. No device registration is done.
+ * This allocates and initializes a new DRM device. No device registration is done.
  * Call drm_dev_register() to advertice the device to user space and register it
  * with other core subsystems. This should be done last in the device
  * initialization sequence to make sure userspace can't access an inconsistent
-- 
2.31.1

