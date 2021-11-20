Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E419A458081
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Nov 2021 22:42:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229990AbhKTVpt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Nov 2021 16:45:49 -0500
Received: from mx1.riseup.net ([198.252.153.129]:48814 "EHLO mx1.riseup.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229592AbhKTVpt (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Nov 2021 16:45:49 -0500
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
         client-signature RSA-PSS (2048 bits) client-digest SHA256)
        (Client CN "mail.riseup.net", Issuer "R3" (not verified))
        by mx1.riseup.net (Postfix) with ESMTPS id 4HxRpY39ZwzF3Ks;
        Sat, 20 Nov 2021 13:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
        t=1637444565; bh=lXnlmZyuldcgbKcDxDtNluCyzLe1l/1rCrru3pl13Fw=;
        h=From:To:Cc:Subject:Date:From;
        b=Dz3s4roUlF6AfmCe0qhgpasZ+X5ljQJHQwiOCUKSC4oDQgaA7Ye1XUBYjkvLJIcum
         +0AAvEHYoc/cAZh/sveD9q68lAHOM8PBQPcCNTq4wldnlqrnp0nfww4NAgNqRKbEvZ
         1GAG8G60sF+e3IicRJb6BnsS7NBwPuWZxys+edXI=
X-Riseup-User-ID: B7B96ECABFE8931E8CC678145B0D0899D233924240554C69F06489227D18AA92
Received: from [127.0.0.1] (localhost [127.0.0.1])
         by fews1.riseup.net (Postfix) with ESMTPSA id 4HxRpV1LJPz5vkF;
        Sat, 20 Nov 2021 13:42:41 -0800 (PST)
From:   Dang Huynh <danct12@riseup.net>
To:     Dang Huynh <danct12@riseup.net>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Alexey Min <alexey.min@gmail.com>,
        Caleb Connolly <caleb@connolly.tech>,
        Martin Botka <martin.botka@somainline.org>,
        Konrad Dybcio <konradybcio@gmail.com>
Subject: [PATCH v4 0/8] Improve support for Xiaomi Redmi Note 7
Date:   Sun, 21 Nov 2021 04:42:19 +0700
Message-Id: <20211120214227.779742-1-danct12@riseup.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series expand the Redmi Note 7 device port to support:
 + Regulators
 + Volume keys
 + eMMC and SD card slot
 + Framebuffer display
 + USB

Changes in v2:
 - Dropped linux,input-type from volume up as 1 is set by default.
 - Dropped gpio-key,wakeup as it's a legacy property name and is
not relevant for a volume button.
 - Rename label cont_splash_mem to framebuffer_mem and change node
name to memory.

Changes in v3:
 - Add voltage range for vph_pwr
 - Move RESIN to PM660 and make PON keys disabled by default 
 - Addressed review comments from Konrad
 - Make Alexey Min the author of the USB patch as he came up with
the patch first on downstream.

Changes in v4:
 - Dropped gpio.h from device tree as it's defined in sdm630.dtsi

Alexey Min (1):
  arm64: dts: qcom: sdm660-xiaomi-lavender: Add USB

Dang Huynh (7):
  arm64: dts: qcom: sdm630: Assign numbers to eMMC and SD
  arm64: dts: qcom: sdm630-pm660: Move RESIN to pm660 dtsi
  arm64: dts: qcom: sdm660-xiaomi-lavender: Add RPM and fixed regulators
  arm64: dts: qcom: sdm660-xiaomi-lavender: Add PWRKEY and RESIN
  arm64: dts: qcom: sdm660-xiaomi-lavender: Add volume up button
  arm64: dts: qcom: sdm660-xiaomi-lavender: Add eMMC and SD
  arm64: dts: qcom: sdm660-xiaomi-lavender: Enable Simple Framebuffer

 arch/arm64/boot/dts/qcom/pm660.dtsi           |  12 +-
 .../dts/qcom/sdm630-sony-xperia-nile.dtsi     |  16 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi          |   5 +
 .../boot/dts/qcom/sdm660-xiaomi-lavender.dts  | 352 ++++++++++++++++++
 4 files changed, 376 insertions(+), 9 deletions(-)

-- 
2.33.1

