Return-Path: <linux-arm-msm+bounces-11683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 967AE85A3E4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 13:54:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB83B1C21710
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 12:54:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E66CA31A93;
	Mon, 19 Feb 2024 12:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="udQ3cv9J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34D931A7E
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 12:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708347251; cv=none; b=u2yzLqAx4SsI5yZml4AybKQBdwvHwtB4zdhch8dmqngmdoBBM1K1eBzyqUWrSZcVBITKNUlF5x4MxFTq3w9f4kwOUqUACrllDsKA5wUIixgslayFVjVM6GbTDaFr5pZIhqOJ2NtprPUTajlpJ0b6vGndLsq+yoDqEgVvyyCRZQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708347251; c=relaxed/simple;
	bh=sVsdNaxDrQaT+5xLkuNNBvQ4+mZpUehI+ER8LAoDUdY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fTWo7w6r01pF9wJUMHymwOwYByzKqgOTFdVBIMxPZVbNgA+/6ggl0BvL2YvmTCkfi5Fi6vzlxR12Buk8veZKD/SzcgbAzArId+d/PcDoIHA7itV30pZC8Pzhg1Lej1k7AICQRusqkUbwLkSlEbHDnJ99aoBUtFZmWr63xlWj+Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=udQ3cv9J; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-7d2e1832d4dso1395347241.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 04:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1708347249; x=1708952049; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sVsdNaxDrQaT+5xLkuNNBvQ4+mZpUehI+ER8LAoDUdY=;
        b=udQ3cv9JtqKeraoYuLqdfWfwCCI8IqdYdtHNz3famgOyfzEASJbnUbi9Ip4iBFsEfQ
         Kl8HsjfC+7SkcF9V5ISgTbGDqgyoHJRrjgR0/PfVtTCIysmhpDAH+oe378A755J6JlXM
         1r94W6myxOuaOuRiIVphSmifjG0c6dN6Ppy0iQ1WbUj5I9pPZilN2tTRygjbg9MKHk3d
         pnM2uYsVw244oGzm9Y/8g4n35ljis+R+dRxgOYJIEg4XNhXjTDndDIcQhpEsUBMx+Bzb
         /xqB9GlsDT2n1v4h5B+LoZr03fuAttuy4C4vf+rBZrpUOCRTZoFDTdRI05jcpekZ90R1
         U54A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708347249; x=1708952049;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sVsdNaxDrQaT+5xLkuNNBvQ4+mZpUehI+ER8LAoDUdY=;
        b=MLefsSLtXOBs3wRMbph3PcxY5rvdwYw3u1VGnLhXSZ0cDTZHTQSGay7n+S1VdNG1aP
         sPLMI0SWIV/S1ua4vGN4ly3q/pYVrcDd6xbho0gdf4EW7ogSshiV+Wjtn4xnoQ326nqm
         1uToULWRIbC1lPWkwuqsye+VrKdb7Lwd6xxV0NEUR5VoBkrITqOInotF0Yq77J6Vs9nR
         RXMy7BV3ZZDlmsv5e4ebw29A0je0RQxpD3u9NgDkcLMs36qXaYoB5G1OiT65whGSzIX/
         0Z/JAeLztBfnOXkzOJvBzRdKJZMV3WeBJEWcf9zpw3WWpti/C9KIwxlpuDx0U9Q4ji8a
         +rQA==
X-Forwarded-Encrypted: i=1; AJvYcCVBU1/u9QQNtzfmQYuwK3Kst4kQL/L4uI9CPxRRTtkI24QWOwioACGV5KB8IP5OuDHZEERaiRaAJn1DYljYc4xeNbhJ2qeCxikYr3AKDg==
X-Gm-Message-State: AOJu0YyixXwj2BXd5aJ/OkHXWsc7XGB+hiT6Q183Eh2KGSGLeyyd4puI
	9Qd/yZ9pDCArafJyDDnEcWIA7CU+cqnPEnC6OWhqDRG7cyNK/Dv75oWQf4QWorCQcFKjpLe0ohp
	7rR9qNiUVyDWz2O1BRy3LHnHUeLkWpP9JT4LZzA==
X-Google-Smtp-Source: AGHT+IHxyvxbs8UNV+RvesaBK90xtZZfu2Xu6HFPB14T7Tm6G1AVsPn3zgxyvNAFZBNi1d1T6kkfRUxMA6fnOOW6aBY=
X-Received: by 2002:a67:c902:0:b0:46d:2b65:aa16 with SMTP id
 w2-20020a67c902000000b0046d2b65aa16mr6787860vsk.34.1708347248824; Mon, 19 Feb
 2024 04:54:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240216203215.40870-1-brgl@bgdev.pl> <20240216203215.40870-4-brgl@bgdev.pl>
 <ZdDVNbjv60G9YUNy@finisterre.sirena.org.uk> <CAMRc=Mf9Sro4kM_Jn8_v=cyO5PxCp6AnBdeS9XspqVDGKdA_Dg@mail.gmail.com>
 <7c1327c0-d0ea-4797-a5fa-5844ba46bf53@linaro.org>
In-Reply-To: <7c1327c0-d0ea-4797-a5fa-5844ba46bf53@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 19 Feb 2024 13:53:57 +0100
Message-ID: <CAMRc=Me=3HhGc_yZuaEo1TsLbF2R=g+072185_PAh5GmAQ-M7w@mail.gmail.com>
Subject: Re: [PATCH v5 03/18] dt-bindings: regulator: describe the PMU module
 of the QCA6390 package
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kalle Valo <kvalo@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Saravana Kannan <saravanak@google.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Arnd Bergmann <arnd@arndb.de>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Alex Elder <elder@linaro.org>, 
	Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Abel Vesa <abel.vesa@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Lukas Wunner <lukas@wunner.de>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-bluetooth@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-pci@vger.kernel.org, linux-pm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 19, 2024 at 8:32=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 17/02/2024 19:32, Bartosz Golaszewski wrote:
> > On Sat, Feb 17, 2024 at 4:48=E2=80=AFPM Mark Brown <broonie@kernel.org>=
 wrote:
> >>
> >> On Fri, Feb 16, 2024 at 09:32:00PM +0100, Bartosz Golaszewski wrote:
> >>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>>
> >>> The QCA6390 package contains discreet modules for WLAN and Bluetooth.=
 They
> >>> are powered by the Power Management Unit (PMU) that takes inputs from=
 the
> >>> host and provides LDO outputs. This document describes this module.
> >>
> >> Please submit patches using subject lines reflecting the style for the
> >> subsystem, this makes it easier for people to identify relevant patche=
s.
> >> Look at what existing commits in the area you're changing are doing an=
d
> >> make sure your subject lines visually resemble what they're doing.
> >> There's no need to resubmit to fix this alone.
> >
> > Mark,
> >
> > This is quite vague, could you elaborate? I have no idea what is wrong
> > with this patch.
>
> Use subject prefixes matching the subsystem. You can get them for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching.
>
> Best regards,
> Krzysztof
>

Yes, I always do. And for Documentation/devicetree/bindings/regulator/
the subjects are split 50:50 between "dt-bindings: regulator: ..." and
"regulator: dt-bindings: ...". For Documentation/devicetree/bindings/
it's overwhelmingly "dt-bindings: <subsystem>: ...". It's the first
time someone wants me to send a DT bindings patch without
"dt-bindings" coming first in the subject.

I mean: I can do it alright but it's not stated anywhere explicitly.

Bartosz

