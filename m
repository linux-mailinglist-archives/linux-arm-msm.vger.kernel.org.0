Return-Path: <linux-arm-msm+bounces-23325-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C06090FDA3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 09:25:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7B59282AE3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 07:25:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67E2445022;
	Thu, 20 Jun 2024 07:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Rql91ceP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D648F43AD2
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2024 07:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718868314; cv=none; b=Rx15eRyjTWXGjyyMdLjt4Ww9kD7cxVurNsSXhDrN1DC7KQBv1JBMWibiPwXxGcuOzgBJE4zB+KFKinbj3rmVQAa/7lmvKmmBIe/zOhah1EmLNs/1R/TtU5dMwk7A9Ir6FtBGadX0HtLU4nGQoMY8SwFcndGTUvwMmwJg38pAmCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718868314; c=relaxed/simple;
	bh=jSwahG1fUc4nuo9lDEw9TRn4gAVc7Sv8Lfe1Q7iPXNQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BJZiHsfTy3EcB7ZMyvXppzRTk5528xEItJvP78iQLO0OzjHTTwgOUWiwMln0uH1rJ4R5uYFov2tQuaytNTmOO2wWgm7OAPkvW5ipyPiClfFgbk6/blFpAFUj8Eq+t6NQTN9/2+ZkRLEe86/OPEWuAmj8MocyORxt/6bcgTZhnMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Rql91ceP; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52cc671f170so1421806e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2024 00:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718868311; x=1719473111; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yRH5412s3wX0CB4KIXqQXWuDqJc61xtQQ1UqcTmYbLs=;
        b=Rql91cePriLwtxiq4n/1I2OAgbYmoN3CqoOuEPIEgDiAfvJlW2u2G2uw9Vz2saoT+A
         0gs2VRfIbQJs7bAex9J3TASgHuBSEpoSDpkv/3zWRrogIn8dbSgioD6zQ6Ttf2fyI9DL
         Szq1dftbfmzU4hmFNQ8eM6v3BkD8s4+ceMzPREzMxQUbWFWT7Ic84mtz6gZPFikN0b3y
         vIBNI3neNx9kX+Fv1urTCpvdm9r13BgT3PHqRjwjNLREBzxiOrGuBGVW+7a5hgHFiF/0
         1A3fU8YEuWlKaVNnER8kEtA28f2NJTqfCBYRYLinICkE81L3Klyqzh/J5JE2SGhdj4KQ
         9AEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718868311; x=1719473111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yRH5412s3wX0CB4KIXqQXWuDqJc61xtQQ1UqcTmYbLs=;
        b=ZkTpV2MlhNlDEk6ZBNeC+2CbAVXsx8FR1xGmV0ca5m+IhUWAPVdwJJe49ntOzo3viu
         bjTN5Ri8Pk4ZSERtNRZgyS3dJNuJe0WfOMYCTuCkRLkke9/TQsiKP09tLICtWb9hXjDz
         NM1aDOXzkKRZ+i/3QUMuk58n4P9gvjUodqEkPRABWUA+lfkE2+TEmtSXExtQ8CcGuUry
         t/9xk1FCIu2NQcEr9noLSSkaNeBmNY8PWRi++GLCKlZex+Jj12wsnWYPKaSFxbFfyQPD
         xmMeHar6MKjdbnRkhBlD0SuWlF4DQmmnQqMzEFj4mSR4IeVqlmOl4QmD7yrnlfzqwQLf
         fETA==
X-Forwarded-Encrypted: i=1; AJvYcCVaLQ1l8ZcLyocf695E8T0Bi1hyGyRK+hFnyTXCVLZoebSNEM/qfyXi5scbctHfEUKBNKKpxc6srZ3iub0P5HBhIb+CmM1r82Ym6kZA2A==
X-Gm-Message-State: AOJu0YzarPYP6DPUdLY9rE+MUz2mBqttaivphxwklYdwDZEdf7v2GbZb
	rCmYQcoPYNR/GpvZ7JYLUK+VWmYXXYhNV1Mi70wqli9h33V4mRrEI2eng+EKbrhpVYe/mrQV/+B
	Eu5Pfq226KvI8mhtmkYOw+5eepl7TAb263L7nyA==
X-Google-Smtp-Source: AGHT+IEdeM9R3n/NNtQDYZHx3TkVh4Vr7+gb+bkwvyCIBlqBU2TmaHrNNS+3vlKpjGfCJsXmfuuse+wN8rhE8KzDejs=
X-Received: by 2002:a05:6512:ad5:b0:52c:86e0:97b5 with SMTP id
 2adb3069b0e04-52cca1c57b8mr1464365e87.16.1718868310875; Thu, 20 Jun 2024
 00:25:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240619184550.34524-1-brgl@bgdev.pl> <20240619184550.34524-6-brgl@bgdev.pl>
 <44cf011b-ec81-4826-b7c2-1a8d57594fca@lunn.ch>
In-Reply-To: <44cf011b-ec81-4826-b7c2-1a8d57594fca@lunn.ch>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 20 Jun 2024 09:24:59 +0200
Message-ID: <CAMRc=Mc0wN=zkduCnKetXyMsuY2k-BzrZ19ehPDntZRDu_o6fA@mail.gmail.com>
Subject: Re: [PATCH net-next 5/8] net: phy: aquantia: wait for FW reset before
 checking the vendor ID
To: Andrew Lunn <andrew@lunn.ch>
Cc: Vinod Koul <vkoul@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2024 at 9:27=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Wed, Jun 19, 2024 at 08:45:46PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Checking the firmware register before it boots makes no sense, it will
> > report 0 even if FW is loaded. Always wait for FW to boot before
> > continuing.
>
> Please split this patch up. One patch which renames the method to the
> more generic aqr_ since it is used by more than aqr107. Then add the
> new use of it.
>

Will do.

> Is this actually a fix? What happens to the firmware if you try to
> download it while it is still booting? Or do you end up downloading
> firmware when it is not actually needed? Please expand the commit
> message.
>

It says '0' and the driver tries to load it from nvmem, then the
filesystem and bails-out after these two fail. I'll extend the commit
message.

Bart

>     Andrew
>
> ---
> pw-bot: cr

