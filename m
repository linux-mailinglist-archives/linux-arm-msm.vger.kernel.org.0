Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C18D6934E4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Feb 2023 00:13:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbjBKXNo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Feb 2023 18:13:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229605AbjBKXNn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Feb 2023 18:13:43 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F042416301
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 15:13:41 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id lu11so23983571ejb.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 15:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1dZBGxUQwjjYuUcZQTiVVUE+JYQBDwQJfl/gGnl8D88=;
        b=gWIlp/9DLTIRyz2ef91Y7WX8d9/SerWOmjoMiHPLAAz5RhdBip7aanvCKo8bXEOLMm
         kUk09CXXJCJoes6r4nUZwohvFyjZZ7Hv3GCAnQOnhn0qNtfyXhkM2Q1dw/m1zeYn81g0
         i0xiYAtpFI86P1ngXVRiQJpkogmd3Ed1vm2cVuseJvIYetfzXmCZGi6q5J0wzqwHqzB7
         V4MTRDqvrinrQqoepgsKHZfu1+QO2KalrNvO0lugPWxyX6c3U60GqPUqfj9vmSgMbbqQ
         9yntGHUtc9PMdIjqbam4glwKz14BRu4YO+KKIqFsiyREusd4dX5/dU4FrWgSM0rGuYsQ
         Qlcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1dZBGxUQwjjYuUcZQTiVVUE+JYQBDwQJfl/gGnl8D88=;
        b=BeXzsa5mPcTnE6abgHwZvNN3hBIc38Jb5TzHnizMSScxbCp0WZWewT/W4oUKCkSfih
         QrYHARQtOduvg0078EgtkMwm/+vnGGADcvXT2aIuKFrMZcKE5F9ox8dzBF0S7FwIcHJv
         6rUIfelI2V3ix6OaMEpSFALP0qdTYJkFbn6Dxq0/03/Q1HK/e6dd/O6rqNs4MdDpeI8M
         3P+dP0XpYyiv0bGG/u7xqPTtOrdpH6jld193XOcuuAeHz6T0/UXek3hc+y6R9yNXauhs
         T0r3fsCOHK91ukdPxEdDJDhqY1FXCM8J7i0abPexoMJrFBsXX0bG5N0skjsRafHN6zEP
         83bQ==
X-Gm-Message-State: AO0yUKXx6+OL7LVr4Iulwon4X19qk4W+IdfqO96nujP5lZ3VbiwUHwjn
        mYj3vs1aq2CruaWP0/VY8wREVA==
X-Google-Smtp-Source: AK7set8ID3H/7LRN4dt9ZXZyxlm7O6xNxyP6tjnuoED4nHLa449zASX+bSyPIf56pTYUKYRqMV6yhA==
X-Received: by 2002:a17:906:36d9:b0:88d:ba89:183a with SMTP id b25-20020a17090636d900b0088dba89183amr14332998ejc.11.1676157221622;
        Sat, 11 Feb 2023 15:13:41 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id k20-20020a1709061c1400b00871390a3b74sm4517149ejg.177.2023.02.11.15.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 15:13:41 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 34/50] drm/msm/dpu: duplicate sm8250 catalog entries
Date:   Sun, 12 Feb 2023 01:12:43 +0200
Message-Id: <20230211231259.1308718-35-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Duplicate some of sm8250 catalog entries to remove dependencies between
DPU major generations.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    | 23 +++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index d723a690bd41..b27f6c528a1f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -81,6 +81,25 @@ static const struct dpu_ctl_cfg sm8350_ctl[] = {
 	},
 };
 
+static const struct dpu_sspp_cfg sm8350_sspp[] = {
+	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_SC7180_MASK,
+		sm8250_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
+	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x1f8, VIG_SC7180_MASK,
+		sm8250_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
+	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x1f8, VIG_SC7180_MASK,
+		sm8250_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
+	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x1f8, VIG_SC7180_MASK,
+		sm8250_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
+	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_SDM845_MASK,
+		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
+	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1f8, DMA_SDM845_MASK,
+		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
+	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1f8, DMA_CURSOR_SDM845_MASK,
+		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
+	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x1f8, DMA_CURSOR_SDM845_MASK,
+		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
+};
+
 static const struct dpu_lm_cfg sm8350_lm[] = {
 	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
 		&sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
@@ -178,8 +197,8 @@ static const struct dpu_mdss_cfg sm8350_dpu_cfg = {
 	.mdp = sm8350_mdp,
 	.ctl_count = ARRAY_SIZE(sm8350_ctl),
 	.ctl = sm8350_ctl,
-	.sspp_count = ARRAY_SIZE(sm8250_sspp),
-	.sspp = sm8250_sspp,
+	.sspp_count = ARRAY_SIZE(sm8350_sspp),
+	.sspp = sm8350_sspp,
 	.mixer_count = ARRAY_SIZE(sm8350_lm),
 	.mixer = sm8350_lm,
 	.dspp_count = ARRAY_SIZE(sm8350_dspp),
-- 
2.39.1

