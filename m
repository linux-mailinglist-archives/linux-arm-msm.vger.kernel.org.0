Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 728033FE314
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Sep 2021 21:33:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231192AbhIATeX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Sep 2021 15:34:23 -0400
Received: from mail-4319.protonmail.ch ([185.70.43.19]:36665 "EHLO
        mail-4319.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245715AbhIATeW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Sep 2021 15:34:22 -0400
X-Greylist: delayed 26243 seconds by postgrey-1.27 at vger.kernel.org; Wed, 01 Sep 2021 15:34:22 EDT
Date:   Wed, 01 Sep 2021 19:33:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1630524803;
        bh=sSDzVTTrE408jUhidHBHISAmsEwqh1RTwW36cNCflTc=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=v0kUj6kz/dnIVIH4/aaBUJhO7RixPdl2c3PRIvjdYgtt2JSu/8J0sadQ5j/n7w/uj
         iU3oQQIStTdzfvmdGpLcX4h0b2e3ked3W2fnMwYR0j+Kpu8NpV7h/vWbAiCuEa7Chh
         nL2FVVawEu9+O8/Ya9PXKvm/2lYCCBQfGHhErKAA=
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
From:   Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        Raffaele Tranquillini <raffaele.tranquillini@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Reply-To: Yassine Oudjana <y.oudjana@protonmail.com>
Subject: [PATCH 0/4] Add support for the Xiaomi MSM8996 platform
Message-ID: <20210901193214.250375-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series adds support for the Xiaomi MSM8996 platform, which includes 5 =
devices:

 - Mi 5 (gemini): MSM8996 + PMI8994
 - Mi Note 2 (scorpio): MSM8996 Pro + PMI8996
 - Mi 5s (capricorn): MSM8996 Pro + PMI8996
 - Mi Mix (lithium): MSM8996 Pro + PMI8996
 - Mi 5s Plus (natrium): MSM8996 Pro + PMI8996

These devices share a common board design with only a few differences.
Out of these 5 devices, this series adds initial support for the Mi Note 2 =
and the Mi 5.
Adding support for the remaining 3 would only require adding a DTS for each=
, while
accounting for hardware differences such as different panels.

Raffaele Tranquillini (1):
  arm64: dts: qcom: msm8996: xiaomi-gemini: Add support for Xiaomi Mi 5

Yassine Oudjana (3):
  arm64: dts: qcom: db820c: Move blsp1_uart2 pin states to msm8996.dtsi
  arm64: dts: qcom: msm8996: Add blsp2_i2c3
  arm64: dts: qcom: Add support for the Xiaomi MSM8996 platform

 arch/arm64/boot/dts/qcom/Makefile             |   2 +
 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi  |  29 -
 .../boot/dts/qcom/msm8996-xiaomi-common.dtsi  | 673 ++++++++++++++++++
 .../boot/dts/qcom/msm8996-xiaomi-gemini.dts   | 431 +++++++++++
 .../boot/dts/qcom/msm8996-xiaomi-scorpio.dts  | 431 +++++++++++
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |  49 ++
 6 files changed, 1586 insertions(+), 29 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dts

--=20
2.33.0


