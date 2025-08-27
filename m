Return-Path: <linux-arm-msm+bounces-71031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 456CAB387CB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 18:32:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 241014E258D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 16:32:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ECBE2D1F7E;
	Wed, 27 Aug 2025 16:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="gg6p/4E5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D946A1A3172
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 16:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756312367; cv=none; b=revjaUZaqDlQhyAdM8k01gF15R1vuO5jhhfLue25IYHXCINKQZrsZ5yxNYS6cushu59mEjZBxMOLZWJFWrwlexJIrz3np8mSNqMYw8Tu03J4D1OXiVrpffpaQhw5JYWixRxTYtu/2YTim+VDh3LQoxDFD3dnK9KsBG6T7aMEVmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756312367; c=relaxed/simple;
	bh=sokmmttEF6WQPkFswGePVZ5nkysqROOmFeWowMPSpUo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q8vDHHygvW9MPSUKaCfiHlRmJp2a9ZjHEuomLlq+iynacJ6hdxkno31iRtyu+84pmCUDdeN71mwRiKSGtMJkebUCsnmBq17lAwEh7dEhUf/mkQbckWSjK52GIEtO8/tKjmsamGg5bg28vEADld9kFvvTa70ZY4d89jakYx5kisM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=gg6p/4E5; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-55f3edab4c7so43651e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 09:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756312362; x=1756917162; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uA1HrGWTiFMd6/17t962MubCXtdKe85dul62wLkDnTc=;
        b=gg6p/4E5aHVjH2uXxUZQmHFeMlCI6dMmMHKdqeWL05IuMASeI8AzbS0b5vbm14JQSc
         Vl1hta3TK28UU5Cmfixr0mIj1j4u+27ey6lTR3ItGQYtGlFPslHa3dePuw+oszlpum54
         pkE8qYAIp2Xdniv9uBYfZZMUYLIBFoGBEHqb1uDoEsXa4UyC2IBbdLzjnQ5WgY6FwoWA
         RigQ/8/HWXRfJ5M4w9iFlYznxoMEcmvYZjOXaegue2qEEil2Jpt3KRQD4fam6q5T/CQu
         w+hZqa/tQuFAny2PpcJg3w577VtVqDtfaaU9RnxtxAyVk2cqFtbldLGsEuGbSWh10b5k
         KMsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756312362; x=1756917162;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uA1HrGWTiFMd6/17t962MubCXtdKe85dul62wLkDnTc=;
        b=cv4T/0KcP6AeejzyQM8usy/F8L0cI1uYueF7LwaNL6sSZTUlsFZKTeNqfsnIA/fhSF
         v9BOklcut7oaR/nMQfwCC3rpxuMDS4VJl0RuBXXZwP3z+5UXYTNImSicRxlTNZnZENiS
         BNTU9O1L07fcfKnBcHI2HfxyaFUSW1bfpw9icydVU3rz+V1HqCJGGW9CL+/pn04ZqWRm
         4mnCRrSm0fqzrmNoLEoRK5UC9RYjRXRUSedZabpo7fGfu/gfN5RcJqLxF3qTJNF87A00
         wa9AeJGdsS+p3hGYJn4f9Xr9buzMWmkmV6VX7uVkQYYfhajkR3s7P42uLHr2x2nBsyyV
         8qYQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6y0TbBpmBVjRoOx+9VcLDaqX3H7AA5Dp6rv7uZOHi2X8NNF+CaKX40YNVllzEq5BALW9C8I/mnrZd3FR0@vger.kernel.org
X-Gm-Message-State: AOJu0YzDKfBgXUqoH3qa5cbbz0jGs11JLA00f0y/5NUOUetP7ChSMPpT
	wdXO68xVoDHnwGrxI+YxwrA1/dim1/xpAtUgISYxhb0j3ii67iEo78U2Z+VkQni1Nq4rRt1VbWD
	/OMZfOyEYr+OdyY5OKwZIVCLpMJIW9HoxGP6eZ3ojW1OgfEEMIA6o
X-Gm-Gg: ASbGncv4T72eMr1t3Fg2N8MfV8momGb9NyRXtOUy3sAFboEZ+O9SB7hCKdAm/8d0+cO
	K/44d9JryoaceB4AZToWxsqzkGBoMiSN2wD+J7dCqCxMxBxDhUwyUPkmJ6GX9xxlKEMQR2Wr7Un
	nnMaw/FO/QM+A/MC41HDNcRW3Yr8H+YhOUgURQ0TwxGpcRPJb8CybHv+oV4KGijlxCpHG8HqvUb
	CREepYaRIbKogqW8Fs4+wejvDWeqXq3uHcyKqmEH+9DbQlWKg==
X-Google-Smtp-Source: AGHT+IGmaVgA4GxBThOJulhfd/FOmckKPWhf4GB/qcPY+ghPacNlqJYq74uWQJwg/9d4AeS4NhA5YVY0Wv+MelGFJfg=
X-Received: by 2002:a05:6512:2903:b0:55f:4760:ffc4 with SMTP id
 2adb3069b0e04-55f47610278mr2391780e87.29.1756312361741; Wed, 27 Aug 2025
 09:32:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250819-pci-pwrctrl-perst-v1-0-4b74978d2007@oss.qualcomm.com> <20250819-pci-pwrctrl-perst-v1-3-4b74978d2007@oss.qualcomm.com>
