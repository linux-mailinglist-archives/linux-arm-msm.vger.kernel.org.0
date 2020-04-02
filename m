Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CAA119CD98
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2020 01:49:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390239AbgDBXtX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Apr 2020 19:49:23 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:34811 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390224AbgDBXtX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Apr 2020 19:49:23 -0400
Received: by mail-vs1-f68.google.com with SMTP id b5so3857212vsb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2020 16:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2cvHKEqE410gCKmpQqv4fwxuaYQ7RFlmiPeeClrkMO8=;
        b=oHNClAaVRjBvfiIHC3meUIG6hnjnf11/sNZ/V7gNcrui28BTXX5jOIFMsGIdohMwHO
         h7PPfy7l5GWTBRcXZ4+8MeUxj5YFP+kXdRxhoLJbiUmJg6R/0pdItL6moT5PJzO0mky3
         yzMGM24MxAY5wilNoW2rYwoP90L/ZHasF5MUU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2cvHKEqE410gCKmpQqv4fwxuaYQ7RFlmiPeeClrkMO8=;
        b=P9F+f6kiQMQ8qphrYPc1zOE7CF9i33NaWyUi6ACOcmOtMgQUZMfY2eKpwl9lT5+0WK
         60oSci6kgpd757zAU3XC3rIwRYQCOVGIQ35xqPMvDvDD+HyeetVDYHLf+0QwMvqHvQSZ
         7E/Am0vLmlqr4hlZ81gttYXLF/XBlRkHle44jbBJT2qqLi+epAmHj49dp917X3vYJ6EU
         3TZndnSsZ4h4iHxv5Dk47BJ6BYO0jAIXT6vo/LRF7f8YrIHpL28rCmd4rs3U3rN1ia47
         of/pG6dKPUjA2Mc4oxawMWYB42rh34HMeBT/KsYR3G2MQR4CBnEUzGYSo7chOx0XIcWB
         U2QQ==
X-Gm-Message-State: AGi0PuaJoqBzKn/h+T33PxgH2Rr3PnIUHEn3QwZRuOoUwoxjR7M+ykx1
        maVRgMv+lghCk0GvfWE9wpEwTWkeDa8=
X-Google-Smtp-Source: APiQypItwfEB97LwdhwbwX8apHy9y7THdnDMyoAhxIEOe2SwQ7fS6VyP5VBmLAW5ulYhUZbgzM1ymw==
X-Received: by 2002:a05:6102:3204:: with SMTP id r4mr4239830vsf.109.1585871362329;
        Thu, 02 Apr 2020 16:49:22 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id f6sm1516589ual.9.2020.04.02.16.49.21
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2020 16:49:21 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id e20so1521494vke.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2020 16:49:21 -0700 (PDT)
X-Received: by 2002:a05:6122:305:: with SMTP id c5mr4339170vko.40.1585871360882;
 Thu, 02 Apr 2020 16:49:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200402223723.7150-1-john.stultz@linaro.org> <20200402234455.75061-1-john.stultz@linaro.org>
In-Reply-To: <20200402234455.75061-1-john.stultz@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 2 Apr 2020 16:49:08 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wh9_4a-cDGPdpMrXUi_HmJvS-a2Ubeyo5WG3sgwVWKKQ@mail.gmail.com>
Message-ID: <CAD=FV=Wh9_4a-cDGPdpMrXUi_HmJvS-a2Ubeyo5WG3sgwVWKKQ@mail.gmail.com>
Subject: Re: [PATCH v2] phy: qcom-qusb2: Re add "qcom,sdm845-qusb2-phy" compat string
To:     John Stultz <john.stultz@linaro.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Apr 2, 2020 at 4:45 PM John Stultz <john.stultz@linaro.org> wrote:
>
> In commit 8fe75cd4cddf ("phy: qcom-qusb2: Add generic QUSB2 V2
> PHY support"), the change was made to add "qcom,qusb2-v2-phy"
> as a generic compat string. However the change also removed
> the "qcom,sdm845-qusb2-phy" compat string, which is documented
> in the binding and already in use.
>
> This patch re-adds the "qcom,sdm845-qusb2-phy" compat string
> which allows the driver to continue to work with existing dts
> entries such as found on the db845c.
>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Doug Anderson <dianders@chromium.org>
> Cc: Manu Gautam <mgautam@codeaurora.org>
> Cc: Sandeep Maheswaram <sanm@codeaurora.org>
> Cc: Matthias Kaehlcke <mka@chromium.org>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: Kishon Vijay Abraham I <kishon@ti.com>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Fixes: 8fe75cd4cddf ("phy: qcom-qusb2: Add generic QUSB2 V2 PHY support")
> Reported-by: YongQin Liu <yongqin.liu@linaro.org>
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---
> v2: Add deprecation note on "qcom,sdm845-qusb2-phy" string
>     as suggested by Doug.
> ---
>  drivers/phy/qualcomm/phy-qcom-qusb2.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> index 3708d43b7508..393011a05b48 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> @@ -815,6 +815,13 @@ static const struct of_device_id qusb2_phy_of_match_table[] = {
>         }, {
>                 .compatible     = "qcom,msm8998-qusb2-phy",
>                 .data           = &msm8998_phy_cfg,
> +       }, {
> +               /*
> +                * Deprecated. Only here to support legacy device
> +                * trees that didn't include "qcom,qusb2-v2-phy"
> +                */
> +               .compatible     = "qcom,sdm845-qusb2-phy",
> +               .data           = &qusb2_v2_phy_cfg,

Thanks for adding the comment.  With that, I'll still grumble but I'm
OK with this if people really want it.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

-Doug
