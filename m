Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80FEF337E91
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Mar 2021 20:57:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229938AbhCKT5O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Mar 2021 14:57:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229796AbhCKT5G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Mar 2021 14:57:06 -0500
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DCEBC061760
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Mar 2021 11:57:06 -0800 (PST)
Received: by mail-qv1-xf2e.google.com with SMTP id t5so3146424qvs.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Mar 2021 11:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i0RGEdH4qXmWUyxNfL/0Qo4+5Mh265qbBkTRMR+tqRI=;
        b=OAERhww90Ydo9cxJC3XtIm6VlKfEfVD/B1Wrc3Lo7PDMjqvJ0MDVxP7v5PlekaTETo
         /0cCyd9BnnjRsw1GVjAR3R4ocwjMs95l6AaJOmhskigSHLLgyX4XAHjopgVsX3K9Vsyu
         ewDcNw0kzpX6SuEtmoml2wkkWBwDFevbJKolE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i0RGEdH4qXmWUyxNfL/0Qo4+5Mh265qbBkTRMR+tqRI=;
        b=W8Bhmpy+ntBbp5ca4osUCJsw/wr1JAa3UgH9xDigpXKRjV2XEFzgmmvYG1ZQwZ8l7L
         lI4q9CDzmkhlrC4xoysWNlS6wI9T2UT8yH9q7GZDbKzk4t9/BigKv0F/aEJ8fSoh6gxm
         BHfmYfv/lGuc3h9HM3EQBSPC5WsXPYfb0xqlGLMWpJoym9+M+Idbwlc+oTvzISzog1cX
         tFQ2JI+jDR88r7Dyl/7VNKJDges4QhGune3bK4P8+GPbnd+BeOpUwXuzvF6D6WCL6G/9
         dFl46U+hXsow7R8Aw6ZGV9kfk4WlBtybn9+Vz8uskoSIzs+0V6sCiCIHaEYdit1rw1OG
         hyvA==
X-Gm-Message-State: AOAM530Wk2a9UjlVS7ItYI69atBVDcXiRtOuVTwgVHkVvFWSFwanphU7
        xL/9kZtD7Gqkbpw693U1R+HhrfqX7PKuyA==
X-Google-Smtp-Source: ABdhPJx6eAjV8VBhop9I7DtazrrJAfNjq70wai9NDbfNEVkg79RxNNrcCV2ouP0VhwP4IbRw9QMahA==
X-Received: by 2002:a0c:ff06:: with SMTP id w6mr3226247qvt.51.1615492625126;
        Thu, 11 Mar 2021 11:57:05 -0800 (PST)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id o7sm2732627qkb.104.2021.03.11.11.57.04
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Mar 2021 11:57:04 -0800 (PST)
Received: by mail-yb1-f174.google.com with SMTP id p186so22983253ybg.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Mar 2021 11:57:04 -0800 (PST)
X-Received: by 2002:a25:aa43:: with SMTP id s61mr14771793ybi.32.1615492624004;
 Thu, 11 Mar 2021 11:57:04 -0800 (PST)
MIME-Version: 1.0
References: <20210311164815.14113-1-srivasam@codeaurora.org> <20210311164815.14113-2-srivasam@codeaurora.org>
In-Reply-To: <20210311164815.14113-2-srivasam@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 11 Mar 2021 11:56:52 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VSnhOSFtLX==DYF1WFszaJwgnbZY-EycP4=SNs6rqajw@mail.gmail.com>
Message-ID: <CAD=FV=VSnhOSFtLX==DYF1WFszaJwgnbZY-EycP4=SNs6rqajw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] arm64: dts: qcom: sc7180-trogdor: Add lpass dai
 link for I2S driver
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc:     gross@kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Judy Hsiao <judyhsiao@chromium.org>,
        Ajit Pandey <ajitp@codeaurora.org>,
        V Sujith Kumar Reddy <vsujithk@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Mar 11, 2021 at 8:49 AM Srinivasa Rao Mandadapu
<srivasam@codeaurora.org> wrote:
>
> From: Ajit Pandey <ajitp@codeaurora.org>
>
> Add dai link for supporting lpass I2S driver, which is used
> for audio capture and playback.
> Add lpass-cpu node with  pin controls and i2s primary
> and secondary dai-links
>
> Signed-off-by: Ajit Pandey <ajitp@codeaurora.org>
> Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 58 ++++++++++++++++++++
>  1 file changed, 58 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> index 436582279dad..501e3d4c9097 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> @@ -9,6 +9,7 @@
>  #include <dt-bindings/input/gpio-keys.h>
>  #include <dt-bindings/input/input.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include <dt-bindings/sound/qcom,lpass.h>

It seems marginally better to include "sc7180-lpass.h" to get this? I
don't really know the difference between the two but since unless
we're planning to delete the sc7180 version it seems like you might as
well include that one?


>  /* PMICs depend on spmi_bus label and so must come after SoC */
>  #include "pm6150.dtsi"
> @@ -283,6 +284,42 @@ keyboard_backlight: keyboard-backlight {
>                         max-brightness = <1023>;
>                 };
>         };
> +
> +       sound: sound {
> +               compatible = "google,sc7180-trogdor";
> +               model = "sc7180-rt5682-max98357a-1mic";
> +
> +               audio-routing =
> +                       "Headphone Jack", "HPOL",
> +                       "Headphone Jack", "HPOR";
> +
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               dai-link@0 {
> +                       link-name = "MultiMedia0";
> +                       reg = <MI2S_PRIMARY>;
> +                       cpu {
> +                               sound-dai = <&lpass_cpu MI2S_PRIMARY>;
> +                       };
> +
> +                       codec {
> +                               sound-dai = <&alc5682 MI2S_PRIMARY>;

I'm an audio noob but isn't "MI2S_PRIMARY" something to be used with
"lpass_cpu", not with "alc5682" ?

I have no idea what the IDs correspond to on "alc5682". Are you sure
we even need an extra ID there? The "alc5682" bindings upstream don't
talk anything about dai-cells, but maybe they're just wrong...

-Doug
