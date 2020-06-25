Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 395DB209836
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2020 03:25:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388977AbgFYBZL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Jun 2020 21:25:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388930AbgFYBZL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Jun 2020 21:25:11 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE865C061795
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2020 18:25:10 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id f9so2231638pfn.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2020 18:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=m3/wAfDopqLqGYnRmo8UqA/J5isUr1IvnmUUrUey3ng=;
        b=jjcJaC9t2Zw//ZqFTxDolCBwP6t5Cul/FDBHEPhMcbtunRr788BYn41C5eb2wRAel1
         CQPzpHLtZy/sWu7oLEVobefErbEKWbxZ7QCUnKz205KdbbCTKBFWk9Pffk3/mMzycwcu
         ybP/e+kLOd6OQMHQEN/4dlBqR9yeQiGDSNK+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=m3/wAfDopqLqGYnRmo8UqA/J5isUr1IvnmUUrUey3ng=;
        b=B9UYBoeimtPJL5PHVwacMSQpo56hIUz05bWVhAKDyn6UER4+dYp+ewyBc+BMKF7q4Q
         5iqEQ8w8VT/ligLNMzFbO0whEnamupHCoUs1SKI6SiIUBp9o1Mfpu/xbQyww5l3dkLyE
         Rl5RgwMQvZiwLwVqmYGFIIWe6mNwtAAa3xrWc62hKPHX6NfCT1nlE72xe8nhP4jHsBDy
         Zi7HeGPEkxagNcatn/5kMm1dwdAtk5GDSsSaN65/eKaHyWc1lb1GkxcCophI/W2BAlt+
         3P2Q6E2Kio2SUmEpA7BRPux04bCduN/CbGcHO8F56f7x0MMPetbYB5o1wWCzL36xAz11
         yWlA==
X-Gm-Message-State: AOAM531tfEEnaR72vetMt1bkUvicwsmANwtE/2KFAhJqihGNDSY6CAvG
        9gCrAYzvciSPCOmZo1O4Do4v/Swc6gs=
X-Google-Smtp-Source: ABdhPJx1fCeBRUXodkZylAdXFohaDuXXT1rMom+9iZ4wqDv2csLv6+U6Xd4DxR+EHj+M2X14D4gfTA==
X-Received: by 2002:a63:b30f:: with SMTP id i15mr24640936pgf.42.1593048309953;
        Wed, 24 Jun 2020 18:25:09 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id w30sm4481777pjj.3.2020.06.24.18.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 18:25:09 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200624170746.1.I997a428f58ef9d48b37a27a028360f34e66c00ec@changeid>
References: <20200624170746.1.I997a428f58ef9d48b37a27a028360f34e66c00ec@changeid>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sc7180: Switch SPI to use GPIO for CS
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>
Date:   Wed, 24 Jun 2020 18:25:08 -0700
Message-ID: <159304830840.62212.6716845486281369794@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2020-06-24 17:08:04)
> The geni SPI protocol appears to have been designed without taking
> Linux needs into account.  In all the normal flows it takes care of
> setting chip select itself.  However, Linux likes to manage the chip
> select so it can do fancy things.
>=20
> Back when we first landed the geni SPI driver we worked around this
> by:
> - Always setting the FRAGMENTATION bit in transfers, which (I believe)
>   tells the SPI controller not to mess with the chip select during
>   transfers.
> - Controlling the chip select manually by sending the SPI controller
>   commands to assert or deassert the chip select.
>=20
> Our workaround was fine and it's been working OK, but it's really
> quite inefficient.  A normal SPI transaction now needs to do:
> 1. Start a command to set the chip select.
> 2. Wait for an interrupt from controller saying chip select done.
> 3. Do a transfer.
> 4. Start a command to unset the chip select.
> 5. Wait for an interrupt from controller saying chip select done.

I thought the GENI hardware was supposed to be able to queue commands up
and then plow through them to interrupt the CPU when it finished. If
that was supported would there be any problems? I assume we could remove
the wait for CS disable and interrupt on step 5 and also the wait for
CS/interrupt on step 2 because it is bundled with the transfer in step
3.

Where is the delay? On step 2 where we wait to transfer or at step 5
when we wait for CS to be dropped, or both?

>=20
> Things are made a bit worse because the Linux GPIO framework assumes
> that setting a chip select is quick.  Thus the SPI core can be seen to
> tell us to set our chip select even when it's already in the right
> state and we were dutifully kicking off commands and waiting for
> interrupts.  While we could optimize that particular case, we'd still
> be left with the slowness when we actually needed to toggle the chip
> select.

