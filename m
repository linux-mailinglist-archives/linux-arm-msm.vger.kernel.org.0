Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E3A0D7348
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2019 12:32:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727401AbfJOKc0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Oct 2019 06:32:26 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:46849 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726208AbfJOKc0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Oct 2019 06:32:26 -0400
Received: by mail-wr1-f66.google.com with SMTP id o18so23129796wrv.13;
        Tue, 15 Oct 2019 03:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I/wKc+Pjte2XbHpY4kvGChrZIbJ70t+PxjeaF2HYxAg=;
        b=rhomInVpEmCg0wyWWTNRYWZ6ZxyrAzeWlhIcONfG/hBWknQFX1yChnneZQd3EyJlqn
         MrFItBE+YpjZIyAhRb7zcFeV0f9xVUx1f8QWlS3eWPWO9k1jJZ2JoLOqrJAcM2uNtV20
         qIiPihqbfxpM2TmbWe4zZ1AJRe1o2Pqap/+RxAOmCqKp3NsL5QUg1pBjB41H+9wcqJ46
         Qc5kZptfaVeA6QwugMVDug/3WLvGHkeKJ32XfrrfC1cPMxzcN2huyze0LCfVp4jN+4ba
         2aIJjJsuEecGoyNOGwiM5Cx0KBLjSAZGDqYo1NxrFyncitcrosFiWZMUCZ/QswMCdpPs
         iRfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I/wKc+Pjte2XbHpY4kvGChrZIbJ70t+PxjeaF2HYxAg=;
        b=soFATKVngkAHqJDN7lUJscSImZ1W+8NaPi5OOhhQdlK2e7MSXxqexhbTPEozXm/BQD
         7oPTPmroXZtVriva/RQvilMrAMfAzci6h1VaiMn/I+1J+V5WEPwVnEefkm3iRXtFUu61
         sVHwPQpqmFjKydwa/b1ueVqpgRcyu67UopRHZ/hJiJMVUhC3BEKhTM9tgw5GMTW4Igk+
         0Di/S2M7mWUABt2ACQu6w3/azs5mzdRm4jXgJzZlLAzJweGET2914/oAOFeJGuC9AMc2
         iZXMwArDi5ZPNjUWEE+lk9FB8roXcWZlfAwiVxsAhJ5vwRqHt/bYiyGTHX2VtZBbNPUx
         Egog==
X-Gm-Message-State: APjAAAVioC9+7d8Hj3qJutJNfkq/rm7KxQ7ZpGlJe206IeVy3ksVwAMA
        kfdsQF5nEOL16qXmUt19rlqvUIjnCjk14w==
X-Google-Smtp-Source: APXvYqw7jYFEa4gsj/gRlaijhnuvCFkaVum2R6M5+YfLOC0Ej+ve8eVDrrz7x+aP01j4M+FlRj8waQ==
X-Received: by 2002:a5d:674e:: with SMTP id l14mr28820354wrw.45.1571135543514;
        Tue, 15 Oct 2019 03:32:23 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id c6sm22751699wrm.71.2019.10.15.03.32.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Oct 2019 03:32:22 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        mark.rutland@arm.com, robh+dt@kernel.org, sboyd@kernel.org,
        mturquette@baylibre.com, agross@kernel.org,
        bjorn.andersson@linaro.org, marijns95@gmail.com,
        AngeloGioacchino Del Regno <kholk11@gmail.com>
Subject: [PATCH v2 0/2] Global Clock Controller driver for MSM8976/56
Date:   Tue, 15 Oct 2019 12:32:19 +0200
Message-Id: <20191015103221.51345-1-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

This is the Global Clock Controller (GCC) driver for MSM8956,
MSM8976 and APQ variants and it has been tested on two Sony phones
featuring the Qualcomm MSM8956 SoC.

This driver is responsible for providing clocks support for also the
MDSS and GFX3D, as these clocks are located in the GCC space here.

The personal aim is to upstream the MSM8956 SoC as much as possible
and, at the end, to add support for the Xperia X, X Compact and if
feasible also the Xperia Touch projector (APQ8056).

Changes in v2:
- Rebased onto linux-next 20191015
- Fixed platform driver name (qcom,gcc-8976 => gcc-msm8976)
- Splitted changes to dt-bindings to a separate commit

AngeloGioacchino Del Regno (2):
  clk: qcom: Add MSM8976/56 Global Clock Controller (GCC) driver
  dt-bindings: clock: Document MSM8976 gcc compatible

 .../devicetree/bindings/clock/qcom,gcc.txt    |    1 +
 drivers/clk/qcom/Kconfig                      |    8 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/gcc-msm8976.c                | 4215 +++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-msm8976.h  |  293 ++
 5 files changed, 4518 insertions(+)
 create mode 100644 drivers/clk/qcom/gcc-msm8976.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-msm8976.h

-- 
2.21.0

