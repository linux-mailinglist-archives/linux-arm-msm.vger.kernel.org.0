Return-Path: <linux-arm-msm+bounces-43078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EBF9FA658
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Dec 2024 16:08:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82FA0188733E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Dec 2024 15:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFE9318CBFB;
	Sun, 22 Dec 2024 15:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W1uCoOm2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B7F18A924;
	Sun, 22 Dec 2024 15:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734880094; cv=none; b=QwaopOYPEqnCpBODaF1fiDJnwDtF091obNeDSm39jmmVfdpSMo3mAec3GX+URR5vle/MSea6n3fHFw4e8TbZ5Sd/GlhqOYhMVlJPSKAQ4gwFed4v2NCy2zAqcURvr5vaYLRS28PJga3UJuIZUckOCP86TgWR7fzE0Jdgzq20L3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734880094; c=relaxed/simple;
	bh=KNQhSyi4ipTPPysSBkuG1N/VEAxn0uQWIXM+DCiPfNA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BOVlLEsIbzsk+WKfuUIbEIcEw8pvNJbxPE+On5fnSbEBGvdNR7gOH1PXdUwi0c2emGRTo8URiFJ/kJWHnCOJjRdEOAGRugD7l+oIuMvDrwLVuqgnybdZMpt+L4J/K1aGx1bO2151L3US3POYep7Ftog6njDJq+TZ0Qhc0Ot+wYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W1uCoOm2; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-29e5aedbebdso1562875fac.0;
        Sun, 22 Dec 2024 07:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734880092; x=1735484892; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mZ2sbrQyrrPcANBkGFQguh+3JYHXT7LPTlFvu+SnOAw=;
        b=W1uCoOm2ZMqSOowqi6R6IsIdRwz/7LngDrVCPll+4aLpwCoCys+mJcVWWbf6b30dqe
         1wCXNztMVk0OzOSSOwTbnlRa7fQqTUA3Lqtozxc5yB/yltVg24VHGxfz+/kMlRXNEaBo
         oxrNX2HR143c5aSiHRjWK9FILukLSRz999lpJ/ZAHX2SgobMuF3hj6j+qZKCUWWOL/dk
         NAUszlrY7O3crCj83ZGFNKsUPOpCy3zXv0G4E/SbVbGv/+fzhA8w6Xg0gDj/obS8Iqbs
         iVy0+QMFkabPkoxcNnITqJuCqNg4dovhYdpaPshNmH0g4rYuG+MSW90WLo+pqBqxY0Jk
         GPGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734880092; x=1735484892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mZ2sbrQyrrPcANBkGFQguh+3JYHXT7LPTlFvu+SnOAw=;
        b=oBG9cljk4a7D59W247k34fOpQhYinsPmkNwqPtG1pw822Oqpw1NyOZUWysIvibnvWq
         z2Q/uDI1Wvptt4aCxYr6Ag55MZ2Q4PbQuD00R8s2QGs5VnlIOvSeqdH3FltEfvO2dggb
         Sav75Ij56veyWjj/R9sEDmRkSd+aBZky5DT1uVEWzmaLKf9oyxTHm+x/QB0BX2fVy1kw
         ++czxOVqe9Nah3HpukOLgzntiHMnwlArLPnjG9E9PBA62n3ZhwSVxhXuBWbr1Md3Pb+A
         3KednK/FZQtWR9FbRZYnRSf4GSGeNHIoQbVNr5V6648EKw48yGGk7OwYwHA3O4MWJ/HI
         S5eQ==
