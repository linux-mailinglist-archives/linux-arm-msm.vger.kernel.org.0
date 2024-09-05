Return-Path: <linux-arm-msm+bounces-30911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA7896D974
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 14:56:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 728BB1C228FB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 12:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E36D019B3FF;
	Thu,  5 Sep 2024 12:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mvWxL7bf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F0C19B3F9;
	Thu,  5 Sep 2024 12:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725540990; cv=none; b=aPIiRCetJoJ+uYLGmlCoAxMpsq3FWI9YuHycmQYNzF7dNO6Gy/VSfs5u2kPODa/SB2dOpdZhygoEhRVnjFHejTHDOPuoSMmDW2umUOWOXkYLNRUOSJUWvtYbo/o0HwdYOE1zowGDArgygt6WeJYOHcmt3UIB9dx2K1hc0k9r1Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725540990; c=relaxed/simple;
	bh=2B7W/vJwjmAA6E2m8YddgGMotUXAafmzNSXBcbWeT+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jcStjuOOG8v5z+Yh5lwFXF01IujNGS472J0e051MCpH+qKRFQnLMpi0F7P3ZwFSqhvZzANWVpOzbp00MMfChWUCnno0qcskMwvFOesJdojAsi/WTbTKyA3WTY1g+J/bs01JjE0J+cuBDiy486duGGvEyvzZk/P9HddmldE6y+3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mvWxL7bf; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5c245c62362so1000422a12.0;
        Thu, 05 Sep 2024 05:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725540987; x=1726145787; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WEEQTkpkoiKwhEO3IWsgIyRLzd4RR8yXzV/kx3uo+/4=;
        b=mvWxL7bfY9eMCg79QMnUvSSCKlTMkxATnmv9nozGpikQWbZVJhwRYWZq7OcttWkxkx
         kjvsBhRFRtpUpw3rS7U/m1cnk/w+/1vAAz563c8pEqc9emroRVf7oINxZ4tOf2ZPzVUW
         NCyqGwoSZVQKCEjUYn2O3G7JlK8CUNQ1kedBOfgodE4rEg1kdMVAIYIbPjg3XmERkuYN
         mOZiQ4rlo2AbkoKM0x/cYPRBao/AaKN4Luk+/WxsiHMkk4mYIAqELc6kVSgF3ifEgM54
         PHoC0LB0qrt0pOQ3Cx4o+54qjpl54fXMV9e6pgPhlgnIXyjLjiwvhXcUq/noUHfdwSEq
         SoBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725540987; x=1726145787;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WEEQTkpkoiKwhEO3IWsgIyRLzd4RR8yXzV/kx3uo+/4=;
        b=muuS8b+cXA3ZlPz/mEEkEbZDlmCtin7PyOn2N+KFwlGVnwqz3wDC/A4AiIkMISR9Ar
         CwHWM1tPOF8GcH+rkNCFO2CbbHljxP4bhmrlZJQ7XNhlyQ4nHXA/JcR3kSyF5VXSMwVL
         EdsZqfreZ2Q6yaBlWhiG9FCmAHal6pljw1Ql/sRZsaTJaAtWu+OJ9dIV37h8EkWp1xQd
         JXlEo7k8+UWKrLvR6Bu9XHzlHsKuhztXLFzHmIsoimnZuyfbIsiHNruY2rs9vZ4Xzb/P
         6e2jvEDeSjuVJvdWusmWNtJ/sY+QczVvRXhNk96rWN+2TKrItJcgwqmJy1lOt3YGgIEz
         W/Cw==
X-Forwarded-Encrypted: i=1; AJvYcCV8xwth5rDrD/eVqGm55k7ZRP2YNJxoPDSQ/NAuN9w5Ar+6X9GpIM5iFChctc4IQrO73mEBn7Qwk6ixbOoo@vger.kernel.org, AJvYcCWkzAfn5ghz5I7A4Tb10a5QPbwxdHMYgGpcxDR/IyZwSLSiKnXay1cDfkHvNDBvNF31V4zHmVpeyc1F@vger.kernel.org, AJvYcCXAX/pgOXxz1Uk8bvZSQal0OJVv64iPc23ryydjIxKkMn0WpX7m6hthIl0Ll23n9fJl11lV8fUZNol7a/uBYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwaLngwlywIFfPDrtJXNohRuAyG5ceWsAjNMrcRvOShFyK8gXsE
	9NMseGOcQakB9fPnZAvQ/XDUE78ShRiyBnFO/p6LqpfiJeS9LTpgDcS8359sbYfHtyLJbJtGcdn
	X47eRj3QwvbzQTqEaJmRkJEjGRsQ=
