Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27DE612E079
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jan 2020 22:08:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727207AbgAAVIh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Jan 2020 16:08:37 -0500
Received: from mail-vs1-f65.google.com ([209.85.217.65]:34275 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727183AbgAAVIh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Jan 2020 16:08:37 -0500
Received: by mail-vs1-f65.google.com with SMTP id g15so24409006vsf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jan 2020 13:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aky0/K6ipzZUQtU1J8iwS16GYzW4RxCCQJcReDQ16e4=;
        b=gx2UBQVAHcOXdrGTmaE7Z7UDehfiE1XzFcVmlpCWHmrseOYxtIi6dTejHGOfwXsgJo
         9u0voMJ32vaQ8W6rybZP5c7HyOM5Jekf5UWkvFZt+NEuD+ajbQyWov64mf8MijCyBW3a
         VB79h0LDv+MiTbsNnmsDfI0zbvaQvsBupNZnWD2JcyipcE34o6WBFrTHEJqZBXbvIJZv
         t2s/gkraZKZ2np2Zc1ZY6HNAqMpJv+EAuUA9g91BrfbiGhyB0DiEAyVmot5B50CZ2qmO
         Q9LAuecYhjSY9rEn72W6okNn+wfpOyJfm/jAG+YEFGF6BjkQY3zSxmAylhLCkRJ1d+D3
         oLBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aky0/K6ipzZUQtU1J8iwS16GYzW4RxCCQJcReDQ16e4=;
        b=AgNot48H0r5qa1mRXqWHe9TfC/Bd2N75mO5FTraOifAQLW5HocVcn5IKrXDiXpDfHR
         BkK582qN0xSKi8NRsh0cB/sRIgQ+Ju4bce4AAMecIGzLRvAeIky2P1NkmJdmvnccFK7q
         MvnywC3u6HkWMg47A+aiJuUZpw6WPQVAPwcSMyW/AwEV3JCxCTmnAEB12dZ1limE0aoN
         +tF12GKdT7q0tPj30+xuzVcpfD0R4he9UdnqJwN9Valim2JMC0CU6gu/0Bs2dcYQ7KxS
         7ZGFGGcal2slp5A4iw6jFZDPMBOq3Ays82yyRJXk8Uz+FU8wwMil8nPahsEXG0J2tmCm
         Gm5Q==
X-Gm-Message-State: APjAAAUKZUtjK/g1Oo3ZP+lDkm+rj1eVdmKjBsZUXsfTHMDbbdzKM9qu
        9MaDr/Wsn32JkMGo4cgZU7wwNwCSKogo3BcPsBIqGg==
X-Google-Smtp-Source: APXvYqxKINiKDhC6XhOJOfqlHXl3pNjzXtm5zBUf4t1DLw/wCQDeZPxxg4OVLsoCk6lycDFoFsWqLcEQfPWDGEe7Ryk=
X-Received: by 2002:a05:6102:d4:: with SMTP id u20mr32339102vsp.27.1577912915852;
 Wed, 01 Jan 2020 13:08:35 -0800 (PST)
MIME-Version: 1.0
References: <1577106871-19863-1-git-send-email-rkambl@codeaurora.org> <1577106871-19863-2-git-send-email-rkambl@codeaurora.org>
In-Reply-To: <1577106871-19863-2-git-send-email-rkambl@codeaurora.org>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Thu, 2 Jan 2020 02:38:24 +0530
Message-ID: <CAHLCerNMv-9V2R5LDqPcK42SPZGw+TuXkoJhAA5E9wkG0NEvDw@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sc7180: Add critical interrupt and
 cooling maps for TSENS in SC7180.
To:     Rajeshwari <rkambl@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, sanm@codeaurora.org,
        sivaa@codeaurora.org, manafm@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Dec 23, 2019 at 6:46 PM Rajeshwari <rkambl@codeaurora.org> wrote:
>
> Signed-off-by: Rajeshwari <rkambl@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 289 +++++++++++++++++++++++++++++------
>  1 file changed, 239 insertions(+), 50 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 3676bfd..e419ca0 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -10,6 +10,7 @@
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/phy/phy-qcom-qusb2.h>
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
> +#include <dt-bindings/thermal/thermal.h>


<snip>

> -               cpu1-thermal {
> +               cpu_0_1-thermal {

Is this renaming to include the cluster number really improving
anything considering that the cpus section defines them as CPU0..CPU7?

Leave them as-is.

>                         polling-delay-passive = <250>;
>                         polling-delay = <1000>;
>
>                         thermal-sensors = <&tsens0 2>;
>
>                         trips {
> -                               cpu1_alert0: trip-point0 {
> +                               cpu_0_1_alert0: trip-point0 {

cpu_0_1_alert0 is unnecessarily too long, IMO. Leave it as-is. Same
for all the renames below.

>                                         temperature = <90000>;
>                                         hysteresis = <2000>;
>                                         type = "passive";
>                                 };
>
> -                               cpu1_alert1: trip-point1 {
> +                               cpu_0_1_alert1: trip-point1 {
>                                         temperature = <95000>;
>                                         hysteresis = <2000>;
>                                         type = "passive";
>                                 };
>
> -                               cpu1_crit: cpu_crit {
> +                               cpu_0_1_crit: cpu_crit {
>                                         temperature = <110000>;
>                                         hysteresis = <1000>;
>                                         type = "critical";
>                                 };
>                         };

<snip>
