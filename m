Return-Path: <linux-arm-msm+bounces-7979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36625839342
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 16:41:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A15021F21744
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 15:41:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80DF85FEF6;
	Tue, 23 Jan 2024 15:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EC4y9jAb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5722F651A0;
	Tue, 23 Jan 2024 15:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706024098; cv=none; b=eKgsyFeX8OgAp8FsSofu0vUOGHAyiOl/JVmb9SYZ6bpnl2tvuZiGq6buHUJypn2vfBnWuNvTiruVFXmoM9gjH1PgbuIWjer4cfCGWQmooJqcBk1lGNxvWIEc7zCLZ+AQI/bcK7Obqo/zOaKGUKlbRy23W5jufZNsjMcXD+D3dDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706024098; c=relaxed/simple;
	bh=VbPelRCCDKpgv5pSny6yARVrK5k1xRKALab50cBgQ8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tqjXaF06WlauXaW2bKt0t+66WSHD6lHiB/RxpyoowCNgI6CW/69bcVUF33HuFnSHey22ygb/lhL6J4Ny+ruYdDzKav9x69c0qVkm/UI86wVi80gtRPIjgEAGo5RW7GxCVAMZ+Z+4pwLH5l8T4rU5RFGehWyIBctgcR0hPyt3aXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EC4y9jAb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAFCEC433F1;
	Tue, 23 Jan 2024 15:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706024097;
	bh=VbPelRCCDKpgv5pSny6yARVrK5k1xRKALab50cBgQ8s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EC4y9jAbLuWFJtma4SAgnPX7BwLaBtiTahC6rRRtRr4WCjKEd4SojjhFtCkejh6ih
	 hWz9FYqLI+hngoPkwT/OL0S4PGIJo9Q2kk1JZCem0qbP7zyV3aS/Lz0Yk3sL1RHcXR
	 NzpOaETq9A7pcsfXaKVAD1EpEl3SNG+W22l+kIamnEl5WVNsRxUhXbn/0eqqeSDWzR
	 lid0cALuTpEwNmc7jGT/MvzintD+Ti+cmY8HhGMSrvaIanVSQM8Ifs5xyiu3gyxs13
	 FFjlAJ5M2/i0Fg+Cg2gTO4pUvjWs0X9pRlwUgmZtKOId5xiRIUft1uqaN7jLkXOuvM
	 QEnJ7kM2sCXxg==
Date: Tue, 23 Jan 2024 09:34:53 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Alex Elder <elder@linaro.org>, 
	Srini Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: Re: [RFC] arm64: dts: qcom: qrb5165-rb5: model the PMU of the
 QCA6391
Message-ID: <2d36zymagbran5m7ggcmy2zmtpt7xpefgys7rebbwydz5bpux2@svlv75ctdow5>
References: <20240122182158.69183-1-brgl@bgdev.pl>
 <u5kvv3iip552yb5ykc4t2arfry2t7f34hwmemd7z6qfw677fs6@ldlwoycyacrm>
 <CAMRc=MeT08vUUqJmtVCP=kSUrbsoKFHP6gHgJPtqztC593oGpQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MeT08vUUqJmtVCP=kSUrbsoKFHP6gHgJPtqztC593oGpQ@mail.gmail.com>

