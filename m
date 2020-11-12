Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 842192B09BE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Nov 2020 17:21:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728701AbgKLQVM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Nov 2020 11:21:12 -0500
Received: from mail-40131.protonmail.ch ([185.70.40.131]:48482 "EHLO
        mail-40131.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728682AbgKLQVL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Nov 2020 11:21:11 -0500
Date:   Thu, 12 Nov 2020 16:21:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1605198069;
        bh=5KoIZ9U3VhmnotkUs4i78bk4cebIfwu8l0GYH39R9GM=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=FAZhyOvK/h7XvOKxm+w4uaplz579Tt4EMHlCRZdcYNBXeLUgni3HJCmG0MCJOk2VK
         SR37Eg9cr4Jo5CYlsEzDV0QrLCRk44s5HjEOHF9dgFYMLLQ8m8I/gxJ2NU+xEuYFPi
         jZF5s8dSXdpoQhWuGk2r+NHpulmnwHNFgPaGF1DU=
To:     linux-arm-msm@vger.kernel.org
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: Add support for the OnePlus 6 and 6T SDM845 devices
Message-ID: <20201112161920.2671430-1-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The OnePlus 6/T handsets are based on the SDM845 platform and were
released in late 2017. Add support for booting with core
functionality including:

 * Display panels and hardware accelerated graphics
 * Touch screen with Synaptics RMI4
 * Modem and other remoteprocessors
 * WiFi / Bluetooth
 * Buttons and OnePlus Tri-State key
 * USB gadget mode

Both devices are almost identical, but use different display panels,
with the 6T lacking a headphone jack and notification LED.

This series depends on the SMMU stream mapping patches which can be
found here:
https://lore.kernel.org/linux-iommu/20201017043907.2656013-1-bjorn.andersso=
n@linaro.org/

The devices will fail early in the boot process otherwise.

  drm/panel/samsung-sofef00: Add panel for OnePlus 6/T devices
  dt-bindings: panel-simple-dsi: add samsung panels for OnePlus 6/T
  arm64: dts: sdm845: add oneplus 6/t devices
  dt-bindings: add vendor bindings for OnePlus
  i2c: geni: sdm845: dont perform DMA for OnePlus 6 devices

 .../bindings/arm/oneplus/oneplus-boards.yaml          |  25 +
 .../bindings/display/panel/panel-simple-dsi.yaml      |   4 +
 .../devicetree/bindings/vendor-prefixes.yaml          |   2 +
 arch/arm64/boot/dts/qcom/Makefile                     |   2 +
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi   | 822 ++++++++++++++=
++++++++
 arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts |  19 +
 arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts    |  23 +
 drivers/gpu/drm/panel/Kconfig                         |  12 +
 drivers/gpu/drm/panel/Makefile                        |   1 +
 drivers/gpu/drm/panel/panel-samsung-sofef00.c         | 353 ++++++++++
 drivers/i2c/busses/i2c-qcom-geni.c                    |   6 +-
 11 files changed, 1267 insertions(+), 2 deletions(-)



