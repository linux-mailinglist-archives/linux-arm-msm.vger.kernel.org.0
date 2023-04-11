Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 073B86DE0DB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Apr 2023 18:19:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229680AbjDKQTb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Apr 2023 12:19:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229980AbjDKQTR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Apr 2023 12:19:17 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D76CF4C3C
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 09:19:06 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id e3so305376ljn.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 09:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681229945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SQ0nnIUZB3Cbnx6sjo9wsNQeyY87G+6/+YzgD8Yp9zM=;
        b=BDEnvk8DmdSwRYIM7GfN8TVVqGUxX/fquHdggQ2Ko5J4eL6eCiGQ/zpw2k26QHgt4y
         tZqH9q5Z1omOI1xXJmD3fzYeso4GF8CF+fUqas1f6CBW3MujlxKu79U4Nvsy2PINyNq6
         HkXMvEHyefMuj1bIWzebgDgnJuafo+/8vE+BgpcaTYCsOq0nI8/6qU46XK+klA5CnKu2
         Fu/PjymvyZR+bla0GNqv7ZQe5M+2wM8Z7tlklopN2Y2wBA70is1udA0G+87yc56TGkKH
         x7UHcHVmH8ZMe2gQBEbZdaHhf0PgD8wU4lF+ZBp3zOBqzo5lklbQH55e7nCmLU0tpylw
         pR3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681229945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SQ0nnIUZB3Cbnx6sjo9wsNQeyY87G+6/+YzgD8Yp9zM=;
        b=5+adWiI8rIbo7lJg7bdzPZKf/CO9D6aA9uw7NQghGbMwHmlaFEbbC6Bmy5GajEYN51
         e3dQ5VeZAzXTfARr5AwUDhTJ8C+l4DeHhUW/Bvmofx7+KcFsArH8XB9cE6gAZgYEQGo9
         ZQESaQeHSE30NRtnwihfS1gItjIaswkR/5lpzZhNV9MGQnDxfffBlBpC/z6DV1HnvtrG
         SNTiWICPNqMcurOXChDqzdJNAie/Y/wHwjpN2n/OOClOkM3XVMc59sXReb4AXg8qdnBt
         Uqf5xjWf6m5VVH/gyGVxgXWYJ3Ta+XA1wBm6EQkTS0O4M4etFS083Pi+bQg4gnKVSImO
         H+QA==
X-Gm-Message-State: AAQBX9dqO+IvLWWu2Ww38uftXGtLeIEiILei5GdGRxsIFfpxayoIEyUV
        mkBZy/5e1YZWMWITqBNRXRox0A==
X-Google-Smtp-Source: AKy350bXrKqT6UAOGad6zcjrrZgvbOfs3wujtxygNjNYNPs1ezzYqcTbUD02sFBLtETY5oIZjYO2Og==
X-Received: by 2002:a2e:b0d9:0:b0:29b:d29d:c781 with SMTP id g25-20020a2eb0d9000000b0029bd29dc781mr4712023ljl.19.1681229945086;
        Tue, 11 Apr 2023 09:19:05 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id b30-20020a056512025e00b004ec55ac6cd1sm2426467lfo.136.2023.04.11.09.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 09:19:04 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm/msm/adreno: warn if chip revn is verified before being set
