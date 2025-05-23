Return-Path: <linux-arm-msm+bounces-59172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D894AC1D49
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 08:52:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69E0F3BC379
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 06:51:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14C181A5BBD;
	Fri, 23 May 2025 06:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A08P56nz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C62E1A3172;
	Fri, 23 May 2025 06:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747983122; cv=none; b=eOvwf8h2r5y6kzqAiIG70oCqld5m38//fgh44uML6nUmRDKI4jVaFCT8hC5D56TWL7OKBZsI8KgvAWpKFWB+2kue3/F9WNflszYuO3fP1PozWPrRC4IK37FTUYKGg5/pwbk//p221pJkNndLZlkZW6PTbHc2Svr08HzTL4Tps/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747983122; c=relaxed/simple;
	bh=TdWHJklRtWZ8ywwzgTUJGjUZCCjpb7Qz9MOX7FbnquI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PONx8uSvlsXJmLf7ZMMtYWQPr0M0HNT8QvGyA3UmeU35bEh2BJES04CeitKyVxe7rqMqqtYl81+qROFhxY4dQNsVsXCP/dgI+n80fRg01UK8lvkZOE6QGZSrAwDx6k8ECVS2wfLCrGLjMvNXuJNkayfxIS/z+zaVIMMfUuNR7S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A08P56nz; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ad5273c1fd7so1496477566b.1;
        Thu, 22 May 2025 23:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747983118; x=1748587918; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dLXPa6TM1M6GFMGV9Y5ZPqK8Q1srQccbBcjIb0KEpe4=;
        b=A08P56nzTPSXOu3ZG45hbVGPPbAa4/QlyHI+UBKlynWXKxDXGBt5wHa/GHza/uh+8A
         vg1fThWQ4QzDzAiufHoQGgJStBfQmG7buyY2hGtesbFeE7IKdoP9tgUEpdqv0YsV0Crg
         ddrBjEc6j5rOK6UUsHcSM3RulYWPGUknX56QzFzTXH3FvR6teEbshO0sZ5zwFw+6UDyG
         Vi5v6jrACq0Tqzu+/EFBzhQKY6Jgc9aoHn/vQP3fWPDBVrYXvQya9xxprS2sJlHTxebG
         DkvyzdZ++fH1So+FTWmSCG9i2EtJPGRJVSeiFCr3F4KmwoKUvPvA0pLlq81s2QuM6c7O
         Y4CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747983118; x=1748587918;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dLXPa6TM1M6GFMGV9Y5ZPqK8Q1srQccbBcjIb0KEpe4=;
        b=Cn5ATrQOFiLfWHMJHdu7K8a4xur0489CI8zX+U9r6kNR2PNZd3GrFnYSWwlpwAcQkI
         Qzs8Erao3YAAyAP4b1RFylca+ea6gIxeCYppxLY+25NDDLwUr6GYjsm+LwHoj0u9vp2b
         Tbp9Vi37iHDVyS7265iv2nb5zr5eGiTDwCCa/WVReHtExeShVM20vi4oV+wAVtURHcxQ
         C+aJSrvHFZ0dkxlaC0pllwz7tLda/qZBaL0atrUCr7Sy50QrmnCH/rHQ1TUU+MP5TrkE
         8I+ZaqcP6R2WANrRd0jrnwuhqFm+MYskOeUbUrU852DAWrCoGhAYufMXD7TUPnaSlaZX
         NJPw==
X-Forwarded-Encrypted: i=1; AJvYcCUcL1NnlE5Nst0nxKeUy66U7rYl5GZaM//Ob7C2T/5JPK3Pq2NI3X/ZAMrAuuW8GF25OKni901l@vger.kernel.org, AJvYcCUo2ho7arFmcZBCfKc3Db7pUAxM9SCG9enrBzViI9acrETnjzXbrH8Zmc9x/lXZypYujwMD/nDosUJL@vger.kernel.org, AJvYcCVJ9wZNJPBbw40nr7vFWzTBdI9G/SILh0/MFzQrTL9qZeOwMgVcT+h6Czep8EEpxlAePK8qsfJyL3o7OyWM/g==@vger.kernel.org, AJvYcCVW27pA21qAbC9c0FZM6QGmTdX4gRL5NCMstsR5dc6iduy5uzDeGN2nyJ1ocsYoiiZs4qEgiPgTxIUd9ocX@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8CNso2c5r6QBu+DOYeqlfesxhQiiu6j0hdXK6jTeA3LNqPI6w
	efnG8v2WIodgnQFSW9+DpWUG1pDYcn0ZlPCDABblwwtcReekojoqLGPrTlJigex6BPQCMcbsM5G
	h66uTKQvEqQ3M9GaTVQCXCF+GIq1v+A0=
