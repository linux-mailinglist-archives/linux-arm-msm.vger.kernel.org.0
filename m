Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3962D6D6210
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Apr 2023 15:09:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234955AbjDDNJS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Apr 2023 09:09:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234964AbjDDNJQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Apr 2023 09:09:16 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD5D01BE6
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Apr 2023 06:09:14 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 20so33789110lju.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Apr 2023 06:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680613754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J5DzP7VQXaovbBEaHhSn8d2fnDDu3UNhzVu3sEmgPTg=;
        b=Cdt6Q6e3BpOfk47aRMYsXT5f6VKoqOqJefA2PWdGGOedRgEaibzvA0RmUW6RXlMISs
         U8vQllmPDAD1B2AfAA9ZW4pQflTZD1bCwNyKLMUQiKvLvO7TwEbnYT8vOYyiXGXPcNxC
         7sf6XCM6II1UYVfw/oHYL21groXsY8EwzlrTtBICRtnmkKO5383eCXhaaXv9B8M1cuKQ
         +0TPMUOdSWc+SJy7SncR3PnGfOzRamaWBlqjmiPMruwft1XiD7YOo4JzLv4blKfuQhOg
         bqoz1/NyE7QFy6Xq/EeKAFPDoakmwidOpXU8E3RcE0JfyLNDZ5MO3ZjrMzCddqg79h5t
         zqRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680613754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J5DzP7VQXaovbBEaHhSn8d2fnDDu3UNhzVu3sEmgPTg=;
        b=46NpXjjtdjIluIETaU6kTcRlKy02IpdxZA0Yu/rTcpBr/6+u+yvE+WUsZ/hcH+wpft
         8/qoqR4IxLlWUw6UI47XKSJnEKb09HqRQzVDFPbHZa4KVYanlvS4HH8s0/kSHnVs+mfe
         TmqVblmnmw6xlQFUJOt8+stZvs/T3Nxn86E0exfIZyY5X5A9Ie1jTN5WnSREC0DW/1JV
         lqAznz5K6T7/RGzG4ATmt8vY2HSumSwkyUDGxmBs32f33Y2M4Kn8s+VcQD2yqSdIR5p7
         lMvDea8KygvfmE+1S74XBcUZQtqnIXudvjZm6VxCzMG034Yigg1P378uqKFv0xw/Ilhk
         x0kg==
X-Gm-Message-State: AAQBX9dysIbh9LBW+4WpydmMELoKnilmEthnVMbsMnEtC5gczgXU7/lS
        Hb0V4RRd4n8nahLuMwSA/yxsgikrBzWYwUM50zo=
X-Google-Smtp-Source: AKy350aSUWdS5/5HcEQbLtfJ5CCKkQDo2lvXSD84geCKRhjo7K3Xp48gqFlnFF4yTZxfof6foYIU9w==
X-Received: by 2002:a2e:9586:0:b0:293:2c65:20c8 with SMTP id w6-20020a2e9586000000b002932c6520c8mr744004ljh.1.1680613754364;
        Tue, 04 Apr 2023 06:09:14 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([193.65.47.217])
        by smtp.gmail.com with ESMTPSA id c11-20020a05651c014b00b0029e5448e752sm2304789ljd.131.2023.04.04.06.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 06:09:14 -0700 (PDT)
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
Subject: [PATCH v4 24/42] drm/msm/dpu: duplicate sm8350 catalog entries
Date:   Tue,  4 Apr 2023 16:06:04 +0300
Message-Id: <20230404130622.509628-25-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
References: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
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
index d8435c55c396..39894cbf456d 100644
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
 	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
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

