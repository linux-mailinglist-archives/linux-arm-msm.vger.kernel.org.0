Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8CCC339914
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Mar 2021 22:29:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235201AbhCLV3I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Mar 2021 16:29:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235254AbhCLV2l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Mar 2021 16:28:41 -0500
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD057C061762
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Mar 2021 13:28:40 -0800 (PST)
Received: by mail-qk1-x72a.google.com with SMTP id s7so25868352qkg.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Mar 2021 13:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CyAYeE6GJ7AAB1io1oL7YIRE2Sz07Daf/UvMuTr7W2c=;
        b=fSNCBIrGNaHWgDtwGWVa9gDETYtkK8/mwAXpNCO3xCJETCm+LMd7acUp2GSmnj7QAe
         Ctul4F1l8NInT3OOnPOG6ljLmZF4QOQqWntpWbvwfClqBqoVNzWEclCiiS9i89pbOcpd
         vaVgXjvPUOpa3oeeFNk2TTQqu5lEJT0bNzomQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CyAYeE6GJ7AAB1io1oL7YIRE2Sz07Daf/UvMuTr7W2c=;
        b=f2gDyJlMcj9u0cRrqvm3HpbZQVfle8d6mbyoj0P0hvUrpGL70pNup2eYMCiaN/VAFB
         AIi7hBepbnmWdm8dJmfdFaH05O8BY2Hh0L5F1k2JSfzcKfrfQlmubxsalk6mNydJEFK0
         XBjJ1qAItYTnomcvVWbrMseiIZ3ioenAW2bFOF79LBExrVvvoClCROZuhlBXVbJr3H8G
         V5ZzUrUqa85dUQMVG03CLAkHXvxJ3FGvIpPpdikPeVLNfzLmVDgVXj2F507B7TO7iZu3
         9g6dvSzKHCwYFowUcdiEkL5d79toUWGAopYiXTxxBJx9HG5o8PWzzC7BMgMkpqfVJPhV
         1Hfw==
X-Gm-Message-State: AOAM5300QPdHflFvfDMR1uqx/UAIz0BsYNBho2mxaCb1Yt3ZchOcn+a5
        UoV/I8Z2ZZr5AsqaMQxq/eIhzvdShPJF1g==
X-Google-Smtp-Source: ABdhPJwMVaMJE0iKc41fLCERKJGARn4/rwqI0KLwjsTbtukb9BofHNVOfxFWvsO798mhMYlf12VGEQ==
X-Received: by 2002:a05:620a:16b9:: with SMTP id s25mr14251518qkj.500.1615584519765;
        Fri, 12 Mar 2021 13:28:39 -0800 (PST)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id t5sm1912801qkt.66.2021.03.12.13.28.38
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Mar 2021 13:28:38 -0800 (PST)
Received: by mail-yb1-f182.google.com with SMTP id h82so26768653ybc.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Mar 2021 13:28:38 -0800 (PST)
X-Received: by 2002:a25:d3c5:: with SMTP id e188mr21573271ybf.345.1615584518203;
 Fri, 12 Mar 2021 13:28:38 -0800 (PST)
MIME-Version: 1.0
References: <20210312160622.24165-1-srivasam@codeaurora.org> <20210312160622.24165-3-srivasam@codeaurora.org>
In-Reply-To: <20210312160622.24165-3-srivasam@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 12 Mar 2021 13:28:26 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WN9vdU-cWLr4-AODGQ7E5crJkAmv1=D23j21=KHxUCkg@mail.gmail.com>
Message-ID: <CAD=FV=WN9vdU-cWLr4-AODGQ7E5crJkAmv1=D23j21=KHxUCkg@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] arm64: dts: qcom: Add sound node for sc7180-trogdor-coachz
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Judy Hsiao <judyhsiao@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Mar 12, 2021 at 8:07 AM Srinivasa Rao Mandadapu
<srivasam@codeaurora.org> wrote:
>
> This is a trgodor variant, required to have sound node variable
> for coachz specific platform.
>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
> index 4ad520f00485..7eaad739b6f9 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
> @@ -89,6 +89,16 @@ &sn65dsi86_out {
>         data-lanes = <0 1 2 3>;
>  };
>
> +&sound {
> +       compatible = "google,sc7180-coachz";
> +       model = "sc7180-adau7002-max98357a";
> +       audio-routing = "PDM_DAT", "DMIC";
> +};
> +
> +&multimedia0_codec {
> +       sound-dai = <&adau7002>;
> +};
> +

Much nicer! The last nit is that "multimedia0_codec" is now sorted
incorrectly. It starts with "m" so it shouldn't come after "s". Yes, I
know that this rule means that these two things are no longer next to
each other, but that's the rule we have right now.

If it's important for you for them to sort together, I suppose you
could change the label to "sound_multimedia0_codec" though that's a
bit of a mouthful. I'll leave it up to you whether to rename (and keep
the current ordering) or keep the name (and move the node).



-Doug
