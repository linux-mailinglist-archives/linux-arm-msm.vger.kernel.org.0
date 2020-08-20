Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D76924C885
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Aug 2020 01:27:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728754AbgHTX1i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Aug 2020 19:27:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:49928 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728498AbgHTX1h (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Aug 2020 19:27:37 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1513C20748;
        Thu, 20 Aug 2020 23:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597966057;
        bh=31Y6NUC/jEe/HxiXYkm3+iT80kHa+NgUWjEZ87ZO7Tw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=SmVuzgtEOXKFTdIq8kzckGoPuu1pGzk1gkIcVB/AFojLEoZF1j/MVFK3AXx4/ZdW3
         a1bEUyUe9Ua84lWHG7rMcJkOThr3PmXVYQlbxV6F/GDCIzwGj13IqA2kx4lrjoRSGI
         XXdnXSvk6ptWicl939xigBNv5rsV/pCt/5/vHNI8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200818080738.GA46574@gerhold.net>
References: <20200817140908.185976-1-stephan@gerhold.net> <CAOCk7Nq6CT5q_aXG2jZ2t5=3YKVKM4r=gSnJLJkVccpwyc3XnQ@mail.gmail.com> <20200818080738.GA46574@gerhold.net>
Subject: Re: [PATCH] clk: qcom: smd: Disable unused clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        MSM <linux-arm-msm@vger.kernel.org>, linux-clk@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Georgi Djakov <georgi.djakov@linaro.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>
Date:   Thu, 20 Aug 2020 16:27:35 -0700
Message-ID: <159796605593.334488.8355244657387381953@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Stephan Gerhold (2020-08-18 01:07:38)
> Hi Jeffrey,
>=20
> On Mon, Aug 17, 2020 at 08:52:46AM -0600, Jeffrey Hugo wrote:
> > So essentially, when the clk framework goes through late init, and
> > decides to turn off clocks that are not being used, it will also turn
> > off these clocks?
> >=20
> > I think this is going to break other targets where other subsystems
> > happen to rely on these sorts of votes from Linux inorder to run/boot
> > (not saying it's a good thing, just that is how it is and since we
> > can't change the FW on those....).
> >=20
>=20
> After thinking about it some more I realized there are definitely some
> of the clocks we shouldn't disable even when unused, for example the
> interconnect clocks. With interconnect drivers disabled the system
> basically locked up entirely once the clock core disabled the clocks.

The interconnect clks should be moved out of the RPM clk drivers. It's
over-engineering to have the RPM interconnect drivers talk to the RPM
clk drivers to change the frequency of interconnects based on a
calculation in the interconnect driver. It makes sense from a logical
perspective to express that these are clks, and they have frequencies,
etc., but when you look closer at it you see that it's nonsense.

The RPMh interconnect driver should be able to talk directly to the RPM
and turn knobs as it see fit. Nobody else is going to use those clks
from the RPM clk driver. Any potential consumer is going to go through
the interconnect layer to change frequencies. So now we've got two
frameworks interfacing with the same wire protocol and remote processor,
when we could have only one. And furthermore to the point, the RPM
interconnect clks are all parented to nothing, so putting them behind
the clk APIs provides practically zero benefits, like managing the clk
tree or determining rates down the tree.

Honestly I'd like to see all the various RPM drivers combined into one
driver that knows what is going on between regulators, interconnects,
and clks, etc. Carving it up into these different drivers spread across
the tree helps us review the code and logically split the device into
pieces, but the flip side is that nobody sees the big picture that a
call into a framework here boils down to a couple RPM messages sent over
the wire to the same device.

> For now I fixed this by marking all of DEFINE_CLK_SMD_RPM() as
> CLK_IGNORE_UNUSED (essentially restoring the current behavior of the
> driver). For MSM8916 these are exactly the interconnect clocks, but on
> other platforms there are further clocks that might not need
> CLK_IGNORE_UNUSED. This could be still optimized later.
>=20
> > I think this needs to be validated on every single qcom platform using
> > this driver.
> >=20
>=20
> After running into the issue above I kind of agree with you. While
> problems should be limited by marking the "rate" clocks as
> CLK_IGNORE_UNUSED, it's also possible that one of the platforms requires
> one of the branch clocks to stay on to boot successfully.
>=20
> I know for sure that this works properly on MSM8916, so maybe I should
> make it opt-in and then we add it for each platform after validating it?
>=20

No! Instead of putting band-aids on this broken mess, please just move
the interconnect clks out of the clk driver and into the interconnect
driver.

Sorry for the rant and thanks for sending a patch to fix problems you're
seeing.
