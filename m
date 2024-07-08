Return-Path: <linux-arm-msm+bounces-25537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F5A92ACCD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 01:58:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 44E8D1F21D13
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 23:58:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEA9115359A;
	Mon,  8 Jul 2024 23:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="muMOU5eM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301E21514C6
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jul 2024 23:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720483097; cv=none; b=n0GptgD93g+OhS2yL5Rc8dgTowESeTJX9/M8w4vWowFef3sOmNb+XOS5TiuAFLYEsZiNLNGAMe2BCxCAysQu3GAyEP2OLN47b4oSTeQ5BzU+bPP7Hce5yoi7T/4g10Y5nwPTgRtSzEdsZQ2TCIfcVvLoBk4AkXA9vncdahIppBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720483097; c=relaxed/simple;
	bh=7EN+YIsVbTIxzF1Z9SvdOZ/EM3QwsvXIiX7ZgAcuanQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dHgWtjFEj6ty0rrrdVYYLfOquaFgEbdWg7Y2mXzPcQfIW9mBv6RCKrL8eK+8rY0AjkGf/ouAfZlZ1yty9goCvD+pAvCnS+9FPfwbgAl2eu3FaXXhceiKutFWwjj6AUJ1V0PJtX2W7PnQjWsBpIfrn/qFRYf2Uk9+mxOJ4cIZI78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=muMOU5eM; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-4f2f51eb86bso1642964e0c.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jul 2024 16:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1720483093; x=1721087893; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Swlwf183naPwNtrfd1IMk+Z2jSuxIkqYhMm0lDWZmQc=;
        b=muMOU5eMOmi4c8QMQXVi1wGbnoOwQ/oM36riQc+wRKquHPDpp92r7F7hAIYbLb4XCd
         NCxnjEkqG2GM6PkyzFGzqHd7hlhHI/3m6R6tjgNT0S14hqvKs+GEIgAQ0QHBrslZJn8v
         MfZZsUiFMFW3RCpmaV2yC5ybXFgeTkVYvp4rs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720483093; x=1721087893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Swlwf183naPwNtrfd1IMk+Z2jSuxIkqYhMm0lDWZmQc=;
        b=Mqrf2+2xfKwD92coQgIjiD7apcPi7s8Adf06KeNsyFbFhbFZjpbuhhJhPaVDRVwfGy
         +ufR+RviSfp5vAh3+LTYwUQvLl2Y0J9z110bKA+riOfuYbhwxO9AqudhTaeh96uYEeuW
         b0yUiZSzNvW9xLEjuwg83fe5OuuGuvNRoFtlOnhRZK4tDROIj6iZHcbgzPRWtEubyGoN
         oOAPs0WrcXL3ifZy9OeoARKyMY0UOE3tfWiL/jcoIwtSlJ4wU8LVmZzp7g7UheK+01lh
         i0PyFJPEe0o+kOBchomyovcIf8fbROX3wxnnXmcJONkpA0TCMx7S1EAZz0U9vo7jzH/8
         KhQQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+OFvrHcVqmTKIW5Li1DO99C5VcE8HrNfDBuQI2yDcjx9IisvljgpqfYEabsm/JmGgOCg7KUix7+Iiot1WsP820RYry3Mu3WSKO2u55g==
X-Gm-Message-State: AOJu0YwRqesthJkAwIcH8G2rwJtyMly3PYbbl10LqlT4Q4xKRzpiqQ7H
	lp/zQejEjxvjXlRBa8XiHGAB2P3utJSZyGWHaZ3oGYXyQ+2uncHYVEyNVoFqDa60w1XW9wlY5DT
	8b498
X-Google-Smtp-Source: AGHT+IERteUqYKT7WftRQL/DAb43zL/uafM5Hjo5KOwmJE6e6cr5kYlWg/wyEboHh3BZSoZdwx8M6Q==
X-Received: by 2002:ac5:cfd7:0:b0:4f2:ffa9:7700 with SMTP id 71dfb90a1353d-4f33f36e8e7mr1063356e0c.15.1720483093122;
        Mon, 08 Jul 2024 16:58:13 -0700 (PDT)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com. [209.85.160.171])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-447f9b5791fsm4526651cf.47.2024.07.08.16.58.12
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jul 2024 16:58:12 -0700 (PDT)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-447f8aa87bfso169341cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jul 2024 16:58:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWxtq3fg5hwmvJZ67KJnJB33PRItqvZYl97zQwcyo2vSwygmejPaoD1CB7WVtJtE7KZV5sestOhGLrS+k9a991+cYYZkGrZt80BRmKQ1g==
X-Received: by 2002:ac8:7f4e:0:b0:447:d78b:fdf6 with SMTP id
 d75a77b69052e-447fb1ff3abmr1790991cf.10.1720483091723; Mon, 08 Jul 2024
 16:58:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240704101805.30612-1-johan+linaro@kernel.org> <2024070445-stunner-scrawny-1b03@gregkh>
In-Reply-To: <2024070445-stunner-scrawny-1b03@gregkh>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 8 Jul 2024 16:57:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X0Sk0Xkz7Mcna6BNhGpxZQY5KArY=LqMPEwbocvmojQA@mail.gmail.com>
Message-ID: <CAD=FV=X0Sk0Xkz7Mcna6BNhGpxZQY5KArY=LqMPEwbocvmojQA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] serial: qcom-geni: fix lockups
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johan Hovold <johan+linaro@kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Johan,

On Thu, Jul 4, 2024 at 3:31=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Jul 04, 2024 at 12:18:02PM +0200, Johan Hovold wrote:
> > Since 6.10-rc1, Qualcomm machines with a serial port can easily lock up
> > hard, for example, when stopping a getty on reboot.
> >
> > This was triggered by the kfifo conversion, which turned an existing bu=
g
> > that caused the driver to print discarded characters after a buffer
> > flush into a hard lockup.
> >
> > This series fixes the regression and a related soft lockup issue that
> > can be triggered on software flow control and on suspend.
> >
> > Doug has posted an alternative series of fixes here that depends on
> > reworking the driver a fair bit here:
> >
> >       https://lore.kernel.org/lkml/20240610222515.3023730-1-dianders@ch=
romium.org/
> >
> > This rework has a significant impact on performance on some platforms,
> > but fortunately it seems such a rework can be avoided.
> >
> > There are further bugs in the console code (e.g. that can lead to lost
> > characters) that this series does not address, but those can be fixed
> > separately (and I've started working on that).
>
> I'll take these now, thanks!

Are you going to continue to work on the driver? There are still some
pretty bad bugs including ones that are affecting Collabora's test
labs. Unless you want to try to tackle it some other way, I'm going to
keep pushing for something like my original series to land. I can
re-post them atop your patches since they've landed. This will regress
your performance but correctness trumps performance.

-Doug

