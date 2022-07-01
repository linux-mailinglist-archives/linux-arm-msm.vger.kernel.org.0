Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2D77562B85
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Jul 2022 08:26:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234743AbiGAG0u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Jul 2022 02:26:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234678AbiGAG0u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Jul 2022 02:26:50 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E87D545072
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 23:26:48 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id b23so1413482ljh.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 23:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fu8fw3/fIflh2QygMnR+7jFEarerL1LxXAv+clE1yVc=;
        b=J2/XXL4Ewn1f6zNIQrLgROX4ZppPEq/rjDUAJv+sSXvJ7MMaxw+6HqQVwUZYw3NC4R
         gZX9Xpu8e7gVfqNu2Q7cg2+CgT1alGMHuQiFra4V7Upfu+YutbScWLTJYYfb+4DJ7H5H
         u3eFTr5XPcTaR260/A9GEr2JETXZ1c8XPlGfIjFhom4XV8CeBTGVo4zc020sbdPJKqti
         Wb2HCdvZEqJm6ZxUiXU2xlpwTvRnzFVFo3WB61te8xWEnIAw9f2/Ylt1U+g6K2es8lQ3
         MfrZyzvC6Cn8Z+VVRi6OTRVkWshmcPgS4sY79iA7Vw+9FqDHeZOGg3sZkW3Ywe4+S0lZ
         I4aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fu8fw3/fIflh2QygMnR+7jFEarerL1LxXAv+clE1yVc=;
        b=ch6iXQOAPpkB8ww9HD5jzIm/qdLUE35cApXVqAUd85yC/d2tNcySxcuDOIpzFQtAjv
         INTSUcbIZyQeJ88hTkB5oLP3gcmwrGitksvvf9X9Oz8chb+h03s4kVVucs+C+iCV+ifS
         9WB1Xb47m3lOylAxG9eCzIPDlrwm9GAwwo1bAveUVBKQXZS2R/hFSYh7wQNAg8BJq03y
         Cw7frWpsrfNtjV3GdiPdJxKqoFeLC6iewNsfeLCcABspm55yCB7qmuOzFfOVaiG0pjL5
         SeftGGVEFDBGG1LGN2XeKcJd5yDb4XO/GwM4Fz5fMx6uFrOZYTbO8bJVwJ7Qalwb3zdy
         P4Gg==
X-Gm-Message-State: AJIora84XGY8erVrq5Bl2JL1F776LOwWODcSeV7RQwVFKs7asp+heyQ6
        PK5q/veCsuMKudfi7m6VyQdNJdOiXqSAbw==
X-Google-Smtp-Source: AGRyM1sjdUYjwnticAMcYOI4kujvt3Hmcv0fXCBEYGBW6u+QQWFVHGF9XOQxQjJS1gobUpGF4Cal/g==
X-Received: by 2002:a05:651c:1a2a:b0:25b:f7f2:eb42 with SMTP id by42-20020a05651c1a2a00b0025bf7f2eb42mr3895054ljb.473.1656656807092;
        Thu, 30 Jun 2022 23:26:47 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id s14-20020a19770e000000b0047faefd9f24sm3476581lfc.207.2022.06.30.23.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 23:26:46 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v10 0/7] clk: qcom: add camera clock controller driver for SM8450 SoC
Date:   Fri,  1 Jul 2022 09:26:20 +0300
Message-Id: <20220701062622.2757831-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The patchset adds support of a camera clock controller found on
Qualcomm SM8450 SoC, noticeably a camcc pll2 is a new "rivian evo"
type of pll, its generic support is added in the series.

Note that SM8450 ES variant has a slightly different configuration,
the published version is intended to support SM8450 CS SoC only.

Changes from v9 to v10:
* added reviewed-by tags by Vinod and Bjorn,
* minor improvements to commit messages.

Changes from v8 to v9:
* removed clock-names property per request from Bjorn,
* corrected a path in the yaml file to the added include file,
* put status property as the last one in the list of properties,
* non-functional changes in the clock provider driver code.

Changes from v7 to v8:
* rebased on top of v5.19-rc2,
* added Stephen's tags,
* improved an example found in added yaml file,
* improved some of the commit messages,
* narrowed down a list of included headers,
* constified .hw.init anonymous structs.

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

 .../bindings/clock/qcom,sm8450-camcc.yaml     |   80 +
 arch/arm64/boot/dts/qcom/sm8450.dtsi          |   16 +
 drivers/clk/qcom/Kconfig                      |    7 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/camcc-sm8450.c               | 2856 +++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.c              |  144 +-
 drivers/clk/qcom/clk-alpha-pll.h              |   11 +-
 include/dt-bindings/clock/qcom,sm8450-camcc.h |  159 +
 8 files changed, 3268 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
 create mode 100644 drivers/clk/qcom/camcc-sm8450.c
 create mode 100644 include/dt-bindings/clock/qcom,sm8450-camcc.h

-- 
2.33.0

