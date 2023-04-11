Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 524AA6DE0DC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Apr 2023 18:19:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229595AbjDKQTc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Apr 2023 12:19:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230023AbjDKQTS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Apr 2023 12:19:18 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81B1459ED
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 09:19:07 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id z26so11014348lfj.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 09:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681229946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zg2u5cQudfufm2tiNQqtM0BKS2NlQC2p1HPqtvrONfo=;
        b=aO/DfLCbvLl3InM0XhqmTdm87KLkEBZ/lUMnyWl8gXki92fKRivzLJ900Gt89BhcIB
         WB5sNprVSvcyEc8Ge6zC0jr9CDC7byZo614m1AkhiWRcRNwYewqasjJgTckBhZQH93yg
         W1sqXclacOyx2bz8Ts2CbF41xEQ/BaSkskCXmKEnEHXPGtAw1V1ReNlML2XKPZ5elerS
         o0cMHbhSkwIsirC4za7WafZpcgSEdaTUIUXZgk6qr0rWMqGyFXYUG7cTey1WcL4uM/q7
         2v2APmeTotxdGe0dQSSH5PuL9zMi8R3H/SbiiVc7vc5P+DZ+FBdibmenxFf1/Fxt7m7O
         ttHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681229946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zg2u5cQudfufm2tiNQqtM0BKS2NlQC2p1HPqtvrONfo=;
        b=21V6uf/Tr4yTQKiVUFL5scDFfQDRGPf98/We/KioGt4oAjTHOqIRtCTa244qmQqi1C
         B6CwMO+GLRRt48VorFSnPR1I9YIqrXZ+QoRh8vvhRg9mkq0mTesqx9DtjE84ZEew1aYn
         1IPqMSeu/Zur2ka/9TtBo574BESOusMGVreb5VRAXs+UkJDJ7Zr4mtiunLHHMnHC2P7H
         iOfAUo/F/jjYHOPAfycqHMRWQo6tbzbxJ+RmLnEnwaaaX/2lfuukzfPebJVhy7IXMvUQ
         WaGmsr26kW56lDul8GuiMf4D3m8bAFfyEEOm3992xQlFksX9Cs6Mg05iSXfaM3JeEaBP
         CCIg==
X-Gm-Message-State: AAQBX9dP02IGqy6V+K4DocWrdS/za7LOu9soE6UkCc6YafvZLyrfocAx
        ewSxwjJ3pX2I/KdV0rsXptn4zQ==
X-Google-Smtp-Source: AKy350YCKfAeOxIRnegs7LlJ8yQz2YQv/KwMyHgsavnBuSu6PvdZISFQuv8GnHkXMWA7b7FWRZYNiQ==
X-Received: by 2002:ac2:530a:0:b0:4eb:1361:895c with SMTP id c10-20020ac2530a000000b004eb1361895cmr5071091lfh.55.1681229945786;
        Tue, 11 Apr 2023 09:19:05 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id b30-20020a056512025e00b004ec55ac6cd1sm2426467lfo.136.2023.04.11.09.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 09:19:05 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/msm/adreno: change adreno_is_* functions to accept const argument
Date:   Tue, 11 Apr 2023 19:19:03 +0300
Message-Id: <20230411161903.599222-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230411161903.599222-1-dmitry.baryshkov@linaro.org>
References: <20230411161903.599222-1-dmitry.baryshkov@linaro.org>
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

All adreno_is_*() functions do not modify their argument in any way, so
they can be changed to accept const struct adreno_gpu pointer.

Suggested-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 56 ++++++++++++-------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index cf3b7abf201a..9857314295f9 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -152,140 +152,140 @@ static inline bool adreno_is_revn(const struct adreno_gpu *gpu, uint32_t revn)
 	return gpu->revn == revn;
 }
 
-static inline bool adreno_is_a2xx(struct adreno_gpu *gpu)
+static inline bool adreno_is_a2xx(const struct adreno_gpu *gpu)
 {
 	WARN_ON_ONCE(!gpu->revn);
 
 	return (gpu->revn < 300);
 }
 
-static inline bool adreno_is_a20x(struct adreno_gpu *gpu)
+static inline bool adreno_is_a20x(const struct adreno_gpu *gpu)
 {
 	WARN_ON_ONCE(!gpu->revn);
 
 	return (gpu->revn < 210);
 }
 
-static inline bool adreno_is_a225(struct adreno_gpu *gpu)
+static inline bool adreno_is_a225(const struct adreno_gpu *gpu)
 {
 	return adreno_is_revn(gpu, 225);
 }
 
-static inline bool adreno_is_a305(struct adreno_gpu *gpu)
+static inline bool adreno_is_a305(const struct adreno_gpu *gpu)
 {
 	return adreno_is_revn(gpu, 305);
 }
 
-static inline bool adreno_is_a306(struct adreno_gpu *gpu)
+static inline bool adreno_is_a306(const struct adreno_gpu *gpu)
 {
 	/* yes, 307, because a305c is 306 */
 	return adreno_is_revn(gpu, 307);
 }
 
-static inline bool adreno_is_a320(struct adreno_gpu *gpu)
+static inline bool adreno_is_a320(const struct adreno_gpu *gpu)
 {
 	return adreno_is_revn(gpu, 320);
 }
 
