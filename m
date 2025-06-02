Return-Path: <linux-arm-msm+bounces-60041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A73AEACAA9F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jun 2025 10:32:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C9053AEAAF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jun 2025 08:32:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C9E9199BC;
	Mon,  2 Jun 2025 08:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TmPkKRJp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2241DA3D
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Jun 2025 08:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748853167; cv=none; b=GErN+nOaZKQ9v91Nmn5OqciRKLG+SGn9EfK9hke3eAHMd+8tNltCrjDHawORCDuVx5OGMEClycJLIuY4UCs7iR2Pkh8KHENKTfQR8+6aNYVDkgqhliwZXWrpFnPLe33hS23hNQ3IWHmNfJ8H75zzv/Cak98cBs3UJTuZ8paSDtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748853167; c=relaxed/simple;
	bh=5J/lOQ/Oys0jGSxLhxo9VfHtcBTDGsTGSXadzixXHvY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XfT8LICAKyO3h8i6r+SGp2lTPzo1kK/w1c81mH/twJZ6lqNMM2Y3narqTB06aS8YpJglN7ooT1hnA/LsGiE/25aQQqHnheLab2z0BndL1qUtnv0GWVi6KxS++UcErEPTohJiFV83KUAS6HxmGG295lYrgPXmHqlOMcMHvawD+Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TmPkKRJp; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-407a3913049so984593b6e.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Jun 2025 01:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748853165; x=1749457965; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s0qrAmOJ6NHiRbt1g7dCklmUXXYJ2PqsR8CeOeieH2g=;
        b=TmPkKRJpXcRsf7v13zfAns4c2t7FGChBxn1RwFXPxgeCY4xxWniQHOE1kbAvHaUsga
         fRRG2V5C8tB4I98Vhq5qmTPqx2TDRhJH4+oeQb9ABx0fCkjRP53I/lQuhFN0l9Gqpd2R
         DvnyGHpeCGULNnKYfHO3IzdGxBwGPOasn4N2f/w5no1RwEoG+Y9mRKOiRq8HOPmhtOvi
         Aiq8Xd9t7neJSlg1f8yIXM8AiU4At7Xv4HHNjqBOlWr9DcmqziU5zwrOdHu9fKGcinMg
         Ba0NjA5Ohqsk522NwD6mAU7yql6K56l4Sg0rlM81Q8lvcCY6JW3+fi5Orj+6PdQcBGZN
         bfqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748853165; x=1749457965;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s0qrAmOJ6NHiRbt1g7dCklmUXXYJ2PqsR8CeOeieH2g=;
        b=el3wq8BUSXhd3zSkNF3YLVtOEXeLCAp0wBsfKD3mIyN96xAxg727Fxm49aV7IVswqz
         u8PzIQFqU1Shn5xlMIUDnLdOsSLJ2l+zabYDfBMwu2Kj+THmyTCfqgyOZwArSPRuff1r
         Xel/eXcJZvYlCjAaFlDzw+sP6zTqg2xry8K1/eSs75lULVI3WTUJ9IZWz6XVT+WbLtoa
         erLTJJ/l6oH3yxk64BR1NrmqfOLUH1rnd64x/n8uYB9MRvSyORIGAv+F9oz61QbENj3N
         +chWwdp9NbA6YyVTrUA6fhaCLwTvT/nH/OKzIxO7jF6zyJtweTOXMxWIoIdbIBDdrggI
         ohQQ==
X-Gm-Message-State: AOJu0Yz8MNJ2McRqexzecMYtWrfS6PP6+YXKxxDZSF/hUu41tYl+6aBI
	R5cvJ0/5OVbKz4MhDeGJNJmCURu0TiT2w0NcL2FXsZPpspBJsxDMBizH5szsyWptp3VyLB70lai
	77rTIbj4ng2MvNAioTN90ShBMoCL7Dlk=
