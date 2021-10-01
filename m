Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5258741F430
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Oct 2021 19:59:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355695AbhJASBI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Oct 2021 14:01:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355640AbhJASBB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Oct 2021 14:01:01 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E49FC061775
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Oct 2021 10:59:17 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id v10so12370887oic.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Oct 2021 10:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JI+sywciYnZbmZEgEJHRDL/J7+jew9UCDT1hip8NvrU=;
        b=FyoEbdW2FqsPcEhkuzRiqeAZHw3KxbHbOcE66Ei50UA+S5jXlr/d7sRdoPXj0zrPM/
         76r6rt7i+ccdj+mTerjrunN45spBenJDBib2hBvA6rhfnWpjHqmkNK5z5wJgO+jXn4p0
         h8raVVABtgEso+pTjYoll7GzjNoJgFGPIE/Q/rcwKVRadh1jHI48y9214q0FbwcNp5WJ
         M0pg+/b8khuqIFspFtwtwhAfa+JcRwQ+TBmb6BrtuIUOUSEYZ1bb5ZiQFC4p5TnMblcg
         zSxLtACQTor8eVznN8PPWSFJWfAADp52R487S2riQYeeqU7BpyvBkm9YvYD7Txy3HbMS
         Q8+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JI+sywciYnZbmZEgEJHRDL/J7+jew9UCDT1hip8NvrU=;
        b=aAgon0vLJlCCLCqlzeQQPbkcv2GZHUTOBkJwRQSmxE8KTh4h5w9pMe7tOl91LWqXr9
         EqPjDne0GRv3zwA8ye1XGkRqGqBOP0r4qcB1Rk43Mg1iaplzjhPcTu6yfKjsjqRKQDOu
         jprPzqTgtsnwaQS71S8WZq0oUJMIIaLViSLWgMSWDPQ0jadoRGg8OHO3a6gEHj++lW4u
         KxEwGORz5aqFlTt5nz1NLd4Eg21DIYauHDAIGhuLV9lWOZ8GLdspollc+EYFtL4Qkt4H
         ZKhSrZqKsL4t5ZPo7/xfwWW7saVyyGq3x9zNtUN6YAAeb3rX4SDBqS8YGhReUTNHx+hY
         ET+Q==
X-Gm-Message-State: AOAM531KI9FwV6Bwc0qWu4czI6nF0SCMQmEOtAyOhpZ1lv/hMj5l7CkP
        1x+aAzENWnvc8FKOxmfAYQh+4A==
X-Google-Smtp-Source: ABdhPJy4WkvL2DtpKyrAXS99LAVSyxpiYi/tK7s8P4u/fX707mFCaQdncul2tax8VCgac4O/k7y/dQ==
X-Received: by 2002:aca:f189:: with SMTP id p131mr4906839oih.128.1633111156385;
        Fri, 01 Oct 2021 10:59:16 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id w2sm1284798oof.23.2021.10.01.10.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 10:59:16 -0700 (PDT)
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
Subject: [PATCH v3 5/5] drm/msm/dp: Add sc8180x DP controllers
Date:   Fri,  1 Oct 2021 11:00:58 -0700
Message-Id: <20211001180058.1021913-6-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211001180058.1021913-1-bjorn.andersson@linaro.org>
References: <20211001180058.1021913-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The sc8180x has 2 DP and 1 eDP controllers, add support for these to the
DP driver.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v2:
- None

 drivers/gpu/drm/msm/dp/dp_display.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index ff3477474c5d..56a79aeffed4 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -127,8 +127,15 @@ static const struct msm_dp_config sc7180_dp_cfg = {
 	.num_descs = 1,
 };
 
+static const struct msm_dp_config sc8180x_dp_cfg = {
+	.io_start = { 0xae90000, 0xae98000, 0xae9a000 },
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

