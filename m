Return-Path: <linux-arm-msm+bounces-85977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 525B8CD1D60
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 21:50:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 47E7F301842A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 20:50:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D91E733CE8A;
	Fri, 19 Dec 2025 20:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dHv6XO5f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1144734165F
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 20:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766177412; cv=none; b=nqm2QqIIymquyuLMz2zWizXJK1RYdWiw2KpYbKWi0NHGVG37eTKM1cGc2jsVvsZb8Numvsmrm0hxnv2f0MNqgWfm6hO5eCduiFllAVIyqSF5KSCRVcp60TmBye+2I1J6+qC5YPXObrcB2maVs1Nja1GJEcWnfVxxcSbBLwt7g5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766177412; c=relaxed/simple;
	bh=qK0aX9ex4MVXzE2y/hhCxHObw7qjjH4KOguPRtU7gc4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mDsBQwAKi0JXSrFKKAQpXUwFyehuM0ygWM3HxU019MU14hNUqiOjY9YKHdYVEZTvKtrQj0CY/dCMdobQQ9jq/7rDuErqyZwVdolE6QK4do53RbnMhP9U8jzVHw2ShKfQ7ZtAQsBuUNLg82l2pMgl1uBNc/TC+XSoR8IcIz+gICQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dHv6XO5f; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4eda6c385c0so16439481cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 12:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766177409; x=1766782209; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E/s7YcuiJpwKoMYsi7MmSYzjmyYOegw0fzBHdgiPFOM=;
        b=dHv6XO5ftk4Lmf+KDT8Wsgo4ETQTW8Jw1U4XqyoNEDh3SzQ00yYsLysNn1rTQm08fK
         8FSwgQZEUWj3Navyv9tE8HYJHu2rSA3gZWGeB829zll/eLZYm1R1OUDwwe+agtSXoivr
         xuqqdiiVxyUNyFE0AAJKv39y3Q5Jqd+dJgqPd8z1cHH2Ghjq5A+TofkOU8TMvw2ii4ZU
         vnlFsOfG6Dz7jdoNX4iu5ylP4wYhha641M9g3F2DQ3HSpjSz2LwelfFZaycPQ8qvYUQ5
         kHwfdg2sPlTy8t+eOPcr4GOWjKAvdBSga3Yro4Q7DrglK75MQCuu0Mo/93zmfBpWceYT
         aZDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766177409; x=1766782209;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E/s7YcuiJpwKoMYsi7MmSYzjmyYOegw0fzBHdgiPFOM=;
        b=VsZqvoIXttnAA39ODHdvjPX1EucVXfL6PdJnCovWbjC5njmolwyEwp+K1czi1BeorP
         g6C/VwIY7CxN1of+1X8l4iyuL5hvNrkSAkqv1WSd0jUntfNIn183+WtnHvSIsWWEtDlu
         mt/5hdLbKSKhhP1/SV4aWEkXW7tC1ZT+uQRdbgV6ggr33G9Bx5bEEKr9EkQMXtC3p8+N
         CnzE0qFtaDHSy2A1yrOg+Ax3zGFAhVk3nuBLkl1pVaZEKjhZbHgf28CwGvF+sF/FvIPf
         YTULmGogczeJO9YvIXA7IupgjYshk7BSQ6yUTfvFqCOCmGmN3Cw+DfeztM9Re8HFcMYz
         ECUg==
X-Forwarded-Encrypted: i=1; AJvYcCW361g39mvgKtX5QOQErFEKFaG50BDxpfUWH7tU7vaP8wzMlKZA1pWqoo93dD1B3WOgn/ni9jvcxwEL/Hmt@vger.kernel.org
X-Gm-Message-State: AOJu0YxS1EuXyDnpHaPiiHyjF69LlZ0L+VfnClIl2bBPE3IrLAEoHxdo
	2XOv3wlyxWhGSaXqDhfm8tel7M15v9jFqjFVb8HmQuhUyNGFUIPkZP+b2QhngHX2Z9MnWoE2vbD
	CLxFvtEKqLzAOaR3uNINrjNFYFUNL7Q==
X-Gm-Gg: AY/fxX6dpiEsDXIbP0biBOmYMFzKLu2d2ZLnNWGtT59lmK2QA0r2rJLwdtCBgnEeUKE
	HFO2ReFTMvR6+9xjEaDiZU+YdMet6uI1wPB+wAJDKYJxTxPDxqkaxdZTUgWBBrrqO/o5Ml1zF55
	7f5EgCx7uNNX6bHrhEuX4PjKgI/z5jr/Z2ARkdU/JYPcI1c6aslxjzh3fnOIfr70Am36ZnwB8Pi
	DsVCBeVuLOnIH1Igl5hz0Scy15GZ1JPgGPGnnZtplz09GkW3TQaYIjkWz76sFReja+cFd8oTq5K
	AilTu1uWlXIZf+tddgjyBeN66MI=
