Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F234DB4BA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2019 19:49:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732016AbfJQRtn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Oct 2019 13:49:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:47814 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729887AbfJQRtm (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Oct 2019 13:49:42 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3DA222089C;
        Thu, 17 Oct 2019 17:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571334582;
        bh=dHnSbroD3SMcqLgPTUMVteeYlnRaM6KOfYW2ntB33TE=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=1mP/EY2CBlX30AnWCRm3HS2PSNqSGRSCffsHWoDjA80FvctLOrEVG+5nk3hVQULHW
         f08f9HykLAMGQ3rJoPYgnuxYV1Ir7w9Ii8iGQc65i6n3wYMDENq3FbAB3NAw+2TCAM
         AfSrlZFcylex075nW6XIkbQBjQY+eVInH59QwFOc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <df6cae85-f5f6-cd93-0dd3-17f0f28fe376@codeaurora.org>
References: <a7e27415-02d9-bfe9-c0ea-59dc236a7f91@free.fr> <c1762201-a1fa-8ed1-24ff-f30916ee45dd@free.fr> <155389876377.20095.15037552865160559827@swboyd.mtv.corp.google.com> <eba920f5-f5a2-53d5-2227-529b5ea99d32@codeaurora.org> <20191010041551.6D7E0208C3@mail.kernel.org> <a8540fe3-9500-4998-ca25-a06269541383@codeaurora.org> <20191010194810.47D062067B@mail.kernel.org> <df6cae85-f5f6-cd93-0dd3-17f0f28fe376@codeaurora.org>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Manu Gautam <mgautam@codeaurora.org>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Jeffrey Hugo <jhugo@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Evan Green <evgreen@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Vinod Koul <vkoul@kernel.org>,
        Amit Nischal <anischal@codeaurora.org>
Subject: Re: [PATCH v1] clk: qcom: Skip halt checks on gcc_pcie_0_pipe_clk for 8998
User-Agent: alot/0.8.1
Date:   Thu, 17 Oct 2019 10:49:41 -0700
Message-Id: <20191017174942.3DA222089C@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Manu Gautam (2019-10-10 20:47:12)
>=20
> On 10/11/2019 1:18 AM, Stephen Boyd wrote:
> > Quoting Manu Gautam (2019-10-10 00:33:32)
> >> Hi,
> >>
> >> On 10/10/2019 9:45 AM, Stephen Boyd wrote:
> >>> Quoting Manu Gautam (2019-10-09 01:31:09)
> >> [snip]
> >>>> I have followed this up with QMP PHY hardware designers and they have
> >>>> confirmed that QMP PHY must have pipe clock enabled at the beginning
> >>>> of initialization sequence i.e. before bringing it out of reset and =
starting it.
> >>> Awesome, thanks for following up.
> >>>
> >>>> Otherwise there is possibility of incorrect locking of pipe_interfac=
e/
> >>>> retime buffers in PHY.
> >>>> Hence, for both USB and PCIe we have to continue to use HALT_SKIP fl=
ag.
> >>> Does anything go wrong if we just leave these clks enabled forever out
> >>> of boot? I'm inclined to rip the clks out and just slam the branch
> >>> enable bit on all the time in gcc driver probe and return NULL to the
> >>> callers of clk_get() for these clks. I don't see how this would be a
> >>> problem because when the upstream phy is disabled this clk is disabled
> >>> and so we aren't wasting power. It should also save us time and memory
> >>> because now we don't have to call into the clk framework to turn it on
> >>> and sequence that just right in the phy driver.
> >> That might work, however on some platforms gcc_pipe_clk parent is chan=
ged to
> >> XO and back to phy_pipe_clk across low power mode.
> >> It requires PHY driver to use clk_set_parent().
> >>
> > Hm ok. Where is the call to clk_set_parent()? I don't see this in the
> > kernel.
> >
> >  $ git grep clk_set_parent -- drivers/usb/phy drivers/phy | wc -l
> >  0
> >
> > What platforms do this? Are they upstream?
>=20
> They are some recent platforms and not on upstream yet.
>=20

Cool so we can remove it on the platforms that are upstream right now
and get to this problem later.

