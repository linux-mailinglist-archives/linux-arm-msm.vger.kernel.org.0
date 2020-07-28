Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E500D230956
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jul 2020 14:00:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729348AbgG1MAz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jul 2020 08:00:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728433AbgG1MAz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jul 2020 08:00:55 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D923BC061794;
        Tue, 28 Jul 2020 05:00:54 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id y10so20395495eje.1;
        Tue, 28 Jul 2020 05:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U1+l6khR5WEgvOR/QZzKuHUQUvz26GVnRqvOBKPa+Ig=;
        b=Cb8xHECisgxMI9BTnvqRvZP+7vKvwzS4JS6Rhk2Ik8HhAQQMxqaKo0TJ0nl1uWgIpW
         VbXK8r2vM3FY9oqWWJ98hhYUg40cszGAuL4D8R1ApJIG+xHEwmhLwEJ+oxjqWDdwQlrp
         XoBy7SweEFWlzlQtQbsGkMmHYVBRNIVCuSFV7LnlvzaTuanqGZsye1oIWtOB8qT7qDf2
         RiupBmERD5+dyGR0BiftJ0D1r9F1lTx0YisvWk19oZmUc6XtYNQp79kIx0kvZhsbL7lV
         ZzKb+VT0vvZSplXrIc1G6yzZ67bolIK4Vm1L7+ct3DeXe+aX9sLHZvPPWeDPQBvU/M/q
         ruwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U1+l6khR5WEgvOR/QZzKuHUQUvz26GVnRqvOBKPa+Ig=;
        b=gbb0ao97Y3cZ1JdFdOCklWdQZjDdj1pE4Q9ObdU9RWPLa6HhgWynRB9VIhohpZKVrd
         liJemtRA3qnUFKPErXl4YXR5VLZ+z239CKtvKQANztA9TdDMz8JIQb9zHxB6yghntpmN
         dnBHWP/324JAiqi8RB8ubqRR0Iykw4HKCR/MPHOrm6zq8HA0xSemnuFin/bxV1bKa/+a
         AgCNQwE443baxdJIVUgDVl3yYT99ig+61w9/50DgWto19zC7VIY5OKJNvszhf3FEuhLu
         aueJffTIP5KcnvT6E3kE3Jp5pSiIW26rumW5IpSPEITVC40gi94U2I6F/ollnGZ43c3C
         Yh0Q==
X-Gm-Message-State: AOAM530ZZcUqrsDy9x0KUbycJaXLl+bOFSUU0dT+yQOoH4P8LnMrKYZX
        EeixStkQypIsbrObHQvzAqs=
X-Google-Smtp-Source: ABdhPJxlN/0QPTsiHNWeYZHn5E08xNHKQc5xzCIEGu0HQEKO2OhckRJZqPbvvALD8H3dobgZtRTPcQ==
X-Received: by 2002:a17:906:12cd:: with SMTP id l13mr18815289ejb.385.1595937653613;
        Tue, 28 Jul 2020 05:00:53 -0700 (PDT)
Received: from localhost.localdomain (abad207.neoplus.adsl.tpnet.pl. [83.6.167.207])
        by smtp.googlemail.com with ESMTPSA id m20sm9066959ejk.90.2020.07.28.05.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2020 05:00:53 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     konradybcio@gmail.com
Cc:     lauren.kelly@msn.com, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH 0/9] msm8992/4 updates
Date:   Tue, 28 Jul 2020 14:00:39 +0200
Message-Id: <20200728120049.90632-1-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series brings support for:

* sdhci2 on 8992/4
* BLSP_I2C1 (a seemingly WP-exclusive i2c bus) for 8992
* Synaptics RMI4 touchscreen for Sony Kitakami and MSFT L950
* DWC3 USB for msm8992/4 (doesn't work on Lumias, they use custom
circuitry)
* Missing clocks for 8994 GCC needed for USB

Konrad Dybcio (9):
  arm64: dts: qcom: msm8992: Add support for SDHCI2
  arm64: dts: qcom: msm8992: Add BLSP_I2C1 support
  arm64: dts: qcom: talkman: Add Synaptics RMI4 touchscreen
  arm64: dts: qcom: msm8994: Add USB support
  arm64: dts: qcom: msm8992: Add USB support
  clk: qcom: gcc-msm8994: Add missing clocks, resets and GDSCs
  arm64: dts: qcom: kitakami: Add Synaptics touchscreen
  arm64: dts: qcom: msm8994: Add SDHCI2 node
  arm64: dts: qcom: kitakami: Enable SDHCI2

 .../dts/qcom/msm8992-msft-lumia-talkman.dts   |  28 ++
 arch/arm64/boot/dts/qcom/msm8992.dtsi         | 124 ++++++
 .../qcom/msm8994-sony-xperia-kitakami.dtsi    |  49 ++-
 arch/arm64/boot/dts/qcom/msm8994.dtsi         |  89 ++++
 drivers/clk/qcom/gcc-msm8994.c                | 388 +++++++++++++++++-
 include/dt-bindings/clock/qcom,gcc-msm8994.h  |  36 ++
 6 files changed, 712 insertions(+), 2 deletions(-)

-- 
2.27.0