On Tue, Jan 23, 2024 at 10:22:33AM +0100, Bartosz Golaszewski wrote:
> On Tue, Jan 23, 2024 at 5:47 AM Bjorn Andersson <andersson@kernel.org> wrote:
> >
> > On Mon, Jan 22, 2024 at 07:21:58PM +0100, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > I'm limiting the audience of this compared to the PCI power sequencing
> > > series as I wanted to run the DT part by the maintainers before I commit
> > > to a doomed effort.
> > >
> >
> > With linux-arm-msm and deviectree in there, you have a fairly big
> > limited audience... I think if anything, your proposal is doomed by the
> > lack of a proper commit message describing what this is.
> >
> 
> By limiting I meant compared to the PCI power sequencing series but
> you're right, I should have linked that series in here. In any case -
> this is not intended for upstream, I literally wanted input on whether
> this representation is correct before I send a PoC of the pwrseq
> subsystem using it.
> 
> > Below you'll find some questions/feedback based on our previous
> > discussions on the topic, although I'm not able to understand the
> > motivations behind what you propose - or even fully what it is that
> > you're proposing.
> >
> > > Here is the DT representation of the QCA6390's PMU with its inputs and
> > > outputs. If I were to implement the pwrseq framework that would be able
> > > to assign the relevant pwrseq data to the consumer based on the actual
> > > regulators and not abstract bt-pwrseq or wlan-pwrseq properties - would
> > > that fly with you?
> > >
> >
> > Why do you need to make up this intermediate/fake "PMU" thing? The
> > regulators are reference counted already.
> >
> 
> Dmitry insists that for QCA6490 we *do* need to implement a proper
> power sequencing with delays between enabling WLAN and BT GPIOs.
> 
> See: https://lore.kernel.org/netdev/CAA8EJpqyK=pkjEofWV595tp29vjkCeWKYr-KOJh_hBiBbkVBew@mail.gmail.com/
> 

I had not seen that comment before, would have been excellent to include
in your "problem description".

> Even though the regulators are reference counted, this is not enough.
> Dmitry tried to implement a power sequencing framework some time ago
> but the main complaint was that explicit properties like bt-pwrseq are
> not a right fit for DT as they don't represent hardware. We still need
> to centralize the control over the shared resources though but what I
> want to propose is doing that with a more realistic representation of
> HW and just reusing phandle connections between DT nodes to retrieve
> the correct pwrseq struct in the driver. But this is implementation
> detail and before I want to clear the HW representation with DT
> maintainers.
> 

In my view Dmitry had at least one proposal, that was rejected, where he
represented the qca6390 package as a thing in DeviceTree.

> Dmitry is also correct in pointing out that It's also simply an
> incorrect representation of what is on the board as the PMU is a
> discrete module, has its inputs and outputs, even though they're
> inside the package.
> 

I'm not sure what you're trying to say here. There's no "PMU module" on
the board, it's a block within the QCA6390. But perhaps that's what
you're also saying?

> > > We'd need to deprecate the existing BT bindings but unfortunately they
> > > are already described as consuming the host PMIC regulators in bindings.
> > >
> >
> > I was under the impression that the supplies in the bluetooth binding
> > are the supply pads of the chip. Where the power to those pads come from
> > is not a property of the binding.
> >
> 
> We already model the WLAN and BT modules as separate elements even
> though they're in the same package. For consistency we should model
> the PMU module too.
> 

So what you're proposing is that the PMU is the consumer of the external
supplies, and it in turn provides a set of internal power-rails which
should be consumed by the WiFi and BT modules.

That's sounds like a plausible way to get around the problem that we
don't want to represent a fake device in DeviceTree.

That still doesn't answer me why bluetooth suddenly now has an input
named "vddpcie0", can you please point me to the documentation of the
internal power routing in the QCA6390 that confirms this?

