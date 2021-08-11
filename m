Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D36E13E9AC1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Aug 2021 00:10:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232438AbhHKWKu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Aug 2021 18:10:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232454AbhHKWKu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Aug 2021 18:10:50 -0400
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FF51C0613D3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Aug 2021 15:10:24 -0700 (PDT)
Received: by mail-io1-xd2c.google.com with SMTP id 188so5636192ioa.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Aug 2021 15:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UEIdKaECjUbY7rgf9DAfCgQCtR0RYp4t4j+s1C5ELwA=;
        b=IszbToVnMZEHbB/WVlNuFncfCT1WJ60B8/DlD3ZJassXJujnum4s3Rlvuitw11QfE3
         szdoJL9EEg0MO2AZjJ9u7zCog2/x5O+fe+42ZSWJYN93kEm+NVHju/cdWSzArrvS2Kfg
         hKyna67wmm6B89+hQiIK98DYu0eGOtSRVn73w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UEIdKaECjUbY7rgf9DAfCgQCtR0RYp4t4j+s1C5ELwA=;
        b=ZULlI4N7EaM5U+YVxtuuCZm88TEFXFnh/B+2JtEAAKuifBaDeBCxZ46BE2Wx7DuyVO
         j879TufCwJBJMsEt6nI7Wgv+H3wrq7UuRdUowKE/aYvTS26gIEAzq/9U64EGwCqVRAAN
         yQ2+HN1ePl0PrJKPuZ7+AsW7BFJmqFOTLjikb8SWXtBtlFKOvlLbqio3TXGPFfGcVYnK
         +xKbyU7JODLnjByvdJBFmbe7QmSeoTAC04vOetsyP2QOFsx4t2G5kOL7RHdqKGFI5aH0
         60ajPqecMCrjm+YSsAhlxDciISYZG4i0IhFa8kSUPJYG99JeaO5gWeTcDFsnMHTQBpIh
         8Y1Q==
X-Gm-Message-State: AOAM533IPEtvK6i31+z0eQggoVBLhfa8/vm4dS/5tJweYBd9dGDvosdY
        5g2y6g+BwdRP5vGYV4VaM56PKHTfFpvtzq2f
X-Google-Smtp-Source: ABdhPJynx/OhlnVpBi2oJZ6KbjtCfVS9g3OggQODBAGclZ8Y0JRGAXvZk/oHa+N9dM5uHTKssIzRAw==
X-Received: by 2002:a05:6638:1918:: with SMTP id p24mr891410jal.90.1628719823084;
        Wed, 11 Aug 2021 15:10:23 -0700 (PDT)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com. [209.85.166.49])
        by smtp.gmail.com with ESMTPSA id a11sm310476ilf.79.2021.08.11.15.10.22
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Aug 2021 15:10:22 -0700 (PDT)
Received: by mail-io1-f49.google.com with SMTP id r72so5652134iod.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Aug 2021 15:10:22 -0700 (PDT)
X-Received: by 2002:a02:a581:: with SMTP id b1mr898507jam.84.1628719821924;
 Wed, 11 Aug 2021 15:10:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210721080549.28822-1-srivasam@qti.qualcomm.com>
 <20210721080549.28822-3-srivasam@qti.qualcomm.com> <CAE-0n52hdv0ehzQi2si3rPumBiO+=stoU3kkK=0e7fU_5+xUZw@mail.gmail.com>
In-Reply-To: <CAE-0n52hdv0ehzQi2si3rPumBiO+=stoU3kkK=0e7fU_5+xUZw@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 11 Aug 2021 15:10:09 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VgwLNiAZKur7PPpB=_mOnZrkBa2cG1DZYsCxQRAd42NA@mail.gmail.com>
Message-ID: <CAD=FV=VgwLNiAZKur7PPpB=_mOnZrkBa2cG1DZYsCxQRAd42NA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: sc7180-trogdor: Add lpass dai
 link for HDMI
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Srinivasa Rao Mandadapu <srivasam@qti.qualcomm.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Judy Hsiao <judyhsiao@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        V Sujith Kumar Reddy <vsujithk@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Aug 10, 2021 at 11:06 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Srinivasa Rao Mandadapu (2021-07-21 01:05:49)
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> > index 31bf7c698b8f..a4cb9ee567ff 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> > @@ -288,6 +288,7 @@ sound: sound {
> >                         "Headphone Jack", "HPOL",
> >                         "Headphone Jack", "HPOR";
> >
> > +               #sound-dai-cells = <0>;
> >                 #address-cells = <1>;
> >                 #size-cells = <0>;
> >
> > @@ -314,6 +315,18 @@ sound_multimedia1_codec: codec {
> >                                 sound-dai = <&max98357a>;
> >                         };
> >                 };
> > +
> > +               dai-link@2 {
> > +                       link-name = "MultiMedia2";
> > +                       reg = <2>;
>
> Should this be
>
>                         reg = <LPASS_DP_RX>;
>
> ? And then the dai-link@2 should change to dai-link@5? It doesn't seem
> to really matter though, so maybe not.
>
> > +                       cpu {
> > +                               sound-dai = <&lpass_cpu 2>;
>
> This should be
>
>                                 sound-dai = <&lpass_cpu LPASS_DP_RX>;
>
> ? At least from what I can tell without having it be 5 it doesn't work
> properly and external audio over DP doesn't enumerate.

I swear I provided feedback just like that. Yeah, here:

https://lore.kernel.org/r/CAD=FV=W3X8W90vPdrDAymzTKj-J7QPyn4ukaLSOhEkCme3+r_Q@mail.gmail.com

I think the problem is that the wrong patch landed. The one I see that
landed last week was v4 but I also see v7 of the same patch:

https://lore.kernel.org/r/20210726120910.20335-3-srivasam@codeaurora.org/
