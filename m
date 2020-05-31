Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1490F1E999A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2020 19:47:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728166AbgEaRrD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 31 May 2020 13:47:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726193AbgEaRrC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 31 May 2020 13:47:02 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43A85C061A0E;
        Sun, 31 May 2020 10:47:02 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id x14so9247660wrp.2;
        Sun, 31 May 2020 10:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0igUM99u6qi0G2V9QHiKNIc+/Cm62S0GvQJm5Z6yraI=;
        b=eP15yulHnOheIw44ncZUq2rVU/kWIIjQ51dynpgDc7ik+73HqCU6wNUlwCxROjyqFT
         eCiV7qFJSjAfnfbwBs129WmT45YHyv0LEg/bdKmiS+IuRTR24PzFIGW6ujzHtYtVSABr
         3OjuzaaLvJuQ0AKHOwoAvFe45B6H2sBtY/2NpEUtmu8sC18ZVQSF09fe+kchygYwYtgd
         BIFMAI2LsFCNP1bFED3IBO4ruIGhcZXXFSMKNz8a8bm9YIGNeE1DycoTMIyTfSs+nyRb
         MIHsqEn/Pz4L0zVREX3R92OSRkogU/Af0WkTFIa0A1CSk54JnzG0ar5zxDq2lzrnY/hK
         +ugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0igUM99u6qi0G2V9QHiKNIc+/Cm62S0GvQJm5Z6yraI=;
        b=FLpNTlgVwpFTFlnfwDpuvr3/seW/KwNwY+34P/yEFyLaCYrdd8Pveo93ZQpIBHQHof
         N4kD0219dZbNo4nur5mHPx5VrSryBQEjAxTyd9u+er1YcLMzfG7iR6031YoSOVOU1e9S
         DANYcIcbu/LD8rpYI/vOP0q4a7dI95nSgogcegzvS39GAbOC/hHaup1TFX7Wm089hZ6J
         8+FVAnVcHGKU6dM46re4Jlw5lRgizJXC/aP9vDx7LZqb4Xv5hi8Xh3lq5ECtvelpYTK6
         I1nTcNVgpwlihekHehd7Cqfa37z0Fsep5Qw0Ur1ca7VjF+YMUptUSkT2K1/dvi9VF6wH
         7eLw==
X-Gm-Message-State: AOAM530xuXoYbviKXWTE7xtDKmTkj+71qzPqYONJ0IVNVYqwTboUa+nV
        Brapqvkhj2lcL8XypXJ3UWs=
X-Google-Smtp-Source: ABdhPJyTv1d7YcEb2pEVi4URbVPgL7HdLi/EU2CphoV+LO8URSwLmHF+DGnvsNadjC5gRxVvj2pwYQ==
X-Received: by 2002:adf:80f0:: with SMTP id 103mr17371010wrl.232.1590947220924;
        Sun, 31 May 2020 10:47:00 -0700 (PDT)
Received: from localhost.localdomain (abad130.neoplus.adsl.tpnet.pl. [83.6.167.130])
        by smtp.googlemail.com with ESMTPSA id x186sm9716494wmg.8.2020.05.31.10.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 10:47:00 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] Add msm8992 GCC driver
Date:   Sun, 31 May 2020 19:46:06 +0200
Message-Id: <20200531174612.260113-1-konradybcio@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This SoC is very similar to msm8994, but features
less clocks (as in no UFS or PCIE1-related ones,
for example). This implementation also adds support
for GDSCs and resets, which are lacking in the current
8994 driver and I can't test them over there, as I don't
have a device featuring that SoC. Qualcomm also 
separates 8992 and 8994 drivers on downstream kernels,
so I find this appropriate.

Konrad Dybcio (4):
  drivers: clk: qcom: Add msm8992 GCC driver
  Add compatible strings and the include files for the msm8992 GCC.
  arm64: dts: Adjust msm8992 DTS to use the correct GCC driver
  driver: clk: Add msm8992 GCC Kconfig and Makefile entries

 .../devicetree/bindings/clock/qcom,gcc.yaml   |    2 +
 arch/arm64/boot/dts/qcom/msm8992.dtsi         |   15 +-
 drivers/clk/qcom/Kconfig                      |    8 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/gcc-msm8992.c                | 2429 +++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-msm8992.h  |  144 +
 include/dt-bindings/reset/qcom,gcc-msm8992.h  |    8 +
 7 files changed, 2600 insertions(+), 7 deletions(-)
 create mode 100644 drivers/clk/qcom/gcc-msm8992.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-msm8992.h
 create mode 100644 include/dt-bindings/reset/qcom,gcc-msm8992.h

-- 
2.26.2