> And for the record: I would love to stick to what we have now as it
> would make my PCI power sequencing series much easier to get upstream
> but it will result in problems later on, I have to give it to Dmitry.
> 
> > So what you need to do is describe why the pads suddenly changed.
> >
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > ---
> > >  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 129 +++++++++++++++++++++--
> > >  arch/arm64/boot/dts/qcom/sm8250.dtsi     |  10 ++
> > >  2 files changed, 128 insertions(+), 11 deletions(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> > > index cd0db4f31d4a..c9b1600c57ef 100644
> > > --- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> > > +++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> > > @@ -108,6 +108,88 @@ lt9611_3v3: lt9611-3v3 {
> > >               regulator-always-on;
> > >       };
> > >
> > > +     qca6390_pmu: pmu@0 {
> >
> > This is not a thing.
> >
> 
> What isn't?
> 

My bad. You're right, there is a block in the corner of the QCA6390
called "PMU".

> > > +             compatible = "qcom,qca6390-pmu";
> > > +
> > > +             pinctrl-names = "default";
> > > +             pinctrl-0 = <&bt_en_state>, <&wlan_en_state>;
> > > +
> > > +             vddaon-supply = <&vreg_s6a_0p95>;
> > > +             vddpmu-supply = <&vreg_s2f_0p95>;
> > > +             vddrfa1-supply = <&vreg_s2f_0p95>;
> > > +             vddrfa2-supply = <&vreg_s8c_1p3>;
> > > +             vddrfa3-supply = <&vreg_s5a_1p9>;
> > > +             vddpcie1-supply = <&vreg_s8c_1p3>;
> > > +             vddpcie2-supply = <&vreg_s5a_1p9>;
> > > +             vddio-supply = <&vreg_s4a_1p8>;
> > > +
> > > +             bt-enable-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
> > > +             wifi-enable-gpios = <&tlmm 20 GPIO_ACTIVE_HIGH>;
> > > +             swctrl-gpios = <&tlmm 124 GPIO_ACTIVE_HIGH>;
> >
> > Are these collected here because we still have convinced ourselves that
> > they need to be handled from a common place, or did you actually find
> > some documentation you can point to that shows this is necessary?
> >
> 
> So the datasheet is not clear on that but it says: "bluetooth enable
> signal from host" and since the regulators above are also "from host"
> I figured the best fit is here.
> 

Per Dmitry's argument that you linked above, bt-enable and wifi-enable
should be the only things that you need to synchronize.

> > > +
> > > +             regulators {
> > > +                     vreg_pmu_rfa_cmn: ldo0 {
> > > +                             regulator-name = "vreg_pmu_rfa_cmn";
> > > +                             regulator-min-microvolt = <760000>;
> > > +                             regulator-max-microvolt = <840000>;
> >
> > These limits should be applied to &vreg_s2f_0p95 (although I'm just
> > guessing how this maps to the upstream supply...
> 
> I'm not following. Why?
> 

Are you saying that the PMU contains a set of LDOs or similar that
alter the voltage from what's provided on the external pads?

> >
> > > +                     };
> > [..]
> > > @@ -734,6 +816,24 @@ &pcie0_phy {
> > >       vdda-pll-supply = <&vreg_l9a_1p2>;
> > >  };
> > >
> > > +&pcieport0 {
> > > +     wifi@0 {
> > > +             compatible = "pci17cb,1101";
> >
> > Does this compatible somehow bind to a entity that knows what to do with
> > the regulators below?
> >
> 
> Ok, so what does that matter? This is device-tree. What linux does
> behind the scenes is irrelevant - what is important is that there is
> an ATH11K module here as represented by this PCI vendor/model codes
> and that it's supplied by these regulators.
> 

I'm just making guesses about the design and how this fits into previous
discussions on the subject of PCI power sequencing, because you didn't
tell me what any of the things in this patch are.

Regards,
Bjorn

> Bart
> 
> > > +             reg = <0x10000 0x0 0x0 0x0 0x0>;
> > > +
> > > +             vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
> > > +             vddaon-supply = <&vreg_pmu_aon_0p59>;
> > > +             vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
> > > +             vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
> > > +             vddbtcmx-supply = <&vreg_pmu_btcmx_0p85>;
> > > +             vddrfa0-supply = <&vreg_pmu_rfa_0p8>;
> > > +             vddrfa1-supply = <&vreg_pmu_rfa_1p2>;
> > > +             vddrfa2-supply = <&vreg_pmu_rfa_1p7>;
> > > +             vddpcie0-supply = <&vreg_pmu_pcie_0p9>;
> > > +             vddpcie1-supply = <&vreg_pmu_pcie_1p8>;
> > > +     };
> > > +};
> >
> > Regards,
> > Bjorn

