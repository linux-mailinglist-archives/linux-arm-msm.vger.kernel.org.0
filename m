Return-Path: <linux-arm-msm+bounces-42832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D46739F83D6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 20:13:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 71CC0188D597
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 19:13:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97A7D1A76DE;
	Thu, 19 Dec 2024 19:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Uwbs8/6P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63BB1A4F2D
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 19:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734635587; cv=none; b=GTQQXMnXQ1P5l3TDiTOdz2Zx/Qk0IuV3wjs6Qs7VXmXgVRaMWqC3nvR7vf6/bOslis6O6AfVf3mOgJ9CkwgTqvTVTQBY2eu/TuKbGX/cQlQ6eHFKh5jk+fE3pmPGiWJGNydYuuOjjZhUfoACd8EaCw61dzTI0jEmmi7nIse837g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734635587; c=relaxed/simple;
	bh=2m+neTvn1J6jwPLArnz6aBhDUV+liWIisQpaER4E2BQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kZ9JKy4AQQTgkwPT7zEbobHKJ/N8cS9si0kZ0NOqb/V06efRQFC/n/N7s+4IfOnIJFIkUG07HkuIFjhT4LdOO+J05JXg+yhT/riljP/ignHSBFr1VQgF3ZB9zH/cdOZJK2F2/RQkW0FEn60BlUZF8eosQyadIeywp4mIGVtV/1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Uwbs8/6P; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5401c68b89eso1271256e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 11:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734635582; x=1735240382; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2m+neTvn1J6jwPLArnz6aBhDUV+liWIisQpaER4E2BQ=;
        b=Uwbs8/6P64z+3FcpzR15n+7MzbCfouPu2kWWV9uPxgogCqV5nkLszU79CU5mfxiX/j
         6EGFwqe3znyp9U4iu0kj+iAegNR1uSDrV3o6V4H5n9pbZWozoniH+AeiwfYzSQj+xtot
         RyViE+Z/IEJnap8I6Wlp0/ZSKAqYgq1f8wlu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734635582; x=1735240382;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2m+neTvn1J6jwPLArnz6aBhDUV+liWIisQpaER4E2BQ=;
        b=NxBwVlzqTz+Abi25N1MXY8Iled+AEGZWKA6Pu08IvRm6IX2hEgN9J4XZSx4uDrcvEK
         b27Zp4cY51x1skljU5rl8ns33NCbRJ+lGB5FA3/rNljGTkjPi36IjFbfvRS2iPfTD92V
         jSJw8SvryDgcv+xKxV0qq0w/GDI0CmRdU5CGvQWMGNQXC8LpRUEHgj6UwG2rmjkJzLZh
         KhSi4rRZEZA1N0YPTc0SCIhLVUmthEa7Fxv5fWtJjew8E2xzzTtg+GbP+vCN9lqPksz+
         MTZMfDzCjJZ6jN6va+yQVIkDVr5wJjJRM6sW/L28f4EMwuW4+x4IP+E8cu12Qug7IZSg
         ceCA==
X-Forwarded-Encrypted: i=1; AJvYcCX32cJkZQMFd0eAHb7eKxSxGF9Gnw+gkhjPprNL5ZB99fCv0UbOXnq3LNIMbHWHdGzV9irXzm9fB0uvSRCx@vger.kernel.org
X-Gm-Message-State: AOJu0YzDYFdG524bBAq7PtoGzUYFcWvlCrlrN6h+o0epcvOidvpCajok
	QUkSYvgXeey3GBSYVfrQ0X3+kP+EVTiUtCXG6KBFApRk5vO30PgK05yQO/2mQLgdkielFtyACEG
	MzyPe
