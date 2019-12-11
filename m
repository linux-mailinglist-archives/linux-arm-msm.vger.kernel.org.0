Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 979F511C015
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2019 23:47:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726463AbfLKWrv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Dec 2019 17:47:51 -0500
Received: from mail-il1-f195.google.com ([209.85.166.195]:42725 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726518AbfLKWrv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Dec 2019 17:47:51 -0500
Received: by mail-il1-f195.google.com with SMTP id f6so284847ilh.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2019 14:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1r7bbFb7oJgGBdqZ0SCWluBGjxFxUq9kfW1qtiJYFQE=;
        b=nTEeQ13NOraW2TRdVVr19eQqaxBh7/d5/OQfm1sl20BBJCpCBBPBGI+X9Stm5w3tD7
         avT/gbZ4vjcRBZWZhwLAk9oyI5s4te+KpcyDRfSk2qUcKkaF68irXOUFaxm10Bcr6SnZ
         AYOlrqPwZk/O4RmIDUXvYirp675oauG3tFEc0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1r7bbFb7oJgGBdqZ0SCWluBGjxFxUq9kfW1qtiJYFQE=;
        b=qIPKFJsggLf8/KhNPdIVZPbbjk4bL1pMs64ugYGM6YwtBua0JFeG8dOZ+X/xbV4MqS
         /0DPCXX49qkvKk+DCicrXMOHsiaCCHIuxrG8+cmY7PK31gpUccrTHRRC5X601w+jfHB2
         8Rx2m4YMDWStuNrOpor4YZ1eL4GgdD+ZywcKM9O4c5gyln6lRp054PxhVMUjhVF05GLX
         JJEtHujKkw08yTRQ7n3NsMC/5CX1i+eLElsUSURkZSTlHMklzDLfaPQHbpm4rjy9ohvA
         7euxH2m3Mi2cfJeehJj7R340LxpblXhhU61AwXRsQMr6oCZKjC2UTkKrKGKWAWV2NFFW
         z7CA==
X-Gm-Message-State: APjAAAVuMXNmUGGJRsFFVj/1hX8HHhvfkBPsd/a5sVHAfa6lt8gUa6y4
        J1G0b20x0v9Qe2HuqmBgsl4OPrA3QIM=
X-Google-Smtp-Source: APXvYqxT8bfkv/2BEmKRb2w34jidKN6udRnD/wEKCl1AsKkpLxEpke7bra4EPAHMNQ5AXHzadGLCuw==
X-Received: by 2002:a92:b657:: with SMTP id s84mr5054801ili.253.1576104470327;
        Wed, 11 Dec 2019 14:47:50 -0800 (PST)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com. [209.85.166.44])
        by smtp.gmail.com with ESMTPSA id i83sm1109011ilf.65.2019.12.11.14.47.48
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2019 14:47:49 -0800 (PST)
Received: by mail-io1-f44.google.com with SMTP id c16so574091ioo.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2019 14:47:48 -0800 (PST)
X-Received: by 2002:a6b:be84:: with SMTP id o126mr503493iof.269.1576104467910;
 Wed, 11 Dec 2019 14:47:47 -0800 (PST)
MIME-Version: 1.0
References: <1575520881-31458-1-git-send-email-sanm@codeaurora.org> <1575520881-31458-2-git-send-email-sanm@codeaurora.org>
In-Reply-To: <1575520881-31458-2-git-send-email-sanm@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 11 Dec 2019 14:47:36 -0800
X-Gmail-Original-Message-ID: <CAD=FV=W_z=_j==DSFbtCmTihmSyRtH85VnKpw03E=gATcqJx2Q@mail.gmail.com>
Message-ID: <CAD=FV=W_z=_j==DSFbtCmTihmSyRtH85VnKpw03E=gATcqJx2Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] phy: qcom-qusb2: Add QUSB2 PHY support for SC7180
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Manu Gautam <mgautam@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Dec 4, 2019 at 8:43 PM Sandeep Maheswaram <sanm@codeaurora.org> wrote:
>
> Add QUSB2 PHY config data and compatible for SC7180.
>
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qusb2.c | 57 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 56 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> index bf94a52..32a567b 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * Copyright (c) 2017, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2017-2019, The Linux Foundation. All rights reserved.
>   */
>
>  #include <linux/clk.h>
> @@ -177,6 +177,41 @@ static const struct qusb2_phy_init_tbl msm8998_init_tbl[] = {
>         QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_DIGITAL_TIMERS_TWO, 0x19),
>  };
>
> +static const unsigned int sc7180_regs_layout[] = {
> +       [QUSB2PHY_PLL_CORE_INPUT_OVERRIDE] = 0xa8,
> +       [QUSB2PHY_PLL_STATUS]           = 0x1a0,
> +       [QUSB2PHY_PORT_TUNE1]           = 0x240,
> +       [QUSB2PHY_PORT_TUNE2]           = 0x244,
> +       [QUSB2PHY_PORT_TUNE3]           = 0x248,
> +       [QUSB2PHY_PORT_TUNE4]           = 0x24c,
> +       [QUSB2PHY_PORT_TUNE5]           = 0x250,
> +       [QUSB2PHY_PORT_TEST1]           = 0x254,
> +       [QUSB2PHY_PORT_TEST2]           = 0x258,
> +       [QUSB2PHY_PORT_POWERDOWN]       = 0x210,
> +       [QUSB2PHY_INTR_CTRL]            = 0x230,
> +};

