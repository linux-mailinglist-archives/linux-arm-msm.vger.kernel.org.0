Return-Path: <linux-arm-msm+bounces-39841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB49E9DFF3A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 11:45:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55FF1280DEE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 10:45:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38FA21FC10F;
	Mon,  2 Dec 2024 10:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ReA/52rh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C62CF9E4;
	Mon,  2 Dec 2024 10:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733136324; cv=none; b=nKbRHw0C52STJ4J0uCMjfDD1FdMrDMD7krRjm6Rvr8Xxg6j0+wd9kvEQc1jTKc5n3qaBYCRKgMFh9LZVRjaj5e0nMXiTKlfX66lLUVa/HmgpY/ug+bbO+W8tzwNOw3x8OEbmQfNGR2hvOh7/k49F/+5I9MbEvszE7rbg7leVxDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733136324; c=relaxed/simple;
	bh=of+u0zLYf/EwFYqL2GDoVhwsNt0MOE2vN54pW+uX23A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Orl2wsxcgdBnOtPP0Plo9QUCQWiUEdQMGle25U85xH7uU1jSy203FKJ7TiX0HJi1P8mRoRM0b0lon4GKSDH1K4tEHcbT8jTSf5JVfxHHIC2S+kk+6BTroT7JGWWKfJXinuWTXQ8c6pPDT7yrvKKWMO/ilTdKDONgDkDpvWQdcOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ReA/52rh; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4ae82bad101so959907137.0;
        Mon, 02 Dec 2024 02:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733136321; x=1733741121; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fjp4mU+UmEEjsEk0CFm8uiqwBhQjOkJjUFkhquy9+QY=;
        b=ReA/52rhyGI7NV8WW5BVWGO81An1ws4e4Jq9g8pUzHAvMlxiBZVQYb9u0UokV7C2+u
         mWYUkP6WFpaIunxhWeAp7ub9nBAMa1h/apfgDX7LbmVPiBUrg5ATuk1lTeWoKK3P3KGi
         1vkEeKyeMgd1UJQqoma3CVt3PnbrWdvfQYBIsrvxNbGrIEQ+IR9vM0WMjd3SSfKZat3V
         f5cs07SXJmR4L2igfYYuul1DuoWSeD4IUGIQLBVQYp4bZyCTXTB/9GaLu4LEq9f+RHVH
         x0Xh4YQwTbJMMLaAoNbk3SR74hMSxaGAIMrQlKnV8SI2v7HoDWco65YFjGrEyQ0R7SD+
         LsFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733136321; x=1733741121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fjp4mU+UmEEjsEk0CFm8uiqwBhQjOkJjUFkhquy9+QY=;
        b=MUq+GMG9WLsEF+nNEbYKeSdGxM3fkXq8Be73yC5Wreuj7NRXfTLu4M59WwetMaE9Ek
         SEQVPX+ei/sreOiTZX0IRGouff4Lv7U211ev5glczAZ6/GzgW2yOL9SaUeGXyGdiEYU9
         crqDfHlc1EiWMHW92IGzchWoN51+5yuX5dzVJkUJ1+j7Cs6iY5PSzD4wVICo52JUZ9ap
         seJwr6ZbyNyfQ7+w9QeNX5Etp2aquv9G7Zvu/LF6Mp8ITUFgnCvRzPhgC6UuNljH0Twp
         36vx3O21JgXLe+NsWcr9PEQ2HckHI6qKeQQ+Vx3LgM77dO54purwlTYUrTATPgrR0QbV
         W0Mg==
