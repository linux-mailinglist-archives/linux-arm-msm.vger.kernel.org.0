Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E176A4C158
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2019 21:16:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726482AbfFSTQz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Jun 2019 15:16:55 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:33688 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726380AbfFSTQy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Jun 2019 15:16:54 -0400
Received: by mail-ed1-f65.google.com with SMTP id i11so926842edq.0;
        Wed, 19 Jun 2019 12:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=FBqq0iblXtu1oHyc7tuPgRLTw80COLgao0LSbxaVLpA=;
        b=s5SZWkMjUVanP6xaEW7UHQB5lIOnZX4QkhRWa6LtBUt8xEHuoU0U9h25jR4DeKZxsA
         Q+Y3QHEqF66L1Tz3pgY6SKJv6fk/3CvY3bQP00KZcspZe4ey6/Q91v25UEw4qeBjTM4D
         mxhiceOyd207OYbMmoI4tcuqdppbs7m+PDdFKlDU4BJFQk7mD/QposPbUzZYSBfMM/ZT
         CSHKhFX7+SBWNrB32ZmLEngTwyH4NOY++OU2SRcPlb3LTDxXehGcMUnyxtZ1RLdMSg3u
         zxf9iWDgXJZfwxhHWqRFevJbC+EWZCulOkl8vgeO2DR4IKusL1nQsejdjw02RGhuCA3H
         PrjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=FBqq0iblXtu1oHyc7tuPgRLTw80COLgao0LSbxaVLpA=;
        b=Z0aG/POWgacybg8y8lQMUkydiIL/UnfqKIABTd1RDhvAJTvkR2fJNcqXEzOupTDpC/
         H4LzjZoMau3euPVAjg5bg10sgKzDZ3Eib+PZ0aSwZ5pjCXJfod1rhu/jm/4y552FolQO
         eyZIzWi5WrqSMNOs3VY8tU+O3nz3bTQiXtep5LCYDnGeYFbl/ewqAZr3YXikbLZChZw6
         qFn9KXChCtzRSCZTcuaqSY7QMc2lLHADkO5S7ttHI9GcrXHromuxrUijZcWZ1+eCYXUn
         y3wyLJMWne0tlGvQ0pFXaRiQzdnAGBSjQnyH2rrgMDggvv8sx0XCTkYVUtzGNIaxfGGR
         8DUw==
X-Gm-Message-State: APjAAAV8AuymAHqsWqT79hntbgiKduVfDaWdmuGXoeCYJ6fxngFMGcEu
        EFf42spQyUHg935FYNwd0CE=
X-Google-Smtp-Source: APXvYqzq2Z91nxTu4Rtd/k9a3xu4CRqFYUmwH7FiWnAXMDDEFOH2JGLmuMDI9wofLoeawzTHsQ1oIQ==
X-Received: by 2002:a17:906:2191:: with SMTP id 17mr1396151eju.280.1560971812710;
        Wed, 19 Jun 2019 12:16:52 -0700 (PDT)
Received: from archlinux-epyc ([2a01:4f9:2b:2b15::2])
        by smtp.gmail.com with ESMTPSA id p3sm6161325eda.43.2019.06.19.12.16.51
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 19 Jun 2019 12:16:52 -0700 (PDT)
Date:   Wed, 19 Jun 2019 12:16:50 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Sean Paul <sean@poorly.run>
Cc:     Rob Clark <robdclark@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno@lists.freedesktop.org,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux@googlegroups.com,
        kbuild test robot <lkp@intel.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: Re: [PATCH] drm/msm/dsi: Add parentheses to quirks check in
 dsi_phy_hw_v3_0_lane_settings
Message-ID: <20190619191650.GA25726@archlinux-epyc>
References: <20190619161913.102998-1-natechancellor@gmail.com>
 <CAMavQKK-yyrSBR0rD8+aXqNhgojzkSVpe=AE3EvUFxMcfcmE6A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMavQKK-yyrSBR0rD8+aXqNhgojzkSVpe=AE3EvUFxMcfcmE6A@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jun 19, 2019 at 03:13:40PM -0400, Sean Paul wrote:
> On Wed, Jun 19, 2019 at 12:19 PM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> >
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
> > Link: https://github.com/ClangBuiltLinux/linux/547
> 
> This link is broken, could you please fix it up?

Thanks for catching this, v2 on the way.

Cheers,
Nathan

> 
> The rest is:
> Reviewed-by: Sean Paul <sean@poorly.run>
> 
> 
> 
> > Reported-by: kbuild test robot <lkp@intel.com>
> > Reviewed-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> > ---
> >  drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> > index eb28937f4b34..47403d4f2d28 100644
> > --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> > +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> > @@ -77,7 +77,7 @@ static void dsi_phy_hw_v3_0_lane_settings(struct msm_dsi_phy *phy)
> >                               tx_dctrl[i]);
> >         }
> >
> > -       if (!phy->cfg->quirks & V3_0_0_10NM_OLD_TIMINGS_QUIRK) {
> > +       if (!(phy->cfg->quirks & V3_0_0_10NM_OLD_TIMINGS_QUIRK)) {
> >                 /* Toggle BIT 0 to release freeze I/0 */
> >                 dsi_phy_write(lane_base + REG_DSI_10nm_PHY_LN_TX_DCTRL(3), 0x05);
> >                 dsi_phy_write(lane_base + REG_DSI_10nm_PHY_LN_TX_DCTRL(3), 0x04);
> > --
> > 2.22.0
> >