X-Gm-Gg: ASbGncvdc5H2l9ZExxwZ7fU9zgH+0t5crIfrE19dMl2qJCsezXeH+ZuR8qsMlLYZgAn
	Wl51FpQLP+Cbz6wUZwsDi5RD2iAHjO2p9xahg3ulDg7pbfv6Y8VUZ8kv0pZqmLBdmw7iibO74Ln
	GKhEKH7E9NDvkn3hN4EyvuJdmxSCCHsDE7OFDjQVBGMv90zHjXG8WxP/QobO7mu1STgwhW9MY+F
	3Q71yuruuucDoVj0VQ3Ci1xthMphlkHh/JxCoTX64MSvtHdHn4VD1KIEIoGEbjzfFmEki1zv8dq
	GIFJfe4O2y/F4Y8ZFJ4Z
X-Google-Smtp-Source: AGHT+IHkEWnUqEIR9TUaSqCYWeI2+8njpgBzR2BZe4h5DVAEmFxWXT3IBUdFPtxseUyM69J0vjOGJg==
X-Received: by 2002:a05:6512:3b9a:b0:541:317b:d413 with SMTP id 2adb3069b0e04-542212ceef9mr1537681e87.4.1734635582284;
        Thu, 19 Dec 2024 11:13:02 -0800 (PST)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223813665sm251183e87.146.2024.12.19.11.13.01
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 11:13:01 -0800 (PST)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54020b0dcd2so2317843e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 11:13:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUyPXg0Hm/B9ZtaWTWTfkUQczea61x9RAsLy/zyXUt/KEg+WWT4KE6q/i1xB2I6KsQwL8/+GFECJ5NY8MJJ@vger.kernel.org
X-Received: by 2002:a05:6512:2384:b0:542:2192:44dc with SMTP id
 2adb3069b0e04-542219244f6mr1395323e87.28.1734635580713; Thu, 19 Dec 2024
 11:13:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241214005248.198803-1-dianders@chromium.org>
 <20241213165201.v2.1.I2040fa004dafe196243f67ebcc647cbedbb516e6@changeid> <20241219175128.GA25477@willie-the-truck>
In-Reply-To: <20241219175128.GA25477@willie-the-truck>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 19 Dec 2024 11:12:49 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WhzZ_v1+WPpG9839JwN=fKyiY_T1M37RAU_e9cHy4XGw@mail.gmail.com>
X-Gm-Features: AbW1kvZhv1mh_PrrK_8tPeTV4O5T1QFdsJAfISMEvI9OCn5vId8bs6RT8MrmOxU
Message-ID: <CAD=FV=WhzZ_v1+WPpG9839JwN=fKyiY_T1M37RAU_e9cHy4XGw@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] arm64: errata: Assume that unknown CPUs _are_
 vulnerable to Spectre BHB
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	linux-arm-msm@vger.kernel.org, Jeffrey Hugo <quic_jhugo@quicinc.com>, 
	Julius Werner <jwerner@chromium.org>, linux-arm-kernel@lists.infradead.org, 
	Roxana Bradescu <roxabee@google.com>, Trilok Soni <quic_tsoni@quicinc.com>, 
	bjorn.andersson@oss.qualcomm.com, stable@vger.kernel.org, 
	James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Dec 19, 2024 at 9:51=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
>
> > As of right now, the only CPU IDs added to the "unaffected" list are
> > ARM Cortex A35, A53, and A55. This list was created by looking at
> > older cores listed in cputype.h that weren't listed in the "affected"
> > list previously.
>
> There's a list of affected CPUs from Arm here:
>
> https://developer.arm.com/Arm%20Security%20Center/Spectre-BHB
>
> (obviously only covers their own designs).
>
> So it looks like A510 and A520 should be unaffected too, although I
> didn't check exhaustively.

I was hoping that newer cores would hit the supports_csv2p3() check
and be considered safe, but I guess the white paper explicitly says
that A510 doesn't implement it and is still considered safe. I looked
up the TRM of A520 and it looks like it also doesn't set CSV2P3, so I
guess I'll add that one too.


> It also looks like A715 is affected but the
> whitepaper doesn't tell you what version of 'k' to use...

It doesn't? I see a "k" of 38 there. Wow, and Neoverse N2 needs 132!!!

...though I guess on newer steppings of those chips they'll just use
"clear BHB", which seems available and is the preferred mitigation?