X-Google-Smtp-Source: AGHT+IE42yv7FIsrWMR9yjYwFTyqReRn26jbbdEMiBw0u/y/uO6l059x2jBMuDoxTGPi0k5VPly4SKVeRcBZYLHomSo=
X-Received: by 2002:a05:622a:400e:b0:4ee:d6:7a51 with SMTP id
 d75a77b69052e-4f4abcceef9mr71345351cf.12.1766177408683; Fri, 19 Dec 2025
 12:50:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251218-surface-sp11-for-next-v4-0-7bcf83c1504a@gmail.com>
 <20251218-surface-sp11-for-next-v4-5-7bcf83c1504a@gmail.com> <de00f21e-7fc7-4caa-93ec-afbcc5d9e12d@kernel.org>
In-Reply-To: <de00f21e-7fc7-4caa-93ec-afbcc5d9e12d@kernel.org>
From: =?UTF-8?B?SsOpcsO0bWUgZGUgQnJldGFnbmU=?= <jerome.debretagne@gmail.com>
Date: Fri, 19 Dec 2025 21:49:32 +0100
X-Gm-Features: AQt7F2pcZUitjZSQNg2PzbbA2oie2fjwh-55TuTLVMXOnU3tEdVckxLHObxjFK0
Message-ID: <CA+kEDGHL0A=KYhp79_08sx=dUyvpDOuHXEuvgsOU+61PshtN3w@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] arm64: dts: qcom: Add support for Surface Pro 11
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Johannes Berg <johannes@sipsolutions.net>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Jeff Johnson <jjohnson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-wireless@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	ath12k@lists.infradead.org, Dale Whinham <daleyo@gmail.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 19 d=C3=A9c. 2025 =C3=A0 18:47, Krzysztof Kozlowski <krzk@kernel.or=
g> a =C3=A9crit :
>
> On 18/12/2025 23:22, J=C3=A9r=C3=B4me de Bretagne via B4 Relay wrote:
> > From: Dale Whinham <daleyo@gmail.com>
> >
> > Add device trees for the Qualcomm X1E and X1P-based Microsoft Surface
> > Pro 11 machines (codenamed 'Denali').
> >
> > This device is very similar to the Surface Laptop 7 ('Romulus').
> >
> > Use a similar strategy to x1-asus-zenbook-a14.dtsi so that we can creat=
e
> > x1e and x1p-specific flavors of the device tree without too much code
> > duplication.
> >
> > Hardware support is similar to other X1 machines. The most notable
> > missing features are:
> >
> > - Touchscreen and pen
> > - Cameras (and status LEDs)
> >
> > Signed-off-by: Dale Whinham <daleyo@gmail.com>
> > Tested-by: Dale Whinham <daleyo@gmail.com>
>
> Drop, authorship implies this. Otherwise this suggest none of other
> authors test their code before sending.

Sure, I will remove this line in v5.

> > Signed-off-by: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.co=
m>
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/Makefile                  |    4 +
> >  arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi  | 1324 ++++++++++++=
++++++++
> >  .../dts/qcom/x1e80100-microsoft-denali-oled.dts    |   20 +
> >  .../boot/dts/qcom/x1p64100-microsoft-denali.dts    |   16 +
> >  4 files changed, 1364 insertions(+)
> >
>
> This DTS fails dtbs_check.

Indeed, this has regressed when moving disable-rfkill into
ieee80211.yaml, we need to reference the moved property
from qcom,ath12k.yaml also now, I will fix this in v5.

> > diff --git a/arch/arm64/boot/dts/qcom/x1p64100-microsoft-denali.dts b/a=
rch/arm64/boot/dts/qcom/x1p64100-microsoft-denali.dts
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..93f1620ad8c71c6cf36ba3e=
c34b9eebc47bf3f18
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/x1p64100-microsoft-denali.dts
> > @@ -0,0 +1,16 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights rese=
rved.
>
> How exactly is this copyrighted by Qualcomm? I don't think Qualcomm ever
> prepared DTS for this, so can you point us to the original work?
> > + * Copyright (c) 2025 Dale Whinham <daleyo@gmail.com>
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "hamoa.dtsi"
> > +#include "x1-microsoft-denali.dtsi"
> > +
> > +/ {
> > +     model =3D "Microsoft Surface Pro 11th Edition (LCD)";
> > +     compatible =3D "microsoft,denali-lcd", "microsoft,denali",
> > +                  "qcom,x1p64100", "qcom,x1e80100";
> > +};
> >
>
>
> Best regards,
> Krzysztof

Thank you for the review,
J=C3=A9r=C3=B4me

