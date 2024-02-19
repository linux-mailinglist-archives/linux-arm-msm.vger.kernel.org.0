Return-Path: <linux-arm-msm+bounces-11685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D545C85A480
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 14:18:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 135281C21EB6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 13:18:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14FB134CD5;
	Mon, 19 Feb 2024 13:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ws6dC0Tu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB5A31759
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 13:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708348722; cv=none; b=V0lKWjSeu4MFacdFAuHnNnKBlgzzeKtgVDqHP1KhfX7lxiTSf1M0ir7XB+WdWvNwK/7rVY2n3y8Tn3qT0dMDk7qeV0IH6dNkSoKPZbXxPT9xgluruOFZg8wj39p9ToLVxZekvLML8t5OLlxgLpM42ZG+v1lHhyRlTUfRmnTGpB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708348722; c=relaxed/simple;
	bh=uCnhdlm60R21bhTAfsSxirlqxQnaziMtd1+fmxuiXkc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EfgoG/uH3+bxeQc5l45qS/Bg70IswOl2oCmRfprhsXRgxxkvWacZ0JWAMkyHqpM9CgIMD//1v0FGqG4YgVMmdJoOZ7lQ9BkPk3hsDM/Nmmlo8BlrHgbkxlrlVhDgdfdoiPtXPIE2e4GKUn1AYNOrlzVJ6looxvN+mX/awm2yubw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ws6dC0Tu; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-7d5bbbe5844so2166944241.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 05:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1708348719; x=1708953519; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IlTEsH/l5PlOJ28yA7JjTHvi731W92lkicff9wtDqzg=;
        b=ws6dC0TuVLALNW1SUypbxKAjwJPD/4eufJyKIA7W2BjOy0MWm5pOuqI0ovMCjqu4R/
         q5oHcP0rihHKJsXQAPErBJLw2jFoc8Se3xWyzuDK4xfCA+ktVMHmsSUaC9eEFFluNi4E
         GTLukYbmPac5Qnn1dp7u0W6uf1+f95oZQJtrH8G+zS18FTM4URad7Hqhg2wurstKblWs
         +FYfeTBQJXRgoIqQEWXd+eih670iy5wOeYyataHGo/USx1SJEGU56FeHXqrhJgaC0G4a
         xZJXwcMptMOxAu0Ntz+bsESzI26X1pcC2rsHIuWuOpFn9Ms/nYQGZDM0pLG8+BZpScqV
         6wjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708348719; x=1708953519;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IlTEsH/l5PlOJ28yA7JjTHvi731W92lkicff9wtDqzg=;
        b=FuL45eZW+P1SKU7K9kRO+fEWqk60jEM4UtM8tNC8ArAsMLpzYx+Y+9J5MeGiUXx3Hx
         0kNnhLIEzpwHqydzU5CfZsebWnYQjOClfOfgYTkbLXr0tQ+K/Bq5J/3PdM0CdWktIVgx
         KHb9IZBudng4l6pvBMOT0hqySh4/Oa+Rb9b49pqVHAPuWh8CH3LJ6tyJUR8Gnpno6rYX
         z51u0gtt0c1UeZbQZTsmcE37gz0oET+WdEeLkrUSaXuSE31w/Q+mm8cnUsHyVlxkwZiO
         moOEcTwuFI4ipQLlUINFkB17KnjfXxAhPDbqPMNStELPhGX8l5pZiStT0y2pVAt8IMgj
         4IFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkYH49Vkxwuj3AXvTryYF1iqtSvDrc1UWJTDMz45Ly1zuZGN2FNnEIFAbSyfkSuuKWrnEYY2nW6w1AxIMPXaSJ9GEXfSpCyK38YCHhLQ==
X-Gm-Message-State: AOJu0YwqSulhiSx/0qkPM/jM6ZM0tdjabBJ8vEGLBsciQjudGZ1Enzhd
	aDqf7IG21Imrp/ZUOxISbxAOGJ3dTfnyq04oJd47/WlxCWb5tuS8pXZz+yPumb1yu3Nz1SLyThh
	WTOqcB7dDjkpHZoJwne3S9FDPy3QbR0KORTMS0g==
X-Google-Smtp-Source: AGHT+IHgf8BA1ob8hWMW8dPJlcq7EvfmOhMFoTNTc7aIdOAsQg6TrF1PuiKCYzF3S1H9EoWk6cErlF/PJZMINmGnBUs=
X-Received: by 2002:a1f:d685:0:b0:4c0:6406:ee62 with SMTP id
 n127-20020a1fd685000000b004c06406ee62mr9192204vkg.13.1708348718047; Mon, 19
 Feb 2024 05:18:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240205182810.58382-1-brgl@bgdev.pl> <20240205182810.58382-2-brgl@bgdev.pl>
 <5ppezcfez6tb3xmeevznwefvjjwjefwyzb5r6co4zlo53ht2c2@tdbwgbnxaalt>
In-Reply-To: <5ppezcfez6tb3xmeevznwefvjjwjefwyzb5r6co4zlo53ht2c2@tdbwgbnxaalt>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 19 Feb 2024 14:18:27 +0100
Message-ID: <CAMRc=MdioAp=LoHmp3imRtFe73zQz2k-CuAFioKJ_MzB4YcM0Q@mail.gmail.com>
Subject: Re: [PATCH v7 01/12] firmware: qcom: add a dedicated TrustZone buffer allocator
To: Bjorn Andersson <andersson@kernel.org>
Cc: Andy Gross <agross@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Elliot Berman <quic_eberman@quicinc.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Guru Das Srinagesh <quic_gurus@quicinc.com>, Andrew Halaney <ahalaney@redhat.com>, 
	Maximilian Luz <luzmaximilian@gmail.com>, Alex Elder <elder@linaro.org>, 
	Srini Kandagatla <srinivas.kandagatla@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@quicinc.com, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Deepti Jaggi <quic_djaggi@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 18, 2024 at 4:22=E2=80=AFAM Bjorn Andersson <andersson@kernel.o=
rg> wrote:
>
> On Mon, Feb 05, 2024 at 07:27:59PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> [..]
> > diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom=
/qcom_tzmem.c
> > new file mode 100644
> > index 000000000000..44a062f2abd4
> > --- /dev/null
> > +++ b/drivers/firmware/qcom/qcom_tzmem.c
> > @@ -0,0 +1,302 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
>
> Could you please confirm that "-or-later" is intended?
>

No, it's not, should have been GPL-2.0-only.

> > +/*
> > + * Memory allocator for buffers shared with the TrustZone.
> > + *
> > + * Copyright (C) 2023 Linaro Ltd.
> > + */
> [..]
> > +/**
> > + * qcom_tzmem_pool_new() - Create a new TZ memory pool.
> > + * @size: Size of the new pool in bytes.
> > + *
> > + * Create a new pool of memory suitable for sharing with the TrustZone=
.
> > + *
> > + * Must not be used in atomic context.
>
>  * Context: Describes whether the function can sleep, what locks it takes=
,
>  *          releases, or expects to be held. It can extend over multiple
>  *          lines.
>
> > + *
> > + * Returns:
> > + * New memory pool address or ERR_PTR() on error.
>
>  * Return: Describe the return value of function_name.
>
> both from:
> https://docs.kernel.org/doc-guide/kernel-doc.html#function-documentation
>

I can change it but "Returns:" works too.

Bart

> Regards,
> Bjorn

