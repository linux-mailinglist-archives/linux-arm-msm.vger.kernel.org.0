Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3D993AFA37
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 02:39:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230028AbhFVAmB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Jun 2021 20:42:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229762AbhFVAmB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Jun 2021 20:42:01 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9161BC061756
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jun 2021 17:39:45 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id w71so5013168pfd.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jun 2021 17:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=pqUpRkhcnAMty1ieLynY9A7gMQczSuaUqnjg9ANrosY=;
        b=KBCXSvGfi/tgiLovusaSZA0BT226Xc8G4C8/2U7x09bcN6CzNi2eg1HoHu5KBlz9aa
         6mE0Vn7SfJJKuYrVvairbVErpDxbGxr7WAy2dIqsNUCreBfaVHZV2/FrA4j103YbBfay
         TGlnHL1LbQ7L+Z9uHPVQmSDF9suIDri8tPvGogQJVaz6f9p5Lclr9XMQpPdcFQ6+BMwt
         lYvACo3/0YfnYHJDju7AvPDx4TLoYx3Hax7hCa3QwxpFSVpnnatnCOK2d22s3dxcXLf8
         iTAUHhfpxUCfS5pqVkLCO94wvmvZYz0EzZCTKnGUzftV4EXVDknPBLTTPdC8DL+AhiPQ
         Auuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=pqUpRkhcnAMty1ieLynY9A7gMQczSuaUqnjg9ANrosY=;
        b=IMdyVL+A1InQuDUK27r2n/Nyys6tgoekXAlGEyp4J30fwaAUESY/2k2Z13DhiJyRwe
         YwyM4MNajwGpRz2GACCmlBA87R7FYsbT5vpBxaAexmfg7Oztk/0yyZZ7/W0fKVS4ozPM
         VaYi+5tW4Fs2gr9sv4IeMEFR6dd0VwzNS96MYVZzr3EAiXqdG7JEMdRkoqiyOHnjx2IT
         ufDMXZ4Gnh0XmG92f6VzCTeJuEu8omEgS0RPGhlUuHGBA6/SMnEFA20SS99COPhGNPPY
         0dM6vE8tkg9bU1/vWV5cXcRk6L9l62ztmFRjEeX6NE6eyQSEHkIVV5SXsT6nhTA3ltGZ
         PEng==
X-Gm-Message-State: AOAM532LuMnE5Relm3GVmgoDDk/Wn15urppU94qBYZZo1g/gx5rU3Ozy
        gE03yJaDW6nj9qmr8ocZQ1H10w==
X-Google-Smtp-Source: ABdhPJwS1Om4eMmDHOw6g2bM/rwS8s2wGA5OmRs4kA6Os6DjgkA/4JXLJpLWzzX67KtcnWtsWwlmUA==
X-Received: by 2002:a63:e14:: with SMTP id d20mr1132215pgl.35.1624322384963;
        Mon, 21 Jun 2021 17:39:44 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id h11sm17722762pgq.68.2021.06.21.17.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 17:39:44 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Jassi Brar <jassisinghbrar@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Benjamin Li <benl@squareup.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v3 0/3] Add MSM8939 APCS support
Date:   Tue, 22 Jun 2021 08:39:16 +0800
Message-Id: <20210622003919.10442-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It's a series to add MSM8939 APCS support into qcom mailbox driver.

Changes for v3:
- Separate PLATFORM_DEVID_AUTO change from MSM8939 enablement.

Changes for v2:
- Add MSM8939 APCS compatible.
- Reword commit log.
- Add Bjorn's Reviewed-by tag.

Shawn Guo (3):
  dt-bindings: mailbox: qcom: Add MSM8939 APCS compatible
  mailbox: qcom: Use PLATFORM_DEVID_AUTO to register platform device
  mailbox: qcom: Add MSM8939 APCS support

 .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml     | 1 +
 drivers/mailbox/qcom-apcs-ipc-mailbox.c                        | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

-- 
2.17.1

