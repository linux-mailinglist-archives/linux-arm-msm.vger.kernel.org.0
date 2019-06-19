Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 063964C153
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2019 21:14:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726449AbfFSTOR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Jun 2019 15:14:17 -0400
Received: from mail-ua1-f65.google.com ([209.85.222.65]:38872 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726265AbfFSTOR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Jun 2019 15:14:17 -0400
Received: by mail-ua1-f65.google.com with SMTP id j2so581994uaq.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jun 2019 12:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ib3Elwu0KclQyP3cycuxmXbQ4naSfm0BlMVLX1InLZw=;
        b=QQ6gJxUTW/Vjrclz3KenY0TkBWCxnFk+KURlFWhpls7ntpL6pJ8MX2SdeFYx4Aklq/
         DudSWR/uOS3VYS3IlVIGvEDRduFT3XEv9OhRdMAxyhFjtml2fkV2Bm56Ki4BPjlTnvc7
         mLTwzTOaXr2svneSWQkzb82jUkoP65Y38rQWPtAOoe+1sUAAgBkLsPlkUJIt2f3aq8wv
         xE+N8bn0d0K1xrUZ6D2A0xJ9LDspwtWJ/xUYjpBwRX1rzQ2ifxV9fzblurIKhBrnKW3t
         CsKqx/mwrD5iLFKKt8QTv0uISIziU2OSUkDk6tu4AqBYedKvQ5tO25TOfFkEeEhkcsLz
         e9Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ib3Elwu0KclQyP3cycuxmXbQ4naSfm0BlMVLX1InLZw=;
        b=EtlPNSPuZM6T/NotsKsDc2cjpj4gZPHFM7f2ilJVa31xjO82KmDxDHi6UsuEw+k99e
         mBp6+YTcePmgmMmdjYPtPeLiw+ay7DpugGylYI44lpV/AVFruSrM1S4eftBIQzn14Ake
         XJ6oJA2/3+kpEu4K2a5iSLBw25P5OGp79N0zGltVnoh7JE5Pjagi5XPb6yxKctL+nz4q
         ZoshabCTXOUjjgK1NqiwVStvlRajRxs/rezh/dGl4GwtfRoivXo72kgN117O2Lj6GArJ
         f3d6hzLvdSZmsTkkHy6qrLoo8WtpDJTLoAn3x/753n7iWzmqlzYxEe+hq46nrXhRfAV3
         TGLw==
X-Gm-Message-State: APjAAAUQ6t6mhcYxi97+z6cfkQjMFIF2sBLdZfM94gymte590cPufVrF
        h++WCvr2lk6Hv4XyJqa6lc4ZGY2G90Yye1vXDE1nuQ==
X-Google-Smtp-Source: APXvYqyxcxfNAKPtYBJIxPkPHt0N6GlX0+4BE9chztdrfnz3ArVj+bC8e0pV1rbSPnaIfA8/IDzzUNCrvkt+8J5W/rg=
X-Received: by 2002:ab0:7384:: with SMTP id l4mr5662598uap.8.1560971656192;
 Wed, 19 Jun 2019 12:14:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190619161913.102998-1-natechancellor@gmail.com>
In-Reply-To: <20190619161913.102998-1-natechancellor@gmail.com>
From:   Sean Paul <sean@poorly.run>
Date:   Wed, 19 Jun 2019 15:13:40 -0400
Message-ID: <CAMavQKK-yyrSBR0rD8+aXqNhgojzkSVpe=AE3EvUFxMcfcmE6A@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dsi: Add parentheses to quirks check in dsi_phy_hw_v3_0_lane_settings
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Rob Clark <robdclark@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno@lists.freedesktop.org,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux@googlegroups.com,
        kbuild test robot <lkp@intel.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jun 19, 2019 at 12:19 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> Clang warns:
>
> drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c:80:6: warning: logical not is
> only applied to the left hand side of this bitwise operator
> [-Wlogical-not-parentheses]
>         if (!phy->cfg->quirks & V3_0_0_10NM_OLD_TIMINGS_QUIRK) {
>             ^                 ~
> drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c:80:6: note: add parentheses
> after the '!' to evaluate the bitwise operator first
>         if (!phy->cfg->quirks & V3_0_0_10NM_OLD_TIMINGS_QUIRK) {
>             ^
>              (                                               )
> drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c:80:6: note: add parentheses
> around left hand side expression to silence this warning
>         if (!phy->cfg->quirks & V3_0_0_10NM_OLD_TIMINGS_QUIRK) {
>             ^
>             (                )
> 1 warning generated.
>
> Add parentheses around the bitwise AND so it is evaluated first then
> negated.
>
> Fixes: 3dbbf8f09e83 ("drm/msm/dsi: Add old timings quirk for 10nm phy")
> Link: https://github.com/ClangBuiltLinux/linux/547

This link is broken, could you please fix it up?

The rest is:
Reviewed-by: Sean Paul <sean@poorly.run>



> Reported-by: kbuild test robot <lkp@intel.com>
> Reviewed-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> index eb28937f4b34..47403d4f2d28 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> @@ -77,7 +77,7 @@ static void dsi_phy_hw_v3_0_lane_settings(struct msm_dsi_phy *phy)
>                               tx_dctrl[i]);
>         }
>
> -       if (!phy->cfg->quirks & V3_0_0_10NM_OLD_TIMINGS_QUIRK) {
> +       if (!(phy->cfg->quirks & V3_0_0_10NM_OLD_TIMINGS_QUIRK)) {
>                 /* Toggle BIT 0 to release freeze I/0 */
>                 dsi_phy_write(lane_base + REG_DSI_10nm_PHY_LN_TX_DCTRL(3), 0x05);
>                 dsi_phy_write(lane_base + REG_DSI_10nm_PHY_LN_TX_DCTRL(3), 0x04);
> --
> 2.22.0
>
