Return-Path: <linux-arm-msm+bounces-88319-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FDDD0BEBF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 19:48:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 547D13008748
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 18:48:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA92F2DA763;
	Fri,  9 Jan 2026 18:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jDsM98wZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B63221F26;
	Fri,  9 Jan 2026 18:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767984509; cv=none; b=DrTUbhXxpcX/g9YQ1vM5dDaw+ew0ZVbKwFDprrj/H0UsDzZWOz5RWOMn78+ppWeDl3yK+PrXRXqBE0xbVKTl9yDqaeboVnY1QEZFRniXX/7/7dhkxXEFDP0gOf9DWS9un1kLtCpnBXa+OvZ4LfY2iXKD+1dkLB/Z6nX9H29/TxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767984509; c=relaxed/simple;
	bh=sjEraxbIIlL7ZIWr9ovnhAsvq0ZADuiIZHRzLeiOdWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MivJm9QPr7YvmBX2eClIIra2nfib7suC13uXkaLqqM4jHhke6T5tRZpSbcuX4aqr6i5wR2Hyct63TLOLSKOy7Utg89H3GjRc6PBp4u0EUe/zWL2/hHHDx5PeZMJtLrUXD7h3yv4wFjJe9y/JRCfuzPkn1oDSPG8kO1wfNLT6PZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jDsM98wZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7E9CC4CEF1;
	Fri,  9 Jan 2026 18:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767984509;
	bh=sjEraxbIIlL7ZIWr9ovnhAsvq0ZADuiIZHRzLeiOdWg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jDsM98wZl7cg+IvUEqnfsLcAECRty92dnrH+JCj9MJKQO2Y9MolncBQVRNtqWkga2
	 Cy9DAprtxg/M0vMtadQr/K4HaYn20w3OK0n7TJL87WIYc5aFLRgkqgyQ0riYcM0PKB
	 sZNtslPVLzG7eoGLxJhEXaVc1yCvEEhi4yMNVCtP+vEY5JeAbmsft6YwUYgaR4T1oK
	 5AoK6Xs3uuTTvzp4yJRQPzzfjCPY3Hs91zX7zW+z+z3cbLhguojZgDIBLgyCCgTtbk
	 5NVQE4tIycYAvdsKnYTRdwccYs16D3WCwz93lHvEyQ26vFKZArTY230+p5TVOROFDw
	 AkC5rXh2lyqsA==
Date: Fri, 9 Jan 2026 12:48:26 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Shazad Hussain <quic_shazhuss@quicinc.com>, 
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Melody Olvera <quic_molvera@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rajendra Nayak <quic_rjendra@quicinc.com>, stable@vger.kernel.org
Subject: Re: [PATCH 0/7] clk: qcom: gcc: Do not turn off PCIe GDSCs during
 gdsc_disable()
Message-ID: <aycyodp7ay5ruceoafly5xs4aopfbp7itylnvlqz7d7pkttsrr@ra466kihripk>
References: <20260102-pci_gdsc_fix-v1-0-b17ed3d175bc@oss.qualcomm.com>
 <a42f963f-a869-4789-a353-e574ba22eca8@oss.qualcomm.com>
 <edca97aa-429e-4a6b-95a0-2a6dfe510ef2@oss.qualcomm.com>
 <500313f1-51fd-450e-877e-e4626b7652bc@oss.qualcomm.com>
 <4d61e8b3-0d40-4b78-9f40-a68b05284a3d@oss.qualcomm.com>
 <e917e98a-4ff3-45b8-87a0-fe0d6823ac2e@oss.qualcomm.com>
 <2lpx7rsko24e45gexsv3jp4ntwwenag47vgproqljqeuk4j7iy@zgh6hrln4h4e>
 <aVuIsUR0pinI0Wp7@linaro.org>
 <jejrexm235dxondzjbk5ek46ilq2gbrrhoojfcghkcpclqvtks@yfsgrxueo5es>
 <aWE7wy4tyLsnEdXc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWE7wy4tyLsnEdXc@linaro.org>

