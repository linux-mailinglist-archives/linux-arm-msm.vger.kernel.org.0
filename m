Return-Path: <linux-arm-msm+bounces-94167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4H5KKeIVn2nWYwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 16:31:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A330E199A1C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 16:31:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BD3F7300C57A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 15:29:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 098CC3D4101;
	Wed, 25 Feb 2026 15:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ULoAFdpi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8552838F93A
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 15:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772033393; cv=pass; b=WmjViPJQJ9kMFGA3RxmIdUiARpo/abJ6W36dGUwaV8W2k8sypWVkdOsYiq9baVrFljtdwtFg6cHn1VS1F5niQ50Qn6CfZh6LUEB+XGQEqrqooD6z8wx5UzJKPvCfBE8j8J68fOkaw6YbyXiq0aRIeW7Swu+v/TO0xuIQiRTyaz0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772033393; c=relaxed/simple;
	bh=u/XeSMUqb9IOuw2BbeJMaDTmkfUVpHYV+B4Ama/bocE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eB3KSZPzeR4iN75Cn7LL0l606TchLbNtk/dunUQIP2Ho11NcSPO3/eo3SUES3xArzIgJRYoDDqYnGkkxdjJWE8NQKFtcnGarA97CtSxSIpDCwbQIoBZYw38aw3qY5yVnO9st8RpToVYAM5f/vldG8EuugwGIueVanYzXbosCyPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ULoAFdpi; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2bdca815fdfso924251eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 07:29:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772033391; cv=none;
        d=google.com; s=arc-20240605;
        b=WZHCEE730ze0jV2QGcg5CaCdirjjw81flJmADccUWQyclv2hZ/rl0IZ2mdlimv4I3O
         Jeh7v0ef0nVWDQcnSXMRo1V9IxBZ/+j1jX/bIH+OQvmnlp+lbmpURzhj0LZM3E2ZC8Xg
         lPQWU0VlRGjt5y9V27uJ0Ykz/vf/XgbwzC2Gxo4Xz+id92Nua+807p0bWvvtiK7akoyL
         +Z3urgOvwvydy/aJgpz1y1eKbH5XUrfUplpkFUPc5XfEYs/jijgtCguDshyL3hsD+Lec
         6L5/XHjna6cYnvMKQll4O/5sgAkfFr6olHfb/lcfoe+PRmbF/4EFyHBbEI14gAQPwAuI
         Mk5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bQ5YNTgeCggafYTqJ1Vg5khBu90oyOTzWNTsAXkO2LI=;
        fh=1OZu64VTDBVgnzTY7AMqhS7wBFLIdIVGEUw1F8/pVjI=;
        b=ZOExLPCptIKjhUbR9U5rpQiA/sKWQLjDGQJgeHuw/jm3cMwPjPp4ItnUsh+44M0ebr
         sTUPC4iKfy3wVJnyyyYe43Q4Luc+aPOIJGbpW3WdZH3XDTHgnWe7xsQqPynjY8P+RCD6
         rK5zwvLt+cNgrhwaf6HMI6FEKlgUh8AWYnWfP2lcZbzHT0D23GfoPDQmMvZnzi5a0qCc
         NYd6aGFS2O1ubbTS54pBCruA0Ku7/CYDfqfX3X9rYB9ZIg0McL/9axT4OKxR96+f2k6C
         IQ0xZ7UxrKgtX4J5yfBsBezmF9MNncfghYTk4gkXOFM85NtTO0KOlMZj9N21N/qKiJyM
         zaGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772033391; x=1772638191; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bQ5YNTgeCggafYTqJ1Vg5khBu90oyOTzWNTsAXkO2LI=;
        b=ULoAFdpioDFMZ49TqlWLib9jDA62WPaW0A0pCwzTheJfbATd7PZt065H5hPY0OW2tC
         hGyQlcTi8dzso8tGQXPa0//UbM5fGPRm5dtYj1QIMvMTz8+xi4dKw/ShJHEhuwspRZbn
         zhrWgBbWKIL2q1RTa6Jrp6C17uKDwA8WCk/74v1T+aqzc3l27oaxzYwgfHC8oGZaI57s
         9b6begc+QULIubKPupGJ834h0Zuwpn/siAHpHoclxC/Edl2DGbi5sONmEhaNHQjEHc+o
         vAAUdDXvyMyDyBqZ72xP+BWvWHoir57OtOK1WgUuldgBCU8zrIIFqUCryIKmunjmUM5N
         sZ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772033391; x=1772638191;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bQ5YNTgeCggafYTqJ1Vg5khBu90oyOTzWNTsAXkO2LI=;
        b=RS7v4smR87lRr2nACnn0nAutGa9YQ/Jr5Gf/6zBwfLBDrMvs70mWen6MKOQQyychOc
         AgUvGhfWMeqUKPr9uYboV9+WQMmoR54ro+L3bpNkZJbg2qS6gm2TSwqRdvA2uK0u4JzU
         axWrteHbpWd0Y6jzDkpXX00MEnV0E8x7S80ch1syowALK1Wl0BSv7vnR1pJDrkW8AAF0
         xsp8gmYlw5Z98ffx4BfOY40dNrPvKD10TFUngkIjnh/bPeP2AT+deQjBR0rBa9TtQZW5
         TWiVzMJgiRXB1vENRjqG0J4XWitynnkGaFZE510kXp9KbUSCj3CfszGZHEyDfgQ5TM8l
         yFGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeS/DlzQ4zdF99t26sPNUlD3uqoAP7G80q8Q7f5uoF5zeBHbNvz5Q9P0bHmTlsCTqnXlwX/0qdKIPc9gz2@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn2uPSVZg/0+qC9amPqwsDpp8ScRGbEZ6HFIFIJzmaQHPqCGjg
	gQ+JpkEzuVXSbt2MZbPysq9YEDTuDjkp4Lc7voQVU88XOLHQ9tXe9Lw0S8cT+DDqDvs2daSrxSg
	BxiF3mhYz2Y7xPrCsGPyOc+xl+QBmBvI=
