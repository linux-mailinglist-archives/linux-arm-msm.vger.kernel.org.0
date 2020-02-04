Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 087C61520BD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2020 20:06:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727314AbgBDTGX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Feb 2020 14:06:23 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:40011 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727331AbgBDTGX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Feb 2020 14:06:23 -0500
Received: by mail-lj1-f194.google.com with SMTP id n18so19763730ljo.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Feb 2020 11:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8bClit+L1+WoVffp+is4tAUYwivuBDyFOrRgkOZDdvg=;
        b=NlPksnkFkkmQQs8xs8wtfwgmJgK6rHzfRunUuLKjz8Ctq1a6yEGICDiwuNhmGyBDz2
         llonkyMnmZUkTUyyQOqNWVeUclO2mhxH395E/elkqECUZ6NOQTc2PRBWeT9GEbulXfMQ
         ydHL5Yl2QvxPqltjc6pYZN3lt5C6GpiVC7g9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8bClit+L1+WoVffp+is4tAUYwivuBDyFOrRgkOZDdvg=;
        b=th6FXLnXqgEoVccLLyBweT9MJDRtmVa22x2h24wj2cTpC+RMSD3OivYMnjscuqjQo1
         X4s5XtGvjjzgTdF59CMREf6gtH/qSaagWm9UABMAHCCqkYXg+uUWFc2aKcHnZh2d9HsP
         6V6rNymE37WooTZBAQgC5JxN+3c1FllLgydqUEtLsGTBn8MX7CSHv7xsq4eslgBQ8uYG
         H0iyt8jbdnmagRG5F2w4u5Jx2IJsWlAGVyM3wSUKeCp2RRughZN+LUwBUQYG3pTTATjX
         r7wyn12M1SUtlIt8v8RFaJtHDv8u3lDyzkg1X7mYqsvGViRVTA8Q3/whAQCixZvsuCuj
         TCaQ==
X-Gm-Message-State: APjAAAW5HA+83YaW5Dfhf5OsBH6MIxXxM4aiZ2ae8HKvJFS2ajq9p5dk
        Kb1xjqx857f3gEICfvmBCE7H1eK4YJw=
X-Google-Smtp-Source: APXvYqx/OSHTYeZ3C0okX3R7lc1LKJzTKGGjBPwtBmMthhETBydev+GAxv8OGg6v4CZhWx4j7L+pIA==
X-Received: by 2002:a2e:3e0d:: with SMTP id l13mr18827357lja.70.1580843179446;
        Tue, 04 Feb 2020 11:06:19 -0800 (PST)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com. [209.85.208.178])
        by smtp.gmail.com with ESMTPSA id h19sm11996293ljl.57.2020.02.04.11.06.18
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2020 11:06:19 -0800 (PST)
Received: by mail-lj1-f178.google.com with SMTP id q8so19763057ljj.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Feb 2020 11:06:18 -0800 (PST)
X-Received: by 2002:a2e:81c7:: with SMTP id s7mr18444187ljg.3.1580843177358;
 Tue, 04 Feb 2020 11:06:17 -0800 (PST)
MIME-Version: 1.0
References: <1568718649-20124-1-git-send-email-cchiluve@codeaurora.org> <1568718649-20124-3-git-send-email-cchiluve@codeaurora.org>
In-Reply-To: <1568718649-20124-3-git-send-email-cchiluve@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Tue, 4 Feb 2020 11:05:41 -0800
X-Gmail-Original-Message-ID: <CAE=gft4ZM3H2eODOwdpOC5tBkRV9BBHPnya_rOy3mNmqH2Y3+Q@mail.gmail.com>
Message-ID: <CAE=gft4ZM3H2eODOwdpOC5tBkRV9BBHPnya_rOy3mNmqH2Y3+Q@mail.gmail.com>
Subject: Re: [PATCH V3 2/3] usb: dwc3: qcom: Add interconnect support in dwc3 driver
To:     Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
Cc:     balbi@kernel.org, Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        linux-usb@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Chandana,
Are you going to spin this series? My comments are below, I see
Matthias also has comments. Please CC us both on the next spin.
-Evan

