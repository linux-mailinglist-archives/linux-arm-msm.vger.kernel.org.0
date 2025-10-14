Return-Path: <linux-arm-msm+bounces-77231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA41BDA4C2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 17:19:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 84E3F504C74
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 15:12:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07E232FFFBB;
	Tue, 14 Oct 2025 15:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HWYqf0RH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86082F3C31
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 15:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760454740; cv=none; b=U5cQzgzFWtXG6Nj3rM/Bh29wRvsA/hRiYdxs3NCYU3dcAO7z6E+XqcvRCuQinfvFUHBHVx7dVlBBJOIrE8Wnug9kOC9ZsIz2zUXRWVFRj+ABuvPU0lfEowja5jU4+3q/aGTy+aCoP6/q04Ezp35lrPBtOsCaZqZJPVHum9KObDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760454740; c=relaxed/simple;
	bh=agFpJJOlzEJYaGOnRxTxzVIHDdp11sPEE1v+94YWpr4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KAZ/PMj8uOEo9uPU+nttRMK8bT3K12c979R5DUkM+QRE2lqDS1DmGtzTly5bRJJ95rEVbuR0bwMRr1CadOfaVtEniXhzhh+I092ACS842uovwjaSKJo2PprrP+2RcLch56b5pSWn8FAwcfFv+YyB/zzivEUtZmsGrIdQiIKLBps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HWYqf0RH; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-77f9fb2d9c5so48699857b3.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 08:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760454737; x=1761059537; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h4qOcf6u0Jl2HywXXHEcdL2wknXpRCkA3j+3Ynd20y0=;
        b=HWYqf0RHklPzqZ7FnihEJFb273jcbpU2MOLVBFeOch6lbozx1ASMmm6H//kiPVD9za
         YCUb+9lyC5eyJ3gsUzbyuz0kp7R5j1WQwrl/gHsqR776znwBTDPn9qKj2HbheJN5Eez0
         tqZLPZC8VRQdMGwTbKHSph/N/5wzjbgbf0GDIVsKnoTp4XPCsoIyIe2F3670bERJKE2S
         PdznOdmOOU/uUsM1aR3t2OP4GsJJmqfuz/WGS5kDOynvjymyMgTZiT7lXGdVdaZYVwjK
         TyPJvv8WQswK4wlJI48/Zcd1m7T62wZQk6/CB0UQHgu2Wpmw2a8DofKpNqjARe8Za5Xg
         h3bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760454737; x=1761059537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h4qOcf6u0Jl2HywXXHEcdL2wknXpRCkA3j+3Ynd20y0=;
        b=Xo0tHRpMzjLF7RUIikOyWz16NGeGRUcTAL5Ph15qP3GHTfXifL3ot9ldNRu9f+I6pF
         asPchvEzMQpH+WLfksJB3STu2TSULXUsv0sL+42d5Mv/pwyXGbliACnrhHghc4R71c0a
         u5DODPzrQbWNX+wQxD6lUsk1QyMkARSh00qVSUGS/DMslF1llH2TSm3DvHZ8YU1VRJip
         SooXXLrQ83Bpt0nWMCLUWiOKIbThV9l0lXU+oJSft5dbgrfk2fxz85wYbtmBnr2uomdJ
         CRuWzqyMsDIm/dqrl7w+pPjILKxpz8KWPUaToH5h2ge6ycLZtg+pS4FkFSpiFo5P85L7
         x0BQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnd49UTmLiimdCyA1nkNqJzoiAqosn66lWpD7qrsvZmnMFzj93fSsUK2ZDkb57B0OGQU6X0C2FXhkZGgzs@vger.kernel.org
X-Gm-Message-State: AOJu0YxJNNzWkvmTWzipulhHe5AUbbl4w4/bMNKcxrv/i62Y/jlwUbZz
	p8OYS85XSxuxRpJeMZaSVEEFt7BZu3N61InxYCvYmVbQwk+PIGKwRZtn2P6Nau/wsgadtxS8wIm
	qiBypWWVbTVACVxa5CpJvYoeQTFDYpdInaA==
X-Gm-Gg: ASbGncvs+igLPdSKKsBYC23sRsUih55ouPX7rpUmfR8VWzqW//nUmGVQsqphB6m/ERd
	RZ70xQd/cAZNn2GLfa6yX1fTPoyvJGoVTEy+ZkvG78A0CnAUv5PKuF0uL2N2x/MCsX9kOhU0N0W
	JHZxVCF8WiBhmR8xpXIlDNAR9LzC3Qfd96bqk9cz3oMbfvF8yfr/CjKuFlg5DECUnb5OCBTDhKz
	rH7bzZZX0IrvbqRLCNwBb7KzuKlpSMHtrlBbcE=
X-Google-Smtp-Source: AGHT+IH2P8Yg+f+JuhkBHGL/IjxEGiEOxzuf8m2HuVkmuCbK5MaDW8zDZMh09LbYzGBsCEUJWcBfsA+yuKq0iWW1iXE=
X-Received: by 2002:a05:690e:155c:10b0:63c:f389:9e9d with SMTP id
 956f58d0204a3-63cf389a538mr9992020d50.26.1760454737427; Tue, 14 Oct 2025
 08:12:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251014044135.177210-1-ghatto404@gmail.com> <20251014044135.177210-7-ghatto404@gmail.com>
 <ea12c0c7-c629-4014-8bbf-862264182c0b@oss.qualcomm.com>
In-Reply-To: <ea12c0c7-c629-4014-8bbf-862264182c0b@oss.qualcomm.com>
From: Ghatto <ghatto404@gmail.com>
Date: Tue, 14 Oct 2025 12:12:05 -0300
X-Gm-Features: AS18NWC64-nwS9O4nKaGJWLeAu2XZmNCImChpzZ3nq0fjJrl0t_uVC04MI9V9JE
Message-ID: <CAMQHOheh4MTKS0dLA=zC2DoGvN-x773c08HO3n1_ucXSSXOKnA@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: r0q: fix reserved memory regions
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2025 at 7:02=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 10/14/25 6:41 AM, Eric Gon=C3=A7alves wrote:
> > ADSP and video memory regions in SoC dtsi is misplaced on this
> > platform, fix them by deleting those nodes and redefining them.
> >
> > Signed-off-by: Eric Gon=C3=A7alves <ghatto404@gmail.com>
> > ---
> >  arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts b/arch/arm=
64/boot/dts/qcom/sm8450-samsung-r0q.dts
> > index a3b81403d180..8ed8a67aae0d 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
> > +++ b/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
> > @@ -10,6 +10,9 @@
> >  #include "pm8350c.dtsi"
> >  #include "pmk8350.dtsi"
> >
> > +/delete-node/ &adsp_mem;
> > +/delete-node/ &video_mem;
> > +
> >  / {
> >       model =3D "Samsung Galaxy S22 5G";
> >       compatible =3D "samsung,r0q", "qcom,sm8450";
> > @@ -64,6 +67,16 @@ splash-region@b8000000 {
> >                       reg =3D <0x0 0xb8000000 0x0 0x2b00000>;
> >                       no-map;
> >               };
> > +
> > +             adsp_mem: memory@84500000 {
> > +                     reg =3D <0x0 0x84500000 0x0 0x3b00000>;
> > +                     no-map;
> > +             };
> > +
> > +             video_mem: memory@83e00000 {
> > +                     reg =3D <0x0 0x83e00000 0x0 0x700000>;
> > +                     no-map;
> > +             };
>
> Please keep the entries sorted, also with regards to the existing ones
Sure, thanks
>
> Konrad

