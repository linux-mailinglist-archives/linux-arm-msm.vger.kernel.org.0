Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB0F020A471
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2020 20:13:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405969AbgFYSNJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jun 2020 14:13:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405949AbgFYSNI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jun 2020 14:13:08 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A3EFC08C5C1;
        Thu, 25 Jun 2020 11:13:08 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id cy7so4932835edb.5;
        Thu, 25 Jun 2020 11:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qjRECT/og8CiMkjcDFR8HLBkQLY1B4U/hy+Z/zDlSkU=;
        b=t27txQYMxlj/zCucGsF07tLWjNTGGi77bSyp6qtCbh0LiGuGz8XHqhviRQRERbXuAK
         7UXeuZd6GuxC9TgqS7ThJboloEk6p5m0aC1LIeNOO09lwMzUDQPFkU3VXzmsTEAMmsz2
         BbftHMcuz8OTERQPmN0gt9pEROP8ZBJ6yABfGpNjAgvf3OrjbRInQvxW8OqSFnI5S3X6
         j7hu8rqXL0xwRM7xMHstNFsMmgrvsDTaf8fAX8QGYdZB3wybcA2NuHCRkHHh/0ziO9oi
         f1hdKDMOyZv3mfZ51f0xNerlXrXl8GR5F7n9nBVj0708Jl8vnLjg1CCiuXU9/pUn6L8I
         Y97w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qjRECT/og8CiMkjcDFR8HLBkQLY1B4U/hy+Z/zDlSkU=;
        b=kj2jHPzLxcZERhLLvDJRfJMWXhN7NkPSpQqtsjuugHYDUkC78ifLmtWGN6m5Nmpgcz
         reS5xEqYCHyOWbRQiZgXv9jtnNjrNTt5E6TfYsiLhbaN4iietHHElCycHuUlX6AbqLWL
         NDjtD3WhYR4RQQTKt0KXutuJDF1SeizhP49e0JXzASag/XyEPK9rGwBP4iXbguNHJjPx
         B6bEC2M9qdrV4AJfjdjTZhNHtU9ZUpHusgWOrxfgijJxv5dDMYbG7sidhd6RI6tOvpPj
         BZWEZct1NorBvZ7pol86vpqAQfCXfUNd1I0cjk5F0pdY4Lh/R4Lq5OFUDYcIMo8ox51a
         LE8g==
X-Gm-Message-State: AOAM530tOyHJ8llJqgXhBqNGl9HTG/K5mCsGFNotMvA20Nn4J8wNWixA
        JRdN/gl6BPLCjX8w8W+TSEE=
X-Google-Smtp-Source: ABdhPJza+JMIeHSK9Q5smDNzCzouWe0mc0sLljzLvJEb6mMrM5Dx+AeOBnUvDIshudt39YwWIltp+w==
X-Received: by 2002:aa7:c6d3:: with SMTP id b19mr6538667eds.207.1593108786672;
        Thu, 25 Jun 2020 11:13:06 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id p4sm19511112edj.64.2020.06.25.11.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2020 11:13:06 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/13] msm8992 DTS updates, peripheral enablement
Date:   Thu, 25 Jun 2020 20:12:48 +0200
Message-Id: <20200625181303.129874-1-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

changes since v2:
- drop some superseeded patches
- reduce the amount of commits
- modernize the 8992 dts
- add libra and talkman DTSes
- do some housekeeping and fix minor issues

Tested on Libra and Talkman. Bullhead *shouldn't* break.

Depends on my 8994 patchset [1] (because of compatibles
and 8992-related SMD RPM patches) and my RPMCC patch [2].

[1] https://patchwork.kernel.org/project/linux-arm-msm/list/?series=307939
[2] https://patchwork.kernel.org/patch/11622057/

Konrad Dybcio (13):
  arm64: dts: qcom: msm8992: Modernize the DTS style
  arm64: dts: qcom: msm8992: Fix SDHCI1
  arm64: dts: qcom: bullhead: Add qcom,msm-id
  arm64: dts: qcom: bullhead: Move UART pinctrl to SoC
  arm64: dts: Add a proper CPU map for MSM8992
  arm64: dts: msm8992: Add a SCM node
  arm64: dts: qcom: msm8994: Add SPMI PMIC arbiter device
  arm64: dts: qcom: msm8992: Add BLSP2_UART2 and I2C nodes
  arm64: dts: msm8992: Add PMU node
  arm64: dts: msm8992: Add PSCI support.
  arm64: dts: qcom: msm8992: Add RPMCC node
  arm64: dts: qcom: Add Xiaomi Libra (Mi 4C) device tree
  arm64: dts: qcom: Add Microsoft Lumia 950 (Talkman) device tree

 arch/arm64/boot/dts/qcom/Makefile             |   2 +
 .../dts/qcom/msm8992-bullhead-rev-101.dts     |  20 +-
 .../dts/qcom/msm8992-msft-lumia-talkman.dts   |  39 ++
 arch/arm64/boot/dts/qcom/msm8992-pins.dtsi    |  90 ---
 .../boot/dts/qcom/msm8992-xiaomi-libra.dts    | 364 ++++++++++++
 arch/arm64/boot/dts/qcom/msm8992.dtsi         | 522 +++++++++++++++---
 6 files changed, 852 insertions(+), 185 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8992-msft-lumia-talkman.dts
 delete mode 100644 arch/arm64/boot/dts/qcom/msm8992-pins.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts

-- 
2.27.0