X-Gm-Gg: ASbGncvTlV2qif11TkKguN5laslejAV3NzzRITMTMT247S8t8VWk7iu2NGkAcKufbLv
	tiSzLpXq+Khs0XJf0MB8IFEkzfWnTRZGd92/E7UY+D/Y6A08yoMwcIjT4x5W7TP/hoTk+5j0nEY
	pF0GuH3bd/dshsaE1vlJja3nb5ghOr/tXuCQ==
X-Google-Smtp-Source: AGHT+IH+qWW1yFJ2uc6FBhl7eksZPtE8X6epdKsV69p79FHEirvO8MmFMJrxyIsyDFIP3spX9NDR1G6X7xZmpUKQw7k=
X-Received: by 2002:a05:6808:6a98:b0:404:ed0d:79e5 with SMTP id
 5614622812f47-4067977d491mr8259675b6e.30.1748853164747; Mon, 02 Jun 2025
 01:32:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250602070929.41575-1-elliot.huang.signed@gmail.com> <bdb2b22d-23c4-49bd-8411-d99218d843b6@kernel.org>
In-Reply-To: <bdb2b22d-23c4-49bd-8411-d99218d843b6@kernel.org>
From: Elliot Huang <elliot.huang.signed@gmail.com>
Date: Mon, 2 Jun 2025 16:30:39 +0800
X-Gm-Features: AX0GCFv-GZ1Qt5gtF0v-O94-OsrBc7Gw4EwaSUNpyCxy7jGwnpJMNbdm0iNJxqQ
Message-ID: <CALe+u94ov7qGyP_mtKLXBk_=OZCkQUDvk3xvTGiE4LTN89h7JQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] arm64: dts: qcom: support sound on Asus Vivobook S15
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, andersson@kernel.org, 
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I am not sure, this was from Lenovo T14 s DTS, which also has two speakers

On Mon, Jun 2, 2025 at 3:15=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 02/06/2025 09:09, binarycraft007 wrote:
> > This adds sound support for vivobook s15, tested:
> > - 2 speakers.
> > - 2 dmics
> > - headset with mic(distorted).
> >
> > Signed-off-by: binarycraft007 <elliot.huang.signed@gmail.com>
>
> Please use full name for authorship and SoB (see submitting patches for
> more context).
>
> > ---
> >  .../dts/qcom/x1e80100-asus-vivobook-s15.dts   | 202 ++++++++++++++++++
> >  1 file changed, 202 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts b/=
arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
> > index 71b2cc6..cce2460 100644
> > --- a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
> > +++ b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
> > @@ -23,6 +23,32 @@ aliases {
> >               serial1 =3D &uart14;
> >       };
>
>
>
> ...
>
> > +
> >  &mdss {
> >       status =3D "okay";
> >  };
> > @@ -742,6 +883,59 @@ &smb2360_1_eusb2_repeater {
> >       vdd3-supply =3D <&vreg_l14b_3p0>;
> >  };
> >
> > +&swr0 {
> > +     status =3D "okay";
> > +
> > +     pinctrl-0 =3D <&wsa_swr_active>, <&spkr_01_sd_n_active>;
> > +     pinctrl-names =3D "default";
> > +
> > +     /* WSA8845, Left Speaker */
> > +     left_spkr: speaker@0,0 {
> > +             compatible =3D "sdw20217020400";
> > +             reg =3D <0 0>;
> > +             reset-gpios =3D <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
> > +             #sound-dai-cells =3D <0>;
> > +             sound-name-prefix =3D "SpkrLeft";
> > +             vdd-1p8-supply =3D <&vreg_l15b_1p8>;
> > +             vdd-io-supply =3D <&vreg_l12b_1p2>;
> > +             qcom,port-mapping =3D <1 2 3 7 10 13>;
> > +     };
> > +
> > +     /* WSA8845, Right Speaker */
> > +     right_spkr: speaker@0,1 {
> > +             compatible =3D "sdw20217020400";
> > +             reg =3D <0 1>;
> > +             reset-gpios =3D <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
>
> Are you sure this is correct GPIO? That's unusual to have same GPIO used
> for two speakers in two speaker setup.
>
>
> Best regards,
> Krzysztof

