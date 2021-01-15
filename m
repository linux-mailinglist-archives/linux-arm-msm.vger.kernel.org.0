Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7181E2F7116
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 04:44:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732575AbhAODoN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jan 2021 22:44:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732638AbhAODoN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jan 2021 22:44:13 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C56CC0613D3
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jan 2021 19:43:32 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id r4so3995170pls.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jan 2021 19:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sEcGePAoFBMEH4d16WagZZsbSiItfDYhk9eQpSDkRIk=;
        b=Xv/VoopIlhpPDTaZXWhUJSubJ7194wHJiA+DPMiM6GrPvyQKoTT7oX52iV9fm+cLGO
         LEpTIEtuI+2XvvH7qPvgJAlLr3pJ8z/TDjomiVFipG1nTS7WP6Kz30rDrs7AoSBwz8dW
         U9NARIqZNqA9ZDZ7Fpk0dafYrQc3y5WRuAzVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sEcGePAoFBMEH4d16WagZZsbSiItfDYhk9eQpSDkRIk=;
        b=AeElq8OtkSghfV0JNPFvokUcv8GK5Bbk8sk1wuNnVNoUdLgk5FWF/BCJ8UqXf936HM
         9Lrtbf17b04+dv3VvKHZIe/inh7o7rTlx7GbSnCS7QNwJHruCgOttWVXxGZpIoQt6R6x
         CvRkJNBIo1Qw9G9WHktyK/iDsfBSer0nVUNnKm/OUAkHxEGZ81xgtbomzNJJ5N89NTjZ
         e0MQtRbfUBJL4+YiBdDENI3yPUyNLYrFp34Eq+c0gi7q0qFFm29OY7PU094XVWHrLr/2
         k/d8CrSDBSual7XKntEmT+PvKW+xGJpe/8yX6pKiR+OPEjlwqW6Oi8OSUAO9FnytoQXX
         n8Vw==
X-Gm-Message-State: AOAM533F8d0mdUffCOXTB4RRl/2fSIi7gj4DY9sszK0PBUUo9vz1ydb+
        VgMffqFhlxaN+3s7JAi8myHosA==
X-Google-Smtp-Source: ABdhPJxDvp9I0x93wxUPOVxBAF5Bcl1BTk4Q2oKk5fQ95NoxiwvSrD7NXUc79TFu6VwSIU6d6PzViw==
X-Received: by 2002:a17:90a:cb84:: with SMTP id a4mr8599334pju.50.1610682212225;
        Thu, 14 Jan 2021 19:43:32 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id u12sm6499062pfh.98.2021.01.14.19.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 19:43:31 -0800 (PST)
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
Subject: [PATCH 2/4] ASoC: qcom: Add some names to regmap configs
Date:   Thu, 14 Jan 2021 19:43:25 -0800
Message-Id: <20210115034327.617223-3-swboyd@chromium.org>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
In-Reply-To: <20210115034327.617223-1-swboyd@chromium.org>
References: <20210115034327.617223-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This device can sometimes have multiple regmaps. Let's add a name so
that we can differentiate in debugfs more easily.

Cc: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
Cc: Srinivasa Rao <srivasam@codeaurora.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Cheng-Yi Chiang <cychiang@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 sound/soc/qcom/lpass-cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index 8437ba31a306..40126202a4a3 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -474,6 +474,7 @@ static bool lpass_cpu_regmap_volatile(struct device *dev, unsigned int reg)
 }
 
 static struct regmap_config lpass_cpu_regmap_config = {
+	.name = "lpass_cpu",
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
@@ -674,6 +675,7 @@ static bool lpass_hdmi_regmap_volatile(struct device *dev, unsigned int reg)
 }
 
 static struct regmap_config lpass_hdmi_regmap_config = {
+	.name = "lpass_hdmi",
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
-- 
https://chromeos.dev

