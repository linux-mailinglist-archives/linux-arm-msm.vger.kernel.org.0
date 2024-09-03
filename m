Return-Path: <linux-arm-msm+bounces-30553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5389896AA43
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 23:36:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09B28282103
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 21:36:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA6E1126C1A;
	Tue,  3 Sep 2024 21:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aFdQl9rq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A2C126BF9;
	Tue,  3 Sep 2024 21:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725399392; cv=none; b=K+K9AA3tq53W3Qon8QWPlZIxkEePU3vi31S1lGjH4B5ugtLUid6QjoX7GwiaWDRW5TIkLnbCHLZoFdHJCSqUE4sx82RnHyJMaMC+M0h0BkO56dRSJx0OCsPCvhMdvuEX71Z39rsnhTZMeu2iFvjtph0rMmKp0addK0TR3bCZVEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725399392; c=relaxed/simple;
	bh=sNqNWqOObyh0Yd8IjFNXY0gFjc5VMHgPntz99N56vvI=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=rpi8FNta85PZN7Ydgy4IdvgXJkBf2x5IryGqojOSk144zciLcO91yZg7T0Y9FcbQuZKdczJE4/1yT586WZWqqM57cZAQg0/cNBR/Q0JfVJy6Da2nXKzFvxjXxD5DNcW84MCGywXVssHJY9qltiZXnE4bsXjkvCb1b8CZoZBQnP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aFdQl9rq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E725C4CEC4;
	Tue,  3 Sep 2024 21:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725399392;
	bh=sNqNWqOObyh0Yd8IjFNXY0gFjc5VMHgPntz99N56vvI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=aFdQl9rqcGVYn5lj+mLlLxKHqkhhK0MQ9UB6a8BGbdHwgk5gIOMF4i5ItkrhFLWP3
	 +xZX3j0QiCo4SRg7LLK8KO3bTdrck6b8/M3CHUd8njEr3jb2mUaG+rCjBOx+j/y34d
	 iQl/FA4VNKWFlO7p0EnQbgY+mhs1TRN6RA2C4zh5pGHheu9zfXcjAksRHsQAqaWwWq
	 HPgVw6kZq+DBKyEPtxM3tdsiFCaNQERIh6MqQp2FtLYf40AaDMwDa5cqspn325HQrS
	 HFzUDAMqJ5PpJIyeSUunBXoRib4HuS3ACNMaXL0uSmgpcrGc9pCUICr1/OqlmToHoR
	 gF4tpcBnPjK2A==
Message-ID: <c9ffecd72199926fc3d8a8e57208818c.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAA8EJpqSFp_cETNE_3iiC1viLhPD5TE+H1F=m8UksybEpAvKHQ@mail.gmail.com>
References: <20240827-qcom_ipq_cmnpll-v3-0-8e009cece8b2@quicinc.com> <20240827-qcom_ipq_cmnpll-v3-2-8e009cece8b2@quicinc.com> <d7b374670eb2f6d442f351106ab1221a.sboyd@kernel.org> <7f4d41a0-b1b9-4b63-8590-63f4fcf1a359@quicinc.com> <7736d0d0-634d-403d-b70f-f33b7402456c@quicinc.com> <04944b77ce6327ba5f4ec96348a9cda2.sboyd@kernel.org> <ecc34401-68c2-463f-b630-6a81ad95625e@quicinc.com> <6sk7sx4pz2gnne2tg3d5lsphmnp6vqjj2tjogqcop7fwn3yk3r@ftevsz77w6pt> <492e3c19-c06d-4faa-8064-e6b73c46b13e@quicinc.com> <CAA8EJpqSFp_cETNE_3iiC1viLhPD5TE+H1F=m8UksybEpAvKHQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] clk: qcom: Add CMN PLL clock controller driver for IPQ SoC
From: Stephen Boyd <sboyd@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, quic_kkumarcs@quicinc.com, quic_suruchia@quicinc.com, quic_pavir@quicinc.com, quic_linchen@quicinc.com, quic_leiwei@quicinc.com, bartosz.golaszewski@linaro.org, srinivas.kandagatla@linaro.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Jie Luo <quic_luoj@quicinc.com>
Date: Tue, 03 Sep 2024 14:36:30 -0700
User-Agent: alot/0.10

