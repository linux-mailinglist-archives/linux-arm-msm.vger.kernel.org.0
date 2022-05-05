Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FD0A51BEF0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 May 2022 14:12:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244504AbiEEMP7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 May 2022 08:15:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359776AbiEEMP7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 May 2022 08:15:59 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 263406452
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 May 2022 05:12:19 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id h29so7146114lfj.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 May 2022 05:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FCmEORJ79JaFBJp01cOo66V/j5K6NsPzrCaoVLHV8uM=;
        b=mJwZZijSjo3iT07/6cFx7QtkDcTqNxobCxeeoAljZn3mFKRY8TpF+fF5Ow2R+tHw7Y
         JXgqwrQATPW+NYq77BopXhpFDUdXofruEVve2BxKpPXE5FJYfBZNHBj96j8DeksZSAn0
         AKQBquFA20Cq+fwQq1iGEnQwfngrwcoHJYfbm8RG1Nidn7asHl8eLVUxsrXi0/pv+EuT
         87ZbQ18PufajTxySNoIGzfCWQGzFaAOJrLrrR45jpUbO2eV8+4S3DLNFR2C3Ou3LmZhd
         RxsbImTHZI+uKk1nDq4U7PuelnnsFpAU5pF3xAEY6AkyQwdbdr8z6f/0M0AnpowWIu3c
         Rthg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FCmEORJ79JaFBJp01cOo66V/j5K6NsPzrCaoVLHV8uM=;
        b=PNtWrUdlJlCPWv6owqG5n7KW6OqH1gAx36/N1TPTHfdZnIBorTZpcc9Spby1auPRhS
         SAg/TrfwC7QERv9z8nFpOBwvRRy5oOIuaVBgMKHqJyH1DVBqlQkEKz9w8ub6QVhOwlWV
         imJM7HTmyh9Mk/rUiBkWQ2ubWbKnR0FsIWRkilph/7fP/EgJ1vz0KNlChxnPLNFTnpy8
         Eaq09aCngtF7wJG0r7tohGBtYTTnXbzVA7W3t5iQBHwjh8rh94wQdx6F9G38kAXuvN3c
         EXit/tb7p/8frcmdJdjJYYncqGIwTMcdcA5teElSaxPC4yfXAmO+BTdjtyiW+AR7bOVC
         rboA==
X-Gm-Message-State: AOAM531UbER9TVv5jIKYlvW09syRDGXWHewdLBDHD6yoHt5QaBSSRd1H
        QwPV/FXOfw4LUFCLf4pCFzux3g==
X-Google-Smtp-Source: ABdhPJwnalSgWGgapjxaS0gv7BNmLdZZv6SNBYzEWRArgTbl/EVYgSdineOR+WJFHpJ+X8DmZzOw5Q==
X-Received: by 2002:a05:6512:158e:b0:472:5a6a:446c with SMTP id bp14-20020a056512158e00b004725a6a446cmr15335220lfb.408.1651752737334;
        Thu, 05 May 2022 05:12:17 -0700 (PDT)
Received: from localhost.localdomain (mobile-access-5672eb-224.dhcp.inet.fi. [86.114.235.224])
        by smtp.gmail.com with ESMTPSA id g20-20020a056512119400b0047255d211fesm187454lfr.301.2022.05.05.05.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 05:12:16 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v3 0/7] clk: qcom: add camera clock controller driver for SM8450 SoC
Date:   Thu,  5 May 2022 15:12:11 +0300
Message-Id: <20220505121213.4121802-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
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

 .../bindings/clock/qcom,sm8450-camcc.yaml     |   89 +
 arch/arm64/boot/dts/qcom/sm8450.dtsi          |   20 +
 drivers/clk/qcom/Kconfig                      |    7 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/camcc-sm8450.c               | 2859 +++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.c              |  145 +-
 drivers/clk/qcom/clk-alpha-pll.h              |   11 +-
 include/dt-bindings/clock/qcom,sm8450-camcc.h |  159 +
 8 files changed, 3285 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
 create mode 100644 drivers/clk/qcom/camcc-sm8450.c
 create mode 100644 include/dt-bindings/clock/qcom,sm8450-camcc.h

-- 
2.33.0

