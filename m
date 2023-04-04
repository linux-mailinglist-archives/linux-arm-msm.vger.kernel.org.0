Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88C696D6228
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Apr 2023 15:09:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234979AbjDDNJb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Apr 2023 09:09:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234985AbjDDNJa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Apr 2023 09:09:30 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 068062709
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Apr 2023 06:09:27 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id z42so33730551ljq.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Apr 2023 06:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680613765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=359489BbEgBMxOH05QZQy2H3mPDhw2Q2c+iKHkhCGlA=;
        b=rEdDw+kY+TWJNtp7EPtmpXQkVVXLjvMogXahgUsME+Ach7+BzqxbkHmf0ZvgbpnWFP
         ThcgUo/PRU/F2I8G2id112+Dc+p+MiqY74mP8cWkkp6lxwSIyABRgFppGtj2N21zGST0
         GkBYKfNfilXwMJvgLSiPROqZyGyhzD0AlyLb640RFf+BMLjy2/IiO70icbX2HmwnZzuS
         Sx/f8cMEK5/m+Csrj2voO7Ln4IFa3dpPYNK+2SU9Ai6ol+eDDuxl14wwpqfUP7qnfdKz
         sMZT8ETHdNOgfLjBZndWRhJUYxdj9zjD40Y33jCHHEMTurc+sWSWoOknm1yTq/ln0PzG
         wodQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680613765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=359489BbEgBMxOH05QZQy2H3mPDhw2Q2c+iKHkhCGlA=;
        b=kSNkiW3rOJZ8Sa5GKGWbKMwoSZG2X8Hr7EgQjhRK9C8/BGjP2K8EKQbaE4B4k7+8wz
         7U3JwCrgbRrVZTLh9exKtu+6yJtgYUmmgkh0H5d2PiJZM+ZO+igzyys7zQpLNJjLvqJ+
         Mi8VyahcZLacsj3k/LCGJMEoXTTOo3Cn7KwD0oSBdgLukMril+eXzqep4bACCLeu+z+O
         8GFBDwrWGd8f4idkhO215GhyPW47DOMzpBHNfGufwsu/5bB6HBWj0d2Tkn6It/rktImq
         md5j/WD3bsT4+rCdyAYqgrMgfjwgBTQhIyDQdV0jzoO4dki0iSifsM+0N7XqFkISUtKM
         64PA==
X-Gm-Message-State: AAQBX9fMlcw7hD1TlRBdDEYcZ0eZg8g0lIJJQrRK7WIDDrsxOac/pz+B
        WPtF+5yB5LMCbFC7st/vrgNa2w==
X-Google-Smtp-Source: AKy350Y0Pn2j+S+vaZDaosEubXr/ArO9hoDcQDCNJxpsNun8fQr6SnciQhwI8dqAPjEeTgMuG47pyA==
X-Received: by 2002:a2e:8845:0:b0:293:4b91:eb44 with SMTP id z5-20020a2e8845000000b002934b91eb44mr1073215ljj.38.1680613765280;
        Tue, 04 Apr 2023 06:09:25 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([193.65.47.217])
        by smtp.gmail.com with ESMTPSA id c11-20020a05651c014b00b0029e5448e752sm2304789ljd.131.2023.04.04.06.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 06:09:25 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v4 30/42] drm/msm/dpu: catalog: add comments regarding DPU_CTL_SPLIT_DISPLAY
Date:   Tue,  4 Apr 2023 16:06:10 +0300
Message-Id: <20230404130622.509628-31-dmitry.baryshkov@linaro.org>
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

For sm8150+ the DPU_CTL_SPLIT_DISPLAY should be replaced with
DPU_CTL_ACTIVE_CFG support (which supports having a single CTL for both
interfaces in a split). Add comments where this conversion is required.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h | 1 +
 5 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 6db0f64142d5..29bcbc88cd5a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -42,6 +42,7 @@ static const struct dpu_mdp_cfg sm8150_mdp[] = {
 	},
 };
 
+/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sm8150_ctl[] = {
 	{
 	.name = "ctl_0", .id = CTL_0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 53a27461da05..233ea66155bd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -43,6 +43,7 @@ static const struct dpu_mdp_cfg sm8250_mdp[] = {
 	},
 };
 
+/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sm8250_ctl[] = {
 	{
 	.name = "ctl_0", .id = CTL_0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 787d67a28490..a5818878ee0a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -41,6 +41,7 @@ static const struct dpu_mdp_cfg sm8350_mdp[] = {
 	},
 };
 
+/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sm8350_ctl[] = {
 	{
 	.name = "ctl_0", .id = CTL_0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index e7272bc7670a..6f573e28582e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -42,6 +42,7 @@ static const struct dpu_mdp_cfg sm8450_mdp[] = {
 	},
 };
 
+/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sm8450_ctl[] = {
 	{
 	.name = "ctl_0", .id = CTL_0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index c7247a5739f1..9acd9fcf39a1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -43,6 +43,7 @@ static const struct dpu_mdp_cfg sm8550_mdp[] = {
 	},
 };
 
+/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sm8550_ctl[] = {
 	{
 	.name = "ctl_0", .id = CTL_0,
-- 
2.39.2

