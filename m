Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B38E757C0AA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jul 2022 01:11:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231508AbiGTXLQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Jul 2022 19:11:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231483AbiGTXLO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Jul 2022 19:11:14 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6FC913E3C
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jul 2022 16:11:13 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id y10-20020a9d634a000000b006167f7ce0c5so15321931otk.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jul 2022 16:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PWbj+WdashVU5oWstvpqXfj4EqNczmYpHmyzxnmVob4=;
        b=NRDLscyIJxUh++e16LUmbeGMzIF3XUqFrkWSFkTTz+OB0jjM0EJ9MgPI97I/79dWfx
         f5JfBoOg9HS+RtC2ucaQxsBn1ibi20+bDZP4EHZeoYcDMBIOkgAqd/BCkrxteg57bgnQ
         pdVS5TWDsj8AGzTW0gxbOgiZkmfYNKLWF8LK2/551GX37jaQ074RR9EP8QZzn4QPxenh
         LItYj1fFppy5lOxtKmErLfhlauoD3l283y/MMuFlSEPuN/JhhtcOEFurnir1J+gx530Z
         pSpidCQ29E/dZrxbq+Z3yeFx8329JRggv/8qJfAwjDmSb0vS0zA5y4AYNhdDgDjxabmM
         WOrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PWbj+WdashVU5oWstvpqXfj4EqNczmYpHmyzxnmVob4=;
        b=XzcUznZBOQdbIKbgIUnWM9x2R2+Jqh7JE8fk5MvZKVzbm+F597HZYw6qRExt4SLvSO
         V9HqPfbl+ruQBNz+vFVlfJJLXKy2aGNZ9E9Q+VNY0OyaxZYrGllf/D9691sTgooZGOeZ
         K4idxQVGKbfOzYk7Gnvs1zAQAgXqXdu2SUtL6CRWDLMm0L2nmCG8XPYwYgR6u80BB5se
         cCoifCD6pBW8tFUYXKPx+/Shd+yG17Odx94S/MT3t3JaQDXcTtr/1DIYG/ixRaiF4l7W
         DO7L4gLRbhZqgMO42GQgTh9+cs+2SiM6WzQOWZB2fV0mD53TgVBinC6IpM73YfNmr4US
         e0fw==
X-Gm-Message-State: AJIora/ghlG3aC3vcIhfiMKa1K1VoEDWEGgnRYGF3Le8IVPVd8U7+lLc
        oGLtyzJJNTkaFr4B44nsooP7Og==
X-Google-Smtp-Source: AGRyM1uVaxwaNIyQs36PmfqQl7+MUh123utCPioKOiWOQj/Ta/xyBierJyzhy+B43fXyB3OJCBMfRw==
X-Received: by 2002:a9d:6385:0:b0:61c:81ad:8817 with SMTP id w5-20020a9d6385000000b0061c81ad8817mr12191172otk.218.1658358673129;
        Wed, 20 Jul 2022 16:11:13 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id v188-20020a4a5ac5000000b00435b646f160sm165522ooa.5.2022.07.20.16.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 16:11:12 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Christian Marangi <ansuelsmth@gmail.com>,
        =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Luca Weiss <luca@z3ntu.xyz>,
        Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Subject: [GIT PULL] More Qualcomm DTS updates for v5.20
Date:   Wed, 20 Jul 2022 18:11:11 -0500
Message-Id: <20220720231111.2114025-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit 864cfdeb76735909a9afcc314416ccaa1ce82a1a:

  ARM: dts: qcom: msm8974: rename GPU's OPP table node (2022-07-06 16:04:22 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-for-5.20-2

for you to fetch changes up to aa7fd3bb6017b343585e97a909f9b7d2fe174018:

  ARM: dts: qcom: add rpmcc missing clocks for apq/ipq8064 and msm8660 (2022-07-18 19:13:44 -0500)

----------------------------------------------------------------
More Qualcomm DTS updates for v5.20

This adds an additional GSBI, hwclock, smem and tsens nodes for IPQ8064,
in addition to fixing up and improving the existing descriptions of the
platform.

USB interrupts are reordered to please the Devicetree binding.

The Light Pulse Generator is defined for PM8941 and LEDs are defined for
the FairPhone2, Nexus 5 and Sony Xperia devices.

----------------------------------------------------------------
André Almeida (1):
      ARM: dts: qcom: msm8974-hammerhead: Add notification LED

Bjorn Andersson (2):
      ARM: dts: qcom: Add LPG node to pm8941
      ARM: dts: qcom: msm8974-sony: Enable LPG

Christian Marangi (11):
      ARM: dts: qcom: ipq8064: add multiple missing pin definition
      ARM: dts: qcom: ipq8064: add gsbi6 missing definition
      ARM: dts: qcom: ipq8064: add specific dtsi with smb208 rpm regulators
      ARM: dts: qcom: ipq8064: add missing snps,dwmac compatible for gmac
      ARM: dts: qcom: ipq8064: disable usb phy by default
      ARM: dts: qcom: ipq8064: reduce pci IO size to 64K
      ARM: dts: qcom: ipq8064: fix and add some missing gsbi node
      ARM: dts: qcom: ipq8064: add speedbin efuse nvmem node
      ARM: dts: qcom: ipq8064: add missing hwlock
      ARM: dts: qcom: ipq8064: add missing smem compatible
      ARM: dts: qcom: add rpmcc missing clocks for apq/ipq8064 and msm8660

Dmitry Baryshkov (1):
      ARM: dts: qcom: apq8064: create tsens device node

Johan Hovold (1):
      ARM: dts: qcom: sdx65: reorder USB interrupts

Luca Weiss (1):
      ARM: dts: qcom: msm8974-FP2: Add notification LED

Stephan Gerhold (1):
      ARM: dts: qcom: msm8974: Disable remoteprocs by default

 arch/arm/boot/dts/qcom-apq8064.dtsi                |  27 +++-
 arch/arm/boot/dts/qcom-ipq8064-ap148.dts           |   6 -
 arch/arm/boot/dts/qcom-ipq8064-rb3011.dts          |   9 --
 arch/arm/boot/dts/qcom-ipq8064-smb208.dtsi         |  37 +++++
 arch/arm/boot/dts/qcom-ipq8064.dtsi                | 162 ++++++++++++++++++++-
 arch/arm/boot/dts/qcom-msm8660.dtsi                |   4 +-
 .../dts/qcom-msm8974-lge-nexus5-hammerhead.dts     |  30 ++++
 .../boot/dts/qcom-msm8974-sony-xperia-rhine.dtsi   |  30 ++++
 arch/arm/boot/dts/qcom-msm8974.dtsi                |   4 +
 .../arm/boot/dts/qcom-msm8974pro-fairphone-fp2.dts |  32 ++++
 arch/arm/boot/dts/qcom-msm8974pro-samsung-klte.dts |   2 +
 .../qcom-msm8974pro-sony-xperia-shinano-castor.dts |  30 ++++
 arch/arm/boot/dts/qcom-pm8941.dtsi                 |  10 ++
 arch/arm/boot/dts/qcom-sdx65.dtsi                  |  10 +-
 14 files changed, 357 insertions(+), 36 deletions(-)
 create mode 100644 arch/arm/boot/dts/qcom-ipq8064-smb208.dtsi
