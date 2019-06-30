Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73D6B5AFDA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Jun 2019 15:15:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726618AbfF3NPn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 30 Jun 2019 09:15:43 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:42681 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726500AbfF3NPn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 30 Jun 2019 09:15:43 -0400
Received: by mail-qt1-f195.google.com with SMTP id s15so11693036qtk.9;
        Sun, 30 Jun 2019 06:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mEzPtMffhPHV0FxDwTzEclet158kha7XkJ5YHK6YGrM=;
        b=d+kYvh8Xqr+lWHcL4DtqWWfN1709bXLKGGulNTkdMCjBSUfDOWICNG7i8GxwmUv/HX
         WZz3Yes8gDkloACATjJ3MwvmgsXcGUxkdTLUccfui75XYcMs4OJcJ3EVbkhiT5Yzp+p6
         oEgIBXbAzwkGyzixeEv5y0KLo9LFUkrkSh4lR4erSkhGGh8wmG0PRhfr7RXo56RSgl22
         5JKNfuOtdwg7tLaHkKLE63qAXkyUnkB2NsQd5kb/j3BRkoYBKacDlbQ3d4nS8yBm0qr9
         8xy3bE3KOhmlLkqJJeU3BjnxpTTaUBd0I4UOYRWtbSVUNBPC7heU+BcNNDC3co+J7EyU
         KQDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mEzPtMffhPHV0FxDwTzEclet158kha7XkJ5YHK6YGrM=;
        b=e0wLkHV2/uof1B+pDzDclzHF7N9+XCwmcirVf4lNakbbsn6TRthbB3OM9l/oecj9Nl
         JpANlFRWEoOXLSbLaHsx6WAkiehyo1DvB2R5qjrWHG3f2voboiyzP7Hof5dRxrPtLkKG
         lSPgXx60NBG/klSDb0VwN+9i4wFTpPeIEFzqaFDB8bjB4JfRXHbYhqWI3oPlQ6YGeZ2u
         2HAhGgYZoK43rqdYLUJ0sKiGoANzqXT8w7Sw7KraiBdsDDTmA2xkv2CN5HAOG0JuDFe6
         jOtAdqtB99fPPYK9sOyWakqiE3Pac4eRs+XsdDnL0QG9upro97bprLWsV49/IC/9WGrB
         XUfg==
X-Gm-Message-State: APjAAAXcfS0u+g9fqwjGITfPiB1Xntc03CqzvIdwiGvMoS9ic73VWutG
        ehrSTf1g4q5WiUoqQcW+xOPaMDGAmPc=
X-Google-Smtp-Source: APXvYqyDq4MvjL+oGz+qUyrAIGQgTbk/k+i9zOPhBNpiznZsapMswdBFKWUry8EmSqHa3BJzQDhSuQ==
X-Received: by 2002:ac8:27d4:: with SMTP id x20mr15644764qtx.138.1561900542179;
        Sun, 30 Jun 2019 06:15:42 -0700 (PDT)
Received: from localhost ([2601:184:4780:7861:5010:5849:d76d:b714])
        by smtp.gmail.com with ESMTPSA id j2sm3739582qtb.89.2019.06.30.06.15.41
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 30 Jun 2019 06:15:41 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Jayant Shekhar <jshekhar@codeaurora.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] drm/msm/dpu: remove dpu_mdss:hwversion
Date:   Sun, 30 Jun 2019 06:14:42 -0700
Message-Id: <20190630131445.25712-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190630131445.25712-1-robdclark@gmail.com>
References: <20190630131445.25712-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Unused and the extra rpm get/put interferes with handover from
bootloader (ie. happens before we have a chance to check if
things are already enabled).

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
index 986915bbbc02..e83dd4c6ec58 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
@@ -22,7 +22,6 @@ struct dpu_mdss {
 	struct msm_mdss base;
 	void __iomem *mmio;
 	unsigned long mmio_len;
-	u32 hwversion;
 	struct dss_module_power mp;
 	struct dpu_irq_controller irq_controller;
 	struct icc_path *path[2];
@@ -287,10 +286,6 @@ int dpu_mdss_init(struct drm_device *dev)
 
 	dpu_mdss_icc_request_bw(priv->mdss);
 
-	pm_runtime_get_sync(dev->dev);
-	dpu_mdss->hwversion = readl_relaxed(dpu_mdss->mmio);
-	pm_runtime_put_sync(dev->dev);
-
 	return ret;
 
 irq_error:
-- 
2.20.1

