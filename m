Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E891554D8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2019 18:47:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730108AbfFYQrk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jun 2019 12:47:40 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:36526 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727501AbfFYQrj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jun 2019 12:47:39 -0400
Received: by mail-wm1-f67.google.com with SMTP id u8so3682134wmm.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2019 09:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ki+VzSGTFsj/B1hWzCc43szZIOhLClWHwnbSYjuQbx0=;
        b=OGyazNNBNrB+Oxr5H3SCK2W5gmDg7OCqH0BGr3evGykb7Z1cB00bHqRvu1QPmqiHao
         EZ2G2i57FL06K52n+NKyDHrDhGoW1tcVm34FHZGbPVuCuYnYL0WfqWdSNSdkISo/nNv3
         TQN8GoipgP5I8Fh9IJCj3B5AqqB6Z7plJ5SiJX+j7KcFVhu0PbmDVGZoA+8T91wbWlUQ
         mpohVIk5Ido1gMrrdufNxXBcUACcipO58yaC8eGizUbHwor6ucl/O66rmRXSm6sW8KvC
         hQU/EvTpNhqIIkHUij37+I7D2IMsPywgcTjf+oMf+tzJXn/3PvHXG0NJ+tIk1lGQ//sK
         6Hhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ki+VzSGTFsj/B1hWzCc43szZIOhLClWHwnbSYjuQbx0=;
        b=NbLy7NJ399jKoeIxSG0zil9CkPYuwiuJ5W3bLrRf6RkYGOoitZnYYHcnV/Bp7Ck2NZ
         gXGMq1jo5pqrBeT7ElzTfi7y9uHYh01n6VJVxYjfMHU00G3C+GRWq3mtTzS/5LafXtsd
         fQTSmUVppdrM/XRRURrmYeKCne8Dxys9whr49Ap/3ssIM6hoZikwstyCUnYH9Qhi6xr7
         Rx5Ju+1MAgWCuQDVqg/Y9+HuCZWL/5W5VHPGx0qMr5F0W3xYU/sYmUEL2I3mOWugAhuE
         DG5/VYtATSty/zmEAHIact0NkcARV9gafUDmXU40VoSnBOg9RFzSawuEdjIQmNm2PbOj
         99Lw==
X-Gm-Message-State: APjAAAW94VgnxWMLGViJ2onZMFpgifyZHBHZWjC2Q1y8yPmlWBEABKIz
        pf7CsIdgMW4YR8CiYr2t9N9hug==
X-Google-Smtp-Source: APXvYqwtk11JIcLLQM6ZDLdonAWIlN0qcsSARfkrWxoExBaOvGl9oUIlARyhIXJM0RSZZegPcS6l3w==
X-Received: by 2002:a1c:39d6:: with SMTP id g205mr19367540wma.85.1561481257696;
        Tue, 25 Jun 2019 09:47:37 -0700 (PDT)
Received: from localhost.localdomain (30.red-83-34-200.dynamicip.rima-tde.net. [83.34.200.30])
        by smtp.gmail.com with ESMTPSA id d18sm42594476wrb.90.2019.06.25.09.47.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 25 Jun 2019 09:47:37 -0700 (PDT)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, sboyd@kernel.org,
        bjorn.andersson@linaro.org, david.brown@linaro.org,
        jassisinghbrar@gmail.com, mark.rutland@arm.com,
        mturquette@baylibre.com, robh+dt@kernel.org, will.deacon@arm.com,
        arnd@arndb.de, horms+renesas@verge.net.au, heiko@sntech.de,
        sibis@codeaurora.org, enric.balletbo@collabora.com,
        jagan@amarulasolutions.com, olof@lixom.net
Cc:     vkoul@kernel.org, niklas.cassel@linaro.org,
        georgi.djakov@linaro.org, amit.kucheria@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, khasim.mohammed@linaro.org
Subject: [PATCH v3 00/14] Support CPU frequency scaling on QCS404
Date:   Tue, 25 Jun 2019 18:47:19 +0200
Message-Id: <20190625164733.11091-1-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following patchset enables CPU frequency scaling support on the
QCS404 (with dynamic voltage scaling).

Patch 8 "clk: qcom: hfpll: CLK_IGNORE_UNUSED" is a bit controversial;
in this platform, this PLL provides the clock signal to a CPU
core. But in others it might not.

We opted for the minimal ammount of changes without affecting the
default functionality: simply bypassing the COMMON_CLK_DISABLE_UNUSED
framework and letting the firwmare chose whether to enable or disable
the clock at boot. However maybe a DT property and marking the clock
as critical would be more appropriate for this PLL. we'd appreciate the
maintainer's input on this topic.

v2:
   - dts: ms8916: apcs mux/divider: new bindings
     (the driver can still support the old bindings)
     
   - qcs404.dtsi
     fix apcs-hfpll definition
     fix cpu_opp_table definition
     
   - GPLL0_AO_OUT operating frequency
     define new alpha_pll_fixed_ops to limit the operating frequency

v3:
  - qcom-apcs-ipc-mailbox
    replace goto to ease readability
    
  - apcs-msm8916.c
    rework patch to use of_clk_parent_fill

  - hfpll.c
    add relevant comments to the code

  - qcs404.dtsi
    add voltage scaling support

Jorge Ramirez-Ortiz (14):
  clk: qcom: gcc: limit GPLL0_AO_OUT operating frequency
  mbox: qcom: add APCS child device for QCS404
  mbox: qcom: replace integer with valid macro
  dt-bindings: mailbox: qcom: Add clock-name optional property
  clk: qcom: apcs-msm8916: get parent clock names from DT
  clk: qcom: hfpll: get parent clock names from DT
  clk: qcom: hfpll: register as clock provider
  clk: qcom: hfpll: CLK_IGNORE_UNUSED
  arm64: dts: qcom: msm8916: Add the clocks for the APCS mux/divider
  arm64: dts: qcom: qcs404: Add OPP table
  arm64: dts: qcom: qcs404: Add HFPLL node
  arm64: dts: qcom: qcs404: Add the clocks for APCS mux/divider
  arm64: dts: qcom: qcs404: Add DVFS support
  arm64: defconfig: Enable HFPLL

 .../mailbox/qcom,apcs-kpss-global.txt         | 24 +++++++++--
 arch/arm64/boot/dts/qcom/msm8916.dtsi         |  3 +-
 arch/arm64/boot/dts/qcom/qcs404.dtsi          | 42 +++++++++++++++++++
 arch/arm64/configs/defconfig                  |  1 +
 drivers/clk/qcom/apcs-msm8916.c               | 23 ++++++++--
 drivers/clk/qcom/clk-alpha-pll.c              |  8 ++++
 drivers/clk/qcom/clk-alpha-pll.h              |  1 +
 drivers/clk/qcom/gcc-qcs404.c                 |  2 +-
 drivers/clk/qcom/hfpll.c                      | 25 ++++++++++-
 drivers/mailbox/qcom-apcs-ipc-mailbox.c       | 18 ++++----
 10 files changed, 130 insertions(+), 17 deletions(-)

-- 
2.21.0