This table is exactly the same as "sdm845_regs_layout".  Just refer to
the "sdm845_regs_layout" below.  This should be OK because in general
the Linux convention is to name things (filenames, drivers, etc) based
on the first SoC that used it, but if it really bothers you you can
add a comment.  ;-)


> +static const struct qusb2_phy_init_tbl sc7180_init_tbl[] = {
> +       QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_ANALOG_CONTROLS_TWO, 0x03),
> +       QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_CLOCK_INVERTERS, 0x7c),
> +       QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_CMODE, 0x80),
> +       QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_LOCK_DELAY, 0x0a),
> +       QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_DIGITAL_TIMERS_TWO, 0x19),
> +       QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_BIAS_CONTROL_1, 0x40),
> +       QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_BIAS_CONTROL_2, 0x22),

Compared to sdm845, I see PLL_BIAS_CONTROL_2, was 0x20 and now it's
0x22.  Is this really a SoC-level tuning value (should be 0x22 on 100%
of all sc7180 boards and 0x20 on 100% of all sdm845 boards), or is
this really a board-specific tuning parameter that we need a device
tree property to control?


> +       QUSB2_PHY_INIT_CFG(QUSB2PHY_PWR_CTRL2, 0x21),
> +       QUSB2_PHY_INIT_CFG(QUSB2PHY_IMP_CTRL1, 0x08),

Compared to sdm845, I see IMP_CTRL1 was 0x0 and now it's 0x8.  If I
understand correctly, though, this is a board-specific tuning
parameter.  ...and, in fact, the device tree that's been submitted for
sc7180-idp has:

qcom,imp-res-offset-value = <8>;

...so I think you should match sdm845 and leave this as 0x0.


> +       QUSB2_PHY_INIT_CFG(QUSB2PHY_IMP_CTRL2, 0x58),
> +
> +       QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE1, 0xc5),

Compared to sdm845, I see PORT_TUNE1 was 0x30 and now it's 0xc5.  If I
understand correctly, though, this is a board-specific tuning
parameter and should be controlled by:

override_hstx_trim
override_preemphasis
override_preemphasis_width

...so you should make sure those are set right and then leave this as
matching sdm845.  If we truly think that (for some reason) nearly all
sc7180 boards will need a value that's closer to 0xc5 then we could
possibly justify this change, but I'd need a lot of convincing.


> +       QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE2, 0x29),
> +       QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE3, 0xca),
> +       QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE4, 0x04),
> +       QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE5, 0x03),
> +
> +       QUSB2_PHY_INIT_CFG(QUSB2PHY_CHG_CTRL2, 0x30),

Compared to sdm845, I see CHG_CTRL2 was 0x0 and now it's 0x30.  Is
this really a SoC-level tuning value (should be 0x30 on 100% of all
sc7180 boards and 0x0 on 100% of all sdm845 boards), or is this really
a board-specific tuning parameter that we need a device tree property
to control?


Overall summary is that from everything i see I think:

1. Probably the BIAS_CONTROL_2 and CHG_CTRL2 changes are really board
specific and need device tree properties.

2. Once we add the device tree properties, I think we can just totally
get rid of the sc7180 tables.  Then in the sc7180 device tree we could
probably do:

"qcom,sc7180-qusb2-phy", "qcom,sdm845-qusb2-phy";

...which says that we have a sc7180 PHY but it's (as far as we know)
compatible with the sdm845 PHY driver.  Then we don't need any sc7180
changes in this file at all.


> +};
> +
>  static const unsigned int sdm845_regs_layout[] = {
>         [QUSB2PHY_PLL_CORE_INPUT_OVERRIDE] = 0xa8,
>         [QUSB2PHY_PLL_STATUS]           = 0x1a0,
> @@ -212,6 +247,8 @@ static const struct qusb2_phy_init_tbl sdm845_init_tbl[] = {
>         QUSB2_PHY_INIT_CFG(QUSB2PHY_CHG_CTRL2, 0x0),
>  };
>
> +
> +

Eliminate arbitrary spacing changes from your patch.


>  struct qusb2_phy_cfg {
>         const struct qusb2_phy_init_tbl *tbl;
>         /* number of entries in the table */
> @@ -258,6 +295,19 @@ static const struct qusb2_phy_cfg msm8998_phy_cfg = {
>         .update_tune1_with_efuse = true,
>  };
>
> +static const struct qusb2_phy_cfg sc7180_phy_cfg = {
> +       .tbl            = sc7180_init_tbl,
> +       .tbl_num        = ARRAY_SIZE(sc7180_init_tbl),
> +       .regs           = sc7180_regs_layout,
> +
> +       .disable_ctrl   = (PWR_CTRL1_VREF_SUPPLY_TRIM | PWR_CTRL1_CLAMP_N_EN |
> +                          POWER_DOWN),
> +       .mask_core_ready = CORE_READY_STATUS,
> +       .has_pll_override = true,
> +       .autoresume_en    = BIT(0),
> +       .update_tune1_with_efuse = true,
> +};
> +
>  static const struct qusb2_phy_cfg sdm845_phy_cfg = {
>         .tbl            = sdm845_init_tbl,
>         .tbl_num        = ARRAY_SIZE(sdm845_init_tbl),
> @@ -271,6 +321,8 @@ static const struct qusb2_phy_cfg sdm845_phy_cfg = {
>         .update_tune1_with_efuse = true,
>  };
>
> +
> +

Eliminate arbitrary spacing changes from your patch.


-Doug