One thing to note is that the GPIO driver doesn't tell us that it has
actually asserted/deasserted the GPIO. It writes to the controller and
moves on so we don't know when it has actually gone into effect.
Hopefully moving to GPIO mode doesn't mean we get weird problems where
CS isn't asserted yet and a transfer starts wiggling the lines.

>=20
> All the chip select lines can actually be muxed to be GPIOs and
> there's really no downside in doing so.  Now Linux can assert and
> deassert the chip select at will with a simple MMIO write.
>=20
> The SPI driver will still have the ability to set the chip select, but
> not we just won't use it.

s/not/now/?

>=20
> With this change I tested reading the firmware off the EC connected to
> a ChromeOS device (flashrom -p ec -r ...).  I saw about a 25% speedup
> in total runtime of the command and a 30% reduction in interrupts
> generated (measured by /proc/interrupts).

I see nothing wrong with specifying the CS gpios in DT. Seems like that
should always be there and then the driver should decide to use GPIO
mode or not. So

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

for that part.

>=20
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>=20
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 57 ++++++++++++++++++++++++----
>  1 file changed, 49 insertions(+), 8 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/q=
com/sc7180.dtsi
> index 3a8076c8bdbf..74c8503b560e 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1204,65 +1213,97 @@ pinmux {
>                         qup_spi0_default: qup-spi0-default {
>                                 pinmux {
>                                         pins =3D "gpio34", "gpio35",
> -                                              "gpio36", "gpio37";
> +                                              "gpio36";
>                                         function =3D "qup00";
>                                 };
> +                               pinmux-cs {
> +                                       pins =3D "gpio37";
> +                                       function =3D "gpio";
> +                               };
>                         };
> =20
>                         qup_spi1_default: qup-spi1-default {
>                                 pinmux {
>                                         pins =3D "gpio0", "gpio1",
> -                                              "gpio2", "gpio3";
> +                                              "gpio2";
>                                         function =3D "qup01";
>                                 };
> +                               pinmux-cs {
> +                                       pins =3D "gpio3";
> +                                       function =3D "gpio";
> +                               };
>                         };
> =20
>                         qup_spi3_default: qup-spi3-default {
>                                 pinmux {
>                                         pins =3D "gpio38", "gpio39",
> -                                              "gpio40", "gpio41";
> +                                              "gpio40";
>                                         function =3D "qup03";
>                                 };
> +                               pinmux-cs {
> +                                       pins =3D "gpio41";
> +                                       function =3D "gpio";
> +                               };
>                         };
> =20
>                         qup_spi5_default: qup-spi5-default {
>                                 pinmux {
>                                         pins =3D "gpio25", "gpio26",
> -                                              "gpio27", "gpio28";
> +                                              "gpio27";
>                                         function =3D "qup05";
>                                 };
> +                               pinmux-cs {
> +                                       pins =3D "gpio28";
> +                                       function =3D "gpio";
> +                               };
>                         };
> =20
>                         qup_spi6_default: qup-spi6-default {
>                                 pinmux {
>                                         pins =3D "gpio59", "gpio60",
> -                                              "gpio61", "gpio62";
> +                                              "gpio61";
>                                         function =3D "qup10";
>                                 };
> +                               pinmux-cs {
> +                                       pins =3D "gpio62";
> +                                       function =3D "gpio";
> +                               };
>                         };
> =20
>                         qup_spi8_default: qup-spi8-default {
>                                 pinmux {
>                                         pins =3D "gpio42", "gpio43",
> -                                              "gpio44", "gpio45";
> +                                              "gpio44";
>                                         function =3D "qup12";
>                                 };
> +                               pinmux-cs {
> +                                       pins =3D "gpio45";
> +                                       function =3D "gpio";
> +                               };
>                         };
> =20
>                         qup_spi10_default: qup-spi10-default {
>                                 pinmux {
>                                         pins =3D "gpio86", "gpio87",
> -                                              "gpio88", "gpio89";
> +                                              "gpio88";
>                                         function =3D "qup14";
>                                 };
> +                               pinmux-cs {
> +                                       pins =3D "gpio89";
> +                                       function =3D "gpio";
> +                               };
>                         };
> =20
>                         qup_spi11_default: qup-spi11-default {
>                                 pinmux {
>                                         pins =3D "gpio53", "gpio54",
> -                                              "gpio55", "gpio56";
> +                                              "gpio55";
>                                         function =3D "qup15";
>                                 };
> +                               pinmux-cs {
> +                                       pins =3D "gpio56";
> +                                       function =3D "gpio";
> +                               };
>                         };

Perhaps we should have qup-spiN-default and qup-spiN-cs-gpio though?
That way the driver can properly mux the pin to be gpio mode if it wants
to. I don't see a way to mux the pin to be "qup" until the driver
decides it doesn't want that.
