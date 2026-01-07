Return-Path: <linux-arm-msm+bounces-87965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E310ED0068E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 00:41:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 86C9430169BF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 23:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF8C22F6574;
	Wed,  7 Jan 2026 23:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u3iYzFZA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D84E2C3255;
	Wed,  7 Jan 2026 23:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767829309; cv=none; b=GWaePZ7B94aCHNSN2BVMQXBuheuU7Sxg7OLThhuXODkEI3iGMJPzuo6WLUZn6ljuoiHV5sgTP/Fhd6TEhp53lrK/po926d60GJTq3ysu5rzMNRlV+yboalvrspWTn5vQG+aOmpxk0SX+gB5RFLHXQyitKO8cJDt8mLW1qg8S4/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767829309; c=relaxed/simple;
	bh=HJoEsNv3nN54SJsrJtklxxziYCUnqinUkYCtKAg0zXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CLOQIghjw8wKTXY927DdCl9HoB8xOKU9B3dl2kJGQwRbVb9rV271gCgk1mw455pHdvaO8dto0N6DFq08HHzoaq4HsKE0Jc1KkQdEsVz7J4GJmJdoHCTkba5hWU/qSAmfAXIzShOl1rmWjde4bGg5dlCu4IDX4TGftkFEI824sbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u3iYzFZA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A92CC4CEF1;
	Wed,  7 Jan 2026 23:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767829308;
	bh=HJoEsNv3nN54SJsrJtklxxziYCUnqinUkYCtKAg0zXs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u3iYzFZAo9qr4WwO+/PZPy6yxCd2isz/9uiC4042MNSeCd8xVyUHOnkUEQQBDQBWA
	 01sSapblEHFUT14b7Shz7C2zWHk+3jv33zZ48LEwAdO3YCPw8rs86FxL6/KBhA66EZ
	 OM2gxkfxPyCz6Kldv8Jiv87QlVrqx3gDL9sy3dxN4XknbVCA8gmJ+BYg/k3wJPx484
	 niJwBTjoLdeNAFwRy+ORFmO69R3OhJr+YVJ8WTEfyigF7g+Hkt/GzyEoxxZORWkRgp
	 ktS2edoGDZe21b5B1mX0yKqP9p4HOtKFtjroq5Tsbx6mik49KFKZesPRdPTkKlqpeT
	 nyaQoj2z16+lQ==
Date: Wed, 7 Jan 2026 17:41:45 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: soc: qcom: qcom,pmic-glink: Add
 Kaanapali and Glymur compatibles
Message-ID: <pvc2j55vykotf2h3t6rkjrrtuwswkz5rrzhzrhdz3jbz2hvhfs@ivvpnkbbxgvb>
References: <20251217055655.638594-1-anjelique.melendez@oss.qualcomm.com>
 <20251217055655.638594-2-anjelique.melendez@oss.qualcomm.com>
 <fcb65bmrocuyapp2hocfzxuufa2ttgv7sf4ip72yybbefm65zb@ojka5lpo7iuh>
 <aa2cca7d-3362-43c4-9af7-94f277b16793@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa2cca7d-3362-43c4-9af7-94f277b16793@oss.qualcomm.com>

