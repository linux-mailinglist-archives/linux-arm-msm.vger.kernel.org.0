Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECB9C6F2692
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Apr 2023 23:23:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229986AbjD2VXo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Apr 2023 17:23:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230175AbjD2VXn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Apr 2023 17:23:43 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BDE819AF
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Apr 2023 14:23:42 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4efe8991bafso1581505e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Apr 2023 14:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682803420; x=1685395420;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tRKsVvk9tsJuHHhH22B0kCzbXLoRUllEwKzzJXuNCMI=;
        b=byt4wPpMEGAA8Dt7nVqRCKYJXdzYj1cwQtttNycFhFCDKplaRUKDT3rXLjV9tQYp0L
         X5nCzeHwuukjtvGOPZmpTuj4FIF/iUWQrsR1j7t+UfPpMYDU4yRjrmvlQsMvvQ5HEmch
         bf1hR9Dlrh6TAY9HV/oTmxqBbsbPbc7gATf5Gb78u0tqCz0uf5fBAZyjSkToPMQBI11C
         +DZOv9V74DPWgBH3fyhJksmKLiCKIhhZfTPF3bTQ3jF3ufAonf/Uv4iKm5jzS/ZQJhYk
         C4wSj5iPlKV9JXEX708ftTUFKVRO1P/L4Q/TZIocel2XQRvLQgLTZHqRUoQ1SuFDFhWn
         Cyxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682803420; x=1685395420;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tRKsVvk9tsJuHHhH22B0kCzbXLoRUllEwKzzJXuNCMI=;
        b=FAlB8Pd8Axus+715WA5NFARTgOlZacS0YhvCcOVzCcQv8Pyc2Zd8ORds4ZCqYnJaJS
         Jbj8evXBqA4m/z/c1LfpdcY/GLghF7LToDFKfiKgAy5vOXvxrE8yFtiwBbXFShgl1kW2
         lJWZOC6OZQ6rZTbcW+G1Yn8sMUMJVFNpue+dKi+puhDMVHQN/wobHvH5AnXHNBR/8E2R
         hCvp3P9QZdZs7SNuUou/rRSwnBTccUrRPQP2zIQmeseIR1L0PZafNIQWZiZF8srSoL4j
         f2bckZ/b8Kq/0vPWKiiw/p8+WPgEMfpsAt+DSUyzTwXZw3ZdujjYLw/Kvg+tuxqQyo8x
         E23w==
X-Gm-Message-State: AC+VfDwq/0D1bRzo5/BAJM2Km45xOTS6hdrkBQIp3aFEf0KEL6vI5PLp
        fyBZmRfrw7wTxhjX1qwPq0rDoA==
X-Google-Smtp-Source: ACHHUZ7Msh7f4Mgk5NvG0YHBHg+Q9Xxp5OtPnng03DDm4cpMYmguHpquR7dfwtxbixewGj1wG6cr7Q==
X-Received: by 2002:ac2:5982:0:b0:4ed:c6d5:bdc with SMTP id w2-20020ac25982000000b004edc6d50bdcmr2331712lfn.24.1682803420216;
        Sat, 29 Apr 2023 14:23:40 -0700 (PDT)
Received: from eriador.lan (78-27-120-86.bb.dnainternet.fi. [78.27.120.86])
        by smtp.gmail.com with ESMTPSA id c11-20020a19760b000000b004efb18c89a4sm3599663lff.21.2023.04.29.14.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Apr 2023 14:23:39 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2] drm/msm/dpu: drop unused SSPP sub-block information
Date:   Sun, 30 Apr 2023 00:23:39 +0300
Message-Id: <20230429212339.2946832-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The driver  doesn't support hsic/memcolor, pcc and igc SSPP subblocks.
Drop corresponding definitions.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes since v1:
 - Rebased on top of https://patchwork.freedesktop.org/patch/534725/?series=117130&rev=1

---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 69d1f1e59db1..b2831b45ac64 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -380,9 +380,6 @@ struct dpu_caps {
  * @qseed_ver: qseed version
  * @scaler_blk:
  * @csc_blk:
- * @hsic:
- * @memcolor:
- * @pcc_blk:
  * @format_list: Pointer to list of supported formats
  * @num_formats: Number of supported formats
  * @virt_format_list: Pointer to list of supported formats for virtual planes
@@ -399,9 +396,6 @@ struct dpu_sspp_sub_blks {
 	u32 qseed_ver;
 	struct dpu_scaler_blk scaler_blk;
 	struct dpu_pp_blk csc_blk;
-	struct dpu_pp_blk hsic_blk;
-	struct dpu_pp_blk memcolor_blk;
-	struct dpu_pp_blk pcc_blk;
 
 	const u32 *format_list;
 	u32 num_formats;
-- 
2.39.2

