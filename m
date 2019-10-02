Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 337EDC4559
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2019 03:16:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726030AbfJBBQC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Oct 2019 21:16:02 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:43958 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725908AbfJBBQB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Oct 2019 21:16:01 -0400
Received: by mail-pg1-f194.google.com with SMTP id v27so10928072pgk.10;
        Tue, 01 Oct 2019 18:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=kpRlZJBA/zoGmo3ahdlz4aLv85G9pOPiIxFk3v2Drnw=;
        b=dzJ3fS3XY+Lo0Yt3AmKzq5v+c90mPwAqD369It+GKDkjh3g6k1a0PZvbpSwdJCDT+w
         pOfL/Mq3ArboPWQyspp2ilSbItGF3xoHMT4NOtL6J8RO70ThKkI5NuCstY3M0th4/5g3
         3MG/u/zBbCiKvmEygYB2SPix9nlf+za8/eDNiTXcAm3qAvNbq41b0HcPHqDjyNqj7JMY
         JqHP2wBLFAQ3CnpKAe/FfkwGUySTjYUo6/NyFmihnlc+qf2T3p8w99oErDfDRGFNowAk
         n2ks1mc+u8jmE0+vYJAwP4XdMZFFs6Yb04mIn6ooY68iKsTpuLdUHyJZozD51vws0Urw
         7T8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=kpRlZJBA/zoGmo3ahdlz4aLv85G9pOPiIxFk3v2Drnw=;
        b=UV+w4XNN/MPCwrM88OfVm9hSUR5fKh1pP8r7B9do8b2/4EH5uWzmZLKH+YZB+Wu+Iu
         gy5j3c4tfKPy72GCF/b2muBqiX3aCNsiyGUu3sYSktggSCQ+3kfcGzhzi6jzzdOcOxTx
         Jq2bW8sc6QqImlM4hPpHY3lLlDPNzymp4FmWgRrCTNVo6UjdANGMrGVkGBmeCkt55li3
         BmG4PrXsGSDah6p79cfvN+lwJQxTrA4JK1TsmhtOql1KQHhpeugq8BD3dSIxSrC/eJyU
         +EStwTE7DFaMa/JNrwtrnISrOCw+n7jZixA9p4NfQ+694MoQaiKSHSVRf5cmS4YAPm3e
         fdLw==
X-Gm-Message-State: APjAAAW820wNbAXwG+NokJGnH3jtoSSEbdis8aTPyMXPpdEispWV1Hkq
        VRSEthKwhg+kUNDii+Fw4I81dwjO
X-Google-Smtp-Source: APXvYqwOMQ76Sp+Q7cYoRWqg9aMZKHhxOoK76ukFP5Xwp+3whA/aNOeDqcGTCle7wLS7+ZKGBOb/eQ==
X-Received: by 2002:a17:90a:a78d:: with SMTP id f13mr1281793pjq.18.1569978960936;
        Tue, 01 Oct 2019 18:16:00 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id z4sm3723828pjt.17.2019.10.01.18.15.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Oct 2019 18:16:00 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, marc.w.gonzalez@free.fr,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v4 0/2] MSM8998 GPUCC Support
Date:   Tue,  1 Oct 2019 18:15:55 -0700
Message-Id: <20191002011555.36571-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Adreno GPU on MSM8998 has its own clock controller, which is a
dependency for bringing up the GPU.  This series gets the gpucc all in
place as another step on the road to getting the GPU enabled.

v4:
-rebase onto mmcc series
-remove clk_get from the clock provider

v3:
-drop accepted DT patch
-correct "avoid" typo
-expand comment on why XO is required

v2:
-drop dead code

Jeffrey Hugo (2):
  clk: qcom: Add MSM8998 GPU Clock Controller (GPUCC) driver
  arm64: dts: qcom: msm8998: Add gpucc node

 arch/arm64/boot/dts/qcom/msm8998.dtsi |  14 ++
 drivers/clk/qcom/Kconfig              |   9 +
 drivers/clk/qcom/Makefile             |   1 +
 drivers/clk/qcom/gpucc-msm8998.c      | 346 ++++++++++++++++++++++++++
 4 files changed, 370 insertions(+)
 create mode 100644 drivers/clk/qcom/gpucc-msm8998.c

-- 
2.17.1

