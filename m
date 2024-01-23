Return-Path: <linux-arm-msm+bounces-7913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4A4838A35
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 10:22:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CDE1628C68C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 09:22:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD26558AC3;
	Tue, 23 Jan 2024 09:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="SWaFVlAK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF1158AC1
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 09:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706001768; cv=none; b=GojV0EfgfaXMbZ5qdeBaM0Zq3ifbmwOotOmGGZdhPZkZb7nL4Og9JH1wbJdQBAhsJxgMn1LXkkQjJM4vCn8k/xpKgapieHTS1K9NFBCw8oY2pLmbyLH3v8d/no4dcfdh4C2tAHHULLjGdsIYwp2EEAJs1MIyX8qzZcQ4Kz6BRV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706001768; c=relaxed/simple;
	bh=8jbtBhdfwY2HaAK86BnspHe4KQ3VdkvgbrKLu80dO1E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gyyok0TP7SBVKgv5jh3ROdytPfXrbcLXz9W1aCYw7tgN498vSq87r8vZ0DC+wnBp6mFUYSryAfqqGZBruCPYv8a8r0Nva1sY9dV6yw3XMqQxlyJEQ9tjjTMiCyPfAUYnHhoC3rhmbcWwnt7RJiLKGJYzM6qkLSX+KjKk/F8+s3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=SWaFVlAK; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-7d2df9d1976so767407241.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 01:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1706001764; x=1706606564; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pkF8qLyEocxGNqbKOMqPINvl+aLdf+SG9QqiKG0wBZQ=;
        b=SWaFVlAK4CMxkxHRRmKzMmNT/fpxM0mFhRU7VFkuRaUsfIgWWjkAnxLXeOcObHcamz
         QkljIXHyZfIinED8wgOIwxtvrE3Vlczu01F398caTunpgrj3ln20Aw9UOnl96biz7+SB
         FWQvidAX5b+nPp/Yx9eQ7N0lyLM0lMM/sPCji//qeGdgEUv5nTUnHk1dbFCU9P8M7FYw
         OJlnLtEnR9nuJrWAinYLwCCC0HtSjElBQg+n36vEzDV44j6nQytDSST8H0gG2EiUITvN
         IKY36fpf3lrNmoHOTOiWfaajkJt4WynlDVMLwEflH2VtQ1zUmDCy8R8MMFNWXPfygnff
         6Hfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706001764; x=1706606564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pkF8qLyEocxGNqbKOMqPINvl+aLdf+SG9QqiKG0wBZQ=;
        b=MfctwpIO4F8m0jK7G62XhMSlseGLw/jXIdc/dbLSfZs2mLTT3GyVAekbiZIKsx5NDM
         IoR4ABhmlUXiDPwr4t21MmjdpUxURgGif5F0A1gcdNlm5zqucLoe3WwzUOAWtsqx9HdQ
         Zwrpby26vXbuHKmvUxEHpdXC3sQg6W7hGrs44R5tMLUCUeGv4pHr5CxDlPpZOrV0ciUF
         sevM/Au01hGngiX5D36odmO8AU0PYo/TnfHujp54TY1KD5oeJSASUE/MXePxKGLupChc
         t/wvfZponYSFzwf5IQNXeZuyMLVmX2er55IC+0d81JBBOwzTQSpQF75b/O+vb839zvfe
         pFnQ==
X-Gm-Message-State: AOJu0Yz2f5r+pYkf/ASgN+fjMJtcsq+eGl8+Dh/UjBQu62vfalC7NnY7
	f/EA+JBU0RNnMfD7jFERZgDfx08TzF/p8mmwCQ13/TN5QKEx6pfnG+k8pkKMyoaX5/V0t1BtaEN
	51WV7FZVeG3n/3TbhiVzpDcWYSV+7PNJ4YB6mIg==
