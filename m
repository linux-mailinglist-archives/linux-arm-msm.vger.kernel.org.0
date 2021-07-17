Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 872933CC363
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jul 2021 14:40:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233764AbhGQMnZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Jul 2021 08:43:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233740AbhGQMnY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Jul 2021 08:43:24 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FEAEC06175F
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jul 2021 05:40:28 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id h9so17984993ljm.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jul 2021 05:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XvCGkdShjzVXwoehYqCYEiIRtFRTu+7v5aX+Z4YnzDM=;
        b=AdDsrFsBavFcY/O0/flrJgv9JEoRa5UhZxx49BPFfbSpIQF4V/s8Kddd7AShWVPdht
         RVYSsxlLl0K5e35LuBhlC6zeqMbUZqd3R5QiQfJ5AbYI+g4kMCvnZ/qhHeqDcV8r2Ffh
         5bDOW4L+3CxOZGuW/ls7H5684+sZ7FV8fo/YcLrs+I70md8BeOa7zFZE52l3+0rVvK53
         AL0RBz6o0VgiM1eUMfIH2iHXG2RzPnwLEOdRrBC1VY6E5MpkmZuYvAzrXJw3E6cw6PHP
         fBwSIrlBzLuUbrYxX7AyKbYrsnr215QMIUhTzr4vVL3BJrDf/NxMG3ImsqObbrpJgaJG
         xgug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XvCGkdShjzVXwoehYqCYEiIRtFRTu+7v5aX+Z4YnzDM=;
        b=VOa/bX7WUwIYZmL4v7+ipQ4rpNNH+RoOkEqpYJZ9ryuZXFqzdWfbSORvrazYEqMzEH
         fIm9uSUQ8IBj1OMa8+VPig066mGlB0z+c1tpin0dy4jsm9qw2EWaO5hvgqkKvg+7DzHD
         nFfoIdySOnrmgch3IR+GeYRy/9wpk10ElFO8v/RA4SKZtfrb+hlk3cS2+/4P9QfKv2eN
         DMO6XpZ1X5M1Du1GFRGSRx/iRtLhzD7/Bs47+7kNRtRBWO6m5fS0UI0CtkzlLekSqz/o
         xz/Mckp/jx6kS1n81OwXxSqBWX4zxM+NNLXhhKnacz7XFtL2pIBU2+vFcTBKRxzvXZX4
         XBCA==
X-Gm-Message-State: AOAM531i7grT4FKd1QbNmnTeQ/OEY7qlsxi8hh5DYRCDykYxUwaMy1Su
        xLEstLi2eSEHR1JaLY3Atbis8w==
X-Google-Smtp-Source: ABdhPJz4no6xCiLQzqpNWjoVZD3gLqB9Nsex4dsxAS1jFR+amC3j84JJm6zdcpIj3cIlQk9IJe52Lg==
X-Received: by 2002:a2e:911a:: with SMTP id m26mr13832763ljg.109.1626525626738;
        Sat, 17 Jul 2021 05:40:26 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f25sm794264ljo.126.2021.07.17.05.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jul 2021 05:40:26 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v4 7/7] drm/msm/kms: drop set_encoder_mode callback
Date:   Sat, 17 Jul 2021 15:40:16 +0300
Message-Id: <20210717124016.316020-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210717124016.316020-1-dmitry.baryshkov@linaro.org>
References: <20210717124016.316020-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

set_encoder_mode callback is completely unused now. Drop it from
msm_kms_func().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/msm_kms.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index 086a2d59b8c8..9484e8b62630 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -117,9 +117,6 @@ struct msm_kms_funcs {
 			struct drm_encoder *encoder,
 			struct drm_encoder *slave_encoder,
 			bool is_cmd_mode);
-	void (*set_encoder_mode)(struct msm_kms *kms,
-				 struct drm_encoder *encoder,
-				 bool cmd_mode);
 	/* cleanup: */
 	void (*destroy)(struct msm_kms *kms);
 
-- 
2.30.2

