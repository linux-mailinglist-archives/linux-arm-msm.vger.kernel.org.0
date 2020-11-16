Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E87CB2B5557
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Nov 2020 00:50:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726487AbgKPXti (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Nov 2020 18:49:38 -0500
Received: from mail1.protonmail.ch ([185.70.40.18]:37271 "EHLO
        mail1.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726287AbgKPXti (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Nov 2020 18:49:38 -0500
Date:   Mon, 16 Nov 2020 23:49:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1605570576;
        bh=CJNL1D7Vyb/1gRN55OqVYcG4Y4k6wH1TamA2FlX7qmA=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=DdL1gEWN0Zi5e+tBQtIO9kJyjCo14VqPl+yb8SAsX9qn0W6Th/WAq2fgt98LlZDgs
         UyeZuNVpsQ/EHUvEWZiXTkHo2GrI9sILYdKvvHgP9Dks5zbaJXccctp0E9txr1T4vf
         g6ZVYtqkg8DM5ZFKjEgIAZxJ0bEUcHWkNgdrV/yI=
To:     Pavel Machek <pavel@ucw.cz>
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: Re: [PATCH 3/5] arm64: dts: sdm845: add oneplus 6/t devices
Message-ID: <a20145ef-31a1-a72d-2d60-87a5282ace87@connolly.tech>
In-Reply-To: <20201116220153.GA1003@bug>
References: <20201112161920.2671430-1-caleb@connolly.tech> <20201112161920.2671430-4-caleb@connolly.tech> <20201116220153.GA1003@bug>
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

On 2020-11-16 22:01, Pavel Machek wrote:
> Hi!
>
>> Add initial support for the OnePlus 6 (enchilada) and 6T (fajita) based
>> on the sdm845-mtp DT. Support includes:
>>
>> * Display panels and Adreno 630
>> * Touch screen support with synaptics rmi4
>> * All remoteprocs start correctly
>> * WLAN / Bluetooth
>> * Volume / power buttons and OnePlus Tri-State switch are functional
>>      The tri-state switch is a 3 state mute slider on the side of the ph=
one * USB
>> support, currently forced to peripheral as type C detection isn't functi=
onal.
> I have similar switches on my joystick... but I don't believe modelling i=
t as 3 separate
> keys with "macro" keysym is the right way to go.

Hi! I agree that this is a bit of a weird way to model the switch, do=20
you have any ideas for a better solution?

I'm happy to drop this from the patch for now and come up with a better=20
method down the line.

Regards,

Caleb

>> +=09=09state-top {
>> +=09=09=09label =3D "Tri-state key top";
>> +=09=09=09linux,code =3D <KEY_MACRO1>;
>> +=09=09=09interrupt-parent =3D <&tlmm>;
>> +=09=09=09interrupts =3D <24 IRQ_TYPE_EDGE_FALLING>;
>> +=09=09=09debounce-interval =3D <500>;
>> +=09=09=09linux,can-disable;
>> +=09=09};
>> +
>> +=09=09state-middle {
>> +=09=09=09label =3D "Tri-state key middle";
>> +=09=09=09linux,code =3D <KEY_MACRO2>;
>> +=09=09=09interrupt-parent =3D <&tlmm>;
>> +=09=09=09interrupts =3D <52 IRQ_TYPE_EDGE_FALLING>;
>> +=09=09=09debounce-interval =3D <500>;
>> +=09=09=09linux,can-disable;
>> +=09=09};
>> +
>> +=09=09state-bottom {
>> +=09=09=09label =3D "Tri-state key bottom";
>> +=09=09=09linux,code =3D <KEY_MACRO3>;
>> +=09=09=09interrupt-parent =3D <&tlmm>;
>> +=09=09=09interrupts =3D <126 IRQ_TYPE_EDGE_FALLING>;
>> +=09=09=09debounce-interval =3D <500>;
>> +=09=09=09linux,can-disable;
>> +=09=09};
> Best regards,
> =09=09=09=09=09=09=09=09=09Pavel
> --
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/b=
log.html



