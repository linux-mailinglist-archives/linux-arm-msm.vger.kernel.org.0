Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9589427337D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Sep 2020 22:06:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726357AbgIUUGr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Sep 2020 16:06:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726365AbgIUUGr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Sep 2020 16:06:47 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB339C0613D0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 13:06:46 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id u3so324455pjr.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 13:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=fk5l1rYUzO0ybCk4A3F2BkR5LYYdanHtPPjxTG5/0d8=;
        b=WIzdwvasP8t0HrRCu8yc5TdvxQsreyyCYZRlnBUf0JdNhMQd66S71nrJul5hUFJsBG
         wAscXjDFJvFvh1SVZH1YIMbQ27q4js2I1XSKfwijeCUnDA9wVfrMMQowe1roe7p0rD2S
         Zj3jaj6qHJumXJG5OXLZ1hHBCJUnUUeQC/wg8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=fk5l1rYUzO0ybCk4A3F2BkR5LYYdanHtPPjxTG5/0d8=;
        b=P/IzWZWuKteLBCQ1+uSjr1Uz2bq2ClcNqC4ShhESEJQWxKJgELuV38q7Ye2TGo5L4h
         9smVjFxbvWzIj1BhfyHyN0ysagE3qF/HQ46PAub2h/1WxAOSPoFM1uXzoz1kkunHRsw/
         drV3djsNf1rVfR7vbrnnv2OM4tJUwZzCXMydAiRcoxZoxWadgC6eO45E88gztrs1thOn
         APTo2ONX4x0d2OQHPxXa/Xnw5uxn3bHHFZywi1fWJcmCcltp1PFKrvTiu+AZ+Bup7CAu
         PdElbAV19JgqKAGCOsHBk+b4YYxbDomz14TRF9tcvppvRyXQ7PNdjmnEjL8955m5Kfzv
         J1+w==
X-Gm-Message-State: AOAM531Usp+HWuNIe8Zwev2fOwcMxyW/PEam6LdedTzmIi7Z1GQ2W3zv
        Hs8H4d6fruxKgBoxv7tZNpO+OZmzFTuwpA==
X-Google-Smtp-Source: ABdhPJx0cY5Ezo0eFWBoMpO9bhA7K4lcgpnb2b1Kia26kNO3yYGxayjvac+a5aGTNLXOCrBxMpH2mg==
X-Received: by 2002:a17:90b:4a04:: with SMTP id kk4mr864857pjb.84.1600718806123;
        Mon, 21 Sep 2020 13:06:46 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id x62sm3794171pfx.20.2020.09.21.13.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 13:06:45 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200918174511.v2.1.I997a428f58ef9d48b37a27a028360f34e66c00ec@changeid>
References: <20200918174511.v2.1.I997a428f58ef9d48b37a27a028360f34e66c00ec@changeid>
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: sc7180: Provide pinconf for SPI to use GPIO for CS
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, akashast@codeaurora.org,
        Douglas Anderson <dianders@chromium.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>
Date:   Mon, 21 Sep 2020 13:06:43 -0700
Message-ID: <160071880378.4188128.9400472825927726259@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2020-09-18 17:45:27)
> When the chip select line is controlled by the QUP, changing CS is a
> time consuming operation.  We have to send a command over to the geni
> and wait for it to Ack us every time we want to change (both making it
> high and low).  To send this command we have to make a choice in
> software when we want to control the chip select, we have to either:
> A) Wait for the Ack via interrupt which slows down all SPI transfers
>    (and incurrs extra processing associated with interrupts).
> B) Sit in a loop and poll, waiting for the Ack.
>=20
> Neither A) nor B) is a great option.
>=20
> We can avoid all of this by realizing that, at least on some boards,
> there is no advantage of considering this line to be a geni line.
> While it's true that geni _can_ control the line, it's also true that
> the line can be a GPIO and there is no downside of viewing it that
> way.  Setting a GPIO is a simple MMIO operation.
>=20
> This patch provides definitions so a board can easily select the GPIO
> mode.
>=20
> NOTE: apparently, it's possible to run the geni in "GSI" mode.  In GSI
> the SPI port is allowed to be controlled by more than one user (like
> firmware and Linux) and also the port can operate sequences of
> operations in one go.  In GSI mode it _would_ be invalid to look at
> the chip select as a GPIO because that would prevent other users from
> using it.  In theory GSI mode would also avoid some overhead by
> allowing us to sequence the chip select better.  However, I'll argue
> GSI is not relevant for all boards (and certainly not any boards
> supported by mainline today).  Why?
> - Apparently to run a SPI chip in GSI mode you need to initialize it
>   (in the bootloader) with a different firmware and then it will
>   always run in GSI mode.  Since there is no support for GSI mode in
>   the current Linux driver, it must be that existing boards don't have
>   firmware that's doing that.  Note that the kernel device tree
>   describes hardware but also firmware, so it is legitimate to make
>   the assumption that we don't have GSI firmware in a given dts file.
> - Some boards with sc7180 have SPI connected to the Chrome OS EC or
>   security chip (Cr50).  The protocols for talking to cros_ec and cr50
>   are extremely complex.  Both drivers in Linux fully lock the bus
>   across several distinct SPI transfers.  While I am not an expert on
>   GSI mode it feels highly unlikely to me that we'd ever be able to
>   enable GSI mode for these devices.
>=20
> From a testing perspective, running "flashrom -p ec -r /tmp/foo.bin"
> in a loop after this patch shows almost no reduction in time, but the
> number of interrupts per command goes from 32357 down to 30611 (about
> a 5% reduction).
>=20
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

>=20
> Changes in v2:
> - Now just add the pinctrl; let a board use it.
>=20
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 96 ++++++++++++++++++++++++++++
>  1 file changed, 96 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/q=
com/sc7180.dtsi
> index 6678f1e8e395..0534122b9a3c 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1595,6 +1595,18 @@ pinmux {
>                                 };
>                         };
> =20
> +                       qup_spi0_cs_gpio: qup-spi0-cs-gpio {
> +                               pinmux {
> +                                       pins =3D "gpio34", "gpio35",
> +                                              "gpio36";
> +                                       function =3D "qup00";
> +                               };
> +                               pinmux-cs {

Style nit: Add a newline between nodes?

> +                                       pins =3D "gpio37";
> +                                       function =3D "gpio";
> +                               };
> +                       };
> +
>                         qup_spi1_default: qup-spi1-default {
>                                 pinmux {
>                                         pins =3D "gpio0", "gpio1",
