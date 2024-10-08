Return-Path: <linux-arm-msm+bounces-33521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F8C9945C1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 12:47:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B1CC1B27A9C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 10:47:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F0AA18CBE1;
	Tue,  8 Oct 2024 10:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DqiSeIi5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA411C75F8
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Oct 2024 10:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728384424; cv=none; b=hmY39W7FNc/eYwIP6ZEteUXQuz/75TjsFzFEhnEyINY9klFbsP2AP30LNFD0tZ8aTTjHk9lze7rQsn+vzTwYWl9VhvyT23GxigfHHbA0WzYJCux0bfo7Hjd7Ac0C6EdS3yW0en9IA3dA+XpNO+21MovkTgNgJiyomdrblTsNGsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728384424; c=relaxed/simple;
	bh=BTK1twW5R9PAw75WIcXBsshF/UQ2BRp7G3EWibEwO6E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DohSL7hdE9JuihqdHThtJoeU++bw/1CbJYVgB9QQ3Bn3+zGRWM+jec68nj8BRKzDVXkIw7sHv4e6O0Oxrnnl+mUPQji1YmXEgBH7PDAgnCCxaAQ3IPRtgNPvrSrRQtjIBNv8Jqldk126kIDwVFePt4HW/YnYX6hAN8GEgKSXqD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DqiSeIi5; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6e2e508bd28so19886167b3.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Oct 2024 03:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728384422; x=1728989222; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TD+ghPU2ZLooa9x0HWTILmd0XsXwmDoPDULmRLdUyoc=;
        b=DqiSeIi5Qkc7IQ0IH8U4uyl5Bcry9anKZmcRthCIYHp4n8uWVW8qrR3XGnrTW+Ktwu
         uyNhWunn4TEwu9Mo6ybFqQCX5x04fv8ZozckFrAT1X9YhBGbdHxv/FYyYDInEzZ/5gF4
         w5mQH+nZ+ggPexLKlO3gcQ0+Kd7ZJ4wL5KeDvhaP10VDF1FKQ3sJq0/kREQatlrZXpk0
         2dYdWKKgnPrjJK0DTJ54dJw9RQvx3693gtZGYyhBs+m9GfCuL5LGmLQJ8YkEVm6SaCHp
         xvu1Atp8IHgU/BiYKFh1MVj0ioLsPqB9rXtq64sQ5BlsR3LTAcoJqLgHVHF931V6HvgF
         64fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728384422; x=1728989222;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TD+ghPU2ZLooa9x0HWTILmd0XsXwmDoPDULmRLdUyoc=;
        b=bIZJdr+ceBGI/P4kumICoFx4q9kWXPZqwEPypJrnJupAbz/9b+lYPO8XtOgzvBGA9o
         YPCWT+szpILiRbXmpwOwkRgd4HpeWsOLs5CJhgYSNAAjDfLtuc68GfKLIbtWTgPMZUvi
         jSED4s59tSg9wll1FTenoJIHqRTd3RwnTMKcdj4s6wD9oQQiTVaKTvwMVN21AApNRqD/
         FHPnKlFU6KMfpHpLj3OEUsv8zEmM7oIx6soqxt51sLkBQBVKHDzMbOb+JeoYoSFQyOlt
         xlHPwJASkf7IfmbRY7fQMa0S9E40zFXjLopmzgJdiV22wptY0eyh5VfADRuUVpIR8j0y
         jPDA==
X-Forwarded-Encrypted: i=1; AJvYcCW/i2oWn1qyW6vk3RxhwaVaRFfSTzACyzaAFTuZLp/e7rGAMbAIwiSPfxELg8TW/KuOjNnW7gFKNNKG0nM9@vger.kernel.org
X-Gm-Message-State: AOJu0YyH87B98YCZzHOrkaGRg8r+xrG447QvVngE8570G/4ixNuhiqNK
	jGvDhQRnc/4KBWHpzvdREZPqFwfvgiXP2ohW8NTiknzPnao18YNRNc7tld47z2Z2AkGtQxQL2Fy
	imQycFZiRYG8VfSQ/iyKOR3TfGqCUKKEAJ0++qg==
X-Google-Smtp-Source: AGHT+IECP10UjEJdYbc48ykgN+rdUK38iSJ8CKS1U/S3BZgrH0DuUNb4uJosYAr3Ei6C8lCvYX9wCfuCS4n0ARKeuYQ=
X-Received: by 2002:a05:690c:ec1:b0:686:1240:621a with SMTP id
 00721157ae682-6e2c728a26emr122806547b3.31.1728384421737; Tue, 08 Oct 2024
 03:47:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241004080110.4150476-1-quic_kotarake@quicinc.com>
 <jid5coqe4tpsafbi2haem6ye4vrpwyymkepduxkporfxzdi6cx@bfbodoxoq67l> <b900d558-8ab0-436f-87bd-7a3d83e3dea0@quicinc.com>
