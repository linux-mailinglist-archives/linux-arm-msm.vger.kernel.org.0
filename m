Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A3DB3D13F1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jul 2021 18:20:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235816AbhGUPkA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jul 2021 11:40:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233471AbhGUPkA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jul 2021 11:40:00 -0400
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com [IPv6:2607:f8b0:4864:20::a2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC651C061575
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jul 2021 09:20:36 -0700 (PDT)
Received: by mail-vk1-xa2a.google.com with SMTP id az15so641388vkb.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jul 2021 09:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=051mTyyqTLe5bNxs3xMEB9dCJVVcLYp1lomu2/ziKcg=;
        b=mBZuY8y7e8p9bUY1ojzWBevvvMvTeIrdLx4L5N2hrw76MKt+CQ8zR8aQd0r0l8+0Ri
         UCcpj15XA0v3mA5O0DkBjetFm+wvkqr4V/U1eKIkv6x4bTyJ9A2lF5WYQiOSi/1MmEkt
         ojmFv7HtVf14t2mJ8bjQNIEC+NcaNKyl8ybHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=051mTyyqTLe5bNxs3xMEB9dCJVVcLYp1lomu2/ziKcg=;
        b=r34zhCfYE8ZvTI4Zeud7FeP7OKkpOT0Ouxf6mlIcwUCW3F9C1JFjeViwejrqcEThH1
         lxnYfMWEC6+15sqOI8NzgCgWdtmiwQROeRpImXV0x/cPjoRJ4UhXKPi4gJyGicyIyv9P
         TvWgq9WMdgDeCVJtDIZngINE6py0W5+9uuWp9d31QcrMXLVWZnMOyI+nF/JPi08+aJN5
         r/hnUY9twjlEUzuDqUYYRnv6+VthSdTMHI3oQ5OoTm3jiN0efMXvb2+JchbgUF9+Buw1
         2zrgDBVoDRbz5hv4sJ6cRKVGF62Bot8jo9DA1K+AKrLmeWDkg96w2/IQuUMLyUX3Luv7
         i8kA==
X-Gm-Message-State: AOAM5322xQtkcQ08ns/PEmu6tE3vmOOPoBhA/Sp5zBIDEFZJ5Zj17ZBB
        IWSclRSCOc9fJJhdfKi99JFVmoVaaZxSSg==
X-Google-Smtp-Source: ABdhPJyhy3R/AiRfHAmjpDjr8pyqXamK0yLHVy/XCd1zhXWdHphquQG50iUbJ4mleFKkxv+WRcFoMA==
X-Received: by 2002:ac5:c7a6:: with SMTP id d6mr31964687vkn.15.1626884435600;
        Wed, 21 Jul 2021 09:20:35 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id n7sm3406977vso.4.2021.07.21.09.20.34
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jul 2021 09:20:35 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id a22so1741729vso.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jul 2021 09:20:34 -0700 (PDT)
X-Received: by 2002:a05:6102:144:: with SMTP id a4mr34855801vsr.29.1626884434569;
 Wed, 21 Jul 2021 09:20:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210721084126.14035-1-srivasam@codeaurora.org> <20210721084126.14035-3-srivasam@codeaurora.org>
In-Reply-To: <20210721084126.14035-3-srivasam@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 21 Jul 2021 09:20:23 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W3X8W90vPdrDAymzTKj-J7QPyn4ukaLSOhEkCme3+r_Q@mail.gmail.com>
Message-ID: <CAD=FV=W3X8W90vPdrDAymzTKj-J7QPyn4ukaLSOhEkCme3+r_Q@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] arm64: dts: qcom: sc7180-trogdor: Add lpass dai
 link for HDMI
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
        Judy Hsiao <judyhsiao@chromium.org>,
        V Sujith Kumar Reddy <vsujithk@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Jul 21, 2021 at 1:42 AM Srinivasa Rao Mandadapu
<srivasam@codeaurora.org> wrote:
>
> From: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
>
> Add dai link in sc7180-trogdor.dtsi for supporting audio over DP
>
> Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> index 31bf7c698b8f..a4cb9ee567ff 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> @@ -288,6 +288,7 @@ sound: sound {
>                         "Headphone Jack", "HPOL",
>                         "Headphone Jack", "HPOR";
>
> +               #sound-dai-cells = <0>;

The `#sound-dai-cells` is not in the bindings. The bindings also say
`additionalProperties: false`. So either your patch is wrong for
including this or the bindings are wrong for omitting it. Which is it?
I notice that downstream we don't have this.


> @@ -314,6 +315,18 @@ sound_multimedia1_codec: codec {
>                                 sound-dai = <&max98357a>;

Ideally you'll want to rebase to make context clean since the above
got changed from `max98357a` to `max98360a`.


>                         };
>                 };
> +
> +               dai-link@2 {
> +                       link-name = "MultiMedia2";
> +                       reg = <2>;

I am certainly not an expert, but I notice that downstream we have reg
as <LPASS_DP_RX>, which makes the node name dai-link@5 instead of @2.
Does that matter?


> @@ -768,6 +781,10 @@ secondary_mi2s: mi2s@1 {
>                 reg = <MI2S_SECONDARY>;
>                 qcom,playback-sd-lines = <0>;
>         };
> +
> +       hdmi-primary@0 {
> +               reg = <LPASS_DP_RX>;

Your node name and `reg` don't match. `LPASS_DP_RX` is 5 so the node
name should include @5, not @0. I also notice that downstream the node
name is called `hdmi`, not `hdmi-primary`. The downstream `hdmi` seems
more parallel to the sibling nodes, like `mi2s@0` and `mi2s@1`.
