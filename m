Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC47C2F6C10
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jan 2021 21:32:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726461AbhANUcW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jan 2021 15:32:22 -0500
Received: from mail-40133.protonmail.ch ([185.70.40.133]:31025 "EHLO
        mail-40133.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726459AbhANUcW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jan 2021 15:32:22 -0500
Date:   Thu, 14 Jan 2021 20:31:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1610656299;
        bh=Yg6RHGgCddPCyY4Nm0i4HjwCtKqjYWU1hX1p6lV+HIE=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=iKjr+CmTbD7nblZYC4Dxqp7M5OrdwycAETYnJi6A29EhDqR36qUqBRZ+SVxejlvjR
         JETusAYeEP4bfYGVlmX4H2WfWv5vZvLZ7tQxfr4ovg3JFQZK7x1vKSSqCz9LH5gtWd
         iWOBTVNPYGzqfRfQBvbIuDXtKf/V8TVYGMb1QrP0=
To:     caleb@connolly.tech, linux-arm-msm@vger.kernel.org
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: [PATCH v4] Add support for the OnePlus 6 and 6T
Message-ID: <20210114203057.64541-1-caleb@connolly.tech>
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

The panel driver for the devices is already upstream, however the driver
doesn't seem to work on the 6T, all other functionality does however.
I'm in the process of obtaining a device to get the driver fixed ASAP.
---
Changes since v1
 * Remove unused pinctrl nodes
 * Properly model touchscreen vio supply GPIO
 * Improve comments
 * Remove bq27541 battery as it doesn't work

Changes since v2
 * Specify clock frequency of touchscreen i2c
 * Remove tri-state-key nodes until a better solution can be found
 * Cleaned up pinctrl nodes
 * Remove unused regulators
 * Improve formatting
 * Address Bjorn's comments
 * Remove unused regulators

Changes since v3
 * Address Konrad's comments
---
Caleb Connolly (2):
      arm64: dts: sdm845: add oneplus6/6t devices
      dt-bindings: Document bindings for new SDM845 devices

Documentation/devicetree/bindings/arm/qcom.yaml  |   5 +
.../devicetree/bindings/vendor-prefixes.yaml     |   2 +
arch/arm64/boot/dts/qcom/Makefile                |   2 +
.../boot/dts/qcom/sdm845-oneplus-common.dtsi     | 622 +++++++++++++++++++
.../boot/dts/qcom/sdm845-oneplus-enchilada.dts   |  19 +
.../boot/dts/qcom/sdm845-oneplus-fajita.dts      |  23 +
6 files changed, 673 insertions(+)