X-Google-Smtp-Source: AGHT+IEyoizQPsEk7HYFOE75qPaz6YtEck1nKsfTe8+uH9u+ptZ3S6zUROga7YyLgJhQrA7HLYARcx1du+Fbb/1mhuQ=
X-Received: by 2002:a05:6102:3bd9:b0:467:a48d:cf92 with SMTP id
 a25-20020a0561023bd900b00467a48dcf92mr2115707vsv.32.1706001764413; Tue, 23
 Jan 2024 01:22:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240122182158.69183-1-brgl@bgdev.pl> <u5kvv3iip552yb5ykc4t2arfry2t7f34hwmemd7z6qfw677fs6@ldlwoycyacrm>
In-Reply-To: <u5kvv3iip552yb5ykc4t2arfry2t7f34hwmemd7z6qfw677fs6@ldlwoycyacrm>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 23 Jan 2024 10:22:33 +0100
Message-ID: <CAMRc=MeT08vUUqJmtVCP=kSUrbsoKFHP6gHgJPtqztC593oGpQ@mail.gmail.com>
Subject: Re: [RFC] arm64: dts: qcom: qrb5165-rb5: model the PMU of the QCA6391
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Abel Vesa <abel.vesa@linaro.org>, 
	Alex Elder <elder@linaro.org>, Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 23, 2024 at 5:47=E2=80=AFAM Bjorn Andersson <andersson@kernel.o=
rg> wrote:
>
> On Mon, Jan 22, 2024 at 07:21:58PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > I'm limiting the audience of this compared to the PCI power sequencing
> > series as I wanted to run the DT part by the maintainers before I commi=
t
> > to a doomed effort.
> >
>
> With linux-arm-msm and deviectree in there, you have a fairly big
> limited audience... I think if anything, your proposal is doomed by the
> lack of a proper commit message describing what this is.
>

By limiting I meant compared to the PCI power sequencing series but
you're right, I should have linked that series in here. In any case -
this is not intended for upstream, I literally wanted input on whether
this representation is correct before I send a PoC of the pwrseq
subsystem using it.

> Below you'll find some questions/feedback based on our previous
> discussions on the topic, although I'm not able to understand the
> motivations behind what you propose - or even fully what it is that
> you're proposing.
>
> > Here is the DT representation of the QCA6390's PMU with its inputs and
> > outputs. If I were to implement the pwrseq framework that would be able
> > to assign the relevant pwrseq data to the consumer based on the actual
> > regulators and not abstract bt-pwrseq or wlan-pwrseq properties - would
> > that fly with you?
> >
>
> Why do you need to make up this intermediate/fake "PMU" thing? The
> regulators are reference counted already.
>

Dmitry insists that for QCA6490 we *do* need to implement a proper
power sequencing with delays between enabling WLAN and BT GPIOs.

See: https://lore.kernel.org/netdev/CAA8EJpqyK=3DpkjEofWV595tp29vjkCeWKYr-K=
OJh_hBiBbkVBew@mail.gmail.com/

Even though the regulators are reference counted, this is not enough.
Dmitry tried to implement a power sequencing framework some time ago
but the main complaint was that explicit properties like bt-pwrseq are
not a right fit for DT as they don't represent hardware. We still need
to centralize the control over the shared resources though but what I
want to propose is doing that with a more realistic representation of
HW and just reusing phandle connections between DT nodes to retrieve
the correct pwrseq struct in the driver. But this is implementation
detail and before I want to clear the HW representation with DT
maintainers.

Dmitry is also correct in pointing out that It's also simply an
incorrect representation of what is on the board as the PMU is a
discrete module, has its inputs and outputs, even though they're
inside the package.

> > We'd need to deprecate the existing BT bindings but unfortunately they
> > are already described as consuming the host PMIC regulators in bindings=
.
> >
>
> I was under the impression that the supplies in the bluetooth binding
> are the supply pads of the chip. Where the power to those pads come from
> is not a property of the binding.
>

We already model the WLAN and BT modules as separate elements even
though they're in the same package. For consistency we should model
the PMU module too.

And for the record: I would love to stick to what we have now as it
would make my PCI power sequencing series much easier to get upstream
but it will result in problems later on, I have to give it to Dmitry.

