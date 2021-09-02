Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 833133FF43F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Sep 2021 21:34:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347404AbhIBTfv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Sep 2021 15:35:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:34668 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1347356AbhIBTfv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Sep 2021 15:35:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 231B260F42;
        Thu,  2 Sep 2021 19:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630611292;
        bh=lkU0Lg08Q92PGe4kuQ+5cTptrzCavgcMALCXl/UW/aw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=pHOYUBoPGg/0YvR6uixHYK6V+0HOgvvWB6/QWB4NXXBIkPvQRiRstlkBnZ37YUt8O
         aW+qzwreY0wQXQGsIpHrpmL13pJDUflsG1vpgSG4Tu7XDBSmkIsY/G5ITmXU1GEBFo
         4UmEBWepaeTqsjVpiDaAWwc4bH2oOduaFLbnAvhBGmnNr4lTWJ4HORaoF+xItUQrwO
         m3YrNmP1UZ/WwRYTa6mu6TUYL8v7Lzgh81EYfDYzknYOpqdOz8usZ9ZCuPkff/kl4I
         sr6sWIBqW9/77+RQFGSBw9DDDYcsx6ViHJFQ4sS24j4ET9V2ezV1u/fRWJ7S5QdbeT
         1ho+CFS5gYaiw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YTDMHq3rLUrldNfB@Marijn-Arch-Book.localdomain>
References: <20210830182445.167527-1-marijn.suijten@somainline.org> <20210830182445.167527-3-marijn.suijten@somainline.org> <163047455623.42057.15513441659841056105@swboyd.mtv.corp.google.com> <YS9Aa0tADAf5KMSl@Marijn-Arch-PC.localdomain> <163055439497.405991.16122720273000010218@swboyd.mtv.corp.google.com> <YTDMHq3rLUrldNfB@Marijn-Arch-Book.localdomain>
Subject: Re: [PATCH v2 2/2] clk: qcom: gcc-sdm660: Remove transient global "xo" clock
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
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
To:     Marijn Suijten <marijn.suijten@somainline.org>
Date:   Thu, 02 Sep 2021 12:34:50 -0700
Message-ID: <163061129079.405991.11763080753220412244@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Marijn Suijten (2021-09-02 06:05:34)
> On 2021-09-01 20:46:34, Stephen Boyd wrote:
> > Quoting Marijn Suijten (2021-09-01 01:57:15)
> > > On 2021-08-31 22:35:56, Stephen Boyd wrote:
> > > > Quoting Marijn Suijten (2021-08-30 11:24:45)
> > > > > The DSI PHY/PLL was relying on a global "xo" clock to be found, b=
ut the
> > > > > real clock is named "xo_board" in the DT.  The standard nowadays =
is to
> > > > > never use global clock names anymore but require the firmware (DT=
) to
> > > > > provide every clock binding explicitly with .fw_name.  The DSI PL=
Ls have
> > > > > since been converted to this mechanism (specifically 14nm for SDM=
660)
> > > > > and this transient clock can now be removed.
> > > > >=20
> > > > > This issue was originally discovered in:
> > > > > https://lore.kernel.org/linux-arm-msm/386db1a6-a1cd-3c7d-a88e-dc8=
3f8a1be96@somainline.org/
> > > > > and prevented the removal of "xo" at that time.
> > > > >=20
> > > > > Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > > > > ---
> > > >=20
> > > > Presumably this wants to go with the first one.
> > >=20
> > > What are you referring to with "the first one"?  This patch can only =
go
> > > in after patch 1/2 of this series, unless you are suggesting to squash
> > > it with Bjorns cleanup and making sure that lands after the fix in the
> > > DSI?
> >=20
> > The first patch in this series.
>=20
> Are you suggesting to squash this patch into the first patch in this
> series?  Note that the first patch touches drm/msm/dsi, the second
> (this) patch touches clk/qcom.

No.
