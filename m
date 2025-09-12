Return-Path: <linux-arm-msm+bounces-73381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4D6B555D8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 20:07:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 911BD7B24B3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 18:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FB4632CF6C;
	Fri, 12 Sep 2025 18:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nVeSEIT2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9580219994F
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 18:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757700448; cv=none; b=CViN2T25L5WEGXULik0BFMH/2FDb7ecx30PQpWIvUD4WpnWn+eoDC9fjhp86Tv+vSQi9WqZoFrx5favJCqzBwSyX/qkCAmPQN3+lG+hDlCO9/7WoPW4aoI/Nzqyljft4PlChBZfoy97RAHyvEy2YfExPf7kTn46R0ADqzxSkYFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757700448; c=relaxed/simple;
	bh=91UL/ulcV/GEAp0C9VF8AE7Y05XM25NDQ/r3vu0cb3k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qIrrClOL4w3BQ4Ytpv4TLf1yE4upjP5JoQ0eGs65FJKxAJb2PPkbHONkskv9Na7tLMKrOuYMlcEC2pYdNkH82sbsH2d9XsVDEks4X55omhYKiBf6gOhMoHiHwZjttgCROE9ofOnf4mNtU6sGcD1XqLliPK5IsFK/Ifwz9BI4jzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nVeSEIT2; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-52e532e8198so450207137.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 11:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757700444; x=1758305244; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/cBY+4I9kDYtnwV9v/6I6ZDitcQUFaZn0asAaZVvZ68=;
        b=nVeSEIT2KoQ0Y0YA266Ke+/OUN74tNGk6x1QMOPi7vyhVFu7l3E5L18M9McO/VW7oV
         Qv4uJbzrx225Z2+dXCWAvCnI7xSodWAxU4q+ExCbsKSy6tW2sloRWKWzDeOX+vesm0u1
         D83C9sVybj3SrkSSKrD8Mz3uZbZuWeBfv4siFDYiDCQzGZjbpLc8dB0agNUwExLv8L5p
         b9aRQgbA9o7XYi3J/arO6NsOS0ZanMiA/MYEG83tZfdxnz20mTlAbGPpDUL63dpObt3o
         1tp78rCZsXi+jW5tygCqukL07uvbntYnVANpfW34UJiUQVu/qM0sbeT2f9McjKOWzSvp
         61JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757700444; x=1758305244;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/cBY+4I9kDYtnwV9v/6I6ZDitcQUFaZn0asAaZVvZ68=;
        b=caaBRbGacvg0OQHs6hHHgRHDY9oYKv1sb9uBJXapwBtJ+i07Gr6i58c81EDBtIGZbv
         fFhpi+c2PUInqn87Ua9pvmdZCErgm0udaVs1LqGvrKOL+1Beci24D4g7ODC/6lukKduX
         wp/KCYExMTD7QUPN2rBX3GrZZErRInHFGNU1yp52VcuwvKSRuO7ROuFjL1aoQDj1Mn1z
         Qd7JBXdHNUHzPgy7F2Zoz7WfBzBTYCv3T6AT7Rh4c8yawVowq+I+m+qaV65WnBSIMARa
         2d3vCqPujq1PL7mX2ITUse72hthFbS/RUnsFJcW8YcSLxRUJRtnoSpoacI7pgU6GFPho
         6+sQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRzf6NnynHzp2LXwcUHI6S2KqlDmheJoZp2sG2LJrplahRBwJLY8BDAhUDBjdpxckx2FVtSS0oPqY74PyF@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg9cVyf7RrrgZfyZKEcB/AKpDCVZk+N4lFwL7IwKlR+oaalJz6
	1u39WotpG9IRjmrvEXVZ37j8poTr4xv5Zd5TmanRsEiDew76/GXz1moJtR7/pZ60LBzJ8U7xuZL
	Z97sWZfrZtvo4ZfgJM5Xdtu77e1RW89A=
X-Gm-Gg: ASbGncuWbxppXhopr1yQD2QO7HHmrIt427RMz3/6iubdETyFStZCq6EOIhDNeexwFxs
	c0jN0tobfWfAsABlRC6b9JjFedbZCMMZp5+3udpjrKmEidMYCjJchnCrr6NObtQQO/8NXaHqf8l
	M1HqX0JstSW6lud2k+v8RPSNrhxNvEOkW/OQ1D+kPGLtHbo1QiiBYRpAjKF+dALJE4XmdJTEta6
	QkyrUazU6imyrGr
X-Google-Smtp-Source: AGHT+IHA+4YE8uxdOY8mjzHAWOze6g0jysCAnLhY2/U0gcZe9QhNxJxuu1yw+kCWxTzyKi9VvCfDucHKBNGgGt12ZKw=
X-Received: by 2002:a05:6102:808f:b0:525:9f17:9e6e with SMTP id
 ada2fe7eead31-55611a64c15mr1928096137.23.1757700444451; Fri, 12 Sep 2025
 11:07:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250911-starqltechn_slpi-v1-0-93ebf951a932@gmail.com>
 <20250911-starqltechn_slpi-v1-1-93ebf951a932@gmail.com> <d95fc175-359f-4559-b680-36de87d75a40@oss.qualcomm.com>
In-Reply-To: <d95fc175-359f-4559-b680-36de87d75a40@oss.qualcomm.com>
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Fri, 12 Sep 2025 21:07:13 +0300
X-Gm-Features: AS18NWCeZSM2Dpl4Jrn5JvaZJYtLfchyR4mokH5Ss7_O4FfKDP8nLezjBHbSzhQ
Message-ID: <CABTCjFCaOOJUOp-Cr+OifNTGFe7KUgoftLAhPzCQxuGACrsLmg@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sdm845-starqltechn: fix slpi
 reserved mem
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 12 =D1=81=D0=B5=D0=BD=D1=82. 2025=E2=80=AF=D0=B3. =D0=B2 1-3:=
58, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>:
>
> >
> > However, kernel refuses to boot firmware with 15MiB reserved region.
>
> Why so?
>

It fails with load firmware with:
```
[   22.452709] qcom_q6v5_pas 5c00000.remoteproc: segment outside memory ran=
ge
[   22.453163] remoteproc remoteproc1: can't start rproc slpi: -22
```

I tried to debug print addresses, but those numbers didn't make sense for m=
e.
I updated the commit message to be more clear.

> > Increase slpi reserved region to 16MiB.
>
> It would make sense, given the PIL reserved range is now almost
> contiguous (bar the hole between spss_mem and adsp_mem.. you might
> want to check that one out as well)
>

Actually there's no gap between spss_mem and adsp_mem, adsp starts from
0x97800000, while spss starts from 0x97700000 and occupies 0x100000, so
0x97700000 + 0x100000 =3D 0x97800000.

Also, I noticed, spss_mem is not referenced anywhere.

--=20
Best regards and thanks for review,
Dzmitry

