Return-Path: <linux-arm-msm+bounces-97070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mISwLV/NsWmQFQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 21:15:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 15846269D04
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 21:15:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A27F530804FE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 20:15:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E94738D013;
	Wed, 11 Mar 2026 20:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nWe/prAY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BA638D006
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 20:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773260123; cv=pass; b=V7U6956/gV1Qc8A82yVkSAJTZdGsC/u+OH0d1vLoa2UydwWjLXhu3RBd0GsyvMT8GfZ2cAGXn8ZHylW7wO4RbEAUIhQeAu7kyMVa80AleNyWPaU7RC/Z8usvXRgULkISTWAVfgEKIZny/ri+bkcxlCK9UtkukAx5C0jzNTKfGYU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773260123; c=relaxed/simple;
	bh=qCUYBGAUOheU0nTCcMZyCl5y4dtCdasyHwmyMVbOBCc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HZKhW+fzym6EVpgkZYrD6cQRCSvhfE5MKoP2FfZ0H0adEV3xclxv+2Het6RKmPRHarRzMzxM4K7rBKXwR2Qqe4Cgo4mzHQzEKUOc1I1e9GKKG7Hrf9Mfi5aecIKer9FIwhVpXTevlkUYsHOGH5W2etaFyG33NcbTF5h+fEexG6I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nWe/prAY; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b886fc047d5so33405166b.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 13:15:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773260121; cv=none;
        d=google.com; s=arc-20240605;
        b=O/B6usPVM8FLkosmxr0KRE7wDOLt7iOSF+mNIl+dCaJ8Xq0iSKD1r9bceX5+oaMnzc
         koOPCtIU2rnQTtpNivj8ivZZCdQVwmaI754eKWahh0QPmTtUx5rTRuGWtdk32xLaXBIV
         zhdYk6dsW+VBbF6tdPahpWs+k9dOMVUNfuX8dkh7WqzqCqGBFg1sU4/jfqkw6gKW4AUn
         8gGgQ5q26KU4o1A1y5LWUIeC8bpgxjBCl8YrO5iVkTFtvi8y1zsrvKTN7QJcN/3j42Kr
         QiLUv+7mfb7V5JMDD5Sikvr23uEK0pp+RdwT0PLFDCvHd8q3UdjLMc4yTPXDOuIFIc+S
         zxzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i6F+UW8vpaPOSbe+aow4A6qQsDdfkrJCugB1bxi2H3M=;
        fh=8D55jvndxQxByjMT7gSjb2noFNic3anhnIAlKPkQZiA=;
        b=huuLMdchiaYB2tm9K96LbK1wEHQh0nfuQhwuwCUgtKEbJFJDK8Tu/VvPW+2UbOgEMt
         5ZVxe4ofDEvx0YtB5WSsC3+SGsLP9b8LEuFbggmCkehQr5S+eeQr3lULI5641aINUvn6
         ICmsDFJxLxANzjcKMnvtLv6x458wPVYLhS0xt8vcRvV1DZi17FiK13Il8CFVBVsei+F/
         fbgiDXMGgBeS97WM7xCeOJbQNCzIq6qv5uBTjJI+hhomBshczwABXvdSwuJoBzAE2JYR
         YXly+9FwFyvjQli++TGy5Fy/k0Jcl/ubhE9MCtV1YMYzAOYBtrGGGJ0lA10ijPW55jMR
         AXHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773260121; x=1773864921; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i6F+UW8vpaPOSbe+aow4A6qQsDdfkrJCugB1bxi2H3M=;
        b=nWe/prAYzvBDiutVXiO6S+1K2vIf87NlcJjxfML+QuWQ2JitCchpJ0EET506sfrXvv
         yTqYq99l9QF3PfHVikdeebx8GwUPquPD9q449ZlwFS+Gmq4WtrvtfFwT3NRZxQL5R5Vd
         LmxYUDee4Gq/dzzYlZixAwza8lw7PWwWTa0XW8fQ13XWdwmB4OjH3rBvrsIz0DPh8/Vt
         opkVQQY1LGDxOUs5vestd7+UHQ24SjLdOTWKX1ix7I+rEA+8wEqUpk2vVsZ4FZCgoY7R
         k1FrYcNQAn/VR0SG2J+xoY64k5Hkt2owRDbGWJ29GCC34FAy65MIdVnhQhXTBbMWjhCg
         QFoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773260121; x=1773864921;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i6F+UW8vpaPOSbe+aow4A6qQsDdfkrJCugB1bxi2H3M=;
        b=Lia11z0pRVQHecMNv6zr97pTMicRQSe3ioXvomXpW2kp4KD8037ucKz5wW/YnhFCqt
         QRAG3agifK9N8BTtycjAeogrcxeTU57xUyLQRND1JMsmsyXdbEvScq2FNjIkERa8Mjb9
         fYAvW2URNZx5xQt4u2XCAOI0r7PkWCM6o/wJuT5SPrxMxt+chT1EyE9V4YmilO4YXRzq
         PgEWLafPCnBjo7rPAp5lAErJzaC8HzLbnr4kc8tqSxWMAw8C/+4Exh7+oW6mhP/84HIn
         b6Ftc+wPTdhA0QmnGyYN+WSqQvqvyE+ddELrb/nENDN5WW5iQfJsnLvtWrMhoFe6YDUv
         Vl6A==
