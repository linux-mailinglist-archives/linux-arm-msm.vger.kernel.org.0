Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E18BA4C18F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2019 21:34:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726479AbfFSTed (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Jun 2019 15:34:33 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:35080 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726449AbfFSTed (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Jun 2019 15:34:33 -0400
Received: by mail-ed1-f68.google.com with SMTP id p26so984761edr.2;
        Wed, 19 Jun 2019 12:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=THobvFVL09XSyltyeDex0p205QhNWgK6SrrZ8MzneQA=;
        b=qkAU4lzVR8pD0q7s3wTMXWwwctgkn6AyecK1oGeEzPW544duJpM1T62XcuuWZ0d4Nl
         zRqdQ484DkC+4lw2RhVzt7wwKA9rjSxV/7J0NT4XBEABI4GnroLmimLQfKfi9OvurIjK
         9YMCaAJwm2ILCGqRmd8fNEp/PB0M+8ioVO+gYgTjN5dun9zKGo6iJxMbjtrzDkqom790
         uyB7lvatO9bTnBnWrfkS8RNXMfgZc0q4yoeZk3lW+gJe1eZ5+NrbHAjpGSydOs2IctDr
         kmOve+Ie0+Sp6xZF4khcebNAssYM89P/fmVg30bniNQjT6uW6kPk+rkwhIYTiXAigGFp
         /ieA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=THobvFVL09XSyltyeDex0p205QhNWgK6SrrZ8MzneQA=;
        b=OT9gmhJVAJLuh1YBxNErueOt3kI2wCg0pSseGC2q90oLRlH2WIv/4fQMJyT5OxP1b1
         aDcK1cSJM5OHzfy6wNu70lEHnb6pxe6ENPMBEPbcvVqtuHqE7jzm9Gti8G+bUQdL6u6r
         dQ5K4g3dhwZnxy/sZiwQ2MUEvQ3qTrEPeAL2fljPYV7RArriB2lBV8lqMXIBUpm1aAqb
         zW9frEWcK8Dn5GN/2NtDDaibSO4L8UJBMIZgpr9gv8hZLZYf2ju9jUMWUnvjGUIma86B
         fmwAvgpcHtqSsLbnwogR9VnmpWHcDto2WHYZYrWxFuZ9EIAQCdLR7Y4H3wEkoxjkO9Ga
         8lpA==
X-Gm-Message-State: APjAAAUtlr9K0MraRCr3r7gqoz817EZYhTk88POxX3YQA/2iABh8kOGn
        UOT1GbcjE0xmaw5F0d7EOqUyQo6kqCjTmR/HAlo=
X-Google-Smtp-Source: APXvYqxk9fS9U2I8X+hk8DhrqrHLwuYAa4HV2Cxkgcl/SZNyR0vvlgU2C434c4NqG47uDXxQ3ZSCXdwsooZq6+fez8k=
X-Received: by 2002:a50:c351:: with SMTP id q17mr3699542edb.264.1560972870960;
 Wed, 19 Jun 2019 12:34:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190619161913.102998-1-natechancellor@gmail.com>
 <20190619191722.25811-1-natechancellor@gmail.com> <20190619193237.GG25413@art_vandelay>
In-Reply-To: <20190619193237.GG25413@art_vandelay>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 19 Jun 2019 12:34:14 -0700
Message-ID: <CAF6AEGuf_88J6Airv2uJyiQSyk_4E2YCdYcb2eedQt6GXPpoLA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dsi: Add parentheses to quirks check in dsi_phy_hw_v3_0_lane_settings
To:     Sean Paul <sean@poorly.run>
Cc:     Nathan Chancellor <natechancellor@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux@googlegroups.com,
        kbuild test robot <lkp@intel.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jun 19, 2019 at 12:32 PM Sean Paul <sean@poorly.run> wrote:
>
> On Wed, Jun 19, 2019 at 12:17:23PM -0700, Nathan Chancellor wrote:
> > Clang warns:
> >
> > drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c:80:6: warning: logical not is
> > only applied to the left hand side of this bitwise operator
> > [-Wlogical-not-parentheses]
> >         if (!phy->cfg->quirks & V3_0_0_10NM_OLD_TIMINGS_QUIRK) {
> >             ^                 ~
> > drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c:80:6: note: add parentheses
> > after the '!' to evaluate the bitwise operator first
> >         if (!phy->cfg->quirks & V3_0_0_10NM_OLD_TIMINGS_QUIRK) {
> >             ^
> >              (                                               )
> > drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c:80:6: note: add parentheses
> > around left hand side expression to silence this warning
> >         if (!phy->cfg->quirks & V3_0_0_10NM_OLD_TIMINGS_QUIRK) {
> >             ^
> >             (                )
> > 1 warning generated.
> >
> > Add parentheses around the bitwise AND so it is evaluated first then
> > negated.
> >
> > Fixes: 3dbbf8f09e83 ("drm/msm/dsi: Add old timings quirk for 10nm phy")
>
> Hmm, so it looks like this patch isn't upstream. What tree are you basing this
> on?

it is in msm-next-staging.. (which will be pushed to msm-next after
some testing)

I've pulled Nathan's patch in on top..

BR,
-R

>
> Sean
>
> > Link: https://github.com/ClangBuiltLinux/linux/issues/547
> > Reported-by: kbuild test robot <lkp@intel.com>
> > Reviewed-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> > Reviewed-by: Sean Paul <sean@poorly.run>
> > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> > ---
> >
> > v1 -> v2:
> >
> > * Fix broken link (thanks to Sean for pointing it out)
> > * Add Sean's reviewed-by
> >
> >  drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> > index eb28937f4b34..47403d4f2d28 100644
> > --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> > +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> > @@ -77,7 +77,7 @@ static void dsi_phy_hw_v3_0_lane_settings(struct msm_dsi_phy *phy)
> >                             tx_dctrl[i]);
> >       }
> >
> > -     if (!phy->cfg->quirks & V3_0_0_10NM_OLD_TIMINGS_QUIRK) {
> > +     if (!(phy->cfg->quirks & V3_0_0_10NM_OLD_TIMINGS_QUIRK)) {
> >               /* Toggle BIT 0 to release freeze I/0 */
> >               dsi_phy_write(lane_base + REG_DSI_10nm_PHY_LN_TX_DCTRL(3), 0x05);
> >               dsi_phy_write(lane_base + REG_DSI_10nm_PHY_LN_TX_DCTRL(3), 0x04);
> > --
> > 2.22.0
> >
>
> --
> Sean Paul, Software Engineer, Google / Chromium OS