X-Forwarded-Encrypted: i=1; AJvYcCUomYzCTR/1mikXrkEWFPcdyE7ZvJkVym72OD77rMsGMIv+DyPo5LxhvBKU2iKRqBoiqJ7UAnpr7q3GH1bK@vger.kernel.org, AJvYcCUqHdlqXuOcfG99qrKTlrSHiWoHiayFCE5DsEr8Uqr4Ri4Zxd+M3uR1Px1YusmBxojYw5ZyVkaslkqllduvcw==@vger.kernel.org, AJvYcCVmMI6l2OdiGLLD272M+pZRobjHlOlQJGB1X7Tv6CQlcPQKyj2JE92HmQJaXSDuOSKhVPFTxvu0GPby@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd1lao0LpR/drvyjEB73A0N1IgGz9rxapgAnLNaaHKhwxdMCx6
	VSAqrh/27yuHCEWpQdg/ZR7tz4rmU7glmsS01bMu9MPiBRyHyBvH4gEuw+58WbNm4L5o7P3m9k7
	d22CLl7X4jKBh9tmm0IaSPL64X9o=
X-Gm-Gg: ASbGncu1Z0WjcRFuRKaog0MC0bYGVr6SElKmmsRnzagW7hYwGQXIya5jBMLR1wM3YdD
	e9c/hMYyOFBIn1W7oc+Iek51yVLctn7aOLmINLhk=
X-Google-Smtp-Source: AGHT+IHOrO3Nptpr/pLzJxMo4JF+qwMmVwbfECZmbV0fgisN4KlsqBaoaQKUPVgL4heDFw0c1lTs2Otr/sYLBWMbrWk=
X-Received: by 2002:a05:6870:ff43:b0:296:ff26:3cd1 with SMTP id
 586e51a60fabf-2a7fb14195cmr5567941fac.21.1734880091960; Sun, 22 Dec 2024
 07:08:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241219200821.8328-1-maccraft123mc@gmail.com>
 <Z2WxzvKRVcOz5d2V@linaro.org> <CAO_MupJ7JtXNgGyXcxGa+EGAvsu-yG0O6MgneGUBdCEgKNG+MA@mail.gmail.com>
 <Z2W2UhspMZNT1TRU@linaro.org> <c8677ae6-a145-411c-a221-02faa1ce809d@kernel.org>
In-Reply-To: <c8677ae6-a145-411c-a221-02faa1ce809d@kernel.org>
From: Maya Matuszczyk <maccraft123mc@gmail.com>
Date: Sun, 22 Dec 2024 16:07:36 +0100
Message-ID: <CAO_Mup+YFAT5oFRGYucW5h_eGcfp4C5FzF20hM6xF=qMR1DdQw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: platform: Add bindings for Qcom's EC
 on IT8987
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree <devicetree@vger.kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

niedz., 22 gru 2024 o 15:40 Krzysztof Kozlowski <krzk@kernel.org> napisa=C5=
=82(a):
>
> On 20/12/2024 19:24, Stephan Gerhold wrote:
> > On Fri, Dec 20, 2024 at 07:16:34PM +0100, Maya Matuszczyk wrote:
> >> Excuse the formatting, I've typed this reply from my phone
> >>
> >> pt., 20 gru 2024, 19:05 u=C5=BCytkownik Stephan Gerhold <
> >> stephan.gerhold@linaro.org> napisa=C5=82:
> >>
> >>> On Thu, Dec 19, 2024 at 09:08:18PM +0100, Maya Matuszczyk wrote:
> >>>> This patch adds bindings for the EC firmware running on IT8987 prese=
nt
> >>>> on most of X1E80100 devices
> >>>>
> >>>> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> >>>> ---
> >>>>  .../bindings/platform/qcom,x1e-it8987-ec.yaml | 52 ++++++++++++++++=
+++
> >>>>  1 file changed, 52 insertions(+)
> >>>>  create mode 100644
> >>> Documentation/devicetree/bindings/platform/qcom,x1e-it8987-ec.yaml
> >>>>
> >>>> diff --git
> >>> a/Documentation/devicetree/bindings/platform/qcom,x1e-it8987-ec.yaml
> >>> b/Documentation/devicetree/bindings/platform/qcom,x1e-it8987-ec.yaml
> >>>> new file mode 100644
> >>>> index 000000000000..4a4f6eb63072
> >>>> --- /dev/null
> >>>> +++ b/Documentation/devicetree/bindings/platform/qcom,x1e-it8987-ec.=
yaml
> >>>> @@ -0,0 +1,52 @@
> >>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>>> +%YAML 1.2
> >>>> +---
> >>>> +$id: http://devicetree.org/schemas/platform/qcom,x1e-it8987-ec.yaml=
#
> >>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>>> +
> >>>> +title: Qualcomm Embedded Controller on IT8987 chip.
> >>>> +
> >>>> +maintainers:
> >>>> +  - Maya Matuszczyk <maccraft123mc@gmail.com>
> >>>> +
> >>>> +description:
> >>>> +  Most x1e80100 laptops have an EC running on IT8987 MCU chip. The =
EC
> >>> controls
> >>>> +  minor functions, like fans, power LED, and on some laptops it als=
o
> >>> handles
> >>>> +  keyboard hotkeys.
> >>>> +
> >>>> +properties:
> >>>> +  compatible:
> >>>> +    oneOf:
> >>>> +      - const: qcom,x1e-it8987-ec
> >>>
> >>> Given that ECs tend to be somewhat device-specific and many vendors
> >>> might have slightly customized the EC firmware(?), I think it would b=
e
> >>> better to disallow using this generic compatible without a more speci=
fic
> >>> one. In other words, I would drop this line and just keep the case
> >>> below:
> >>>
> >> I've looked at DSDT of other devices and they look to be compatible wi=
th
> >> what's on the devkit, with differences being extra features on magicbo=
ok
> >> art 14 and yoga slim 7x. Though this isn't a hill I'm willing to die o=
n.
> >>
> >
> > I think it's fine to keep qcom,x1e-it8987-ec as second compatible.
>
>
> No, because:
> 1. There is no such thing as x1e
> 2. If there was a soc like this, this has nothing to do with SoC. It is
> not a component inside SoC and that is the only allowed case when you
> use SoC compatibles.

