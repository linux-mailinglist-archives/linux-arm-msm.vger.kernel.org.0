Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3CA930949F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Jan 2021 12:01:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231641AbhA3K7I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 Jan 2021 05:59:08 -0500
Received: from msg-2.mailo.com ([213.182.54.12]:46758 "EHLO msg-2.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230009AbhA3K6n (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 Jan 2021 05:58:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailoo.org; s=mailo;
        t=1612004251; bh=DX0KTTrFGVD0t8K/Hn6+CMiQus9x+I24Qko3gjp+37o=;
        h=X-EA-Auth:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
         MIME-Version:Content-Transfer-Encoding;
        b=fITOEhLDZUVK0LAY4vivrIqzYBfoHj0Omhr34V+/150U6bWVKcG+K9lTolRZBQ00L
         uOSHgsm9EeX5qg1JAkEfmw5jg0vC8+OdFBaaPaz7WLCK2ir6FvpGslwTqIvrm1OrU3
         e3J00OMiK4Ktz3sWGPSM89F1mCAUxAdaJRhoptpo=
Received: by b-5.in.mailobj.net [192.168.90.15] with ESMTP
        via proxy.mailoo.org [213.182.55.207]
        Sat, 30 Jan 2021 11:57:31 +0100 (CET)
X-EA-Auth: LFW7+Bv4Fnp8Hhx30FmQbEE8yD9U4xVFuXeArjH+MWCgIqvOTvrq7gQGkmDf26svri6JeKDresRMgFvlD4aNAgUrDEGIqU87hpXv1D2Z+HE=
From:   Vincent Knecht <vincent.knecht@mailoo.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Vincent Knecht <vincent.knecht@mailoo.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Shawn Guo <shawnguo@kernel.org>,
        Daniel Palmer <daniel@0x0f.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Max Merchel <Max.Merchel@tq-group.com>,
        allen <allen.chen@ite.com.tw>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 0/4] Alcatel Idol 3 (4.7") smartphone support
Date:   Sat, 30 Jan 2021 11:57:09 +0100
Message-Id: <20210130105717.2628781-1-vincent.knecht@mailoo.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes in v2:
- Disable MDSS by default in msm8916.dtsi
- Split framebuffer suppport in its own patch
- v1 sent on 2021-01-29 didn't make it to the MLs for some reason...

The Alcatel Idol 3 (4.7") is a msm8916-based smartphone released in 2015.
This series adds support for framebuffer, USB, eMMC, SD-Card, WiFi,
BT, power/volume buttons, vibrator and the following sensors:
magnetometer, accelerometer, gyroscope, ambient light+proximity

Touchscreen support will be added later when MStar msg26xx is merged:
https://lore.kernel.org/linux-input/20210121174359.1455393-1-vincent.knecht@mailoo.org/T/

Vincent Knecht (4):
  dt-bindings: vendor-prefixes: add Alcatel
  arm64: dts: qcom: Add device tree for Alcatel Idol 3 (4.7")
  arm64: dts: qcom: Disable MDSS by default for 8916/8016 devices
  arm64: dts: qcom: msm8916-alcatel-idol347: Add framebuffer support

 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi     |   4 +
 .../boot/dts/qcom/msm8916-alcatel-idol347.dts | 322 ++++++++++++++++++
 .../qcom/msm8916-samsung-a2015-common.dtsi    |   4 +
 arch/arm64/boot/dts/qcom/msm8916.dtsi         |   1 +
 6 files changed, 334 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts

-- 
2.29.2



