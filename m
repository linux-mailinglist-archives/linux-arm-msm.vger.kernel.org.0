Return-Path: <linux-arm-msm+bounces-53351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CBBA7D993
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 11:25:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94F6C17966B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 09:22:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A5AF233149;
	Mon,  7 Apr 2025 09:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="WIuUMTLG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC1B22FF2E
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Apr 2025 09:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744017692; cv=none; b=hI/ObTx4FWppok59BcNFPeQLXO7nDLSHhjs1H9UzW61AdCJsrUZ0Onymh3EGP3W0AQDM/1X7/Ppa+5y3dGOFN+z8JQ+4axbo3ELy51HHU7yPSBLfL/yp0ZmlcACsZEhxMzyVE9zgfkhpw/MyIjXO7Mgyk6vDUyDcPIPdMTNeag4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744017692; c=relaxed/simple;
	bh=iSlSsIy8a8fjMFvyVm2tJ7hdd5DE5BK0cDXC7vabG8I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kDBZIwXOSLpQTtN1fkhTT0uUjKED3F3TOPf3pAvQx0uCpxcTgPPp3xMyHYUsj9jwDIQoeEo+H/vXVvvPFzkRtryv/jP0+Grb/eYgWgNdFmKZkTRJyCUaAyNZq5Hi5V6x07wGhIGGJkqiKU4dlPMtbwrXm76YGoeV2MM0U0QLM+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=WIuUMTLG; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 869493F472
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Apr 2025 09:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1744017688;
	bh=HEaLDYOXOEmeBww1pBLiPCAb16rSoW8x0h/ino16yYg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=WIuUMTLGpRNmBVTi2DEEHlyZ8A2QvCOQWbbsGFmuLYqIBZh2e9FRYRaJrRBLTKfw6
	 UE2fSkSBJWt0nnRwQl24YzMG5uwCIH48j9zADGa4HM2c7SNjXm1QC/jrLkH7qe3T5v
	 VMNF/rFebHSa0twMcFJ8sTEeoxV9lLcFn61kQGqFlinW9S3yjG4bWAEzaXEoGXpTSM
	 YEy5oVfmFLJgvaJw62i2UT4rQDhT9EpDBKWcJEUjbA84Q1+VNBAWf6cQdiB8WWLNYS
	 zt1qlJ/L73RLKmTjFvwPwi22Qw/8K0+WPmMMDX2ZQvJwbKaGQLHer//ifwi+j6/oMT
	 W6pZV1aalPnMA==
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ac2aa3513ccso352175366b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Apr 2025 02:21:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744017688; x=1744622488;
        h=mime-version:organization:references:in-reply-to:message-id:subject
         :cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HEaLDYOXOEmeBww1pBLiPCAb16rSoW8x0h/ino16yYg=;
        b=aG7bmgx9yA9gKt9flVFMN7N33+S4j/sqPsKS12FuyYJm0/eNW7tHASVQv3vATBnaGp
         m3xLDniYhXv3HYwQVYVsN4Kgr6te9CHSsnU0m6idCgsKuWlZCCqi2HREhhA6zptp9HX0
         uALMCkBJ/nb588/mvJXw+zPgcux0YecFNoS/uIidi/BGed+x0bpn+C5x/UX3NjRrqz8Z
         BJ5qlIbQGv5Qqh82393IGHyQfhURw+LfVkRhpTUJkNuepg4GwY0n26W1vy7y5qKeKRzP
         i96EFLuCs62rYgtOxFpKb7uhGy7OqHwY/9FZUB31fgExcVFhBeX5/jlALcdJlVqR9DSM
         SDCA==
X-Forwarded-Encrypted: i=1; AJvYcCV2jlmlJRIN+10QaXf8gSaLkNkou2/e5x1hv9W/EI7t1qIOW+6Co05COUftUJ6MhCuKhDC37D/XGWfx1MTw@vger.kernel.org
X-Gm-Message-State: AOJu0Yz01EzjX5qGfnkp9xQWI0rjEzldWan+s+OcdDgXZ+1KPIKrG7sH
	m/Zj2+YEif6wTuIeCgSswk2Xsw+0VDK5dU5sX3zL7D6s47sbLn1OdnFnznQ1yDdToD55Bgj5WCk
	pgPSD4Am0JdRqYppDWpMC8CFmrQHgsJ//Y+2mOV7CriBQjvl2nAgMUEgkuThL7GTrC2E127bEyX
	dxehxdZHA9LJM=
X-Gm-Gg: ASbGncul9w0RrGrm+O+h1LsWw3MLGL4OKCQVkWg4HlWvn3p6ieUVDvAUoC9GEXg4RTc
	/vl9j3CnZJmxobrNBSg9V89d1VC81hSGZM1SY6qJgiNpfxAVA5yo4ANP2nouURIcKLYsxWAi//6
	eU3G83+AF8iBNE56BdCHIdkBZ0aiHvnlvxvHO/sxDhzcW0HWwJgRPn8UucvlY4UZPIQvRz0Iygz
	7D6XD6norHmxsg1sANWqihH7EhbdRifM7pnnYagZpOrxanqZOhQ8ZIZF0s9F5R/cGnh8h6u24z6
	tVEwJbyEFPXdj+Zaj9w/8VYTIvnlOkH02yFaZOSxJ9PrhXczfZ/EkcN+
