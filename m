Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73C5F743F9D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jun 2023 18:21:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230506AbjF3QU7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Jun 2023 12:20:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233014AbjF3QUs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Jun 2023 12:20:48 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19FAF3ABC
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jun 2023 09:20:47 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1b8171718a1so15336895ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jun 2023 09:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688142046; x=1690734046;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MvQqSOwld0u4zK5BJ70Rav7WOEh2jpi5bzncu8VS9ac=;
        b=n0ntrjNOW5eEsntD99X/VD7B/V72JXV/DfIACX12iLR5if6dNtjiz3sq0kknAISiQ3
         fLSV94JrDhizxh5K+HqK3IOL1tZq+1fcVVkxWShI4QddBHkEwE77wCLP+T5gCvL28g12
         ZZGw/Oj1i6gPRUuy90uIRn9c/kHF49yl+fGJQ46393bJt29QBWLREKsAhM8eqxCHBQRe
         /E3/+B2AzLFrUCvTL/Rf+YcCqhAl4YAekp7Y0fos3f0ODUmAB0P4aac++0e581sU8Qgj
         aHFluOqWzrBcUnyiVOF2OXNMNIqM8WWGIldoQdZEOHqBQ7aRaWJM2sg9FhBFSFnG+VXv
         gVUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688142046; x=1690734046;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MvQqSOwld0u4zK5BJ70Rav7WOEh2jpi5bzncu8VS9ac=;
        b=Kc19vJDroYUMF5hP8sfu/3dr/iYK+W0k46zZTlcie53D1vs8xcsviRFf6qZB3wdZJ8
         uWWPkU9tR8BKuo4lnsm6X78Nh0v1uZG+ll1km63OhqKeSiiA8RH0+hnKlMboG1w7YTTv
         VCyuPt/JcSZD027mAJjTQadJeLZS+cjC8+tnm2LFQnbYmSShrIg2QRjSlqmHqjCasPeZ
         kuHfin4EywFan5UX5hXZHw8m94kpcS1Uan7W5up1/ndnMUxdQ30qDj7sx/lSHoanzV8v
         SZonOXEjsapq1ou/sbiOGLCmuPKgIK3r3dMkEklx68ca9hOh7U8EVd7z6l//bysjamzS
         o04Q==
X-Gm-Message-State: ABy/qLY0fJA9tATdO5a6BeaDE++2fP/hONmfxyA1djrnXYZi2c0UZZ3K
        EcjTLbuT9Go3gRXxhRBsVDM=
X-Google-Smtp-Source: APBJJlFDvWDDFvnv0o5w7ozeVYf0kMQ00E73cWaaTcRb9xv5AvdkmVcIp8x2f0vsnut9Evl5WNX0OQ==
X-Received: by 2002:a17:902:d48c:b0:1b7:e49f:d with SMTP id c12-20020a170902d48c00b001b7e49f000dmr2881877plg.28.1688142046512;
        Fri, 30 Jun 2023 09:20:46 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
        by smtp.gmail.com with ESMTPSA id j4-20020a170902c08400b001b7fd4de08bsm9192350pld.129.2023.06.30.09.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 09:20:45 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>
Subject: [PATCH] drm/msm/a6xx: Fix misleading comment
Date:   Fri, 30 Jun 2023 09:20:43 -0700
Message-ID: <20230630162043.79198-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

The range is actually len+1.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index eea2e60ce3b7..edf76a4b16bd 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -39,8 +39,8 @@ struct a6xx_gpu {
 
 /*
  * Given a register and a count, return a value to program into
- * REG_CP_PROTECT_REG(n) - this will block both reads and writes for _len
- * registers starting at _reg.
+ * REG_CP_PROTECT_REG(n) - this will block both reads and writes for
+ * _len + 1 registers starting at _reg.
  */
 #define A6XX_PROTECT_NORDWR(_reg, _len) \
 	((1 << 31) | \
-- 
2.41.0

