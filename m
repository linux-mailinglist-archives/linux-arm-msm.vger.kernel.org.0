Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C1EC12D40D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2019 20:41:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727648AbfL3TlK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Dec 2019 14:41:10 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:32774 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727278AbfL3TlK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Dec 2019 14:41:10 -0500
Received: by mail-wr1-f65.google.com with SMTP id b6so33640781wrq.0;
        Mon, 30 Dec 2019 11:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=dXg8oFzBEXS5AG929jnjM1jsF6o4ohe+Wl9/z4Sa0Kk=;
        b=N3Il+Igx/93EmUIkp4Qn7D4C0qYnr0Zm38eM/RyUnHj3fIu88+MfVRzvu05TtNB1RI
         owSAEZX27S/3Sj7lup7vXTu9Dz6tr899n2q4V0yVA1XcFvP6PR8doKKHN8OMVPnd0A/9
         yqiZg1nBjCA7I1vsVt/EINDdHNUXMdQz03cxDmS7nfsJc2I58cMJM38EminOTwOvxV9T
         kM0yNNarkUhD1T6B0xCVk4Uq6VOVjH30XqIiSw8Ddxhillis6CRNlYSemQ3F8/nr5nKK
         TMn8U9HLeSXsHPc0N73KXCm+ao9zPZrRviqRUQPXO11ky4G6LnJEyKH7SBP4JDipEcDX
         LG7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=dXg8oFzBEXS5AG929jnjM1jsF6o4ohe+Wl9/z4Sa0Kk=;
        b=mT7Ot8sHG9LkMvBUtXtOvV+8Z4pjNR0fwlWl9ijue6SV0iUki1aUDonRb0lNtoEaOp
         Pc9Vx7O6Z/dnMqm5MgcygnEjZDKPknaqjCRCecbU/ALuZl87bB2rLZ4EsdEQUs/j4vPS
         mK1UIyVEGVOQp+TGMBmEdO4cqr646QCa9btNnrxX4FF1/z9LwBdgE0HjIAsDFXfCsK59
         JkcgEl/DaspDlooUYT9GjjuF30TMrRAYrMT2WckZmGe3+P8pMlxMrZr1cRMeL0h6fofm
         zmnUuCxbDjYeUsOB/zfA2+GOQ8I1khoU5Po4Xet7+jiVUgVYp3VghUnUMxJJDyADVU0b
         xvpg==
X-Gm-Message-State: APjAAAVgeLwSR8fsRUF2XnqxjyHN9GSR86ppQG8CUZX07j2z8zAoC/CV
        kFQgmOGYqDRgfK95O/Uv7L0=
X-Google-Smtp-Source: APXvYqyvzye3Ooh54UXS218+xZWxHTIG40U09D7tH9MsS86sPq32CvZylveADRnLKxa3J7IKokgM2Q==
X-Received: by 2002:a5d:4d06:: with SMTP id z6mr67047992wrt.339.1577734868421;
        Mon, 30 Dec 2019 11:41:08 -0800 (PST)
Received: from localhost.localdomain ([197.254.95.38])
        by smtp.googlemail.com with ESMTPSA id p17sm47239785wrx.20.2019.12.30.11.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2019 11:41:07 -0800 (PST)
From:   Wambui Karuga <wambui.karugax@gmail.com>
To:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm: use BUG_ON macro for debugging.
Date:   Mon, 30 Dec 2019 22:41:02 +0300
Message-Id: <20191230194102.2843-1-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As the if statement only checks for the value of the offset_name
variable, it can be replaced by the more conscise BUG_ON macro for error
reporting.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index c7441fb8313e..0fe7907f5a7d 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -315,10 +315,7 @@ OUT_PKT7(struct msm_ringbuffer *ring, uint8_t opcode, uint16_t cnt)
 static inline bool adreno_reg_check(struct adreno_gpu *gpu,
 		enum adreno_regs offset_name)
 {
-	if (offset_name >= REG_ADRENO_REGISTER_MAX ||
-			!gpu->reg_offsets[offset_name]) {
-		BUG();
-	}
+	BUG_ON(offset_name >= REG_ADRENO_REGISTER_MAX || !gpu->reg_offsets[offset_name]);
 
 	/*
 	 * REG_SKIP is a special value that tell us that the register in
-- 
2.17.1

