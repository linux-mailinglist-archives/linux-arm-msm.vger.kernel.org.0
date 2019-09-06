Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 516C1AC06B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2019 21:24:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389898AbfIFTX4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Sep 2019 15:23:56 -0400
Received: from mail-io1-f43.google.com ([209.85.166.43]:39374 "EHLO
        mail-io1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731943AbfIFTXz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Sep 2019 15:23:55 -0400
Received: by mail-io1-f43.google.com with SMTP id d25so15247622iob.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Sep 2019 12:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W2yelZaQQgNOeM3tNL1ucPE8YNMsnU8lMoKbAm8AChY=;
        b=B3VuUrCPXYpqko0QYumGcNMUcl2LhhNpt8HxgSsn0nP4Qj3gxIGutfehwIrE/9CNMq
         Y/x74jvwoJ5LfLkSBRpe9Ody0Qe/J7PVA5YgG84CwXB6883006LkjTHM/BKvJ5Ghkbp8
         cqFcByfJzSDo8FoE6q4ujiKJd2RwGPWB9kUNM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W2yelZaQQgNOeM3tNL1ucPE8YNMsnU8lMoKbAm8AChY=;
        b=doxnHZLNxCY0vxZMH57WkTT5Uu6VlYhFT1FumIl9xXQ64qikeEB7NHV5LEqgdl1Y+M
         NCnpb+2aAMjP5UT4YqegU3tJR7OukTW8k/m45/pF/A2jAYR7yoqYkiYc7qlOTl0zIoHf
         j3qV2Chu5nBbsojaDHRTCUX3iS/5m2xZ8ckE8zs1U9AMcgn4Nnxm97DnYwfYkUp7hHdp
         Tmnlmz4a8i1MKUf3eRtkV7vlGPU/BmV5wRtZsBq5KP45zULsdz7yYEfNQ/zKc1OKm72P
         DnzXO42Lmh93Uf+D03gy6qi525oSkJNVeZSIlsOLQoodVlFGtRRWFQUEoctUAG8uEybF
         vA9g==
X-Gm-Message-State: APjAAAWZH+77kC6StlJih6w1jVSQtb3rIBzn2I9md7ZtT7Ei3S0UpZ2B
        hQ/qJSOHdY3uwUJbXgHr0i0ZSw==
X-Google-Smtp-Source: APXvYqyY9z+bVXK367r0PSgo655xMFstBXHta7tC6uhSnr685D0+632U3Kq50X7yvcGVAdjr9dTt6w==
X-Received: by 2002:a02:b882:: with SMTP id p2mr11801092jam.16.1567797834689;
        Fri, 06 Sep 2019 12:23:54 -0700 (PDT)
Received: from ddavenport4.bld.corp.google.com ([2620:15c:183:0:92f:a80a:519d:f777])
        by smtp.gmail.com with ESMTPSA id h70sm10931804iof.48.2019.09.06.12.23.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 06 Sep 2019 12:23:54 -0700 (PDT)
From:   Drew Davenport <ddavenport@chromium.org>
To:     dri-devel@lists.freedesktop.org
Cc:     Drew Davenport <ddavenport@chromium.org>,
        David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
        Bruce Wang <bzwang@chromium.org>,
        linux-arm-msm@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 2/6] drm/msm/dpu: Remove unused macro
Date:   Fri,  6 Sep 2019 13:23:40 -0600
Message-Id: <20190906192344.223694-2-ddavenport@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190906192344.223694-1-ddavenport@chromium.org>
References: <20190906192344.223694-1-ddavenport@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Signed-off-by: Drew Davenport <ddavenport@chromium.org>
---

 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index 4c889aabdaf9..6ceba33a179e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -139,10 +139,6 @@ struct vsync_info {
 
 #define to_dpu_kms(x) container_of(x, struct dpu_kms, base)
 
-/* get struct msm_kms * from drm_device * */
-#define ddev_to_msm_kms(D) ((D) && (D)->dev_private ? \
-		((struct msm_drm_private *)((D)->dev_private))->kms : NULL)
-
 /**
  * Debugfs functions - extra helper functions for debugfs support
  *
-- 
2.20.1

