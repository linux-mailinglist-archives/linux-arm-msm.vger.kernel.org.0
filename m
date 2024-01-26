Return-Path: <linux-arm-msm+bounces-8391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEF383D550
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 10:03:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE9061C25201
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 09:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E6BA11CB9;
	Fri, 26 Jan 2024 07:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Xg8LrfSr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6971A12E57
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 07:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706255369; cv=none; b=sTZ7oJAr/EQb9TVMmsiO3BWVK2TLgGzy9T/b1yY8laDB5Nkr/TWX5aZRGVQCybiAZ16CFKuj1hk++bLXkURVBH2BZ4dgwDboPdxrwJ3SAX5BsoQ2SUrzIUn860m6ovUe2Xolc45/S2YK3lG4pOZZsXXAbHZDCXltM+9nn2qPYRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706255369; c=relaxed/simple;
	bh=X2bIO9XhEirZtwD9+aodGW5ANv8mY0gQ8ZSBilmbmQw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=K1K314TJwTE+T5TOWhvCfQcYXzg5IF2ZefEm/xbfMZEocP9u/LNxASezOx5spNAkdUFXPnif43/alE7oDsEFLhSNmQ7oSesmKOH0vPlSdPu8V+nUTqON17Nq8df4c79OOrZaR3wcxadmU8ncuNM6moACDO8MKpChO2e4oELpzaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Xg8LrfSr; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40eccf4a91dso1106435e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 23:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1706255364; x=1706860164; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kMLN7Rz7MGbuTKXXFDmPa4TaxPrxTUAEjlgxCmYMMqE=;
        b=Xg8LrfSrTfG+6F9AcL2BEdD+PT6M/m6/NLrgDsrXNzieaZdMEoh28ikO6laScNDyTU
         JpIa+sq5l4WtC+5bcJLahUy2bJgc50mPzlEuJ60cxFujbqVXN3DWn7WBSVvicN7dlbsV
         c6zTl3b47JYmnLt3zDz6T2mhCPtlmyzkCvghJzmUWMxkdsKQ6LcBOJeWXp33+6c222BC
         TV4IMvL15PNDHAlstro6zZDMm1iRxrwFYB4X+2NzmaJIowsYcFz0tHSfbvQ7Pwi00ZYd
         SYCQykrjxNHNfbfRUQW5+bKGvE2GypDHmfxkLjIyJKcwC9C5iNoHhk3eTk5lGISDKXsR
         fvig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706255364; x=1706860164;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kMLN7Rz7MGbuTKXXFDmPa4TaxPrxTUAEjlgxCmYMMqE=;
        b=O1RkPB6IkMFtZQHTNks6/lb8nWWlN+WFDEvqzGe1MP4vp8pLDAChPQYdVTNY1MknCT
         ObuLBeGesAIApPPa+eNZ+OdaFksQ0xGl+rmkDcF/JE7wT3hwJVHlk49a7gUxg3+bAhem
         Kt3PB5y1csv8DbLsQYaeTKBLHUaE6d77wtC16xJTRAki0v8D/bGdS75lcKnR4Tfj5c5H
         QWeursej+XQe2CNJEiapp84TIc6EWjkaKTNgcIbG/GdPrZwvjGL5awRtTPuUzuzkPTIa
         W8uXv0Yg2PiwljhIDxJdoQwrxzxx0gxxEnYGQY1bEBe+2vMEb/dTJ+LjHXsThHYzwrix
         8PoQ==
X-Gm-Message-State: AOJu0YxE/cCe38fFkl2xVbw3v4jOcwYfX39cza6fazXQ7GvJXr2Xm3Bi
	cWbD9YRcHtwaLCxm1HJ1XqATlrbYMSUMIddJMkjAoIZvpGqbY/4Pslnn7k1YrIE=
X-Google-Smtp-Source: AGHT+IFY+1BBYpedT+Me5GvLK2bkjb5tnsE8ri1rpr97wJTETbTwBLEoVpQ9JMBcAskBjVDXMlocoA==
X-Received: by 2002:a05:600c:1913:b0:40e:b0e8:ee96 with SMTP id j19-20020a05600c191300b0040eb0e8ee96mr547389wmq.122.1706255364640;
        Thu, 25 Jan 2024 23:49:24 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id tb21-20020a1709078b9500b00a3025e05665sm350745ejc.14.2024.01.25.23.49.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jan 2024 23:49:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 26 Jan 2024 08:49:24 +0100
Message-Id: <CYOH1P74EWQ0.5TZX1F88C8XZ@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: sm6350: Add tsens thermal zones
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@linaro.org>, "Bjorn Andersson"
 <andersson@kernel.org>, "Rob Herring" <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley"
 <conor+dt@kernel.org>
X-Mailer: aerc 0.15.2
References: <20240124-sm6350-tsens-v1-1-d37ec82140af@fairphone.com>
 <da281c50-9dcb-46d6-8cb1-ef4662e24a9e@linaro.org>
In-Reply-To: <da281c50-9dcb-46d6-8cb1-ef4662e24a9e@linaro.org>

On Thu Jan 25, 2024 at 5:30 PM CET, Konrad Dybcio wrote:
>
>
> On 1/24/24 16:31, Luca Weiss wrote:
> > Add the definitions for the various thermal zones found on the SM6350
> > SoC. Hooking up GPU and CPU cooling can limit the clock speeds there to
> > reduce the temperature again to good levels.
> >=20
> > Most thermal zones only have one critical temperature configured at
> > 125=C2=B0C which can be mostly considered a placeholder until those zon=
es can
> > be hooked up to cooling.
> >=20
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > ---
>
> [...]
>
> > +		cpuss0-thermal {
> > +			polling-delay-passive =3D <0>;
> > +			polling-delay =3D <0>;
> > +
> > +			thermal-sensors =3D <&tsens0 7>;
>
> cpuss0-thermal and cpuss1-thermal are very likely the sensors for
> cluster0/1, can you test that out, perhaps with corepinning+stress?

Not really, according to my docs the CPUs aren't placed symmetrically on
the SoC and cpuss0 and cpuss1 are just somewhere inbetween all of the 6x
LITTLE cores, the 2x big cores are a little bit further away. So apart
from hooking up all of the cores for cooling for cpuss0 & cpuss1 I don't
have a great idea what to do here. Shall I do that?

Regards
Luca


> You can then assign multiple cpu cooling devices.
>
> LGTM otherwise!
>
>
> Konrad


