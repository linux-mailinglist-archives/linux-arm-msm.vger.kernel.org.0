Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B0B3266242
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Sep 2020 17:36:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbgIKPf4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Sep 2020 11:35:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726508AbgIKPfj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Sep 2020 11:35:39 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C668C061786
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2020 08:35:33 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id v123so10237833qkd.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2020 08:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UB/8wNdkDm3ezMOvTd3hwGm2T0KYN22DgvIUjk5dmqk=;
        b=CX1ZGntTzJQqhGb8UHMy1gSTz3hgRfnUz91q5ex/Yikuwhx7ogSiGkljifjQ7rciTF
         /y9ZxUah6Bpj3v1rF48I8FPmJw01fNRZoiVw5AQr7GGQ6qQu7G+DorXR5P6mb+Nlji0v
         biYsfJfCucNUKwB/2NRsdGjNWevVFCkujjR9zibSPNvvd9eWEcdxKAVxNf0vU3lAlEZq
         suUpseCa4WtCAIS+x0gpjHxl7PmaASJjfLJ7yb12+1cmFinaqDzDT1PXzzqNkHJy0jTL
         oFZ6RDaODLBBF+oakwbC6Wmfio97RF13uhBeNP41Ft+elXuham5hc7/eX14fkhTxtuVw
         VR9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UB/8wNdkDm3ezMOvTd3hwGm2T0KYN22DgvIUjk5dmqk=;
        b=taVvOZKp6X9PQp70zwCd4TOmFcn+r/LEQw+OLqJOxWyAXmoX1ii6S12Ac1jwo+brnl
         daUY99bNuCroxMNhJfp7rVo9npvlnG7Ll7LMFTztVz6I/GGINGcCFPewoaK9HLqyco7M
         1q7raAs0CRucmSaScwnFxd6juYvNdEEjkZF8GJC7z3+wGBdzaZ4mFXLtoTgj8GOxcbzt
         xyjFS6pYBd+/sxc1GCzYxzI+0D6ji2rlzF6xkPhQozrIki7N+LYk/v9hkgQbUyD4LqmT
         R17DsnxdAViCSqxoF+5KgG1FKW7gael8cHkRvk0zfTduj55npGhb1f5tFgMJxYSxVM40
         HJMg==
X-Gm-Message-State: AOAM531ODjccNDvjxp/3rozKce0SUFYjJspU1LCjgpv0xuhJB74/WpVL
        IJJYJLgnajD6VY0wOm8TMI2oYNkGAcdqXPEDkEE=
X-Google-Smtp-Source: ABdhPJxIOGuiAqONyI2gDXdvk31GBfSIxJRtYTLqSi8FdF+FkFeWI7j1Afvd0YeNAoz6A05BlulJow==
X-Received: by 2002:a05:620a:65a:: with SMTP id a26mr1937093qka.424.1599838532062;
        Fri, 11 Sep 2020 08:35:32 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id v16sm3001744qkg.37.2020.09.11.08.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2020 08:35:31 -0700 (PDT)
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
Subject: [PATCH v3 0/7] SM8150 and SM8250 dispcc drivers
Date:   Fri, 11 Sep 2020 11:34:00 -0400
Message-Id: <20200911153412.21672-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add display clock drivers required to get DSI and DP displays working on
SM8150 and SM8250 SoCs.

Derived from downstream drivers. Notable changes compared to downstream:
 - EDP clks removed (nothing uses these even in downstream it seems)
 - freq_tbl values for dp_link clk is in Hz and not kHz

v2:
 - updated dts example to reflect the change (first patch)
 - updated config_ctl_hi1_val in sm8250 dispcc to latest downstream

v3:
 - combined dt-binding: "gcc_disp_gpll0_clk_src" is needed by sc7180 too
 - use the right order in drivers/clk/qcom/Kconfig

Jonathan Marek (7):
  dt-bindings: clock: sdm845-dispcc: same name for dp_phy clocks as
    sc7180
  arm64: dts: qcom: sdm845-dispcc: same name for dp_phy clocks as sc7180
  dt-bindings: clock: combine qcom,sdm845-dispcc and qcom,sc7180-dispcc
  dt-bindings: clock: Introduce QCOM SM8150 display clock bindings
  dt-bindings: clock: Introduce QCOM SM8250 display clock bindings
  clk: qcom: Add display clock controller driver for SM8150
  clk: qcom: Add display clock controller driver for SM8250

 ...om,sdm845-dispcc.yaml => qcom,dispcc.yaml} |   32 +-
 .../bindings/clock/qcom,sc7180-dispcc.yaml    |   86 --
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |    4 +-
 drivers/clk/qcom/Kconfig                      |   18 +
 drivers/clk/qcom/Makefile                     |    2 +
 drivers/clk/qcom/dispcc-sm8150.c              | 1152 +++++++++++++++++
 drivers/clk/qcom/dispcc-sm8250.c              | 1100 ++++++++++++++++
 .../dt-bindings/clock/qcom,dispcc-sm8150.h    |   69 +
 .../dt-bindings/clock/qcom,dispcc-sm8250.h    |   66 +
 9 files changed, 2430 insertions(+), 99 deletions(-)
 rename Documentation/devicetree/bindings/clock/{qcom,sdm845-dispcc.yaml => qcom,dispcc.yaml} (74%)
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,sc7180-dispcc.yaml
 create mode 100644 drivers/clk/qcom/dispcc-sm8150.c
 create mode 100644 drivers/clk/qcom/dispcc-sm8250.c
 create mode 100644 include/dt-bindings/clock/qcom,dispcc-sm8150.h
 create mode 100644 include/dt-bindings/clock/qcom,dispcc-sm8250.h

-- 
2.26.1

