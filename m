Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2242B206785
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2020 00:48:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388682AbgFWWsT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jun 2020 18:48:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387887AbgFWWsS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jun 2020 18:48:18 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1329AC061795;
        Tue, 23 Jun 2020 15:48:18 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id j94so281251wrj.0;
        Tue, 23 Jun 2020 15:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i1XPnQdZkQcK6l2ZDFifyN3TcjJd5d/D5Kr8vGiE5lE=;
        b=WruQF02r6TacNOsWUtr6SeywvIR+2lOOwkRSG24Rtw0M6G6i06AwHhztQb8+fOwkQU
         5h/FlBWZU68nsWJY2EmYWK2iqywarDlWYk56J4kgvsWnvMJLecOcgXvyOKWT1xzoL7vd
         mE7FEeX+M2ArbZYcxmUfrcCTHJvWmL19Xk4ZF0g3KjrdWKzzfjbkwy3VdPXD6qRpBUO9
         SprQAfeVZM2Wj7xQJ0RqHD11lKqFg1T9PlmlxPW4wB62KmHhUAzivIkvz1LRcZtVYxmm
         FPEA/txLU/jwLU3jXFQtC2C3imW77aJfMo+agpaW1yPhIrEGTw/kfzRECYcA54u4bkWN
         RLWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i1XPnQdZkQcK6l2ZDFifyN3TcjJd5d/D5Kr8vGiE5lE=;
        b=AOEWBpDAd6S/bVY+R/SWtJaJ5uxAz6UEUmj475ATSadve/K10d97zWFkI3/u2svJVJ
         QeohS0g7OXJ/0Qcdb3JmnsKB6u4iHhxwu000Eugnrkj63k7ugnWaiatOjl59vv1CIHOJ
         m4at0wB9GUHcO6oJoltqCOSgJDu/UnrpPGoS1GY670hGsBsCgXpv8AYdprWs/gCvbySK
         LVjdUtSV4aNmETg3BJ1wC9LuEOr9y/DLCHK0GYcvioF70N2kuDJv6HS7YZx5VYHosJEY
         2PNe78Hp6Mj0VjzcLTqQF+tBHg/gWAF3V7NXvjOZWxsHKaJI8q602QmhTmzhs1N/RAiD
         m/UA==
X-Gm-Message-State: AOAM531YRemC5USv54HNCKOIl6SK1xBkZtXUD9YQnt2epmWneJ5SiCy5
        b0kYTZTnRekxI6wDnDmrXwA=
X-Google-Smtp-Source: ABdhPJwRPIK6iKQ1iUT54k5TT7V9aTf8ga1P1OzrnSVyqIpdWCRp4bkmZUA3kgPu+f69SluVR7GIAQ==
X-Received: by 2002:a5d:6a46:: with SMTP id t6mr428371wrw.374.1592952496595;
        Tue, 23 Jun 2020 15:48:16 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id g144sm5671179wme.2.2020.06.23.15.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 15:48:16 -0700 (PDT)
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
Subject: [PATCH v2 00/12] MSM8994 peripheral enablement, DTS updates
Date:   Wed, 24 Jun 2020 00:47:59 +0200
Message-Id: <20200623224813.297077-1-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

changes since v1:
- clean up the commit history and cut down
on unnecessary commit count
- bring the DTS in line with the newest ones
- fix some minor typos that went unnoticed
- drop RPMCC patch (sent separately)
- drop the pmi8994 patch (applied)

The patchet depends on:
- https://patchwork.kernel.org/patch/11584267/ (even though bullhead used
that for a few years and the property never existed but nobody noticed)

- https://patchwork.kernel.org/patch/11580845/ (no point duplicating it for 8994)

- RPMCC for 8992/4 (sent soon after this series)

Konrad Dybcio (12):
  arm64: dts: qcom: msm8994: Modernize the DTS style
  arm64: dts: qcom: msm8994: Add SPMI PMIC arbiter device
  arm64: dts: qcom: msm8994: Add a proper CPU map
  arm64: dts: qcom: msm8994: Add support for SMD RPM
  arm64: dts: qcom: msm8994: Add SDHCI1 node
  arm64: dts: qcom: msm8994: Add SCM node
  arm64: dts: qcom: msm8994: Add I2C, SPI and BLSP DMA nodes
  arm64: dts: qcom: msm8994: Add pmu node
  arm64: dts: qcom: msm8994: Add PSCI node
  arm64: dts: qcom: angler: Add qcom,msm-id and pmic-id
  arm64: dts: qcom: Move msm8994-smd-rpm contents to lg-bullhead.
  arm64: dts: qcom: Add support for Sony Xperia Z5 (SoMC Sumire-RoW)

 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../dts/qcom/msm8992-bullhead-rev-101.dts     | 264 ++++++-
 .../boot/dts/qcom/msm8994-angler-rev-101.dts  |   2 +
 arch/arm64/boot/dts/qcom/msm8994-pins.dtsi    |  30 -
 arch/arm64/boot/dts/qcom/msm8994-smd-rpm.dtsi | 268 -------
 .../msm8994-sony-xperia-kitakami-sumire.dts   | 395 ++++++++++
 arch/arm64/boot/dts/qcom/msm8994.dtsi         | 710 ++++++++++++++++--
 7 files changed, 1303 insertions(+), 367 deletions(-)
 delete mode 100644 arch/arm64/boot/dts/qcom/msm8994-pins.dtsi
 delete mode 100644 arch/arm64/boot/dts/qcom/msm8994-smd-rpm.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-sumire.dts

-- 
2.27.0

