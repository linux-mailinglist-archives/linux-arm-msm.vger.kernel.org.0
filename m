Return-Path: <linux-arm-msm+bounces-31659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D228977440
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 00:22:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 71CE21C24025
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 22:22:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE0661C175F;
	Thu, 12 Sep 2024 22:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VW1V9ujq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2C218EFED;
	Thu, 12 Sep 2024 22:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726179734; cv=none; b=llP8qMC9CN6v+JkjZo9F5O1i6JnyYIJr7eVBezHmG0q9p+6+6mhz1q1oIAxkm7Ws5rT6B+IAmusKP694Pz5D11PYoFYQw5YAbrS2Do3c12af0aeMijB5iCl5oziLYelt3MVhRHI7dkzVJWyRoKvEhIU1JuQV1gELfrZRA/e5PvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726179734; c=relaxed/simple;
	bh=g117wiQ8/bJmXLcZJlUSIAlGi2Dg5CIvsuBmYm7pYdo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fng09aCo8vv2IEgU6WoAzqVotHTmrZAdNgGzjhARoEP3Kht+8V0qQC4ktZZGkDWKM57MiNfuTVAjJbHRvfhoHpSZIxAixMfnd0k8glREeG0L7iIMD3bkecUgVi5HGMcw6IDaS7IF+NQtfDRu9foUxVGu84vEhKV7oaJJGMZgbtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VW1V9ujq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFBBAC4CEC6;
	Thu, 12 Sep 2024 22:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726179734;
	bh=g117wiQ8/bJmXLcZJlUSIAlGi2Dg5CIvsuBmYm7pYdo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VW1V9ujq19CEVfWp4crDR69xVtCwtdRTVjeupkTTrgcIarE2e+KAwdDz0Cv7Ke8yq
	 N4Y7QWdL7O3Ss0YydI6TU7BLnV3dpLknSCOF2ygveOHC9IUoBpTIHyNmQdYKQwP0/z
	 53hzC0mCoiL4QUK6spKLxiIk+QeKVdQfLAXiehsk1Rmssm5I2PGPiPpvIAdrcmoo52
	 Y6MarR8f976qsPDi5FD/N9VR6oRj1/y8Bio/Q6Ae1BtsWMYXObPMATsp9D8qLM6+di
	 6xyAs9vMByt1dXcGi7EQwXVFwI0Nr0cFQiTif+GcKTZUC9RYBDl8a0c0GqrRyQ2XHY
	 JFKLnOwU5PQCg==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2f75c6ed397so17190861fa.2;
        Thu, 12 Sep 2024 15:22:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUiOdZ6nJ/ScOz1D19sZijn1EEzSNEhZ1xQt4uMjaQdBUAl3lWsCP9ltzI4M6qieqU4NOpyMr7J9fuXO78w@vger.kernel.org, AJvYcCVW2V6MwnHoDtzIfjc1JsPcFRtbV6R9oBAa5l16jKjH9nehfvLyR2Fgb6cixNcey975Fu1R3H6EUfLB@vger.kernel.org, AJvYcCW6GT/aEr7KN6Ati6JumBM9O7eyWtM45oXLacHQODmwC8ueTpowL5FtnV7X9CeIQUU1I3bywGwlgCSN@vger.kernel.org, AJvYcCWEbcWCRJpyXZyQMha7FfLTOl85S30j3vrDZYmV91K590NxEwd6WSrHw+TpX2F9QZvP7nvNUw3IHNUsc9hzEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+umnV4UFiOol8cmD3+hNfdR9IyTOJFQxHBWeAEWC9YQYjoQ36
	n0gVQ0HXxx0mnFP6Blwr28Wg4Kjv8FBmmwJWSmhl7PZ7Ff/mUDlsmCX4RK+q3gCZCTSwS5geuRv
	f+E1doOortOXVHpjX4y8rg5CjBww=
X-Google-Smtp-Source: AGHT+IFx3v4DzxDfH8/ldajVM7oT5L0qIEvizkHlckwt9gNQAcjsz9IUWjlmfhMHsFD8PanFrv8U+a6ynQX1a8byp3Y=
X-Received: by 2002:a2e:a7ca:0:b0:2f0:25dc:1894 with SMTP id
 38308e7fff4ca-2f787daf4bamr25949701fa.2.1726179732492; Thu, 12 Sep 2024
 15:22:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240811-dwc3-refactor-v2-0-91f370d61ad2@quicinc.com> <20240811-dwc3-refactor-v2-4-91f370d61ad2@quicinc.com>
