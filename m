Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B28511BCD3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2019 20:25:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726864AbfLKTZi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Dec 2019 14:25:38 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:35848 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726828AbfLKTZi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Dec 2019 14:25:38 -0500
Received: by mail-io1-f66.google.com with SMTP id a22so27976ios.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2019 11:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AuPspogaaJ+YoXMUXjj634J3GCNOXTkD4GxSk/Fu5dA=;
        b=Ov2+zkYxARX/4G2CFUTDrTcWVYed0ALV7FAdS21qi5jU0vfvH/ZWc6qkFyMVL/CgBS
         +ER5AJeTdE2I8ujQ4UsDX4voFpXv0+pzIzsxksN+QOO5l1nU9CKKyJSKVKsZifYCWudi
         aNB4asF6dcNFFMM2FGpYupn60GCY0GLjGLUsA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AuPspogaaJ+YoXMUXjj634J3GCNOXTkD4GxSk/Fu5dA=;
        b=uHhF3nXqsr+nU7EwqTMEgd5CF/OhLPbmm16EyT+TCIFS7JDT2PUxSXlVh8wVjheX40
         ZQJ9XnaehAGaWnKDV+7g9pRCJ29Ie6J6VeThwLpBA9zwlCJLIQfQEY68cfAV0KpxuI/1
         ARkW3s0YZY2WLhN60gHHo11CT8fU3lTcuaXW0zOVdRSu+/pHNWINW/GD1djYYRnqrXLC
         OEJOoMMH+Sl3KyTMLIxKifh4dkSWNq73Kai6qZhoSMSBBy1LPlCvWGbG1RileUKIEVtd
         5vUw2HK8RCov/UlKLs9jMaE6tUZM7LRpDsmDCCYaLVMvWfbS8kkAm5CYS09VMMcju1TH
         zz1g==
X-Gm-Message-State: APjAAAU6xSsrQa1Z0kMj3pRs3YafIdjsidxUtzewH80R1yB/XlOZl+pt
        Qxv51wkmg4t9eCPOzlLHaPzza20Jsa0=
X-Google-Smtp-Source: APXvYqyRLITsmLhknpTYXZ88HBljkCBLjEw3QaXaqbCIgJ8lfU7Li6NyH1lxpb2z7kC/HHS+zMyvZg==
X-Received: by 2002:a5e:de04:: with SMTP id e4mr4017601iok.47.1576092337202;
        Wed, 11 Dec 2019 11:25:37 -0800 (PST)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com. [209.85.166.173])
        by smtp.gmail.com with ESMTPSA id z21sm725772ioj.21.2019.12.11.11.25.36
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2019 11:25:36 -0800 (PST)
Received: by mail-il1-f173.google.com with SMTP id p8so20432488iln.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2019 11:25:36 -0800 (PST)
X-Received: by 2002:a92:d581:: with SMTP id a1mr4302609iln.218.1576092336013;
 Wed, 11 Dec 2019 11:25:36 -0800 (PST)
MIME-Version: 1.0
References: <cover.1576037078.git.saiprakash.ranjan@codeaurora.org> <0101016ef3391ded-57772416-f32d-40e8-acb5-5dd1b6064f73-000000@us-west-2.amazonses.com>
In-Reply-To: <0101016ef3391ded-57772416-f32d-40e8-acb5-5dd1b6064f73-000000@us-west-2.amazonses.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 11 Dec 2019 11:25:23 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X3Akg07hetQOgd0P_wTVWs3QpuCNQ8O6qQ5LK2ZeWSaQ@mail.gmail.com>
Message-ID: <CAD=FV=X3Akg07hetQOgd0P_wTVWs3QpuCNQ8O6qQ5LK2ZeWSaQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sc7180: Add APSS watchdog node
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Sai,

On Tue, Dec 10, 2019 at 8:30 PM Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> Add APSS (Application Processor Subsystem) watchdog
> DT node for SC7180 SoC.
>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 666e9b92c7ad..a6773ad3738b 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1038,6 +1038,12 @@
>                         };
>                 };
>
> +               watchdog@17c10000 {
> +                       compatible = "qcom,apss-wdt-sc7180", "qcom,kpss-wdt";

If you haven't already done it (I couldn't find it), can you please
add this to "Documentation/devicetree/bindings/watchdog/qcom-wdt.txt"?
 Presumably at the same time it would be good to change the format of
that file to .yaml.


Unrelated to sc7180, but it also feels like something is awfully
screwy here in terms of the various Qualcomm device tree files
referring to watchdog timers.  It feels wrong, but perhaps you can
educate me on how it works and I'll see the light.  Specifically:

1. It seems like the same node is used for two things on other Qualcomm SoCs

If I grep the bindings for "qcom,kpss-timer" or "qcom,scss-timer", I
get two hits:

Documentation/devicetree/bindings/timer/qcom,msm-timer.txt
Documentation/devicetree/bindings/watchdog/qcom-wdt.txt

...and, in fact, there appear to be two drivers claiming compatibility here:

drivers/clocksource/timer-qcom.c
drivers/watchdog/qcom-wdt.c

That seems super odd to me.  Is that really right?  We have two
drivers probing against the same device tree nodes?  ...and that's OK?
 If so, why does only one of the bindings list the SoC-specific
bindings names?


2. The actual nodes look really wonky.  A few examples below:

2a) arch/arm/boot/dts/qcom-apq8064.dtsi:
compatible = "qcom,kpss-timer", "qcom,kpss-wdt-apq8064", "qcom,msm-timer";

...why is the SoC-specific compatible string in the middle?  The
SoC-specific one should be first.

2b) arch/arm/boot/dts/qcom-ipq4019.dtsi:
compatible = "qcom,kpss-wdt", "qcom,kpss-wdt-ipq4019";

...same question, but in this case there is no "msm-timer" at the end?

2c) arch/arm64/boot/dts/qcom/qcs404.dtsi
compatible = "qcom,kpss-wdt";

...no SoC-specific string at all?


Thanks!

-Doug