It was the closest thing I had for a "platform name"

>
> > However, without a more specific compatible, there is a risk we have
> > nothing to match on in case device-specific handling becomes necessary
> > in the driver at some point.
> >
> > It's certainly subjective, but it might be better to play it safe here
> > and have a specific compatible that one can match, even if the behavior
> > is 99% the same. There will often be subtly different behavior across
> > devices, you mentioned the "keyboard backlight turning off and the powe=
r
> > LED slowly blinking", who knows what else exists.
> >
> > I suppose worst case we could also use of_machine_is_compatible() to
> > just match the device the EC is running on, but I'm not sure if that
> > would be frowned upon.
>
>
> Unless you have some sort of insights or secret knowledge from Qualcomm
> (Bjorn or Konrad can chime in here), I think these are pure guesses that
> this is a Qualcomm product (implied by vendor prefix) or some sort of
> re-usable generic firmware from Qualcomm present on multiple devices.

The x elite devkit also has the IT8987 EC chip, and when comparing the
firmware of it and Yoga Slim 7x's EC there are similarities when
running them through strings
On both of them at the beginning there are strings that look like
version identifiers:
Devkit:
UUBBK V:00.20.00$
BBK-V20$

Slim7x:
UUBBK V:00.21.00$
BBK-V21$

With similar ones at the end:
Devkit:
EC VER:00.29.00$
LsFv:00.29.00$
Qualcomm$
WoS 8c GenX$
ODM$
MB:A0$
BUILD DATE:
02/0//2/24$
TIME:
14:33:35$

Slim7x:
EC VER:00.60.00$
LsFv:00.20.00$
Qualcomm$
WoS 8c GenX$
ODM$
MB:A0$
BUILD DATE:
2024/07/25$
TIME:
09:58:00$



>
> If the FW across devices is the same, then fallbacks for these are fine
> with me.

As the devkit has EC firmware that is handled the same way in DSDT
tables of most of other x1e laptops with the same EC, and is a subset
of what's done on Lenovo Yoga Slim 7x and Honor Magicbook Art 14 I
think the devkit's compatible  + -ec would be a good pick.

This conversation is getting long and I feel like I've said everything
I wanted to say, I'll just do what you tell me to do about the
fallback and binding filename.

>
> Best regards,
> Krzysztof

