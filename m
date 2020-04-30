Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33DFD1C0646
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2020 21:25:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726580AbgD3TZG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Apr 2020 15:25:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbgD3TZG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Apr 2020 15:25:06 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B99C2C035495
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2020 12:25:04 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id x15so346852pfa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2020 12:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LWzoBfWYBplb188JYPfec8yiO1FAiglsQQs7ha7y6zc=;
        b=zvIhEeo6o5Oci/1eDGxIxa70cqZyoYJPXylX1Jz8dm4uPN+VdUMi5dd63F1duzrKjf
         RbDbL4orJsgYwq7Nj0UTh3yQbN4K0xHm3MIzvy5ZD3vZU2dEZ4WTK5ZSvBz/KhNhDNRi
         iq4ZR0E2/FCU5UX9o2YRqOluF3k9408xQAXoHNf8e9LxoECnH5HXqwOJ0rv7LjXnhyyW
         yS/J0pcItyBpgwidW4/F9usyFm2BZPVgghgNjxRdQThOIQoH0bSYmBNCHOuxLIXuzZaE
         8kNRwr8BxYU8I87WPqhv6VIAhcrOvoocf9qPGC8gtHNJf58mlCE62qWRAmVLrpUHxnod
         A6ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LWzoBfWYBplb188JYPfec8yiO1FAiglsQQs7ha7y6zc=;
        b=cu+h4nMApotE5BW7Lm4EEU13sZ7dWSJiu3RimOzSyc4xgiDNtOiNAkG0ztT2d6ydjW
         eXQr7f2xJAnf9eOr6i6X7xgIRTot+nX/zQl742g/bt7Twpr1HUudFw6mbv6vxVcZ8JEp
         +C0qLrWiU4ii2dc814WqJzKqCPLwk1Hheflamq4X9DEPMW6woNdta8bnCFNL8XdbC6zQ
         dNwO5fF05+D9ezOJMeSsnBcJsi6YFM+Uiqf4cCTOCJD9ZQIczwpjSS/2SwIUcWOLdb5+
         ApDZhNwjK5js7Y7qFBhdVKswz4AnasysOqe2ScJUhv0KWFVSff5SHGHC12//lV+PYFPT
         SObg==
X-Gm-Message-State: AGi0PuZUt2D49hOgr+ON7BAZUVsMePT0JFbNWbLULWgWHcsR1Fyw6Syo
        bH/M6r2n/gdZjPL1wbNlAn8jAQ==
X-Google-Smtp-Source: APiQypLCsVX9Nh3B0wNo8iNCW3Dh7d+/91P/QFHKJM1aSTI3VdeXI7wM5INe9jYGfLmdFCvuIRM2Ow==
X-Received: by 2002:aa7:8b12:: with SMTP id f18mr271949pfd.81.1588274704103;
        Thu, 30 Apr 2020 12:25:04 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id v26sm463594pfe.121.2020.04.30.12.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 12:25:03 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] drm/msm: Fix undefined "rd_full" link error
Date:   Thu, 30 Apr 2020 12:24:27 -0700
Message-Id: <20200430192427.4104899-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

rd_full should be defined outside the CONFIG_DEBUG_FS region, in order
to be able to link the msm driver even when CONFIG_DEBUG_FS is disabled.

Fixes: e515af8d4a6f ("drm/msm: devcoredump should dump MSM_SUBMIT_BO_DUMP buffers")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/msm/msm_rd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_rd.c b/drivers/gpu/drm/msm/msm_rd.c
index 732f65df5c4f..fea30e7aa9e8 100644
--- a/drivers/gpu/drm/msm/msm_rd.c
+++ b/drivers/gpu/drm/msm/msm_rd.c
@@ -29,8 +29,6 @@
  * or shader programs (if not emitted inline in cmdstream).
  */
 
-#ifdef CONFIG_DEBUG_FS
-
 #include <linux/circ_buf.h>
 #include <linux/debugfs.h>
 #include <linux/kfifo.h>
@@ -47,6 +45,8 @@ bool rd_full = false;
 MODULE_PARM_DESC(rd_full, "If true, $debugfs/.../rd will snapshot all buffer contents");
 module_param_named(rd_full, rd_full, bool, 0600);
 
+#ifdef CONFIG_DEBUG_FS
+
 enum rd_sect_type {
 	RD_NONE,
 	RD_TEST,       /* ascii text */
-- 
2.24.0

