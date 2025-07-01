Return-Path: <linux-arm-msm+bounces-63264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9AB9AF0171
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 19:13:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F6BA1884F62
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 16:58:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05D8527EC7C;
	Tue,  1 Jul 2025 16:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="o1uSGvQn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D72192D6B
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Jul 2025 16:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751389088; cv=none; b=KUpftaW5QT+Rjv1DqSBxheIB6fHTNmZXwl+jcvQvLcXduI65UhC//1om9wpbrHXFwCScnJukMiUrNen3o55U1fLFk5FN4k9F/stg5+4qsmjfNitNqR5E5eRL9Jf16Lef7LJAtxQlFjyHibbpBCAkE9F4ArHyrFGb46cIyccUmwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751389088; c=relaxed/simple;
	bh=dzI4RRItBwP5q3Y5PX2f12fubIl/5nheXaVm8tXeqzs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mmhhdsoqEo+AUJaksey2aRr322Y76/2SC3o9JvUj6rnQWZyDtQzEfAfMg3no21HSd28WHDNImdpWEMxDlv6r3o+5VFeBinx4JbmEYxujnt73Vma6K+SwWra7QLeJWpxpFKeB5HlNcTPUR0mThbILvdOVt8Be/HFuiDdIOlc6aBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=o1uSGvQn; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-553ba7f11cbso6966570e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jul 2025 09:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751389085; x=1751993885; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dzI4RRItBwP5q3Y5PX2f12fubIl/5nheXaVm8tXeqzs=;
        b=o1uSGvQnoBEy+UbAFy9CF84H7qNMhTqxEH3HUkeZW3RvShGbjlnfkQu93n/0SLjyMt
         gX1tXUt4hheVI9bqOti6idL6SzxwDf74cFhyE5MBjPIVJiItmVn19/8of8u0t4IJf2eg
         1vysT+58K2YwFGIDQuCaV5AglbHyPlACQHpXTym/MbglVOSaa+BVTk6mvzrsuZB7cV5r
         T6FXggU6qs1JPnpJbLXE7S9eJxjghWpwGEnb1Z1rJCS83LwN+Tykw/BEvUKhtVevgyZu
         2kHTc4BjyWC1pQ3SGz3n64OlMXHBtMGYY+WSdGtO6CewpX32yNy3zf2V3teT80Z8b68X
         XsWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751389085; x=1751993885;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dzI4RRItBwP5q3Y5PX2f12fubIl/5nheXaVm8tXeqzs=;
        b=wqJ5pJKBEMrwUUe4KFUYLdCVTZfLhHGY56ovH6b9wCIZ2fg96OpZL0qBKEWMPd2wTx
         PedToxLq8RE9U5kdgsJd/18jAD3AeJQWZ3A3fuEPyR5l0Fs/NLsijOU7agoD8wSrXljJ
         tTxWUbcvlvLDPEq8IkNxnpQVJ2GLd5NnBqV6t9SXMxOyOb69/WMZkRxt2oxGNxj34neT
         F81nAs5/O9YQrd77uUqP9MDtrche3NOmp2K+1vJxEkrdDgrDKQaHdIca+vibhHrBQ75H
         Oihy2RItwoFal/v3gUlOGM2+wjyoQgZZmUSGTlaQOrLFamQxD+7NrUqOlH09gVWn6UHx
         GgTw==
X-Forwarded-Encrypted: i=1; AJvYcCV9CLPOIczJN3WC+m+0EynobZjSfc2hGS1xieqfT1IIjt+gSBfKBBnjMsGogF2ITbG7XhUuaZvmopAJM9bg@vger.kernel.org
X-Gm-Message-State: AOJu0YxjLnacHrQEABOfZOv9aXXL0Fl5oJeogdISc1PL8nnaUl145SmR
	weQbMVpHJEK00mgLWhVAvwBdahq0wx4ZbrXCb+kihNmUsoIf2/0auL5Jiv/d/WKQI3gMBnYv43I
	N0QEAukpy+z6Pe8/dAqzvLz1b1aNz1R7OVq0zQI8Zvw==
X-Gm-Gg: ASbGncscjmjaE4Ba6fmOTG+gTgmKMlqElw8EqArDROFP0upOxbyJddR1THLevG7QxlU
	VYkRX2Ysxn/vDO041pZWxJfd5iXVINKU0dEkUrb3IOr26unb6RvfSPKV6q85hUqkA4lxa3qSz72
	5/qH3xiF7xAFboVJRwme6YX/+8/I38ciYp4HVNJZbhnK97bFBe2Dx3ytqeguWaBhrADw72Q7aYd
	Bs5FQDChZaV
X-Google-Smtp-Source: AGHT+IG64nPVO4Y/HQMnxFfKxk246jSY9LbY+uqXpxjn3azvh8I161aO5RqsHD6Sfyyidkbufpf3uFPmik9YHQGyJsI=
X-Received: by 2002:a05:6512:3049:b0:553:2418:8c0c with SMTP id
 2adb3069b0e04-5550b9ee29emr5961397e87.57.1751389085164; Tue, 01 Jul 2025
 09:58:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250701-qcom-gpio-lookup-open-drain-v1-0-9678c4352f11@linaro.org>
 <20250701-qcom-gpio-lookup-open-drain-v1-1-9678c4352f11@linaro.org> <DB0UKX1N7VZ5.VYBEG94Q6Z5I@linaro.org>
In-Reply-To: <DB0UKX1N7VZ5.VYBEG94Q6Z5I@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 1 Jul 2025 18:57:53 +0200
X-Gm-Features: Ac12FXzDTOrYTtHpYNbE_jTA6vgiJc1jLZBGQpE_nFsAEMlIS3CpRo6kKLC1EjY
Message-ID: <CAMRc=Md6+p2wT5rZWOBwUMFcLw_p4rANBxbG4pvWyM6AuW1wAA@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: qcom: qrb2210-rb1: fix GPIO lookup flags
 for i2c SDA and SCL
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 6:09=E2=80=AFPM Alexey Klimov <alexey.klimov@linaro.=
org> wrote:
>
> On Tue Jul 1, 2025 at 10:01 AM BST, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > The I2C GPIO bus driver enforces the SDA and SCL pins as open-drain
> > outputs but the lookup flags in the DTS don't reflect that triggering
> > warnings from GPIO core. Add the appropriate flags.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> This works on RB1, thank you!
>
> Tested-by: Alexey Klimov <alexey.klimov@linaro.org>
>
> This also should be:
> Reported-by: Alexey Klimov <alexey.klimov@linaro.org>
> hence Cc list is not full.
>

Thanks, I should have added it when sending.

Bart

