Return-Path: <linux-arm-msm+bounces-85981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A631ACD1E68
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 22:01:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8873E3057591
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 20:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE535329E46;
	Fri, 19 Dec 2025 20:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ngIxYodu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D365B304976
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 20:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766177976; cv=none; b=Z8hxyJst31Hd6Py/Uw4bdJXmKY9x2rHJlNAiT3X9IrlO6Wto75QWtpOnSRSSSfJbXCyOamLURp9ugT0gUZMuUK/NBt/sfDmS96diI5RnnTbBO10I84U/XkQHRImgMHBzembVcQUKDr0Bq274FarqY/M9WSTyqPLqp1XtyoBs7eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766177976; c=relaxed/simple;
	bh=l/FPv+AV/507GEG9Gaur2OmbxtI5yOaBuOZ9o8Vljxc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nPkI2RVQT7Mv4yz7WFVpzQ3IHSJHFnMw4inYbB2WnR/Iw6n6g5jks/bmV78ajZNsZOizfYdB2/V0cog+c0SVfdjmf+v2TvqbpYVpIyKmK5pIARd4AclJtiix8/AMCt2PUMGsiIpiyvXfPOjlRmzrhf/QCptxB8wo4kYDsIIQKCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ngIxYodu; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4ed66b5abf7so31336581cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 12:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766177972; x=1766782772; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aS4OmYCzbKdvwE5BntPhqf93lcN6z7RXIUJ/QZyRAnc=;
        b=ngIxYodu3yKcssM5N2R+tjpicpBULBOzhr+FE4mmmuTMc79cVulyx1bK/1CSAwwbAi
         7fIXqhvQBOVZcRsxRkhyqAD2l+omhQw7BP476GdlmGCOUP2rkYESHK5no6ldlTAzw998
         GidIUbkPefJOXLgGSbs8N/0BEmuWI0alRZ6owWJ6Z2B6T18j6KyvzKqkqsngk4NCKZCR
         eQwUR8bPLAClUqI6pcI7AKzrrwxrWXL8SMmMbkKK3+ZyIQKXPNVOGBbq3Jpo9P6rEwSS
         6kV9n5vqiBv8VO45DefVUVUavKMjRLUU/GdsUl0qJhYzq4EjWSwK+DSFS5QZeD6uvR4N
         OPhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766177972; x=1766782772;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aS4OmYCzbKdvwE5BntPhqf93lcN6z7RXIUJ/QZyRAnc=;
        b=KFcgOsJ4oWL5x/EtxTGBeQpa/ZFavTz3FZ9+bwNQdJ0zPPpTE4SCwbBuVi15dcAMc2
         SYE+OyVHqIyS0+MfcwXZMSRdQYYJGLFLovpHuHEWFMCQYS1opdR4fi8i+TNyDVWZCI8A
         uq4EyOVw1gLE8RTEb2RK6qMiHP5XWvX6vZWNSgSUiMLA19hJ9I1RkzMST+n3cmeL1mub
         iw+cPXujM77o/V7udRU8HA01EboRvZ9fypQ4nS8jGR+okk0Uv1Sj4vrlfkIscuIeUFeE
         j7J0H8yzryrhe7HgGbmB7QMYrrRVwgaC4EgVtlBI5dbfXn9X/yA+7QzaHajbMeqrPAXE
         +akQ==
X-Forwarded-Encrypted: i=1; AJvYcCV87BPopPRmktDV0QfryqOfkn34edMHe4cBn26MRdX5zUb0q/WQSBD+n0Z8ilb+IVlF+GEyZhOvZBIyYdpr@vger.kernel.org
X-Gm-Message-State: AOJu0YzKN3JgK84oTvOUZjHJxPRsdmTPFBSBZMRczx2XB+uDCWO1xOEC
	ppfd0rvoDroS4zkNO6tu3JJoiOFhzHtANXwQefSCWAiDKFA/Vj+QxaI1x6WVexCVAT6HcdmtN1Y
	ZZdPjL0WsJOGIyFbLPH9599feZdtLTg==
X-Gm-Gg: AY/fxX6+XW7PeRPvCx8wgzVUd/FSqxgucptXvhuCI4iiReFTtB/qjseRbVWhZFqJo4U
	eg1+lYFa6SgFnrBe66ATpMMlUkK3hVP0IEFwH86ZCn2JtVpKfffBWRw6csIXpqUIo7jUHgIM95t
	WUl9Dt046hR9TV7Lih8hOpfXBb23s/TFNP0vA1mU26GLh/zDP/EDABRl9HeuNVuQDeVq1rGDqJ+
	5Wn0S+Yv36TvzhMfuD7q3HlG+9q1CHtODUhByCdNrclADkHkwz6ygLmsBzhhmQFytggwtCSxGg+
	D7BtclTOZ55ZM+SWf83ah8zH3pQ=
