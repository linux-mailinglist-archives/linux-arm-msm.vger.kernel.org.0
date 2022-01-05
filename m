Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A6B5485C3C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jan 2022 00:27:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245379AbiAEX1G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Jan 2022 18:27:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245364AbiAEX1F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Jan 2022 18:27:05 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20C84C061245
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jan 2022 15:27:05 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id h21so1328838ljh.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jan 2022 15:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=58QAv1zSqapbnHsZYOklL7IQDyaDq+jkAqsKjvZ/E/Y=;
        b=Kjo4mVSxgdH4TDW8ccNVmTg4lD4jQFmHJ5XOzqcVYOLjEKC6Zeflsn9RzSmdr90VEn
         8lM/BK9c3lWY5TXLjoMjZf1kKCw7bVUFnUGFk02Q/jQ7glLeBjO0fdf9rl0ydOfdCKh0
         FkEZja32ca5ytgYGMOOJKMu8Cn0FPrTT5asw+7//viYk/mWoBJNxooRn9WyzId59uVNZ
         JMQJJb5Ktw9s07kp45mknpnTh5e9cXkfPZE6w3KGsxs1u2leE97FqznK3oJWpn85duzg
         vhhWQ4U7jLFuHC0HeU0lS+bKEg6opDmwxHC3yGZW5WlAzDbhdC2APq/OE5Zf3lopuRDy
         t0+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=58QAv1zSqapbnHsZYOklL7IQDyaDq+jkAqsKjvZ/E/Y=;
        b=GKCRk+TCQXPp3vCOco7lccplQRgs+uL4N9ZkSf8iAxT6UETycOo9XzVVifxvUfcPmA
         O1+jnMCRxTS7BJNfBpUapFLWFVzSjYia9LRGC/OTEBIx974T7XnHpj1J9J3xTrEuxArJ
         /6akQOrnq+/jIItDzpnvOzFVD7Qb3o6nh9kO9bwPjUHQ4QtdYupypF0XIeNtNWzj39dg
         1aYsKAxQ4hHoBVAI+Gcx7YgFfEs6YX6fpqkn1yGVz98sLTTIs0AsDcd1o0IWj2SrP+fl
         Acg4o+d/wKvro9zfdQVjlV7sdLSR9JGNmEnDbF9H3KBEF/LdmcbI5r7lSZYpTe/WNesn
         LC9w==
X-Gm-Message-State: AOAM533yjxLXLDXHrXM6OzO4/acyToWSUVd8b4BiSMB6khEt9rCd5kEw
        EfLC24w5/q2ZW7avGym28AdpfQ==
X-Google-Smtp-Source: ABdhPJziercrKqupFX3QrWF1vReHcy6CB453wpr9RX8j0Y62WoVYu/2gv3rWq/bjtVw2J/jkCoLfNQ==
X-Received: by 2002:a2e:9e81:: with SMTP id f1mr45680361ljk.469.1641425223435;
        Wed, 05 Jan 2022 15:27:03 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b29sm28730lfv.187.2022.01.05.15.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jan 2022 15:27:02 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 3/3] drm/msm: move msm_readl/_writel to msm_drv.h
Date:   Thu,  6 Jan 2022 02:27:00 +0300
Message-Id: <20220105232700.444170-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220105232700.444170-1-dmitry.baryshkov@linaro.org>
References: <20220105232700.444170-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

With the reglog removal, msm_readl/_writel became single line wrappers
around readl/writel. Move those two wrappers and msm_rmw to msm_drv.h to
remove need for extra function calls when doing register writes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 20 --------------------
 drivers/gpu/drm/msm/msm_drv.h | 14 +++++++++++---
 2 files changed, 11 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 73757b7dc935..fd62a4da14a1 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -164,26 +164,6 @@ void __iomem *msm_ioremap_size(struct platform_device *pdev, const char *name,
 	return _msm_ioremap(pdev, name, false, psize);
 }
 
-void msm_writel(u32 data, void __iomem *addr)
-{
-	writel(data, addr);
-}
-
-u32 msm_readl(const void __iomem *addr)
-{
-	u32 val = readl(addr);
-
-	return val;
-}
-
-void msm_rmw(void __iomem *addr, u32 mask, u32 or)
-{
-	u32 val = msm_readl(addr);
-
-	val &= ~mask;
-	msm_writel(val | or, addr);
-}
-
 static enum hrtimer_restart msm_hrtimer_worktimer(struct hrtimer *t)
 {
 	struct msm_hrtimer_work *work = container_of(t,
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 56d1242efcc1..3ab19775a5c3 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -484,9 +484,17 @@ void __iomem *msm_ioremap(struct platform_device *pdev, const char *name);
 void __iomem *msm_ioremap_size(struct platform_device *pdev, const char *name,
 		phys_addr_t *size);
 void __iomem *msm_ioremap_quiet(struct platform_device *pdev, const char *name);
-void msm_writel(u32 data, void __iomem *addr);
-u32 msm_readl(const void __iomem *addr);
-void msm_rmw(void __iomem *addr, u32 mask, u32 or);
+
+#define msm_writel(data, addr) writel((data), (addr))
+#define msm_readl(addr) readl((addr))
+
+static inline void msm_rmw(void __iomem *addr, u32 mask, u32 or)
+{
+	u32 val = msm_readl(addr);
+
+	val &= ~mask;
+	msm_writel(val | or, addr);
+}
 
 /**
  * struct msm_hrtimer_work - a helper to combine an hrtimer with kthread_work
-- 
2.34.1

