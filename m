Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 932BF30F838
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Feb 2021 17:43:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236811AbhBDQlS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Feb 2021 11:41:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237050AbhBDPAp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Feb 2021 10:00:45 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEAA5C06178C
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Feb 2021 07:00:04 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id y187so3252232wmd.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Feb 2021 07:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YOD9f0gdjmn8Bp720OnZx0t4o9aQAXse7DYeMemoOIg=;
        b=RqOnObk1mmdJc+ozxtz8CO9t/kfB/tloYfdyL52nvxE6xEBc21P0jQECX3MPj3NrHH
         yiWz9Rh4FB3JZOkBo64KFDSSU1ljdNXFYbyo0Ys78PIPSAEA8WggIy6CS8ZL7COPmnMs
         WrfarjSd/LJ0DRJ43LS7AdXkbjao+im/BUfk691WvRMLP/AuZKNPPaPTy9JY5222zEvS
         /r4WTCotf0SpLkddYUNA6dnJPCOLaHD30l+4Pe8HS8kt5MydNYb22KrqP49ciNprbI9A
         4QZmwrZp1rMcoXYaqUZVzGGDNLsudVdXlNRlUdFWriQEwifWEmfN0xDmYjr+j+G1Z8/L
         XE8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YOD9f0gdjmn8Bp720OnZx0t4o9aQAXse7DYeMemoOIg=;
        b=dfK1RqQQYCft/RDGRvwugUzF+e0hhAjFXvH+q5+uY2R7Fkdyzw5P85V/Eyv+oymHuQ
         9Lh6akC8eOrz/sL5aYE/gBZOmJ2HVndlSOGMRhUqxHqItI0k1Yp2EnwPWJLYkfkSe+CT
         hIbSraG+UisxDcR9ah4D+epinvOJ+ZhMWiPbYuZp4THnev7OwRaagoeIUZQWMCNdfG4g
         WSDMFLix2ndmAhM0Dd6Nzk3p8b8/wTazjYvlBivNLZifWv8KVNndOxmuAbyIq2neKacX
         OoiFduBCaE9l1N6FqHIse9K9PVb1R13JJspyfAh8tGAiCPcwGCrpowBKqCC8KZjmlq24
         8cCA==
X-Gm-Message-State: AOAM533GnE2S2irM7X0+A6WujdaUtIpFIWcIWR+Id8mVjNf4KJsYBYg3
        8FQFUEcVqriZbLQADFFDPY1XTg==
X-Google-Smtp-Source: ABdhPJx3veY876rfS8eVAZpWOeqBB1C1rnjWgV1ykEVNJDXZxFL7GBePC8wB5sn4MM5C+cI3mYjmoQ==
X-Received: by 2002:a05:600c:1986:: with SMTP id t6mr7763320wmq.93.1612450803447;
        Thu, 04 Feb 2021 07:00:03 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id c11sm8312664wrs.28.2021.02.04.07.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 07:00:02 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org, agross@kernel.org
Cc:     bryan.odonoghue@linaro.org, jonathan@marek.ca,
        dikshita@codeaurora.org, dmitry.baryshkov@linaro.org,
        stanimir.varbanov@linaro.org
Subject: [PATCH v2 0/4] Fixup clocks for venus on sm8250
Date:   Thu,  4 Feb 2021 15:01:16 +0000
Message-Id: <20210204150120.1521959-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

V2:
- Adds tested-by/reviewed-by as indicated - Dmitry
- Fixes commit log copy/paste typo in patch #3 - Dmitry

V1:
- Adds some missing indices to the videocc index
- Adds videocc clock tree hirearchy for msv0
- Adds a regulator to power the videocc consistent with downstream

Once done we can move on to enabling these clocks in the DTS and switch on
the venus.

Bryan O'Donoghue (4):
  dt-bindings: clock: Add missing SM8250 videoc clock indices
  clk: qcom: videocc: Add sm8250 VIDEO_CC_MVS0_DIV_CLK_SRC
  clk: qcom: videocc: Add sm8250 VIDEO_CC_MVS0_CLK
  clk: qcom: videocc: Add gdsc mmcx-reg supply hook

 drivers/clk/qcom/videocc-sm8250.c             | 39 +++++++++++++++++++
 .../dt-bindings/clock/qcom,videocc-sm8250.h   |  2 +
 2 files changed, 41 insertions(+)

-- 
2.29.2

