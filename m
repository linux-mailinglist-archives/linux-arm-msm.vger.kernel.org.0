Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C46FDA0686
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2019 17:44:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726454AbfH1Pol (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Aug 2019 11:44:41 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:36460 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726428AbfH1Pol (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Aug 2019 11:44:41 -0400
Received: by mail-pf1-f193.google.com with SMTP id w2so59529pfi.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Aug 2019 08:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:subject:to:from:user-agent:date;
        bh=Jx78g9+c3oSx9PoQ5GPvw3BbBJk++uJnwmqxETMCaDw=;
        b=FtdxS8G25sXjQIfGPQnEVNL1c1QtBlRqPlrr5X2IDZ8KqOJJcBbakYqZ1/RknvIHvU
         q68jrefN9dYhDpTsG/9+Na8XE7aPe12tA2vKuUGe7r9vWiyeoiPOvtZCjPOaL5MGRDVT
         HMXKC2QMK2prUDpXktHsEuQKQGE+8tSCmtNL0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:subject:to:from
         :user-agent:date;
        bh=Jx78g9+c3oSx9PoQ5GPvw3BbBJk++uJnwmqxETMCaDw=;
        b=Zgr0V2ddZZsVtaKGhcVX1MvEKs1Y/rLLTmxtl79cghIwRIlTGDJ7xlrl+yL8mwBGI5
         jxcbeEAB9vpbIKIzC3zj4LGoDFZtWflp46JsTp5to6ODvyZY0/sRU0PhyJrikik48u7L
         uVRkH9dNyoJwUq9wn7cpaVRmbfMk8E/90K0Z2NASwTp0zhyGY11Sx+Jc7njA327wce9+
         YlurcmVSV5o2YdcWZQlVz+bLW7gqnkdpZsAyZ76B43MKgaZuDk0EDSBLS/Y9tGSyIxuv
         dqZcKZCz2yLBg3sLnPtJtcLPe3F7dO4ySJCvKvKRyYkEPgUiHI90ZgqCZuvEpCH0VOxG
         qjaA==
X-Gm-Message-State: APjAAAX/mMBLldD5yjLEmQfc0FSHZDiY/Z3aOU3GvHW/6jinoun+VOJP
        SbcYAKZlhdfxv80aT84k7jQNBg==
X-Google-Smtp-Source: APXvYqzY9v6YG3rvk6EhG6cDIUiFdX3gZS5f2YMEto/kGAYjz8HV33Zv3cGN5nMxnqyoka5FceyNNg==
X-Received: by 2002:aa7:946d:: with SMTP id t13mr5579110pfq.121.1567007080982;
        Wed, 28 Aug 2019 08:44:40 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id m145sm4747764pfd.68.2019.08.28.08.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2019 08:44:40 -0700 (PDT)
Message-ID: <5d66a168.1c69fb81.570fd.ae07@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAP245DVGY6+vue_REqy=Tbvka2fcBx6XhSBePW4L3=pNagX=Dw@mail.gmail.com>
References: <cover.1566907161.git.amit.kucheria@linaro.org> <64a3d07ebe5c4cfb4643d91f5f6605e8a4ffa48b.1566907161.git.amit.kucheria@linaro.org> <5d65ccfd.1c69fb81.95798.20d8@mx.google.com> <CAP245DVGY6+vue_REqy=Tbvka2fcBx6XhSBePW4L3=pNagX=Dw@mail.gmail.com>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Eduardo Valentin <edubezval@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Brian Masney <masneyb@onstation.org>,
        Linux PM list <linux-pm@vger.kernel.org>
Subject: Re: [PATCH v2 14/15] drivers: thermal: tsens: Create function to return sign-extended temperature
To:     Amit Kucheria <amit.kucheria@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Wed, 28 Aug 2019 08:44:39 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Amit Kucheria (2019-08-28 03:35:28)
> (Resending, replied only to Stephen by mistake)
>=20
> On Wed, Aug 28, 2019 at 6:08 AM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Quoting Amit Kucheria (2019-08-27 05:14:10)
> > > @@ -310,6 +328,10 @@ int __init init_common(struct tsens_priv *priv)
> > > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 goto err_put_device;
> > > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> > > =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> > > +
> > > + =C2=A0 =C2=A0 =C2=A0 /* Save away resolution of signed temperature =
value for this IP */
> > > + =C2=A0 =C2=A0 =C2=A0 priv->tempres =3D priv->fields[LAST_TEMP_0].ms=
b - priv->fields
> [LAST_TEMP_0].lsb;
> > > +
> >
> > Why not just calculate this in the function that uses it? Is there a
> > reason to stash it away in the struct?
>=20
> To avoid recalculating in an often-called function. It doesn't change for=
 an IP
> version.
>=20
> We can't make it static either inside that function since the initializer=
 isn't
> constant.
>=20

This sounds like a super micro optimization. It's a couple derefs and a
subtraction. If it isn't used anywhere else please just move it into the
function where it's used.

