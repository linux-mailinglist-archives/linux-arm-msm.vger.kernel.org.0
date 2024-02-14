Return-Path: <linux-arm-msm+bounces-11020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C775C854D35
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 16:46:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06E011C21265
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 15:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A43925D8F3;
	Wed, 14 Feb 2024 15:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="CB5dhkms"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC915D757
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 15:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707925598; cv=none; b=h39L669pnnJ8LrS7flYiDt6aho6jX+4nvx4DWDgOi4xL9iAeX5VohYR5KGuE7c5wZjBt1P3J1fyoI1tcTfJd1SaRzbohWHHxC6S1l2MORluepPUFytyIiOyTp9bod8OYIQP3e82soyrT707qxkoaDQn4n7bAquaFxnKHDa1r65k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707925598; c=relaxed/simple;
	bh=nXt2NydxVPyI52wKlorJbsmqB3Y1sW0XBLcflaBdxWI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RkQGD35oGVr5W2IrFYysURyshNQYWs1claSrr3AnXADEq360t71MtLLCP3zi4lyHBfsS/7pT/kWH9NOsPN0neDAWe2/M0m0BtSpWFg36J0oR+pIGA7sXcesKRhb87v4WI06UGVC1XBAe6AVOk7V0BhIyW8ivNARDjebJngl66qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=CB5dhkms; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3bd4e6a7cb0so3941772b6e.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 07:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707925596; x=1708530396; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=43U0prLBEviHcCJ3pSlb1u8y9sUlYBpSR6dl+zr/IL8=;
        b=CB5dhkms/IoQIZ0SSZkK9qtAUj1aDMxKzE8xM4f9PrWezhuGOsacgz4YP2KGzuisXO
         Yypudkqr2k/5n1+E6iTB/wf13I60X7EiEeAI9wGRgBQAZPlD/uCwJbX1D0iDVI3HsFku
         WHDw1EOiOjFemrSSQqb1dYtDtyaYwhNkkM3EC5LG7g7BwmT6wg0ca8BoQ4iY7PpUL8SN
         GQM6o8+LDI/wjkx0bLASEhFzVRujNmkyye7gHLbAzAL6saIlLtv6sjYsrwK/mWKDh+NA
         CqQtQWYZQLEis8ERh3yCubqJPDzxDkdSrwt2WwlXUdnisDvZxgYMMoIS+ZFsMk7wOnKS
         ScUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707925596; x=1708530396;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=43U0prLBEviHcCJ3pSlb1u8y9sUlYBpSR6dl+zr/IL8=;
        b=Aos9XzFfbTV8oqM+8QEAHGv7uba9SpGUXuw5VDzc+bWvG9A/e/kMf/IsZDf9LyF9K7
         kXovoa8LIiZVnaAJp0fuA7O468DAMrFeIhYn04qfbz5owe0DWNTqwqXhKJYC5WLyK2Mz
         OtPVdyALj2rf7OL4UETF5alYfnB0VoiF8ashB1SwJZGcx6YMQsX5S4K6xe8r1eYdgruv
         nwzePsBGhKcyN35DGWFHBeNl+9puWLZfjYnOB8vtz08gkTHMr647FMQ7ztd0czCne5ue
         6r6+jEw6YeHxyxGU5/m+I5oXXHkL4J17DQVh2z3iphW8hDaD2aqsXwnlTXeK8gS1SV7m
         HnXg==
X-Forwarded-Encrypted: i=1; AJvYcCVMmIFRaVymCYNJSXN6lvvu7My634CWFj84NDM4eJqM49fjnoZmPjyV/vIKh8n/G1SabkSo2qTI4NLVslz6dgT6v9e9wlUcGpUY1QX15A==
X-Gm-Message-State: AOJu0YwgKZeeYesBwrFoPySnlp1OT2n/E6HBJZADCrCQHZWQxgyvNzPm
	kkwyMKbWd9YD+dKK0AQ3srRspR6UcYzuFK/tbo6LyWr/0l4379TfzA8gGpQFqbyej9yj1SkCMpb
	vBDvckdZoSOShYYn8I7jdyMQNfD4jLk/P4Kv9Og==
X-Google-Smtp-Source: AGHT+IGq/FPDHURxZuXkT8EEMfyOBxQIWZRGOM045VqtAvTD1CETCELK38VG/mvuBgw8UVUij5Aehjzrk5JxYSrtPyI=
X-Received: by 2002:a05:6871:551:b0:218:55c9:bb20 with SMTP id
 t17-20020a056871055100b0021855c9bb20mr3419259oal.21.1707925596168; Wed, 14
 Feb 2024 07:46:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240201155532.49707-1-brgl@bgdev.pl> <20240201155532.49707-9-brgl@bgdev.pl>
 <7tbhdkqpl4iuaxmc73pje2nbbkarxxpgmabc7j4q26d2rhzrv5@ltu6niel5eb4>
In-Reply-To: <7tbhdkqpl4iuaxmc73pje2nbbkarxxpgmabc7j4q26d2rhzrv5@ltu6niel5eb4>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 14 Feb 2024 16:46:25 +0100
Message-ID: <CAMRc=MeM_ys7_Rk2=yhEVL6pe1bWQXqS8r_Y7P-SMQ_cTCMebA@mail.gmail.com>
Subject: Re: [RFC 8/9] PCI/pwrctl: add PCI power control core code
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Alex Elder <elder@linaro.org>, Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Abel Vesa <abel.vesa@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, Lukas Wunner <lukas@wunner.de>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-pci@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 2, 2024 at 4:53=E2=80=AFAM Bjorn Andersson <andersson@kernel.or=
g> wrote:
>

[snip]

>
> > +             break;
> > +     case BUS_NOTIFY_BOUND_DRIVER:
> > +             pwrctl->link =3D device_link_add(dev, pwrctl->dev,
> > +                                            DL_FLAG_AUTOREMOVE_CONSUME=
R);
> > +             if (!pwrctl->link)
> > +                     dev_err(pwrctl->dev, "Failed to add device link\n=
");
> > +             break;
> > +     case BUS_NOTIFY_UNBOUND_DRIVER:
> > +             device_link_del(pwrctl->link);
>
> This might however become a NULL-pointer dereference, if dev was bound
> to its driver before the pci_pwrctl_notify() was registered for the
> pwrctl and then the PCI device is unbound.
>

Right. And it also makes me think that right after registering with
the notifier, we should iterate over the PCI bus devices and see if
the relevant one is already there.

> This would also happen if device_link_add() failed when the PCI device
> was bound...
>

Right.

Bart

[snip]