In-Reply-To: <b900d558-8ab0-436f-87bd-7a3d83e3dea0@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 8 Oct 2024 13:46:44 +0300
Message-ID: <CAA8EJpr9pOc4i983ZoiwffTVNyJzH=6ka=m-k=BAT92d3K-OXA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: qcm6490: Allow UFS regulators load/mode setting
To: Rakesh Kota <quic_kotarake@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_kamalw@quicinc.com, quic_jprakash@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 8 Oct 2024 at 12:39, Rakesh Kota <quic_kotarake@quicinc.com> wrote:
>
>
>
> On 10/7/2024 1:37 AM, Dmitry Baryshkov wrote:
> > On Fri, Oct 04, 2024 at 01:31:10PM GMT, Rakesh Kota wrote:
> >> The UFS driver expects to be able to set load (and by extension, mode)
> >> on its supply regulators. Add the necessary properties to make that
> >> possible.
> >>
> >> While at it, UFS rails have different voltage requirement for UFS2.x
> >> v/s UFS3.x. Bootloader sets the proper voltage based on UFS type.
> >> There can be case where the voltage set by bootloader is overridden
> >> by HLOS client.
> >>
> >> To prevent above issue, add change to remove voltage voting support
> >> for dedicated UFS rails.
> >
> > add change to remove smth doesn't sound correct to me.
> > Please don't depend on the bootloader and describe hardware > configura=
tion. If there can be two types of IDP boards and you can not
> > identify the voltage via other means, please create something like
> > qcm6490-idp-ufs3.dts. Please add proper Fixes tags.
> > Last, but not least, as Bjorn wrote, please split into two patches.
> >
> sure, i will split the change into two.
>
> Since we can=E2=80=99t differentiate IDP boards based on UFS versions whi=
le
> loading the DT and we have only single board ID for the IDP's, it=E2=80=
=99s not
> possible to create separate UFS-based DT files like qcm6490-idp-ufs3.dts
> and ufs2.dtsi... etc.

It is definitely possible to create a second DT file. And upstream
doesn't have board IDs (not to mention that nothing stops you from
using another board ID for IDP with a different UFS revision. Qualcomm
owns the board ID registry.)

>
> And also UFS driver does not vote for voltage on UFS rails & they just
> vote on load only.
> Hence to support both UFS 2.x and 3.x, we need to remove the voltage
> min/max voting. if add the min and max voltages in DT, then those
> initial voltage set by bootloader is overridden by regulator
> framework with min voltage specified in DT.

Yes, this is correct. Regulator framework should know min and max
voltages. Once the voltage is in the specified range, the UFS driver
doesn't have to cast a particular vote on it.

So, dropping the regulator min/max is still NAKed.

>
> Note: Bootloader have capability to detect the UFS version (where as
> HLOS does not have that capability)
>
> Thank you for quick review!!
> >>
> >> Signed-off-by: Rakesh Kota <quic_kotarake@quicinc.com>
> >> ---
> >>   arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 12 ++++++++----
> >>   1 file changed, 8 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boo=
t/dts/qcom/qcm6490-idp.dts
> >> index 84c45419cb8d..8a4df9c2a946 100644
> >> --- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> >> +++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> >> @@ -258,13 +258,15 @@ vreg_l6b_1p2: ldo6 {
> >>                      regulator-name =3D "vreg_l6b_1p2";
> >>                      regulator-min-microvolt =3D <1140000>;
> >>                      regulator-max-microvolt =3D <1260000>;
> >> +                    regulator-allow-set-load;
> >> +                    regulator-allowed-modes =3D <RPMH_REGULATOR_MODE_=
LPM RPMH_REGULATOR_MODE_HPM>;
> >>                      regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> >>              };
> >>
> >>              vreg_l7b_2p952: ldo7 {
> >>                      regulator-name =3D "vreg_l7b_2p952";
> >> -                    regulator-min-microvolt =3D <2400000>;
> >> -                    regulator-max-microvolt =3D <3544000>;
> >> +                    regulator-allow-set-load;
> >> +                    regulator-allowed-modes =3D <RPMH_REGULATOR_MODE_=
LPM RPMH_REGULATOR_MODE_HPM>;
> >>                      regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> >>              };
> >>
> >> @@ -277,8 +279,8 @@ vreg_l8b_0p904: ldo8 {
> >>
> >>              vreg_l9b_1p2: ldo9 {
> >>                      regulator-name =3D "vreg_l9b_1p2";
> >> -                    regulator-min-microvolt =3D <1200000>;
> >> -                    regulator-max-microvolt =3D <1304000>;
> >> +                    regulator-allow-set-load;
> >> +                    regulator-allowed-modes =3D <RPMH_REGULATOR_MODE_=
LPM RPMH_REGULATOR_MODE_HPM>;
> >>                      regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> >>              };
> >>
> >> @@ -467,6 +469,8 @@ vreg_l10c_0p88: ldo10 {
> >>                      regulator-name =3D "vreg_l10c_0p88";
> >>                      regulator-min-microvolt =3D <720000>;
> >>                      regulator-max-microvolt =3D <1050000>;
> >> +                    regulator-allow-set-load;
> >> +                    regulator-allowed-modes =3D <RPMH_REGULATOR_MODE_=
LPM RPMH_REGULATOR_MODE_HPM>;
> >>                      regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> >>              };
> >>
> >> --
> >> 2.34.1
> >>
> >



--=20
With best wishes
Dmitry

