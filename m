Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 309A61B3380
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2020 01:41:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725850AbgDUXlw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Apr 2020 19:41:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726440AbgDUXlu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Apr 2020 19:41:50 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DD99C0610D6
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2020 16:41:49 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id x8so236113qtp.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2020 16:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LvYouvVpcqYLPafw/K5/u16SlbXdlEtkvI3+uiIfQUs=;
        b=G74PTK6TtB9NwQj+FSqGUh2FwwFtWKKCQ+mOSiH63EAaBhzW/vQhn1g45PghckrUdo
         S871ocFS0GrOqjr/r2si+SWzI5Ge85eGKFPXU2HNCU83mmZgo7S5lItiNiBMEs2mEOJg
         gsUKJXpwCQXygXlSgssdZ0GyQfnmHVdS0tikEB1I9MYpowwsLxR1F59/1M7fTzLMz7NO
         VRmXu7/AGWWKMeCNisN1iyQ785p7gL+LwjR2XT3cNhqcHpMbD1ljdRQZ9lVoN+B78zvl
         ZmqSVBL1DSDDXbhuHR3y0/eGmQdsT0MC8tEm7H+f2dswxFr8BmE8bkRXYMduNScQKsMC
         BcWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LvYouvVpcqYLPafw/K5/u16SlbXdlEtkvI3+uiIfQUs=;
        b=h5colHdctkPMHviFBgS+WaCBYXfRpNzxG0iWX/QcAyc3JbDv/7ok/iPkfTHftRU9Wp
         XLTZgqtijd4QTYmL6ooyFB9EaRWc8zY76J0rI1YGMjOTFHsNy1AohyRikdjxakaRuh7J
         Ftb8BZNB69jbcQR2wPZzJ1hmPzkgePUkbUUWj3/BzvYP/uNVDfb6iUtwaGVRh7ObwiKA
         f2lRoJe+ye/1m4tUd6pYq+uKq9vaCU4CqTXneLqUGxnTRocdt0fOUS+sPWjPKZhJwlPY
         Q5VwIlKnbM9poz75zU8fNZFLc2mSXnRMD2+6tkBs6tr5YOQLHtNPN9OmVuuZsSVRhlLI
         84MA==
X-Gm-Message-State: AGi0PuZH6q3mRsDo4tT5w/mRxtWxdG0S7tmXcGRIOhuDPlbJ0IwZJNc4
        kq6VhqM4AJOyUr0lY0DdloZEcg==
X-Google-Smtp-Source: APiQypK1nmzvS2nmLwnRxDmP5lKch6j44kgbOozEUbrgbvCS5biDAMrxAAoKoc/vJFqcrC/GuSVPhQ==
X-Received: by 2002:ac8:4cd1:: with SMTP id l17mr23695608qtv.20.1587512508380;
        Tue, 21 Apr 2020 16:41:48 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id y17sm2664010qky.33.2020.04.21.16.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2020 16:41:48 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     freedreno@lists.freedesktop.org
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/9] drm/msm: add internal MSM_BO_MAP_PRIV flag
Date:   Tue, 21 Apr 2020 19:41:20 -0400
Message-Id: <20200421234127.27965-3-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200421234127.27965-1-jonathan@marek.ca>
References: <20200421234127.27965-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This flag sets IOMMU_PRIV, which is required for some a6xx GMU objects.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/msm_gem.c | 3 +++
 drivers/gpu/drm/msm/msm_gem.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index d8f56a34c117..6277fde13df9 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -428,6 +428,9 @@ static int msm_gem_pin_iova(struct drm_gem_object *obj,
 	if (!(msm_obj->flags & MSM_BO_GPU_READONLY))
 		prot |= IOMMU_WRITE;
 
+	if (msm_obj->flags & MSM_BO_MAP_PRIV)
+		prot |= IOMMU_PRIV;
+
 	WARN_ON(!mutex_is_locked(&msm_obj->lock));
 
 	if (WARN_ON(msm_obj->madv != MSM_MADV_WILLNEED))
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 30584eaf8cc8..972490b14ba5 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -13,6 +13,7 @@
 
 /* Additional internal-use only BO flags: */
 #define MSM_BO_STOLEN        0x10000000    /* try to use stolen/splash memory */
+#define MSM_BO_MAP_PRIV      0x20000000    /* use IOMMU_PRIV when mapping */
 
 struct msm_gem_address_space {
 	const char *name;
-- 
2.26.1