X-Forwarded-Encrypted: i=1; AJvYcCVaRTycfKo6vZeEBHGIoiLrS3NIq2MLX14xBnXH3b1+o9N3dSccP4fk9kGVyULHVjPots5TPlANxKbmtdO2@vger.kernel.org
X-Gm-Message-State: AOJu0YzJQDKsqslDVqwsu6Q5x71xIGWJOMC1EmKdOIQMW9JG7i1I1Cze
	eCHWS7c488ZY4+pkDK+GFtJk5s+rzWgtsfsjy5bppkR/gWcZmwl+e2SlTy02G64S1+8FTOUZPfG
	4LLExPMLj2CFrCf4d4/azim+koDQzQD0=
X-Gm-Gg: ATEYQzxruIvvshDbU3hSqOIuzTmZzhz3BK7kM7br5WEwE04qu5yuEKAHdvTclDK0uE2
	pWSYDhO5Q9CxmRiaGI9BodAFbwKS223BuAaVc/HH4SnSNBHJfs4A3uzHR8YqmBOBX03HAMlXnGB
	t9pbGTXR01fDjxNKlDeGVIB6axtbblLgP9OC5gao5z24Uk7gXAzdq3ouNSuwrZgQeTzNBQh6OsM
	n2AugJsngoyxV6w+wYClXON71nSkvdjg0Tx9H5f0uZQTvF8CTedceifM0+DByjMwCHmkJ4KHazZ
	vLk14hjANgWYeBvLeDW1htRhIxODRg/trVeED1gxc/RR4v10htqs7GBG8DhluiqENObj/rgaYwg
	mBqUZKk9pr5M5cnY6HA==
X-Received: by 2002:a17:907:fd17:b0:b94:1df4:3525 with SMTP id
 a640c23a62f3a-b972e20f6c9mr213172366b.1.1773260120699; Wed, 11 Mar 2026
 13:15:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-3-b51f97b1abd8@linaro.org> <921ba8ce-b18e-4a99-966d-c763d22081e2@nvidia.com>
In-Reply-To: <921ba8ce-b18e-4a99-966d-c763d22081e2@nvidia.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 11 Mar 2026 22:14:43 +0200
X-Gm-Features: AaiRm50gZlAiM-5_F_zUlx0D2HjCtugUtf3WuAOsTMIp9Wv8sMtNxrZngwvWk-o
Message-ID: <CAHp75VevThmDMm6VoVB9P0YbUGGGsmgnzr2gn9=1xtJZt-kuQw@mail.gmail.com>
Subject: Re: [PATCH v4 03/10] gpiolib: implement low-level, shared GPIO support
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97070-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[bgdev.pl,kernel.org,gmail.com,linux-foundation.org,linaro.org,google.com,linuxfoundation.org,arm.com,perex.cz,suse.com,vger.kernel.org,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 15846269D04
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 8:38=E2=80=AFPM Jon Hunter <jonathanh@nvidia.com> w=
rote:
> On 12/11/2025 13:55, Bartosz Golaszewski wrote:

...

> On Tegra234, the main gpio controller has a total of 164 GPIOs (see
> the tegra234_main_ports in drivers/gpio/gpio-tegra186.c). The GPIOs
> are assigned a index by the kernel from 0-163, but these GPIOs are
> not contiguous with respect to the device-tree specifier.

If I may ask...

Why? Is it sparse because there are pads that can't be used as GPIOs?

> For example, in device-tree, if I have a shared-gpio with the
> following specifier ...
>
>   gpios =3D <&gpio TEGRA234_MAIN_GPIO(AF, 1) GPIO_ACTIVE_LOW>;
>
> The macro TEGRA234_MAIN_GPIO(AF, 1) evaluates to (23 * 8) + 1 =3D 185.

To me it sounds like a bad design of the driver for this SoC/platform.

> This is greater than 164 and this is causing the above crash because
> 'entry->offset' in gpio_device_setup_shared() is greater than
> 'gdev->ngpio' and this causes us to access invalid memory.
>
> This is what I have been able to determine so far and wanted to get
> your inputs.


--=20
With Best Regards,
Andy Shevchenko

