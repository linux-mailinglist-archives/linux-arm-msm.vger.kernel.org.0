Return-Path: <linux-arm-msm+bounces-82461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BE6C6DA39
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 10:17:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D82F83A2EE8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 09:12:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E411336EDF;
	Wed, 19 Nov 2025 09:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b="SqizxynX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFCB333434
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 09:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763543482; cv=none; b=Pz6gs4i/G07D/83oJWzp5vucPBjZQomXGeecwtuTbAuUeQK63cno2tR0s4NZZUhUH/url9bvzdvKBgeuBMpT9rJyB6JBsdymGIMXQUTJ9b0Rzc4eLi7Q2wrRZjmNai11OjOKP1zJ/j1nrOAdzkx6qM5w937iBWWwXGVnAm7UJuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763543482; c=relaxed/simple;
	bh=8mU4ut9Xtv8ppJaj6RvfY2g7TpvDfeb9Tu6G1ZJZNac=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bbgoi73xZpMJpe3ZdbRuQo14ljArbX20bLb+offK2qlRSjYXfH62ilmrKUNvkUkXaqSYrtJPHp0NJbgYKvQX7Ia7hmXbQwJxagrgWDGWXCMb+D8Rxqs+SSRQbs6KwxBxCNL/zAuJqwhkXY2yqM0OtcgY785pnoiLFMes023RKgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc; spf=pass smtp.mailfrom=arduino.cc; dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b=SqizxynX; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arduino.cc
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5942b58ac81so4990260e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 01:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arduino.cc; s=google; t=1763543478; x=1764148278; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TTTF42fHK5mGdQSQ9elb7+2UnZ+sckGT0/TBrhCYXmM=;
        b=SqizxynXEkob4WzS3EJpXtPTvihvF9tYg89Xg21iEj0mQ5e22OWkccRm69QTMWwIHn
         rL7tm8AcEHdJzf1vLjSjH874v/aKwAt4BjsmhwEsBOEMo8LL15TuRlXGwlZLIHYptEwO
         O9hORrEqQoHXEKOj0hGBgevFKqxCJ7YvoTFME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763543478; x=1764148278;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TTTF42fHK5mGdQSQ9elb7+2UnZ+sckGT0/TBrhCYXmM=;
        b=LqQfcqpQOc5ZWZ9eE9qx6EBA8fIiyY0+E7R9lLgpDo9noPbgYo5NdrOvk0ilBAop8/
         lFrb0opzxSUIRx1cn8cys0NsBh9iVvE3RjPUNEAZKJBY3cRzt/Y2Vmrt/pKz0VplmdSa
         mSPilRu/g/BhFWvF/cnwU91e5LmMHjKyH3OKoLbXiMupEP3DMsxE/5ZZv/vcFmSrBjaC
         ElLrexuy6mhDCvA21WZgn9ZlWgt103i7jkocypV6JxUjRdiKFK4RpLaxz3m9gxNAnoo3
         D0ixDmS46QEn8+PmMipTP4VA/vkCVFho4gt4ONfXN3Q+Gr4HhWRsRUSBsVWLunFKEdqM
         8qoA==
X-Forwarded-Encrypted: i=1; AJvYcCUQyhwFSoC1YdWBGBNe2wmgnNMEncpvAQ0fZkLbb7TCPtjLrG1XHY1i3aV/EZweZ6SwFA8pnisrkvPagIlj@vger.kernel.org
X-Gm-Message-State: AOJu0YzNuhlxHHbROfXX12hYchCWaxjtSUVfDBxjofxDIJOFELFWovwA
	CjYVOdteA4+EmfoCVvkZmcxt+iSEojF3CcmQw2uSPlrw/ZvveoH+yO1t4ZMS/P5k3cpHF1xjNWP
	C/f0VGdvlG0FnhcZ4v7GWWFTSIKWbrzijfrLfaeBZAgJWxTOqzmCN
