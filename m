Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5B4F5F11D6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Sep 2022 20:52:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232238AbiI3Swm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Sep 2022 14:52:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231237AbiI3Swl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Sep 2022 14:52:41 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FD4716513D
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 11:52:39 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id g1so8183789lfu.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 11:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=9LLU1snLDBFrkDtX73UL2zieslxs0+ytoPrFegmV88I=;
        b=aE09uo+l+I4lVZzbN2Ui+AJstpHhAwqTErfY4Mwx1Tlul4KqtPnGTaPToxM0MIn8Tp
         aGHDdPLQSR9DEGDLgx4xqWVEdiyOHcG2q/cNfdf0Jm8uuCng0TCNuVMAvXt7UEorG1E1
         FbNRz93axhjDII1CTuv7je0O3bVVnF845YZeDZ7he//Z1qt2SvQsghLWBoLyQvZi/b4t
         0iE+66obHUMaFcV8133JyzVYkglxN+bazjPKcR5p8y38sStdHqQqfkUGngj+Yvz7BCmL
         ikBwnoZKrbdBr8Ie69eSVEWSu2ve7Mim2ZsEsnED00V4E2/sP+Yb4t+XiT6cRQvpoB2W
         2uaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=9LLU1snLDBFrkDtX73UL2zieslxs0+ytoPrFegmV88I=;
        b=LMdmq6X2uRSaVuoX5HlKSiV2BpixDAmFWikpXhiDNqEVxbn6fl7yZILFd5GHAqlsW0
         MR4Jx4169co1qehuku6UCOf44Jcxx6anED+jLJuhngie57iSibMuUSOiDxm9NJipQ38O
         hMzGfwB79v4z5gR/2ULAz1G/z+yo7kkp3kQAtgtvE3uJlCEAkDwvRECmvOQpUPYWuelF
         cCjg51ZTmNQhDlz7J4LPm+klVl6Xc3nZFFmLOg/win5SeHIXdgWiwPlfy1dicDx8Q2F5
         ln5Duy9xqDbE6VjHms8HBDdDgB1yKXLur6JBjSK2+a0a7Oy+hamabnD90CgwYmMpXt7o
         EZ6w==
X-Gm-Message-State: ACrzQf0+mh2B6xZpgmny6qtskXJR2POSWtvUL6F/vx+aIVk0i9jTZfjz
        duLH8DAXF8yAc9R8EWbTQ1H3Xw==
X-Google-Smtp-Source: AMsMyM6/SB4MUWMhNw/o5Mj+ShTGADsUyWi/52HZJXcRKJvGSqHH25pGKR7RvXHZsQGnixIQUbqd1A==
X-Received: by 2002:a05:6512:3d8c:b0:49a:4872:858 with SMTP id k12-20020a0565123d8c00b0049a48720858mr3568681lfv.145.1664563957816;
        Fri, 30 Sep 2022 11:52:37 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i8-20020a056512006800b00492cfecf1c0sm374703lfo.245.2022.09.30.11.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 11:52:37 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 00/23] ARM: dts: qcom: rework DT for apq8064, msm8960 and msm8660
Date:   Fri, 30 Sep 2022 21:52:13 +0300
Message-Id: <20220930185236.867655-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Rework DT files for older 32-bit MSM Snapdragon platforms. Use links
rather than replicating the whole DT structure, cleanup several DT
issues (like erroneous node names).

Dmitry Baryshkov (23):
  ARM: dts: qcom: apq8064: disable HDMI nodes by default
  ARM: dts: qcom: apq8064-ifc6410: use labels to patch device tree
  ARM: dts: qcom: apq8064-ifc6410: pull ext-3p3v regulator from soc node
  ARM: dts: qcom: apq8064-ifc6410: fix user1 LED node name
  ARM: dts: qcom: apq8064-ifc6410: pull SDCC pwrseq node up one level
  ARM: dts: qcom: apq8064-flo: use labels to patch device tree
  ARM: dts: qcom: apq8064-nexus7-flo: fix node name for ext 3p3v
    regulator
  ARM: dts: qcom: apq8064-cm-qs600: use labels to patch device tree
  ARM: dts: qcom: apq8064-cm-qs600: pull 3p3v regulator from soc node
  ARM: dts: qcom: apq8064-cm-qs600: pull SDCC pwrseq node up one level
  ARM: dts: qcom: apq8064-sony-xperia-lagan-yuga: use labels to patch
    device tree
  ARM: dts: qcom: apq8064: drop amba device node
  ARM: dts: qcom: apq8064: drop unit ids from PMIC nodes
  ARM: dts: qcom: apq8064: drop qcom, prefix from SSBI node name
  ARM: dts: qcom: apq8064: fix the riva-pil node id
  ARM: dts: qcom: msm8960: drop unit ids from PMIC nodes
  ARM: dts: qcom: msm8960: drop qcom, prefix from SSBI node name
  ARM: dts: qcom: msm8960-cdp: drop unit ids from regulator node
  ARM: dts: qcom: msm8960: drop amba device node
  ARM: dts: qcom: msm8660: move pm8058 LED devices to the main DT file
  ARM: dts: qcom: apq8060-dragonboard: use labels to patch device tree
  ARM: dts: qcom: msm8660: drop unit ids from PMIC nodes
  ARM: dts: qcom: msm8660: drop qcom, prefix from SSBI node name

 .../arm/boot/dts/qcom-apq8060-dragonboard.dts | 1778 ++++++++---------
 .../boot/dts/qcom-apq8064-asus-nexus7-flo.dts |  523 +++--
 arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts   |  390 ++--
 arch/arm/boot/dts/qcom-apq8064-ifc6410.dts    |  561 +++---
 .../qcom-apq8064-sony-xperia-lagan-yuga.dts   |  649 +++---
 arch/arm/boot/dts/qcom-apq8064.dtsi           |  145 +-
 arch/arm/boot/dts/qcom-msm8660.dtsi           |   33 +-
 arch/arm/boot/dts/qcom-msm8960-cdp.dts        |    2 +-
 arch/arm/boot/dts/qcom-msm8960.dtsi           |   72 +-
 9 files changed, 2049 insertions(+), 2104 deletions(-)

-- 
2.35.1

