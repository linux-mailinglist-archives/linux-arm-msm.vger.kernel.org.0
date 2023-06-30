Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 176CC744383
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jun 2023 22:55:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232372AbjF3Uzb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Jun 2023 16:55:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232180AbjF3Uz3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Jun 2023 16:55:29 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 459243C24
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jun 2023 13:55:28 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4f76a0a19d4so3717846e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jun 2023 13:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688158526; x=1690750526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HlnLygFYYtSxoKEaC5DFXDBhNuXumh16hVtzEXEvSec=;
        b=LdRu7+xmOYqxG4so8J+p/be/A77ZNeA7zmtp4kw1Hp/6IRShPyqjPxt7SqvY9L/fMp
         JSJOEjvvXUNpHzV0m0XeMszPtCNtcy1g7CUsacsBOQ3Wqge+LVApp+MyzRn9sooIS77R
         KhCsrRZD7fTHF+sh0w2LSCFWaa/WleAO51og0EtbQ8/LoJePP3zPDJMelaWFgCXhIUbU
         vuJ1iP9Nk22/wh5oHgPfOP1bPk+eUEkU51NT8CUeFx8JHNkg1o8JkQ4/xfmxQYatn5Gt
         DK96D//0mZWICso7x0Pmde3f/VTSLmpCz1VjNPTsuJO+k5WVHtyq6ajJKD+dBShRlZTS
         O5OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688158526; x=1690750526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HlnLygFYYtSxoKEaC5DFXDBhNuXumh16hVtzEXEvSec=;
        b=k7PwFvwMlQDohILH5VYpd7WJ5GhPNhWFwl884esLJeEqjMXUmexOjKgQEolwDFqLd3
         u+G0tkJxE204rD9+IHbOiv0HQfUHT+JVnBpHLE3nHijiN1hJWRiWroDVNYtR+BpnT8Lb
         C5Ob9ZJx25VptCGGoJbvdEjX9yuQw0nBqCh5ZOyzpcdasU+QP7tXx3IsfuerG8zqhGB8
         i1jXgDfkIVRdGB5bgUt9ROMbMzvIOx6Y1Ym2DXHpdMBiqa7hrpSU6kw5iE7IY2o2Ojia
         h6NNJHFF5Y23V2zkD/kjlNW15HRrwsSSHaFWUkZw0Btqo9XmVHG5gfpOPLmyAppf+B2z
         u6ZA==
X-Gm-Message-State: ABy/qLYaBkGzCTlnz265xvdL83rqOLU4YzZyjPtHGgeJ9TRViNpNX9ZY
        b6sjk/MiXQ867z9aleTORgNL2w==
X-Google-Smtp-Source: APBJJlFrki3ug4eykwM7IZLMHwKU+OyXNp/uu8IFYeAHUGGL1wXbnHzfztuBeqQ0EYYaVO81BtySNQ==
X-Received: by 2002:a19:2d49:0:b0:4f8:6e1d:cf98 with SMTP id t9-20020a192d49000000b004f86e1dcf98mr2983408lft.66.1688158526612;
        Fri, 30 Jun 2023 13:55:26 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z11-20020ac25deb000000b004fb75943aa0sm2252168lfq.196.2023.06.30.13.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 13:55:26 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 03/15] drm/msm/hdmi: correct indentation of HDMI bridge functions
Date:   Fri, 30 Jun 2023 23:55:11 +0300
Message-Id: <20230630205523.76823-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230630205523.76823-1-dmitry.baryshkov@linaro.org>
References: <20230630205523.76823-1-dmitry.baryshkov@linaro.org>
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 62ce1455f974..fbcf4dd91cd9 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -291,12 +291,12 @@ static enum drm_mode_status msm_hdmi_bridge_mode_valid(struct drm_bridge *bridge
 }
 
 static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
-		.pre_enable = msm_hdmi_bridge_pre_enable,
-		.post_disable = msm_hdmi_bridge_post_disable,
-		.mode_set = msm_hdmi_bridge_mode_set,
-		.mode_valid = msm_hdmi_bridge_mode_valid,
-		.get_edid = msm_hdmi_bridge_get_edid,
-		.detect = msm_hdmi_bridge_detect,
+	.pre_enable = msm_hdmi_bridge_pre_enable,
+	.post_disable = msm_hdmi_bridge_post_disable,
+	.mode_set = msm_hdmi_bridge_mode_set,
+	.mode_valid = msm_hdmi_bridge_mode_valid,
+	.get_edid = msm_hdmi_bridge_get_edid,
+	.detect = msm_hdmi_bridge_detect,
 };
 
 static void
-- 
2.39.2

