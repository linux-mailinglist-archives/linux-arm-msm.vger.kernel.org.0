Return-Path: <linux-arm-msm+bounces-26279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFC4932184
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 09:54:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BA671C2035A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 07:54:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E52B23BBC2;
	Tue, 16 Jul 2024 07:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="jZ9zq28U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86A64C74
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 07:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721116475; cv=none; b=L6zs+h/eH6IAH8Co3ptyql0fPWaRVvdAhPbnhLXJCZki5tINPSdSsY6afvooQKrJ1WytWhqzLC74mp3ohI6prDZ31Q853Ua5Vjgysz7fUKhrBKcnZ+stsI+VOxCFkPkWoonulT8pNdNk4TBK4RrsjFNFrzG32Z9q9ZidovJjhhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721116475; c=relaxed/simple;
	bh=MNn8gxXYqvsNcb1Yh/X9L/MXxeX3VNL1a9Hrw0q3y2c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=th5rLi17J0ht2fNpFhtNVDHFSiJXNezrmQntnkCKlU8u8h5szz9yjRQnXG774KjyfYMNQGTp3xsjEE1eJTeLR5HPFZ0mib8A/n5PY1NT2FFuhX0Xy4VOjRxeeV+hngtMWpti5/KxHw1rjjgTyvdM5f95ILNx/o36eJAmN6EgHfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=jZ9zq28U; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52e99060b0dso5430797e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 00:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1721116472; x=1721721272; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tsyjNs+epxjHFckk0dd03DwfQ8j6M5Wrc4itesRp3IU=;
        b=jZ9zq28U/QegcdkYucUMhsZ0jz/UEk+ep9TqOdqrh04TvsoAMdaQccxfm5eZnYTuFt
         OEXGX5DwXlut5H0URAzWjrVCZ53d8ox0dDlapjfXDm36piDq7bEC2WLj5RVWAME9VmDv
         qUEKl4GAtcMU7cBdkLXa5GS26a4jn1cWeFkbGcrMYouv3BWp07uk7U7YJFUSUXtChr7U
         RK4xW5UXY/Wx1GYJboIKM6H8rGt3QXS5afpnYfs8njrKr5FvzkQML36/Kg20qT1AGyXx
         +1S2AszH7lhZTUxrqNpCwFsh+JCnJEK+BVvGyWgCmd+TsLxxrSER/mWSLszPtJUAG0P4
         JkPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721116472; x=1721721272;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tsyjNs+epxjHFckk0dd03DwfQ8j6M5Wrc4itesRp3IU=;
        b=cnmECxxLwQdpm9tvzFuBk1CdMj9yzQeiGz2d3CbxLsfwCV85FAJ6rr3UfxxSEBvHTt
         bIAjtjhXx252t5m8AF9eZEX5LGi8Q3/LNJMeuG9o90azyaSojyA6QIbXr+zWi4Vdmnbt
         /iY3k4SnxLF5FSuWqfDNHimqS5KS0ZZjTD5gM1Ez+ZTCPnMNfZneh6fp3weHi8vD36o8
         hbB1+AAWGOfq7x/mqmcI9Anf3j1mvywWaW+dZzoToJ16L7WA4tmZEsdOiQ+DEsEipk2i
         l+Kd5yeY/sjwVOarqmQhfDByzsZ3NKApL8zZavZduTKjaS8BmD5YUW4bYaFVQSs4sakb
         OHRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrYL7duH8pc9KP4Hnr8ww2oRNSsjcbrMbG8oqR5NcB4NrpU/SCwk92EC4MSyk8tEREZnaG1s6vhjdo9x1Fv1NKOtbfeWFOeVFavxeEPw==
X-Gm-Message-State: AOJu0YwoeDXNx+E7H/zXvmDmL0JJQKDuKIeddx2TtVYGY5AGkG/H+Xcm
	/46+Ss+HsCtm5iXYD2eLlMypgAX/TV5gg71i9o49AvTEwguWDPpvs0wWKM1j7t3pEecrFB/7pQ8
	U5S9X9YVDZE9tToki5m6RtOX2PjSoIBSx4UPWXg==
X-Google-Smtp-Source: AGHT+IHxiGnjKEzJz5PukU3GQJwtAAOXLOqzHFNcG1Fx6SzxLyf+ALXiDO+KrLhwXbWwUy5jSuyneyfndt37ndL/n+8=
X-Received: by 2002:a05:6512:690:b0:52e:9ab6:cb53 with SMTP id
 2adb3069b0e04-52edf032e94mr698476e87.64.1721116472011; Tue, 16 Jul 2024
 00:54:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240712091008.14815-1-brgl@bgdev.pl> <CAHk-=wjWc5dzcj2O1tEgNHY1rnQW63JwtuZi_vAZPqy6wqpoUQ@mail.gmail.com>
In-Reply-To: <CAHk-=wjWc5dzcj2O1tEgNHY1rnQW63JwtuZi_vAZPqy6wqpoUQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 16 Jul 2024 09:54:20 +0200
Message-ID: <CAMRc=MfdREubJBjxy-WDZotYWY-uU_6C1N7L8STisoJwtpAgjg@mail.gmail.com>
Subject: Re: [GIT PULL] power sequencing updates for v6.11-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 16, 2024 at 4:17=E2=80=AFAM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Fri, 12 Jul 2024 at 02:13, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > This PR contains the core power sequencing framework, the first driver,=
 PCI
> > changes using the pwrseq library (blessed by Bjorn Helgaas) and some fi=
xes
> > that came later.
>
> Hmm. Let's see how this all works out, but I already found an annoyance.
>
> It first asks me about the new PCI power sequencing driver.
>
> And then it asks me separately if I want the power sequencing support.
>
> Now, either this should
>
>  (a) not ask about the generic power sequencing support at all, and
> just select if if a driver that is enabled needs it
>
> OR
>
>  (b) it should ask about power sequencing support and then if you say
> "N", it should not ask about the drivers.
>
> But asking *twice* is definitely not kosher.
>
>             Linus

I didn't notice it because I almost always use menuconfig. I'll look into i=
t.

Bartosz