X-Gm-Gg: ATEYQzyXoJ7Cz9wv5BsChepKYRI1ukLa/jynQ+2cG+RkcN3wgwlErorfoJ6f4BCE9R3
	hkQrpexc0FrXiaY4YXcZiZB2J5uTTzL+3POnkgmsgHlMlTp7Fw2UU4AYqBXH2PodYUCXsXU0tAR
	vksoH/OLfh78m2KsaKEBqiHVa0WG/AFbobggVpBYaHfb+RIUJijZybmsi6YbGPj9dOtqryY27P0
	ftGTnJd9m9vPJIqB6w+MSCnjbJvd8R+haC7SoGgFU0OIm2tDf+nRzzxoj8+4V54jHQQvjB3BQVH
	DIHA8XU=
X-Received: by 2002:a05:7301:4090:b0:2b7:112:42af with SMTP id
 5a478bee46e88-2bd7bb4b16emr7182670eec.12.1772033390504; Wed, 25 Feb 2026
 07:29:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223-panel-patches-v2-0-1b6ad471d540@gmail.com>
 <20260223-panel-patches-v2-1-1b6ad471d540@gmail.com> <20260224-bulky-rabbit-of-courtesy-83fabc@quoll>
In-Reply-To: <20260224-bulky-rabbit-of-courtesy-83fabc@quoll>
From: Yedaya Katsman <yedaya.ka@gmail.com>
Date: Wed, 25 Feb 2026 17:29:39 +0200
X-Gm-Features: AaiRm53vrrlGAFjFL5krtfYKIvvyN9BeLRAbF1DkgFNXMhAuE4jNnWbMUA7sWZA
Message-ID: <CAHuF_Zq=Rpg0HoRJv-BSREEhT8tYH4r+BCbZ7obrG36vSmwMQA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: display: panel: Add Samsung S6E8FCO
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?B?S2FtaWwgR2/FgmRh?= <kamil.golda@protonmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	~postmarketos/upstreaming@lists.sr.ht, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94167-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,protonmail.com,lists.sr.ht,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yedayaka@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,bootlin.com:url,mail.gmail.com:mid,protonmail.com:email]
X-Rspamd-Queue-Id: A330E199A1C
X-Rspamd-Action: no action

On Tue, 24 Feb 2026 at 09:27, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Mon, Feb 23, 2026 at 10:26:20PM +0200, Yedaya Katsman wrote:
> > Document Samsung S6E8FCO 6.09" 720x1560 panel
> > found in the Xiaomi Mi A3 smartphone.
>
> Please wrap commit message according to Linux coding style / submission
> process (neither too early nor over the limit):
> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/su=
bmitting-patches.rst#L597
Will do in the next version
> >
> > Co-developed-by: Kamil Go=C5=82da <kamil.golda@protonmail.com>
> > Signed-off-by: Kamil Go=C5=82da <kamil.golda@protonmail.com>
> > Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
> > ---
> >  .../bindings/display/panel/samsung,s6e8fco.yaml    | 64 ++++++++++++++=
++++++++
> >  MAINTAINERS                                        |  5 ++
> >  2 files changed, 69 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6=
e8fco.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e8fc=
o.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..8c042ce5f65bf317df48e10=
9d88ebdc87ef5d5ed
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e8fco.y=
aml
> > @@ -0,0 +1,64 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/panel/samsung,s6e8fco.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Samsung S6E8FCO AMOLED Panel
> > +
> > +maintainers:
> > +  - Yedaya Katsman <yedaya.ka@gmail.com>
> > +
> > +allOf:
> > +  - $ref: panel-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: samsung,s6e8fco
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  vddio-supply: true
> > +  ldo-supply: true
>
> LDO is the name of the type of regulator. Why is it called as name of
> the supply?
Can you explain more what you mean? Do you mean to change the name of
the property? It seems that all the regulator properties are named
foo-supply.

> Isn't this binding exactly the same as s6e3ha8, s6e8aa5x01, sofef00 or
> any others?
Yeah they follow the same pattern. Is there something missing in this
one? I will add descriptions to foo-supply properties
> > +  iovcc-supply: true
>
>
> Best regards,
> Krzysztof
>

