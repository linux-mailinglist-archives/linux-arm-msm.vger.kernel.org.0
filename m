Return-Path: <linux-arm-msm+bounces-88021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D040D0482C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 17:45:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 510B132FBE39
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 15:37:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 762DB34D39F;
	Thu,  8 Jan 2026 08:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KQZUh7Wq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BDD326928
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 08:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767861967; cv=none; b=lkMvGvD5tHnQVwS56xiGcFHjwf7TPPdnq/HUmoooG9ZnRwubgM02NGhO80f4L7bsnBQEznIn3LZcsxFMWuhFDtzlD2njK1TUpQEu0pPVyl4M3M9t1ipRUfYhzJXOU9csnFZTTuvj6RaO7BzXXPfg8bnLuteUssXfxJNYx57d9+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767861967; c=relaxed/simple;
	bh=BqgkMcZUubmtSOlPILAa3d89zvk0yBYNI6hQRzVoKdE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fzZqy0Pzj1P2XxhjRgLgtvkYSOlQrujpxfqwS9vJDZlZ/GIaGsfA+1dNUTsiWJ/x6cw6/ja6U8co2msLGuZgn7ZgsTi8qmtN/w2P4MKazlDIVb3uS3kofSU5hFMzuMEBqweoyXWJ1fN/f9xSK30x/YifTkmMPX73lJnc18F80Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KQZUh7Wq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCC14C16AAE
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 08:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767861960;
	bh=BqgkMcZUubmtSOlPILAa3d89zvk0yBYNI6hQRzVoKdE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KQZUh7Wqptoit5QJV/2lRzFvP7CBZ+A42aeKEVy115cinAx+kc0v6bx39CRwSE2/u
	 qSNDECW0gVqplVCeCmWlgKOs2MGFju6NYPzdTsXFRUn/afxPHGqJOv/h7hT2//Hli6
	 NVVB1iH6atyCnlP+Ie3URFafw3uQ6e/LGhnKw0vBa2xUhKoodEwSOEJFNPUZTnv8VL
	 6Ughb2dd9EowkGs2xsHQWtPZgCVXZO2fQ6ZyRKqLRvP3pip5fR5kvxLqlxseoCr8G0
	 zZImU5yPy1yaMI1fp5JAy9wA7hVSqtRJx6K6QAzyqjddkdGweCePAgyDVmqlRfyugs
	 1Pz3VLLXKqmag==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-38305f05717so8884761fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 00:46:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVBamWgsXfcMtcROQBi52lhfTv19n1CQaE23lAyTVcTRTxn0sH1jgu+G97+Ac+ak8RndS/xQ5X8xjJlWsrD@vger.kernel.org
X-Gm-Message-State: AOJu0YxVGKFcO/ta6zt7ekMj0udosLy+IO/sab+1vNiIT4b1u6EKy0Dw
	/92ybrXAbtn1/jU5j+mTbDxNk+l27FqsnwULzac7PQMN4sJqpUq2kZVIhI3Hd/1QPGLHVvGpUrU
	HIPkKfWSEdW+0NB1A8eEBqLNa5sbQMnRneF+39SwPJQ==
X-Google-Smtp-Source: AGHT+IEMMSJCU7SYOOgMQ0Ss3CVoU2DzXo5zjwxrQtFkFUfV8zoKG1Pqwbvf3SQfMIiVN3cd6uxpbxyjJv7SsIRhXa8=
X-Received: by 2002:a05:651c:1448:b0:37f:cc09:31af with SMTP id
 38308e7fff4ca-382ff851d94mr12840421fa.44.1767861959439; Thu, 08 Jan 2026
 00:45:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-7-b51f97b1abd8@linaro.org> <66eaf003-c397-4920-b3b7-93ac8a5adfda@oss.qualcomm.com>
 <CAMRc=McXFTLjE=2-xsx4sodHgd83h822iEBHT7bxcNOQm6OJ3A@mail.gmail.com> <98d69fb9-d3bc-4439-88b4-60f3cdea3422@oss.qualcomm.com>
