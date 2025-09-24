Return-Path: <linux-arm-msm+bounces-74654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A61C1B9B946
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 20:58:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6CD51B24FCD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 18:59:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5C5731A07B;
	Wed, 24 Sep 2025 18:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="nonZE0uV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C744A31985B
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 18:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758740310; cv=none; b=urg5kW7ZBBMxfBJK0DtSBAjkeMuCE3fIkG+ZgIBdy0KvvU8RFxZIZ79ybN1+7dEFKLhf/+wnP/3f+bO8W4r3wWCArdWpSTJJOGE7mGataoTTw90RdfA56ZWAhlJDW4yntk8Q3FWVHLDJY3FY0cFl1+sktg7I5IIomce2xFr8WmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758740310; c=relaxed/simple;
	bh=Tvms9S2u+WWs1aqmeVPw1ZH+QcXa67JBCDgXQqcL1Nc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KgQMQbE3zDlIlwBJ4aYCzBN1sJS+Reipq0eSLSI135ztf91nfm/su3/3Zvxd8HZgxO8CSHdKOeRtH7uQGJcRURUv5F2vvygIK5QGJKdUKEjuCDg6nXrJGt4aeR9IeTmkiJcSGtBlw/rkp08/lhribXvz2ho6mI7Ver5WA/s9vpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=nonZE0uV; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5821dec0408so150714e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 11:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758740307; x=1759345107; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tvms9S2u+WWs1aqmeVPw1ZH+QcXa67JBCDgXQqcL1Nc=;
        b=nonZE0uVLQny5TOOi+KqIwped2yLEoydhjl/vCnV6UWHVCXFBQtsStcpMjfcSHmYws
         ndawyzrdlnsaFp4fBQZJM1CBnKMv0/qy6aJ9VV2wTAWd3UlrQnQlcHYXtVBgDT3c3eQg
         O19EoSwhA5vvdo/gxkbqulZRyLZC2GpCmDfsmqwAtSRsYNNMT9mZpBw38M1Vw90RX8ch
         MUmoQaU/Rd+WSIdCP04amGm5rSNRySj+N9pYWZ9BN/p61WWNsqfBDq8vTcuLs0h0ycxV
         8E0YIYD6U4psQRPtOX+qP1E4P3YMeSGZz9Cajxk2R3nq2FlpLF3FRcV5W55LbRJipTg/
         ZMUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758740307; x=1759345107;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tvms9S2u+WWs1aqmeVPw1ZH+QcXa67JBCDgXQqcL1Nc=;
        b=JnG8cpwOHTLy+CT4smqUWdlxUzgX9B0UeuCLqbMgkRgOug0M5e2CkqMJB1tlWjNDKF
         eaX6Eafxsd3SeKf983Xyrks2XeDF+TXrOjw5l2DrlevlwH+vTblkl2xHVko45JBKoJ0Z
         VahFER7Ba9HHQYS2+eP98lS7NED9fa5pwhtPQURrSs03yjMN7b5R/ZO+T+MybJ+Arl/1
         dH4PmR/gc/+R9C9kWMLGUmtDGXYX3uyZg7bVgM7WR0irfK5ExwnvDrrMmqe6DIj2DmPK
         X8DU0ATwaoIEwU/lkclkvB4egIsIG2gB5mZhtYKeiakGYupEHE50Mv6UyUCxe1TE0a8P
         kLkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcDNkIQnnRUHaquo1FeFfLIGKhrb3skevD7F4JfXW290GyKV3rzNm5+ABOSJk+zC3bhAtyhWnkm/ETEWD0@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2Fx7prp0b778EikIN6w0LV+EwIC3v11O98tIniFWPyVa7MgwM
	VH/VCV5GPSMAZvpK42DEH4VgawawIQDK+JNJLihraeUuNhpJK/ibxYAAkGewVLbFx+qHq5nxlBW
	AhU5Sl46xa2Nl9PRPXdTQjoVGWEtDRkbOyn1JDh+2dg==
X-Gm-Gg: ASbGncvPewiCfqigPXBBccOljPC+QNNlk/b39kiatcI8OvL7PJRE5i5syKdl9yuafwv
	qy0/VsljSRkmSGrbi5e1JEWuhp1dXjxVOW0LCAXh3wZXm8Ve8wQlS00BtV6YuXLS/N711stdy3D
	gWpYepAdQqtkQwiNV5NXqzpo0v950X91+iIQOcxPt+/G1dW8yjZAylxx1CJkAtepOojv6PUwfEK
	5y2FOlJc/E0RpoDAsRcnynvWmHwvz+vElpYewc=
X-Google-Smtp-Source: AGHT+IG80v30cYAxmqw0nWtuIX67T8j0+pyB3RqSVPJrA4Q3f2yx4NJvYOML7KmCJ9NDodn7hTwpeLEpVOpaBNNnZoU=
X-Received: by 2002:a05:6512:1389:b0:55f:572e:2417 with SMTP id
 2adb3069b0e04-582d4442054mr147305e87.56.1758740306748; Wed, 24 Sep 2025
 11:58:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org> <hyzzrjn7jzo3tt3oyg7azijouawe3zopfjzq6zfhoo6e6z2m4t@ssl5vl4g557e>
In-Reply-To: <hyzzrjn7jzo3tt3oyg7azijouawe3zopfjzq6zfhoo6e6z2m4t@ssl5vl4g557e>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 24 Sep 2025 20:58:14 +0200
X-Gm-Features: AS18NWB3RTCRDB9znJ75efLzXjjUdrkYJL4LszylIzL1olaMxdJPlHwCWt0jx1k
Message-ID: <CAMRc=McVc2aYFX-DKjtNNNs0eZLcq_jahR+_q3EP1T352XhP+Q@mail.gmail.com>
Subject: Re: [PATCH RFC 0/9] gpio: improve support for shared GPIOs
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 24, 2025 at 8:25=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Bartosz,
>
> On Wed, Sep 24, 2025 at 04:51:28PM +0200, Bartosz Golaszewski wrote:
> > Here's a functional RFC for improving the handling of shared GPIOs in
> > linux.
> >

[snip]

> >
> > The practical use-case for this are the powerdown GPIOs shared by
> > speakers on Qualcomm db845c platform, however I have also extensively
> > tested it using gpio-virtuser on arm64 qemu with various DT
> > configurations.
>
> How is this different from the existing gpio-backed regulator/supply?
> IMO GPIOs are naturally exclusive-use resources (in cases when you need
> to control them, not simply read their state), and when there is a need
> to share them there are more appropriate abstractions that are built on
> top of GPIOs...
>

I think you have never been on the receiving end of Krzysztof's wrath
when trying to model a simple shared pin as a nonexistent reset
provider or a fixed regulator in device-tree. :)

Unless you mean some other abstractions I am missing.

Bartosz

