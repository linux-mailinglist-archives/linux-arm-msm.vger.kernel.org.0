Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A141412B92
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Sep 2021 04:18:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347291AbhIUCUU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Sep 2021 22:20:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235156AbhIUBqH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Sep 2021 21:46:07 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 781BBC05BD37;
        Mon, 20 Sep 2021 14:20:21 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id x27so73159312lfu.5;
        Mon, 20 Sep 2021 14:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=b1EtS8SFEilKGxAqVcNeCV6TdhHIw4BRQAXI7jUyN0E=;
        b=F7GvyO3PHMHAjafzsYHavQ0Fkq/aaIx9zKV7wt6gdd+ee4E0AxQAHKYI9u8Wlbxqpf
         qyCzCtkEMgp9CSaIux4BBfHlPI1QHwu1HigeztwFwhlr5O56Rt5VdFccVVkBk/C9TCh9
         Y8VCmCHHssd+ifeW4Xt2c3vVQtaITI/xVArhVSgJ4pUf7Ql90A5pnTsQZmiNVJc2o+qY
         TWswccDgC49VPhxTs0/n4W7cTcnHiyZhIpgwdPFe6HVqCsV/s3gb8Wkhl3rh6qUZgV5Q
         PJCrsejAqOH1D2tUwDTzMqrLZ0Cg+Y1wnYFypOccpV86u4PwH3iiEOcmG/6xf18tQO5l
         ZP2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=b1EtS8SFEilKGxAqVcNeCV6TdhHIw4BRQAXI7jUyN0E=;
        b=q5xib5hbIvEaFNwM9Tz9vCtu3Y/ezsm5UvMv1gJOPXJOiLhp7il6NkzwIBc296EtNF
         HVzhpzlYDknIpdvMwPRzWdk/PPnKEjc439Lo/eT4tfSj1YJmt9ggoBwsCTdOTjbiW/by
         OWnceswiO+No7wB7Hg+4g7DmoPVk2P2kXW58Ibp/dETnXchCcrGuEd9IuwcUUdE6kbnD
         cItj4+BaoDFfh//boxB54rj32877y7ctkKuhmgPU/Ha5Mftp4qZLaNRZHSAv5jGm+M5e
         hIRPRH4/ltfaWZrg8eOF8Lq/b/9B3m5cxapn0QSAw3+vJLiI43a4jcClH7x9fP5jw02Z
         10fA==
X-Gm-Message-State: AOAM533jD0jgmfwpDC9bVcYgVk3pCCPNb4Fig9cMoUcjLm2ua1OUoRYv
        wLzHNbzuVvmR1dPEzu9lRmc=
X-Google-Smtp-Source: ABdhPJy1GY2SFpUgi0kmJ0T1bvcQNuO0PgWm2azxtOwrqDJmsBQxu3l9OcwXJtY4BVXyBDp4Z28d4A==
X-Received: by 2002:a05:6512:3c92:: with SMTP id h18mr19866364lfv.656.1632172819899;
        Mon, 20 Sep 2021 14:20:19 -0700 (PDT)
Received: from localhost.localdomain (h-98-128-228-193.NA.cust.bahnhof.se. [98.128.228.193])
        by smtp.gmail.com with ESMTPSA id z5sm1887615ljz.23.2021.09.20.14.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 14:20:19 -0700 (PDT)
From:   Rikard Falkeborn <rikard.falkeborn@gmail.com>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH] drm: msm: hdmi: Constify static structs
Date:   Mon, 20 Sep 2021 23:20:14 +0200
Message-Id: <20210920212014.40520-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The only usage of hdmi_8996_pll_ops is to assign its address to the ops
field in the clk_init_data struct, and the only usage of pll_init is to
assign its address to the init field in the clk_hw struct, both which
are pointers to const. Make them const to allow the compiler to put them
in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
index a8f3b2cbfdc5..99c7853353fd 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
@@ -682,7 +682,7 @@ static int hdmi_8996_pll_is_enabled(struct clk_hw *hw)
 	return pll_locked;
 }
 
-static struct clk_ops hdmi_8996_pll_ops = {
+static const struct clk_ops hdmi_8996_pll_ops = {
 	.set_rate = hdmi_8996_pll_set_clk_rate,
 	.round_rate = hdmi_8996_pll_round_rate,
 	.recalc_rate = hdmi_8996_pll_recalc_rate,
@@ -695,7 +695,7 @@ static const char * const hdmi_pll_parents[] = {
 	"xo",
 };
 
-static struct clk_init_data pll_init = {
+static const struct clk_init_data pll_init = {
 	.name = "hdmipll",
 	.ops = &hdmi_8996_pll_ops,
 	.parent_names = hdmi_pll_parents,
-- 
2.33.0

