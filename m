Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD10C42D572
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Oct 2021 10:52:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230035AbhJNIyE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Oct 2021 04:54:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230042AbhJNIyD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Oct 2021 04:54:03 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72046C061570
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Oct 2021 01:51:58 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id qe4-20020a17090b4f8400b0019f663cfcd1so6410033pjb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Oct 2021 01:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9VG9Tb+ozGbmwq3ZiIbFIRjiDvL9LwB7A4vhXuIIMG4=;
        b=UqpjmWDNsn4r2X4bBdAsIxTO6X6CthCzxhJ7UJ1/tTH9EiiU4275X6M9+62DNjTPrX
         mjrtPNIrNMPWPRfHHep0hqCqPRxO3dMrTk4xLC9O89BPO1Zq9x8vHhqgqBFod8kh/7yn
         Gs5MNq3XAgrIpBFRCcAFRrQ5hyBbGXSVnb8xC4PbDq1CG+6XDr2BO5rCbI4XElNxv4yB
         yvWBEPI50MGO/oXbQyErYRmzf+++vKNYN1V0ifZQciwokbuAst9/3L3lcDOpGrSPNdHu
         MCVLhhsAPJNKxVuO4fIE00tG7EeeC59qNCLvlqza4exDM2jtTGxOqQUPXmR30EKz2En3
         Ny3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9VG9Tb+ozGbmwq3ZiIbFIRjiDvL9LwB7A4vhXuIIMG4=;
        b=xHc6MEmkjPbGJ282Up3Vk0BkLF9yRFTrAUYfWU+AXRFm3Bug+5ca4EET9VU5jnPFhh
         6dEhbFReEQVxTCcTsnk1DdR8n5OAAYNMolKHkA3SlIJkkqjSSwBJejZlfJ5+PuZlD619
         mxudEx10rXZyyGk6v5kAzqk28O2mMS8USwrm0xIJVLMGEMXDdLl7TC7aEV7MIZ9ZewNw
         443q5M5YHW9JxbnucCTWuL8TTUlDUje4OlGUlR48Ru9OGwpZyiaDtUJgN9hvtuOik6S5
         DYP0ddZIPUNiWdpQZJaLDlExh9zjB1Z3U47z7mfZDv/QpMJ70kD/tioXNlHqZ2VaO2lt
         wXFQ==
X-Gm-Message-State: AOAM530A8FhOMS81yHYRJXNXEyDNsAImNhI1ecV3MSU2A5OKUg0YId4+
        VLHQAPVGrreZE1YN5XrFua4=
X-Google-Smtp-Source: ABdhPJw7KNcoB8+LMt8KO0oNXB9C01+w0kV4D1uZug7DlC4dqgo+gfRNib+4CHdRwKkcoz6rP16xag==
X-Received: by 2002:a17:90b:2349:: with SMTP id ms9mr4861383pjb.45.1634201518051;
        Thu, 14 Oct 2021 01:51:58 -0700 (PDT)
Received: from localhost.localdomain ([8.47.15.154])
        by smtp.gmail.com with ESMTPSA id i2sm7968082pjt.19.2021.10.14.01.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 01:51:57 -0700 (PDT)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     Yanteng Si <siyanteng@loongson.cn>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 2/2] drm/msm: Fix missing include files in msm_gem_shrinker.c
Date:   Thu, 14 Oct 2021 16:51:34 +0800
Message-Id: <f270502946fa411cc85c18fc252e5ddbeaf9c2f5.1634200323.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1634200323.git.siyanteng@loongson.cn>
References: <cover.1634200323.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Include linux/vmalloc.h to fix below errors:
error: implicit declaration of function 'register_vmap_purge_notifier'
error: implicit declaration of function 'unregister_vmap_purge_notifier'

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index 0f1b29ee04a9..4a1420b05e97 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -4,6 +4,8 @@
  * Author: Rob Clark <robdclark@gmail.com>
  */
 
+#include <linux/vmalloc.h>
+
 #include "msm_drv.h"
 #include "msm_gem.h"
 #include "msm_gpu.h"
-- 
2.27.0