X-Gm-Gg: ASbGncsgB0B4QkSBIUQfFPKvD7hDvPm1MX+PMmMd391Fq5EsgffI9UNq1Ru1WfMr5tY
	8FvOVR8Du96Vy4YWz8Vn+viBAXVPMBJ6JVW56PJATL1Cxn0AZIkuINwyBqnkWuIq2D2cHG1ZcTv
	wIlC7AUnloyx93dzIKlikKH7cECdbRgUXc
X-Google-Smtp-Source: AGHT+IGurWO6lIO5fCT+RFXfgRL65YMisDHUzcpcQdJuwg41iDpktRGcT1kWcsbvsUa7IC0+Q0mAtJZJIkxHrI0h0rs=
X-Received: by 2002:a17:907:6eaa:b0:ace:6f8e:e857 with SMTP id
 a640c23a62f3a-ad53699d0ccmr2303364366b.0.1747983118266; Thu, 22 May 2025
 23:51:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241220073540.37631-1-wojciech.slenska@gmail.com>
 <20241220073540.37631-2-wojciech.slenska@gmail.com> <5bba973b-73fd-4e54-a7c9-6166ab7ed1f0@kernel.org>
 <939f55e9-3626-4643-ab3b-53557d1dc5a9@oss.qualcomm.com>
In-Reply-To: <939f55e9-3626-4643-ab3b-53557d1dc5a9@oss.qualcomm.com>
From: =?UTF-8?Q?Wojciech_Sle=C5=84ska?= <wojciech.slenska@gmail.com>
Date: Fri, 23 May 2025 08:51:46 +0200
X-Gm-Features: AX0GCFtrZqR51HKL4omMdtHzAAg1yItMubhm4Ie2PJjFgKtjFahdvQOKTwLnYMs
Message-ID: <CAMYPSMoMBYUPVRLcUZzRr99cehAibgAoNN6Qa3P5Q=0Bt3x1cg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: net: qcom,ipa: document qcm2290 compatible
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alex Elder <elder@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

pt., 23 maj 2025 o 01:30 Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> napisa=C5=82(a):
>
> On 12/21/24 9:44 PM, Krzysztof Kozlowski wrote:
> > On 20/12/2024 08:35, Wojciech Slenska wrote:
> >> Document that ipa on qcm2290 uses version 4.2, the same
> >> as sc7180.
> >>
> >> Signed-off-by: Wojciech Slenska <wojciech.slenska@gmail.com>
> >> ---
> >>  Documentation/devicetree/bindings/net/qcom,ipa.yaml | 4 ++++
> >>  1 file changed, 4 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/net/qcom,ipa.yaml b/Doc=
umentation/devicetree/bindings/net/qcom,ipa.yaml
> >> index 53cae71d9957..ea44d02d1e5c 100644
> >> --- a/Documentation/devicetree/bindings/net/qcom,ipa.yaml
> >> +++ b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
> >> @@ -58,6 +58,10 @@ properties:
> >>            - enum:
> >>                - qcom,sm8650-ipa
> >>            - const: qcom,sm8550-ipa
> >> +      - items:
> >> +          - enum:
> >> +              - qcom,qcm2290-ipa
> >> +          - const: qcom,sc7180-ipa
> >>
> > We usually keep such lists between each other ordered by fallback, so
> > this should go before sm8550-fallback-list.
> >
> > With that change:
> >
> > Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
>
> (half a year later)
>
> I've now sent a series that resolves the issue described in the
> other branch of this thread. Feel free to pick up this binding
> Krzysztof/Rob/Kuba.
>
>
>
> Patch 2 will need an update and some prerequisite changes.
> Wojciech, you'll need:
>
> https://lore.kernel.org/linux-arm-msm/20250523-topic-ipa_imem-v1-0-b5d536=
291c7f@oss.qualcomm.com
> https://lore.kernel.org/linux-arm-msm/20250523-topic-ipa_mem_dts-v1-0-f7a=
a94fac1ab@oss.qualcomm.com
> https://github.com/quic-kdybcio/linux/commits/topic/ipa_qcm2290
>
> and a snippet like
>
> -----------o<-----------------------------------
>                         qcom,smem-state-names =3D "ipa-clock-enabled-vali=
d",
>                                                 "ipa-clock-enabled";
>
> +                       sram =3D <&ipa_modem_tables>;
> +
>                         status =3D "disabled";
> -----------o<-----------------------------------
>
> added to your DT change
>
> please let me know if it works with the above
>
> if you're not interested anymore or don't have the board on hand,
> I can take up your patch, preserving your authorship ofc
>
> Konrad

Hello Konrad,

Thank you very much for your input.

IPA is working stable and without any issues in my project, which is
using the QCM2290.

I will integrate and test your changes, and once they are submitted, I
will resend my patch.

Wojtek

