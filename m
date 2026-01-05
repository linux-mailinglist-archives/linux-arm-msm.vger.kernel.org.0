Return-Path: <linux-arm-msm+bounces-87405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7F4CF3137
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 11:54:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE1023021E6D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 10:51:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C7622F3C19;
	Mon,  5 Jan 2026 10:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HtppC0V1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F85A330B0C
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jan 2026 10:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767609893; cv=none; b=Jw2+n4Sf+7zaqhcWl+Jf/y/NGA7u8Bb24Zq+GZvp+ggnCye1bRtkzvrLgdKgx4rXgc4hjoEyIEBqfOGeUS16gvpx3vaKW59BGyQTQNr8oPTuDfamM4ixFKWq3hZoUSsMW3RitH+V8WeCgiQrs8TJs1B+P/gCiQ1tvbpH/0YBX8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767609893; c=relaxed/simple;
	bh=YrRC31Ddb3y3jWG2tEbxQRfA1GAM+XHLkS0gA2ZsWYk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LyvgnqEunLNNLg2OwWT5WsDJSzvsdLlmMmeu4fJcvFuUWb4/CyumSq/u1TqPN5usCOMz7+M9efGa0YmHNlZFcn95ryMfAIWv7HduWRU9cBJnw4hAtEdOWPRrJ5u4cOYJSQESsxdHdiG3Ybjgc6q1EaDx3dxMjGM4oAuzCKQgzjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HtppC0V1; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-65cf3d51c95so8145753eaf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 02:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767609889; x=1768214689; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oAaHf6yOWNsJkhvl6QiZWHrv6AwqRWjpGt7OkO97AzM=;
        b=HtppC0V1yh5HVlYFayHotHrT+hTylAjXHdh2zpwCoZm4WC8nmfGkYp3fdoGQg726gI
         xA/HyeNmbON+eNamIrM+HRDSZGihAqsi0ZtwnDILfFLSab/hTFcQ1hlwnSwJp/2aG9oD
         NooaIv+FBC/ID0aDmohnLRZjEFN0TASrg/kFbtABa8EI+UuOC2SmgAgeEHa/2nps6Yny
         DtShXBsS2RhOO1GzOHxE5ultcEy2Zd8wWmtHI3hDLPQBlxkeOwgFrPqjbwyG7zu3Aa62
         6b2Gvb8quAQbh1aCA0ZixxWUDVufm968c9Jtv+RoXP+HsxSGj8TsSAFGBMz8+aRrko5O
         ruiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767609889; x=1768214689;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oAaHf6yOWNsJkhvl6QiZWHrv6AwqRWjpGt7OkO97AzM=;
        b=nk0GKZR88xwYsyBRGnzi0TsEINmIh32+r8BNOO6si6yE3PBIn18/2hDVkghR4D0XCJ
         5dQuhumZLy6Iwzyg/sVWVdHSv1zHT2w6zSkFvUiDKiyfnGn5addWskIcjMJ3LlVwhRhE
         GM3vY6SWucIqmc7Azna5ptfuCmUz3C0oYSfUhjf2Nl604wE/3rWTqt9PjxLHtVodFkhQ
         gXlC0mgJib9Wska2kd5S1CDhXmj1oVkCaFQ0UU/VeJ9fxg0mUWcfyxsFzQdi2Pr1Xp+3
         0UdHgY2PbiDzaC2eRqfkuZxkRNp6joZpr47V80dHeQdvLy57xymXtJQPng+oM6vwEtNo
         VGhg==
X-Forwarded-Encrypted: i=1; AJvYcCUXAcs3RLtksMyMLO9mpGNJISyCdwKG/CGFyeS75WR4kwCKteJipjpvCIyrCT2vLAYR6UZDnBo+D3z2vEqK@vger.kernel.org
X-Gm-Message-State: AOJu0YxZmTJceayaEJek5x6cV6iIhGQAMZSHsXEOiGDjZ7ShkdJ5nYYO
	yNo9pwxAmWH2ISr6+HzVE/9w7ZM2mKHJ5KFuxP/FPaYo9UszGVyvZz7skSDf8Dwcib+ju9kuF+x
	blWu79LeryteARQ9lmwQCxDvp6I8NsSxXtlH7020GPw==
X-Gm-Gg: AY/fxX70cjuwqfQKZzN53UR2sc98cQB34z1PEoq/F1s376byjXaWdXisJ0Ab3u1qi+k
	rbx1YS5bfWNGC6hctSTonigHGSlKYmmZ4XFF8CbjLGBecKFxo8c1RdKKU6bADJ3dlHEYpnWe/gw
	JxI3jG1AieuC9TVTrjkZeNZThqcNKCc417PImErdp3kklrPacb0MPI+nhAf/eEsfkbsOGNpcdlv
	6/IsQI3XjHr1fd3VN89Z71dFEziA3lqZR2LjPH1KN02GlTqfTW/6/U+gnrwPFmZp4wKnfjFt5HH
	Enar4fB7oIh4lRzHSwwF7zg5nA==
X-Google-Smtp-Source: AGHT+IEMgsYCEaejUCdRz1sFVJJFyHx3BrnIrdCUbB11wMQOevmpe/rOaRtrABvM7gz2Me7LPQlUE3P0caYucuHtfEQ=
X-Received: by 2002:a05:6820:1626:b0:65c:f583:d3cd with SMTP id
 006d021491bc7-65d0eab7e3fmr23544956eaf.55.1767609889583; Mon, 05 Jan 2026
 02:44:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251208020844.5310-4-krzysztof.kozlowski@oss.qualcomm.com> <ebaf9e48-07c6-4b00-b773-312e0c9a8e21@oss.qualcomm.com>
In-Reply-To: <ebaf9e48-07c6-4b00-b773-312e0c9a8e21@oss.qualcomm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 5 Jan 2026 11:44:38 +0100
X-Gm-Features: AQt7F2pJVcziQCylElUKsMUche4vaefoDeBwc087wyFI1gv6lzxDTfIojMTspwk
Message-ID: <CAHUa44GU=Hb+L4St5Ryeh4AV-SAWBbzH-npEyek=TT1KPw2Awg@mail.gmail.com>
Subject: Re: [PATCH 1/3] tee: qcomtee: call: Fix confusing cleanup.h syntax
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org, 
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 4, 2026 at 11:42=E2=80=AFPM Amirreza Zarrabi
<amirreza.zarrabi@oss.qualcomm.com> wrote:
>
>
> On 12/8/2025 1:08 PM, Krzysztof Kozlowski wrote:
> > Initializing automatic __free variables to NULL without need (e.g.
> > branches with different allocations), followed by actual allocation is
> > in contrary to explicit coding rules guiding cleanup.h:
> >
> > "Given that the "__free(...) =3D NULL" pattern for variables defined at
> > the top of the function poses this potential interdependency problem th=
e
> > recommendation is to always define and assign variables in one statemen=
t
> > and not group variable definitions at the top of the function when
> > __free() is used."
> >
> > Code does not have a bug, but is less readable and uses discouraged
> > coding practice, so fix that by moving declaration to the place of
> > assignment.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.co=
m>
> > ---
> >  drivers/tee/qcomtee/call.c | 17 ++++++++---------
> >  1 file changed, 8 insertions(+), 9 deletions(-)
> >
>
> Reviewed-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

I'm picking up this.

Thanks,
Jens

