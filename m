Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06A3519257B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2020 11:25:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726262AbgCYKZu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Mar 2020 06:25:50 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:37915 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726206AbgCYKZt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Mar 2020 06:25:49 -0400
Received: by mail-ot1-f65.google.com with SMTP id t28so1407185ott.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2020 03:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=InLdmn9lfAU6Q8B7xfqxVdVzbUzzV6XbSkNNV60xQyQ=;
        b=nlq+PtHWa9C9USMgmgx0HHVcM1G2xmlF4j55Xdb1gIWEa5hiA7jNhKNZ6ZWU8+wKJq
         MAzzRwM7n057U73SjyOWshvSlPDAky3YJmtzOkmRLTh8MCz7pcLx8xclKqH/eW+hc9vz
         /gnS7rLaZ7c65SM2GrDZkOcsooLtHOUYewdiri7Qzbvsh5KlMx7K6ChJr+zIqZ/dU/p+
         xmYchSaBcPHOiI4GfgdQDqOMAaTU02lZFSkn24XBpMxKuG84+xFE/2Nra+dtZOZ0w2Qh
         oki1HOxwcRLFZXC926VAE5N9+ZlreDrphJL/lZhPIvVx3m6/BXGJcY8Q/uTGhG4Nc9So
         LUSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=InLdmn9lfAU6Q8B7xfqxVdVzbUzzV6XbSkNNV60xQyQ=;
        b=VMTDGcmvWYqquiwwC0d3S0EN8ZyabWZz1kGoma5EQWWM8fI/PqzHNAPDwZk+bY3shx
         BqpKYRkPy0v6M24Hs/iydWUucHU3T46OJWZLO7sBsvqqBSzBGUy7p16xZIGpgm9QOyUh
         kXEyLFJTTgwQ7qxDUb7Wnxr2JXQauA5ki7qX7Lsabe+T6ZwmI74ji73OPIWZ0+a3muwr
         MlvnkL+80UIorOopJ51vzSzCL0ZVwUp6o95oAoLMgUqK1Cc0OGBjchq2WWgkSz7jkEAV
         0ZXS5trhXz2f/BP/iZjsVeQny66siSk7BaiY0DmF1s2JoUBWj41YiBRJ1ojU8JplCdtk
         LbCg==
X-Gm-Message-State: ANhLgQ1JS/aWLMzcEs8S5ORrTVYjSmpWlKUltTMBdYixXXfc8KA4YFZi
        LcfdRijofBWTt5tdv+Uhxsb7/KLbTqoqwA9SDMr25g==
X-Google-Smtp-Source: ADFU+vsmxg0/ycMBgk1bM3vGA7RzekeO12oNQfii7BDQ++sUGCDR480tenHHojZqGSH9m6u5CEVcNPMZW/Zi9nL0IiU=
X-Received: by 2002:a05:6830:18eb:: with SMTP id d11mr1922054otf.243.1585131949147;
 Wed, 25 Mar 2020 03:25:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200106135715.1159420-1-robert.marko@sartura.hr>
In-Reply-To: <20200106135715.1159420-1-robert.marko@sartura.hr>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Wed, 25 Mar 2020 11:25:38 +0100
Message-ID: <CA+HBbNHEetusFNH-8Qmva=2-_HQRRJ33qfBRSudZBVW+vK0tnw@mail.gmail.com>
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

On Mon, Jan 6, 2020 at 2:57 PM Robert Marko <robert.marko@sartura.hr> wrote:
>
> From: Christian Lamparter <chunkeey@gmail.com>
>
> Add support for the Qualcomm IPQ40xx SoC in Kconfig.
> Also add its appropriate textofs.
Any blockers on this patch?

Thanks
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
