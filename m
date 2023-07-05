Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D67F747C9C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jul 2023 07:46:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230268AbjGEFqu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Jul 2023 01:46:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbjGEFqt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Jul 2023 01:46:49 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88C5DB2
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jul 2023 22:46:48 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-5703cb4bcb4so68616597b3.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jul 2023 22:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1688536008; x=1691128008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DHp+NISlF9UWnaPSw4xicRwwKLY01Ugqh6hX8JM5Vpc=;
        b=qOxxq0finticpggyrbUhb4l+cfMhrVotJ5Y2Vnnjibusl9CITtm2SqMcmGE5VbmnNv
         9mtaZfMZ5sUTznoS6W6nkH3311fBkGBAk3VXrzcIvwofWSYld2ICKNEv5f3zkbuHn4SX
         CnmVU8bO5qUK44UbP65o2I0rBlb3qeiCIqnfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688536008; x=1691128008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DHp+NISlF9UWnaPSw4xicRwwKLY01Ugqh6hX8JM5Vpc=;
        b=g8JEWzLYy4VPipTPYVQS24Ek1mNvsgC4EnlqdenuWoAMtNwl0l3+MnZAlqRXLvhmq6
         Ezp9p8o/tA7VyZAb6eIapPMdiFHqrz0zZ383uLyiX+1mNjktw92lhLLrT0SoXzp/IBEa
         aRCNmH0OF9+A8cDfIyfayT0toj6JL/iq3LssFXG1mxQN4wJF+OGm9t1FSHgmBxx3rTS2
         IDzKuV6tPeeuNhzDS42p2VmaYSe/oEazQ3+esSpcHCZHhHROyo9kpd0j49LduVcbVnxi
         ILiA+ZxV8/EocJQIDRDH0uFnry/qvBPFM6oFQ4NQUD7hFgA4gZoRYCT1yGzg823p4e0M
         CLMw==
X-Gm-Message-State: ABy/qLYwQEz53LpaVIjyLJ2p+x4kZEIR9t7Sby1MR39op2szC+VPGTgj
        n9i5ETrz/xFbfWYB7GiSx86wi48VVHQw5xcjY1DAZFptpdlTNOXHhXo=
X-Google-Smtp-Source: APBJJlFCW2vUm6L5+3eBDYD8/+/mpyVPRNEq6dZdKU7TMSYpktIQFxB9vm8VrbTzYbxgwdMbPiLeGqH8PTHrTlaAkxs=
X-Received: by 2002:a0d:ebc8:0:b0:579:e341:ab13 with SMTP id
 u191-20020a0debc8000000b00579e341ab13mr12095477ywe.34.1688536007713; Tue, 04
 Jul 2023 22:46:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230403221233.500485-1-marex@denx.de> <20230403221233.500485-2-marex@denx.de>
 <CAMi1Hd0TD=2z_=bcDrht3H_wiLvAFcv8Z-U_r_KUOoeMc6UMjw@mail.gmail.com>
 <CAMty3ZBNFu=f-FS4YFN4wfmiTuk=48nna-vub1eMYwidDt+msg@mail.gmail.com> <CAA8EJppbdiUz5m+9EAPnFb916DaS_VKWd30c7_EPWjuid8rtqQ@mail.gmail.com>
In-Reply-To: <CAA8EJppbdiUz5m+9EAPnFb916DaS_VKWd30c7_EPWjuid8rtqQ@mail.gmail.com>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Wed, 5 Jul 2023 11:16:36 +0530
Message-ID: <CAMty3ZBQajyg0SNz+AjQzth_O_EmrZ9cUyfM--0ptJQ5F0MRfg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/bridge: lt9611: Do not generate HFP/HBP/HSA and
 EOT packet
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Amit Pundir <amit.pundir@linaro.org>, Marek Vasut <marex@denx.de>,
        dri-devel@lists.freedesktop.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Michael Walle <michael@walle.cc>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux regressions mailing list <regressions@lists.linux.dev>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jul 5, 2023 at 11:09=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> [Adding freedreno@ to cc list]
>
> On Wed, 5 Jul 2023 at 08:31, Jagan Teki <jagan@amarulasolutions.com> wrot=
e:
> >
> > Hi Amit,
> >
> > On Wed, Jul 5, 2023 at 10:15=E2=80=AFAM Amit Pundir <amit.pundir@linaro=
.org> wrote:
> > >
> > > Hi Marek,
> > >
> > > On Wed, 5 Jul 2023 at 01:48, Marek Vasut <marex@denx.de> wrote:
> > > >
> > > > Do not generate the HS front and back porch gaps, the HSA gap and
> > > > EOT packet, as these packets are not required. This makes the bridg=
e
> > > > work with Samsung DSIM on i.MX8MM and i.MX8MP.
> > >
> > > This patch broke display on Dragonboard 845c (SDM845) devboard runnin=
g
> > > AOSP. This is what I see
> > > https://people.linaro.org/~amit.pundir/db845c-userdebug/v6.5-broken-d=
isplay/PXL_20230704_150156326.jpg.
> > > Reverting this patch fixes this regression for me.
> >
> > Might be msm dsi host require proper handling on these updated
> > mode_flags? did they?
>
> The msm DSI host supports those flags. Also, I'd like to point out
> that the patch didn't change the rest of the driver code. So even if
> drm/msm ignored some of the flags, it should not have caused the
> issue. Most likely the issue is on the lt9611 side. I's suspect that
> additional programming is required to make it work with these flags.

True, But I'm not quite sure, most of these mode_flags were handled
more on the host. Maybe Marek can comment on this.

Thanks,
Jagan.
