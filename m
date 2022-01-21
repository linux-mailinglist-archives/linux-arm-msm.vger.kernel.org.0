Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 854CD496704
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jan 2022 22:06:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232585AbiAUVG1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Jan 2022 16:06:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231514AbiAUVGY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Jan 2022 16:06:24 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86F6EC06173D
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jan 2022 13:06:23 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id bu18so36357039lfb.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jan 2022 13:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gbDYfYkXzgmiEZGNTQVBb6LTE3GRv8HVsbajZEr2dIk=;
        b=vdcnX1xS5hTwnCvfbiEqPJiR77PcyU1Y9bya0cA8O52sBjiDPfjXG+qIm2DBrhszyt
         Zy2tK1s9rXxBYKa+s7kskeK4/yC09B4HogYMlmQp0rJ/Pt26yNC4Vx8geszM0uYcKaIt
         vKUyGs2Sm36c+5IqxsVoWWQVfzN7uV9G4pV0Bh+IFsoFHcOivw3Iq3Kfexg2+sQZDqj1
         XY1bTpwYtonMuD8h3Tnvdm9tj+UsWWdDo41L0MvuNpIVT/D049wsInMqTT8g5qwQHpVj
         JPoBLb31wSJX/tkXxASNof9ctZaLd7KZ6oRoX/bI/TVDMEK1OzAS5DZ35dYtrWmFaUFA
         hGkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gbDYfYkXzgmiEZGNTQVBb6LTE3GRv8HVsbajZEr2dIk=;
        b=oD+vjHAkSy3AecWAWLS3+PtXdq5COQDUXDWLsJeqAjjM6YAj5z60DQscijzm8wDYUB
         Di9vVQe7DOJxV6OetxST5BxUJp2iymdP1jhfmNGlHySkE55Z7E0FD7Bdvviz8i0E2G79
         4ObMX+KVPTDSM1wRXzEWCxbaKZkvlHaHXrRLcpghyamWcJ93nrvqVdInMyjemexOgQrZ
         aZlH86uTuHlbZHAi53E804yncJknzEbNHCgnjmje1Dpm0HYNVywSssojSTBWWGNoDLmC
         EwQeCGCgzD2fB/BxMRpVrTM9nkatYiR0PvCvW5UiFGz6twmoa8RmJaixaCGGh0nCYnTm
         Id5A==
X-Gm-Message-State: AOAM531mLMdJpZy/yBAHEPW/iYM5aV7DStYMsGksZrceE4Cus9cJvvca
        QRpLNkoApkxU0kqQP25oAVRTFQ==
X-Google-Smtp-Source: ABdhPJxWdxw5YmwlxYgYXx5IYmFhk/j/OaZLrLiihXTr1uY50tCWFiUyjjGiGQOVCo1AGiJMRKIG0g==
X-Received: by 2002:ac2:424a:: with SMTP id m10mr146163lfl.361.1642799181923;
        Fri, 21 Jan 2022 13:06:21 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v10sm279125ljk.44.2022.01.21.13.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jan 2022 13:06:21 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v5 2/6] drm/msm/dpu: add DSPP blocks teardown
Date:   Sat, 22 Jan 2022 00:06:14 +0300
Message-Id: <20220121210618.3482550-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220121210618.3482550-1-dmitry.baryshkov@linaro.org>
References: <20220121210618.3482550-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add missing calls to dpu_hw_dspp_destroy() to free resources allocated
for DSPP hardware blocks.

Fixes: e47616df008b ("drm/msm/dpu: add support for color processing blocks in dpu driver")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index b5b1ea1e4de6..63ed0d7df848 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -35,6 +35,14 @@ int dpu_rm_destroy(struct dpu_rm *rm)
 {
 	int i;
 
+	for (i = 0; i < ARRAY_SIZE(rm->dspp_blks); i++) {
+		struct dpu_hw_dspp *hw;
+
+		if (rm->dspp_blks[i]) {
+			hw = to_dpu_hw_dspp(rm->dspp_blks[i]);
+			dpu_hw_dspp_destroy(hw);
+		}
+	}
 	for (i = 0; i < ARRAY_SIZE(rm->pingpong_blks); i++) {
 		struct dpu_hw_pingpong *hw;
 
-- 
2.34.1

