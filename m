Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE1A0379E57
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 May 2021 06:21:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230160AbhEKEWM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 May 2021 00:22:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230429AbhEKEWK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 May 2021 00:22:10 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FC3EC061760
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 May 2021 21:21:01 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id d3-20020a9d29030000b029027e8019067fso16397522otb.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 May 2021 21:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wgZFlNZfz9EYfzeQvg8JR3pWaua7Txo/La4Xs65mV68=;
        b=e8cVwtdfQWxKumLU3L2sPcRRE88YwVxhHXUc4c3k7eqlRl0thGjwpqhW1we3uS9N7y
         nZ7umVU/j0VZplwCYa/Y2FS57EbEdKIWHRFcrctPTRdENRXjLBtk5jvAsErUM4Ho5QW7
         NPOh4vQUr10l2STyNoCrunsl92Yy6+WF4CfvrgMzXgLUKK2Z2GzHpAK2+BS3z3DuAPG2
         JDfFgYrw6md2QGmT7Ay26TE4qMmGL0eDzqR6x9BTLl+9VBzFE06GX0GTBMf1gMhEEXIt
         DO95hXL2HCB+vHI2f17IgDu6Fw2DtW4stke/2LQGfrnnDdy1i+fR8GWOzw6KU/7wwgti
         0rOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wgZFlNZfz9EYfzeQvg8JR3pWaua7Txo/La4Xs65mV68=;
        b=sF4OBhwYaqnyFh+lb2ZvDmizNY67r5NEiCcNuWxpC6VINGl0rRAHKE9fWPbXvcleip
         YcQiFUIHUZ9lTmDdOLcdX7y/6EY7YQ31I5tHtuJxSL93Sh4Tn+pxBJcDiekou6SItVKC
         VuqlI6gEXoVZIOrbldUWjo8NIPH8zLfJVYXaetFDJ8NQ5l3+qUmY3161ioYmn0m1fYE0
         6OTGl7Yu1F99LcCyXSJlucWOCSjnfdmm4VRMsrKgyHY90PN5FkzUXwfEZRQS2/QJF1p2
         b5HXLf2xQNaWQtXeiF785reOESeG7y6ghaOJj/0OHrs6NZB/iZExdNe9w16fp09gUfyl
         53fQ==
X-Gm-Message-State: AOAM5331A19TpdBwngbSAj5P5Dh5ZJrD2GpH/VKQhj/gl2Vvel4FEtxe
        9KMa3FHfPTyJ4TDTiiSbIQraDQ==
X-Google-Smtp-Source: ABdhPJzYz3q7MFfxjCEI/JfYmH/AhONwg4lawUVkKe8sdMsBhbmNaRZcIRoAXDSU/Esv/aaFXnMEug==
X-Received: by 2002:a05:6830:70d:: with SMTP id y13mr3221908ots.191.1620706860591;
        Mon, 10 May 2021 21:21:00 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:e623:42c1:10df:adff:fec2:f1d])
        by smtp.gmail.com with ESMTPSA id r124sm3042294oig.38.2021.05.10.21.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 21:21:00 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>, sbillaka@codeaurora.org
Cc:     Tanmay Shah <tanmay@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] drm/msm/dp: Add support for SC8180x eDP
Date:   Mon, 10 May 2021 23:20:43 -0500
Message-Id: <20210511042043.592802-5-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210511042043.592802-1-bjorn.andersson@linaro.org>
References: <20210511042043.592802-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The eDP controller found in SC8180x is at large compatible with the
current implementation, but has its register blocks at slightly
different offsets.

Add the compatible and the new register layout.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c |  1 +
 drivers/gpu/drm/msm/dp/dp_parser.c  | 28 ++++++++++++++++++++--------
 2 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d1319b58e901..0be03bdc882c 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -121,6 +121,7 @@ struct dp_display_private {
 
 static const struct of_device_id dp_dt_match[] = {
 	{.compatible = "qcom,sc7180-dp"},
+	{ .compatible = "qcom,sc8180x-edp" },
 	{}
 };
 
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
index 51ec85b4803b..47cf18bba4b2 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.c
+++ b/drivers/gpu/drm/msm/dp/dp_parser.c
@@ -251,6 +251,7 @@ static int dp_parser_clock(struct dp_parser *parser)
 static int dp_parser_parse(struct dp_parser *parser)
 {
 	struct dss_io_data *io = &parser->io.dp_controller;
+	struct device *dev = &parser->pdev->dev;
 	int rc = 0;
 
 	if (!parser) {
@@ -276,14 +277,25 @@ static int dp_parser_parse(struct dp_parser *parser)
 	 */
 	parser->regulator_cfg = &sdm845_dp_reg_cfg;
 
-	io->ahb = io->base + 0x0;
-	io->ahb_len = 0x200;
-	io->aux = io->base + 0x200;
-	io->aux_len = 0x200;
-	io->link = io->base + 0x400;
-	io->link_len = 0x600;
-	io->p0 = io->base + 0x1000;
-	io->p0_len = 0x400;
+	if (of_device_is_compatible(dev->of_node, "qcom,sc8180x-edp")) {
+		io->ahb = io->base + 0x0;
+		io->ahb_len = 0x200;
+		io->aux = io->base + 0x200;
+		io->aux_len = 0x200;
+		io->link = io->base + 0x400;
+		io->link_len = 0x600;
+		io->p0 = io->base + 0xa00;
+		io->p0_len = 0x400;
+	} else {
+		io->ahb = io->base + 0x0;
+		io->ahb_len = 0x200;
+		io->aux = io->base + 0x200;
+		io->aux_len = 0x200;
+		io->link = io->base + 0x400;
+		io->link_len = 0x600;
+		io->p0 = io->base + 0x1000;
+		io->p0_len = 0x400;
+	}
 
 	return 0;
 }
-- 
2.29.2

