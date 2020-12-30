Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBF372E7A59
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Dec 2020 16:32:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726524AbgL3Pap (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Dec 2020 10:30:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726520AbgL3Pap (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Dec 2020 10:30:45 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A61F2C061799;
        Wed, 30 Dec 2020 07:30:04 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id dk8so15758024edb.1;
        Wed, 30 Dec 2020 07:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=34sdCTMrNUObLPeLZuPMjVUhdN1zCiYujY6a/wW1ipc=;
        b=bt3oJcCNtOW3cWrm50FMG+rjfDl+IXCXWBtd5YDNz+/SbYjQYkue7+pUezRIOa0hTW
         HhcYTecp87p8ebxL7RLEOQ8bp9vtbe+L/TInVLvKKx7G77cG/ZHA4IP4wQB3pwnTsRj4
         KDkEkNH8gwFXCJoqhLcTD1KhHYoRW9VJ9avTV/mg1B9d4lwacnrJly4NyIbhDV2i8Eoq
         0oM+DR9ZHpVy1yRH+7rYrt5o47uSe8m3Rb4Snn0kY0fp5y+zUC6pDBWi0zL5PFtOFVe5
         tJhoPsmlPYZkY+QchldNivTAAvAp7ODD+tiUG35Wtol/D4mr+3244lX8TeMHm+yMUG4L
         AJYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=34sdCTMrNUObLPeLZuPMjVUhdN1zCiYujY6a/wW1ipc=;
        b=A+3dzLbFQXTOebCU/aIPNlQn5K60TLptaHVwqL5lihhyMdAtLKkztdsPgOAb5hzNwD
         XgQWHXfXP/Gqi/qkiCn643z68LdeRdgG5on15Hf7ysyOF8+ex9d23mGyj31B8s+8znyy
         3EnIsyhn0LheYV8fIlS6us6hUNjWmrntGk/ZMAbMOt4B99gMF6YkJtdxzUmUXW+AYD7W
         efRGz8oQ2GTioeKYgsY/O0XuAqO/tjGt/juUnnmDErvPhBgy74nbYEKCT7T4L2TsGmn8
         2GzX/6A+TSCu8FWsbgVBg95xmeJk/Y/I8y7Wh8DQIhBF5S0LQzFmC9MekgsCirDVELip
         VAwA==
X-Gm-Message-State: AOAM532VXKnCYS5it/6MzixKv99paHP42pW4O8zomEugteC1TCATUnr/
        4cr0oDBbxvYTN8s+wo6tp0g=
X-Google-Smtp-Source: ABdhPJwK7Gav6N/d5gKjfxc10ZINhRcsguTBCZmmG/0yuTe6suMA2Y19hrEBCWuQP4axLFc51DDVCg==
X-Received: by 2002:a50:c315:: with SMTP id a21mr51111550edb.50.1609342203425;
        Wed, 30 Dec 2020 07:30:03 -0800 (PST)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id r7sm31630588edh.86.2020.12.30.07.30.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Dec 2020 07:30:02 -0800 (PST)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Akhil P Oommen <akhilpo@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Brian Masney <masneyb@onstation.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sean Paul <sean@poorly.run>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        Wambui Karuga <wambui.karugax@gmail.com>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Craig Tatlor <ctatlor97@gmail.com>
Subject: [PATCH 1/2] drm/msm: Call msm_init_vram before binding the gpu
Date:   Wed, 30 Dec 2020 17:29:42 +0200
Message-Id: <20201230152944.3635488-1-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Craig Tatlor <ctatlor97@gmail.com>

vram.size is needed when binding a gpu without an iommu and is defined
in msm_init_vram(), so run that before binding it.

Signed-off-by: Craig Tatlor <ctatlor97@gmail.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 535a0263ceeb4..108c405e03dd9 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -457,14 +457,14 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 
 	drm_mode_config_init(ddev);
 
-	/* Bind all our sub-components: */
-	ret = component_bind_all(dev, ddev);
+	ret = msm_init_vram(ddev);
 	if (ret)
 		goto err_destroy_mdss;
 
-	ret = msm_init_vram(ddev);
+	/* Bind all our sub-components: */
+	ret = component_bind_all(dev, ddev);
 	if (ret)
-		goto err_msm_uninit;
+		goto err_destroy_mdss;
 
 	dma_set_max_seg_size(dev, UINT_MAX);
 

base-commit: d7a03a44a5e93f39ece70ec75d25c6088caa0fdb
prerequisite-patch-id: aba6f684932cab35d98457c21e4ff7a5ac75c753
prerequisite-patch-id: 4884d57df1bd197896b69e115d9002d6c26ae2e2
-- 
2.29.2

