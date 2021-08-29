Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA27B3FA857
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Aug 2021 05:50:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233250AbhH2Dv3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Aug 2021 23:51:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:58236 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232954AbhH2Dv2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Aug 2021 23:51:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A905860F35;
        Sun, 29 Aug 2021 03:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630209036;
        bh=hj8IppURBuA6lhrAt5dApf2VLeYLt8qeWhs1yObmonQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=pyTWFQF16TAOYnXPoAw/YAQum6E2OBIj2bYIAwtUKTzZQ+ynmQbas1hFFDI1tvTI2
         //1MYLg9vOZXVHaAuQJGPekGJrBdkoNQs1r/c4+wLNOftjXwLIyQeW+bfXOHVKcXf0
         0z9ROoO5RdKnu2hmyh/W2q7HMaMzDCeGjH7Uo6Ai/7EdczpjGNRmZfbc3xtmmedAFx
         F3fCDArUBijQYgev3AbT+KBmnIG4Wx12NTR1edN/XOlw6+baRet/Lhp7JdhwuHC4VQ
         lqkGZqdKfY8wqbyvU4eFgce0+fhKCG+vcuNZtqAjDSjbURlRN/20Jh4TIP9or7jlZ3
         n9rLVNQDXSZIA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <08618b13-816b-7fc3-6ee6-fc222aef0607@somainline.org>
References: <20210825204517.1278130-1-bjorn.andersson@linaro.org> <163000363556.1317818.13808174908685575043@swboyd.mtv.corp.google.com> <08618b13-816b-7fc3-6ee6-fc222aef0607@somainline.org>
Subject: Re: [PATCH v2] clk: qcom: gcc-sdm660: Replace usage of parent_names
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Martin Botka <martin.botka@somainline.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Sat, 28 Aug 2021 20:50:35 -0700
Message-ID: <163020903534.2218116.16710170594346529772@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Marijn Suijten (2021-08-26 12:16:57)
> Hi Stephen,
>=20
> On 8/26/21 8:47 PM, Stephen Boyd wrote:
> > Quoting Bjorn Andersson (2021-08-25 13:45:17)
> >> Using parent_data and parent_hws, instead of parent_names, does protect
> >> against some cases of incompletely defined clock trees. While it turns
> >> out that the bug being chased this time was totally unrelated, this
> >> patch converts the SDM660 GCC driver to avoid such issues.
> >>
> >> The "xo" fixed_factor clock is unused within the gcc driver, but
> >> referenced from the DSI PHY. So it's left in place until the DSI driver
> >> is updated.
> >>
> >> Tested-by: Marijn Suijten <marijn.suijten@somainline.org>
> >> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@som=
ainline.org>
> >> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> >> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> >> ---
> >=20
> > Applied to clk-next after moving back the arrays so the diff is smaller.
> >=20
>=20
> Unfortunately the arrays cannot be moved back up since they (for the=20
> most part) reference gpll clocks in `.hw =3D &gpll*` fields - these have =

> to be defined first or forward-declared otherwise, which is why the=20
> arrays were moved down in the first place.
>=20
> The general structure nowadays seems to place these parent maps/data=20
> right above the clock that uses them, making it easier to read.
>=20

Yes I applied a patch that only moved the arrays around first.
