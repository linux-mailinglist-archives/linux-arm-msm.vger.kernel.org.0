Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3DDC1521F0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2020 22:26:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727441AbgBDV0e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Feb 2020 16:26:34 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:41499 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727412AbgBDV0e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Feb 2020 16:26:34 -0500
Received: by mail-lj1-f195.google.com with SMTP id h23so160301ljc.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Feb 2020 13:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vTz8PyXQJRb4I9mgRpSeVED8uN8WJjpsQd/YEaL6wbU=;
        b=Iv+Dvxf9ibUn6XLo7EOWou0R1/YLP2nqcWiLJMoA7iC5TvwOPtx7AkHqjBwEjfVrpa
         LarOj+yWziH3WQia2I525km8uAjQ6cBZDGOXWUMp31h4cci5m+GiSS3DR+WxVtXqfzPB
         Jko9F1avg1kWRPh70ECQ8MnpOpO3HrcMy+5gc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vTz8PyXQJRb4I9mgRpSeVED8uN8WJjpsQd/YEaL6wbU=;
        b=aWa7mbmdOKEz9O9YxPZ7FRNyuYtXX0S6/gr9Shyi221Emu/wnntMl7IYSOXiHBsRNk
         AM0d4c/ukIJv1RDxUFKFOfHBKCRcL4pO6TnoNmyI+nH78OiNlgtiiqqL10iy10qjX6ny
         UwdrReCBXMe8PIAK1eqMMhsLWAiTMhrRECUY8Kxw+bQogx04WjuheBL77v9CrHpRXoAY
         o4i1seH0u07ubgeJAeB3IQLzBA65GSFwIwvGhL4afWrSf/x3yX9fz2/rwuX0VakTJ2dz
         t8JQD22WhebNUhPtrN1BQGF4Ld2uCWjupnV5NH8u2VbzGW265nKsYoguVp0+neDVTJO0
         TwyQ==
X-Gm-Message-State: APjAAAX5ANPZTLyrlhbEjdF4mntyCCgrZGSvFojMGma42Rin7qkhyR3q
        TRrDti44uzwjUM2O7ZYX+ibN2vaVijw=
X-Google-Smtp-Source: APXvYqzK0IoKrXVziW2s9zyO8fQHGp9gmZoD38dk1qNrK3OL8wYCIcPaDJXztEClNSWNqz/FRhTvJQ==
X-Received: by 2002:a2e:97cc:: with SMTP id m12mr18250134ljj.241.1580851591554;
        Tue, 04 Feb 2020 13:26:31 -0800 (PST)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id k23sm12391591ljj.85.2020.02.04.13.26.30
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2020 13:26:30 -0800 (PST)
Received: by mail-lj1-f170.google.com with SMTP id o15so170061ljg.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Feb 2020 13:26:30 -0800 (PST)
X-Received: by 2002:a2e:85ce:: with SMTP id h14mr18520973ljj.41.1580851589968;
 Tue, 04 Feb 2020 13:26:29 -0800 (PST)
MIME-Version: 1.0
References: <1568718649-20124-1-git-send-email-cchiluve@codeaurora.org> <1568718649-20124-3-git-send-email-cchiluve@codeaurora.org>
In-Reply-To: <1568718649-20124-3-git-send-email-cchiluve@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Tue, 4 Feb 2020 13:25:53 -0800
X-Gmail-Original-Message-ID: <CAE=gft7KaKJ9BhFvJaBt9m=mNi63SeBWWoxQ3e2eQVZ0t3HEzA@mail.gmail.com>
Message-ID: <CAE=gft7KaKJ9BhFvJaBt9m=mNi63SeBWWoxQ3e2eQVZ0t3HEzA@mail.gmail.com>
Subject: Re: [PATCH V3 2/3] usb: dwc3: qcom: Add interconnect support in dwc3 driver
To:     Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
Cc:     balbi@kernel.org, Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        linux-usb@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

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
> +
> +/**
> + * dwc3_qcom_interconnect_init() - Get interconnect path handles
> + * @qcom:                      Pointer to the concerned usb core.
> + *
> + */
> +static int dwc3_qcom_interconnect_init(struct dwc3_qcom *qcom)
> +{
> +       struct device *dev = qcom->dev;

I'm not subscribed to linux-usb, so I don't have the V4 edition. So
I'm commenting here. In the v4 version there's a line:
 struct dwc3 *dwc;

that results in an unused local variable compiler warning.
-Evan
