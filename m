Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED36B6D1147
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 23:54:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230185AbjC3VyQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 17:54:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230196AbjC3VyP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 17:54:15 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E053C10432
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 14:54:13 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id y15so26379818lfa.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 14:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680213252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AgnHwcJk939hkefr+Q1ASHliLqKIKIESyM1x5wZw9xs=;
        b=KWRaCmxzzO/q6jx3mcVYqN55m13ad3U39C4R4hSMJ6QlBPGnBrmd29Wxb2iBoH3viW
         T+bxqOICH4qc5GS6X32ihgTwIWcoFbNCy0+0JferMvRMldPyfJfWXQtoYRtMb11LPuqs
         PNbbRwtMAQR/a8c5KQHHzEbkuCrm9L/fKyU+tclHKrXnhylqQmFXSiu2dlzX98gw7nbO
         QK18oV9IMyU8YTGCNV/4mn3YPyzjicOftwe+W0E+u+uaWVelLKei2zD+X2OBZTuZZ2F7
         yEhaMHjl4M4kEqol9WF6K2xmGroiD/iUWI72lQShts5HzpAnRd/Ni5njqtrYv9i1Ahgl
         bKVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680213252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AgnHwcJk939hkefr+Q1ASHliLqKIKIESyM1x5wZw9xs=;
        b=r0bjF8RTJvqx5Q6VU+Iy+DnmxxCBaXtPZ7zA9Xfm5D4RPgDEnRt7n+ZK8BZzzQyj/O
         eJ2UKRJiWx2EfPR7m1YGdC6JUrQDR+ccVPtQIFFQa1kru32Px5RqYaMnLTFcZ4IbOFHj
         bq8gEyaDxpVzjRpzV9ULgHbylfBnwVjgVn7BOSiXQxqZjnKJqeUkx5/0C0NRxrkNC9n5
         oGN8PtDLiRbpap11487BDk8SGY4NBOasBdf+yIvOZnRByOF7iOHL2iGzCj1secYjQ6hY
         gd4Pkc7DiqGzngkkD1NdNjBHS0CBIhAGt3TiYmtyJBDPpEg81OBty4+LOEt2hEkHiBp8
         /dJA==
X-Gm-Message-State: AAQBX9euxW9CQ+L4gfus4iu32C/tNgdYblrUtTy9Nj++09EC4oqNK8Xg
        YcH0qfhSlRb9bDSDrotx89GFBw==
X-Google-Smtp-Source: AKy350YnPcJnDPtcJVpOWCewTU1tAJ278EAN2dbL6PTzbTzQBE1p5udVwbO1dxYSHKypE33j6dJXYQ==
X-Received: by 2002:ac2:4153:0:b0:4e8:5576:98f4 with SMTP id c19-20020ac24153000000b004e8557698f4mr6772241lfi.45.1680213252277;
        Thu, 30 Mar 2023 14:54:12 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id f16-20020a056512093000b004cc8207741fsm104574lft.93.2023.03.30.14.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 14:54:11 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v3 22/38] drm/msm/dpu: duplicate sm8350 catalog entries
Date:   Fri, 31 Mar 2023 00:53:08 +0300
Message-Id: <20230330215324.1853304-23-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230330215324.1853304-1-dmitry.baryshkov@linaro.org>
References: <20230330215324.1853304-1-dmitry.baryshkov@linaro.org>
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

Duplicate some of sm8350 catalog entries to remove dependencies between
DPU major generations.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index efec28187cfd..8a2991c48af8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -135,6 +135,12 @@ static const struct dpu_pingpong_cfg sc8280xp_pp[] = {
 		  DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31), -1),
 };
 
+static const struct dpu_merge_3d_cfg sc8280xp_merge_3d[] = {
+	MERGE_3D_BLK("merge_3d_0", MERGE_3D_0, 0x4e000),
+	MERGE_3D_BLK("merge_3d_1", MERGE_3D_1, 0x4f000),
+	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x50000),
+};
+
 /* TODO: INTF 3, 8 and 7 are used for MST, marked as INTF_NONE for now */
 static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	INTF_BLK("intf_0", INTF_0, 0x34000, 0x2c4, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
@@ -190,8 +196,8 @@ static const struct dpu_mdss_cfg sc8280xp_dpu_cfg = {
 	.dspp = sc8280xp_dspp,
 	.pingpong_count = ARRAY_SIZE(sc8280xp_pp),
 	.pingpong = sc8280xp_pp,
-	.merge_3d_count = ARRAY_SIZE(sm8350_merge_3d),
-	.merge_3d = sm8350_merge_3d,
+	.merge_3d_count = ARRAY_SIZE(sc8280xp_merge_3d),
+	.merge_3d = sc8280xp_merge_3d,
 	.intf_count = ARRAY_SIZE(sc8280xp_intf),
 	.intf = sc8280xp_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
-- 
2.39.2

