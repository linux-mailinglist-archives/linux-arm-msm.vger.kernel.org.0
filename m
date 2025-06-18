Return-Path: <linux-arm-msm+bounces-61681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF03BADE455
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 09:10:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E7D717BF1B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 07:10:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7D7927E06D;
	Wed, 18 Jun 2025 07:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XNDqab9a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCBD25A33A;
	Wed, 18 Jun 2025 07:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750230587; cv=none; b=OZFBZXNHSq/kief2roStYPtlcde6yWsO6FjWuBP5aTLQ/wYY1JTuiW+qnmW0VFlkcGedep9FUhc3v2wi9j1/eVAxv56UhkBpSOmV8I9ue7Fps7zqFArJDJTS6JkSr09Vrz1sHB5rrMx9Jlpj9r9Vf8paCbesCNg14P6odVVOsuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750230587; c=relaxed/simple;
	bh=4xt5Yf4yr6KNVWrM3aYxeOfV8GMxBkLmofYpW+mqFoA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MfzZ+S7ML5JSl7EwvimcnT+BPRd+PHllE7xctCYslspvbUP8qQXvPRGnGkisM+sMOEt5DGaaTBobt31qvC1JYShfzb+F5hfbfjR0yiyoF96cpkI/5O2n204qlvm82yNZazFmd/c30mhRJrEgqD61fde1I3jtMrgKrnv9EpeywV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XNDqab9a; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a5257748e1so4711270f8f.2;
        Wed, 18 Jun 2025 00:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750230584; x=1750835384; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hS3rWc1gIurkAt/eh2Z+JrEXYIERg3qQF5u9VddF2Z8=;
        b=XNDqab9aWIcKfjU/m98KkRpbIG0QBgBq8TPoDIGXfwhEqr7opYNIpW6F1i/RUx1Dqv
         X00jSayohrCPmH/ZwMkVugXTLMv2KUvdYMW+xSjB53hYUpSAZeK7C9E+h1zRbB/uByH/
         NEG5hu1/4Y4ytHT0k/9J6ZL0JpO3/IQc7+KMLiAMoz5Y2B+YLeeC6Hnjrky7FoA8VL8r
         zWLHzqK/BxfPie1EBLQ96S9CIgB3VwqCH9JlTH0wdhDzgxL2AHKBbag2U5KFrJ9HY+Dj
         WZ5EpmKGuY8ztZheyM0LxuN3cvbqOt5vgT+RdJ38Yo4aUeoquFFYJJ5B3sTwfgqCYFsy
         qkkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750230584; x=1750835384;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hS3rWc1gIurkAt/eh2Z+JrEXYIERg3qQF5u9VddF2Z8=;
        b=BZEKaxxbF4whJE9fm3zKT8VRnvUa/canG9iIRSPeWUVYGIiXStJRC1/iyMgMu6Pj4d
         2AYkeT1Xd9AtiAEVckuonX7tKV03u5N5STrnF1xj6LuSrRJaehBki3E9J7lpRmIzPKP6
         2UzCTsRC/ptUT6ItVwQIMamvD4gHoiET1lq7DptWxN1UFV61m5c/YyFFHj65RWzcWzHJ
         8URdPr4mKps4mTqhHC4n75gNxk1MFh6oeTgokhEC9bl5XH068QO0k04o54UZhujpqDvu
         9uM+Y5ZHxKpwKbK3KxLSaW5LvzwBNXm6mvsbiBxpV4nubQP/vHRKJQNXjycxFNaTfgdw
         pbhg==
