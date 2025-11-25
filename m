Return-Path: <linux-arm-msm+bounces-83203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7126DC83F1F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 09:19:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 49D274E8145
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 08:19:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1BA12D2391;
	Tue, 25 Nov 2025 08:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="j2WQ7PVd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB71D288C25
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 08:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764058744; cv=none; b=NocHJ+mPqRWlYvETbwyzwVi3y7e/C9IjV44+MaVp4p/k1rbhPtAJ1pC2bHYFPZLeNwpSqbuk4qHV7GC0AISlkN2kTFObyXqjH7zAAEHt/OY+5TI1k0EIbXr/USQ5yovb5vdfyaV0uCf2/woNmJ2YrW3uibXdxMwJCMG/whKeu8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764058744; c=relaxed/simple;
	bh=zor+RSumMm7bO9S/VD6/XBUvwQWnH42SDPcawz1z5X8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FErdhSm5pgQES+q1O0f0Keiz48w+SkQttT+HMLqYIioxZoBf20+xyOfgFhqL5ziR5UdcZsgM4/p4tyy5kDlcpv8raf97CddTvK9DFyoflKRwB8kVxWeWCD1ZE5heLvhjX/TyUkNdsjckDUnqLc2uVXWPWclFPbgARa8rTXdYFMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=j2WQ7PVd; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5957d7e0bf3so5897592e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 00:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764058741; x=1764663541; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZV1wd0RBNRffIVLLzUybH3O3hc5b+Hoh+1Ef3J9avQU=;
        b=j2WQ7PVdyNX4vHVb1HX12lLF5ZnUYUjV6EcPyUXHduiSghhJwIV+ZyRe49mPoDpWcT
         X9adhvVaf7QzA84H0/gefPrHmHGyD56XvwDmqjPObHw7MwocEcKj6kkL0RGJatNSoG2/
         KxuWBIP2tqRQMaaqpkU6fi0uyN8p+Ra6WNNlw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764058741; x=1764663541;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZV1wd0RBNRffIVLLzUybH3O3hc5b+Hoh+1Ef3J9avQU=;
        b=UYTCRxK5i49mxXmE3UGaYGmW0/zpUZIB4X9HC61s4YLlJ8O8r75433t3uxaPri9gpO
         0UvIQ8+j1JYReg8CM6z8ypBzxO67dQuIr/iWEo0I1wmLZXZ7EkB3+/VypVikh7iHf0mL
         HUPT7ObGLQiTjzXzcNHbsxzJUZh+v+hVay+BvJ9A2hrEFyTHO4/7IZvCEGFmSgdVtsLk
         eiMdMAvhW41rGpPomnIxQmEpns3HQ1LWt2HiIpZlmlcIDGocAyPfCQRH1M8tDMkiRFbv
         7M3MbrT2F+tRI58e5/NtfNY5fXpB+lkt7Ttdbn3AjKxNv8U3fyRGDrMlG9Ea1HAinQAN
         Q5tw==
X-Forwarded-Encrypted: i=1; AJvYcCVpzvvRzzKKurFeWcg6zqUBRRAgQxj1VvKiJlfl4yWpunuRjTAH0CAITiJwt4oUM6w2AF4arFqcU9rdHBsj@vger.kernel.org
X-Gm-Message-State: AOJu0YxpGQjw3zEmy94MdZBy/IJblNm6Hlwdhm1e6SGkOnd6KlyJmk4i
	lbUBilVqn/4qckGUJS+OaswrQpv22mxjwZ9Ihcq4Vr1NezEQkKEe8RcMDyASW/ur19MYs3LxSmt
	1rG6VN5Fz+lZdCqQ9h423fX27eeGO2Z9iW/57tgZI
X-Gm-Gg: ASbGncvbhyqVRhaHNeHjXPu67fcaCehe3HoDM5kAOJSS1bhmUVax56crEEqtr6XgVfl
	WkyVojKq2qHdSGOQB2nwiabEx57eRUqDaWv4uhOMnaRE6uDWI1n32alyoAq97lwpuqLzrsV4iQ0
	RqWhznayzeqFFJvZHXc0I4B3X1XabKer+jvYP7AXRMXp8n3ymKg5BRe30CGucxzf41xc76eucdh
	IRD9D4wuLDMrtukyP9TcdmGENDz642MZkcmQMUkAQnwVGhqJmXnqC/eyr7dAYkeJ69G/Ey2pU3G
	Zei+nyo4BJtcJ0LuIgB1ljbMWA==
X-Google-Smtp-Source: AGHT+IHi2gdMuYFmg+AgrADHC4yrWhD9HWFMVG6P7ZsI1BLiNn/Orpx+b8it5IAqqf95qPLHI1Al/MkkSWIXbNGJKhc=
X-Received: by 2002:a05:6512:3d9e:b0:595:997e:19ad with SMTP id
 2adb3069b0e04-5969ea31e39mr6650085e87.21.1764058740770; Tue, 25 Nov 2025
 00:19:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251124-pci-pwrctrl-rework-v1-0-78a72627683d@oss.qualcomm.com> <20251124-pci-pwrctrl-rework-v1-3-78a72627683d@oss.qualcomm.com>
