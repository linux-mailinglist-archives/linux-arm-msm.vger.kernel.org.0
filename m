Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFA2C2E6BAE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 00:14:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729377AbgL1Wzv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Dec 2020 17:55:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729528AbgL1Vdf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Dec 2020 16:33:35 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C97CBC06179A;
        Mon, 28 Dec 2020 13:32:43 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id b9so15904723ejy.0;
        Mon, 28 Dec 2020 13:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I2WBbrkH2ONKXlEDHonkPj8AaAP1q8vzoVqaiWZLsUg=;
        b=veLKfrSGWbd3LTDOY5lt4PaP9PCYEgPTlIz7EUcvX42ydY/0lOFux5IcfuXUUiCf3d
         CQmpJn8IWQb5uhTloPCLp1XDkrdLUGCLWAVrS3UcoJy+B4HJ+DIoEyc8jz3eToiojC8u
         xE7Tavg902Qm9pudVd65nwEOfozvvnK1gDo0qxWZM/3lWZI9erklKix71m8qWH3yuDGW
         UNbJVaqORU1hMGPcKOq7Rzmcnn58RNzzTx9GxnCAV3vmylUTTVFSZFmVNs4gtS0R3QNb
         NKOK+806eu/RExhwim19mLzDir/YB7c/mGy+/CCImBwkFIbm1j9+azL0qusKQrbPlNIn
         FB+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I2WBbrkH2ONKXlEDHonkPj8AaAP1q8vzoVqaiWZLsUg=;
        b=a4PR3Pw02QlV4fxTHX0bk+48ryI3KHxOFwExgduA4q/59kRgPM46ff2j28aI1GVxjx
         G5pvwJSKk9bESlG3WjjJyqyHm0kEInzXT6dRM2yHvZkpDyvE9RvpnSFtYJSxYA9eadhp
         u9c6T4wEdHhe0adsSuei4zqrJrF/sWntVJz8Q+2wER0fDZfyLj7h9irp+u3j/owVkmdG
         Gvt+oIsqJAI8k5BtTeSZEHJS/i3WE+/2P4pqRnGe509naAr7L0jUhGRklNqRCPEuqDs+
         CaftUZHAdQz09YjWHlllQtwDDppGaky7t692Y5H7rEEF5QxASuArO/QvX+O+rw+9rr4f
         4AhA==
X-Gm-Message-State: AOAM531V0qBBY4D6xjMxhXH4YUQiXC3xzAn7F0XleeWnvIAm+ExnMstm
        ABR6LTmLHPCaJsXFqCP0YPE=
X-Google-Smtp-Source: ABdhPJxt3v098h+osXmQY1LyoTMKKWPimAzb7g00fZLrEQdCMwrw5lSl3gm4oc39Np0J8+Q2c8SyGw==
X-Received: by 2002:a17:906:e94c:: with SMTP id jw12mr44293726ejb.56.1609191162587;
        Mon, 28 Dec 2020 13:32:42 -0800 (PST)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id dg10sm14625072edb.63.2020.12.28.13.32.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Dec 2020 13:32:42 -0800 (PST)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH 2/2] drm/msm: Ensure get_pages is called when locked
Date:   Mon, 28 Dec 2020 23:31:31 +0200
Message-Id: <20201228213131.2316293-2-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201228213131.2316293-1-iskren.chernev@gmail.com>
References: <20201228213131.2316293-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

get_pages is only called in a locked context. Add a WARN_ON to make sure
it stays that way.

Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index c658deb31eb5d..9d10739c4eb2d 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -96,6 +96,8 @@ static struct page **get_pages(struct drm_gem_object *obj)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
+	WARN_ON(!msm_gem_is_locked(obj));
+
 	if (!msm_obj->pages) {
 		struct drm_device *dev = obj->dev;
 		struct page **p;
@@ -1129,8 +1131,9 @@ static struct drm_gem_object *_msm_gem_new(struct drm_device *dev,
 
 		to_msm_bo(obj)->vram_node = &vma->node;
 
-
+		msm_gem_lock(obj);
 		pages = get_pages(obj);
+		msm_gem_unlock(obj);
 		if (IS_ERR(pages)) {
 			ret = PTR_ERR(pages);
 			goto fail;
-- 
2.29.2

