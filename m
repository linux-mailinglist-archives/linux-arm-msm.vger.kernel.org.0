Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A53BA2F7112
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 04:44:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730650AbhAODoK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jan 2021 22:44:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728940AbhAODoK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jan 2021 22:44:10 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCF4FC061575
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jan 2021 19:43:29 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id v1so4305650pjr.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jan 2021 19:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8+6id4FMr4SPdv6wqygG4dWXcEsMutT0RtJWURXdQKM=;
        b=V10CYWipJQsCu5sL5XCAnjC3haYwD730yz1qPpI8CgJA/+0ZkIm25SpKbytyd5Eues
         /mCJQ97o2xb//yPshh7FIhKnN/6FefBBvmjMuWS3znBhqntTqaRKY4SxNbssBdcPRa8k
         mqLwt1JqOao5miFB83brJrdPymg2cr/5n+HZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8+6id4FMr4SPdv6wqygG4dWXcEsMutT0RtJWURXdQKM=;
        b=pTngTvQjJv6zunjIB1gCaLs3PHHr/ADM48VwlA891iSAcB+LwjUTWO9FK5f5WoClF7
         FYAvZvf+ID17etXTGLVxhlD/N6ilt7/LECQra7l0Ly3j5XG3HL4KHfRBhBi1YvMqnOw/
         O9Z7j38CAjLVI8IH1xkNUSCz88k36RoqeWCh/bn0E1ctdK+LCh60m0MLVDXiypsRAuFC
         WQHM0qoGuCWIM8Zq8hGyl4+32eA6hCteLj9A9r7C1CslS08sZn8uDxL8rfAxKJx2pt/h
         DJAgED3i/31dm36uuN2mVBsp/v50P1bxDNM9aaT8x5SQyz/GNXAi2i2a10wlp/qwFB6U
         zCpA==
X-Gm-Message-State: AOAM531fxyUqwipIiwYMjjw6ygmrxOVBVPh6QYl8oUeQNSFBaSjRFB2w
        PCcyrMUkX1m6AfJK6/TNXhhmp8gjxdz94w==
X-Google-Smtp-Source: ABdhPJxTXrQGI8wE/h1KySTvszP44FQVjSR+Shglh1Xb9Br5YOFlis8sa2Vln82nmraLneI8skEAWA==
X-Received: by 2002:a17:90b:e82:: with SMTP id fv2mr8325643pjb.164.1610682209502;
        Thu, 14 Jan 2021 19:43:29 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id u12sm6499062pfh.98.2021.01.14.19.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 19:43:28 -0800 (PST)
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
Subject: [PATCH 0/4] ASoC: qcom: Minor code cleanups for lpass-cpu
Date:   Thu, 14 Jan 2021 19:43:23 -0800
Message-Id: <20210115034327.617223-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Here's some minor code cleanups for the lpass-cpu driver. I noticed that
it casts away const from the driver data from DT. That's not great but
fixing it is a little more involved. I'll get to it later. There's also
some questionable clk_get() usage that should probably be
clk_get_optional(). For now this should help a little.

Cc: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
Cc: Srinivasa Rao <srivasam@codeaurora.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Cheng-Yi Chiang <cychiang@chromium.org>

Stephen Boyd (4):
  ASoC: qcom: Remove useless debug print
  ASoC: qcom: Add some names to regmap configs
  ASoC: qcom: Stop casting away __iomem for error pointers
  ASoC: qcom: Remove duplicate error messages on ioremap

 sound/soc/qcom/lpass-cpu.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

base-commit: 5c8fe583cce542aa0b84adc939ce85293de36e5e
-- 
https://chromeos.dev

