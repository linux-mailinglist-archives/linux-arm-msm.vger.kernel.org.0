Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FEF1749838
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jul 2023 11:22:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229892AbjGFJWL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jul 2023 05:22:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231278AbjGFJWJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jul 2023 05:22:09 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24A3F1BE3
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jul 2023 02:21:37 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-5703d12ab9aso6117497b3.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jul 2023 02:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688635276; x=1691227276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EQWzcD3kqn8nreTy0mrng4rT6iwYUcI+uurtyt3qorY=;
        b=Y0sbKb2NnyAPxRj+0+x8JguFUZO5WFrhXwqakpgMdFRYBqlml9hkb6M3HfU0rOO33C
         U4obMaT4BDTrA1rQyROiMNr1cJ817QwlpgVVVHCrOPXN41hFH45C4gC60zzTxz+GpSGC
         cNYCIh3FMmSAlc2su56i7B0V6nAxzEfF0VSYfmJlY1CZJhnDfRZsp37E2nJquet2kxD4
         cxRjEPJaOl3J+l/2bXoi+RpNgRvboAM3SCbRV1Q9mxfBJvco/y2GDppOeDyw/tFDnwZL
         o31Ym9788Bde9XUO460KMf5i7dO84flldyPa+Jmc7r9DUe10TLIiHloxAxARO5KZWqRt
         RoZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688635276; x=1691227276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EQWzcD3kqn8nreTy0mrng4rT6iwYUcI+uurtyt3qorY=;
        b=BKhLFBNLRGc5GWGA9Mp9ppOFsNNU8q2oR/jcKYeOOqUHRRTb0JEoP11qMzjclY5rTV
         Q0ZvOPRp89ji0Z09d2DWv2j3Jkz8OoVSmwEmAxIHzx7CsjDBRMdXjfQYv3kWE1g6bpTA
         cka+ySPkgir1D5zHd+RbNKoynGSpb7NDGDlo5xar3UrMNfK6r8KdTXvaxcS+wqeLGL0h
         CKP4BDfDVLzj4EmQImG6mEOICn16/aKkag3JZyvp5dSyP7WMF9CN0JqGEqMOj1JPMert
         Rm+FtR1hUdodVKLaZmbpXlxs1k0SG5XAlSZb1VQE6UJP0My3MyVUro+a1uj+sn83GgjO
         rdUQ==
X-Gm-Message-State: ABy/qLZLTd9+zqyurgxVgy8MlCU1DIpxpRbTMXwwA607JjVUblR8MjU2
        y++zqZZnJVIBAu1VtWKVJmHPVFlNiSg1mqfG4DbWSQ==
X-Google-Smtp-Source: APBJJlH8WWeq5kYBpRj2qTCCg6+xWryUE16/8ZT11zqW50unDPyeXAusZhm9QvDKMY3hKC+f14TX/1RciBvLo4WLwd4=
X-Received: by 2002:a0d:d409:0:b0:56d:1747:5bde with SMTP id
 w9-20020a0dd409000000b0056d17475bdemr1266852ywd.32.1688635275824; Thu, 06 Jul
 2023 02:21:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230403221233.500485-1-marex@denx.de> <20230403221233.500485-2-marex@denx.de>
 <CAMi1Hd0TD=2z_=bcDrht3H_wiLvAFcv8Z-U_r_KUOoeMc6UMjw@mail.gmail.com>
 <CAMty3ZBNFu=f-FS4YFN4wfmiTuk=48nna-vub1eMYwidDt+msg@mail.gmail.com> <CAA8EJppbdiUz5m+9EAPnFb916DaS_VKWd30c7_EPWjuid8rtqQ@mail.gmail.com>
In-Reply-To: <CAA8EJppbdiUz5m+9EAPnFb916DaS_VKWd30c7_EPWjuid8rtqQ@mail.gmail.com>
From:   Amit Pundir <amit.pundir@linaro.org>
Date:   Thu, 6 Jul 2023 14:50:39 +0530
Message-ID: <CAMi1Hd2G5PJmz4wpO1wbdqKd0FA8LBgvRDv2u5ZYAMb5s6Kt0A@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/bridge: lt9611: Do not generate HFP/HBP/HSA and
 EOT packet
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Jagan Teki <jagan@amarulasolutions.com>,
        Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org,
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
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 5 Jul 2023 at 11:09, Dmitry Baryshkov
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

I spent some time today on smoke testing these flags (individually and
in limited combination) on DB845c, to narrow down this breakage to one
or more flag(s) triggering it. Here are my observations in limited
testing done so far.

There is no regression with MIPI_DSI_MODE_NO_EOT_PACKET when enabled
alone and system boots to UI as usual.

MIPI_DSI_MODE_VIDEO_NO_HFP always trigger the broken display as in the
screenshot[1] shared earlier as well.

Adding either of MIPI_DSI_MODE_VIDEO_NO_HSA and
MIPI_DSI_MODE_VIDEO_NO_HBP always result in no display, unless paired
with MIPI_DSI_MODE_VIDEO_NO_HFP and in that case we get the broken
display as reported.

In short other than MIPI_DSI_MODE_NO_EOT_PACKET flag, all other flags
added in this commit break the display on DB845c one way or another.

Regards,
Amit Pundir
[1] https://people.linaro.org/~amit.pundir/db845c-userdebug/v6.5-broken-dis=
play/PXL_20230704_150156326.jpg

>
> --
> With best wishes
> Dmitry
