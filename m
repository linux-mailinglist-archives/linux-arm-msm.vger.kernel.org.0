Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14B183220E9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Feb 2021 21:47:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231138AbhBVUqJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Feb 2021 15:46:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230512AbhBVUqG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Feb 2021 15:46:06 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13CD1C061786
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Feb 2021 12:45:26 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id w18so7336386pfu.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Feb 2021 12:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=LwMwnyMNe0dbsBjwrdA/4K91mX9d7JEcNbNBT2gfDLE=;
        b=PiPgFgoRJVCzZCl5lIpO1thRE8Msnn+qjIg+b+Ez5BJdtCLHqhzeME8kuAqFFhLXEe
         eDFr8N+O14ZrXRhmKEGiz8jwtselrH+PvzYUvHC3ELg83/fim//n/UO+IygmFZfoesMo
         +RjTEfpQlYxVmvusEvJJYZu1ZhTaf9KEZu91g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=LwMwnyMNe0dbsBjwrdA/4K91mX9d7JEcNbNBT2gfDLE=;
        b=WYSZKT7wJ8GYeJfA7e2SBzmUfxvUg553vdF6/mK4EuHlWnrz8VLWCZiSHuCGi8kXTv
         mVoQj2ra+RfDg4QHoPAI2P8tGfwD02qze8YAgsSopmfOg34N//oUvPK5TsMTYwHTBmGY
         xZTRmaUVSvxgluQWfDqzp/s0oQqWuyhCJ4fAftWDUWXKZOGeASTcSI1721vSl39vpiMg
         PkB3gTFlJ4zpuw47CzY93B8FuSWEh1n+I24TKvvAjWQK+sNJ8f7YZVnlGBp0c8mY2wGu
         CPubbikbIvzs4bjxCp59xKp4axosg43qZMF+v8Wx+rvcn3dLeKJ19mCVAZvRfVOzSJnV
         DXiQ==
X-Gm-Message-State: AOAM532bKdIGD4iWC6uqDZ6BzvtIFgjg5vNwH8Jt5JUtWMi1bFUVHjsa
        Z8kDUNrYvy8Coj201IcltCkSi/8peVhU6Q==
X-Google-Smtp-Source: ABdhPJyrGk657Pl699wmjr2BYgjCD55KtTF8hbxTlXFYi0LmhqlBNxGc7egWS9i7/RS4KOFYUdPkXw==
X-Received: by 2002:a63:c702:: with SMTP id n2mr20903322pgg.382.1614026725558;
        Mon, 22 Feb 2021 12:45:25 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:a878:327b:a10a:e189])
        by smtp.gmail.com with ESMTPSA id o6sm20240447pfb.9.2021.02.22.12.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 12:45:25 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YDQWVresOGZGLL6N@google.com>
References: <20210219181032.1.I23e12818c4a841ba9c37c60b3ba8cfeeb048285f@changeid> <20210219181032.3.Ia4c1022191d09fe8c56a16486b77796b83ffcae4@changeid> <161402520418.1254594.7435679604383921403@swboyd.mtv.corp.google.com> <YDQWVresOGZGLL6N@google.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sc7180: Delete charger thermal zone and ADC channel for lazor <= rev3
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        devicetree@vger.kernel.org
To:     Matthias Kaehlcke <mka@chromium.org>
Date:   Mon, 22 Feb 2021 12:45:23 -0800
Message-ID: <161402672369.1254594.14091287979440332862@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Matthias Kaehlcke (2021-02-22 12:38:46)
> On Mon, Feb 22, 2021 at 12:20:04PM -0800, Stephen Boyd wrote:
> > Quoting Matthias Kaehlcke (2021-02-19 18:10:59)
> > > Lazor rev3 and older are stuffed with a 47k NTC as thermistor for
> > > the charger temperature which currently isn't supported by the
> > > PM6150 ADC driver. Delete the charger thermal zone and ADC channel
> > > to avoid the use of bogus temperature values.
> > >=20
> > > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> > > ---
> > >=20
> > >  arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts | 9 +++++++++
> > >  arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts | 9 +++++++++
> > >  arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dts | 9 +++++++++
> > >  3 files changed, 27 insertions(+)
> > >=20
> > > diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts b/a=
rch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts
> > > index 30e3e769d2b4..0974dbd424e1 100644
> > > --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts
> > > +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts
> > > @@ -14,6 +14,15 @@ / {
> > >         compatible =3D "google,lazor-rev0", "qcom,sc7180";
> > >  };
> > > =20
> > > +/*
> > > + * rev <=3D 3 are stuffed with a 47k NTC as charger thermistor which=
 is currently
> > > + * not supported by the PM6150 ADC driver. Delete the thermal zone a=
nd ADC
> > > + * channel to avoid the use of bogus temperature values.
> > > + */
> > > +/delete-node/ &charger_thermal;
> > > +/delete-node/ &pm6150_adc_charger_thm;
> > > +/delete-node/ &pm6150_adc_tm_charger_thm;
> >=20
> > Can we disable pm6150_adc_tm instead on <=3D rev3 boards? It would be t=
he
> > same number of lines, but is simpler to reason about disabled nodes vs.
> > deleted nodes usually.
>=20
> For Lazor theoretically this could be done since it doesn't use other ADC
> channels, however it won't work for other trogdor devices that will be
> upstreamed eventually. Some of these boards have the same problem, however
> they have other thermistors connected to the ADC. One could argue that it=
's
> preferable to do things in a uniform way, but I'm open to do it either way
> for Lazor.
>=20

I see. Can the thermal-zone be disabled then vs. deleting three nodes? I
think the thermal driver uses for_each_available_child_of_node() so that
would work?