X-Forwarded-Encrypted: i=1; AJvYcCU4xp9zZqKgxxYS65W1QVgq6c/GSFHfCXtBoDUzxI+KbDYP/d2TSCkDdx6BAHQaze6KnlJsPoB15LqxSno2IA==@vger.kernel.org, AJvYcCU7dIPR/msm7QlNcj9GiR2XhkVho3XCEJJv37zb1NaYVNsf0UXHgwY515ndbyX+50qbmPcufAMz87XiDapx@vger.kernel.org, AJvYcCVIEGB5dA++BprNjA1cWxwCLRjsgS/yrfMmtZwFoEimrFfB8I90uyU2VfSregP5S9m1NHTrx7RSUBC9@vger.kernel.org
X-Gm-Message-State: AOJu0YyFvPUgsJOFCv6+GIaySzhNmd45fh8kQURRsNVLCkrNRRr15GPh
	dd1ZEyWDqtrW870yB4HjpAHX0Bnc7mrLaqYYwystG56ecbsR2ADDeFMU3IO8T3kdYcalpOKD3aQ
	MGDjiKmjZR8KnhzpiQxqDhJSIXrs=
X-Gm-Gg: ASbGncu7gYUbhRi/2VY8WvgdZ4PcLPotU2nXeCzl5OhCja+TZ6/R1h0HBJUzf507KXo
	m9R8Q7bx6fWmdjgAKkm9b4Qn5ykUviQ==
X-Google-Smtp-Source: AGHT+IHAiSm3GH0+EB3SpHNg92ot3w7WC8aHmqVct6yTTsByMKbgdixFUfh2w0hMt6K68oIfSLpQ5jeci88Xjg7nuMA=
X-Received: by 2002:a05:6102:3050:b0:4af:5b9a:3350 with SMTP id
 ada2fe7eead31-4af5b9a3e7amr19731719137.3.1733136321388; Mon, 02 Dec 2024
 02:45:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008-starqltechn_integration_upstream-v6-0-5445365d3052@gmail.com>
 <20241008-starqltechn_integration_upstream-v6-7-5445365d3052@gmail.com> <dc1322d4-8312-47a4-929f-086b417d4ae8@oss.qualcomm.com>
In-Reply-To: <dc1322d4-8312-47a4-929f-086b417d4ae8@oss.qualcomm.com>
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Mon, 2 Dec 2024 13:45:10 +0300
Message-ID: <CABTCjFDw-TiWxSdPZNyu5ZO+Z_=m8reLYr8u1rNZpJOxLQ7J-A@mail.gmail.com>
Subject: Re: [PATCH v6 07/12] arm64: dts: qcom: sdm845-starqltechn: add
 max77705 PMIC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: cros-qcom-dts-watchers@chromium.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D0=B1, 26 =D0=BE=D0=BA=D1=82. 2024=E2=80=AF=D0=B3. =D0=B2 13:36, Kon=
rad Dybcio <konrad.dybcio@oss.qualcomm.com>:
>
> On 8.10.2024 6:51 PM, Dzmitry Sankouski wrote:
> > Add support for max77705 MFD device. Supported sub-devices:
> >  charger, fuelgauge, haptic, led
> >
> > Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> > ---
>
> [...]
> > +
> > +     vib_pwm: pwm {
> > +             compatible =3D "clk-pwm";
> > +             #pwm-cells =3D <2>;
> > +             assigned-clock-parents =3D <&rpmhcc RPMH_CXO_CLK>;
>
> Don't you want to set assigned-clock-rates instead?

assigned-clock-rates would set GCC_GP1_CLK_SRC rate, and automatically
select the proper parent clock best suited for rate.

However, as per discussion in
https://patchwork.kernel.org/project/linux-samsung-soc/patch/20240618-starq=
ltechn_integration_upstream-v3-2-e3f6662017ac@gmail.com
the old approach with additional freq_tbl entries was criticised. New
approach, introduced in
https://lore.kernel.org/all/20241007-starqltechn_integration_upstream-v6-0-=
dd75c06c708d@gmail.com/
automatically calculates m/n/d values for GP clock, but it cannot
select best suited parent - it's user responsibility.
>
> > +             assigned-clocks =3D <&gcc GCC_GP1_CLK_SRC>;
> > +             clocks =3D <&gcc GCC_GP1_CLK>;
> > +             pinctrl-0 =3D <&motor_pwm_default_state>;
> > +             pinctrl-1 =3D <&motor_pwm_suspend_state>;
> > +             pinctrl-names =3D "default", "suspend";
> > +     };
> >  };
>
> Looks good otherwise
>
> Konrad

--
Best regards and thanks for review,
Dzmitry

