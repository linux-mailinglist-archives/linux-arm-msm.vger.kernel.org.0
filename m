Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49542287156
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Oct 2020 11:20:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726019AbgJHJUc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Oct 2020 05:20:32 -0400
Received: from mail-02.mail-europe.com ([51.89.119.103]:35370 "EHLO
        mail-02.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725845AbgJHJUb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Oct 2020 05:20:31 -0400
Date:   Thu, 08 Oct 2020 09:20:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1602148827;
        bh=QG1whq57fbEM+/9w5Qu88LrkP1LxU4WuYBwQ9YAs13E=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=Xz0LhMnOiN4Vgh/X0EikyRwYUMlRLkN5R6ZveI7XLnao+jq1GAPtfhAe1/DrkolMY
         hJJFscUgcLNqrW0QKmrqrJU/S8cMufUu3aTVI/HYboGGSk61UWxXLRjoxNQAbG+3eY
         gqcLVW6TtG3UJqP9zL9h1ps8mQM+DVWG2qViA5B4=
To:     linux-arm-msm@vger.kernel.org
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     ~postmarketos/upstreaming@lists.sr.ht
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: Re: Add support for the OnePlus 6 and 6T SDM845 devices
Message-ID: <c0ed9659-0c1a-803e-9c16-f864fd824462@connolly.tech>
In-Reply-To: <20201007174736.292968-1-caleb@connolly.tech>
References: <20201007174736.292968-1-caleb@connolly.tech>
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

On 2020-10-07 18:48, Caleb Connolly wrote:
> The OnePlus 6/T handsets are based on the SDM845 platform and were
> released in late 2017.
>
> Add a device tree with support for the following:
>    * Display panel (with the oneplus-6 panel driver)
>    * Hardware accelerated graphics
>    * Touch screen support with Synaptics rmi4
>    * RTC support
>    * Remoteprocessors boot and can be interacted with over QRTR.
>    * ath10k WLAN using pd-mapper, rmts and tqftpserv daemons
>    * Bluetooth
>    * Volume / power buttons and OnePlus Tri-State switch are functional
>    * USB
>
> The only differences between the devices is the different panels,
> fingerprint readers and that the 6T lacks a headphone jack and notificati=
on
> LED.
>
> Current limitations:
>    * Bluetooth does not appear in rfkill, this is most likely the reason
>      it doesn't appear in UI bluetooth settings, it can be interacted
>      with using bluez-utils bluetoothctl.
>    * USB is forced to peripheral mode as cable type detection is broken

Missed here, these patches depend on Bjorns SMMU patches to boot with=20
the display enabled, and disabling the display is not possible on newer=20
firmware.

https://lore.kernel.org/linux-arm-msm/20200904155513.282067-1-bjorn.anderss=
on@linaro.org/t/

>
> drm/panel/oneplus6: Add panel-oneplus6
> dt-bindings: panel: add documentation for oneplus6 panel
> arm64: dts: sdm845: add oneplus 6/t devices
> dt-bindings: add vendor bindings for OnePlus
> i2c: geni: sdm845: dont perform DMA for the oneplus6
>
> Documentation/devicetree/bindings/arm/oneplus/oneplus-boards.yaml   |  25=
 --
> Documentation/devicetree/bindings/display/panel/panel-oneplus6.yaml |  73=
 ----
> Documentation/devicetree/bindings/vendor-prefixes.yaml              |   2=
 -
> arch/arm64/boot/dts/qcom/Makefile                                   |   2=
 -
> arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi                 | 860=
 ---------------------------------------
> arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts               |  19=
 -
> arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts                  |  19=
 -
> drivers/gpu/drm/panel/Kconfig                                       |  10=
 -
> drivers/gpu/drm/panel/Makefile                                      |   1=
 -
>
>
>


