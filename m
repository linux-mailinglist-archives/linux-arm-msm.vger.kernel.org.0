Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA5E125A3DC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Sep 2020 05:14:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726174AbgIBDO4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Sep 2020 23:14:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726310AbgIBDOx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Sep 2020 23:14:53 -0400
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 050A9C061246
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2020 20:14:52 -0700 (PDT)
Received: by mail-qk1-x734.google.com with SMTP id o5so3104770qke.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2020 20:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UlbLWlkMVESoevFIWT1sNbNt8fHmHBsQCFMt8PDJq9U=;
        b=faFMq5I2m3KPU2uraA7f990AlH5Kk1unL9mEVC3rhS1hpQBKeOZMJzc5i207HjiJyP
         /LNh3z3Cicj7HYmrCp/qo+nLjseg4TGrp5Y53qDdVYvCY+NLN/d7m1HE/WINcV5EwS4h
         cFqnWhFr8uBKuLQCo7eS1foqCCQdZW16LewbJSdiHaelnXRaOZUyZrN9Pj4S7lbYsdTc
         dZ+C0CEwaHpbfENbARNSVg0Jce/V0UGEN3uKBkd8smLkJggsph1pjlXVg7Jmjv8iVvXH
         M10kgU6i6ayLGyKIS2BdQ39B9e50G5SNSdmu3aGz8An+BzoQSnNhpKBvbUquG8Al1Two
         mFtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UlbLWlkMVESoevFIWT1sNbNt8fHmHBsQCFMt8PDJq9U=;
        b=RFHTrmeZPC977eb5YobgmMuQHZj2gmSf1McwVfM1keMaBQ4xGULcXfyjy7kjr6XC0n
         /YAzd9dRDGKXU2Q19Fcu+zJX18gUolfxEByGAkeg4w38nowU3byadfrqkMoogW8zz3G1
         DWFZYc+82qgsNMwiQ0QgRrtNa0krpoHA4Pg6KX+vmBnhRDJvG7JR3svSpyXLClN8m0mm
         Cna5WM7MzAyAGOcOjnLCuc3Xq/NOPSVSPAsiqfJehykDUUY7XHlpK/AlYWvMcZVOHwk9
         VCJqTVxsUHsYBZy52JDXlU7IA8RAFjBFLT9PHqaTLdW1G2l0mW1//fmLPSNSWdp1+vjo
         qGBg==
X-Gm-Message-State: AOAM532/vvFWoHsSJoqBRnbJq9I7gWKIrjL1hJlEXhF9itFn+0Iitp2O
        1MVv+hh4+ttKDQX/4pUNtsVn7XdblQH84M52Olc=
X-Google-Smtp-Source: ABdhPJzmQN78ydD5wyfMB+SzDVzcaoTShsa+fQWtAguBDxr2DV6ZYNi7BqHAMBHSSL3/Uqg7lIj9EQ==
X-Received: by 2002:a37:9b8f:: with SMTP id d137mr4827236qke.459.1599016491705;
        Tue, 01 Sep 2020 20:14:51 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id q35sm3755649qtd.75.2020.09.01.20.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 20:14:51 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS),
        linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
        linux-kernel@vger.kernel.org (open list),
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH 0/5] SM8150 and SM8250 videocc drivers
Date:   Tue,  1 Sep 2020 23:13:50 -0400
Message-Id: <20200902031359.6703-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add videocc drivers for SM8150/SM8250 required to boot and use venus.

Jonathan Marek (5):
  dt-bindings: clock: combine qcom,sdm845-videocc and
    qcom,sc7180-videocc
  dt-bindings: clock: add SM8150 QCOM video clock bindings
  dt-bindings: clock: add SM8250 QCOM video clock bindings
  clk: qcom: add video clock controller driver for SM8150
  clk: qcom: add video clock controller driver for SM8250

 .../bindings/clock/qcom,sc7180-videocc.yaml   |  65 ---
 ...,sdm845-videocc.yaml => qcom,videocc.yaml} |  20 +-
 drivers/clk/qcom/Kconfig                      |  18 +
 drivers/clk/qcom/Makefile                     |   2 +
 drivers/clk/qcom/videocc-sm8150.c             | 276 ++++++++++
 drivers/clk/qcom/videocc-sm8250.c             | 516 ++++++++++++++++++
 .../dt-bindings/clock/qcom,videocc-sm8150.h   |  25 +
 .../dt-bindings/clock/qcom,videocc-sm8250.h   |  42 ++
 8 files changed, 894 insertions(+), 70 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,sc7180-videocc.yaml
 rename Documentation/devicetree/bindings/clock/{qcom,sdm845-videocc.yaml => qcom,videocc.yaml} (63%)
 create mode 100644 drivers/clk/qcom/videocc-sm8150.c
 create mode 100644 drivers/clk/qcom/videocc-sm8250.c
 create mode 100644 include/dt-bindings/clock/qcom,videocc-sm8150.h
 create mode 100644 include/dt-bindings/clock/qcom,videocc-sm8250.h

-- 
2.26.1