> So what you need to do is describe why the pads suddenly changed.
>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 129 +++++++++++++++++++++--
> >  arch/arm64/boot/dts/qcom/sm8250.dtsi     |  10 ++
> >  2 files changed, 128 insertions(+), 11 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot=
/dts/qcom/qrb5165-rb5.dts
> > index cd0db4f31d4a..c9b1600c57ef 100644
> > --- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> > +++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> > @@ -108,6 +108,88 @@ lt9611_3v3: lt9611-3v3 {
> >               regulator-always-on;
> >       };
> >
> > +     qca6390_pmu: pmu@0 {
>
> This is not a thing.
>

What isn't?

> > +             compatible =3D "qcom,qca6390-pmu";
> > +
> > +             pinctrl-names =3D "default";
> > +             pinctrl-0 =3D <&bt_en_state>, <&wlan_en_state>;
> > +
> > +             vddaon-supply =3D <&vreg_s6a_0p95>;
> > +             vddpmu-supply =3D <&vreg_s2f_0p95>;
> > +             vddrfa1-supply =3D <&vreg_s2f_0p95>;
> > +             vddrfa2-supply =3D <&vreg_s8c_1p3>;
> > +             vddrfa3-supply =3D <&vreg_s5a_1p9>;
> > +             vddpcie1-supply =3D <&vreg_s8c_1p3>;
> > +             vddpcie2-supply =3D <&vreg_s5a_1p9>;
> > +             vddio-supply =3D <&vreg_s4a_1p8>;
> > +
> > +             bt-enable-gpios =3D <&tlmm 21 GPIO_ACTIVE_HIGH>;
> > +             wifi-enable-gpios =3D <&tlmm 20 GPIO_ACTIVE_HIGH>;
> > +             swctrl-gpios =3D <&tlmm 124 GPIO_ACTIVE_HIGH>;
>
> Are these collected here because we still have convinced ourselves that
> they need to be handled from a common place, or did you actually find
> some documentation you can point to that shows this is necessary?
>

So the datasheet is not clear on that but it says: "bluetooth enable
signal from host" and since the regulators above are also "from host"
I figured the best fit is here.

> > +
> > +             regulators {
> > +                     vreg_pmu_rfa_cmn: ldo0 {
> > +                             regulator-name =3D "vreg_pmu_rfa_cmn";
> > +                             regulator-min-microvolt =3D <760000>;
> > +                             regulator-max-microvolt =3D <840000>;
>
> These limits should be applied to &vreg_s2f_0p95 (although I'm just
> guessing how this maps to the upstream supply...

I'm not following. Why?

>
> > +                     };
> [..]
> > @@ -734,6 +816,24 @@ &pcie0_phy {
> >       vdda-pll-supply =3D <&vreg_l9a_1p2>;
> >  };
> >
> > +&pcieport0 {
> > +     wifi@0 {
> > +             compatible =3D "pci17cb,1101";
>
> Does this compatible somehow bind to a entity that knows what to do with
> the regulators below?
>

Ok, so what does that matter? This is device-tree. What linux does
behind the scenes is irrelevant - what is important is that there is
an ATH11K module here as represented by this PCI vendor/model codes
and that it's supplied by these regulators.

Bart

> > +             reg =3D <0x10000 0x0 0x0 0x0 0x0>;
> > +
> > +             vddrfacmn-supply =3D <&vreg_pmu_rfa_cmn>;
> > +             vddaon-supply =3D <&vreg_pmu_aon_0p59>;
> > +             vddwlcx-supply =3D <&vreg_pmu_wlcx_0p8>;
> > +             vddwlmx-supply =3D <&vreg_pmu_wlmx_0p85>;
> > +             vddbtcmx-supply =3D <&vreg_pmu_btcmx_0p85>;
> > +             vddrfa0-supply =3D <&vreg_pmu_rfa_0p8>;
> > +             vddrfa1-supply =3D <&vreg_pmu_rfa_1p2>;
> > +             vddrfa2-supply =3D <&vreg_pmu_rfa_1p7>;
> > +             vddpcie0-supply =3D <&vreg_pmu_pcie_0p9>;
> > +             vddpcie1-supply =3D <&vreg_pmu_pcie_1p8>;
> > +     };
> > +};
>
> Regards,
> Bjorn

