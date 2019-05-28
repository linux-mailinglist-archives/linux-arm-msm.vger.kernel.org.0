Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4A982CE94
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2019 20:27:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727975AbfE1S07 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 May 2019 14:26:59 -0400
Received: from mail-yw1-f66.google.com ([209.85.161.66]:41850 "EHLO
        mail-yw1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727688AbfE1S07 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 May 2019 14:26:59 -0400
Received: by mail-yw1-f66.google.com with SMTP id t140so5644966ywe.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2019 11:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7yQwjOt7RMrp1ZBk1OxLjkgfAWLV7jytWzkNhOC/gSo=;
        b=MgIkNC6iYi6IaMypw2y0pB+JJFA7DuzlPTLK6XWFNg0cyQ3XitlHichVLmjm2VvW26
         1X9tsHoz+96lwpx8YhVv+xUuNPCGaGq4mFgdgwwAW4/G9Vd0Ma+RNmZZOMUuidPwVFpp
         eDRKoy+rhPuEwr/TpulzUEmq1AWZvSt8leutcH/Tfhet984feZ6CybJf1TTjqQE6lcCN
         WQqnpd8zXcwgKdbAU43qLdVvl3+aBv2GlPTS4q8bbFk44kOx2NgHQd8kDzh8TNHn59cx
         1mKGNDlE64VrYkYmnTFeOZxpzky2Og9XSMRvp8rAFbq64N6jMmI3Y2OkX7B6PfkmdDeT
         TKQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7yQwjOt7RMrp1ZBk1OxLjkgfAWLV7jytWzkNhOC/gSo=;
        b=uQmRisV41DLurITjl2eV3dKJtNbvKa+de8xP9x4l9jr8yMCZUwgkvuBBX2DEi/PJV5
         Kp/8yyjMHbLX8zdzwIUnGIZKbyx/hw7LStBTIhnL08ZDgOYX/xhK4T/xhvLAzE+LHWx8
         UMqVTmpXpNE9NrsgBNrpA93ByovC0y+pjtYP/ccDkJbe1ylPPcRviwKzW9GRZ9lguH5j
         mGMJBmdCdsGKe2gA8RffwRmHS6/IaK+YjKJaFTjE1zzuLGVYsUYMNtHpQqP0lWI6qLEG
         pEjFYOumWrkkwHudkeBMquLPtMQ9zVDsv7JV3dbPnFB2HU5qq0qJ7EX1VLR5O/2wo5i0
         sQaA==
X-Gm-Message-State: APjAAAVFNBAQ4I2bsB+jw52Q5NuvjDZyzPU/ZDyUV1asHHFzyV/SBi56
        6u0NeeaQhTlvLD2vBTqAU9sZUw==
X-Google-Smtp-Source: APXvYqwkVpRRs8Qgo+zPcrAGSyRwpY4dtidnfGumjxN0qS9GnudEVQSJTf+UCPIbxqw9EoC8hLy70w==
X-Received: by 2002:a81:4c46:: with SMTP id z67mr28249618ywa.267.1559068018920;
        Tue, 28 May 2019 11:26:58 -0700 (PDT)
Received: from rosewood.cam.corp.google.com ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id k205sm3703061ywc.69.2019.05.28.11.26.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 11:26:58 -0700 (PDT)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Cc:     Sean Paul <seanpaul@chromium.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH] drm/msm/dpu: Remove bogus comment
Date:   Tue, 28 May 2019 14:26:45 -0400
Message-Id: <20190528182657.246714-1-sean@poorly.run>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
In-Reply-To: <20190528154125.GA23227@jcrouse1-lnx.qualcomm.com>
References: <20190528154125.GA23227@jcrouse1-lnx.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

This comment doesn't make any sense, remove it.

Suggested-by: Jordan Crouse <jcrouse@codeaurora.org>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 885bf88afa3e..50d0e9ba5d2f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -243,7 +243,6 @@ static int _dpu_debugfs_init(struct dpu_kms *dpu_kms)
 	if (IS_ERR_OR_NULL(entry))
 		return -ENODEV;
 
-	/* allow root to be NULL */
 	debugfs_create_x32(DPU_DEBUGFS_HWMASKNAME, 0600, entry, p);
 
 	dpu_debugfs_danger_init(dpu_kms, entry);
-- 
Sean Paul, Software Engineer, Google / Chromium OS

