Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C46846C2759
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Mar 2023 02:20:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230468AbjCUBUc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Mar 2023 21:20:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230400AbjCUBUb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Mar 2023 21:20:31 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D2CF1DB9C
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 18:20:04 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id y20so17245356lfj.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 18:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679361505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xno9EDcJdCx0dzvy6MPkn9poprdciCTjrjdIL0N1NaA=;
        b=AMhqXIdGn1Cq1onGhg7y9uVnd4SKB2A4gTrV2rO8AUurVo+aYk4GwKasRjk8DMY/Hk
         +80U38aJXN3L4XpxRohz2z1aD90QpUDntpuwcNYUCyXmZd/j9SsGDjQ3aCVxAWmJwUiR
         ZIn/RfkNxDl2MR9100jGa1RnBEhXIOzb2/Dn7g9Kp9tz6LmHmnqbbe/KPkoZub5ThmGz
         BI4Esa7BGeyGyVEjDhuuAR61lwJ+FTCMFtjChLk6rvcQBPiF6Kc8wxMWta+ECPPrraGo
         QjeAkYO6tbxt7DbbbA82BBSS45KJf6BqOPzJz/C7yd/UK9lhWXWBe3+s7zb3vwga9J3M
         YTHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679361505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xno9EDcJdCx0dzvy6MPkn9poprdciCTjrjdIL0N1NaA=;
        b=nmAyeaCmMjTv1zGCEHfSuLwIB6owf63ukv60kOgVlvNsFWrWHjzvp54qqW0Qd4/ZNA
         KvzhrN7FKSgiGM+ItwkrtgaJHs1SJSxMZ83bIKuRotEw+cvQCYuEESCoRT6VqLN3RNXW
         A6RlHaVvpBOP9L/oiwzbJ96nRaLCjLOmCOTW7JL/wB+K9UCvJuAu/TIhur2HRqFRvUh9
         gBvsEg6fHRDRY6OxQU95t5OyBI9ponfhAGzWXGvaeGveCjnkWrE2hwE3tVgcrBMTjmZW
         NgIfp05W4OvO2h3VJxdm2YfWbo0dLfYSN9mbUuSlrQs+BrV0wKxPm89bQsePZpadwB7b
         UNlg==
X-Gm-Message-State: AO0yUKVhRkG5DOHqH+tgDsoo5AdDeEeMIV3kMZF1z2XlxqDMQ1iR+nvC
        z+tbhyGztS1z+VZ3o3TFFTq4uA==
X-Google-Smtp-Source: AK7set9PLOY/fDZbKgoIWxlkExftChjga9g06gkjC8pZxISpuEGh8pc5BfqIol/UoCRafG/u9pg97w==
X-Received: by 2002:ac2:598c:0:b0:4e8:5718:d7a with SMTP id w12-20020ac2598c000000b004e857180d7amr253959lfn.63.1679361505552;
        Mon, 20 Mar 2023 18:18:25 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c18-20020ac25312000000b004eaec70c68esm46863lfh.294.2023.03.20.18.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 18:18:25 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [RFC PATCH v2 04/13] drm/msm/dpu: remove unused fields from dpu_encoder_virt
Date:   Tue, 21 Mar 2023 04:18:12 +0300
Message-Id: <20230321011821.635977-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
References: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Remove historical fields intfs_swapped and topology fields from struct
dpu_encoder_virt and also remove even more historical docs.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 28729c77364f..4ee708264f3b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -130,18 +130,12 @@ enum dpu_enc_rc_states {
  *			pingpong blocks can be different than num_phys_encs.
  * @hw_dsc:		Handle to the DSC blocks used for the display.
  * @dsc_mask:		Bitmask of used DSC blocks.
- * @intfs_swapped:	Whether or not the phys_enc interfaces have been swapped
- *			for partial update right-only cases, such as pingpong
- *			split where virtual pingpong does not generate IRQs
  * @crtc:		Pointer to the currently assigned crtc. Normally you
  *			would use crtc->state->encoder_mask to determine the
  *			link between encoder/crtc. However in this case we need
  *			to track crtc in the disable() hook which is called
  *			_after_ encoder_mask is cleared.
  * @connector:		If a mode is set, cached pointer to the active connector
- * @crtc_kickoff_cb:		Callback into CRTC that will flush & start
- *				all CTL paths
- * @crtc_kickoff_cb_data:	Opaque user data given to crtc_kickoff_cb
  * @enc_lock:			Lock around physical encoder
  *				create/destroy/enable/disable
  * @frame_busy_mask:		Bitmask tracking which phys_enc we are still
@@ -160,7 +154,6 @@ enum dpu_enc_rc_states {
  * @delayed_off_work:		delayed worker to schedule disabling of
  *				clks and resources after IDLE_TIMEOUT time.
  * @vsync_event_work:		worker to handle vsync event for autorefresh
- * @topology:                   topology of the display
  * @idle_timeout:		idle timeout duration in milliseconds
  * @wide_bus_en:		wide bus is enabled on this interface
  * @dsc:			drm_dsc_config pointer, for DSC-enabled encoders
@@ -180,8 +173,6 @@ struct dpu_encoder_virt {
 
 	unsigned int dsc_mask;
 
-	bool intfs_swapped;
-
 	struct drm_crtc *crtc;
 	struct drm_connector *connector;
 
@@ -201,7 +192,6 @@ struct dpu_encoder_virt {
 	enum dpu_enc_rc_states rc_state;
 	struct delayed_work delayed_off_work;
 	struct kthread_work vsync_event_work;
-	struct msm_display_topology topology;
 
 	u32 idle_timeout;
 
-- 
2.30.2

