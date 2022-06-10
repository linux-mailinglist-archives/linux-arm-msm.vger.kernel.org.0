Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1C875464B2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jun 2022 12:54:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349273AbiFJKwz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jun 2022 06:52:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349161AbiFJKwf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jun 2022 06:52:35 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 017463082F3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 03:49:16 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id w20so20544718lfa.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 03:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dgkI3VAYwFIaWeGVD2P9W7qrwDfpBrNAVPNjW8QKPXg=;
        b=ru3SIZhIV3kbuf9JsGpv/nAyTPGTBD+wPbkMljuZdehZNautA0RBEtGymeX4Y5UKwi
         DirjHiGMQLgOIqCOjZeW+NHIafXzaQkxJixkqkqih2z33QxjTTc1VriPJdprqPAhiq8M
         aKSL2aV2vnjbZZpat0A+2MpJEgx8U972IAIoPjM5eLbRaDyl6fioHC8kB6gDfH9Js+3l
         miGRa1XqmNS6Y+IjznPqLMGMpQUkBeWqWub8wfWLpFGOZqXivdAjVe3Z8eeGSkd9lxr+
         IqBhWFTxCf+BqeBaI/pARlfEh2M0m2onno35F4f3/05ExYaz2DFPH6D5muhgziM0efZj
         0BEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dgkI3VAYwFIaWeGVD2P9W7qrwDfpBrNAVPNjW8QKPXg=;
        b=Is61vSpYcLtkcpniREScmHJAPmuE7WTYu7yeXoxxphM/SFza6/axPZUSgR5lIlpbkf
         FRY1fv/pwonTgq6i5xgrMP6DGeh/dQgKF4uArKKDKFk0wbSZSVz6Gq3MbN3W5XXoEJXQ
         A/L1DRwZaEyg+DXeLjdFGMuhjOq+PcJwlQ++/wgZq1Q8h7RStPhfJTD3J6nGEXE8s4Fy
         Wh0tnKv1kOOoWyFVE429L/6vePSIko6A+VnEuR6kZftm55QynFZDiXGiC9s5PG529bbP
         dnxpOl6q0Xcu7WuBHdvzzjrl808zrSel5ulsyJZoGi9/k2jsbhZOOB+BswhStW2GqGv4
         506g==
X-Gm-Message-State: AOAM533+P0cHroC/kooA7uTY4XQwkRZm6sOpLcmQImxdyiicM6V+3d/v
        dZD2iawcPNbhhW8hRoCYMXAs0b2vUik8RA==
X-Google-Smtp-Source: ABdhPJxU+SHkuDdjHziMvXBr91lJUJ/ry4kOJqJZLAGx+bNgx8smoPFOfELuL5w3Unwph2Ib3gK6Lw==
X-Received: by 2002:a05:6512:b1d:b0:47d:ab06:e627 with SMTP id w29-20020a0565120b1d00b0047dab06e627mr2745898lfu.669.1654858155119;
        Fri, 10 Jun 2022 03:49:15 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id h11-20020ac24d2b000000b00477a287438csm4683468lfk.2.2022.06.10.03.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 03:49:14 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v7 0/7] clk: qcom: add camera clock controller driver for SM8450 SoC
Date:   Fri, 10 Jun 2022 13:49:09 +0300
Message-Id: <20220610104911.2296472-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The patchset adds support of a camera clock controller found on
QCOM SM8450 SoC, noticeably a camcc pll2 is a new "rivian evo"
type of pll, its generic support is added in the series.

Note that SM8450 ES variant has a slightly different configurtion,
the published version is intended to support SM8450 CS SoC.

Changes from v6 to v7:
* rebased on top of v5.19-rc1,
* fixed a warning in a usage example found in yaml file.

Changes from v5 to v6:
* rebased on top of linux-next,
* added Rob's tag,
* fixed a topology of power domains around titan_top.

Changes from v4 to v5:
* fixed the same typo in a usage example found in yaml file as in v3
  change.

Changes from v3 to v4:
* fixed a changed path in the yaml file.

Changes from v2 to v3:
* fixed a typo in a usage example found in yaml file,
* renamed dt related files to match the compatible "qcom,sm8450-camcc",
* minor fixes in the driver per review requests from Bjorn,
* added Bjorn's tag to a change of exported symbols namespace.

Changes from v1 to v2:
* updated qcom,camcc-sm8450.yaml according to review comments from Rob,
* changed qcom,camcc-sm8450.h licence to dual one,
* disabled camcc device tree node by default,
* added Stephen's tag,
* rebased the series on top of clk-for-5.18

Vladimir Zapolskiy (7):
  dt-bindings: clock: add QCOM SM8450 camera clock bindings
  arm64: dts: qcom: sm8450: Add description of camera clock controller
  clk: qcom: clk-alpha-pll: fix clk_trion_pll_configure description
  clk: qcom: clk-alpha-pll: limit exported symbols to GPL licensed code
  clk: qcom: clk-alpha-pll: add Lucid EVO PLL configuration interfaces
  clk: qcom: clk-alpha-pll: add Rivian EVO PLL configuration interfaces
  clk: qcom: add camera clock controller driver for SM8450 SoC

 .../bindings/clock/qcom,sm8450-camcc.yaml     |   94 +
 arch/arm64/boot/dts/qcom/sm8450.dtsi          |   20 +
 drivers/clk/qcom/Kconfig                      |    7 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/camcc-sm8450.c               | 2866 +++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.c              |  145 +-
 drivers/clk/qcom/clk-alpha-pll.h              |   11 +-
 include/dt-bindings/clock/qcom,sm8450-camcc.h |  159 +
 8 files changed, 3297 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
 create mode 100644 drivers/clk/qcom/camcc-sm8450.c
 create mode 100644 include/dt-bindings/clock/qcom,sm8450-camcc.h

-- 
2.33.0