Date:   Tue, 11 Apr 2023 19:19:02 +0300
Message-Id: <20230411161903.599222-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The commit 010c8bbad2cb ("drm: msm: adreno: Disable preemption on Adreno
510") tried to check GPU's revn before revn being set. Add WARN_ON_ONCE
to prevent such bugs from happening again. A separate helper is
necessary so that the warning is displayed really just once instead of
being displayed for each of comparisons.

Suggested-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes since v1:
 - Renamed to adreno_is_revn() (Stephen)
 - Changed it to accept const gpu pointer (Stephen)

---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 63 ++++++++++++++++---------
 1 file changed, 40 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index f62612a5c70f..cf3b7abf201a 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -145,40 +145,51 @@ struct adreno_platform_config {
 
 bool adreno_cmp_rev(struct adreno_rev rev1, struct adreno_rev rev2);
 
+static inline bool adreno_is_revn(const struct adreno_gpu *gpu, uint32_t revn)
+{
+	WARN_ON_ONCE(!gpu->revn);
+
+	return gpu->revn == revn;
+}
+
 static inline bool adreno_is_a2xx(struct adreno_gpu *gpu)
 {
+	WARN_ON_ONCE(!gpu->revn);
+
 	return (gpu->revn < 300);
 }
 
 static inline bool adreno_is_a20x(struct adreno_gpu *gpu)
 {
+	WARN_ON_ONCE(!gpu->revn);
+
 	return (gpu->revn < 210);
 }
 
 static inline bool adreno_is_a225(struct adreno_gpu *gpu)
 {
-	return gpu->revn == 225;
+	return adreno_is_revn(gpu, 225);
 }
 
 static inline bool adreno_is_a305(struct adreno_gpu *gpu)
 {
-	return gpu->revn == 305;
+	return adreno_is_revn(gpu, 305);
 }
 
 static inline bool adreno_is_a306(struct adreno_gpu *gpu)
 {
 	/* yes, 307, because a305c is 306 */
-	return gpu->revn == 307;
+	return adreno_is_revn(gpu, 307);
 }
 
 static inline bool adreno_is_a320(struct adreno_gpu *gpu)
 {
-	return gpu->revn == 320;
+	return adreno_is_revn(gpu, 320);
 }
 
 static inline bool adreno_is_a330(struct adreno_gpu *gpu)
 {
-	return gpu->revn == 330;
+	return adreno_is_revn(gpu, 330);
 }
 
 static inline bool adreno_is_a330v2(struct adreno_gpu *gpu)
@@ -188,77 +199,78 @@ static inline bool adreno_is_a330v2(struct adreno_gpu *gpu)
 
 static inline int adreno_is_a405(struct adreno_gpu *gpu)
 {
-	return gpu->revn == 405;
+	return adreno_is_revn(gpu, 405);
 }
 
 static inline int adreno_is_a420(struct adreno_gpu *gpu)
 {
-	return gpu->revn == 420;
+	return adreno_is_revn(gpu, 420);
 }
 
 static inline int adreno_is_a430(struct adreno_gpu *gpu)
 {
-	return gpu->revn == 430;
+	return adreno_is_revn(gpu, 430);
 }
 
 static inline int adreno_is_a506(struct adreno_gpu *gpu)
 {
-	return gpu->revn == 506;
+	return adreno_is_revn(gpu, 506);
 }
 
 static inline int adreno_is_a508(struct adreno_gpu *gpu)
 {
-	return gpu->revn == 508;
+	return adreno_is_revn(gpu, 508);
 }
 
 static inline int adreno_is_a509(struct adreno_gpu *gpu)
 {
-	return gpu->revn == 509;
+	return adreno_is_revn(gpu, 509);
 }
 
 static inline int adreno_is_a510(struct adreno_gpu *gpu)
 {
-	return gpu->revn == 510;
+	return adreno_is_revn(gpu, 510);
 }
 
 static inline int adreno_is_a512(struct adreno_gpu *gpu)
 {
-	return gpu->revn == 512;
+	return adreno_is_revn(gpu, 512);
 }
 
 static inline int adreno_is_a530(struct adreno_gpu *gpu)
 {
-	return gpu->revn == 530;
+	return adreno_is_revn(gpu, 530);
 }
 
 static inline int adreno_is_a540(struct adreno_gpu *gpu)
 {
-	return gpu->revn == 540;
+	return adreno_is_revn(gpu, 540);
 }
 
 static inline int adreno_is_a618(struct adreno_gpu *gpu)
 {
-	return gpu->revn == 618;
+	return adreno_is_revn(gpu, 618);
 }
 
 static inline int adreno_is_a619(struct adreno_gpu *gpu)
 {
-	return gpu->revn == 619;
+	return adreno_is_revn(gpu, 619);
 }
 
 static inline int adreno_is_a630(struct adreno_gpu *gpu)
 {
-	return gpu->revn == 630;
+	return adreno_is_revn(gpu, 630);
 }
 
 static inline int adreno_is_a640_family(struct adreno_gpu *gpu)
 {
-	return (gpu->revn == 640) || (gpu->revn == 680);
+	return adreno_is_revn(gpu, 640) ||
+		adreno_is_revn(gpu, 680);
 }
 
 static inline int adreno_is_a650(struct adreno_gpu *gpu)
 {
-	return gpu->revn == 650;
+	return adreno_is_revn(gpu, 650);
 }
 
 static inline int adreno_is_7c3(struct adreno_gpu *gpu)
@@ -269,13 +281,16 @@ static inline int adreno_is_7c3(struct adreno_gpu *gpu)
 
 static inline int adreno_is_a660(struct adreno_gpu *gpu)
 {
-	return gpu->revn == 660;
+	return adreno_is_revn(gpu, 660);
 }
 
 /* check for a615, a616, a618, a619 or any derivatives */
 static inline int adreno_is_a615_family(struct adreno_gpu *gpu)
 {
-	return gpu->revn == 615 || gpu->revn == 616 || gpu->revn == 618 || gpu->revn == 619;
+	return adreno_is_revn(gpu, 615) ||
+		adreno_is_revn(gpu, 616) ||
+		adreno_is_revn(gpu, 618) ||
+		adreno_is_revn(gpu, 619);
 }
 
 static inline int adreno_is_a660_family(struct adreno_gpu *gpu)
@@ -286,7 +301,9 @@ static inline int adreno_is_a660_family(struct adreno_gpu *gpu)
 /* check for a650, a660, or any derivatives */
 static inline int adreno_is_a650_family(struct adreno_gpu *gpu)
 {
-	return gpu->revn == 650 || gpu->revn == 620 || adreno_is_a660_family(gpu);
+	return adreno_is_revn(gpu, 650) ||
+		adreno_is_revn(gpu, 620) ||
+		adreno_is_a660_family(gpu);
 }
 
 u64 adreno_private_address_space_size(struct msm_gpu *gpu);
-- 
2.30.2

