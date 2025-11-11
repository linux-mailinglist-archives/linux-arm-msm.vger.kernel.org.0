Return-Path: <linux-arm-msm+bounces-81219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0B6C4D31D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 11:52:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 980F14FAD8A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 10:46:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DD98350A04;
	Tue, 11 Nov 2025 10:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zCzix8om"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7852E9EAC
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 10:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762858013; cv=none; b=cORL1R6Vf2gnIWaEX2uGH9DKzs2X4S8hWNYF8XGB0SC0TvdNVsw0sXoNgGxKpe9GFDd6j7i5SY17BWuIEn0VFFdtfkaERW5i07/Kjy4vX1nFPFCR7bSlZ6E8x0vbEKX/sMZtETKDwEsjRiksLdmup3MiVf6em5l19DDIong4B/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762858013; c=relaxed/simple;
	bh=Vzxu8qssjIhFl+4HzQqYw3E2J9WYZzlt8qmmQpR/9RM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YpHim/O2CFwvDnK87U3KwnFl3Ufn7jzoyloLDzT+XAUuGJSpNFTnz8fNPZ4duscUnEOevDNHj2CCdo7q5KxRCNw18/bH847/ZvUc+LI+o2DTl0DGZj0cRl5ICoSjd48AINGVxdOy2Dt0bB098RetYXc2SpgnwFPQI/eTLTSs2j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zCzix8om; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5930f751531so3758636e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 02:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762858008; x=1763462808; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vzxu8qssjIhFl+4HzQqYw3E2J9WYZzlt8qmmQpR/9RM=;
        b=zCzix8ommVmBggohX2nU+Nx+FqVGx4/zUmmK+OjaJhvAI3brORS7qwNax8HvXSpXh8
         CcJa2oGucKwgAfdrStMagzvTnzRg7Bv65JgpYOlGqq4MObFK+/GMg4fEFgp2K8zCGhlo
         DWMiqIcU9N0+bL0z8Ft3BUIe1kSxP1tqyQD4Y3BHzWK89xnN9Fv14T/eU9BqR/EGOB6l
         HyUfRQHjhARMcL/wJNAimVU6ufIpLIyk35vSx3x6liplpDrfUXuklPWOcfdqusBZN4Q4
         b2tLhUe5Aw93PhHJN6fET/FppHDUWA8owqFT4k0oURldYsDci3275Vya8GOz8t+zI+wc
         ZEdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762858008; x=1763462808;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vzxu8qssjIhFl+4HzQqYw3E2J9WYZzlt8qmmQpR/9RM=;
        b=YejMvtnp/8oO+Ka27pIUdFC1Ltf8QJRNXTDu6HKlVrTAHTsZnrpsk/xKwQZveNdqVj
         q+usk925VatTWBQqWcIr22Nl1VgXGH6XLqXQ/XD+sBzR2cmTSoTol3gd1UPzU4RUqU0Y
         9o1nsD73XpGsaP33BL3lqDl3Dch32y10L4Mxs6aEeD4ubt8KAGAvpoJuwaqETkCj3w1n
         lr1tWCIEdBStCxCvUPJiUl8H1ANJ3wHNJ1IuxNzbVvHpzxP3sysXIu7Smx29q/73lBd5
         LKUsZUWCofJA4fBuh80SFAICZlRfc0a1BXeEIuxlqtTtwA7kQRoH+oL8alKKLXajLSWx
         X7ng==
X-Forwarded-Encrypted: i=1; AJvYcCVDB50Bl517qLClZ+zzzXoscMmHcXLSGZehq4w/N7TnXMS8comvIdN4BKuFStP48KVvyUvSUa9yMasnuKS+@vger.kernel.org
X-Gm-Message-State: AOJu0Yxia4YuEFzOjaRljBO4SdqTfqlB+AhEZ8VvHUCh9MafvQ6WrvrU
	Y4LGmBBMX01XKGLn3giD9vp0J60f7bQnsYDqEyHC6NfV/vA0/Of61+1CaOf9/CA8wSOdDsY2jgD
	MKS8Iz6tXa42wTV+xdZo/pjTaHJ3WZT+9aX7LtxOB0w==
X-Gm-Gg: ASbGncs0wRi2qLgf/1/1ciiAzYquQZjCGwjDVnzfkD+RbL73AfBNNogi5vAciteCbO0
	Qpeu2DEZD9Wm58PfJgz373brU1qujwvprPy0ixa2y8haHmkt3kzXDJ6OOlMcUxOy35EYL7L0khd
	ZMJTbWoUfw/2n0X8z8OJzSBiGJnyEzmZD2zjmpeYU/NBx41CVOeVPy1Ti8j+GtPRdhRpF0jpil7
	1jFttgkhP2dCpb83Vb9tGKMPhNrol9ZtEGTWBm8S+p3ZMEfIqsFRwTA1bCS
X-Google-Smtp-Source: AGHT+IE/zC5OMsYl03Nj0mPJmaD1a2IXwBvVIbEcz3pKu9CsBoN95WeMpa65Ti7xOQGESKhkoy/5byt8ZxIuQV5LRlc=
X-Received: by 2002:a05:6512:3ba6:b0:57b:5794:ccd9 with SMTP id
 2adb3069b0e04-5945f1465b9mr3570547e87.9.1762858007876; Tue, 11 Nov 2025
 02:46:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251029-gpio-shared-v3-0-71c568acf47c@linaro.org> <CAMRc=Md4X-GWpeRgun6zv6dddKFqqrjUSveq3fNOe5AboLAcXg@mail.gmail.com>
In-Reply-To: <CAMRc=Md4X-GWpeRgun6zv6dddKFqqrjUSveq3fNOe5AboLAcXg@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 11 Nov 2025 11:46:33 +0100
X-Gm-Features: AWmQ_bmu8Uv97qyqiqkPQLTOzsrjTmZVCm9AYfJGSsxfxSYvRIGYvQTliDsDKgo
Message-ID: <CACRpkdYBZQJsptXhxOHvFdNwU5_-_QDfaLN6tiDqgL=bBWoXmQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] gpio: improve support for shared GPIOs
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Alexey Klimov <alexey.klimov@linaro.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 10:46=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> Can I get some Reviewed-bys under the GPIO patches if there are no
> other open issues? I would like for this to start making its way
> upstream if there are no strong objections to the concept. After a
> release or two, I'd like to start enabling it on more platforms.

I'm convinced of the soundness of the general approach so I have
added R-B on the gpiolib patches, FWIW, for the rest:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

You clearly have an idea and a plan here, and it looks solid to me.

Yours,
Linus Walleij