On Wed, Jan 07, 2026 at 02:36:49PM -0800, Anjelique Melendez wrote:
> 
> 
> On 12/22/2025 11:42 AM, Bjorn Andersson wrote:
> > On Tue, Dec 16, 2025 at 09:56:54PM -0800, Anjelique Melendez wrote:
> > > Kaanapali PMIC glink platforms support features exposed by the
> > > SM8550 PMIC glink interface. Document the Kaanpali compatible
> > > string to have fallback on SM8550.
> > > 
> > > Glymur PMIC glink platforms support features exposed by SM8550,
> > > X1E80100 and Kaanapali PMIC glink interfaces. Document the Glymur
> > > compatible string to have fallbacks on SM8550, X1E80100 and
> > > Kaanapali.
> > 
> > But while the Glymur PMIC GLINK interface does present (almost) the
> > same features as SM8550 and/or Kaanapali, I don't see them as
> > compatible. The protocol is different and if nothing else, as shown
> > by patch 2, the life cycle is different.
> > 
> > > 
> > > Signed-off-by: Anjelique Melendez
> > > <anjelique.melendez@oss.qualcomm.com> --- .../devicetree/bindings/
> > > soc/qcom/qcom,pmic-glink.yaml     | 8 ++++++++ 1 file changed, 8
> > > insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-
> > > glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-
> > > glink.yaml index 7085bf88afab..302b338e7012 100644 --- a/
> > > Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml ++
> > > + b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-
> > > glink.yaml @@ -37,12 +37,20 @@ properties: - const: qcom,pmic-
> > > glink - items: - enum: +              - qcom,kaanapali-pmic-glink -
> > > qcom,milos-pmic-glink - qcom,sm8650-pmic-glink - qcom,sm8750-
> > > pmic-glink - qcom,x1e80100-pmic-glink - const: qcom,sm8550-pmic-
> > > glink - const: qcom,pmic-glink +      - items: +          - enum: +
> > > - qcom,glymur-pmic-glink +          - const:
> > > qcom,kaanapali-pmic-glink +          - const: qcom,x1e80100-pmic-
> > > glink +          - const: qcom,sm8550-pmic-glink +          -
> > > const: qcom,pmic-glink
> > 
> > So this would then result in:
> > 
> > compatible = "qcom,glymur-pmic-glink", "qcom,kaanapali-pmic-glink",
> > "qcom,x1e80100-pmic-glink", "qcom,sm8550-pmic-glink", "qcom,pmic-
> > glink";
> > 
> > Which tells the operating system that it should use the
> > implementation for the Glymur interface, and if that isn't known the
> > implementation for the Kaanapali interface, and if that isn't known
> > the implementation for the Hamoa interface, and if that isn't known
> > the implementation for the SM8550 interface, and if that isn't known
> > the generic "pmic glink" interface.
> > 
> > So, in an operating system that doesn't know how to interact with
> > Glymur, you have stated that Kaanapali is a good second choice. This
> > does accurately capture the soccp behavior, but looking at the
> > individual functions we're not compatible with Kaanapali.
> > 
> > If we're in an operating system that doesn't know about Glymur or
> > Kaanapali, you're stating that the Hamoa implementation is good. I
> > think this is accurate for several of the features, but the OS will
> > forever wait for the services to show up.
> > 
> > Etc...
> > 
> > As such, I think the appropriate way to express this is to add two
> > new "top-level" options:
> > 
> > - items: - const: qcom,kaanapali-pmic-glink - const: qcom,pmic-glink -
> > items: - const: qcom,glymur-pmic-glink - const: qcom,pmic-glink
> > 
> > This establishes them as new "base compatibles", which can be used
> > for derived platforms, by just adding the relevant enums. The
> > alternative is to add them to the first item (enum + qcom,pmic-
> > glink) and then as soon as we have derivatives we split it out in
> > enum + kaanapali + qcom,pmic-glink or enum + glymur + qcom,pmic-
> > glink. But I think this would be cleaner.
> > 
> > Regards, Bjorn
> > 
> 
> I agree that it would make more sense to decouple Kaanapali and Glymur
> however I do have a few follow up questions on how that should look in the
> pmic-glink and glink aux drivers.
> 
> 1. In v2 we had tried to define Kaanapali and Glymur separately but in the
> pmic-glink driver they were sharing the same data since they both have
> charger FW running on SOCCP instead of ADSP. Krzysztof had expressed here,
> https://lore.kernel.org/all/01f419cc-3236-48b9-bd51-e7db07d1e6fe@kernel.org/,
> that having separate Glymur and Kaanapali compatible strings but then having
> them both point to the pmic_glink_kaanapali_data basically infers that
> Kaanapali and Glymur were compatible.

My main take away from that email thread is Krzysztof is trying to
understand the situation, and isn't provided the explanation about how
the various firmware interfaces relates to each other - and hence what
should be marked as "compatible" with what.

> There were other issues with that
> binding so I'm not sure if that comment would still stand in this case if we
> create new Glymur and Kaanapali base compatibles. If it does would it make
> more sense if the pmic_glink_data was instead named so that it relates to
> the system that the chg fw is running on?
> i.e
> { .compatible="qcom,glymur-pmic-glink",.data=&pmic_glink_soccp_data},
> { .compatible="qcom,kaanapali-pmic-glink",.data=&pmic_glink_soccp_data},
> { .compatible = "qcom,pmic-glink", .data = &pmic_glink_adsp_data },
> 

Absolutely, the fact that the variable is called
"pmic_glink_sm8450_client_mask" doesn't help anyone to understand that
it means "yes we have battery, altmode, and ucsi".

In fact, those bit fields was introduced when we didn't support all
three clients across all targets. As the code looks today, that whole
mechanism should be thrown out (or we should introduce some system that
exercises it).

