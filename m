Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDB51137891
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2020 22:36:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726912AbgAJVgQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jan 2020 16:36:16 -0500
Received: from mail-pg1-f201.google.com ([209.85.215.201]:56688 "EHLO
        mail-pg1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726891AbgAJVgP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jan 2020 16:36:15 -0500
Received: by mail-pg1-f201.google.com with SMTP id a4so1981721pgq.23
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jan 2020 13:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=lklv8FQRp8rzT0qNRNej2/Ey5tQkK5RdPZ9PPNXjJ/o=;
        b=tVwGZYrLHNECzGDBzzpsfHd1j99ze2fBx7zZNOtyFK2nFw6cKUh4LRyrx0Hz6aEnHj
         xjL8M5eiKT9bQ5Svg8gNtSTB7J+J509NP+v5mrcq0KuPW/GxKpcJzMDrDMGzv2fVngew
         KIrgphdjT6oefZw6kPFNWrut2XNbjHeI+h5kmXdl4N8z9UGGhxTmUEWUm3GvWhY6hI9A
         5cOEumsNpnAKH4tPnsHuCbTqBWIN77f3lNkCuLqAiEy1Jcemr/F04p8QldizUhpcs4ji
         b/PdhclpGbYxhLnY0y+jjoHZw0e3Rknli3V6Wi1wWlTmEw8gw/tS0qhSXltohRcpI6CH
         DE1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=lklv8FQRp8rzT0qNRNej2/Ey5tQkK5RdPZ9PPNXjJ/o=;
        b=udr2Nff7J5MDZufwEvUrTuTk8F6uwzDkB6dQF6AgV0mvaJ34iwohYKn+qrg+r+bZpy
         Kdkq3hIYlWKiwXuXyRkh10gjkerlAFPqyN6WUxV8gY4gtdqRJGf5K3QtE+6uDlIHjFPp
         LsWSTtQ998ctbuvIj1vb4KihiKufIJ4SI2S8BfB0MNJyb1AdMlqjTWV1nMqllwpWemh0
         rI7kmq+DZ3Mi0NlXYnWhUvmkfXBxqSlUbia7rWhSUwvr2F7ZTp48ufITA7R5EGmSVi85
         8bUPVk4nwiGvTGeiC8DQ/iC/0d8v4E9vrpi5NXcL69pnEu6FphHDvq6s7m7A/D5GBEC4
         6vOw==
X-Gm-Message-State: APjAAAVFJTojPfTtsBnHdjiWWZWuXDCx79PTE8u87P7qjof13VUCqdRl
        u26NmrEPJVWP4+m8gKkCgkcOP5NIIgS/rQ==
X-Google-Smtp-Source: APXvYqz6h9roepz92B1ZH3Sq2/HDz04zhQSLuowxmrGyRazGZhV9zcZ4LdZ5NtGc06jMSBOCB2z0oD/pajdeYg==
X-Received: by 2002:a63:3d8e:: with SMTP id k136mr6811902pga.4.1578692174830;
 Fri, 10 Jan 2020 13:36:14 -0800 (PST)
Date:   Fri, 10 Jan 2020 13:35:51 -0800
Message-Id: <20200110213551.59826-1-frkoenig@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.0.rc1.283.g88dfdc4193-goog
Subject: [PATCH] drm/msm/dpu: Allow UBWC on NV12
From:   Fritz Koenig <frkoenig@google.com>
To:     robdclark@gmail.com
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Fritz Koenig <frkoenig@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

NV12 is a valid format for UBWC

Signed-off-by: Fritz Koenig <frkoenig@google.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog_format.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog_format.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog_format.h
index fbcb3c4bbfee..3766f0fd0bf0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog_format.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog_format.h
@@ -10,6 +10,8 @@ static const uint32_t qcom_compressed_supported_formats[] = {
 	DRM_FORMAT_XBGR8888,
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_BGR565,
+
+	DRM_FORMAT_NV12,
 };
 
 static const uint32_t plane_formats[] = {
-- 
2.25.0.rc1.283.g88dfdc4193-goog

