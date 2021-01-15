Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B90F2F7114
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 04:44:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732598AbhAODoM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jan 2021 22:44:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730649AbhAODoL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jan 2021 22:44:11 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B369C0613C1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jan 2021 19:43:31 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id x18so4009591pln.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jan 2021 19:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=C6He9tPGs+/ws70kmAFtHlq88pmaEAaoR8SLKcK4SNg=;
        b=GJ5Qhb9slRBrvf9Om96+ZSgwwXop709x4reSxdwYFvhArCZ3JxK8K7CppeVFX1E93P
         iR9hC/FsprYlbJQiI4OXZmTUdzuVCPNGkW4/EPu7ozcWyhUoB1s3D5RlZmEgqz0CzEb3
         FIeIrmAMceMKjNeUuMEJhBRyPr8WrCBDqZkoY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C6He9tPGs+/ws70kmAFtHlq88pmaEAaoR8SLKcK4SNg=;
        b=MC9CgGah9UmNZT/y//7oIJDTzaeX2cOUWlo8UpiOxcOwyayvJclz4ZHpmwukXdAjfm
         nliUYm9RajmUrsKnbS2iCZTIlqIBNrZnI1dDOK22AMkEqYEzxKOrBPJ48Fww1jyLbBAO
         8VCS4683A+RmGHDZlTmKmxpkinCnUUrbluAMUS9JEQjklzqOpjlfvh6lqXA9Vp2LPtNo
         LEb0eDdxJR3XGvxeo9xqZ8Zarzw2eZ25pXNz5/rIfT7ETkKvRe+Gk/bwuIJwMsXlhmli
         c/TzGImBR2OYF3Nh8e4iH+cR9oa1q4REmvxK2eO6MXW/qPz+yO8XVAItlYPb2fBYQkDi
         DzBw==
X-Gm-Message-State: AOAM533lxpLeDxi4ffp58Us33Kf1Bpyq3O1cQx/X+FW97km8RPrDycof
        7IGU6E+YQmrtnfhElO6j0RAOwg==
X-Google-Smtp-Source: ABdhPJyBWMQFKo0YFElvC/23fia/mMyG6g/vnSyuo284t516we9EDHsMfA3/PLuEvFZ8ZcHDB4FoPg==
X-Received: by 2002:a17:90a:68ce:: with SMTP id q14mr8096304pjj.223.1610682210864;
        Thu, 14 Jan 2021 19:43:30 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id u12sm6499062pfh.98.2021.01.14.19.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 19:43:30 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Mark Brown <broonie@kernel.org>
Cc:     linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, Patrick Lai <plai@codeaurora.org>,
        alsa-devel@alsa-project.org,
        V Sujith Kumar Reddy <vsujithk@codeaurora.org>,
        Srinivasa Rao <srivasam@codeaurora.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Cheng-Yi Chiang <cychiang@chromium.org>
Subject: [PATCH 1/4] ASoC: qcom: Remove useless debug print
Date:   Thu, 14 Jan 2021 19:43:24 -0800
Message-Id: <20210115034327.617223-2-swboyd@chromium.org>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
In-Reply-To: <20210115034327.617223-1-swboyd@chromium.org>
References: <20210115034327.617223-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This looks like a left over debug print that tells us that HDMI is
enabled. Let's remove it as that's definitely not an error to have HDMI
enabled.

Cc: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
Cc: Srinivasa Rao <srivasam@codeaurora.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Cheng-Yi Chiang <cychiang@chromium.org>
Fixes: 7cb37b7bd0d3 ("ASoC: qcom: Add support for lpass hdmi driver")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 sound/soc/qcom/lpass-cpu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index af684fd19ab9..8437ba31a306 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -742,7 +742,6 @@ static void of_lpass_cpu_parse_dai_data(struct device *dev,
 		}
 		if (id == LPASS_DP_RX) {
 			data->hdmi_port_enable = 1;
-			dev_err(dev, "HDMI Port is enabled: %d\n", id);
 		} else {
 			data->mi2s_playback_sd_mode[id] =
 				of_lpass_cpu_parse_sd_lines(dev, node,
-- 
https://chromeos.dev

