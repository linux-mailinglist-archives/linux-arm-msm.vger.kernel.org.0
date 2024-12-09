Return-Path: <linux-arm-msm+bounces-40983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2813B9E8EF6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 10:43:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8471285D2F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 09:43:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3DA22163B8;
	Mon,  9 Dec 2024 09:43:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6EB216393;
	Mon,  9 Dec 2024 09:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733737402; cv=none; b=f8hiUY4q8tA2S50H/6eX5b4ResJhkbSic9xm1aR4EFxi3UlwMUbXpoyDlJAekQ7bRVwkJod7GQYReSxjeYHUpjeDoKV7KF0opZ7c+fimtnRRRH1kGasDiHVmVpe2gfVb2l/NNf8ylfaudlAWhbntCg3nhGgbqRjoLLxoTVVk6Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733737402; c=relaxed/simple;
	bh=nTQf+8Bm+nLKmOhcgiIR8Rb3stUH4S6+wbtV66aWlbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XF6fa4UaoTajKsMlwG0+sfFQtD3tswEwb4rbowFPVauVrdA6n+IIFB/fcvyfjEQNpGSYt6lNRObUlmG139QooD2OVUj8IWbN24IMdwaRiiKYCTcmZgy7uYudATjpzGMPQ5Bjdfw9pp1UBQrc2x++wPlzgXwHasygSoE9r88Chrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95C76C4CED1;
	Mon,  9 Dec 2024 09:43:21 +0000 (UTC)
Date: Mon, 9 Dec 2024 10:43:18 +0100
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Dzmitry Sankouski <dsankouski@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: codecs: wcd9335: Add define for number of DAIs
Message-ID: <aibjwqdjq7h5in7otsbtrnj67yrv3m4aegvkuk6ljwxpx57ayy@f7fowpequede>
References: <20241205084021.35610-1-krzysztof.kozlowski@linaro.org>
 <c3d2477b-f12a-47dd-bf95-927e6c0d8fd5@sirena.org.uk>
 <CABTCjFA9DyRzca93qoS5_+sfc2RLfNVNqN14WVfKODjHykwGJQ@mail.gmail.com>
 <08e07421-8a9b-4535-9cd5-9383ca9024b3@sirena.org.uk>
 <CABTCjFB7XiR6_+r375h0fJipA+OC2i94ruTG-sWB=s=0qYRReQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CABTCjFB7XiR6_+r375h0fJipA+OC2i94ruTG-sWB=s=0qYRReQ@mail.gmail.com>

On Fri, Dec 06, 2024 at 11:42:24PM +0300, Dzmitry Sankouski wrote:
> =D1=87=D1=82, 5 =D0=B4=D0=B5=D0=BA. 2024=E2=80=AF=D0=B3. =D0=B2 16:31, Ma=
rk Brown <broonie@kernel.org>:
> >
> > On Thu, Dec 05, 2024 at 04:29:45PM +0300, Dzmitry Sankouski wrote:
> >
> > > This is the 1st patch in series, and NUM_CODEC_DAIS redefine from bin=
dings
> > > is deleted in the 2nd one.
> >
> > I know, that still means this change is broken.
>=20
> How to avoid broken change, when moving constant from dt-binding to*.c
> file, given we have constraint of separate patch for bindings?

There is no problem here, I just screwed, because 6+1 !=3D 7.

Best regards,
Krzysztof


