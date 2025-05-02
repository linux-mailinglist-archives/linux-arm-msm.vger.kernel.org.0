Return-Path: <linux-arm-msm+bounces-56486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA8EAA70A7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 13:31:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1786C1C01105
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 11:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97D91241698;
	Fri,  2 May 2025 11:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="BFAYSYv9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785AB23C4EF
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 May 2025 11:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746185481; cv=none; b=WwH3vLAZUE0YtM0FD/Mk4C20L+fQqFX7cgXbF9yusY+G2HSJzUMpF9dpCgJ5zgtFSOg3n66YGWd4YI1Dffe6mpuv993aCPc62gRqmSaZOteFkrvPX8GMg2dETcmbfDMzfzF1PuRz8gnlKwVwZxu51qSDhWmLQsjCje/ppkvTG+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746185481; c=relaxed/simple;
	bh=nsiFImJLoqRMPYE6uUcBaLQvv1p2h76vbEMvfRkjgS0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GVSW/0otK+VRxS2r8vh+BLdIaYC75FIvu+db7TcYjieOEoZv+gsLzAMpMSYdbsu+Kd7IJ9JzSOqAcc2TMIZzi9cS/cqjiWuxmYoQwMyL+7dOTTCipwHfniKJ9AO5TZSfHckr6ShZBI3LD4LAEN7mVCWxwmMyUPRaB0CaqbHGmQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=BFAYSYv9; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5499614d3d2so105805e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 04:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746185475; x=1746790275; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7PVZ4QM5gmv4w9v0TZil7CgJhd3wgbN41SsSO9rADow=;
        b=BFAYSYv9JpU8W61tifLJgclE8j7BYvenRD3psfh7CDkO3Vhdy5uhgLv9u6XRljMn0y
         uGhbtq9/tkaR3mDqrLZyrnBX97Lfs3rVLK1sBFguyv/KWObjto2wVI2nwAR4eAZwLyG7
         CaqtlZhZ3LZipuziJKb27Tebk+E3NHjT7fI3BUxNjvid833CfJogXI3NhP3Ht3WuC2Ry
         +ePFZq3OpYjqBXDEUigEr36+02/5i0PEpRBelolSibIJxISt5uRofoGhAMiGiWsdTr3e
         h4Jr3C7/TjeEQJZvIU6q7pZpyi19b7PE5WczLnaBAeKaGqpfbb6X1XWI0F7zFAZZdl8d
         GZfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746185475; x=1746790275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7PVZ4QM5gmv4w9v0TZil7CgJhd3wgbN41SsSO9rADow=;
        b=HbSHl+UelyRqdUlfc/swW5FpoiEeiNMmsd6yUEHZxKYHYaU340J8N4bs+GFA2SvM7g
         bJOSgIs+EzNmhtbHt+kfDjso9fCW9yK1ZVcvG7cDz022NTNAB4J2kqazAHrbO2Ffzh2Q
         flvabtwGEC/q9o2FTUyrlO2BtBA2TtASlzVJh08+BCDL54AfoGGti3ekJtlwqzl2vonq
         2CbaUyGMArP5QpdX8d40s+aepMSbFKLea6pswedX8rsLDZ1mlz/XM4DZBIzhgK8YBRSm
         eVy3fck4dFsQOf6aqNCVqcoyHgMbTq7EsD9gwmyg7p2kiiDihfyupg8luJSxXDuRkYLV
         CXgA==
X-Forwarded-Encrypted: i=1; AJvYcCUDRBQYp8UZboo8z8reQSeL+OHPeEcZOdsrTVHR2+v4VpHIV/OW8VtvMTCaPE8Y1agq6RSvx1lLUrmCCPtN@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6PDS6lL01DqswapQ2/rBN7JZaePCLYwuDVhPlUt+JbEwi9Bfw
	W4nxQYcD453378WHPUlTzW5QOSigDzwdoemYAdx1Z23W571wtX+vTXrB0fFTmdB4H2Sc1dJN5Ot
	yBzcJsfnp29uxVv/qrpjU0aAvIQ039q9nO1WzTNC9lOM37Qlq
