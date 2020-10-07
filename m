Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45B3A286629
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Oct 2020 19:48:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728291AbgJGRso (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Oct 2020 13:48:44 -0400
Received: from mail-02.mail-europe.com ([51.89.119.103]:46624 "EHLO
        mail-02.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727828AbgJGRso (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Oct 2020 13:48:44 -0400
X-Greylist: delayed 1655 seconds by postgrey-1.27 at vger.kernel.org; Wed, 07 Oct 2020 13:48:43 EDT
Date:   Wed, 07 Oct 2020 17:48:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1602092920;
        bh=rf+Xk6M62tcgJFPQJh5BhQJs2oPURENWrXphLmq9bLA=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=kbTB0Iu5A+GCp6/09j4UG/qFmN9ibFqqpi55QDu0oj06hnCQDI8CrdYg2lCzHGsxc
         mUJndPYhF7982SqRGYaUOEw0GvCdzDmVlr1YI7z2EhiBNA2Ezy1q0DuRqCn2Airs7d
         quCO6q5fAA5OMWXytlNqcgijqpg2tfFKdAflJ20I=
To:     linux-arm-msm@vger.kernel.org
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     ~postmarketos/upstreaming@lists.sr.ht
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: Add support for the OnePlus 6 and 6T SDM845 devices
Message-ID: <20201007174736.292968-1-caleb@connolly.tech>
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
released in late 2017.

Add a device tree with support for the following:
  * Display panel (with the oneplus-6 panel driver)
  * Hardware accelerated graphics
  * Touch screen support with Synaptics rmi4
  * RTC support
  * Remoteprocessors boot and can be interacted with over QRTR.
  * ath10k WLAN using pd-mapper, rmts and tqftpserv daemons
  * Bluetooth
  * Volume / power buttons and OnePlus Tri-State switch are functional
  * USB

The only differences between the devices is the different panels,
fingerprint readers and that the 6T lacks a headphone jack and notification
LED.

Current limitations:
  * Bluetooth does not appear in rfkill, this is most likely the reason
    it doesn't appear in UI bluetooth settings, it can be interacted
    with using bluez-utils bluetoothctl.
  * USB is forced to peripheral mode as cable type detection is broken


drm/panel/oneplus6: Add panel-oneplus6
dt-bindings: panel: add documentation for oneplus6 panel
arm64: dts: sdm845: add oneplus 6/t devices
dt-bindings: add vendor bindings for OnePlus
i2c: geni: sdm845: dont perform DMA for the oneplus6

Documentation/devicetree/bindings/arm/oneplus/oneplus-boards.yaml   |  25 -=
-
Documentation/devicetree/bindings/display/panel/panel-oneplus6.yaml |  73 -=
---
Documentation/devicetree/bindings/vendor-prefixes.yaml              |   2 -
arch/arm64/boot/dts/qcom/Makefile                                   |   2 -
arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi                 | 860 -=
--------------------------------------
arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts               |  19 -
arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts                  |  19 -
drivers/gpu/drm/panel/Kconfig                                       |  10 -
drivers/gpu/drm/panel/Makefile                                      |   1 -