X-Forwarded-Encrypted: i=1; AJvYcCUERrMshrQHL8BrYVs9L4/dKKDqmqjEHhncBjqIxdV1sIEmIxgJ0PyZF3Ca3Dpi5NAhV8BYCtf4dDNPwqGE1Q==@vger.kernel.org, AJvYcCUzSW5B8Gh5Wy+rZ41Z3HMjgXYENCTAnDIRu1mN8XEdJUA3ypobwkUZoNhGfsxU8BSKBn0W4nEEw9+B@vger.kernel.org, AJvYcCXl87Hk7wAi0VYdoYxmrBpB3N67/6H8JdBOWVSe+74TErajMlBowOMDGRQxhmnbrboAjSD9x+Mdtwt+YEne@vger.kernel.org
X-Gm-Message-State: AOJu0YzBmmvKoTJBgFnxQdh80jJrdM1TelA1F4093tnxu5rtQz9992Ti
	YQAnmqhtNi8NSsYEwBPndKnOukfjo5glqXT5yWt583pEuW7d4T2hd9NgPYBz/qUB4AHPs7JOldW
	g41mAof83g/7iSzQlpmIs1eV7fGzq4oFNosSbWA==
X-Gm-Gg: ASbGncvtCe9SJ8m+Nil2ywU/CMyRUhcxqHOBocIH5oi8Q5fxFOl93kAgsj8lTJcPI06
	Rfhfsuq92tjGva6EhzgM5iaWgNmH6iFabCY6iv57SQHhHdsg8BN1v/GxZxhgL8v+5UGIvfULgK2
	Tidg9gACNa84gN0W94isGEcQoWbBnIcWQAmV+rrRhtKt4=
X-Google-Smtp-Source: AGHT+IHxDg1j4IMUb8UJTgBDNX/v5xspVufALUfntIJtkB1WiqSqXsP7uXDjZLJI6MjqnCEPj4DV1v/cCltkSFKLHTA=
X-Received: by 2002:a05:6000:718:b0:3a5:3b63:58f0 with SMTP id
 ffacd0b85a97d-3a57237178dmr12626003f8f.18.1750230583886; Wed, 18 Jun 2025
 00:09:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250523131605.6624-1-alex.vinarskis@gmail.com> <175021976646.732077.10509920450300400020.b4-ty@kernel.org>
In-Reply-To: <175021976646.732077.10509920450300400020.b4-ty@kernel.org>
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Date: Wed, 18 Jun 2025 09:09:32 +0200
X-Gm-Features: Ac12FXxBYceHEF4lQ5RsaGbjXNIAdi347IBr8_4t3UN3rEtybkM1jgjJCaCZGms
Message-ID: <CAMcHhXrNauiVzhS1EFnCy1WeSn6xzqRRRE1hBMzc=84H1f0osA@mail.gmail.com>
Subject: Re: (subset) [PATCH v5 0/1] X1E Asus Zenbook A14 support
To: Bjorn Andersson <andersson@kernel.org>
Cc: Nikita Travkin <nikita@trvn.ru>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dmitry.baryshkov@oss.qualcomm.com, maud_spierings@hotmail.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 18 Jun 2025 at 06:09, Bjorn Andersson <andersson@kernel.org> wrote:
>
>
> On Fri, 23 May 2025 15:15:07 +0200, Aleksandrs Vinarskis wrote:
> > As requested, 1/4 was merged to linux-next by USB maintainers.
> > Resending 4/4 rebased on top of latest linux-next. 2/4, 3/4 already
> > landed.
> >
>
> Applied, thanks!
>
> [1/1] arm64: dts: qcom: Add support for X1-based Asus Zenbook A14
>       commit: 6516961352a1ef39184a34690ff3cc06953f6fea

Hi,

Thanks! However it appears it's not the latest version... there is v7
[1] which fixes typo in the path for purwa firmware and moves GPU
enabled from dtsi to respective dts...
Is it still not too late to drop and re-apply v7? Or should I urgently
send the v5..v7 diff as a standalone patch?

Thanks in advance,
Alex

[1] https://lore.kernel.org/all/20250614205718.93166-1-alex.vinarskis@gmail.com/

>
> Best regards,
> --
> Bjorn Andersson <andersson@kernel.org>

