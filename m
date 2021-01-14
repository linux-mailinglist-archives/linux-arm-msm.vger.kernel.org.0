Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 196E02F6A20
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jan 2021 19:57:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727323AbhANSyn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jan 2021 13:54:43 -0500
Received: from mail-40131.protonmail.ch ([185.70.40.131]:27492 "EHLO
        mail-40131.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726545AbhANSyi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jan 2021 13:54:38 -0500
Date:   Thu, 14 Jan 2021 18:53:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1610650431;
        bh=b0puezys5gUmtjdZQGXnA1hBPG/88OTvVzGDhqurC7U=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=ASpqwWjtwk8OWLugG2q0I08zCWufQJFiU+isXpyg+lXouhEK1+T3Yqelfw/xs52Q3
         0YxEogCnO5QvBKLrprFS3aTai95XbzE9sqCzyHsvM7xftNFPvCUgijiirlNhJ4TnWC
         u/1HBshpCKa4P0TpjbCz88Q0V4y3rZ5yNyoypYug=
To:     caleb@connolly.tech, linux-arm-msm@vger.kernel.org
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: [PATCH v3] Add support for the OnePlus 6 and 6T
Message-ID: <20210114185227.25265-1-caleb@connolly.tech>
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

 * Display panels and hardware accelerated graphics
 * Touch screen with Synaptics RMI4
 * Modem and other remoteprocessors
 * WiFi / Bluetooth
 * Buttons
 * USB gadget mode

Both devices are almost identical, but use different display panels,
with the 6T lacking a headphone jack and notification LED.

The panel driver for the devices is already upstream, although the driver
doesn't seem to work on the 6T, all other functionality does however.
I'm in the process of obtaining a device to get the driver fixed ASAP.

---

Caleb Connolly (2):
      arm64: dts: sdm845: add oneplus6/6t devices
      dt-bindings: Document bindings for new SDM845 devices

Documentation/devicetree/bindings/arm/qcom.yaml      |   5 +
.../devicetree/bindings/vendor-prefixes.yaml         |   2 +
arch/arm64/boot/dts/qcom/Makefile                    |   2 +
arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi  | 621 ++++++++++++++++=
++++++
.../arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts |  19 +
arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts   |  23 +
6 files changed, 672 insertions(+)





