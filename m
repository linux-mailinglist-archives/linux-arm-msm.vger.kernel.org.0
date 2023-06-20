Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EAAF8736075
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jun 2023 02:09:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229595AbjFTAI7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Jun 2023 20:08:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbjFTAI6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Jun 2023 20:08:58 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F68B1B6
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 17:08:54 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4f004cc54f4so5418389e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 17:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687219732; x=1689811732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yc5Gpk7GlAItFVd/hh1BsMKbvkwwHWamsjHCC1M3Ias=;
        b=ipD7E6C1N87G3aQYZ4/RFgMvFm88HJ/PccLdFr+xio427gkoEjIyw0sal0E3J5eots
         D03lDsZxhAiwJIwFbFSVDCzmu1qAlJdZoD9+WhR2WS1b0/7cVBUPF99Bi4Qo0h5/OLRZ
         hRvZEjo7BZYVGrUNnd2YXgqIeT/9y+wqBf7xCWII4Keh7l+HheALoXCG8CJDgoUCPCxU
         42fMPKXf4+BGME0fdCjcUGXJtBwP7o40p0+2q4GSl5FNIcOXrHCMhexi5SucmR/ki7Jn
         bXBLHq35cHZRQJGWSCzsBc+k1PRjmUUUBYydD9ARK8SHH8f9hMqoHe6T7SYs3R8m5jXI
         R7NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687219732; x=1689811732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yc5Gpk7GlAItFVd/hh1BsMKbvkwwHWamsjHCC1M3Ias=;
        b=MISD7eDbY+xjTiw4zDpSBkX2VDSZ1LX6VxwwWQG8+du1Kek9xskOFnwE6H9Fjp2pel
         p31xjxHERqqYQJhQW2NXcI8YXiFxSxdPyA1NhawNVvTVhcEQy7+NUtwKXIvVk4MN3/fl
         eOj9QuBIOveJ/CuRxDjtvE+uLDGwExZwSSJZZ8yJYAW0s2jUqfVgm6OYLUpQaN19RiKK
         /4z9OO5OpUUUs4W13sK10ry4eYFLw3vWPp4I2XkvlTSj6h0O/jRApIVvbs2X/UuO4PDJ
         Cmvk5PLEifCLrgpxsWtWwVs+u8XFbX12cjI2xwT8KJ8jx45X55jjh6Akfim6hVTBueis
         StSg==
X-Gm-Message-State: AC+VfDycOaqhZ3Zo6B2WbruLi2t4y3eyB7/ye53pg2KnBvv/mC5lPqSQ
        2/CeX1pllwc2dWeAx8dzKEsPtw==
X-Google-Smtp-Source: ACHHUZ7u2Javcxy3i+jtBR8J9MI3xj+egrINv9A5LA9CoenjO1rXWv5TNa01402Q5nxO5HtIMc08OQ==
X-Received: by 2002:a19:f203:0:b0:4f5:f736:cb9f with SMTP id q3-20020a19f203000000b004f5f736cb9fmr6142524lfh.67.1687219732616;
        Mon, 19 Jun 2023 17:08:52 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a6-20020a056512020600b004f869e46fd4sm128815lfo.100.2023.06.19.17.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 17:08:52 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 4/8] drm/msm/dpu: rework indentation in dpu_core_perf
Date:   Tue, 20 Jun 2023 03:08:42 +0300
Message-Id: <20230620000846.946925-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230620000846.946925-1-dmitry.baryshkov@linaro.org>
References: <20230620000846.946925-1-dmitry.baryshkov@linaro.org>
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

dpu_core_perf.c contains several multi-line conditions which are hard to
comprehent because of the indentation. Rework the identation of these
conditions to make it easier to understand them.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index ba146af73bc5..f8d5c87d0915 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -148,8 +148,8 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
 
 	drm_for_each_crtc(tmp_crtc, crtc->dev) {
 		if (tmp_crtc->enabled &&
-		    (dpu_crtc_get_client_type(tmp_crtc) ==
-				curr_client_type) && (tmp_crtc != crtc)) {
+		    dpu_crtc_get_client_type(tmp_crtc) == curr_client_type &&
+		    tmp_crtc != crtc) {
 			struct dpu_crtc_state *tmp_cstate =
 				to_dpu_crtc_state(tmp_crtc->state);
 
@@ -194,8 +194,7 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
 
 	drm_for_each_crtc(tmp_crtc, crtc->dev) {
 		if (tmp_crtc->enabled &&
-			curr_client_type ==
-				dpu_crtc_get_client_type(tmp_crtc)) {
+		    curr_client_type == dpu_crtc_get_client_type(tmp_crtc)) {
 			dpu_cstate = to_dpu_crtc_state(tmp_crtc->state);
 
 			perf.bw_ctl += dpu_cstate->new_perf.bw_ctl;
@@ -325,10 +324,8 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
 			update_bus = true;
 		}
 
-		if ((params_changed &&
-			(new->core_clk_rate > old->core_clk_rate)) ||
-			(!params_changed &&
-			(new->core_clk_rate < old->core_clk_rate))) {
+		if ((params_changed && new->core_clk_rate > old->core_clk_rate) ||
+		    (!params_changed && new->core_clk_rate < old->core_clk_rate)) {
 			old->core_clk_rate = new->core_clk_rate;
 			update_clk = true;
 		}
-- 
2.39.2