In-Reply-To: <20250819-pci-pwrctrl-perst-v1-3-4b74978d2007@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 27 Aug 2025 18:32:30 +0200
X-Gm-Features: Ac12FXz1RS70--AFk1fE2akY5GEXMKvlLbcKfDDlrSH8dzP6VB_vbFzt6mioyQE
Message-ID: <CAMRc=Me2P9r9w-UPtjMAEvuQ_oNtibzPBg6tE7s1wdKkLmQgcQ@mail.gmail.com>
Subject: Re: [PATCH 3/6] PCI/pwrctrl: Add support for toggling PERST#
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Manivannan Sadhasivam <mani@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Saravana Kannan <saravanak@google.com>, linux-pci@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, Brian Norris <briannorris@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 19, 2025 at 9:15=E2=80=AFAM Manivannan Sadhasivam via B4 Relay
<devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org> wrote:
>
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>
> As per PCIe spec r6.0, sec 6.6.1, PERST# is an auxiliary signal provided =
by
> the system to a component as a Fundamental Reset. This signal if availabl=
e,
> should conform to the rules defined by the electromechanical form factor
> specifications like PCIe CEM spec r4.0, sec 2.2.
>
> Since pwrctrl driver is meant to control the power supplies, it should al=
so
> control the PERST# signal if available. But traditionally, the host bridg=
e
> (controller) drivers are the ones parsing and controlling the PERST#
> signal. They also sometimes need to assert PERST# during their own hardwa=
re
> initialization. So it is not possible to move the PERST# control away fro=
m
> the controller drivers and it must be shared logically.
>
> Hence, add a new callback 'pci_host_bridge::toggle_perst', that allows th=
e
> pwrctrl core to toggle PERST# with the help of the controller drivers. Bu=
t
> care must be taken care by the controller drivers to not deassert the
> PERST# signal if this callback is populated.
>
> This callback if available, will be called by the pwrctrl core during the
> device power up and power down scenarios. Controller drivers should
> identify the device using the 'struct device_node' passed during the
> callback and toggle PERST# accordingly.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.=
com>
> ---
>  drivers/pci/pwrctrl/core.c | 27 +++++++++++++++++++++++++++
>  include/linux/pci.h        |  1 +
>  2 files changed, 28 insertions(+)
>
> diff --git a/drivers/pci/pwrctrl/core.c b/drivers/pci/pwrctrl/core.c
> index 6bdbfed584d6d79ce28ba9e384a596b065ca69a4..8a26f432436d064acb7ebbbc9=
ce8fc339909fbe9 100644
> --- a/drivers/pci/pwrctrl/core.c
> +++ b/drivers/pci/pwrctrl/core.c
> @@ -6,6 +6,7 @@
>  #include <linux/device.h>
>  #include <linux/export.h>
>  #include <linux/kernel.h>
> +#include <linux/of.h>
>  #include <linux/pci.h>
>  #include <linux/pci-pwrctrl.h>
>  #include <linux/property.h>
> @@ -61,6 +62,28 @@ void pci_pwrctrl_init(struct pci_pwrctrl *pwrctrl, str=
uct device *dev)
>  }
>  EXPORT_SYMBOL_GPL(pci_pwrctrl_init);
>
> +static void pci_pwrctrl_perst_deassert(struct pci_pwrctrl *pwrctrl)
> +{
> +       struct pci_host_bridge *host_bridge =3D to_pci_host_bridge(pwrctr=
l->dev->parent);
> +       struct device_node *np =3D dev_of_node(pwrctrl->dev);
> +
> +       if (!host_bridge->toggle_perst)
> +               return;
> +
> +       host_bridge->toggle_perst(host_bridge, np, false);
> +}
> +
> +static void pci_pwrctrl_perst_assert(struct pci_pwrctrl *pwrctrl)
> +{
> +       struct pci_host_bridge *host_bridge =3D to_pci_host_bridge(pwrctr=
l->dev->parent);
> +       struct device_node *np =3D dev_of_node(pwrctrl->dev);
> +
> +       if (!host_bridge->toggle_perst)
> +               return;
> +
> +       host_bridge->toggle_perst(host_bridge, np, true);
> +}
> +
>  /**
>   * pci_pwrctrl_device_set_ready() - Notify the pwrctrl subsystem that th=
e PCI
>   * device is powered-up and ready to be detected.
> @@ -82,6 +105,8 @@ int pci_pwrctrl_device_set_ready(struct pci_pwrctrl *p=
wrctrl)
>         if (!pwrctrl->dev)
>                 return -ENODEV;
>
> +       pci_pwrctrl_perst_deassert(pwrctrl);
> +
>         pwrctrl->nb.notifier_call =3D pci_pwrctrl_notify;
>         ret =3D bus_register_notifier(&pci_bus_type, &pwrctrl->nb);
>         if (ret)
> @@ -103,6 +128,8 @@ void pci_pwrctrl_device_unset_ready(struct pci_pwrctr=
l *pwrctrl)
>  {
>         cancel_work_sync(&pwrctrl->work);
>
> +       pci_pwrctrl_perst_assert(pwrctrl);
> +
>         /*
>          * We don't have to delete the link here. Typically, this functio=
n
>          * is only called when the power control device is being detached=
. If
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 59876de13860dbe50ee6c207cd57e54f51a11079..9eeee84d550bb9f15a90b5db9=
da03fccef8097ee 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -605,6 +605,7 @@ struct pci_host_bridge {
>         void (*release_fn)(struct pci_host_bridge *);
>         int (*enable_device)(struct pci_host_bridge *bridge, struct pci_d=
ev *dev);
>         void (*disable_device)(struct pci_host_bridge *bridge, struct pci=
_dev *dev);
> +       void (*toggle_perst)(struct pci_host_bridge *bridge, struct devic=
e_node *np, bool assert);

Shouldn't this be wrapped in an #if IS_ENABLED(PCI_PWRCTL)?

Bart

>         void            *release_data;
>         unsigned int    ignore_reset_delay:1;   /* For entire hierarchy *=
/
>         unsigned int    no_ext_tags:1;          /* No Extended Tags */
>
> --
> 2.45.2
>
>

