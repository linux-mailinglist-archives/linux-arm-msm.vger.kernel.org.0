Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FB9C149740
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Jan 2020 19:47:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726454AbgAYSrW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 25 Jan 2020 13:47:22 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:37538 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726338AbgAYSrW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 25 Jan 2020 13:47:22 -0500
Received: by mail-oi1-f194.google.com with SMTP id z64so2908469oia.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jan 2020 10:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Dwr5wEgyI6r7yMWIPAUlrmvqitDKlBJiaf02I2Mddbw=;
        b=M7+EYbDAe3hHS/gXFtMoBskrcNWGl7KRIzDqMSKUk3pTmT79Tbb2Sj/AlYKEf8a09x
         Q4oQwMnvh0oRsRhcqYGtcv6jC2jVTWHC9sibHNmv3nR8BJoiIt0hBV/svDPQSlZOgkNS
         YUKmk9cb0HtS0U3Vb74DcvWyhBL6WVvbO0Gje/q9qgWSEJtFfsnQfPAZXr4vTko16Qyz
         Gg7RKBZ9NRE74JElsPyCIzU1lrjg6Ab0pPuhHDQcjbi2av0LygJhPcGHEadQTbyZJ7eW
         +Jgb8642Ryl6lZ1Jy/qiEqyv/3pXA6geJCEXJsADkd2fQJMiM8sX1VT91fAlPQhn44PK
         ytdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Dwr5wEgyI6r7yMWIPAUlrmvqitDKlBJiaf02I2Mddbw=;
        b=XMElupM2vw48F9wmhZ5gs8/avjlc4PL/5w0F2XhbOtbBKeKbkiyjaB7I+2CapkYqks
         emm/VQMhF7rgCW84seun6V0AmF8B0NebIAO5L+dWHdSy1SMM7K9515YFWTAP7PfMBAoo
         xQ57jNr22f0HPdp9FqMPSXFtETEnRbwTIDWlczzF/0HawmpGYf/yvmJlPCeinLXrdD63
         K4eTiat59yE/EULY9u0h1rJpiGPSH65xQoHW6sQQDPLSuEjAHf6sgZtIHFV8SBQI+O+J
         sdiSrEfJTGKRKPC+yymECa2YEWCJcO0KImm9aFzzG63wAyyeJYO6q0tuwGQ/YptKvQvl
         vcrg==
X-Gm-Message-State: APjAAAUi7B8TJvz1mC/wMiXM+d/k6S+w9IRAT419+W0VCvxDek3kAfPc
        U1U2MMZWNWZWeEHdR6YZ2wdclBU9rtvmO6GBDS026g==
X-Google-Smtp-Source: APXvYqzh6zwF4V/4YC8nD0Z2BwGlUY2V6zx66khSkcx5xyg4E6vBVGg2CySKloqHurCXKSqwt/0CuBMYclaiMu3Wj2M=
X-Received: by 2002:aca:1c0d:: with SMTP id c13mr2963496oic.44.1579978041452;
 Sat, 25 Jan 2020 10:47:21 -0800 (PST)
MIME-Version: 1.0
References: <20200106135715.1159420-1-robert.marko@sartura.hr>
In-Reply-To: <20200106135715.1159420-1-robert.marko@sartura.hr>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Sat, 25 Jan 2020 19:47:10 +0100
Message-ID: <CA+HBbNEjV=4GcEqXwm3A_v9nVWvVbVA9FyGvL3qYra1-Geppxw@mail.gmail.com>
Subject: Re: [PATCH] ARM: qcom: Add support for IPQ40xx
To:     agross@kernel.org, linux@armlinux.org.uk, arnd@arndb.de,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Cc:     Christian Lamparter <chunkeey@gmail.com>,
        John Crispin <john@phrozen.org>,
        Luka Perkov <luka.perkov@sartura.hr>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Any issues that are preventing merging of this patch?

Cheers

On Mon, Jan 6, 2020 at 2:57 PM Robert Marko <robert.marko@sartura.hr> wrote:
>
> From: Christian Lamparter <chunkeey@gmail.com>
>
> Add support for the Qualcomm IPQ40xx SoC in Kconfig.
> Also add its appropriate textofs.
>
> Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
> Signed-off-by: John Crispin <john@phrozen.org>
> Tested-by: Robert Marko <robert.marko@sartura.hr>
> Cc: Luka Perkov <luka.perkov@sartura.hr>
> ---
>  arch/arm/Makefile          | 1 +
>  arch/arm/mach-qcom/Kconfig | 5 +++++
>  2 files changed, 6 insertions(+)
>
> diff --git a/arch/arm/Makefile b/arch/arm/Makefile
> index db857d07114f..3db642722af0 100644
> --- a/arch/arm/Makefile
> +++ b/arch/arm/Makefile
> @@ -152,6 +152,7 @@ textofs-$(CONFIG_PM_H1940)      := 0x00108000
>  ifeq ($(CONFIG_ARCH_SA1100),y)
>  textofs-$(CONFIG_SA1111) := 0x00208000
>  endif
> +textofs-$(CONFIG_ARCH_IPQ40XX) := 0x00208000
>  textofs-$(CONFIG_ARCH_MSM8X60) := 0x00208000
>  textofs-$(CONFIG_ARCH_MSM8960) := 0x00208000
>  textofs-$(CONFIG_ARCH_MESON) := 0x00208000
> diff --git a/arch/arm/mach-qcom/Kconfig b/arch/arm/mach-qcom/Kconfig
> index ecbf3c4eb878..1772eccb5caf 100644
> --- a/arch/arm/mach-qcom/Kconfig
> +++ b/arch/arm/mach-qcom/Kconfig
> @@ -12,6 +12,11 @@ menuconfig ARCH_QCOM
>
>  if ARCH_QCOM
>
> +config ARCH_IPQ40XX
> +       bool "Enable support for IPQ40XX"
> +       select CLKSRC_QCOM
> +       select HAVE_ARM_ARCH_TIMER
> +
>  config ARCH_MSM8X60
>         bool "Enable support for MSM8X60"
>         select CLKSRC_QCOM
> --
> 2.24.1
>
