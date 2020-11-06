Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BC512A8F3F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Nov 2020 07:14:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725842AbgKFGOm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Nov 2020 01:14:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbgKFGOl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Nov 2020 01:14:41 -0500
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 294C0C0613CF;
        Thu,  5 Nov 2020 22:14:40 -0800 (PST)
Received: by mail-pl1-x644.google.com with SMTP id t6so180356plq.11;
        Thu, 05 Nov 2020 22:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZlXKKq4DGEFjUy+nOWMktAH/V5heZC0/6ILxLCieIBI=;
        b=uzq0KYojkUs4t+Q4y3YBqX0rQNXV7pH3WlTA04d9xfT2HzTtRS3Ey60ivElLdbiQ6C
         zFVX81uumdUT5FV4Zja3UM60O36+C4AYkDG9oUsJKhIOf7gEmd434azZmqvFrOjlZg4t
         UPBURLWtRU0ibF94bPAoRqrwQ4fKKP46UwIGQ/DND6ZD2NmUYAgOY8Y7FxC2mmjPnHFV
         qMtxbD4JZ0jT563EdP6MPHQ0wU3XON48XbuLpy0CQPufsvMGSUpvOsGZn2qDAgVwPAaI
         AFCfj9D21WFd9CS5UDuTQ3IgCDOlQ1pTCoc9Um/ZEV22ml05J6IGPqssKSUR9n8JSZI2
         0PEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZlXKKq4DGEFjUy+nOWMktAH/V5heZC0/6ILxLCieIBI=;
        b=BWkv/s0wFbxEA/QfL6gQcLHswQSeYeTAtFZkQR0IJz/LuvPbfjk3pGhl5TwLb5DFOt
         brktebsc10iquIU206K7riN5ZlYbx4rkmMzpfcEE1M5fIyHEGSXyBdY4+WRFMpvZn7gW
         Vn6oQzoeLM0IS0ILUMWmlFdkHUzGJ18HnC6DI5Zf3SuscVl0h/Bz8KAo0eIymDctvcPc
         xgUVKy1qp6TiB1D7SbJ3DW70Qqe7K229GggKd9pmOaOIqWHw615M0lJ2O6yE9CQyGcl3
         z17WmqVx9k6KzZfHgpayhGaBIVzRilY1cEXzBYPXp9tHtbQuu5fg5CRDu7qqbnqF+M1L
         9NfA==
X-Gm-Message-State: AOAM533UMpZvmEEVsLVlMUGFZf5ks7SE8iqSUbbMmooB+JvbO7UJbaQR
        GxqE5xAlw28jAaHZCbZZExYvqvGR+sGTnQ==
X-Google-Smtp-Source: ABdhPJyroxk5j3uozX4q/49k3ilXtr3HfELI1nHsLBO+uoSc7N38F15qJ9kCIb5kPorMtxomgTZJxQ==
X-Received: by 2002:a17:902:8a97:b029:d4:d3f4:d209 with SMTP id p23-20020a1709028a97b02900d4d3f4d209mr500321plo.35.1604643279370;
        Thu, 05 Nov 2020 22:14:39 -0800 (PST)
Received: from localhost (114-34-18-97.HINET-IP.hinet.net. [114.34.18.97])
        by smtp.gmail.com with ESMTPSA id y5sm620227pfc.165.2020.11.05.22.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 22:14:38 -0800 (PST)
From:   Ajye Huang <ajye.huang@gmail.com>
X-Google-Original-From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
To:     linux-kernel@vger.kernel.org
Cc:     Mark Brown <broonie@kernel.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Patrick Lai <plai@codeaurora.org>,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        srinivas.kandagatla@linaro.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, robh@kernel.org,
        Jaroslav Kysela <perex@perex.cz>, cychiang@chromium.org,
        tzungbi@chromium.org, dianders@chromium.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org,
        Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Subject: [PATCH v6 0/2] Modify documentation and machine driver for SC7180 sound card
Date:   Fri,  6 Nov 2020 14:14:31 +0800
Message-Id: <20201106061433.1483129-1-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Note:
- The patch is made by the collaboration of
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>
 Cheng-Yi Chiang <cychiang@chromium.org>

v6:
- Documentation: Addressed suggestions from Rob Herring.
  - Define "maxItems: 1" in dmic-gpios property.
  - Only keep one example and add dmic-gpios property in.
v5:
- Machine driver:
  - Fix a format string warning (Reported-by: kernel test robot <lkp@intel.com>).
    detailed info at https://lore.kernel.org/patchwork/patch/1331087/

v4:
- Machine driver: Addressed suggestions from Tzung-Bi.
  - Remove redundant judgments in dmic_set() and dmic_get().
  - Remove 1 level indent of judgment of IS_ERR(data->dmic_sel).

v3:
- Machine driver: Addressed suggestions from Tzung-Bi.
  - Move variables "dmic_switch" and "dmic_sel" into struct sc7180_snd_data.
  - Remove redundant judgments in dmic_set().

v2:
- Documentation: Modify the dimc-gpios property description and examples.
- Machine driver: 
  - Remove "qcom,sc7180-sndcard-rt5682-m98357-2mic" compatible
  - See gpio property and use anadditional control.

Thanks for the review!

Ajye Huang (2):
  ASoC: google: dt-bindings: modify machine bindings for two MICs case
  ASoC: qcom: sc7180: Modify machine driver for 2mic

 .../bindings/sound/google,sc7180-trogdor.yaml |  8 ++-
 sound/soc/qcom/sc7180.c                       | 61 +++++++++++++++++++
 2 files changed, 68 insertions(+), 1 deletion(-)

-- 
2.25.1

