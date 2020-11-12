Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D58942B09F7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Nov 2020 17:28:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727739AbgKLQ2Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Nov 2020 11:28:24 -0500
Received: from mail2.protonmail.ch ([185.70.40.22]:34103 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727863AbgKLQ2X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Nov 2020 11:28:23 -0500
X-Greylist: delayed 377 seconds by postgrey-1.27 at vger.kernel.org; Thu, 12 Nov 2020 11:28:22 EST
Date:   Thu, 12 Nov 2020 16:28:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1605198501;
        bh=5FmF3V/1bOBRwV89YfAJNVoOxE4was21MuddwDzgZxc=;
        h=Date:To:From:Reply-To:Subject:In-Reply-To:References:From;
        b=R/NnRABceKacVAbcvoK3IorpKla+WOGejzxZvoaxUIA2qAg+m7Ky7r9xHAMPbMU9g
         axzfq3ehL2xN9SEZuyo2/TGFBt78XvE9zXnnZLTALfmdBuhnclyt8oqc0hXG8p8rGV
         zQthfXB06PuUqrcd6dW47srmGWoAqIReXTwV2IOA=
To:     linux-arm-msm@vger.kernel.org
From:   Caleb Connolly <caleb@connolly.tech>
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: Re: Add support for the OnePlus 6 and 6T SDM845 devices
Message-ID: <b8896b2e-9889-f0f3-b277-a8fc2aeab83d@connolly.tech>
In-Reply-To: <20201112161920.2671430-1-caleb@connolly.tech>
References: <20201112161920.2671430-1-caleb@connolly.tech>
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

This is V2 of the series, it should have been set in the subject line=20
but doesn't seem to have been.

It includes the following changes from V1:

 =C2=A0* Amendments to the panel driver regarding Sam's comments
 =C2=A0* DTS formatting improvements.

Sorry for any confusion caused.
Regards,
Caleb

On 2020-11-12 16:21, Caleb Connolly wrote:
> The OnePlus 6/T handsets are based on the SDM845 platform and were
> released in late 2017. Add support for booting with core
> functionality including:
>
>   * Display panels and hardware accelerated graphics
>   * Touch screen with Synaptics RMI4
>   * Modem and other remoteprocessors
>   * WiFi / Bluetooth
>   * Buttons and OnePlus Tri-State key
>   * USB gadget mode
>
> Both devices are almost identical, but use different display panels,
> with the 6T lacking a headphone jack and notification LED.
>
> This series depends on the SMMU stream mapping patches which can be
> found here:
> https://lore.kernel.org/linux-iommu/20201017043907.2656013-1-bjorn.anders=
son@linaro.org/
>
> The devices will fail early in the boot process otherwise.
>
>    drm/panel/samsung-sofef00: Add panel for OnePlus 6/T devices
>    dt-bindings: panel-simple-dsi: add samsung panels for OnePlus 6/T
>    arm64: dts: sdm845: add oneplus 6/t devices
>    dt-bindings: add vendor bindings for OnePlus
>    i2c: geni: sdm845: dont perform DMA for OnePlus 6 devices
>
>   .../bindings/arm/oneplus/oneplus-boards.yaml          |  25 +
>   .../bindings/display/panel/panel-simple-dsi.yaml      |   4 +
>   .../devicetree/bindings/vendor-prefixes.yaml          |   2 +
>   arch/arm64/boot/dts/qcom/Makefile                     |   2 +
>   arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi   | 822 +++++++++++=
+++++++++++
>   arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts |  19 +
>   arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts    |  23 +
>   drivers/gpu/drm/panel/Kconfig                         |  12 +
>   drivers/gpu/drm/panel/Makefile                        |   1 +
>   drivers/gpu/drm/panel/panel-samsung-sofef00.c         | 353 ++++++++++
>   drivers/i2c/busses/i2c-qcom-geni.c                    |   6 +-
>   11 files changed, 1267 insertions(+), 2 deletions(-)
>
>
>
>


