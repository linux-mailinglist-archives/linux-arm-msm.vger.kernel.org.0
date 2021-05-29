Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A64F394982
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 May 2021 02:25:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229528AbhE2A04 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 May 2021 20:26:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbhE2A04 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 May 2021 20:26:56 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4DBDC061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 May 2021 17:25:19 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id w7so7347612lji.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 May 2021 17:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bCV6uTNosDGcY6f4l30OjMSBFLKwXUprBp7g5LzOdmE=;
        b=B9TL8QOrWRKN4vhlP3UF93T7lvOoIYr2HC78VowLwyYF6HnFloX6TQmzqE7uP7EDyA
         2IyYlbW7/rmmK2EmftH7ZDjAG97B7JFeflumG/GnO+hoUP6O82j8iezhfK8tfsRK8Hyc
         ZwN5CoHERT7YpHy/c4SQHQq1eK3xuD2NUhNT9xHRwsv1RX0x+LPwl/M7eNJuLMyxODm/
         vq8rjeakbRWvR5PzryZ5ghFK9fSYGU7jq6/9zvVihF992ysDu/WkbTWt3PUs5YgD0YXh
         ywwK/0U7bVzSlK77lNaafXjJeFeq/zCzztTef8LCoC2P3xMjQa81863CmpcutNulz5Xj
         z8FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bCV6uTNosDGcY6f4l30OjMSBFLKwXUprBp7g5LzOdmE=;
        b=p474C/z9tWKFSRkI4aH0z6+9ir9j6YNltgYTFvvYgq/T8nlifDpIMX2SXlhYUV/G6T
         /CTqWG5qxpc28TgP+EVBNQa2I99ZmGFCpPddGtkMeI6agtfOhsaWgIZHWAsLH6tcg5nX
         07SdUAvgkyAjVcVkeBX0zl6TdTLMrWGANhV2S5pR4Qh3qQZVYmBdmBVKyPpvCQeZJONm
         gL4zOnXo4uEgGI6kVYB6+RX3H2UyXMdHT3zigq3eY0viHgyzDuvbQuYONqNRKRpRA5Vh
         2mFD375IeF9nggH/jIZ6GFMAetyskE7xeyJt/G5iUXv4zF01lz3uj7HR3H1U6hmKrzEO
         SZxg==
X-Gm-Message-State: AOAM5311jLC9t+l6WVFp+6AqgXP+o8guHZojeorzniFhl+DsYB1juQpT
        OAhBI0C6npgKy40DKOzT4qV/2PFFY8lAmg==
X-Google-Smtp-Source: ABdhPJzDTH3FZAisO38D59+IuUW+xayOopQ58D00IZ0P8NWTksBZ85QlhOsaJ318PhXgbqXop14n8w==
X-Received: by 2002:a2e:5419:: with SMTP id i25mr790907ljb.365.1622247918109;
        Fri, 28 May 2021 17:25:18 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c8sm701078ljd.82.2021.05.28.17.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 17:25:17 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [RFC 3/8] drm/msm/dsi: drop msm_dsi_phy_pll_save_state from 7nm and 10nm drivers
Date:   Sat, 29 May 2021 03:25:03 +0300
Message-Id: <20210529002508.3839467-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210529002508.3839467-1-dmitry.baryshkov@linaro.org>
References: <20210529002508.3839467-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Stop calling msm_dsi_phy_pll_save_state() from dsi_pll_7nm_init() and
dsi_pll_10nm_init(), as this is handled now by the generic code.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c | 3 ---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c  | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index 34bc93548fcf..229e98a496f7 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -706,9 +706,6 @@ static int dsi_pll_10nm_init(struct msm_dsi_phy *phy)
 
 	phy->vco_hw = &pll_10nm->clk_hw;
 
-	/* TODO: Remove this when we have proper display handover support */
-	msm_dsi_phy_pll_save_state(phy);
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index e76ce40a12ab..752a78c9dfcc 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -734,9 +734,6 @@ static int dsi_pll_7nm_init(struct msm_dsi_phy *phy)
 
 	phy->vco_hw = &pll_7nm->clk_hw;
 
-	/* TODO: Remove this when we have proper display handover support */
-	msm_dsi_phy_pll_save_state(phy);
-
 	return 0;
 }
 
-- 
2.30.2