In-Reply-To: <20240811-dwc3-refactor-v2-4-91f370d61ad2@quicinc.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 13 Sep 2024 07:21:35 +0900
X-Gmail-Original-Message-ID: <CAK7LNATGJHpC1WsesiNg-nYjs-8GK26at-VvykqvwOf-6k724g@mail.gmail.com>
Message-ID: <CAK7LNATGJHpC1WsesiNg-nYjs-8GK26at-VvykqvwOf-6k724g@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] usb: dwc3: core: Expose core driver as library
To: Bjorn Andersson <andersson@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Felipe Balbi <balbi@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	Saravana Kannan <saravanak@google.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Bjorn Andersson <quic_bjorande@quicinc.com>
Content-Type: multipart/mixed; boundary="000000000000c6fb740621f38941"

--000000000000c6fb740621f38941
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 12, 2024 at 12:07=E2=80=AFPM Bjorn Andersson <andersson@kernel.=
org> wrote:
>
> From: Bjorn Andersson <quic_bjorande@quicinc.com>
>
> The DWC3 IP block is handled by three distinct device drivers: XHCI,
> DWC3 core and a platform specific (optional) DWC3 glue driver.
>
> This has resulted in, at least in the case of the Qualcomm glue, the
> presence of a number of layering violations, where the glue code either
> can't handle, or has to work around, the fact that core might not probe
> deterministically.
>
> An example of this is that the suspend path should operate slightly
> different depending on the device operating in host or peripheral mode,
> and the only way to determine the operating state is to peek into the
> core's drvdata.
>
> The Qualcomm glue driver is expected to make updates in the qscratch
> register region (the "glue" region) during role switch events, but with
> the glue and core split using the driver model, there is no reasonable
> way to introduce listeners for mode changes.
>
> Split the dwc3 core platform_driver callbacks and their implementation
> and export the implementation, to make it possible to deterministically
> instantiate the dwc3 core as part of the dwc3 glue drivers and to
> allow flattening of the DeviceTree representation.
>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  drivers/usb/dwc3/core.c | 169 +++++++++++++++++++++++++++++++-----------=
------
>  drivers/usb/dwc3/core.h |   3 +
>  2 files changed, 114 insertions(+), 58 deletions(-)
>
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index 734de2a8bd21..6addb3c367e6 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -36,6 +36,7 @@
>
>  #include "core.h"
>  #include "gadget.h"
> +#include "glue.h"
>  #include "io.h"
>
>  #include "debug.h"
> @@ -2076,10 +2077,11 @@ static int dwc3_get_num_ports(struct dwc3 *dwc)
>         return 0;
>  }
>
> -static int dwc3_probe(struct platform_device *pdev)
> +struct dwc3 *dwc3_probe(struct platform_device *pdev, struct resource *r=
es,
> +                       bool ignore_clocks_and_resets, void *glue)
>  {
>         struct device           *dev =3D &pdev->dev;
> -       struct resource         *res, dwc_res;
> +       struct resource         dwc_res;
>         unsigned int            hw_mode;
>         void __iomem            *regs;
>         struct dwc3             *dwc;
> @@ -2087,15 +2089,10 @@ static int dwc3_probe(struct platform_device *pde=
v)
>
>         dwc =3D devm_kzalloc(dev, sizeof(*dwc), GFP_KERNEL);
>         if (!dwc)
> -               return -ENOMEM;
> +               return ERR_PTR(-ENOMEM);
>
>         dwc->dev =3D dev;
> -
> -       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       if (!res) {
> -               dev_err(dev, "missing memory resource\n");
> -               return -ENODEV;
> -       }
> +       dwc->glue =3D glue;
>
>         dwc->xhci_resources[0].start =3D res->start;
>         dwc->xhci_resources[0].end =3D dwc->xhci_resources[0].start +
> @@ -2123,7 +2120,7 @@ static int dwc3_probe(struct platform_device *pdev)
>
>         regs =3D devm_ioremap_resource(dev, &dwc_res);
>         if (IS_ERR(regs))
> -               return PTR_ERR(regs);
> +               return ERR_CAST(regs);
>
>         dwc->regs       =3D regs;
>         dwc->regs_size  =3D resource_size(&dwc_res);
> @@ -2132,15 +2129,17 @@ static int dwc3_probe(struct platform_device *pde=
v)
>
>         dwc3_get_software_properties(dwc);
>
> -       dwc->reset =3D devm_reset_control_array_get_optional_shared(dev);
> -       if (IS_ERR(dwc->reset)) {
> -               ret =3D PTR_ERR(dwc->reset);
> -               goto err_put_psy;
> -       }
> +       if (!ignore_clocks_and_resets) {
> +               dwc->reset =3D devm_reset_control_array_get_optional_shar=
ed(dev);
> +               if (IS_ERR(dwc->reset)) {
> +                       ret =3D PTR_ERR(dwc->reset);
> +                       goto err_put_psy;
> +               }
>
> -       ret =3D dwc3_get_clocks(dwc);
> -       if (ret)
> -               goto err_put_psy;
> +               ret =3D dwc3_get_clocks(dwc);
> +               if (ret)
> +                       goto err_put_psy;
> +       }
>
>         ret =3D reset_control_deassert(dwc->reset);
>         if (ret)
> @@ -2225,7 +2224,7 @@ static int dwc3_probe(struct platform_device *pdev)
>
>         dma_set_max_seg_size(dev, UINT_MAX);
>
> -       return 0;
> +       return dwc;
>
>  err_exit_debugfs:
>         dwc3_debugfs_exit(dwc);
> @@ -2249,14 +2248,33 @@ static int dwc3_probe(struct platform_device *pde=
v)
>         if (dwc->usb_psy)
>                 power_supply_put(dwc->usb_psy);
>
> -       return ret;
> +       return ERR_PTR(ret);
>  }
> +EXPORT_SYMBOL_GPL(dwc3_probe);
>
> -static void dwc3_remove(struct platform_device *pdev)
> +static int dwc3_plat_probe(struct platform_device *pdev)
>  {
> -       struct dwc3     *dwc =3D platform_get_drvdata(pdev);
> +       struct resource *res;
> +       struct dwc3 *dwc;
> +
> +       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       if (!res) {
> +               dev_err(&pdev->dev, "missing memory resource\n");
> +               return -ENODEV;
> +       }
>
> -       pm_runtime_get_sync(&pdev->dev);
> +       dwc =3D dwc3_probe(pdev, res, false, NULL);
> +       if (IS_ERR(dwc))
> +               return PTR_ERR(dwc);
> +
> +       platform_set_drvdata(pdev, dwc);
> +
> +       return 0;
> +}
> +
> +void dwc3_remove(struct dwc3 *dwc)
> +{
> +       pm_runtime_get_sync(dwc->dev);
>
>         dwc3_core_exit_mode(dwc);
>         dwc3_debugfs_exit(dwc);
> @@ -2264,22 +2282,28 @@ static void dwc3_remove(struct platform_device *p=
dev)
>         dwc3_core_exit(dwc);
>         dwc3_ulpi_exit(dwc);
>
> -       pm_runtime_allow(&pdev->dev);
> -       pm_runtime_disable(&pdev->dev);
> -       pm_runtime_dont_use_autosuspend(&pdev->dev);
> -       pm_runtime_put_noidle(&pdev->dev);
> +       pm_runtime_allow(dwc->dev);
> +       pm_runtime_disable(dwc->dev);
> +       pm_runtime_dont_use_autosuspend(dwc->dev);
> +       pm_runtime_put_noidle(dwc->dev);
>         /*
>          * HACK: Clear the driver data, which is currently accessed by pa=
rent
>          * glue drivers, before allowing the parent to suspend.
>          */
> -       platform_set_drvdata(pdev, NULL);
> -       pm_runtime_set_suspended(&pdev->dev);
> +       dev_set_drvdata(dwc->dev, NULL);
> +       pm_runtime_set_suspended(dwc->dev);
>
>         dwc3_free_event_buffers(dwc);
>
>         if (dwc->usb_psy)
>                 power_supply_put(dwc->usb_psy);
>  }
> +EXPORT_SYMBOL_GPL(dwc3_remove);
> +
> +static void dwc3_plat_remove(struct platform_device *pdev)
> +{
> +       dwc3_remove(platform_get_drvdata(pdev));
> +}
>
>  #ifdef CONFIG_PM
>  static int dwc3_core_init_for_resume(struct dwc3 *dwc)
> @@ -2450,9 +2474,8 @@ static int dwc3_runtime_checks(struct dwc3 *dwc)
>         return 0;
>  }
>
> -static int dwc3_runtime_suspend(struct device *dev)
> +int dwc3_runtime_suspend(struct dwc3 *dwc)
>  {
> -       struct dwc3     *dwc =3D dev_get_drvdata(dev);
>         int             ret;
>
>         if (dwc3_runtime_checks(dwc))
> @@ -2464,10 +2487,10 @@ static int dwc3_runtime_suspend(struct device *de=
v)
>
>         return 0;
>  }
> +EXPORT_SYMBOL_GPL(dwc3_runtime_suspend);
>
> -static int dwc3_runtime_resume(struct device *dev)
> +int dwc3_runtime_resume(struct dwc3 *dwc)
>  {
> -       struct dwc3     *dwc =3D dev_get_drvdata(dev);
>         int             ret;
>
>         ret =3D dwc3_resume_common(dwc, PMSG_AUTO_RESUME);
> @@ -2484,15 +2507,14 @@ static int dwc3_runtime_resume(struct device *dev=
)
>                 break;
>         }
>
> -       pm_runtime_mark_last_busy(dev);
> +       pm_runtime_mark_last_busy(dwc->dev);
>
>         return 0;
>  }
> +EXPORT_SYMBOL_GPL(dwc3_runtime_resume);
>
> -static int dwc3_runtime_idle(struct device *dev)
> +int dwc3_runtime_idle(struct dwc3 *dwc)
>  {
> -       struct dwc3     *dwc =3D dev_get_drvdata(dev);
> -
>         switch (dwc->current_dr_role) {
>         case DWC3_GCTL_PRTCAP_DEVICE:
>                 if (dwc3_runtime_checks(dwc))
> @@ -2504,52 +2526,67 @@ static int dwc3_runtime_idle(struct device *dev)
>                 break;
>         }
>
> -       pm_runtime_mark_last_busy(dev);
> -       pm_runtime_autosuspend(dev);
> +       pm_runtime_mark_last_busy(dwc->dev);
> +       pm_runtime_autosuspend(dwc->dev);
>
>         return 0;
>  }
> +EXPORT_SYMBOL_GPL(dwc3_runtime_idle);
> +
> +static int dwc3_plat_runtime_suspend(struct device *dev)
> +{
> +       return dwc3_runtime_suspend(dev_get_drvdata(dev));
> +}
> +
> +static int dwc3_plat_runtime_resume(struct device *dev)
> +{
> +       return dwc3_runtime_resume(dev_get_drvdata(dev));
> +}
> +
> +static int dwc3_plat_runtime_idle(struct device *dev)
> +{
> +       return dwc3_runtime_idle(dev_get_drvdata(dev));
> +}
>  #endif /* CONFIG_PM */
>
>  #ifdef CONFIG_PM_SLEEP
> -static int dwc3_suspend(struct device *dev)
> +int dwc3_suspend(struct dwc3 *dwc)
>  {
> -       struct dwc3     *dwc =3D dev_get_drvdata(dev);
>         int             ret;
>
>         ret =3D dwc3_suspend_common(dwc, PMSG_SUSPEND);
>         if (ret)
>                 return ret;
>
> -       pinctrl_pm_select_sleep_state(dev);
> +       pinctrl_pm_select_sleep_state(dwc->dev);
>
>         return 0;
>  }
> +EXPORT_SYMBOL_GPL(dwc3_suspend);
>
> -static int dwc3_resume(struct device *dev)
> +int dwc3_resume(struct dwc3 *dwc)
>  {
> -       struct dwc3     *dwc =3D dev_get_drvdata(dev);
>         int             ret;
>
> -       pinctrl_pm_select_default_state(dev);
> +       pinctrl_pm_select_default_state(dwc->dev);
>
> -       pm_runtime_disable(dev);
> -       pm_runtime_set_active(dev);
> +       pm_runtime_disable(dwc->dev);
> +       pm_runtime_set_active(dwc->dev);
>
>         ret =3D dwc3_resume_common(dwc, PMSG_RESUME);
>         if (ret) {
> -               pm_runtime_set_suspended(dev);
> +               pm_runtime_set_suspended(dwc->dev);
>                 return ret;
>         }
>
> -       pm_runtime_enable(dev);
> +       pm_runtime_enable(dwc->dev);
>
>         return 0;
>  }
> +EXPORT_SYMBOL_GPL(dwc3_resume);
>
> -static void dwc3_complete(struct device *dev)
> +void dwc3_complete(struct dwc3 *dwc)
>  {
> -       struct dwc3     *dwc =3D dev_get_drvdata(dev);
>         u32             reg;
>
>         if (dwc->current_dr_role =3D=3D DWC3_GCTL_PRTCAP_HOST &&
> @@ -2559,15 +2596,31 @@ static void dwc3_complete(struct device *dev)
>                 dwc3_writel(dwc->regs, DWC3_GUCTL3, reg);
>         }
>  }
> +EXPORT_SYMBOL_GPL(dwc3_complete);
> +
> +static int dwc3_plat_suspend(struct device *dev)
> +{
> +       return dwc3_suspend(dev_get_drvdata(dev));
> +}
> +
> +static int dwc3_plat_resume(struct device *dev)
> +{
> +       return dwc3_resume(dev_get_drvdata(dev));
> +}
> +
> +static void dwc3_plat_complete(struct device *dev)
> +{
> +       dwc3_complete(dev_get_drvdata(dev));
> +}
>  #else
> -#define dwc3_complete NULL
> +#define dwc3_plat_complete NULL
>  #endif /* CONFIG_PM_SLEEP */
>
>  static const struct dev_pm_ops dwc3_dev_pm_ops =3D {
> -       SET_SYSTEM_SLEEP_PM_OPS(dwc3_suspend, dwc3_resume)
> -       .complete =3D dwc3_complete,
> -       SET_RUNTIME_PM_OPS(dwc3_runtime_suspend, dwc3_runtime_resume,
> -                       dwc3_runtime_idle)
> +       SET_SYSTEM_SLEEP_PM_OPS(dwc3_plat_suspend, dwc3_plat_resume)
> +       .complete =3D dwc3_plat_complete,
> +       SET_RUNTIME_PM_OPS(dwc3_plat_runtime_suspend, dwc3_plat_runtime_r=
esume,
> +                          dwc3_plat_runtime_idle)
>  };
>
>  #ifdef CONFIG_OF
> @@ -2595,8 +2648,8 @@ MODULE_DEVICE_TABLE(acpi, dwc3_acpi_match);
>  #endif
>
>  static struct platform_driver dwc3_driver =3D {
> -       .probe          =3D dwc3_probe,
> -       .remove_new     =3D dwc3_remove,
> +       .probe          =3D dwc3_plat_probe,
> +       .remove_new     =3D dwc3_plat_remove,
>         .driver         =3D {
>                 .name   =3D "dwc3",
>                 .of_match_table =3D of_match_ptr(of_dwc3_match),
> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index 1e561fd8b86e..4a0ee9ef72e2 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -1160,6 +1160,7 @@ struct dwc3_scratchpad_array {
>   * @gsbuscfg0_reqinfo: store GSBUSCFG0.DATRDREQINFO, DESRDREQINFO,
>   *                    DATWRREQINFO, and DESWRREQINFO value passed from
>   *                    glue driver.
> + * @glue: private reference to any glue context
>   */
>  struct dwc3 {
>         struct work_struct      drd_work;
> @@ -1388,6 +1389,8 @@ struct dwc3 {
>         int                     num_ep_resized;
>         struct dentry           *debug_root;
>         u32                     gsbuscfg0_reqinfo;
> +
> +       void                    *glue;


This is ugly.


'struct dwc3_qcom' can wrap 'struct dwc3'
instead of having two separate structures
pointing at each other.


You can use container_of() to
convert (struct dwc3 *) to (struct dwc3_qcom *).


I attached a diff to delete the reverse ->glue pointer.

I did not compile-test it (I cannot due to missing glue.h
anyway), but you will understand my suggestion.


--=20
Best Regards
Masahiro Yamada

--000000000000c6fb740621f38941
Content-Type: text/x-patch; charset="US-ASCII"; name="remove-glue-pointer.diff"
Content-Disposition: attachment; filename="remove-glue-pointer.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_m0zuork90>
X-Attachment-Id: f_m0zuork90

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jIGIvZHJpdmVycy91c2IvZHdjMy9j
b3JlLmMKaW5kZXggNWI1ZjY4MzFkOWYzLi45ZDFmN2RiOTM3ZDAgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvdXNiL2R3YzMvY29yZS5jCisrKyBiL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jCkBAIC0yMDg1
LDIzICsyMDg1LDE0IEBAIHN0YXRpYyBpbnQgZHdjM19nZXRfbnVtX3BvcnRzKHN0cnVjdCBkd2Mz
ICpkd2MpCiAJcmV0dXJuIDA7CiB9CiAKLXN0cnVjdCBkd2MzICpkd2MzX3Byb2JlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYsIHN0cnVjdCByZXNvdXJjZSAqcmVzLAotCQkJYm9vbCBpZ25v
cmVfY2xvY2tzX2FuZF9yZXNldHMsIHZvaWQgKmdsdWUpCitpbnQgZHdjM19pbml0KHN0cnVjdCBk
d2MzICpkd2MsIHN0cnVjdCByZXNvdXJjZSAqcmVzLCBib29sIGlnbm9yZV9jbG9ja3NfYW5kX3Jl
c2V0cykKIHsKLQlzdHJ1Y3QgZGV2aWNlCQkqZGV2ID0gJnBkZXYtPmRldjsKKwlzdHJ1Y3QgZGV2
aWNlCQkqZGV2ID0gZHdjLT5kZXY7CiAJc3RydWN0IHJlc291cmNlCQlkd2NfcmVzOwogCXVuc2ln
bmVkIGludAkJaHdfbW9kZTsKIAl2b2lkIF9faW9tZW0JCSpyZWdzOwotCXN0cnVjdCBkd2MzCQkq
ZHdjOwogCWludAkJCXJldDsKIAotCWR3YyA9IGRldm1fa3phbGxvYyhkZXYsIHNpemVvZigqZHdj
KSwgR0ZQX0tFUk5FTCk7Ci0JaWYgKCFkd2MpCi0JCXJldHVybiBFUlJfUFRSKC1FTk9NRU0pOwot
Ci0JZHdjLT5kZXYgPSBkZXY7Ci0JZHdjLT5nbHVlID0gZ2x1ZTsKLQogCWR3Yy0+eGhjaV9yZXNv
dXJjZXNbMF0uc3RhcnQgPSByZXMtPnN0YXJ0OwogCWR3Yy0+eGhjaV9yZXNvdXJjZXNbMF0uZW5k
ID0gZHdjLT54aGNpX3Jlc291cmNlc1swXS5zdGFydCArCiAJCQkJCURXQzNfWEhDSV9SRUdTX0VO
RDsKQEAgLTIxNjMsNyArMjE1NCw3IEBAIHN0cnVjdCBkd2MzICpkd2MzX3Byb2JlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYsIHN0cnVjdCByZXNvdXJjZSAqcmVzLAogCQlnb3RvIGVycl9k
aXNhYmxlX2Nsa3M7CiAJfQogCi0JcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgZHdjKTsKKwlk
ZXZfc2V0X2RydmRhdGEoZGV2LCBkd2MpOwogCWR3YzNfY2FjaGVfaHdwYXJhbXMoZHdjKTsKIAog
CWlmICghZHdjLT5zeXNkZXZfaXNfcGFyZW50ICYmCkBAIC0yMjcxLDE2ICsyMjYyLDIwIEBAIHN0
YXRpYyBpbnQgZHdjM19wbGF0X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJ
CXJldHVybiAtRU5PREVWOwogCX0KIAotCWR3YyA9IGR3YzNfcHJvYmUocGRldiwgcmVzLCBmYWxz
ZSwgTlVMTCk7Ci0JaWYgKElTX0VSUihkd2MpKQotCQlyZXR1cm4gUFRSX0VSUihkd2MpOworCWR3
YyA9IGRldm1fa3phbGxvYygmcGRldi0+ZGV2LCBzaXplb2YoKmR3YyksIEdGUF9LRVJORUwpOwor
CWlmICghZHdjKQorCQlyZXR1cm4gRVJSX1BUUigtRU5PTUVNKTsKIAotCXBsYXRmb3JtX3NldF9k
cnZkYXRhKHBkZXYsIGR3Yyk7CisJZHdjLT5kZXYgPSAmcGRldi0+ZGV2OworCisJcmV0ID0gZHdj
M19pbml0KGR3YywgcmVzLCBmYWxzZSk7CisJaWYgKHJldCkKKwkJcmV0dXJuIHJldDsKIAogCXJl
dHVybiAwOwogfQogCi12b2lkIGR3YzNfcmVtb3ZlKHN0cnVjdCBkd2MzICpkd2MpCit2b2lkIGR3
YzNfdW5pbml0KHN0cnVjdCBkd2MzICpkd2MpCiB7CiAJcG1fcnVudGltZV9nZXRfc3luYyhkd2Mt
PmRldik7CiAKQEAgLTIzMDYsMTEgKzIzMDEsMTEgQEAgdm9pZCBkd2MzX3JlbW92ZShzdHJ1Y3Qg
ZHdjMyAqZHdjKQogCWlmIChkd2MtPnVzYl9wc3kpCiAJCXBvd2VyX3N1cHBseV9wdXQoZHdjLT51
c2JfcHN5KTsKIH0KLUVYUE9SVF9TWU1CT0xfR1BMKGR3YzNfcmVtb3ZlKTsKK0VYUE9SVF9TWU1C
T0xfR1BMKGR3YzNfdW5pbml0KTsKIAotc3RhdGljIHZvaWQgZHdjM19wbGF0X3JlbW92ZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQorc3RhdGljIHZvaWQgZHdjM19yZW1vdmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHsKLQlkd2MzX3JlbW92ZShwbGF0Zm9ybV9nZXRfZHJ2
ZGF0YShwZGV2KSk7CisJZHdjM191bmluaXQocGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldikpOwog
fQogCiAjaWZkZWYgQ09ORklHX1BNCkBAIC0yNjU2LDggKzI2NTEsOCBAQCBNT0RVTEVfREVWSUNF
X1RBQkxFKGFjcGksIGR3YzNfYWNwaV9tYXRjaCk7CiAjZW5kaWYKIAogc3RhdGljIHN0cnVjdCBw
bGF0Zm9ybV9kcml2ZXIgZHdjM19kcml2ZXIgPSB7Ci0JLnByb2JlCQk9IGR3YzNfcGxhdF9wcm9i
ZSwKLQkucmVtb3ZlX25ldwk9IGR3YzNfcGxhdF9yZW1vdmUsCisJLnByb2JlCQk9IGR3YzNfcHJv
YmUsCisJLnJlbW92ZV9uZXcJPSBkd2MzX3JlbW92ZSwKIAkuZHJpdmVyCQk9IHsKIAkJLm5hbWUJ
PSAiZHdjMyIsCiAJCS5vZl9tYXRjaF90YWJsZQk9IG9mX21hdGNoX3B0cihvZl9kd2MzX21hdGNo
KSwKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5oIGIvZHJpdmVycy91c2IvZHdj
My9jb3JlLmgKaW5kZXggNGEwZWU5ZWY3MmUyLi4xZTU2MWZkOGI4NmUgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvdXNiL2R3YzMvY29yZS5oCisrKyBiL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5oCkBAIC0x
MTYwLDcgKzExNjAsNiBAQCBzdHJ1Y3QgZHdjM19zY3JhdGNocGFkX2FycmF5IHsKICAqIEBnc2J1
c2NmZzBfcmVxaW5mbzogc3RvcmUgR1NCVVNDRkcwLkRBVFJEUkVRSU5GTywgREVTUkRSRVFJTkZP
LAogICoJCSAgICAgICBEQVRXUlJFUUlORk8sIGFuZCBERVNXUlJFUUlORk8gdmFsdWUgcGFzc2Vk
IGZyb20KICAqCQkgICAgICAgZ2x1ZSBkcml2ZXIuCi0gKiBAZ2x1ZTogcHJpdmF0ZSByZWZlcmVu
Y2UgdG8gYW55IGdsdWUgY29udGV4dAogICovCiBzdHJ1Y3QgZHdjMyB7CiAJc3RydWN0IHdvcmtf
c3RydWN0CWRyZF93b3JrOwpAQCAtMTM4OSw4ICsxMzg4LDYgQEAgc3RydWN0IGR3YzMgewogCWlu
dAkJCW51bV9lcF9yZXNpemVkOwogCXN0cnVjdCBkZW50cnkJCSpkZWJ1Z19yb290OwogCXUzMgkJ
CWdzYnVzY2ZnMF9yZXFpbmZvOwotCi0Jdm9pZAkJCSpnbHVlOwogfTsKIAogI2RlZmluZSBJTkNS
WF9CVVJTVF9NT0RFIDAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1xY29tLmMg
Yi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtcWNvbS5jCmluZGV4IDI3YjUwMTNjZDQxMS4uZTkwODhh
ODg3M2E4IDEwMDY0NAotLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtcWNvbS5jCisrKyBiL2Ry
aXZlcnMvdXNiL2R3YzMvZHdjMy1xY29tLmMKQEAgLTc2LDcgKzc2LDcgQEAgc3RydWN0IGR3YzNf
cWNvbV9wb3J0IHsKIHN0cnVjdCBkd2MzX3Fjb20gewogCXN0cnVjdCBkZXZpY2UJCSpkZXY7CiAJ
dm9pZCBfX2lvbWVtCQkqcXNjcmF0Y2hfYmFzZTsKLQlzdHJ1Y3QgZHdjMwkJKmR3YzsKKwlzdHJ1
Y3QgZHdjMwkJZHdjOwogCXN0cnVjdCBjbGsJCSoqY2xrczsKIAlpbnQJCQludW1fY2xvY2tzOwog
CXN0cnVjdCByZXNldF9jb250cm9sCSpyZXNldHM7CkBAIC05NjQsOSArOTY0LDExIEBAIHN0YXRp
YyBpbnQgZHdjM19xY29tX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJaWYg
KGlnbm9yZV9waXBlX2NsaykKIAkJZHdjM19xY29tX3NlbGVjdF91dG1pX2NsayhxY29tKTsKIAot
CXFjb20tPmR3YyA9IGR3YzNfcHJvYmUocGRldiwgJnJlcywgdHJ1ZSwgcWNvbSk7Ci0JaWYgKElT
X0VSUihxY29tLT5kd2MpKSAgewotCQlyZXQgPSBkZXZfZXJyX3Byb2JlKGRldiwgUFRSX0VSUihx
Y29tLT5kd2MpLCAiZmFpbGVkIHRvIHJlZ2lzdGVyIERXQzMgQ29yZVxuIik7CisJcWNvbS0+ZHdj
LmRldiA9IGRldjsKKworCXJldCA9IGR3YzNfaW5pdCgmcWNvbS0+ZHdjLCAmcmVzLCB0cnVlKTsK
KwlpZiAocmV0KSAgeworCQlyZXQgPSBkZXZfZXJyX3Byb2JlKGRldiwgcmV0LCAiZmFpbGVkIHRv
IHJlZ2lzdGVyIERXQzMgQ29yZVxuIik7CiAJCWdvdG8gY2xrX2Rpc2FibGU7CiAJfQogCkBAIC05
OTUsNyArOTk3LDcgQEAgc3RhdGljIGludCBkd2MzX3Fjb21fcHJvYmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikKIGludGVyY29ubmVjdF9leGl0OgogCWR3YzNfcWNvbV9pbnRlcmNvbm5l
Y3RfZXhpdChxY29tKTsKIHJlbW92ZV9jb3JlOgotCWR3YzNfcmVtb3ZlKHFjb20tPmR3Yyk7CisJ
ZHdjM191bmluaXQocWNvbS0+ZHdjKTsKIGNsa19kaXNhYmxlOgogCWZvciAoaSA9IHFjb20tPm51
bV9jbG9ja3MgLSAxOyBpID49IDA7IGktLSkgewogCQljbGtfZGlzYWJsZV91bnByZXBhcmUocWNv
bS0+Y2xrc1tpXSk7CkBAIC0xMDEwLDcgKzEwMTIsNyBAQCBzdGF0aWMgaW50IGR3YzNfcWNvbV9w
cm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogc3RhdGljIHZvaWQgZHdjM19xY29t
X3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogewogCXN0cnVjdCBkd2MzICpk
d2MgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsKLQlzdHJ1Y3QgZHdjM19xY29tICpxY29t
ID0gZHdjLT5nbHVlOworCXN0cnVjdCBkd2MzX3Fjb20gKnFjb20gPSB0b19kd2MzX3Fjb20oZHdj
KTsKIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2OwogCWludCBpOwogCkBAIC0xMDMw
LDcgKzEwMzIsNyBAQCBzdGF0aWMgdm9pZCBkd2MzX3Fjb21fcmVtb3ZlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpCiBzdGF0aWMgaW50IF9fbWF5YmVfdW51c2VkIGR3YzNfcWNvbV9wbV9z
dXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikKIHsKIAlzdHJ1Y3QgZHdjMyAqZHdjID0gZGV2X2dl
dF9kcnZkYXRhKGRldik7Ci0Jc3RydWN0IGR3YzNfcWNvbSAqcWNvbSA9IGR3Yy0+Z2x1ZTsKKwlz
dHJ1Y3QgZHdjM19xY29tICpxY29tID0gdG9fZHdjM19xY29tKGR3Yyk7CiAJYm9vbCB3YWtldXAg
PSBkZXZpY2VfbWF5X3dha2V1cChkZXYpOwogCWludCByZXQ7CiAKQEAgLTEwNTAsNyArMTA1Miw3
IEBAIHN0YXRpYyBpbnQgX19tYXliZV91bnVzZWQgZHdjM19xY29tX3BtX3N1c3BlbmQoc3RydWN0
IGRldmljZSAqZGV2KQogc3RhdGljIGludCBfX21heWJlX3VudXNlZCBkd2MzX3Fjb21fcG1fcmVz
dW1lKHN0cnVjdCBkZXZpY2UgKmRldikKIHsKIAlzdHJ1Y3QgZHdjMyAqZHdjID0gZGV2X2dldF9k
cnZkYXRhKGRldik7Ci0Jc3RydWN0IGR3YzNfcWNvbSAqcWNvbSA9IGR3Yy0+Z2x1ZTsKKwlzdHJ1
Y3QgZHdjM19xY29tICpxY29tID0gdG9fZHdjM19xY29tKGR3Yyk7CiAJYm9vbCB3YWtldXAgPSBk
ZXZpY2VfbWF5X3dha2V1cChkZXYpOwogCWludCByZXQ7CiAKQEAgLTEwNzAsNyArMTA3Miw3IEBA
IHN0YXRpYyBpbnQgX19tYXliZV91bnVzZWQgZHdjM19xY29tX3BtX3Jlc3VtZShzdHJ1Y3QgZGV2
aWNlICpkZXYpCiBzdGF0aWMgaW50IF9fbWF5YmVfdW51c2VkIGR3YzNfcWNvbV9ydW50aW1lX3N1
c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQogewogCXN0cnVjdCBkd2MzICpkd2MgPSBkZXZfZ2V0
X2RydmRhdGEoZGV2KTsKLQlzdHJ1Y3QgZHdjM19xY29tICpxY29tID0gZHdjLT5nbHVlOworCXN0
cnVjdCBkd2MzX3Fjb20gKnFjb20gPSB0b19kd2MzX3Fjb20oZHdjKTsKIAlpbnQgcmV0OwogCiAJ
cmV0ID0gZHdjM19ydW50aW1lX3N1c3BlbmQocWNvbS0+ZHdjKTsKQEAgLTEwOTAsNyArMTA5Miw3
IEBAIHN0YXRpYyB2b2lkIF9fbWF5YmVfdW51c2VkIGR3YzNfcWNvbV9jb21wbGV0ZShzdHJ1Y3Qg
ZGV2aWNlICpkZXYpCiBzdGF0aWMgaW50IF9fbWF5YmVfdW51c2VkIGR3YzNfcWNvbV9ydW50aW1l
X3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpCiB7CiAJc3RydWN0IGR3YzMgKmR3YyA9IGRldl9n
ZXRfZHJ2ZGF0YShkZXYpOwotCXN0cnVjdCBkd2MzX3Fjb20gKnFjb20gPSBkd2MtPmdsdWU7CisJ
c3RydWN0IGR3YzNfcWNvbSAqcWNvbSA9IHRvX2R3YzNfcWNvbShkd2MpOwogCWludCByZXQ7CiAK
IAlyZXQgPSBkd2MzX3Fjb21fcmVzdW1lKHFjb20sIHRydWUpOwo=
--000000000000c6fb740621f38941--