On Fri, Jan 09, 2026 at 06:33:18PM +0100, Stephan Gerhold wrote:
> On Fri, Jan 09, 2026 at 09:49:52AM -0600, Bjorn Andersson wrote:
> > On Mon, Jan 05, 2026 at 10:47:29AM +0100, Stephan Gerhold wrote:
> > > On Mon, Jan 05, 2026 at 10:44:39AM +0530, Manivannan Sadhasivam wrote:
> > > > On Fri, Jan 02, 2026 at 02:57:56PM +0100, Konrad Dybcio wrote:
> > > > > On 1/2/26 2:19 PM, Krishna Chaitanya Chundru wrote:
> > > > > > On 1/2/2026 5:09 PM, Konrad Dybcio wrote:
> > > > > >> On 1/2/26 12:36 PM, Krishna Chaitanya Chundru wrote:
> > > > > >>> On 1/2/2026 5:04 PM, Konrad Dybcio wrote:
> > > > > >>>> On 1/2/26 10:43 AM, Krishna Chaitanya Chundru wrote:
> > > > > >>>>> With PWRSTS_OFF_ON, PCIe GDSCs are turned off during gdsc_disable(). This
> > > > > >>>>> can happen during scenarios such as system suspend and breaks the resume
> > > > > >>>>> of PCIe controllers from suspend.
> > > > > >>>> Isn't turning the GDSCs off what we want though? At least during system
> > > > > >>>> suspend?
> > > > > >>> If we are keeping link in D3cold it makes sense, but currently we are not keeping in D3cold
> > > > > >>> so we don't expect them to get off.
> > > > > >> Since we seem to be tackling that in parallel, it seems to make sense
> > > > > >> that adding a mechanism to let the PCIe driver select "on" vs "ret" vs
> > > > > >> "off" could be useful for us
> > > > > > At least I am not aware of such API where we can tell genpd not to turn off gdsc
> > > > > > at runtime if we are keeping the device in D3cold state.
> > > > > > But anyway the PCIe gdsc supports Retention, in that case adding this flag here makes
> > > > > > more sense as it represents HW.
> > > > > > sm8450,sm8650 also had similar problem which are fixed by mani[1].
> > > > > 
> > > > > Perhaps I should ask for a clarification - is retention superior to
> > > > > powering the GDSC off? Does it have any power costs?
> > > > > 
> > > > 
> > > > In terms of power saving it is not superior, but that's not the only factor we
> > > > should consider here. If we keep GDSCs PWRSTS_OFF_ON, then the devices (PCIe)
> > > > need to be be in D3Cold. Sure we can change that using the new genpd API
> > > > dev_pm_genpd_rpm_always_on() dynamically, but I would prefer to avoid doing
> > > > that.
> > > > 
> > > > In my POV, GDSCs default state should be retention, so that the GDSCs will stay
> > > > ON if the rentention is not entered in hw and enter retention otherwise. This
> > > > requires no extra modification in the genpd client drivers. One more benefit is,
> > > > the hw can enter low power state even when the device is not in D3Cold state
> > > > i.e., during s2idle (provided we unvote other resources).
> > > > 
> > > 
> > > What about PCIe instances that are completely unused? The boot firmware
> > > on X1E for example is notorious for powering on completely unused PCIe
> > > links and powering them down in some half-baked off state (the &pcie3
> > > instance, in particular). I'm not sure if the GDSC remains on, but if it
> > > does then the unused PD cleanup would also only put them in retention
> > > state. I can't think of a good reason to keep those on at all.
> > > 
> > 
> > Conceptually I agree, but do we have any data indicating that there's
> > practical benefit to this complication?
> > 
> 
> No, I also suggested this only from the conceptual perspective. It would
> be interesting to test this, but unfortunately I don't have a suitable
> device for testing this anymore.
> 

I doubt that we're anywhere close to the power levels we need to measure
this with any confidence today as well...

> > > The implementation of PWRSTS_RET_ON essentially makes the PD power_off()
> > > callback a no-op. Everything in Linux (sysfs, debugfs, ...) will tell
> > > you that the power domain has been shut down, but at the end it will
> > > remain fully powered until you manage to reach a retention state for the
> > > parent power domain. Due to other consumers, that will likely happen
> > > only if you reach VDDmin or some equivalent SoC-wide low-power state,
> > > something barely any (or none?) of the platforms supported upstream is
> > > capable of today.
> > > 
> > 
> > Yes, PWRSTS_RET_ON effectively means that Linux has "dropped its vote"
> > on the GDSC and its parents. But with the caveat that we assume when
> > going to ON again some state will have been retained.
> > 
> > > PWRSTS_RET_ON is actually pretty close to setting GENPD_FLAG_ALWAYS_ON,
> > > the only advantage of PWRSTS_RET_ON I can think of is that unused GDSCs
> > > remain off iff you are lucky enough that the boot firmware has not
> > > already turned them on.
> > > 
> > 
> > Doesn't GENPD_FLAG_ALWAYS_ON imply that the parent will also be always
> > on?
> > 
> 
> It probably does, but isn't that exactly what you want? If the parent
> (or the GDSC itself) would actually *power off* (as in "pull the plug"),
> then you would still lose registers even if the GDSC remains on. The
> fact that PWRSTS_RET_ON works without keeping the parent on is probably
> just because the hardware keeps the parent domain always-on?
> 

No, that's not what we want.

As part of entering and exiting CXPC, the system will switch the
resources related to the GDSC between CX and some other rail (generally
some form of MX). In other words, the hardware will "reparent" the
resources under the hood. So we do want to leave the GDSC in a "active,
but according to software inactive" state, and we need to let go of the
votes on the parents.


