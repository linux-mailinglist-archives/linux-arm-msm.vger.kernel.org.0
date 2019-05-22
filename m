Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DABC26932
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2019 19:37:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729161AbfEVRhH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 May 2019 13:37:07 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:39060 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729085AbfEVRhH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 May 2019 13:37:07 -0400
Received: by mail-qt1-f193.google.com with SMTP id y42so3376893qtk.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 May 2019 10:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rfjKyX7zH6WdV+81p3MbZM1b4C1cPYdMHawe6tfVqAs=;
        b=VUhMOA1ELdO2stBmws9mvE7SyaFYOggjY0RgWmAQ6KDJRHFjsOThuqfVd1XAUr91yy
         JohAmFWN88/e3S4AweJBb/XTKZRNl0ObBTwmbTajcUlv06sxUIzX5Q9QZH6EWEyM6Bsj
         GiXK79bczQHpZeh9VeojG6UUWPJQTvTZuBqAhLAB/75k8D1WNeyBI//aRciFBUv1v5eG
         BsZ7DD5Q4beTX041a6b6G5VuE73PapMjm37tIELFnuufhzF1Isuq6VpMqG4DcbtP85Ql
         D0wHVA3lwsnCFBbv0gq2v0dV/aGm4A4FnPIKDXMxAmn9QGyIOSCyoC8JX7olSq78aZtM
         pxjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rfjKyX7zH6WdV+81p3MbZM1b4C1cPYdMHawe6tfVqAs=;
        b=r6ctjF/xp1gQyQiChqqPqHQ2MjHzycKZHZbMmom1ze8RFaPwa1Ljk3tB3Hi/wr9WYz
         yO+/d+tGo/NfHsmaNTaIjT9nOOZHrH8gAfZd15aDxbtzjpAo5jMjnyWB1o9DAeX1qLQD
         NKRvmcuk1AhBT40cRDk7HTTIYnU1FafIlMKFoptphn87KzPJTqEcXM/TYa3ZrMzM5OaF
         s9UsTLxD6WPYRZM45bcvK1umAIUF/EJDmozWPpa7FVMzBdhCpZO8guq18xdzE+m/0ExP
         aA0RD+qLsJQeb5O+eYGEIXF3vxruxrzBuaqjo0MgFHYq74O584lQfVMkMYd8dRrdeT6f
         LxHA==
X-Gm-Message-State: APjAAAVWs94Jx2MrY+o0fGFegyCtTTI37CmwcN2iaIM0CdHfiWweDrk8
        MaMYcmYpVR6BnbcQItcWDMfHjg==
X-Google-Smtp-Source: APXvYqy43UmlIKYjLNdnnXAJzeA14V/9hMBmSX0GlDxsmqTqZ6mvNCzd//FES5K73n/5R618j8mAGQ==
X-Received: by 2002:ac8:38d1:: with SMTP id g17mr6085370qtc.281.1558546626606;
        Wed, 22 May 2019 10:37:06 -0700 (PDT)
Received: from rosewood.cam.corp.google.com ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id w143sm10692969qka.22.2019.05.22.10.37.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 May 2019 10:37:06 -0700 (PDT)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Cc:     Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/5] drm/msm/a6xx: Remove duplicate irq disable from remove
Date:   Wed, 22 May 2019 13:36:41 -0400
Message-Id: <20190522173656.162006-2-sean@poorly.run>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190522173656.162006-1-sean@poorly.run>
References: <20190522173656.162006-1-sean@poorly.run>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

a6xx_gmu_stop() already calls this function via shutdown or force_stop,
so it's not necessary to call it twice. This also knocks the irq depth
count out of sync, so nice to avoid.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index aa84edb25d91..742c8ff9a61c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1239,7 +1239,6 @@ void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
 		dev_pm_domain_detach(gmu->gxpd, false);
 	}
 
-	a6xx_gmu_irq_disable(gmu);
 	a6xx_gmu_memory_free(gmu, gmu->hfi);
 
 	iommu_detach_device(gmu->domain, gmu->dev);
-- 
Sean Paul, Software Engineer, Google / Chromium OS

