Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7D4E3FE823
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Sep 2021 05:46:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239028AbhIBDrG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Sep 2021 23:47:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:41794 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233122AbhIBDrF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Sep 2021 23:47:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BF09761041;
        Thu,  2 Sep 2021 03:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630554367;
        bh=e/r7aNYpXqByZsD0ObhSpe/4xl4wcGCv20OudDQBW9Y=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=BkJcSTHPMbL1+5MtpZOJLVg+Nnrfc2PyezFl0mS8WjZ6eQrzEDmGhFdhwXSgDGbJn
         OjFzEFjxRgH48VZxYkfLoV3a1pBh1tVTfMUKA92k8S9mxeI5AoHJjwSFm5Hhqpotm6
         vcl9GRWine+M1ZEkmEPukQzrDx1wKGjzZ1wPkMcrIuUpSzd9b0PHLnGAUgM4p5S0zK
         DtOo0e5p9VKARBXoOumhoNCs9lNRcCCByZK5muQyPayjzlKB2351XVtIiaUQw2HB3D
         GZbLb0PlDH2Ca/z0EikPWuZ742PsJyJykQPtVpMw9RSspJMVgpgwDoKo+lRoqCQF2t
         DfjIKKYWgeisg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YS8+hnrf6FZVif0D@Marijn-Arch-PC.localdomain>
References: <20210830182445.167527-1-marijn.suijten@somainline.org> <20210830182445.167527-2-marijn.suijten@somainline.org> <163036177339.2676726.12271104951144475163@swboyd.mtv.corp.google.com> <YS1fllEswGQEGWPc@Marijn-Arch-PC.localdomain> <163036399040.2676726.5816296584899284140@swboyd.mtv.corp.google.com> <YS1lYui5aXadgkEr@Marijn-Arch-PC.localdomain> <163047451225.42057.10341429266269552927@swboyd.mtv.corp.google.com> <YS8+hnrf6FZVif0D@Marijn-Arch-PC.localdomain>
Subject: Re: [PATCH v2 1/2] drm/msm/dsi: Use "ref" fw clock instead of global name for VCO parent
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Date:   Wed, 01 Sep 2021 20:46:06 -0700
Message-ID: <163055436647.405991.3416730531261875767@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Marijn Suijten (2021-09-01 01:49:10)
> Hi Stephen,
>=20
> On 2021-08-31 22:35:12, Stephen Boyd wrote:
> > Quoting Marijn Suijten (2021-08-30 16:10:26)
> > >=20
> > > I'm 95% sure this shouldn't cause any problems given current DTs and
> > > their history, but that's probably not enough.  This might also impact
> > > DTs that have not yet been upstreamed, but afaik the general stance is
> > > to not care and actually serve as a fair hint/warning before new DTs
> > > make it to the list.
> > >=20
> > > If there is a protocol in place to deprecate, warn, and eventually
> > > remove this reliance on global clock names I'm more than happy to add
> > > .name as a temporary fallback, even if likely unneeded.  Otherwise we
> > > might never get rid of it.
> >=20
> > I'm not aware of any protocol to deprecate, warn, and remove the
> > fallback name. It's a fallback because it can't ever really be removed.
>=20
> That is unfortunate, I was hoping for a breaking "kernel release" at
> some point where we could say "no more, update your DTs first".  But
> that may not be possible in every scenario?
>=20
> > Anyway, if you're not willing to add the .name then that's fine.
>=20
> I feel like .name has caused more problems for us than it solves, but in
> a fallback position it might be fine.  My main gripe is that I don't
> want DT to rely on the clock to also be discoverable through the clock
> tree, which we've seen on many occasions (not sure if the former was
> done upstream, but: "xo" being renamed to "xo_board", and DSI PLL clocks
> loosing +1 causing a naming mismatch with what mmcc expects, to name
> some examples).  Omitting .name is the only way to enforce that.

The simple approach to take is anything new should use fw_name. The name
member is only there for the backup mode when the DT isn't properly
setup to describe connections between clk controllers. If the code is
new then name can be omitted and everything is OK. Otherwise, if
parent_names was already being used, then most likely it will need to be
set as .name in the clk_parent_data struct to maintain compatibility. If
parent_names was wrong, then it was all broken to begin with and .name
can be omitted.

>=20
> > We can
> > deal with the problem easily by adding a .name in the future if someone
> > complains that things aren't working. Sound like a plan? If so, it's
> > probably good to add some sort of note in the commit text so that when
> > the bisector lands on this patch they can realize that this
> > intentionally broke them.
>=20
> I'm all for this but lack the industrial knowledge to sign off on the
> approach.  Bjorn and Dmitry should ack/agree before going ahead (you may
> wonder why I'm worrying about getting clock drivers and DT in sync on
> platforms I don't own...):
>=20
> We have the following situations:
> - apq8064 used the wrong clock.  Bjorn acknowledged that landing the DT
>   fix in 5.15, and this patch in 5.16 should give enough time for DT to
>   be updated (this is nothing we can fix with .name anyway).
> - msm8974 doesn't have the clock at all.  Dmitry recommended to add
>   .name for this specific case, but I'm wondering if the 5.15 -> 5.16
>   window is enough to update DTs too?
> - msm8916 and sdm845 had the missing "ref" clock added three years ago.
>   Would a 5.16 kernel still work in any meaningful way with a DT that
>   old?
>=20
> Should we decide on a case-by-case basis whether to add .name, ie. only
> for (some/all) of the aforementioned SoCs?
>=20

I sort of glossed over this, sorry. Hopefully what I wrote above can
guide you and then we shouldn't really need to worry about anything?
