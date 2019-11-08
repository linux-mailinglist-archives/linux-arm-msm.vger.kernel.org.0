Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6096F406E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2019 07:35:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726103AbfKHGfo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Nov 2019 01:35:44 -0500
Received: from mail.kernel.org ([198.145.29.99]:57244 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725886AbfKHGfo (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Nov 2019 01:35:44 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0262921882;
        Fri,  8 Nov 2019 06:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573194943;
        bh=WtlyHdXzYR6zFb9CyoGvL3jaNaSQ59dn8PybAwn/UWk=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=C8RPxjnRf/hUxQQB3nIelAjN8AOWykVxtOvebXxVnI5p07Zuxo5v/ONyFiTk5YXNG
         4lWRDtXRbzTaXbh9BvuFkk5NDeUMfupG5f8Afd8K8t5yLtRoB7c3LJOACpRIK4BmiF
         b7YZkHZhv9917xZyQUZ9VHTJMha+Z/awAExilEqw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAJs_Fx60uEdGFjJXAjvVy5LLBXXmergRi8diWxhgGqde1wiXXQ@mail.gmail.com>
References: <20191014102308.27441-1-tdas@codeaurora.org> <20191014102308.27441-6-tdas@codeaurora.org> <20191029175941.GA27773@google.com> <fa17b97d-bfc4-4e9c-78b5-c225e5b38946@codeaurora.org> <20191031174149.GD27773@google.com> <20191107210606.E536F21D79@mail.kernel.org> <CAJs_Fx60uEdGFjJXAjvVy5LLBXXmergRi8diWxhgGqde1wiXXQ@mail.gmail.com>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Rob Clark <robdclark@chromium.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>,
        Taniya Das <tdas@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, Rob Herring <robh+dt@kernel.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Sean Paul <seanpaul@chromium.org>
Subject: Re: [PATCH v4 5/5] clk: qcom: Add Global Clock controller (GCC) driver for SC7180
User-Agent: alot/0.8.1
Date:   Thu, 07 Nov 2019 22:35:42 -0800
Message-Id: <20191108063543.0262921882@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rob Clark (2019-11-07 18:06:19)
> On Thu, Nov 7, 2019 at 1:06 PM Stephen Boyd <sboyd@kernel.org> wrote:
> >
> > Quoting Matthias Kaehlcke (2019-10-31 10:41:49)
> > > Hi Taniya,
> > >
> > > On Thu, Oct 31, 2019 at 04:59:26PM +0530, Taniya Das wrote:
> > > > Hi Matthias,
> > > >
> > > > Thanks for your comments.
> > > >
> > > > On 10/29/2019 11:29 PM, Matthias Kaehlcke wrote:
> > > > > Hi Taniya,
> > > > >
> > > > > On Mon, Oct 14, 2019 at 03:53:08PM +0530, Taniya Das wrote:
> > > > > > Add support for the global clock controller found on SC7180
> > > > > > based devices. This should allow most non-multimedia device
> > > > > > drivers to probe and control their clocks.
> > > > > >
> > > > > > Signed-off-by: Taniya Das <tdas@codeaurora.org>
> > > >
> > > > >
> > > > > v3 also had
> > > > >
> > > > > +   [GCC_DISP_AHB_CLK] =3D &gcc_disp_ahb_clk.clkr,
> > > > >
> > > > > Removing it makes the dpu_mdss driver unhappy:
> > > > >
> > > > > [    2.999855] dpu_mdss_enable+0x2c/0x58->msm_dss_enable_clk: 'if=
ace' is not available
> > > > >
> > > > > because:
> > > > >
> > > > >          mdss: mdss@ae00000 {
> > > > >                     ...
> > > > >
> > > > >   =3D>             clocks =3D <&gcc GCC_DISP_AHB_CLK>,
> > > > >                           <&gcc GCC_DISP_HF_AXI_CLK>,
> > > > >                           <&dispcc DISP_CC_MDSS_MDP_CLK>;
> > > > >                  clock-names =3D "iface", "gcc_bus", "core";
> > > > >     };
> > > > >
> > > >
> > > > The basic idea as you mentioned below was to move the CRITICAL cloc=
ks to
> > > > probe. The clock provider to return NULL in case the clocks are not
> > > > registered.
> > > > This was discussed with Stephen on v3. Thus I submitted the below p=
atch.
> > > > clk: qcom: common: Return NULL from clk_hw OF provider.
> > >
> > > I see. My assumption was that the entire clock hierarchy should be re=
gistered,
> > > but Stephen almost certainly knows better :)
> > >
> > > > Yes it would throw these warnings, but no functional issue is obser=
ved from
> > > > display. I have tested it on the cheza board.
> > >
> > > The driver considers it an error (uses DEV_ERR to log the message) an=
d doesn't
> > > handle other clocks when one is found missing. I'm not really familil=
ar with
> > > the dpu_mdss driver, but I imagine this can have some side effects. A=
dded some
> > > of the authors/contributors to cc.
> >
> > NULL is a valid clk pointer returned by clk_get(). What is the display
> > driver doing that makes it consider NULL an error?
> >
>=20
> do we not have an iface clk?  I think the driver assumes we should
> have one, rather than it being an optional thing.. we could ofc change
> that

I think some sort of AHB clk is always enabled so the plan is to just
hand back NULL to the caller when they call clk_get() on it and nobody
should be the wiser when calling clk APIs with a NULL iface clk. The
common clk APIs typically just return 0 and move along. Of course, we'll
also turn the clk on in the clk driver so that hardware can function
properly, but we don't need to expose it as a clk object and all that
stuff if we're literally just slamming a bit somewhere and never looking
back.

But it sounds like we can't return NULL for this clk for some reason? I
haven't tried to track it down yet but I think Matthias has found it
causes some sort of problem in the display driver.

