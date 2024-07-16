Return-Path: <linux-arm-msm+bounces-26267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA12931FB7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 06:30:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43C841F22061
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 04:30:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6189714A82;
	Tue, 16 Jul 2024 04:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="DQv1XXnl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B8810A11
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 04:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721104197; cv=none; b=RVkeWcikiWoRyVGRXdXpqruSn5n2PCcBR3Uxny68RIJbuSlvscvMgK8kX549N/wMERjF1fi6iCIfD83jtFmD4oJ4/B66a+S0+Wk61+5BqfKjA+3+/O27+kFecnbiODmdWdO9mPABijPg67CVpmO0HPZ6A4K7Yj6nrMkreRUw+yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721104197; c=relaxed/simple;
	bh=Fxaw7Ng7X6+7vJdzrKhj430hol4ifALArDkQpc2cjpU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M/ism2NTYhT/9sfqtWZ0ZkoqeGn6M9brOGJp4nB+/SOZcMCFcgYfXY5ALgKatrm/v4p6C9nZ/lgdyCTc9oWsaXY2GsSgC8qwr8DWvKDuF574pReDDw8RZWbC1UG5mYPbwXUk3+ebTZ2VuPEu/P+T06+KJuw473hiPxjFa9DRYiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=DQv1XXnl; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52ea0f18500so5199862e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 21:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1721104193; x=1721708993; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iubjZBekOpPoOdvguIEUCzz0zvPcWVts706zRXNeNzw=;
        b=DQv1XXnlfp5iHcf83CSoCPTgHbQa5eomip02DQCGgXMn15FoHbDAUnkU0c+8zRuCba
         ZMPlYvR5ka2rXpWD8cWz1GYxI5C8/7UwKM6TcIfvNYHpC5g2HOdg5V66Moy4c6bzZMaa
         gTsNenYA+pBqf/nCdHO3cjnnD/7+jB6BWXVfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721104193; x=1721708993;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iubjZBekOpPoOdvguIEUCzz0zvPcWVts706zRXNeNzw=;
        b=NGA3tKaWxiCXadFa6sVfHI4kijMQWSUUcCrmsC2nbvTQDReda/NLe2AJR1YGCD2gGS
         WasDsNP1SKKnWz6+lXjY82dRggdXqrd724aUlL0h+ypE1b3EQUjslf12ZGIVQIq/hWcV
         Gd1ulNRIFXeVWJOTMo2C6ySGhM+MDL7OOeIH3coj7hMxQRiS6nDDAeyzeXFjJo1L7t8z
         HhKxZGzzmCIet0vWJ4k29eplnjFOHd+GoTsv1d+MZHQiJiZ89MD9b3KDUJ1lS7hQ4EMR
         ipJ5If8lQIIqQSPA2j0vIk9GNIyeFvoV0+U1VZJ4OsrPMSGnBxuEoVnRf/pzZNQtLFKc
         OkGw==
X-Forwarded-Encrypted: i=1; AJvYcCXlf7VfpGCFxNd+WIN4hwt3kgoUFVk4z1SZu8UcbmI+asieAh6pgwexuWemdBFsc07zyqLGII9daS3ZbUtN3zepF7wbCvWeWXchoeiYig==
X-Gm-Message-State: AOJu0YyYUkC904qbx4Xo1AjZUFeqUZAetNUM/bE5sAXAuEHT1cOrBKw8
	Mg5HQbBpokWkEi/2a9hICeC/5TLhy5hTs4D1u1OhiOo4m5HbPquyYBwou7Z4UUoAAX+h4MhKwIJ
	a8i4PNg==
X-Google-Smtp-Source: AGHT+IEBCOMVqmPV5hVdVE6ndl9/PBoj47d1uFSLcv4m15IUKeB7dw5xcc5KdM7sZzng1rKSp9Vmzg==
X-Received: by 2002:a05:6512:138e:b0:52e:6d6e:5770 with SMTP id 2adb3069b0e04-52edef21713mr500982e87.14.1721104193501;
        Mon, 15 Jul 2024 21:29:53 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79bc5b7ebfsm260251066b.67.2024.07.15.21.29.52
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jul 2024 21:29:52 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-58ba3e38028so6529090a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 21:29:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW1VB+FsKpentrKc5oMZTu+i4dASbQTZMigNvJGpTwF7vs2oAMuwmQ5jReXvkJ+zUT49bMCAWktTGM18cLByJBqhyHlmOsre6gLJWolmQ==
X-Received: by 2002:a05:6402:234d:b0:57a:1e0a:379f with SMTP id
 4fb4d7f45d1cf-59eee832048mr631175a12.16.1721104191819; Mon, 15 Jul 2024
 21:29:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240712091008.14815-1-brgl@bgdev.pl> <CAHk-=wjWc5dzcj2O1tEgNHY1rnQW63JwtuZi_vAZPqy6wqpoUQ@mail.gmail.com>
In-Reply-To: <CAHk-=wjWc5dzcj2O1tEgNHY1rnQW63JwtuZi_vAZPqy6wqpoUQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 15 Jul 2024 21:29:34 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjcO_9dkNf-bNda6bzykb5ZXWtAYA97p7oDsXPHmMRi6g@mail.gmail.com>
Message-ID: <CAHk-=wjcO_9dkNf-bNda6bzykb5ZXWtAYA97p7oDsXPHmMRi6g@mail.gmail.com>
Subject: Re: [GIT PULL] power sequencing updates for v6.11-rc1
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Jul 2024 at 19:17, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Hmm. Let's see how this all works out, but I already found an annoyance.

.. and another one.

On my Altra box, commit 8fb18619d910 ("PCI/pwrctl: Create platform
devices for child OF nodes of the port node") causes annoying messages
at bootup:

  pci 000c:00:01.0: failed to populate child OF nodes (-22)
  pci 000c:00:02.0: failed to populate child OF nodes (-22)
  .. repeat for every PCI bridge ..

for no obvious reason.

FWIW, -22 is -EINVAL.

            Linus