Quoting Dmitry Baryshkov (2024-09-03 07:08:07)
> On Tue, 3 Sept 2024 at 17:00, Jie Luo <quic_luoj@quicinc.com> wrote:
> >
> >
> >
> > On 9/3/2024 2:39 AM, Dmitry Baryshkov wrote:
> > > On Mon, Sep 02, 2024 at 11:33:57PM GMT, Jie Luo wrote:
> > >>
> > >>
> > >> On 8/31/2024 6:24 AM, Stephen Boyd wrote:
> > >>> Quoting Jie Luo (2024-08-30 09:14:28)
> > >>>> Hi Stephen,
> > >>>> Please find below a minor update to my earlier message on clk_ops =
usage.
> > >>>
> > >>> Ok. Next time you can trim the reply to save me time.
> > >>
> > >> OK.
> > >>
> > >>>
> > >>>> On 8/28/2024 1:44 PM, Jie Luo wrote:
> > >>>>> On 8/28/2024 7:50 AM, Stephen Boyd wrote:
> > >>>>>> Quoting Luo Jie (2024-08-27 05:46:00)
> > >>>>>>> +       case 48000000:
> > >>>>>>> +               val |=3D FIELD_PREP(CMN_PLL_REFCLK_INDEX, 7);
> > >>>>>>> +               break;
> > >>>>>>> +       case 50000000:
> > >>>>>>> +               val |=3D FIELD_PREP(CMN_PLL_REFCLK_INDEX, 8);
> > >>>>>>> +               break;
> > >>>>>>> +       case 96000000:
> > >>>>>>> +               val |=3D FIELD_PREP(CMN_PLL_REFCLK_INDEX, 7);
> > >>>>>>> +               val &=3D ~CMN_PLL_REFCLK_DIV;
> > >>>>>>> +               val |=3D FIELD_PREP(CMN_PLL_REFCLK_DIV, 2);
> > >>>>>>> +               break;
> > >>>>>>> +       default:
> > >>>>>>> +               return -EINVAL;
> > >>>>>>> +       }
> > >>>>>>
> > >>>>>> Why isn't this done with struct clk_ops::set_rate() or clk_ops::=
init()?
> > >>>>>
> > >>>>> OK, I will move this code into the clk_ops::init().
> > >>>>
> > >>>> This code is expected to be executed once for initializing the CMN=
 PLL
> > >>>> to enable output clocks, and requires the parent clock rate to be
> > >>>> available. However the parent clock rate is not available in the
> > >>>> clk_ops::init(). Hence clk_ops::set_rate() seems to be the right o=
ption
> > >>>> for this. Please let us know if this approach is fine. Thanks.
> > >>>
> > >>> Sure. It actually sounds like the PLL has a mux to select different
> > >>> reference clks. Is that right? If so, it seems like there should be
> > >>> multiple 'clocks' for the DT property and many parents possible. If
> > >>> that's the case then it should be possible to have something like
> > >>>
> > >>>     clocks =3D <0>, <&refclk>, <0>;
> > >>>
> > >>> in the DT node and then have clk_set_rate() from the consumer actua=
lly
> > >>> set the parent index in hardware. If that's all static then it can =
be
> > >>> done with assigned-clock-parents or assigned-clock-rates.
> > >>
> > >> Thanks Stephen. The CMN PLL block always uses a single input referen=
ce
> > >> clock pin on any given IPQ SoC, however its rate may be different on
> > >> different IPQ SoC. For example, its rate is 48MHZ on IPQ9574 and 96M=
HZ
> > >> on IPQ5018.

How many input pins are there on the hardware block? It makes sense that
only one pin would be used in practice, but I'm wondering if there are
multiple pins in general. Why is the field called CMN_PLL_REFCLK_INDEX
if it's not picking the reference clk desired (i.e. the pin that is
actually connected)?

> > >>
> > >> Your second suggestion seems more apt for this device. I can define =
the
> > >> DT property 'assigned-clock-parents' to configure the clock parent of
> > >> CMN PLL. The code for reference clock selection will be added in
> > >> clk_ops::set_parent(). Please let us know if this approach is fine.
> > >
> > > What is the source of this clock? Can you call clk_get_rate() on this
> > > input?
> > >
> >
> > The source (parent clock) for CMN PLL is always from on-board Wi-Fi
> > block for any given IPQ SoC.
> >
> >  From the discussion so far, it seems there are two approaches possible
> > which I would like to summarize below to be clear. Please let us know
> > if this understanding or approach needs correction. Thanks.
> >
> > 1. clk_get_rate() requires the parent clock instance to be acquired by
> > devm_clk_get(). Per our understanding from Stephen's previous comment,
> > it is preferred that a clock provider driver (this) does not use the
> > _get_ APIs on the parent clock to get the rate. Instead the parent rate
> > should be passed to the clk_ops using parent data.

struct clk_parent_data doesn't pass parent rate information to the
clk_ops. I'd like you to not use any clk consumer APIs (clk.h) if
possible.

> So the parent clock
> > should be specified in the DT using assigned-clock-parents property, and
> > can be accessed from the clk_ops::set_parent(). This seems like a more
> > reasonable method.

Yes, this makes sense if the clk actually has multiple possible parents.
Don't read the rate of the clk in the clk_ops::set_parent() callback
though. The callback should only program the hardware to select the
parent based on the index passed to the clk_op.

If the clk only has one possible parent then it's different. I'd do it
through clk_ops::set_rate() and use assigned-clock-rates or just let the
first child clk of the PLL set the rate and configure the PLL by having
the PLL's determine_rate() callback figure out if the parent rate is
valid.

That register field with "index" makes me suspicious that this is a mux
that we're trying to hide behind the parent rate. Quite possibly that's
actually a hardware multiplier, i.e. l-val, and we need to set the index
to pick which multiplier is used to achieve whatever frequency is
desired for the PLL itself. I assume the 353MHz output clk is actually
the one that is deciding what the index should be, and the other ones
all fall out of the PLL somewhere else through a post-divider or
something.

What frequency does the PLL run at?

>=20
> assigned-clock-parents is necessary if there are multiple possible
> parents. As you wrote that there is just one possible parent, then
> there is no need to use it.
> Stephen, your opinion?
>=20
> > 2. Alternatively, if it is architecturally acceptable to use
> > devm_clk_get() and clk_get_rate() in this clock provider driver, we can
> > save this parent clock rate into a local driver data structure and then
> > access it from clk_ops::init() for configuring the PLL.
>=20

No, it isn't acceptable.