X-Gm-Gg: ASbGncuF6KaOUheCC0kKU1LP4IUdGm5T4m4n5XcH40wdhEObkVs9Ck1hmLwV2B1ojGu
	2mkhfhxii6NFKaG2jsFEUxwltuhrcfGj6B8f5S2PoLnHeiuQ9s7RjdEDaLn3DYnsNPRCZcumiWn
	jAJSFwoMLFSRgZ5bsVVbDAkyOrtb81kDtV5Xb8AKHB8QpqDJG2t9uX9Q==
X-Google-Smtp-Source: AGHT+IGaxwPjwZjPSxduV7/nv7xqHS4FaobXkSF8oU2RzlJXTcBtUuY8b6IbKqMF4S/Rcv+Wp8xW5CzYLKbGOnG9ITs=
X-Received: by 2002:a05:6512:234e:b0:545:c23:9a94 with SMTP id
 2adb3069b0e04-54eac24302emr669308e87.48.1746185475382; Fri, 02 May 2025
 04:31:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250502-irq-qcom-mpm-fix-no-wake-v1-1-8a1eafcd28d4@linaro.org>
In-Reply-To: <20250502-irq-qcom-mpm-fix-no-wake-v1-1-8a1eafcd28d4@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 2 May 2025 13:31:04 +0200
X-Gm-Features: ATxdqUF7UFBB_n-kwTbMKu89mjJ3x0a4dj381-gCLDZrKHfAIyHJguUXxuGeqH8
Message-ID: <CAMRc=Mcg0xRvZWEP3hmWyrLF-gsfzR9DS0umE3NffqKbrRUgdQ@mail.gmail.com>
Subject: Re: [PATCH] irqchip/qcom-mpm: Fix crash when trying to handle
 non-wake GPIOs
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Shawn Guo <shawn.guo@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alexey Klimov <alexey.klimov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 2, 2025 at 1:22=E2=80=AFPM Stephan Gerhold
<stephan.gerhold@linaro.org> wrote:
>
> On Qualcomm chipsets not all GPIOs are wakeup capable. Those GPIOs do not
> have a corresponding MPM pin and should not be handled inside the MPM
> driver. The IRQ domain hierarchy is always applied, so we need to
> explicitly disconnect the hierarchy for those. The pinctrl-msm driver mar=
ks
> these with GPIO_NO_WAKE_IRQ. qcom-pdc has a check for this, but
> irq-qcom-mpm is currently missing the check. This is causing crashes when
> setting up interrupts for non-wake GPIOs, e.g.
>
>  root@rb1:~# gpiomon -c gpiochip1 10
>    irq: IRQ159: trimming hierarchy from :soc@0:interrupt-controller@f2000=
00-1
>    Unable to handle kernel paging request at virtual address ffff8000a1dc=
3820
>    Hardware name: Qualcomm Technologies, Inc. Robotics RB1 (DT)
>    pc : mpm_set_type+0x80/0xcc
>    lr : mpm_set_type+0x5c/0xcc
>    Call trace:
>     mpm_set_type+0x80/0xcc (P)
>     qcom_mpm_set_type+0x64/0x158
>     irq_chip_set_type_parent+0x20/0x38
>     msm_gpio_irq_set_type+0x50/0x530
>     __irq_set_trigger+0x60/0x184
>     __setup_irq+0x304/0x6bc
>     request_threaded_irq+0xc8/0x19c
>     edge_detector_setup+0x260/0x364
>     linereq_create+0x420/0x5a8
>     gpio_ioctl+0x2d4/0x6c0
>
> Fix this by copying the check for GPIO_NO_WAKE_IRQ from qcom-pdc.c, so th=
at
> MPM is removed entirely from the hierarchy for non-wake GPIOs.
>
> Cc: stable@vger.kernel.org
> Reported-by: Alexey Klimov <alexey.klimov@linaro.org>
> Tested-by: Alexey Klimov <alexey.klimov@linaro.org>
> Fixes: a6199bb514d8 ("irqchip: Add Qualcomm MPM controller driver")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

