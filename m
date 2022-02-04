Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A9544A9821
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Feb 2022 12:03:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350599AbiBDLDT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Feb 2022 06:03:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237001AbiBDLDS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Feb 2022 06:03:18 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24AF7C061714
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Feb 2022 03:03:18 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id v74so4801656pfc.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Feb 2022 03:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4pAGNdLzrzCwGwPPeueOEKXAFHek3uiDSl3RDxGHQ1Y=;
        b=XArAhyZNknB47MlOtAk3nXAua4bnGx2l4motCPw+oQNnl46oaUfdicimSZO+mM2v/k
         XeAhE/NsH86NA1kJ481uGTbZfp8wp+wUTrt6ERfASmsrPWSaVe1mshEZKZAHzcwj1n2W
         L9fekJItXIEdwGl8VGsVIMboXQMrk4jK6z/+KJ75ci3cIKS5NJjie30FfNmuTwM+Bqrg
         0iaySNX8owJi1xAdwl365CoWaSOJqRB+5TTSHYmX6170luw5fUlqpyYlP0QcMiIXRvSt
         sCqlkOLEbuNkftZlKnk5faj9+yZsAt0ZEsgVUQnZekdr6Wo85gRP4Ociy4HfkX4DFs96
         yE8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4pAGNdLzrzCwGwPPeueOEKXAFHek3uiDSl3RDxGHQ1Y=;
        b=6YyqM7VfKGSQmWDHsWDbvQ+NiEqlhJ7TFFZWDAjU7fN2abw+rgakQuxubeU/MF6gPH
         +qXU+yDhwGLrkUN1Q3w7BBW7cAP+71s/c/jq0tb0UwDFI7a+dMAiUrr+tm0k82KwPNfk
         6fgwbxJEwdClxYo/nWJNJRhVSb9rc1undukbyLzQfaTjuA/WuTZYaVhutNR3wwnZyQpW
         AKn87deMmNIjUJOSOzrbsgAcECOZw/QKwBcmCwOlig86NPW1h6AIYHhUYl3ImFicm17c
         IVuOT16HASxwtP9XjvzBd90xFYLpGGB5rm3h8ngNEwwz+04iR8sydq7HUn3FAkQ3/jrZ
         65iA==
X-Gm-Message-State: AOAM533nn5HPmoUUqxpFI/6qZFFbStF/LOceAw4AVs4I3g2x80Rf95O7
        4JDSsZ25+MLH8dA9rHvUKdIjG6kadUgjjmUUR5r3Ug==
X-Google-Smtp-Source: ABdhPJz8bA0HDoe5xfk97Jhe/A1/tB9+4NHLTVLvaYKGRbd8eRiFlhoFX44sSgC54ga0ar98gxQxRrD7SltD13ebHXM=
X-Received: by 2002:a62:8fcb:: with SMTP id n194mr2464286pfd.29.1643972597596;
 Fri, 04 Feb 2022 03:03:17 -0800 (PST)
MIME-Version: 1.0
References: <20220203164629.1711958-1-vladimir.zapolskiy@linaro.org> <20220203164711.1712090-1-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20220203164711.1712090-1-vladimir.zapolskiy@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Fri, 4 Feb 2022 12:03:06 +0100
Message-ID: <CAG3jFyuzJmRk47kfd_zVw3g+_eKUQVG6y5hU0z1KfXPEM4quNg@mail.gmail.com>
Subject: Re: [PATCH 8/9] i2c: qcom-cci: add support of optional vbus-supply regulators
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Loic Poulain <loic.poulain@linaro.org>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 3 Feb 2022 at 17:47, Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
>
> The change adds handling of optional vbus regulators in the driver.
>
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  drivers/i2c/busses/i2c-qcom-cci.c | 49 +++++++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>
> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
> index 775945f7b4cd..2fc7f1f2616f 100644
> --- a/drivers/i2c/busses/i2c-qcom-cci.c
> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> @@ -11,6 +11,7 @@
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/regulator/consumer.h>
>
>  #define CCI_HW_VERSION                         0x0
>  #define CCI_RESET_CMD                          0x004
> @@ -480,6 +481,20 @@ static void cci_disable_clocks(struct cci *cci)
>  static int __maybe_unused cci_suspend_runtime(struct device *dev)
>  {
>         struct cci *cci = dev_get_drvdata(dev);
> +       struct regulator *bus_regulator;
> +       unsigned int i;
> +
> +       for (i = 0; i < cci->data->num_masters; i++) {
> +               if (!cci->master[i].cci)
> +                       continue;
> +
> +               bus_regulator = cci->master[i].adap.bus_regulator;
> +               if (!bus_regulator)
> +                       continue;
> +
> +               if (regulator_is_enabled(bus_regulator) > 0)

Is this check needed? No matter the current status of the regulator,
we'd like to disable it, and from my reading regulator_disable can be
called for already disabled regulators.

> +                       regulator_disable(bus_regulator);
> +       }
>
>         cci_disable_clocks(cci);
>         return 0;
> @@ -488,12 +503,30 @@ static int __maybe_unused cci_suspend_runtime(struct device *dev)
>  static int __maybe_unused cci_resume_runtime(struct device *dev)
>  {
>         struct cci *cci = dev_get_drvdata(dev);
> +       struct regulator *bus_regulator;
> +       unsigned int i;
>         int ret;
>
>         ret = cci_enable_clocks(cci);
>         if (ret)
>                 return ret;
>
> +       for (i = 0; i < cci->data->num_masters; i++) {
> +               if (!cci->master[i].cci)
> +                       continue;
> +
> +               bus_regulator = cci->master[i].adap.bus_regulator;
> +               if (!bus_regulator)
> +                       continue;
> +
> +               if (!regulator_is_enabled(bus_regulator)) {
> +                       ret = regulator_enable(bus_regulator);
> +                       if (ret)
> +                               dev_err(dev, "failed to enable regulator: %d\n",
> +                                       ret);
> +               }
> +       }
> +
>         cci_init(cci);
>         return 0;
>  }
> @@ -593,6 +626,7 @@ static int cci_probe(struct platform_device *pdev)
>         dev_dbg(dev, "CCI HW version = 0x%08x", val);
>
>         for_each_available_child_of_node(dev->of_node, child) {
> +               struct regulator *bus_regulator;
>                 struct cci_master *master;
>                 u32 idx;
>
> @@ -637,6 +671,21 @@ static int cci_probe(struct platform_device *pdev)
>                         master->cci = NULL;
>                         goto error_i2c;
>                 }
> +
> +               /*
> +                * It might be possible to find an optional vbus supply, but
> +                * it requires to pass the registration of an I2C adapter
> +                * device and its association with a bus device tree node.
> +                */
> +               bus_regulator = devm_regulator_get_optional(&master->adap.dev,
> +                                                           "vbus");
> +               if (IS_ERR(bus_regulator)) {
> +                       ret = PTR_ERR(bus_regulator);
> +                       if (ret == -EPROBE_DEFER)
> +                               goto error_i2c;
> +                       bus_regulator = NULL;
> +               }
> +               master->adap.bus_regulator = bus_regulator;
>         }
>
>         ret = cci_reset(cci);
> --
> 2.33.0
>

With the above nit sorted, feel free to add my r-b.

Reviewed-by: Robert Foss <robert.foss@linaro.org>
