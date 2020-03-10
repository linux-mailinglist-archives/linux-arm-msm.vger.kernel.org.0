Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B612118021B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2020 16:44:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726445AbgCJPoB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Mar 2020 11:44:01 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:32776 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726315AbgCJPoB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Mar 2020 11:44:01 -0400
Received: by mail-pg1-f195.google.com with SMTP id m5so6486826pgg.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2020 08:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Xni0YMnXezsFGTeUgEf4M3Fw4UAep4znIhY5+89pc7c=;
        b=NmvS7ouPivSfaeLyNoamlTqUAre20DSjviVyELT04fVLTqJY+cqtT+C4DIrjB5EdOh
         x7xmi17GzzdPu6q3nJ20O62xo8MRLSMyZeKJfPZdzHGz57nSj/bpUdASitiwhBPvjo7I
         5ChfRRTRp3Ver3FLKPIspYIhbZiArEUViDYos=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Xni0YMnXezsFGTeUgEf4M3Fw4UAep4znIhY5+89pc7c=;
        b=K+OONxPlA9hfidASufR9y8kkZk4RYHz5ZFBc0DXdigwuKB56T4oUj6RkaJcf1aWSwZ
         vpp4aow+j33GkoaMRQ8t1NZzvwLZyzCTWvZb+QZET89kt39pVzFqTBy1TD17b/xltE0a
         bjM1CFmzzY4EKe7lx/eip3SfEvrlpug4Fj6gBYB/2mCCyUDOmNXXpxo0G2DaFeAKuGmv
         q4uUBg//PpyUFsnGuQoY58zvhg+y6AzBsL25AUhfDVDowQMIYroT1Zq/2KsX4LAlagSU
         W7wkuei9ne5eqD66x+e3Gjz4lRprk0qC5hE4zqp2S5bCHqJ/svRoiiPecne8M8gJX4Sm
         5RFA==
X-Gm-Message-State: ANhLgQ2GJDl9LN6jL8kOrV65OWfjvZ/Q5KIIdokjdNn9nNOJC74IKR8V
        gbqqzm6OMJwRgEQHht43HtXAfQ==
X-Google-Smtp-Source: ADFU+vtm1q7lynSdly97Ecu4eD8ZY1rhs3jLKZ2SwYbl+1M/Bh8cn86sOV0C5VfaIx8al2st5nrmgw==
X-Received: by 2002:a63:d18:: with SMTP id c24mr21557269pgl.218.1583855040357;
        Tue, 10 Mar 2020 08:44:00 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id m12sm2731090pjk.20.2020.03.10.08.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 08:43:59 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 0/3] Misc qcom geni i2c driver fixes
Date:   Tue, 10 Mar 2020 08:43:55 -0700
Message-Id: <20200310154358.39367-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Here's a small collection of qcom geni i2c driver fixes that
simplify the code and aid debugging. 

Changes from v1;
 - Simplified code some more and commented about platform_get_irq()
   in commit text for patch 2
 - Picked up reviewed by tags
 - Fixed first patch to use &pdev->dev so it keeps compiling
 - Rebased to v5.6-rc5

Stephen Boyd (3):
  i2c: qcom-geni: Let firmware specify irq trigger flags
  i2c: qcom-geni: Grow a dev pointer to simplify code
  i2c: qcom-geni: Drop of_platform.h include

 drivers/i2c/busses/i2c-qcom-geni.c | 58 ++++++++++++++----------------
 1 file changed, 26 insertions(+), 32 deletions(-)


base-commit: 2c523b344dfa65a3738e7039832044aa133c75fb
-- 
Sent by a computer, using git, on the internet

