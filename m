Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2155B3FEE4D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Sep 2021 15:05:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244365AbhIBNGh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Sep 2021 09:06:37 -0400
Received: from relay07.th.seeweb.it ([5.144.164.168]:59729 "EHLO
        relay07.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344687AbhIBNGg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Sep 2021 09:06:36 -0400
Received: from Marijn-Arch-Book.localdomain (D57D4C6E.static.ziggozakelijk.nl [213.125.76.110])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id CC4D03F215;
        Thu,  2 Sep 2021 15:05:35 +0200 (CEST)
Date:   Thu, 2 Sep 2021 15:05:34 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Stephen Boyd <sboyd@kernel.org>
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
Subject: Re: [PATCH v2 2/2] clk: qcom: gcc-sdm660: Remove transient global
 "xo" clock
Message-ID: <YTDMHq3rLUrldNfB@Marijn-Arch-Book.localdomain>
References: <20210830182445.167527-1-marijn.suijten@somainline.org>
 <20210830182445.167527-3-marijn.suijten@somainline.org>
 <163047455623.42057.15513441659841056105@swboyd.mtv.corp.google.com>
 <YS9Aa0tADAf5KMSl@Marijn-Arch-PC.localdomain>
 <163055439497.405991.16122720273000010218@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <163055439497.405991.16122720273000010218@swboyd.mtv.corp.google.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-09-01 20:46:34, Stephen Boyd wrote:
> Quoting Marijn Suijten (2021-09-01 01:57:15)
> > On 2021-08-31 22:35:56, Stephen Boyd wrote:
> > > Quoting Marijn Suijten (2021-08-30 11:24:45)
> > > > The DSI PHY/PLL was relying on a global "xo" clock to be found, but the
> > > > real clock is named "xo_board" in the DT.  The standard nowadays is to
> > > > never use global clock names anymore but require the firmware (DT) to
> > > > provide every clock binding explicitly with .fw_name.  The DSI PLLs have
> > > > since been converted to this mechanism (specifically 14nm for SDM660)
> > > > and this transient clock can now be removed.
> > > > 
> > > > This issue was originally discovered in:
> > > > https://lore.kernel.org/linux-arm-msm/386db1a6-a1cd-3c7d-a88e-dc83f8a1be96@somainline.org/
> > > > and prevented the removal of "xo" at that time.
> > > > 
> > > > Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > > > ---
> > > 
> > > Presumably this wants to go with the first one.
> > 
> > What are you referring to with "the first one"?  This patch can only go
> > in after patch 1/2 of this series, unless you are suggesting to squash
> > it with Bjorns cleanup and making sure that lands after the fix in the
> > DSI?
> 
> The first patch in this series.

Are you suggesting to squash this patch into the first patch in this
series?  Note that the first patch touches drm/msm/dsi, the second
(this) patch touches clk/qcom.
