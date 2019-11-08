Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FC00F53A9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2019 19:43:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727065AbfKHSmJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Nov 2019 13:42:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:46020 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727559AbfKHSmI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Nov 2019 13:42:08 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 334DD21848;
        Fri,  8 Nov 2019 18:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573238527;
        bh=hOLr4d1sakZO1oqZEpnz48GO69KF6YcTrmFsD9e7yRg=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=DAJGUlWDjjqC8cVK6Eg38iIC5Cfte0U2YqYLYmhMeSX8xX2TPdI8KnT8b1zIwDIr4
         s1zXJd3yv3wJz86WWWGRqBsdUyB75lkVYI7Qz4NE7hIlZyjZF2q7hFH1pANxeKJczw
         mZKNA9rYKYK0gjQirJEYtw+YTPkR58G26ESxjVSI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAJs_Fx5trp2B7uOMTFZNUsYoKrO1-MWsNECKp-hz+1qCOCeU8A@mail.gmail.com>
References: <20191014102308.27441-1-tdas@codeaurora.org> <20191014102308.27441-6-tdas@codeaurora.org> <20191029175941.GA27773@google.com> <fa17b97d-bfc4-4e9c-78b5-c225e5b38946@codeaurora.org> <20191031174149.GD27773@google.com> <20191107210606.E536F21D79@mail.kernel.org> <CAJs_Fx60uEdGFjJXAjvVy5LLBXXmergRi8diWxhgGqde1wiXXQ@mail.gmail.com> <20191108063543.0262921882@mail.kernel.org> <CAJs_Fx5trp2B7uOMTFZNUsYoKrO1-MWsNECKp-hz+1qCOCeU8A@mail.gmail.com>
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
Date:   Fri, 08 Nov 2019 10:42:06 -0800
Message-Id: <20191108184207.334DD21848@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rob Clark (2019-11-08 08:54:23)
> On Thu, Nov 7, 2019 at 10:35 PM Stephen Boyd <sboyd@kernel.org> wrote:
> >
> > Quoting Rob Clark (2019-11-07 18:06:19)
> > > On Thu, Nov 7, 2019 at 1:06 PM Stephen Boyd <sboyd@kernel.org> wrote:
> > > >
> > > >
> > > > NULL is a valid clk pointer returned by clk_get(). What is the disp=
lay
> > > > driver doing that makes it consider NULL an error?
> > > >
> > >
> > > do we not have an iface clk?  I think the driver assumes we should
> > > have one, rather than it being an optional thing.. we could ofc change
> > > that
> >
> > I think some sort of AHB clk is always enabled so the plan is to just
> > hand back NULL to the caller when they call clk_get() on it and nobody
> > should be the wiser when calling clk APIs with a NULL iface clk. The
> > common clk APIs typically just return 0 and move along. Of course, we'll
> > also turn the clk on in the clk driver so that hardware can function
> > properly, but we don't need to expose it as a clk object and all that
> > stuff if we're literally just slamming a bit somewhere and never looking
> > back.
> >
> > But it sounds like we can't return NULL for this clk for some reason? I
> > haven't tried to track it down yet but I think Matthias has found it
> > causes some sort of problem in the display driver.
> >
>=20
> ok, I guess we can change the dpu code to allow NULL..  but what would
> the return be, for example on a different SoC where we do have an
> iface clk, but the clk driver isn't enabled?  Would that also return
> NULL?  I guess it would be nice to differentiate between those cases..
>=20

So the scenario is DT describes the clk

 dpu_node {
     clocks =3D <&cc AHB_CLK>;
     clock-names =3D "iface";
 }

but the &cc node has a driver that doesn't probe?

I believe in this scenario we return -EPROBE_DEFER because we assume we
should wait for the clk driver to probe and provide the iface clk. See
of_clk_get_hw_from_clkspec() and how it looks through a list of clk
providers and tries to match the &cc phandle to some provider.

Once the driver probes, the match will happen and we'll be able to look
up the clk in the provider with __of_clk_get_hw_from_provider(). If
the clk provider decides that there isn't a clk object, it will return
NULL and then eventually clk_hw_create_clk() will turn the NULL return
value into a NULL pointer to return from clk_get().

