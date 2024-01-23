Return-Path: <linux-arm-msm+bounces-7915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7BB838A57
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 10:29:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D28C428643C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 09:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACDB159B55;
	Tue, 23 Jan 2024 09:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="M3CUlTi3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9055A0E6
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 09:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706002138; cv=none; b=kCS00V8niwKSpPEXW28e5qBqUufELI+VUcQrcnL6RKCpTRBKOg/rua6nVvUAv5BOMWDskYEHs2T9WOtt82MYn2pQCFiUWFgauUwrPtZexzoIuHJ0l2iP8hwn02JP/z3O2ZZ+GjgPhdcT9vCrSR7+zFnjoQzp9Hf9A+X5mM2MNkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706002138; c=relaxed/simple;
	bh=6lLhD6Ou8v8X9OhipbrM+HkIk2vyyy6/FHAjHd/tYgk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o/pysMCLhUBwjpULeDLwEUXh/t4o0EMD8Q3Fr+7Ya+OhNc6MdVoDN9p+Rx2PDdaBs6wm2BIROcfsLVofg4UJVE05qK7fvJr5tmDywKQwlhmMyGaWYF2Y7be5eCNe2o5UaVAQHkQ0yq8McpEXUMfQq+vrJ+lHQEtUrlPGwfFwzYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=M3CUlTi3; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-7d130979108so1173723241.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 01:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1706002135; x=1706606935; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oWoXPJ4PQlvmmz3cFANOqRDdLm6hLsEi8tDxwbdYEkg=;
        b=M3CUlTi3AZl5tQIMbxqVFLy3Tgi5EF8ZE8bP+Wg2bBgov+Klpb/Im0G7QnsoSgDXIy
         62O+joq7fg7KXfVcuUKVIVzBNfukZSo8R+a/Wy6ZoqhnGAMZv7ZyIjr4OQzUoDfujTyN
         kvLiZ7SYBUBtqFzYFKCAZd5GjIaP/g04n6TGnH6OhIBHChKWKa3+FlCEjhDC+gPTy3E3
         zSOpIO+/K33mcpDoWuRZlk/XbBWM3WOO3sG+zGHkY5ixF7n6mVyYfbbVf//AVBReMPPb
         qKIle9tN3VrMei/MZQ7NQoqLmkZhpvWYodG3yUkEUXvZHW5QKjKoUF2SBP1gyLPXEEg4
         n13g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706002135; x=1706606935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oWoXPJ4PQlvmmz3cFANOqRDdLm6hLsEi8tDxwbdYEkg=;
        b=TzSraGnhEEC8C2rYqGtq8IlaU9xHT5oD9R9nJSL/yQRq21Fidv07S9C33ytnIeTqla
         kupvCuG6sEMdby3vn/C+lpBPRtEOBARpOo9/uGGIUKh+n0L5w/nCsB77gB/EI/OAgevZ
         UXqVK3YP3OPXrGGkd7mH+JwhxNSzdUo9be9NBl0sKTZ5DgKwKj6/hwq9oYtaTrCIF94s
         YiKiNlX9HBcRzIy3ERGv0TjWYvk2gK2Thvm6Uzzl9xcF9AuqPV66qvwts5vKhCp8LUAI
         6/NUhL9v9EeTZMYCeGcr5XteF1He4tQSDh0fHX1hJI1caui3cTnQNXXEUkMV/Du9VQqw
         gCLw==
X-Gm-Message-State: AOJu0YxViy36AjiaMH92Oud4I8X5uDSyTY3Ar0J5lOvq+DX89jQUE9Bj
	g6+IPBfPeCcVzXOMKm2hCVhde7rKWSUW/nnOUy1gQSDlb28oWjwBzACibGvsMFNVcSPDPE/5BKK
	V8Skkw6b2CxTxclQUjRNPrpr8PV7KdkfLcYfBPw==
