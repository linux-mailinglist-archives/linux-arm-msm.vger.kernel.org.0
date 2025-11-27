Return-Path: <linux-arm-msm+bounces-83548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A974C8D77E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 10:15:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F2CBF4E72EA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 09:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42F2032720A;
	Thu, 27 Nov 2025 09:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="WYFUaeHT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C20326939
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 09:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764234891; cv=none; b=ZHcabYf5WXPvvPvNIo7UpzM3yyCItyOOsZ+BEGHFVoKhzyO+NvB3DNkFcVQCdNcSpZrZlRR7cjKXaMaVLULhcPYxsFbTD9i/Pvldx1RwNs4aDRyEGn2U9Pxn1jppOBs3/s0WPssLlBZJRCtdv7zbHqg5Uype5WK6HvG7vdpkmJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764234891; c=relaxed/simple;
	bh=X03jox/gV8bqLBLEBTR625O9w1oSc+eeKS2ioi2DhKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jNUKZ9Vm4oTs2zKtUpnPhOCKMsEqVbu3e1YTIH04CEmQKb1b83jrePJ+1AqdwYBEZegkRsvoJWPyurG2/1BgBMrS50sHmw5PpvEf5QXhbdEEhiB7FSznfPn1NYNiVlgJMHABORIvrF76j603piUto3vyyJhPoY5gbOt0uNHk+i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=WYFUaeHT; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-595819064cdso914403e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 01:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764234887; x=1764839687; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X03jox/gV8bqLBLEBTR625O9w1oSc+eeKS2ioi2DhKA=;
        b=WYFUaeHTCcZh99fNLyg4ZjCVWMHQInJ4eA1K7+hq/WQJjQDsK/MkEK+wSVvyqeuXla
         KQa1t3ugiAEhdhvw5FvDcYQF8hkf+S9JRACEIlFnj3VNJmxNFmVmloBvRI9XUUrMNNfO
         NmPNMA4MP0Rw/2YFqK6ctPM4s19cMSCQdeQgtQMihpOQsIDy96B/KeuwAEo1tirvPgTB
         pAev8SvLVNCUeU227JfrXqZ9bW0ISv9TY3tN8kx3JZMvbUwnG4hz8CC8GNCYSqsMUPVm
         4p4cqX3cEnv8LNJgZ6I2AGQm235EbNo/jgAtE2WSpViVqhBgk85pcb+xn31/dvq+fQgL
         1yhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764234887; x=1764839687;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X03jox/gV8bqLBLEBTR625O9w1oSc+eeKS2ioi2DhKA=;
        b=FOhIQ5+Fk6tUtz+pSnRZRt3Q+rSsdnlBJTG4RbqaAY1s/pkAF15fLUlsYuS1z1PvBM
         SccMKSErJ348dxCuVVi1JL5/Xs+VbptRARSFVPvu1sagnkf/zCc9UaVZPJGEn4oAC39y
         JG0WE9zh2aPh+CoDo6kVEJw2ctJU36cJOG3fsPJCFviwsc8Mx55wNTGy7yZpmEU8gFP9
         yqPPGBL95B5dr8OG2ZjsGSp4X4dkdPMGmp4eNzmaZq4xSP8BGhwPGtcI5Aclp8v09RpR
         PBi9ZwnPiEyaCb2X9dIDFEpA7MR9ofqMAq76Vs84PSTsXwGwwFtgF8CX99+HGuR67CFQ
         fYTA==
X-Forwarded-Encrypted: i=1; AJvYcCXHwZZuXxbbk9mBb3T9ibBmLD18YRW5tGZA/l7CXUHt55fW+PgN22kdUrTVeyQK7mFeX7QjWBXHFVcm6bhn@vger.kernel.org
X-Gm-Message-State: AOJu0YzZSjSKBOdOKrRcJutMBEXY8qD7NVOXPpEEaKV1nUjejc+zvPAb
	aq6JFJT4HS/bMht0f9MbYkCkgFvN8CqRCEjWaYhyhfogQCWpMpflQKyCSd78nODF6+VsV96mFfJ
	YtzUa3Z6ErETc14p+hxcg5iBR0H9KTHD8m0KFGDQRaw==
X-Gm-Gg: ASbGncsHn0MrpdiEIf8JOLC2RsOuYAmJ7iHR8AN4BcO68Zz1O2y4MpktRX46217Sfcg
	UdtWHI9UP0JLkm9rDt7PL9GvZQbeSzo1eiPkgPzr5BwKYm2qbg3nVNpJ4ASyF1413AGp9SYX6AM
	Xm7QtohakhPjr/vfiJpnnB7sbr0C7iPkHhP0Kkdsy9wJMhtEFyW2AU1Ti18oIy4tRDcPQbR7/rO
	W68UXeSJNOr6NQ4gKMI2D604h6E2MHcbGxP9y6oqaKKi+XePjEoFAVNnM/MBOKfRf5hng9ZDdiP
	HNtjLEnX2jUBI/JDtgZXaNJsBgY=
X-Google-Smtp-Source: AGHT+IEbc2TbO/tYVAauVYSWlsGPpU9aKscxV4CCCOtz2gTp8D6aQtAJcJ71cXNyLsAVeBjOKBJwqCStf35Mbf46OXA=
X-Received: by 2002:a05:6512:8010:20b0:596:9ebf:25a2 with SMTP id
 2adb3069b0e04-5969ebf25d0mr6811454e87.19.1764234887164; Thu, 27 Nov 2025
 01:14:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125-pci-m2-e-v2-0-32826de07cc5@oss.qualcomm.com> <20251125-pci-m2-e-v2-3-32826de07cc5@oss.qualcomm.com>
In-Reply-To: <20251125-pci-m2-e-v2-3-32826de07cc5@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 27 Nov 2025 10:14:35 +0100
X-Gm-Features: AWmQ_bkMx1pQI7KIzXZheaED5_3WOsSVYkYxsGF26N74WOl7tj2ktgI1roknym0
Message-ID: <CAMRc=Mc_=F3HiKCVh26RtJ-8vcFWbdRRFS5R8tJa7320W-Tcig@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] serdev: Allow passing the serdev device name to serdev_device_add()
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, linux-serial@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, linux-pm@vger.kernel.org, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 25, 2025 at 3:45=E2=80=AFPM Manivannan Sadhasivam via B4 Relay
<devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org> wrote:
>
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>
> Instead of always setting the serdev device name from 'struct device' nam=
e,
> allow the callers to pass an optional name and set it as the serdev devic=
e
> name.
>
> This will be used by the future callers passing the serdev device ID as t=
he
> name.
>
> Acked-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.=
com>
> ---

Instead of modifying the existing callers with an unneeded argument,
I'd suggest adding a new call - serdev_device_add_full() or something
like that - that takes more arguments and make the existing function
wrap it.

Bart