X-Google-Smtp-Source: AGHT+IF+R0hpquFWFa3ySZj7Hw6ErCUc6Ze5564kopSBw7fF6uBXHcM0whC/yEucdamRF2kP0MYc7ucdDjF2pTLbzuM=
X-Received: by 2002:a05:6402:354e:b0:5c2:43a0:47e3 with SMTP id
 4fb4d7f45d1cf-5c27584b805mr4833554a12.36.1725540987284; Thu, 05 Sep 2024
 05:56:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240905122023.47251-1-brgl@bgdev.pl> <20240905122023.47251-2-brgl@bgdev.pl>
 <6vikrqhdnkefzpahhhtz2hpi62jvcwnzclm7touwtnpxdzvgrf@uc7r6a7bbjek> <CAMRc=MeijX2by+MS_vq_OVx25JO6z=zNfymta35h11mbm=vmtQ@mail.gmail.com>
In-Reply-To: <CAMRc=MeijX2by+MS_vq_OVx25JO6z=zNfymta35h11mbm=vmtQ@mail.gmail.com>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Thu, 5 Sep 2024 15:56:15 +0300
Message-ID: <CALT56yOP+un5nkxuirJVg=gr7fo4Hqjt1ew3z-=F2J_Y_RcTqg@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] arm64: dts: qcom: sc8280xp-crd: model the PMU of
 the on-board wcn6855
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 5 Sept 2024 at 15:53, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> On Thu, Sep 5, 2024 at 2:50=E2=80=AFPM Dmitry Baryshkov <dbaryshkov@gmail=
.com> wrote:
> >
> > On Thu, Sep 05, 2024 at 02:20:19PM GMT, Bartosz Golaszewski wrote:
> > > From: Konrad Dybcio <konradybcio@kernel.org>
> > >
> > > Add nodes for the WCN6855 PMU, the WLAN module and relevant regulator=
s
> > > and pin functions to fully describe how the wifi is actually wired on
> > > this platform.
> > >
> > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > Signed-off-by: Konrad Dybcio <konradybcio@kernel.org>
> > > [Bartosz:
> > >   - write the commit message,
> > >   - rebase Konrad's commit,
> > >   - fix one of the supplies' name]
> > > Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > ---
> > >  arch/arm64/boot/dts/qcom/sc8280xp-crd.dts | 108 ++++++++++++++++++++=
++
> > >  1 file changed, 108 insertions(+)
> > >
> > > @@ -583,6 +668,23 @@ &pcie4_phy {
> > >       status =3D "okay";
> > >  };
> > >
> > > +&pcie4_port0 {
> > > +     wifi@0 {
> > > +             compatible =3D "pci17cb,1103";
> > > +             reg =3D <0x10000 0x0 0x0 0x0 0x0>;
> > > +
> > > +             vddrfacmn-supply =3D <&vreg_pmu_rfa_cmn_0p8>;
> > > +             vddaon-supply =3D <&vreg_pmu_aon_0p8>;
> > > +             vddwlcx-supply =3D <&vreg_pmu_wlcx_0p8>;
> > > +             vddwlmx-supply =3D <&vreg_pmu_wlmx_0p8>;
> > > +             vddpcie1p8-supply =3D <&vreg_pmu_pcie_1p8>;
> > > +             vddpcie0p9-supply =3D <&vreg_pmu_pcie_0p9>;
> > > +             vddrfa0p8-supply =3D <&vreg_pmu_rfa_0p8>;
> > > +             vddrfa1p2-supply =3D <&vreg_pmu_rfa_1p2>;
> > > +             vddrfa1p8-supply =3D <&vreg_pmu_rfa_1p7>;
> >
> > As you are going to post another revision, please also add
> >
> > qcom,ath11k-calibration-variant
> >
>
> I had it in earlier revisions. The only one we could add here would be
> the one from X13s as QCom has not yet released the data for the CRD.
> Johan and Konrad were against adding this here if it doesn't refer to
> the correct one so I dropped it.

As Kalle usually merges data with some delay it's not infrequent to
have DTS which names calibration variant, but board-2.bin doesn't have
corresponding data. The driver safely falls back to the data without
variant if it can find it. Als  usually it's us who supply the
calibration name.

>
> Bart
>
> > > +     };
> > > +};
> > > +
> > >  &pmc8280c_lpg {
> > >       status =3D "okay";
> > >  };
> >
> > --
> > With best wishes
> > Dmitry



--=20
With best wishes
Dmitry

