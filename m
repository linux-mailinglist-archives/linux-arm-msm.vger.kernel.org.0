Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D703A2865C1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Oct 2020 19:19:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726469AbgJGRTx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Oct 2020 13:19:53 -0400
Received: from mail-41103.protonmail.ch ([185.70.41.103]:22199 "EHLO
        mail-41103.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726168AbgJGRTx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Oct 2020 13:19:53 -0400
Received: from mail-03.mail-europe.com (mail-03.mail-europe.com [91.134.188.129])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        by mail-41103.protonmail.ch (Postfix) with ESMTPS id 5158920000A6
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2020 17:19:07 +0000 (UTC)
Authentication-Results: mail-41103.protonmail.ch;
        dkim=pass (1024-bit key) header.d=connolly.tech header.i=@connolly.tech header.b="cb7Zc9mR"
Date:   Wed, 07 Oct 2020 17:19:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1602091143;
        bh=/TN0dB36LX1iPY9Cqx1tnVBqAenp1YOFkDNmCj0ihn4=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=cb7Zc9mRinmZip4oXDBrHBLR4gthOtwIM/zOUhZOpLwh3ivVJMYom0eA+XfUhNU7O
         zBOxFP2Z18fDw78aElVyU59SE10LjJdAsF2bq7PKl3cLbWU9OjYqk0feFLUihdDMrj
         fsE6FN2ntDkH+Nqu/m7hky7PW4Ib6FO0xxSd+pWM=
To:     linux-arm-msm@vger.kernel.org
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     ~postmarketos/upstreaming@lists.sr.ht
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: Add support for the OnePlus 6 and 6T SDM845 devices
Message-ID: <20201007171807.285298-1-caleb@connolly.tech>
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



