Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7AF207AB79D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Sep 2023 19:33:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233137AbjIVRdP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Sep 2023 13:33:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233135AbjIVRcn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Sep 2023 13:32:43 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A39FE10D4
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Sep 2023 10:32:22 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1c5bf7871dcso21269835ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Sep 2023 10:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695403942; x=1696008742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q96X+e6e2GphA8WEKNidppfkY54O3UO5SgYggFHsXis=;
        b=NPXZjHvy8DIF9H/py75WTffi2Hgh5VL59J+34EDw/TkjIkHlVAo9ft1lJdNvk/9wMH
         hL7loSmLXoRReiTt26X4GAAR61iCJktd1BKnqBm02fB8tNZ9apwCdgHK5HJFZ0n4fLBf
         HI3icySjCOqxel5ae4bHHr0ZpceA3GRXT/jqU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695403942; x=1696008742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q96X+e6e2GphA8WEKNidppfkY54O3UO5SgYggFHsXis=;
        b=CDP8KxXea5beEjI6mE1R8BPxcSZlD40nMUTQulOkqZSwUPyD4RMxH9Bjr1s/Du5zcw
         r5OGY1p2Ywo9xUSbbw8AHBMtbXyQASSAJvi8WoVsfNHfNVAwDVU4hhELmirONFbRrYLz
         4wnmQLcdAGzDr5LRHM0wsq7tCCYsw+QiAD/7R2VqJHQ3JhQXHlCiXqcgf0nfpcqpQETN
         PeI8eK8agcBejtzIfukBPaO2MuWFnauK+f21WcrGKBOs1H51S7NLKbuDV1+E4OMMfAKJ
         ln8yb0wAGOIElXTddFW6x1lMwWCgSuNn+kXdJ05NIpKDRUzD5nWjgUMM/ExrqHxI9c82
         +ZEQ==
X-Gm-Message-State: AOJu0YyPP84OKoGJXB1Qi3+Wyr5d0cAxh3eVm5xT7hghJWAzmvwzUD51
        3pagq6/VZswwouHc3IXz3AbgZA==
X-Google-Smtp-Source: AGHT+IGAxXQtNJ8nl1p3a9LhlKf8DFrSzgWUu5f+sJxoG9OHUQ6hTEmo2fNcrqkYhNmsZiKz4XPh9A==
X-Received: by 2002:a17:902:e843:b0:1c5:69fa:23e9 with SMTP id t3-20020a170902e84300b001c569fa23e9mr100975plg.58.1695403941990;
        Fri, 22 Sep 2023 10:32:21 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id p11-20020a170902eacb00b001bf5c12e9fesm3758147pld.125.2023.09.22.10.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 10:32:19 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     David Airlie <airlied@gmail.com>
Cc:     Kees Cook <keescook@chromium.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        John Harrison <john.c.harrison@Intel.com>,
        Andi Shyti <andi.shyti@linux.intel.com>,
        Matthew Brost <matthew.brost@intel.com>,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Emma Anholt <emma@anholt.net>, Evan Quan <evan.quan@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        Xiaojian Du <Xiaojian.Du@amd.com>,
        Huang Rui <ray.huang@amd.com>,
        Kevin Wang <kevin1.wang@amd.com>,
        Hawking Zhang <Hawking.Zhang@amd.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ben Skeggs <bskeggs@redhat.com>,
        Karol Herbst <kherbst@redhat.com>,
        Lyude Paul <lyude@redhat.com>,
        Maxime Ripard <mripard@kernel.org>,
        David Airlie <airlied@redhat.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Gurchetan Singh <gurchetansingh@chromium.org>,
        Chia-I Wu <olvaffe@gmail.com>, Zack Rusin <zackr@vmware.com>,
        VMware Graphics Reviewers 
        <linux-graphics-maintainer@vmware.com>,
        Melissa Wen <mwen@igalia.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, Le Ma <le.ma@amd.com>,
        Lijo Lazar <lijo.lazar@amd.com>,
        Yifan Zhang <yifan1.zhang@amd.com>,
        Prike Liang <Prike.Liang@amd.com>, Lang Yu <Lang.Yu@amd.com>,
        Tejas Upadhyay <tejas.upadhyay@intel.com>,
        Nirmoy Das <nirmoy.das@intel.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        nouveau@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org, llvm@lists.linux.dev,
        linux-hardening@vger.kernel.org
Subject: [PATCH 3/9] drm/i915/selftests: Annotate struct perf_series with __counted_by
Date:   Fri, 22 Sep 2023 10:32:08 -0700
Message-Id: <20230922173216.3823169-3-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922173110.work.084-kees@kernel.org>
References: <20230922173110.work.084-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1705; i=keescook@chromium.org;
 h=from:subject; bh=SbNV7tt6Hho3aemFjM+WsFyDqpMFvSNtroJg7EF/6LY=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDc+e99M+BFyGmat9Yjgpanw6UekhSMQhhAVfe
 PzecbdVf2uJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3PngAKCRCJcvTf3G3A
 JhPmD/oDoTfSn61jeN+hZ6qtbqMVL0umbxgqdZnXY/WBbLuBKV20tcaMAcUgkDgD7IZTf9vLT7N
 QvsK/I3NzdeyXN9KRjg9P26c5TGRnuFhT5ow/Mmpjw2ZfwY/adYsynGhgMsY1zCzocr9Klih2M5
 ONqETCgHopA10PwXUTZcfeylbqK62rRaYAWtkuoi0RcYjB0ba0MiguwtlB6nrG6fwv2owEKE9yZ
 q2M6NVTsjfrdnESUtkpr+ZQMSdTP4DYj6WZCs8PEing/sqS9G43U/93adZtoUdXHfx6OIvtf4kR
 QVJDI5f2FtS/OLpfsJPETvUFATNLl9zt+qYEEI6Xo/nwVAIDi10lef4gFjjLtPRlK+1R5w0hwDl
 vKJUW0WgT4cnNhXnSosMUxrlYOzDiiFUv22K7MRCjwllhPuoEqIvmEu2skXTbfOi++COJZQENGW
 mjr4E/cj8Pue9+KM7OxnSvfWccW9jLZfobZ+Mt3QO0uwzIKFw3tbN6roSBWKQjPzGVWZBhoB7P/
 YBx8LyLPlIme4RIAinnRTvKcRBVmPKq0z5qb+ZrfdbS5SyUax0buA8IufSmAFbFNMVWiehiR7kj
 m3qIzz42RIlit5ahExdpEPXkGeqqxLI86EouMV1p14sfdA6bPnL2FdLAyVYLHh92VJ7BRKvGmB7 gVsy2dUkMQ94AOw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct perf_series.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: John Harrison <john.c.harrison@Intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/gpu/drm/i915/selftests/i915_request.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/selftests/i915_request.c b/drivers/gpu/drm/i915/selftests/i915_request.c
index a9b79888c193..acae30a04a94 100644
--- a/drivers/gpu/drm/i915/selftests/i915_request.c
+++ b/drivers/gpu/drm/i915/selftests/i915_request.c
@@ -1924,7 +1924,7 @@ struct perf_stats {
 struct perf_series {
 	struct drm_i915_private *i915;
 	unsigned int nengines;
-	struct intel_context *ce[];
+	struct intel_context *ce[] __counted_by(nengines);
 };
 
 static int cmp_u32(const void *A, const void *B)
-- 
2.34.1

