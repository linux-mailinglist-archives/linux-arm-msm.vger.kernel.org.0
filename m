Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE02848061C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Dec 2021 05:54:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234792AbhL1Eya (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Dec 2021 23:54:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234796AbhL1Ey3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Dec 2021 23:54:29 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80490C061401
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Dec 2021 20:54:28 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id t14so403004ljh.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Dec 2021 20:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dRlw5VRanssi4XlT/sJNwgpytCpilC/6xz6TuoSRXJE=;
        b=iMos9y7XCDD6lHpyMFqIg7bN9Nlkd48KpU8Gk4CE4RUrTnovMBNVLzNltm+T+e9Dq1
         8hG2Q/CB0hjXlWuiR/TLaQshyuj7HP9T5UWaz0X0QYrfEj9gQ2I38qsTt5g8Hh+LB95A
         EJkV/CaQtsb7q7YmXnTvLaC2yS5mt1uHgzvOAMyvIrZCkZnangF/JIjA2fHv3+SK5Cnt
         63zCComZrmcYtftByIW3B8UJBbpzZ1Gq7eVSDTC9dUka0FJpApFidyrfQAhZN++QS6d2
         WOkkUvgmZ3WdER8SwSGjYewhvU+PFI4tkhffHzbe8U1prHNsaQxSdn3H3zxrUPiFPkS1
         X9mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dRlw5VRanssi4XlT/sJNwgpytCpilC/6xz6TuoSRXJE=;
        b=zsH+sxri3j8s4IE9/UfPa0EWRZw0bjp8Y84cRi7IlDFocbCqjIceTD9Dil2744gm/i
         5/Vxxw1FhaEiL4EQa3qzJM4KHK+IdltbizNkXAJJVRO+KoxFIN7aVs7qqqsfUHVWR2Pe
         9imt6pQ3bZWAE4Mt7iKNFhNivv2bOkOvTSW7b9uTMdfIV750O0Tt5OpZ736mHFshmkI8
         I2SPYdYpm3/3lgt8e7wQnEyVxt6PCHbdqfT+pifjt71crK9K93uSIoKn5cTmrFU7F2CR
         tswLT4jNxd44GnbXThJFyqcLJmHR+7shaK7xdG1nydaSHULB8lZJd9x0G+WQrksVhETj
         Ij5w==
X-Gm-Message-State: AOAM532QO7bVE/zOBO7//bWZzJFIQfzLHSBv7fnmREvZcfvvzSUV/AGs
        7378XnLpyaM77qI1m+9oQYDv6Q==
X-Google-Smtp-Source: ABdhPJwW9OCOfhI9bA0kxMfvq0YZuq8j+Q+KPY517P8mnIWNmsDe/pFSvkxr9lBrZb2eqdeSZXC55A==
X-Received: by 2002:a2e:5354:: with SMTP id t20mr16587931ljd.263.1640667266810;
        Mon, 27 Dec 2021 20:54:26 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id cf3sm1822685lfb.22.2021.12.27.20.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Dec 2021 20:54:26 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v4 11/16] clk: qcom: videocc-sc7180: use parent_hws instead of parent_data
Date:   Tue, 28 Dec 2021 07:54:10 +0300
Message-Id: <20211228045415.20543-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211228045415.20543-1-dmitry.baryshkov@linaro.org>
References: <20211228045415.20543-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If all parents are specified as clk_hw, we can use parent_hws instead of
parent_data.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
---
 drivers/clk/qcom/videocc-sc7180.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sc7180.c b/drivers/clk/qcom/videocc-sc7180.c
index ed57bbb19f88..5b9b54f616b8 100644
--- a/drivers/clk/qcom/videocc-sc7180.c
+++ b/drivers/clk/qcom/videocc-sc7180.c
@@ -99,8 +99,8 @@ static struct clk_branch video_cc_vcodec0_core_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "video_cc_vcodec0_core_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &video_cc_venus_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&video_cc_venus_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -143,8 +143,8 @@ static struct clk_branch video_cc_venus_ctl_core_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "video_cc_venus_ctl_core_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &video_cc_venus_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&video_cc_venus_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
-- 
2.34.1

