Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1319C21E347
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2020 00:55:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbgGMWzV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jul 2020 18:55:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726775AbgGMWzQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jul 2020 18:55:16 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F6F9C08C5DB
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2020 15:55:16 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id k18so11391736qtm.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2020 15:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GsatskZeu6cROzCdokNou7WazNDARulkKT+Df6GvP/E=;
        b=he9usAeaaAWYBNYbwqBs57KtvsMI8J2WQf55xuXlU8oSJyWCF2IdPgt/yKkmTsfzjO
         yTCyDKME1sqmwOx7tmm+X629+8z+0VkZlU06Ltb1qrh+15GJcr+5EoBEpoW/9Qei6E/8
         I04ExgRm46UjR3xyYnaBur78tmPWJi+3sdNJx4jUWKfOiwsAP/+ffAxGR7VgD/GfhKlv
         OAaZ0Iz57cKe8j1NvKOfV6YF57tPi+UKa/wgrI391aASyfypLXF3TaPgXyny7k71dPcr
         LEHOC97z4rbnZCu67PQmeC5vLTIqgdWyBlAi0wsa9EN283JNABDYmimPPaQVRcZmqxlK
         XMXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GsatskZeu6cROzCdokNou7WazNDARulkKT+Df6GvP/E=;
        b=fJhougxGdPR/crAAjUBonKuke+AqXer9SbzrwMAulR1+V7JP9AE6gQMcoSnaDTb0vG
         mZWt+cQotSpaOiqUfOvxF0k32rwde7wdMd2ggBI4dBfrRxq3EpKtWsc4MJRAzFl2OWoh
         JtbzxDnkqbRRkhQLo9Tc/1wBSJn9IhkX1BZC2zAQDjKFBmp45OPCIer1g2q2XCIheCRk
         FZ3TS29FFHdaQq6QEvBbrABGZmXw6U8epajHKJua8q5QCFExQcmtpggL6T6vt+Xr8SUE
         RkLbODtqVt+RgIjzlMlUcDOFGd413MaVJkMa/6T/sZgw+3AJK7hLGG3KhEB8KNGGhqML
         V+iA==
X-Gm-Message-State: AOAM532TbcECj1tB+65HyV7yok0yOKlYsWk3FjsptAIFg6uMvSSR3YNB
        Ovm2RVQMNjf8icnhiHA62/XbMw==
X-Google-Smtp-Source: ABdhPJwEhNUhM0Sdref5tidyi4ZWkR4rO2FHbelarbgx64sfy4MEmxKm6XdqIsIIguOYsf0aC+fozQ==
X-Received: by 2002:ac8:311d:: with SMTP id g29mr1789673qtb.54.1594680915659;
        Mon, 13 Jul 2020 15:55:15 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id f54sm22405752qte.76.2020.07.13.15.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 15:55:15 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     freedreno@lists.freedesktop.org
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 2/3] drm/msm: reset devfreq freq_table/max_state before devfreq_add_device
Date:   Mon, 13 Jul 2020 18:53:41 -0400
Message-Id: <20200713225345.20556-3-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200713225345.20556-1-jonathan@marek.ca>
References: <20200713225345.20556-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

These never get set back to 0 when probing fails, so an attempt to probe
again results in broken behavior. Fix the problem by setting thse to zero
before they are used.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/msm_gpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index a22d30622306..aa9775ab52f0 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -93,7 +93,11 @@ static void msm_devfreq_init(struct msm_gpu *gpu)
 	/*
 	 * Don't set the freq_table or max_state and let devfreq build the table
 	 * from OPP
+	 * After a deferred probe, these may have be left to non-zero values,
+	 * so set them back to zero before creating the devfreq device
 	 */
+	msm_devfreq_profile.freq_table = NULL;
+	msm_devfreq_profile.max_state = 0;
 
 	gpu->devfreq.devfreq = devm_devfreq_add_device(&gpu->pdev->dev,
 			&msm_devfreq_profile, DEVFREQ_GOV_SIMPLE_ONDEMAND,
-- 
2.26.1

