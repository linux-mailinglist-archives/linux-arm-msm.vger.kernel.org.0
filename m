Return-Path: <linux-arm-msm+bounces-88788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 551B7D194EB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 15:10:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 56C0E3007ECB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 14:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEE0B3921C7;
	Tue, 13 Jan 2026 14:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B9pxqFoa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD2F38E11F
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 14:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768313223; cv=none; b=B10Sbtffpm5GnZ1qfV032hKZ3eCXPp2KElF3b3qYv0fmr//MZPVY/j1NHERME7jylW/i+sLbK6z2o2h0LT8TRfCsmO80npXPip6o/oW+7ss4LK4XHN0Bx4okShoJR1m5EHE+J5j+qwAlqtKwhxFtCwwNHlwYaw+Z0Tq/GVIeauI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768313223; c=relaxed/simple;
	bh=bZWhID1hFc+yqAfF+7TERRJ/swRqYMjctDxKDsmKcGI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mVARRROH5enZUA1GveFvJXaXH5lYjRIgItaE/E8wLXK2J1I8+PT+Ky9UllFRcAL8svBNuVeiv3faBcNpJuFNSprqFl20aG9IpEu1Npn2dx4oh1sPIwrb5W9hXcSibvNa4Mp3MoaioBE0Z0TZujsz2QbgHFYHCosIBmeF+Xxpgnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B9pxqFoa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 568DBC16AAE
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 14:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768313223;
	bh=bZWhID1hFc+yqAfF+7TERRJ/swRqYMjctDxKDsmKcGI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=B9pxqFoatcidmU3JNOAlTkKN8cV0ebGhnD/riSd5e5wt+v7z0AViowfRd9lsNpScR
	 PlY6sfTGQtsBqlwBHegX70/PJiPZxYt19Wy+Rmmgo+sKZmP7MsREqlJU1IIQdE+UNL
	 E1+RaDwUPXuwhLXM12c9Hq5azi8SphD7KXsgyiALp4ytNMhM3eE+YCw2LWN0WBJ4rm
	 zIjE3bo8FgyHF2NG37LDyZ9TxqKUSvaOy3XHyE5Yfw7MDHcUjVTpcRcT3hpAK9o3O4
	 p0ygri8/q/YBn0/rxGhDsqGHFTXytn8M6e+agUOaoYfLsvR5kq3JKipJqlJR1khVKg
	 IcLi9JuZtFDRg==
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-64c893f3a94so10582321a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 06:07:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUG7OCi6QEgXX2i4p7oL8AOb88UmpHTBkZOCGVkwvISBoiV8B3xmF8czD2IrBl4659JNFIQrSD4ZGfzOcPU@vger.kernel.org
X-Gm-Message-State: AOJu0YzGSkCrI0a0FtPHqJiARjAjna8i18fTjDbeO/xaEi8KflzIky17
	Rw7TKoxLk5TsrfwOXL3j8ITiY4fR+MZMlYKiLwNdUT2/ECV+xzLgetoK38Iv0Lg35ag2VsRNRMc
	hXiesI2Q0TC/YC7dYesqpnYHvxJJBLA==
X-Received: by 2002:a05:6402:326:b0:641:88ff:10ad with SMTP id
 4fb4d7f45d1cf-652e58769e9mr1919789a12.14.1768313221923; Tue, 13 Jan 2026
 06:07:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260112151725.2308971-1-mukesh.ojha@oss.qualcomm.com>
 <433fc01b-0e59-49bf-afdc-a23e815cc563@oss.qualcomm.com> <cca646c3-5e74-47cf-9dfa-49a888db0414@oss.qualcomm.com>
 <20260113130428.n2kuo2d2tkoosws2@hu-mojha-hyd.qualcomm.com>
In-Reply-To: <20260113130428.n2kuo2d2tkoosws2@hu-mojha-hyd.qualcomm.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 13 Jan 2026 08:06:50 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK+Z5M0B7MwNiPgFXLhh66-rETqTc3rZSARtu+Xik_Jsg@mail.gmail.com>
X-Gm-Features: AZwV_Qi88_hesI4wMQmApR3KR0IIPmwab42JWbABtJbyjV9PH2HrL6O7YBsQ4tI
Message-ID: <CAL_JsqK+Z5M0B7MwNiPgFXLhh66-rETqTc3rZSARtu+Xik_Jsg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: Enable download mode register write
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org, 
	konradybcio@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 13, 2026 at 7:04=E2=80=AFAM Mukesh Ojha
<mukesh.ojha@oss.qualcomm.com> wrote:
>
> On Tue, Jan 13, 2026 at 10:20:58AM +0100, Konrad Dybcio wrote:
> > On 1/13/26 10:16 AM, Konrad Dybcio wrote:
> > > On 1/12/26 4:17 PM, Mukesh Ojha wrote:
> > >> Enable download mode setting for sm8750 which can help collect
> > >> ramdump for this SoC.
> > >>
> > >> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > >> ---
> > >
> > > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >
> > Actually no, we have a mess to undo..
> >
> > There's already this node:
> >
> > tcsrcc: clock-controller@f204008 {
> >         compatible =3D "qcom,sm8750-tcsr", "syscon";
> >         reg =3D <0x0 0x0f204008 0x0 0x3004>;
> >
> >         clocks =3D <&rpmhcc RPMH_CXO_CLK>;
> >
> >         #clock-cells =3D <1>;
> >         #reset-cells =3D <1>;
> > };
> >
> > That's located at the rear end of TLMM (someone had a funny idea to
> > move registers around when designing this specific SoC)
> >
> > Problem is, those registers aren't actually "TCSRCC", not even "TCSR"
> > Physically, they belong to the TLMM register window (which starts at
> > the base it promises under the TLMM node today and is 0xf0_0000-long.
> >
> > What we should have done for a fairer representation is make TLMM a
> > clock provider on this specific platform
> >
> > qcom,sm8750-tcsr binds the tcsrcc driver, so we can't describe the
> > actual TCSR (as in this patch).. we'll have to break something..
> >
>
> +               syscon: syscon@1fc0000 {
> +                       compatible =3D "syscon";
> +                       reg =3D <0 0x01fc0000 0 0x30000>;
> +               };
>
>
> What about above ?

What does validation say?

Rob