In-Reply-To: <20251124-pci-pwrctrl-rework-v1-3-78a72627683d@oss.qualcomm.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 25 Nov 2025 16:18:49 +0800
X-Gm-Features: AWmQ_bnl_TKiY4NjKvFlKoM2py7fy89Gm9jFvwJltzOJo-37UQGh1Ss64Akup3k
Message-ID: <CAGXv+5EyOOwZjUARfLzLvhX_vGdYHRz+0M=GbXaBMcaJ=0w+aA@mail.gmail.com>
Subject: Re: [PATCH 3/5] PCI/pwrctrl: Add APIs for explicitly creating and
 destroying pwrctrl devices
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@kernel.org>, 
	Brian Norris <briannorris@chromium.org>, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, Niklas Cassel <cassel@kernel.org>, 
	Alex Elder <elder@riscstar.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 25, 2025 at 3:13=E2=80=AFPM Manivannan Sadhasivam
<manivannan.sadhasivam@oss.qualcomm.com> wrote:
>
> From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>
> Previously, the PCI core created pwrctrl devices during pci_scan_device()
> on its own and then skipped enumeration of those devices, hoping the
> pwrctrl driver would power them on and trigger a bus rescan.
>
> This approach works for endpoint devices directly connected to Root Ports=
,
> but it fails for PCIe switches acting as bus extenders. When the switch
> requires pwrctrl support, and the pwrctrl driver is not available during
> the pwrctrl device creation, it's enumeration will be skipped during the
> initial PCI bus scan.
>
> This premature scan leads the PCI core to allocate resources (bridge
> windows, bus numbers) for the upstream bridge based on available downstre=
am
> buses at scan time. For non-hotplug capable bridges, PCI core typically
> allocates resources based on the number of buses available during the
> initial bus scan, which happens to be just one if the switch is not power=
ed
> on and enumerated at that time. When the switch gets enumerated later on,
> it will fail due to the lack of upstream resources.
>
> As a result, a PCIe switch powered on by the pwrctrl driver cannot be
> reliably enumerated currently. Either the switch has to be enabled in the
> bootloader or the switch pwrctrl driver has to be loaded during the pwrct=
rl
> device creation time to workaround these issues.
>
> This commit introduces new APIs to explicitly create and destroy pwrctrl
> devices from controller drivers by recursively scanning the PCI child nod=
es
> of the controller. These APIs allow creating pwrctrl devices based on the
> original criteria and are intended to be called during controller probe a=
nd
> removal.
>
> These APIs, together with the upcoming APIs for power on/off will allow t=
he
> controller drivers to power on all the devices before starting the initia=
l
> bus scan, thereby solving the resource allocation issue.
>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.co=
m>
> [mani: splitted the patch, cleaned up the code, and rewrote description]
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.=
com>
> ---
>  drivers/pci/pwrctrl/core.c  | 112 ++++++++++++++++++++++++++++++++++++++=
++++++
>  include/linux/pci-pwrctrl.h |   8 +++-
>  2 files changed, 119 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pci/pwrctrl/core.c b/drivers/pci/pwrctrl/core.c
> index 6bdbfed584d6..6eca54e0d540 100644
> --- a/drivers/pci/pwrctrl/core.c
> +++ b/drivers/pci/pwrctrl/core.c
> @@ -3,14 +3,21 @@
>   * Copyright (C) 2024 Linaro Ltd.
>   */
>
> +#define dev_fmt(fmt) "Pwrctrl: " fmt
> +
>  #include <linux/device.h>
>  #include <linux/export.h>
>  #include <linux/kernel.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
>  #include <linux/pci.h>
>  #include <linux/pci-pwrctrl.h>
> +#include <linux/platform_device.h>
>  #include <linux/property.h>
>  #include <linux/slab.h>
>
> +#include "../pci.h"
> +
>  static int pci_pwrctrl_notify(struct notifier_block *nb, unsigned long a=
ction,
>                               void *data)
>  {
> @@ -145,6 +152,111 @@ int devm_pci_pwrctrl_device_set_ready(struct device=
 *dev,
>  }
>  EXPORT_SYMBOL_GPL(devm_pci_pwrctrl_device_set_ready);
>
> +static int pci_pwrctrl_create_device(struct device_node *np, struct devi=
ce *parent)
> +{
> +       struct platform_device *pdev;
> +       int ret;
> +
> +       for_each_available_child_of_node_scoped(np, child) {
> +               ret =3D pci_pwrctrl_create_device(child, parent);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       /* Bail out if the platform device is already available for the n=
ode */
> +       pdev =3D of_find_device_by_node(np);
> +       if (pdev) {
> +               put_device(&pdev->dev);
> +               return 0;
> +       }
> +
> +       /*
> +        * Sanity check to make sure that the node has the compatible pro=
perty
> +        * to allow driver binding.
> +        */
> +       if (!of_property_present(np, "compatible"))
> +               return 0;
> +
> +       /*
> +        * Check whether the pwrctrl device really needs to be created or=
 not.
> +        * This is decided based on at least one of the power supplies be=
ing
> +        * defined in the devicetree node of the device.
> +        */
> +       if (!of_pci_supply_present(np)) {

This symbol is not exported for modules to use, and will cause the build
to fail if PCI_PWRCTRL* is m.

[...]


ChenYu

