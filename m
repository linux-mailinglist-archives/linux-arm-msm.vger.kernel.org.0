Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97175455168
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Nov 2021 01:03:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241755AbhKRAG0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Nov 2021 19:06:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240524AbhKRAGZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Nov 2021 19:06:25 -0500
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D15DEC061766
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Nov 2021 16:03:25 -0800 (PST)
Received: by mail-il1-x12c.google.com with SMTP id k1so4595888ilo.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Nov 2021 16:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T4C6L5TBbU4kgfmUFag70eO6fcEy2Yq/sVXvugLd598=;
        b=Tfvu4+IvmP30SYOhevoNp0pfuZqXmoANyJyTw+T9nQpXvP0OceU3JmPy2TwjEmmgnY
         YCnAsdsgIPlAbV/vLjYrLISDvJ7eHxeb+CmsOwts/OSleMg/kyr+VCdRUslQnSkseD+H
         5IHZY8PPytSBOX9mR3VwcxCvDaoDS+VPqd8n4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T4C6L5TBbU4kgfmUFag70eO6fcEy2Yq/sVXvugLd598=;
        b=jaxezAPZFBNxaKBauEm0FaAX04zDVIye3MQvKju+HxaW5Ymfx4O82ZiN9XI6Bw9fmU
         TiVxTScPfeAGOjFGe7LTrbgkn/Z5dB+AYgAE7By6JHT0BtmKp/HBLrM5HORViMWw2X1W
         GBKbUbWUkDxgZnBIFGzEDutARNYdeioxMPb3gPfduxnvXQXW63H88wQ/8SYscBoPb4OY
         06svf2x7Vs1pZRDUAmHSs3dnjZhgD9URE0lW4TtT93z7Z6iYiP4pW7k1YV0MmQ2dSFda
         OaakN/9OPVegZevaQWV1nxC6hzeOYtAN/BQDwwBX5a9znSrWurWUJfBd4Ug86EdwTAEN
         K/zw==
X-Gm-Message-State: AOAM533O2Z2MGVZltqQFLXRpxoPU5ijNR36aCNjy/To2P0v8uQAsXkY1
        e2dJKDYkbMxFH37HHzFeS3RefmNetvn48Q==
X-Google-Smtp-Source: ABdhPJzyq5pgRFwuqq3GsooSPtfmoyOi+BQ+bHcR9ihb+XLPlk6dBOCfvWGai2suaXHTVwb3gyaOIw==
X-Received: by 2002:a05:6e02:1847:: with SMTP id b7mr2320314ilv.23.1637193804743;
        Wed, 17 Nov 2021 16:03:24 -0800 (PST)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com. [209.85.166.41])
        by smtp.gmail.com with ESMTPSA id l1sm769812ioj.29.2021.11.17.16.03.23
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Nov 2021 16:03:23 -0800 (PST)
Received: by mail-io1-f41.google.com with SMTP id 14so5630308ioe.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Nov 2021 16:03:23 -0800 (PST)
X-Received: by 2002:a05:6638:2590:: with SMTP id s16mr17017643jat.93.1637193802654;
 Wed, 17 Nov 2021 16:03:22 -0800 (PST)
MIME-Version: 1.0
References: <20211116200739.924401-1-mka@chromium.org> <20211116120642.v17.4.Ie0d2c1214b767bb5551dd4cad38398bd40e4466f@changeid>
In-Reply-To: <20211116120642.v17.4.Ie0d2c1214b767bb5551dd4cad38398bd40e4466f@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 17 Nov 2021 16:03:10 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WK3uHJTehMxWiA56L5Ly8UqjmCKnJtXBut2aOYEV6C4g@mail.gmail.com>
Message-ID: <CAD=FV=WK3uHJTehMxWiA56L5Ly8UqjmCKnJtXBut2aOYEV6C4g@mail.gmail.com>
Subject: Re: [PATCH v17 4/7] arm64: dts: qcom: sc7180-trogdor: Add nodes for
 onboard USB hub
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Peter Chen <peter.chen@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, Roger Quadros <rogerq@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Bastien Nocera <hadess@hadess.net>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Nov 16, 2021 at 12:07 PM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> Add nodes for the onboard USB hub on trogdor devices. Remove the
> 'always-on' property from the hub regulator, since the regulator
> is now managed by the onboard_usb_hub driver.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>
> Changes in v17:
> - none
>
> Changes in v16:
> - none
>
> Changes in v15:
> - none
>
> Changes in v14:
> - none
>
> Changes in v13:
> - none
>
> Changes in v12:
> - none
>
> Changes in v11:
> - rebased on qcom/arm64-for-5.14 (with the rest of the series)
>
> Changes in v10:
> - keep 'regulator-boot-on' property
> - updated commit message
>
> Changes in v9:
> - none
>
> Changes in v8:
> - none
>
> Changes in v7:
> - rebased on qcom/arm64-for-5.13 (with the rest of the series)
>
> Changes in v6:
> - added 'companion-hub' entry to both USB devices
> - added 'vdd-supply' also to hub@2
>
> Changes in v5:
> - patch added to the series
>
>  .../boot/dts/qcom/sc7180-trogdor-lazor-r0.dts | 19 ++++++++-----------
>  .../boot/dts/qcom/sc7180-trogdor-lazor-r1.dts | 12 +++++-------
>  .../arm64/boot/dts/qcom/sc7180-trogdor-r1.dts | 19 ++++++++-----------
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  | 19 ++++++++++++++++++-
>  4 files changed, 39 insertions(+), 30 deletions(-)

sc7180-trogdor-pompom-r1.dts is missing? It seems to need similar
fixups to the early lazor/trogdor borads.

Other than that this looks good to me.

-Doug