X-Received: by 2002:a17:907:da6:b0:ac3:24bb:f1ca with SMTP id a640c23a62f3a-ac7e71704b1mr706494966b.7.1744017687894;
        Mon, 07 Apr 2025 02:21:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyEZWiuDaF2JJ5GJs6D6+FEn383IkKkAsNepFXIH0X3u6o9dK8jmGaIJRw6XAhqqRc3z+sng==
X-Received: by 2002:a17:907:da6:b0:ac3:24bb:f1ca with SMTP id a640c23a62f3a-ac7e71704b1mr706493566b.7.1744017687557;
        Mon, 07 Apr 2025 02:21:27 -0700 (PDT)
Received: from gollum (151-243-191-194.pool.dsl-net.ch. [194.191.243.151])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7bfe986a4sm714636166b.39.2025.04.07.02.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 02:21:26 -0700 (PDT)
Date: Mon, 7 Apr 2025 11:21:25 +0200
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: Rob Herring <robh@kernel.org>
Cc: andersson@kernel.org, konradybcio@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: qcom: x1e80100-hp-omnibook-x14: Create
 and include a dtsi
Message-ID: <20250407112125.65f22dd8@gollum>
In-Reply-To: <20250404153339.GA1463808-robh@kernel.org>
References: <20250404090108.3333211-1-juerg.haefliger@canonical.com>
	<20250404090108.3333211-2-juerg.haefliger@canonical.com>
	<20250404153339.GA1463808-robh@kernel.org>
Organization: Canonical Ltd
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/axXhoG65m197/2vTrG.U=7j";
 protocol="application/pgp-signature"; micalg=pgp-sha512

--Sig_/axXhoG65m197/2vTrG.U=7j
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 4 Apr 2025 10:33:39 -0500
Rob Herring <robh@kernel.org> wrote:

> On Fri, Apr 04, 2025 at 11:01:06AM +0200, Juerg Haefliger wrote:
> > Create a dtsi for the HP OmniBook so it can be reused for the HP EliteB=
ook
> > which seems to be the same HW.
> >=20
> > Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
> > ---
> >  .../dts/qcom/x1e80100-hp-omnibook-x14.dts     | 1554 +---------------
> >  .../dts/qcom/x1e80100-hp-omnibook-x14.dtsi    | 1557 +++++++++++++++++=
 =20
>=20
> Just include x1e80100-hp-omnibook-x14.dts where you need it. There is no=
=20
> rule against including .dts files.

Ah that makes it easier. Thanks.

...Juerg


>=20
> Rob


--Sig_/axXhoG65m197/2vTrG.U=7j
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEhZfU96IuprviLdeLD9OLCQumQrcFAmfzmRUACgkQD9OLCQum
QrcITA//YRlVT5IeMhh8Va/712MvwiTgJtdw+bN4W88wwrIt/RuZ/q+KWNx6kN7U
JvFeBZ5lOY3A9ncxWmoGO9b7vX3lqdqVbvDzsSyEUQi6feuMRgIY7SAaY2uSH6lB
C6HdmuhczWpYyWfkzSHV3A+LBXXnY2joO17fEWsHnEDa3zQOgmpUJ9to7ZF8jjSH
zVXDkpPw+GJSPDaiEHKicnzzf87i4hETEa0KB5kbGxNfzhCpmjpdFv2anvt9Hj2J
iYzK0guG7yZTpQWrilOdkVuhbyG2ZLRu2xn2VF7QtvJ3kpRkKQFmUUEovnWSyEdk
OLAzOG69frF/FN42VpSJb9pYvniWEPi5EvrluBZRK3L8G5S2F6kDucnWTnjBWw3/
P+1sUu7bTYsE3f2dF0dNluKy75a4d5f5GKlMO5luFCJ+hfunyESdfG35j6EcbgJ3
xnNecFC3c9CDIZi7UcdO+voQjaZGRd0e4riyq2b0VzVyOyFmgapkmim82e/C+5Np
CdrOjF5rlPN1xqdd7lRPKNIJfQ+zjRUngP5nYy85aDDdJF/YVxjMNuTAPeWKC2W7
o4B/6MWWsCxDkbee0QovnKRt0pT0raj75OinNE19hj+10PriZRVOTAvgSqGuowUr
HtChUgr5t2NMaE0xToNIl5IgShS981+YEZpvbjRa4/Kjr2q3eTA=
=rZfb
-----END PGP SIGNATURE-----

--Sig_/axXhoG65m197/2vTrG.U=7j--

