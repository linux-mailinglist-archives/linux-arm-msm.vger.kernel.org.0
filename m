Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8E7E3FBEE8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Aug 2021 00:16:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238806AbhH3WRJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Aug 2021 18:17:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:39864 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238281AbhH3WRI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Aug 2021 18:17:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A516B60462;
        Mon, 30 Aug 2021 22:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630361774;
        bh=fQTfKaZiLXoQnkx1EXqsVQdQpppSFmhkr8OzjVUwZhc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=MpMZUPXfuhwJdFnuKUDrYy1cJu7+ziEUywHrLu/b5hwbJniwEnOlgqQwKen76YPdT
         bIBgbzctj0EGFoX/3D4ZKqraQRN1YJyHSHH0abUwDCrNJgN9OD0hoRHEl8zDmDvn6P
         V+kaXBLhzpzZj4pGNG3vP4IL+1DZD92sv+J8OC5ZKc5qLdg3yB1sgot3lTIjZEKPvw
         Q9tqdbx9vsZI07eZG2FtZZZfd8QSvDo4iIa73cbS7vo6P7e6rnOWwhsuvf0OZow3Hl
         ZiBtyjdfBOEeL8zVxCnXsPInzRqqAw/Asi194FGwGlT49lwjnbiZo/MZY6f/WyW9JP
         AYD0QY46LIcMQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210830182445.167527-2-marijn.suijten@somainline.org>
References: <20210830182445.167527-1-marijn.suijten@somainline.org> <20210830182445.167527-2-marijn.suijten@somainline.org>
Subject: Re: [PATCH v2 1/2] drm/msm/dsi: Use "ref" fw clock instead of global name for VCO parent
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
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
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
Date:   Mon, 30 Aug 2021 15:16:13 -0700
Message-ID: <163036177339.2676726.12271104951144475163@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Marijn Suijten (2021-08-30 11:24:44)
> All DSI PHY/PLL drivers were referencing their VCO parent clock by a
> global name, most of which don't exist or have been renamed.  These
> clock drivers seem to function fine without that except the 14nm driver
> for the sdm6xx [1].
>=20
> At the same time all DTs provide a "ref" clock as per the requirements
> of dsi-phy-common.yaml, but the clock is never used.  This patchset puts
> that clock to use without relying on a global clock name, so that all
> dependencies are explicitly defined in DT (the firmware) in the end.
>=20
> Note that msm8974 is the only board not providing this clock, and
> apq8064 was providing the wrong clock (19.2MHz cxo instead of 27MHz
> pxo).  Both have been been addressed in separate patches that are
> supposed to land well in advance of this patchset.
>=20
> Furthermore not all board-DTs provided this clock initially but that
> deficiency has been addressed in followup patches (see the Fixes:
> below).  Those commits seem to assume that the clock was used, while
> nothing in history indicates that this "ref" clock was ever retrieved.
>=20
> [1]: https://lore.kernel.org/linux-arm-msm/386db1a6-a1cd-3c7d-a88e-dc83f8=
a1be96@somainline.org/
>=20
> Fixes: 79e51645a1dd ("arm64: dts: qcom: msm8916: Set 'xo_board' as ref cl=
ock of the DSI PHY")
> Fixes: 6969d1d9c615 ("ARM: dts: qcom-apq8064: Set 'cxo_board' as ref cloc=
k of the DSI PHY")
> Fixes: 0c0e72705a33 ("arm64: dts: sdm845: Set 'bi_tcxo' as ref clock of t=
he DSI PHYs")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c      | 4 +++-
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c      | 4 +++-
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c      | 4 +++-
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c | 4 +++-
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c       | 4 +++-
>  5 files changed, 15 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm=
/msm/dsi/phy/dsi_phy_10nm.c
> index e46b10fc793a..3cbb1f1475e8 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> @@ -562,7 +562,9 @@ static int pll_10nm_register(struct dsi_pll_10nm *pll=
_10nm, struct clk_hw **prov
>         char clk_name[32], parent[32], vco_name[32];
>         char parent2[32], parent3[32], parent4[32];
>         struct clk_init_data vco_init =3D {
> -               .parent_names =3D (const char *[]){ "xo" },
> +               .parent_data =3D &(const struct clk_parent_data) {
> +                       .fw_name =3D "ref",

Please also add .name as the old parent_names value so that newer
kernels can be used without having to use new DT.

> +               },
>                 .num_parents =3D 1,
>                 .name =3D vco_name,
>                 .flags =3D CLK_IGNORE_UNUSED,