-static inline bool adreno_is_a330(struct adreno_gpu *gpu)
+static inline bool adreno_is_a330(const struct adreno_gpu *gpu)
 {
 	return adreno_is_revn(gpu, 330);
 }
 
-static inline bool adreno_is_a330v2(struct adreno_gpu *gpu)
+static inline bool adreno_is_a330v2(const struct adreno_gpu *gpu)
 {
 	return adreno_is_a330(gpu) && (gpu->rev.patchid > 0);
 }
 
-static inline int adreno_is_a405(struct adreno_gpu *gpu)
+static inline int adreno_is_a405(const struct adreno_gpu *gpu)
 {
 	return adreno_is_revn(gpu, 405);
 }
 
-static inline int adreno_is_a420(struct adreno_gpu *gpu)
+static inline int adreno_is_a420(const struct adreno_gpu *gpu)
 {
 	return adreno_is_revn(gpu, 420);
 }
 
-static inline int adreno_is_a430(struct adreno_gpu *gpu)
+static inline int adreno_is_a430(const struct adreno_gpu *gpu)
 {
 	return adreno_is_revn(gpu, 430);
 }
 
-static inline int adreno_is_a506(struct adreno_gpu *gpu)
+static inline int adreno_is_a506(const struct adreno_gpu *gpu)
 {
 	return adreno_is_revn(gpu, 506);
 }
 
-static inline int adreno_is_a508(struct adreno_gpu *gpu)
+static inline int adreno_is_a508(const struct adreno_gpu *gpu)
 {
 	return adreno_is_revn(gpu, 508);
 }
 
-static inline int adreno_is_a509(struct adreno_gpu *gpu)
+static inline int adreno_is_a509(const struct adreno_gpu *gpu)
 {
 	return adreno_is_revn(gpu, 509);
 }
 
-static inline int adreno_is_a510(struct adreno_gpu *gpu)
+static inline int adreno_is_a510(const struct adreno_gpu *gpu)
 {
 	return adreno_is_revn(gpu, 510);
 }
 
-static inline int adreno_is_a512(struct adreno_gpu *gpu)
+static inline int adreno_is_a512(const struct adreno_gpu *gpu)
 {
 	return adreno_is_revn(gpu, 512);
 }
 
-static inline int adreno_is_a530(struct adreno_gpu *gpu)
+static inline int adreno_is_a530(const struct adreno_gpu *gpu)
 {
 	return adreno_is_revn(gpu, 530);
 }
 
-static inline int adreno_is_a540(struct adreno_gpu *gpu)
+static inline int adreno_is_a540(const struct adreno_gpu *gpu)
 {
 	return adreno_is_revn(gpu, 540);
 }
 
-static inline int adreno_is_a618(struct adreno_gpu *gpu)
+static inline int adreno_is_a618(const struct adreno_gpu *gpu)
 {
 	return adreno_is_revn(gpu, 618);
 }
 
-static inline int adreno_is_a619(struct adreno_gpu *gpu)
+static inline int adreno_is_a619(const struct adreno_gpu *gpu)
 {
 	return adreno_is_revn(gpu, 619);
 }
 
-static inline int adreno_is_a630(struct adreno_gpu *gpu)
+static inline int adreno_is_a630(const struct adreno_gpu *gpu)
 {
 	return adreno_is_revn(gpu, 630);
 }
 
-static inline int adreno_is_a640_family(struct adreno_gpu *gpu)
+static inline int adreno_is_a640_family(const struct adreno_gpu *gpu)
 {
 	return adreno_is_revn(gpu, 640) ||
 		adreno_is_revn(gpu, 680);
 }
 
-static inline int adreno_is_a650(struct adreno_gpu *gpu)
+static inline int adreno_is_a650(const struct adreno_gpu *gpu)
 {
 	return adreno_is_revn(gpu, 650);
 }
 
-static inline int adreno_is_7c3(struct adreno_gpu *gpu)
+static inline int adreno_is_7c3(const struct adreno_gpu *gpu)
 {
 	/* The order of args is important here to handle ANY_ID correctly */
 	return adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), gpu->rev);
 }
 
-static inline int adreno_is_a660(struct adreno_gpu *gpu)
+static inline int adreno_is_a660(const struct adreno_gpu *gpu)
 {
 	return adreno_is_revn(gpu, 660);
 }
 
 /* check for a615, a616, a618, a619 or any derivatives */
-static inline int adreno_is_a615_family(struct adreno_gpu *gpu)
+static inline int adreno_is_a615_family(const struct adreno_gpu *gpu)
 {
 	return adreno_is_revn(gpu, 615) ||
 		adreno_is_revn(gpu, 616) ||
@@ -293,13 +293,13 @@ static inline int adreno_is_a615_family(struct adreno_gpu *gpu)
 		adreno_is_revn(gpu, 619);
 }
 
-static inline int adreno_is_a660_family(struct adreno_gpu *gpu)
+static inline int adreno_is_a660_family(const struct adreno_gpu *gpu)
 {
 	return adreno_is_a660(gpu) || adreno_is_7c3(gpu);
 }
 
 /* check for a650, a660, or any derivatives */
-static inline int adreno_is_a650_family(struct adreno_gpu *gpu)
+static inline int adreno_is_a650_family(const struct adreno_gpu *gpu)
 {
 	return adreno_is_revn(gpu, 650) ||
 		adreno_is_revn(gpu, 620) ||
-- 
2.30.2

