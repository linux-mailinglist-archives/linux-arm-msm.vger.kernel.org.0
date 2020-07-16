Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 633AE22191D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jul 2020 02:53:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726785AbgGPAxJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jul 2020 20:53:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:35372 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726776AbgGPAxJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jul 2020 20:53:09 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BA0F920658;
        Thu, 16 Jul 2020 00:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594860788;
        bh=7K2Zm7cmnH3NJtWVY8UdCmX8RNbGFsFDyTyfo4T/bPU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=VA20M1JCvHi9YgJUyHRBrpypoDWoSKag8wMuY0w92SpjTdFcf5ovRr7dDlvD9HdwI
         yny1JBz1sVQysxYw19VU9Pi7F8xzybJSxxrNCzuwnAf19p8TiOoQkOM7dQV+E1S6td
         saXl1IeGOnACRZSBqk/L5AtDUxx+Ruqxoqu0IAK0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200713152110.GA213149@bogus>
References: <1593766185-16346-1-git-send-email-loic.poulain@linaro.org> <1593766185-16346-4-git-send-email-loic.poulain@linaro.org> <159442640418.1987609.16468106693473840191@swboyd.mtv.corp.google.com> <20200713152110.GA213149@bogus>
Subject: Re: [PATCH v5 3/5] dt-bindings: clk: qcom: Add bindings for CPU clock for msm8996
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Loic Poulain <loic.poulain@linaro.org>, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        amit.kucheria@linaro.org, Ilia Lin <ilialin@codeaurora.org>
To:     Rob Herring <robh@kernel.org>
Date:   Wed, 15 Jul 2020 17:53:08 -0700
Message-ID: <159486078803.1987609.8714771169501004566@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rob Herring (2020-07-13 08:21:10)
> On Fri, Jul 10, 2020 at 05:13:24PM -0700, Stephen Boyd wrote:
> > Quoting Loic Poulain (2020-07-03 01:49:43)
> > > From: Ilia Lin <ilialin@codeaurora.org>
> > >=20
> > > Each of the CPU clusters (Power and Perf) on msm8996 are
> > > clocked via 2 PLLs, a primary and alternate. There are also
> > > 2 Mux'es, a primary and secondary all connected together
> > > as shown below
> > >=20
> > >                              +-------+
> > >               XO             |       |
> > >           +------------------>0      |
> > >                              |       |
> > >                    PLL/2     | SMUX  +----+
> > >                      +------->1      |    |
> > >                      |       |       |    |
> > >                      |       +-------+    |    +-------+
> > >                      |                    +---->0      |
> > >                      |                         |       |
> > > +---------------+    |             +----------->1      | CPU clk
> > > |Primary PLL    +----+ PLL_EARLY   |           |       +------>
> > > |               +------+-----------+    +------>2 PMUX |
> > > +---------------+      |                |      |       |
> > >                        |   +------+     |   +-->3      |
> > >                        +--^+  ACD +-----+   |  +-------+
> > > +---------------+          +------+         |
> > > |Alt PLL        |                           |
> > > |               +---------------------------+
> > > +---------------+         PLL_EARLY
> > >=20
> > > The primary PLL is what drives the CPU clk, except for times
> > > when we are reprogramming the PLL itself (for rate changes) when
> > > we temporarily switch to an alternate PLL. A subsequent patch adds
> > > support to switch between primary and alternate PLL during rate
> > > changes.
> > >=20
> > > The primary PLL operates on a single VCO range, between 600MHz
> > > and 3GHz. However the CPUs do support OPPs with frequencies
> > > between 300MHz and 600MHz. In order to support running the CPUs
> > > at those frequencies we end up having to lock the PLL at twice
> > > the rate and drive the CPU clk via the PLL/2 output and SMUX.
> > >=20
> > > Signed-off-by: Ilia Lin <ilialin@codeaurora.org>
> > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > ---
> >=20
> > Applied to clk-next
>=20
> And this breaks linux-next:
>=20
> https://gitlab.com/robherring/linux-dt-bindings/-/jobs/635720095

I guess this is the downside of reviewed-by tags going stale.