X-Google-Smtp-Source: AGHT+IHUInld4dr0tzVSPygeNnFyM8vctUDTI0mt+1P0cbCbzfNlC5onUK4e2vD+yoiglNE4/4NgRuxckawSVQK9Zag=
X-Received: by 2002:a05:622a:30d:b0:4ed:9264:30fa with SMTP id
 d75a77b69052e-4f35f45624dmr120435961cf.31.1766177972100; Fri, 19 Dec 2025
 12:59:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251218-surface-sp11-for-next-v4-0-7bcf83c1504a@gmail.com>
 <20251218-surface-sp11-for-next-v4-1-7bcf83c1504a@gmail.com>
 <4d167792-cc62-422b-bf65-3ce101377d46@kernel.org> <fe4148ec-9dbd-4418-9c36-f4a0b9fd2c24@kernel.org>
In-Reply-To: <fe4148ec-9dbd-4418-9c36-f4a0b9fd2c24@kernel.org>
From: =?UTF-8?B?SsOpcsO0bWUgZGUgQnJldGFnbmU=?= <jerome.debretagne@gmail.com>
Date: Fri, 19 Dec 2025 21:58:56 +0100
X-Gm-Features: AQt7F2r6__kaZegqQ_DFSq72HXuciQhViJslLmVbHDK7WPbCev8YRRE_uxJgK2U
Message-ID: <CA+kEDGHK7J3h8mUvgjf-Y_PJ11zcuaCPXik1d_rp27WPCbLBFg@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] dt-bindings: arm: qcom: Document Microsoft Surface
 Pro 11
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Johannes Berg <johannes@sipsolutions.net>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Jeff Johnson <jjohnson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-wireless@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	ath12k@lists.infradead.org, Dale Whinham <daleyo@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 19 d=C3=A9c. 2025 =C3=A0 18:44, Krzysztof Kozlowski <krzk@kernel.or=
g> a =C3=A9crit :
>
> On 19/12/2025 18:40, Krzysztof Kozlowski wrote:
> > On 18/12/2025 23:22, J=C3=A9r=C3=B4me de Bretagne via B4 Relay wrote:
> >> From: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.com>
> >>
> >> Add the compatibles for the Qualcomm-based Microsoft Surface Pro 11,
> >> using its Denali codename.
> >>
> >> The LCD models are using the Qualcomm Snapdragon X1 Plus (X1P64100),
> >> the OLED ones are using the Qualcomm Snapdragon X1 Elite (X1E80100).
> >>
> >> Due to the difference in how the built-in panel is being handled
> >> between the OLED variant and LCD one, it is required to have two
> >> separate DTBs, so document the compatible string for both variants.
> >>
> >> Signed-off-by: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.c=
om>
> >> ---
> >>  Documentation/devicetree/bindings/arm/qcom.yaml | 11 +++++++++++
> >>  1 file changed, 11 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documen=
tation/devicetree/bindings/arm/qcom.yaml
> >> index d84bd3bca2010508a8225b9549d8c634efa06531..3685330344c0bf621125fc=
3d2f9c04082d6de144 100644
> >> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> >> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> >> @@ -1067,6 +1067,17 @@ properties:
> >>            - const: qcom,x1e78100
> >>            - const: qcom,x1e80100
> >>
> >> +      - items:
> >> +          - const: microsoft,denali-lcd
> >> +          - const: microsoft,denali
> >> +          - const: qcom,x1p64100
> >
> > 64 < 78, so this should be placed after devkit list.
>
> No, I missed this is x1p, not x1e. This is placed correct, but the oled
> should be moved as I suggested.

Indeed, this is x1p for the 64100, I didn't choose this naming :)
I will move the oled entry after hamoa in v5.

> >> +          - const: qcom,x1e80100
> >> +
> >> +      - items:
> >> +          - const: microsoft,denali-oled
> >> +          - const: microsoft,denali
> >
> > So this goes after hamoa list, to keep somehow logical order.
> >
> >> +          - const: qcom,x1e80100
> >> +
> >>        - items:
> >>            - enum:
> >>                - asus,vivobook-s15
> >>
> >
> >
> > Best regards,
> > Krzysztof
>
>
> Best regards,
> Krzysztof

Thank you for the review,
J=C3=A9r=C3=B4me