In-Reply-To: <98d69fb9-d3bc-4439-88b4-60f3cdea3422@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 8 Jan 2026 09:45:47 +0100
X-Gmail-Original-Message-ID: <CAMRc=McmvaM9=K=0NLRcLLmo5ck=m8Fqekh7tBMz6quO9K4opQ@mail.gmail.com>
X-Gm-Features: AQt7F2rVVRGjZ6d0_s5L8WPZ1MJdF76nkEPcTHk9mWt9XktJ2GZ81wKlRj-yauk
Message-ID: <CAMRc=McmvaM9=K=0NLRcLLmo5ck=m8Fqekh7tBMz6quO9K4opQ@mail.gmail.com>
Subject: Re: [PATCH v4 07/10] arm64: select HAVE_SHARED_GPIOS for ARCH_QCOM
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Will Deacon <will@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 8, 2026 at 7:49=E2=80=AFAM Pankaj Patil
<pankaj.patil@oss.qualcomm.com> wrote:
>
> On 1/7/2026 6:08 PM, Bartosz Golaszewski wrote:
> > On Wed, Jan 7, 2026 at 12:07=E2=80=AFPM Pankaj Patil
> > <pankaj.patil@oss.qualcomm.com> wrote:
> >>
> >> On 11/12/2025 7:25 PM, Bartosz Golaszewski wrote:
> >>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>>
> >>> Some qualcomm platforms use shared GPIOs. Enable support for them by
> >>> selecting the Kconfig switch provided by GPIOLIB.
> >>>
> >>> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> >>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>> ---
> >>>  arch/arm64/Kconfig.platforms | 1 +
> >>>  1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platfo=
rms
> >>> index 13173795c43d4f28e2d47acc700f80a165d44671..3dbff0261f0add0516d8c=
b3fd0f29e277af94f20 100644
> >>> --- a/arch/arm64/Kconfig.platforms
> >>> +++ b/arch/arm64/Kconfig.platforms
> >>> @@ -316,6 +316,7 @@ config ARCH_QCOM
> >>>       select GPIOLIB
> >>>       select PINCTRL
> >>>       select HAVE_PWRCTRL if PCI
> >>> +     select HAVE_SHARED_GPIOS
> >>>       help
> >>>         This enables support for the ARMv8 based Qualcomm chipsets.
> >>>
> >>>
> >> Enabling shared gpios is breaking hamoa and glymur boot on next-202601=
06
> >> For hamoa - reg_fixed_voltage_probe which calls gpio api is breaking
> >> Please find the log here - https://lava-oss.qualcomm.com/scheduler/job=
/24722#L3514
> >>
> >> For Glymur - qcom_pcie_parse_perst calls the gpio api <4>[    2.910982=
] WARNING: drivers/gpio/gpiolib-shared.c:493 at gpio_shared_add_proxy_looku=
p+0x160/0x24c, CPU#1: kworker/u75:0/109 <4>[    2.911027] Call trace: <4>[ =
   2.911028]  gpio_shared_add_proxy_lookup+0x160/0x24c (P) <4>[    2.911030=
]  gpiod_find_and_request+0x1c0/0x504 <4>[    2.911032]  devm_fwnode_gpiod_=
get_index+0x1c/0x6c <4>[    2.911034]  qcom_pcie_parse_perst+0x70/0x150 <4>=
[    2.911037]  qcom_pcie_probe+0x414/0x804 <4>[    2.911039]  platform_pro=
be+0x5c/0x98 <4>[    2.911042] qcom-eusb2-repeater c448000.spmi:pmic@9:phy@=
fd00: supply vdd18 not found, using dummy regulator <4>[    2.911043]  real=
ly_probe+0xbc/0x298 <4>[    2.911045]  __driver_probe_device+0x78/0x12c <4>=
[    2.911047]  driver_probe_device+0x3c/0x15c <4>[    2.911049]  __device_=
attach_driver+0xb8/0x134 <4>[    2.911050]  bus_for_each_drv+0x84/0xe0 <4>[=
    2.911052]  __device_attach_async_helper+0xac/0xd0 <4>[    2.911053]  as=
ync_run_entry_fn+0x34/0xe0
> >> <4>[    2.911055]  process_one_work+0x14c/0x28c <4>[    2.911058]  wor=
ker_thread+0x188/0x304 <4>[    2.911059]  kthread+0x11c/0x128 <4>[    2.911=
060] qcom-eusb2-repeater c448000.spmi:pmic@9:phy@fd00: supply vdd3 not foun=
d, using dummy regulator <4>[    2.911061]  ret_from_fork+0x10/0x20 <4>[   =
 2.911063] ---[ end trace 0000000000000000 ]--- <3>[    2.911065] qcom-pcie=
 1b40000.pci: error -ENOENT: Failed to parse Root Port: -2 <3>[    2.911069=
] qcom-pcie 1b40000.pci: probe with driver qcom-pcie failed with error -2
> >> Reverting this commit fixes the boot on both platforms
> >>
> >
> > Hi!
> >
> > This is not really the offending commit, it's a recent one in the
> > implementation. The issue should be fixed by the following series[1]
> > that will be in the next next tag. Can you give it a try?
> >
> > Bart
> >
> > [1] https://lore.kernel.org/all/20260106-gpio-shared-fixes-v2-0-c7091d2=
f7581@oss.qualcomm.com/
>
> With the linked patchset applied I still see the same issue
>
> Pankaj
>

Is the gpio-shared-proxy module available? If not, can you change the
config to make it built-in like CONFIG_GPIO_SHARED_PROXY=3Dy?

Bartosz