On Tue, Sep 17, 2019 at 4:11 AM Chandana Kishori Chiluveru
<cchiluve@codeaurora.org> wrote:
>
> Add interconnect support in dwc3-qcom driver to vote for bus
> bandwidth.
>
> This requires for two different paths - from USB master to
> DDR slave. The other is from APPS master to USB slave.
>
> Signed-off-by: Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 145 ++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 143 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 184df4d..2a2f5af 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -12,6 +12,7 @@
>  #include <linux/module.h>
>  #include <linux/kernel.h>
>  #include <linux/extcon.h>
> +#include <linux/interconnect.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/phy/phy.h>
> @@ -59,8 +60,13 @@ struct dwc3_qcom {
>         enum usb_dr_mode        mode;
>         bool                    is_suspended;
>         bool                    pm_suspended;
> +       struct icc_path         *usb_ddr_icc_path;
> +       struct icc_path         *apps_usb_icc_path;
>  };
>
> +static int dwc3_qcom_interconnect_enable(struct dwc3_qcom *qcom);
> +static int dwc3_qcom_interconnect_disable(struct dwc3_qcom *qcom);

Is there any reason you didn't just define these functions earlier?

> +
>  static inline void dwc3_qcom_setbits(void __iomem *base, u32 offset, u32 val)
>  {
>         u32 reg;
> @@ -222,7 +228,7 @@ static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
>  static int dwc3_qcom_suspend(struct dwc3_qcom *qcom)
>  {
>         u32 val;
> -       int i;
> +       int i, ret;
>
>         if (qcom->is_suspended)
>                 return 0;
> @@ -234,6 +240,10 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom)
>         for (i = qcom->num_clocks - 1; i >= 0; i--)
>                 clk_disable_unprepare(qcom->clks[i]);
>
> +       ret = dwc3_qcom_interconnect_disable(qcom);
> +       if (ret)
> +               dev_warn(qcom->dev, "failed to disable interconnect %d\n", ret);

Shouldn't you propagate the failure if this doesn't work?

> +
>         qcom->is_suspended = true;
>         dwc3_qcom_enable_interrupts(qcom);
>
> @@ -259,6 +269,10 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom)
>                 }
>         }
>
> +       ret = dwc3_qcom_interconnect_enable(qcom);
> +       if (ret)
> +               dev_warn(qcom->dev, "failed to enable interconnect %d\n", ret);

Same here, isn't this important? In theory, if you cannot enable
bandwidth to the device, you aren't really allowed to touch it (with
odd exceptions for boot proxy votes, which might now be gone).

> +
>         /* Clear existing events from PHY related to L2 in/out */
>         dwc3_qcom_setbits(qcom->qscratch_base, PWR_EVNT_IRQ_STAT_REG,
>                           PWR_EVNT_LPM_IN_L2_MASK | PWR_EVNT_LPM_OUT_L2_MASK);
> @@ -268,6 +282,124 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom)
>         return 0;
>  }
>
> +/* Interconnect path bandwidths in MBps */
> +#define USB_MEMORY_AVG_HS_BW MBps_to_icc(240)
> +#define USB_MEMORY_PEAK_HS_BW MBps_to_icc(700)
> +#define USB_MEMORY_AVG_SS_BW  MBps_to_icc(1000)
> +#define USB_MEMORY_PEAK_SS_BW MBps_to_icc(2500)
> +#define APPS_USB_AVG_BW 0
> +#define APPS_USB_PEAK_BW MBps_to_icc(40)

Can you share at all how these numbers were arrived at? I thought HS
for instance was 480MB/s.