We typically list e.g. CX as the parent of the GDSC, giving us the two
side effects: 1) an active GDSC casts an active vote on the CX, 2) a
performance_state vote on the GDSC will trickle up to CX.

In particular the latter allow us to describe devices with a single
power-domain, and let them through that relationship cast votes on CX.
See e.g. &usb_1_ss0 in hamoa.dtsi; the GDSC doesn't have a concept of
performance states, but to sustain the given assigned-clock-rates we
need to keep CX at NOM.

> > > IMHO, for GDSCs that support OFF state in the hardware, PWRSTS_RET_ON is
> > > a hack to workaround limitations in the consumer drivers. They should
> > > either save/restore registers and handle the power collapse or they
> > > should vote for the power domain to stay on. That way, sysfs/debugfs
> > > will show the real votes held by Linux and you won't be mislead when
> > > looking at those while trying to optimize power consumption.
> > > 
> > 
> > No, it's not working around limitations in the consumer drivers.
> > 
> > It does work around a limitation in the API, in that the consumer
> > drivers can't indicate in which cases they would be willing to restore
> > and in which cases they would prefer retention. This is something the
> > downstream solution has had, but we don't have a sensible and generic
> > way to provide this.
> 
> I might be missing something obvious, but mapping this to the existing
> pmdomain API feels pretty straightforward to me:
> 
>  - Power on/power off means "pull the plug", i.e. if you vote for a
>    pmdomain to power off you should expect that registers get lost.
>    That's exactly what will typically happen if the hardware actually
>    removes power completely from the power domain.
> 

I think you should rather see it as a question of does the requester
need the power to be on. In many/most cases you have some form of logic
or reference counting between the consumer and the actual hardware
switch.

So a client doesn't vote for a resource to be turned off, it rather
removes its vote for it to be on. The layers below will then aggregate
votes, implement sleep timeouts etc, and might turn off the power.

>  - If you want to preserve registers (retention), you need to tell the
>    hardware to keep the pmdomain powered on at a minimum voltage
>    (= performance state). In fact, the PCIe GDSC already inherits
>    support for RPMH_REGULATOR_LEVEL_RETENTION from its parent domain.
>    (If RPMH_REGULATOR_LEVEL_RETENTION happens to be higher than the
>     rentention state we are talking about here you could also just vote
>     for 0 performance state...)
> 

This world view does makes sense, but instead of keeping CX as a
"retention" level, the Qualcomm platform retain state through some other
power rail, allowing CX to collapse fully - bringing with it all those
parts that hasn't been built or configured to switch to retention power.

> With this, the only additional feature you need from the pmdomain API is
> to disable its sometimes inconvenient feature to automatically disable
> all pmdomains during system suspend (independent of the votes made by
> drivers). I believe this exists already in different forms. Back when
> I needed something like this for cpufreq on MSM8909, Ulf suggested using
> device_set_awake_path(), see commit d6048a19a710 ("cpufreq: qcom-nvmem:
> Preserve PM domain votes in system suspend"). I'm not entirely up to
> date what is the best way currently to do this, but letting a driver
> preserve its votes across system suspend feels like a common enough
> requirement that should be supported by the pmdomain API.
> 

In the downstream Qualcomm kernels you can find various mechanism for
client drivers to dynamically change this behavior for both clocks and
GDSCs. There has been "corner cases" through history where in certain
use cases you want retention and in other don't.

No such APIs exists in the PM or clock APIs.

> > 
> > Keeping GDSCs in retention is a huge gain when it comes to the time it
> > takes to resume the system after being in low power. PCIe is a good
> > example of this, where the GDSC certainly support entering OFF, at the
> > cost of tearing link and all down.
> > 
> 
> I don't doubt that. My point is that the PCIe driver should make that
> decision and not the (semi-)generic power domain driver that does not
> exactly know who (or if anyone) is going to consume its power domain.
> Especially because this decision is encoded in SoC-specific data and we
> had plenty of patches already changing PWRSTS_OFF_ON to PWRSTS_RET_ON
> due to suspend issues initially unnoticed on some SoCs (or vice-versa to
> save power).
> 

That idea that the responsibility for making such decisions would better
lie with the client I agree with.

But on the other hand, extending the APIs to allow such fine grained
tweaks makes the system more integrated and complex. Conceptually I
would prefer us moving towards the Linux power model, with individual
devices having an abstract power state, rather than sprinkling tweaks
throughout.


Ultimately, I don't think this it's worth exposing such controls. We're
orders of magnitude away from decent power consumption in sleep, and we
still can't boot the system reliably without clk_ignore_unused. Once
we're past that, I'd be happy to be proven wrong by some measurements.

Regards,
Bjorn

> Thanks,
> Stephan

