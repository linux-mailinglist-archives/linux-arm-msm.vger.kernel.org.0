Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 416E44FB4AE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Apr 2022 09:25:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245329AbiDKH1g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Apr 2022 03:27:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245366AbiDKH1P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Apr 2022 03:27:15 -0400
Received: from mxd2.seznam.cz (mxd2.seznam.cz [IPv6:2a02:598:2::210])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AC8E39BBB;
        Mon, 11 Apr 2022 00:24:52 -0700 (PDT)
Received: from email.seznam.cz
        by email-smtpc7a.ng.seznam.cz (email-smtpc7a.ng.seznam.cz [10.23.10.195])
        id 0d4e80be5640d4d70ce74ce0;
        Mon, 11 Apr 2022 09:24:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz; s=beta;
        t=1649661869; bh=B8UfqYhtDAANtycvzPyjICoFKFyGu9U+8xDMD/CjZMg=;
        h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
         Content-Transfer-Encoding:X-szn-frgn:X-szn-frgc;
        b=EuPGSr/E4vPmBSfC5K44HZvO4mod0eCfPeIrHiSU5oLF6M4oI9rksmg9rPw8tRhJ0
         UPEs2gtLIcZqbTj6PFiXcaqRXKR3dGP89k01qUAR7dAqZ3eIPMU5+gD8RyzVVD5jwJ
         o23CtccflugTbGUEh2dbjL7EFxFcXJkfiMfOBfY0=
Received: from localhost.localdomain (ip-111-27.static.ccinternet.cz [147.161.27.111])
        by email-relay18.ng.seznam.cz (Seznam SMTPD 1.3.136) with ESMTP;
        Mon, 11 Apr 2022 09:24:22 +0200 (CEST)  
From:   michael.srba@seznam.cz
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Michael Srba <Michael.Srba@seznam.cz>
Subject: [RESEND v9 0/5] enable use of resources on the SSC bus on (some) qcom SoCs
Date:   Mon, 11 Apr 2022 09:21:51 +0200
Message-Id: <20220411072156.24451-1-michael.srba@seznam.cz>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-szn-frgn: <6611fa77-a821-48c8-bb11-57a3bfa1e278>
X-szn-frgc: <0>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Michael Srba <Michael.Srba@seznam.cz>

NOTE: previous versions of this series didn't use a cover letter,
it's added in this resend in order to not upset the kernel bot.

This series adds necessary changes for accessing recources in the SSC block
on msm8998 (though it should be possible to extend this to support other
SoCs).

In order to make use of these changes, Linux (HLOS in qcom's terms) needs
to be allowed to access the relevant address ranges by the SMMU
configuration.

For a simple way to modify an existing (closed source) qcom hypervisor
image to change the static SMMU configuration, see [1].

If you lack ownership of your device, it should alternatively be possible
to change the SMMU configuration at a later point, provided you manage to
get code execution in the hypervisor by way of an exploit.

[1] https://michael-srba.cz/mainline4life/msm8998_hypervisor_patch.html

Michael Srba (5):
  dt-bindings: clock: gcc-msm8998: Add definitions of SSC-related clocks
  clk: qcom: gcc-msm8998: add SSC-related clocks
  dt-bindings: bus: add device tree bindings for qcom,ssc-block-bus
  drivers: bus: add driver for initializing the SSC bus on (some) qcom
    SoCs
  arm64: dts: qcom: msm8998: reserve potentially inaccessible clocks

 .../bindings/bus/qcom,ssc-block-bus.yaml      | 147 +++++++
 arch/arm64/boot/dts/qcom/msm8998.dtsi         |  15 +
 drivers/bus/Kconfig                           |  11 +
 drivers/bus/Makefile                          |   1 +
 drivers/bus/qcom-ssc-block-bus.c              | 391 ++++++++++++++++++
 drivers/clk/qcom/gcc-msm8998.c                |  56 +++
 include/dt-bindings/clock/qcom,gcc-msm8998.h  |   4 +
 7 files changed, 625 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bus/qcom,ssc-block-bus.yaml
 create mode 100644 drivers/bus/qcom-ssc-block-bus.c

-- 
2.35.1