> +
> +/**
> + * dwc3_qcom_interconnect_init() - Get interconnect path handles
> + * @qcom:                      Pointer to the concerned usb core.
> + *
> + */
> +static int dwc3_qcom_interconnect_init(struct dwc3_qcom *qcom)
> +{
> +       struct device *dev = qcom->dev;
> +       int ret;
> +
> +       qcom->usb_ddr_icc_path = of_icc_get(dev, "usb-ddr");
> +       if (IS_ERR(qcom->usb_ddr_icc_path)) {
> +               dev_err(dev, "Error: (%ld) failed getting usb-ddr path\n",
> +                       PTR_ERR(qcom->usb_ddr_icc_path));
> +               return PTR_ERR(qcom->usb_ddr_icc_path);
> +       }
> +
> +       qcom->apps_usb_icc_path = of_icc_get(dev, "apps-usb");
> +       if (IS_ERR(qcom->apps_usb_icc_path)) {
> +               dev_err(dev, "Error: (%ld) failed getting apps-usb path\n",
> +                               PTR_ERR(qcom->apps_usb_icc_path));

You're leaking usb_ddr_icc_path here.

> +               return PTR_ERR(qcom->apps_usb_icc_path);
> +       }
> +
> +       ret = dwc3_qcom_interconnect_enable(qcom);
> +       if (ret) {
> +               dev_err(dev, "failed to enable interconnect %d\n", ret);
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +/**
> + * dwc3_qcom_interconnect_exit() - Release interconnect path handles
> + * @qcom:                      Pointer to the concerned usb core.
> + *
> + * This function is used to release interconnect path handle.
> + */
> +static void dwc3_qcom_interconnect_exit(struct dwc3_qcom *qcom)
> +{
> +       icc_put(qcom->usb_ddr_icc_path);
> +       icc_put(qcom->apps_usb_icc_path);
> +}
> +
> +/* Currently we only use bandwidth level, so just "enable" interconnects */
> +static int dwc3_qcom_interconnect_enable(struct dwc3_qcom *qcom)
> +{
> +       struct dwc3 *dwc;
> +       int ret;
> +
> +       dwc = platform_get_drvdata(qcom->dwc3);
> +       if (!dwc) {
> +               dev_err(qcom->dev, "Failed to get dwc3 device\n");
> +               return -EPROBE_DEFER;
> +       }
> +
> +       if (dwc->maximum_speed == USB_SPEED_SUPER) {
> +               ret = icc_set_bw(qcom->usb_ddr_icc_path,
> +                       USB_MEMORY_AVG_SS_BW, USB_MEMORY_PEAK_SS_BW);
> +               if (ret)
> +                       return ret;
> +       } else {
> +               ret = icc_set_bw(qcom->usb_ddr_icc_path,
> +                       USB_MEMORY_AVG_HS_BW, USB_MEMORY_PEAK_HS_BW);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       ret = icc_set_bw(qcom->apps_usb_icc_path,
> +               APPS_USB_AVG_BW, APPS_USB_PEAK_BW);
> +       if (ret)
> +               goto err_disable_mem_path;
> +
> +       return 0;
> +
> +err_disable_mem_path:
> +       icc_set_bw(qcom->usb_ddr_icc_path, 0, 0);
> +
> +       return ret;
> +}
> +
> +/* To disable an interconnect, we just set its bandwidth to 0 */
> +static int dwc3_qcom_interconnect_disable(struct dwc3_qcom *qcom)
> +{
> +       struct dwc3 *dwc = platform_get_drvdata(qcom->dwc3);
> +       int ret;
> +
> +       ret = icc_set_bw(qcom->usb_ddr_icc_path, 0, 0);
> +       if (ret)
> +               return ret;
> +
> +       ret = icc_set_bw(qcom->apps_usb_icc_path, 0, 0);
> +       if (ret)
> +               goto err_reenable_memory_path;
> +
> +       return 0;
> +
> +       /* Re-enable things in the event of an error */
> +err_reenable_memory_path:
> +       if (dwc->maximum_speed == USB_SPEED_SUPER)
> +               icc_set_bw(qcom->usb_ddr_icc_path,
> +                       USB_MEMORY_AVG_SS_BW, USB_MEMORY_PEAK_SS_BW);
> +       else
> +               icc_set_bw(qcom->usb_ddr_icc_path,
> +                       USB_MEMORY_AVG_HS_BW, USB_MEMORY_PEAK_HS_BW);

Yeah, this is weird. If you're failing to clear your votes, things are
in a pretty broken state, and these calls to re-enable bandwidth have
almost no chance of succeeding. Maybe just return failure here.

> +
> +       return ret;
> +}
> +
>  static irqreturn_t qcom_dwc3_resume_irq(int irq, void *data)
>  {
>         struct dwc3_qcom *qcom = data;
> @@ -494,6 +626,12 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>                 goto depopulate;
>         }
>
> +       ret = dwc3_qcom_interconnect_init(qcom);
> +       if (ret) {
> +               dev_err(dev, "failed to init interconnect handles %d\n", ret);
> +               goto depopulate;
> +       }
> +
>         qcom->mode = usb_get_dr_mode(&qcom->dwc3->dev);
>
>         /* enable vbus override for device mode */
> @@ -503,7 +641,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>         /* register extcon to override sw_vbus on Vbus change later */
>         ret = dwc3_qcom_register_extcon(qcom);
>         if (ret)
> -               goto depopulate;
> +               goto interconnect_exit;
>
>         device_init_wakeup(&pdev->dev, 1);
>         qcom->is_suspended = false;
> @@ -513,6 +651,8 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>
>         return 0;
>
> +interconnect_exit:
> +       dwc3_qcom_interconnect_exit(qcom);
>  depopulate:
>         of_platform_depopulate(&pdev->dev);
>  clk_disable:
> @@ -540,6 +680,7 @@ static int dwc3_qcom_remove(struct platform_device *pdev)
>         }
>         qcom->num_clocks = 0;
>
> +       dwc3_qcom_interconnect_exit(qcom);
>         reset_control_assert(qcom->resets);
>
>         pm_runtime_allow(dev);
> --
> Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
> is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.
>