> 
> 2. With Glymur and Kaanapali separated we would also need to update the UCSI
> and Battmngr drivers compatible string lists.
> 
> In USCI driver we would need to do:
> 
> + { .compatible ="qcom,glymur-pmic-glink", .data = &quirk_sm8450, },
> + { .compatible = "qcom,kaanapali-pmic-glink",.data = &quirk_sm8450, },

Looks reasonable, but as you suggest below, better to add an Hamoa
compatible and rely on the fallback to that. This will also allow us to
stop claiming that Hamoa is compatible with SM8550 - just because they
have the same USCI quirks...

>   { .compatible = "qcom,qcm6490-pmic-glink", .data = &quirk_sc8280xp, },
>   { .compatible = "qcom,sc8180x-pmic-glink", .data = &quirk_sc8180x, },
>   { .compatible = "qcom,sc8280xp-pmic-glink", .data= &quirk_sc8280xp, },
>   { .compatible = "qcom,sm8350-pmic-glink", .data = &quirk_sc8180x, },
>   { .compatible = "qcom,sm8450-pmic-glink", .data = &quirk_sm8450, },
>   { .compatible = "qcom,sm8550-pmic-glink", .data = &quirk_sm8450, },
> 
> 
> and in battmgr driver we would need to do:
> 
> + { .compatible = "qcom,glymur-pmic-glink", .data = (void *) X1E80100 },
> + { .compatible = "qcom,kaanapali-pmic-glink", .data = (void *)SM8550 },

Looks good as well, and shows my point of why Glymur and Hamoa isn't
"compatible" with SM8550.

>   { .compatible = "qcom,sc8180x-pmic-glink", .data = (void *)SC8280XP },
>   { .compatible = "qcom,sc8280xp-pmic-glink", .data = (void *)SC8280XP},
>   { .compatible = "qcom,sm8550-pmic-glink", .data = (void *)SM8550 },
>   { .compatible = "qcom,x1e80100-pmic-glink", .data = (void *)X1E80100},
> 
> 
> I'm wondering if instead of making changes to both the UCSI and battmngr
> drivers, does it make sense to just add a compatible for X1E to UCSI? I
> briefly discussed this approach in this response: https://lore.kernel.org/all/481ec137-87cf-4448-99e9-4a1477f4854d@oss.qualcomm.com/.
> With this we could instead define Kaanapali as a fallback to sm8550 and
> Glymur as a fallback to the x1e
> 

Yes, this would be better.

> Binding would instead look something like this
> 
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> @@ -29,6 +29,7 @@ properties:
>                 - qcom,sm8350-pmic-glink
>                 - qcom,sm8450-pmic-glink
>                 - qcom,sm8550-pmic-glink
> +               - qcom,x1e80100-pmic-glink
>             - const: qcom,pmic-glink
>         - items:
>             - enum:
> @@ -38,12 +38,18 @@ properties:
>             - const: qcom,pmic-glink
>         - items:
>             - enum:
> +               - qcom,kaanapali-pmic-glink
>                 - qcom,milos-pmic-glink
>                 - qcom,sm8650-pmic-glink
>                 - qcom,sm8750-pmic-glink
>                 - qcom,x1e80100-pmic-glink
>             - const: qcom,sm8550-pmic-glink
>             - const: qcom,pmic-glink
> +      - items:
> +          - enum:
> +              - qcom,glymur-pmic-glink
> +          - const: qcom,x1e80100-pmic-glink
> +          - const: qcom,pmic-glink

This matches my expectations (all three hunks).

PS. We should remove qcom,x1e80100-pmic-glink from the grouping with
qcom,sm8550-pmic-glink, but let's do that later.

> 
> with the UCSI driver change just being:
>   { .compatible = "qcom,qcm6490-pmic-glink", .data = &quirk_sc8280xp, },
>   { .compatible = "qcom,sc8180x-pmic-glink", .data = &quirk_sc8180x, },
>   { .compatible = "qcom,sc8280xp-pmic-glink", .data= &quirk_sc8280xp, },
>   { .compatible = "qcom,sm8350-pmic-glink", .data = &quirk_sc8180x, },
>   { .compatible = "qcom,sm8450-pmic-glink", .data = &quirk_sm8450, },
>   { .compatible = "qcom,sm8550-pmic-glink", .data = &quirk_sm8450, },
> + { .compatible = "qcom,x1e80100-pmic-glink", .data = &quirk_sm8450, },

Yes, that looks good and if we inherited the quirks from Hamoa, this
looks correct to me.

Regards,
Bjorn

> 
> 
> Thanks,
> Anjelique