X-Gm-Gg: ASbGncsgVVAKkpgz4SS+tZjENXA4D9V8kW32yMvHCkS5u8ev+tXaExQs6ZLpI5djc+n
	u2Rtbd5l6gJTq/+Kg5r+Lw8IsYdSO+IgQEXsp45VtmRDIP+0D/Zu+xtjYZLahZRrTsZowR2/D7X
	90XFG1jzqCYuI8MlVjKJYBMJeWPj8d84JSpclagFNQwvmCGBG8/ZbX3ilWWB2am5cBCmKtT+SlY
	MigfRWu5ZoKG8nk+liHr4iHjUGGQsGv9HuCa8pzXwA/DyRk0Jh/fHw38eaNDXuY0mviQRYO
X-Google-Smtp-Source: AGHT+IGUbmXRNV8j6kxI8Xn7Sl5eUfTFpf8w41GTfqJnIcWHEeTQ0N7Q5jnCCd2iqGfQtnpuBxHOO/hGyXAlFCmqfu8=
X-Received: by 2002:a05:6512:3e02:b0:594:34ae:1446 with SMTP id
 2adb3069b0e04-5958424f6a9mr6235982e87.41.1763543477881; Wed, 19 Nov 2025
 01:11:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251114121853.16472-1-r.mereu@arduino.cc> <20251114121853.16472-2-r.mereu@arduino.cc>
 <5c30421e-108a-41de-81c7-c0c5e5290cc1@oss.qualcomm.com>
In-Reply-To: <5c30421e-108a-41de-81c7-c0c5e5290cc1@oss.qualcomm.com>
From: Riccardo Mereu Linux Kernel <r.mereu.kernel@arduino.cc>
Date: Wed, 19 Nov 2025 10:11:06 +0100
X-Gm-Features: AWmQ_bnNqwRxZncGu0OHJ90obULTPlnvAB2TqnHrw0p7-cDSRsSM1l0RzAquaR8
Message-ID: <CAKA1JhYgUUSQxcvmJPdeLu8S_tO5HUOb2GAhS_zX6jUOQzfm1Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: vendor-prefixes: Add Arduino name
To: Trilok Soni <trilok.soni@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, broonie@kernel.org, 
	linux@roeck-us.net, Jonathan.Cameron@huawei.com, wenswang@yeah.net, 
	naresh.solanki@9elements.com, michal.simek@amd.com, nuno.sa@analog.com, 
	chou.cosmo@gmail.com, grantpeltier93@gmail.com, eajames@linux.ibm.com, 
	farouk.bouabid@cherry.de, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-spi@vger.kernel.org, m.facchin@arduino.cc, 
	Riccardo Mereu <r.mereu@arduino.cc>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Srl (or SRL) is the equivalent of LLC, SPA (or Spa) is the equivalent of In=
c.
Just noticed I was inconsistent with upper case and lower case letters
between commit message and commit content.
Do you want me to fix this in v3?

On Wed, Nov 19, 2025 at 5:49=E2=80=AFAM Trilok Soni
<trilok.soni@oss.qualcomm.com> wrote:
>
> On 11/14/2025 4:18 AM, Riccardo Mereu wrote:
> > Add entry for Arduino Srl (https://arduino.cc)
>
> Is Srl or SRL =3D Inc or LLC?
>
> >
> > Signed-off-by: Riccardo Mereu <r.mereu@arduino.cc>
> > ---
> >  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/D=
ocumentation/devicetree/bindings/vendor-prefixes.yaml
> > index 42d2bc0ce027..07a285c9387e 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > @@ -158,6 +158,8 @@ patternProperties:
> >      description: Arctic Sand
> >    "^arcx,.*":
> >      description: arcx Inc. / Archronix Inc.
> > +  "^arduino,.*":
> > +    description: Arduino SRL
> >    "^argon40,.*":
> >      description: Argon 40 Technologies Limited
> >    "^ariaboard,.*":
>