X-Google-Smtp-Source: AGHT+IE6tOoVX4H2ydA2JWMrPnKov2bAQLC/xKMHC/aZHlJrBhefIWfkyZptba0P66ZjnByBY2KBgljIzXEACl3D9Og=
X-Received: by 2002:a05:6122:12f9:b0:4b6:e39a:527f with SMTP id
 k25-20020a05612212f900b004b6e39a527fmr2040825vkp.29.1706002135051; Tue, 23
 Jan 2024 01:28:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240122182158.69183-1-brgl@bgdev.pl> <CAA8EJprWddrEH+Wmh4SExPygSVz6+WpSX-MDQ+hev1gov74rng@mail.gmail.com>
In-Reply-To: <CAA8EJprWddrEH+Wmh4SExPygSVz6+WpSX-MDQ+hev1gov74rng@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 23 Jan 2024 10:28:44 +0100
Message-ID: <CAMRc=MfsDTfhg2BO6DFWVRwUY8OYayW9XneHCvpqVYezRQ3Mjg@mail.gmail.com>
Subject: Re: [RFC] arm64: dts: qcom: qrb5165-rb5: model the PMU of the QCA6391
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Alex Elder <elder@linaro.org>, 
	Srini Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 23, 2024 at 6:54=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Mon, 22 Jan 2024 at 20:22, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > I'm limiting the audience of this compared to the PCI power sequencing
> > series as I wanted to run the DT part by the maintainers before I commi=
t
> > to a doomed effort.
> >
> > Here is the DT representation of the QCA6390's PMU with its inputs and
> > outputs. If I were to implement the pwrseq framework that would be able
> > to assign the relevant pwrseq data to the consumer based on the actual
> > regulators and not abstract bt-pwrseq or wlan-pwrseq properties - would
> > that fly with you?
> >
> > We'd need to deprecate the existing BT bindings but unfortunately they
> > are already described as consuming the host PMIC regulators in bindings=
.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> My main concern is whether this is going to pass the regulator
> subsystem locking. Basically you have a driver for regulators, which
> will itself call into the regulator subsytem. It might be reentrant.
> Or it might not.
>

This is irrelevant for the HW representation though - which is what
I'm trying to figure out first.

As I said under the previous discussion: I don't plan to use the
regulator framework here. Instead, the regulator phandles will be used
by the new pwrseq subsystem to retrieve the handle to the correct
pwrseq context structure.

But even so: I doubt this is the first time something like this is
used: PMICs take supplies all the time and expose their own
regulators. I wouldn't stress about it.

[snip]

> > +
> >         thermal-zones {
> >                 conn-thermal {
> >                         polling-delay-passive =3D <0>;
> > @@ -734,6 +816,24 @@ &pcie0_phy {
> >         vdda-pll-supply =3D <&vreg_l9a_1p2>;
> >  };
> >
> > +&pcieport0 {
> > +       wifi@0 {
> > +               compatible =3D "pci17cb,1101";
> > +               reg =3D <0x10000 0x0 0x0 0x0 0x0>;
> > +
> > +               vddrfacmn-supply =3D <&vreg_pmu_rfa_cmn>;
> > +               vddaon-supply =3D <&vreg_pmu_aon_0p59>;
> > +               vddwlcx-supply =3D <&vreg_pmu_wlcx_0p8>;
> > +               vddwlmx-supply =3D <&vreg_pmu_wlmx_0p85>;
> > +               vddbtcmx-supply =3D <&vreg_pmu_btcmx_0p85>;
> > +               vddrfa0-supply =3D <&vreg_pmu_rfa_0p8>;
> > +               vddrfa1-supply =3D <&vreg_pmu_rfa_1p2>;
> > +               vddrfa2-supply =3D <&vreg_pmu_rfa_1p7>;
> > +               vddpcie0-supply =3D <&vreg_pmu_pcie_0p9>;
> > +               vddpcie1-supply =3D <&vreg_pmu_pcie_1p8>;
>
> This really feels like an overkill, All those voltages are handled by
> the PMU itself, rather than being requested by the WiFi or BT drivers.
>

What alternative do you propose?

Bart

> > +       };
> > +};
> > +
> >  &pcie1 {
> >         status =3D "okay";
> >  };
>
> --
> With best wishes
> Dmitry

