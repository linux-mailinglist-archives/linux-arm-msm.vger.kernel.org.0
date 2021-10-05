Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C0E5423447
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Oct 2021 01:12:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237105AbhJEXNt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Oct 2021 19:13:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237016AbhJEXNk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Oct 2021 19:13:40 -0400
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com [IPv6:2607:f8b0:4864:20::c2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A7A3C061749
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Oct 2021 16:11:49 -0700 (PDT)
Received: by mail-oo1-xc2f.google.com with SMTP id e16-20020a4ad250000000b002b5e1f1bc78so278076oos.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Oct 2021 16:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/v5p/Ve9RUFoo4IfDLEcH542gJPDz9Km3sRmpush8O0=;
        b=k2ecrN8fG+oc/ePYrUrEfKSsZnF70RnwIGl0D+YFgs+/6hrQyKZ3lkQfiDiKf71Bmq
         xYwRZpD6bhce4lZK0kfC6K9a/CvWkohMCr6hMZfLM38IYXPfZ/JfNE+Hj0lAtcyiZfw6
         HFFwpimwhjy34R5RPKn1wVx+cH4rTbBCg2SaEJeljevKMfI5ZRRvV3kwgpL3TJwP1Edr
         U2pKmyvSTfvWqyovSKsos5xY1DQNk2EFcevADRE/TECsRy+B6C3JRQ0OpDNr7VHXarg/
         7dO4RO8SUQAo7gOifCFEQrzcub2BArQVX6AXn9zEunjrzB/oeGjN7B5WpYpK2tqMUKhl
         DiSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/v5p/Ve9RUFoo4IfDLEcH542gJPDz9Km3sRmpush8O0=;
        b=aP4X7qnuvENu3G447D0FOkIPS4VaYF4V0kguuAztnL3LgsDWyUAvuvKSAzcFgRNyzT
         WecO2/9aSRkm138PtKQNgA2vxnD2TdPJAjPlZDohsJ6NaHZeKC8OFGondqa8ELHjTREb
         8W3YjTlyzUodvpBGHiA9lBVeKSrvJpq9tr1u93nYAnc4YMdcUgbxeYfiwQMXoi5cKzPY
         a+TQdKj4HlIjQ6fYewVCfEZvIVRYeCj6EJXQAFF4KZtKGIOIBgcIvQ+nnx9XTwIHjRLg
         vejW4Szr2oxsaH8HZIgtWAiIWS6a5tbGPyBt6FQlRlUkFskkJKTy9BGmmY7hSmEWkY7Z
         ehbg==
X-Gm-Message-State: AOAM533SN+HO/3r+l+txHCG+N5zu7eh8shEhX83MPJRroQ7Ujzs/+lML
        MvsOBZVCmIZvYqKHkEcyUOdxiA==
X-Google-Smtp-Source: ABdhPJxN5PHge5EzLnVUk65GK/y++2iJXI/H43T6JX8d+ltCU94ac/Zp77mPtHACBrAQaXfuL7nHPQ==
X-Received: by 2002:a4a:ba90:: with SMTP id d16mr2504712oop.83.1633475508970;
        Tue, 05 Oct 2021 16:11:48 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id v9sm1665141oth.62.2021.10.05.16.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 16:11:48 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 7/7] drm/msm/dp: Add sc8180x DP controllers
Date:   Tue,  5 Oct 2021 16:13:23 -0700
Message-Id: <20211005231323.2663520-8-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211005231323.2663520-1-bjorn.andersson@linaro.org>
References: <20211005231323.2663520-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The sc8180x has 2 DP and 1 eDP controllers, add support for these to the
DP driver.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v3:
- Rebased upon previous patches in series

 drivers/gpu/drm/msm/dp/dp_display.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 674cddfee5b0..29c2c1c52ddb 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -135,8 +135,19 @@ static const struct msm_dp_config sc7180_dp_cfg = {
 	.num_descs = 1,
 };
 
+static const struct msm_dp_config sc8180x_dp_cfg = {
+	.descs = (struct msm_dp_desc[]) {
+		{ .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
+		{ .io_start = 0x0ae98000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
+		{ .io_start = 0x0ae9a000, .connector_type = DRM_MODE_CONNECTOR_eDP },
+	},
+	.num_descs = 3,
+};
+
 static const struct of_device_id dp_dt_match[] = {
 	{ .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_cfg },
+	{ .compatible = "qcom,sc8180x-dp", .data = &sc8180x_dp_cfg },
+	{ .compatible = "qcom,sc8180x-edp", .data = &sc8180x_dp_cfg },
 	{}
 };
 
-- 
2.29.2

