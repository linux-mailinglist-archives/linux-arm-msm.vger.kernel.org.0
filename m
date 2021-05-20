Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A0F038B90E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 May 2021 23:40:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230280AbhETVlu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 May 2021 17:41:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230257AbhETVlt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 May 2021 17:41:49 -0400
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EDDDC061761
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 May 2021 14:40:27 -0700 (PDT)
Received: by mail-qt1-x82a.google.com with SMTP id f8so13945454qth.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 May 2021 14:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZIgxNeJtIZOCUu26nn+aGqgcAu9hM+yO4Nw/eB0jBeE=;
        b=OQqXZJQ0WQrHpmGQhIiwMtNefwOL7yYcMbOia1kGiGWxNB3k8j/ikmE+Pgtt0Cqjuu
         tmIdpKxL+hf08loIQOk+J8Fh/l4KYpp/jV7K+vvTqq+etwPRC5CLRJyHvtMQIRVdxm29
         pSHqTAtKSinj4v9l/XhymSogCplDJ2+uHGogE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZIgxNeJtIZOCUu26nn+aGqgcAu9hM+yO4Nw/eB0jBeE=;
        b=UiL0iCpkUkovrdgMbZDPgJqOAcmA2mgMqmi5oM+/1qCiYXMPlB02QiAdyPM9VIkZfR
         cI4Ho3imop5V8iPQ8LelyEfY1OTiAayAuEGrnQh+RooYwn035/O+uyv/HTBc0FJLplnY
         Ml8or6KhUXBVSZqIQJ7b/ayxCydh4Fu4GsQolDUN/tG622TGPHlIy0fWYqeyDVE3TjO9
         PsQ6NIEkf4MUZvsduw3RzX4uys6pcAfOY0BhOYezGyPF/itWuhPeYStCSggQ7+dRwUpb
         f38mX1WYlaxhVyfJyW82YsMZt8HplqCiftoDz/JyARPXooZLlyuHn8+uFiD8jXKHOzmf
         9low==
X-Gm-Message-State: AOAM530IChU2nGYFTJdT9smeGov/X7TzXCq7Prucp81LVUSNQTslBysP
        tFJ7TjZLMRQW0H7H3GysinJ/F4WoiGDJNg==
X-Google-Smtp-Source: ABdhPJzuhVQ7SOmj+2db2n6KRDRVcNUmVtEqu2HjYitfVSPoD+tS60QbaJzp5hjIKyRdPZu3lqN9Mw==
X-Received: by 2002:ac8:4e21:: with SMTP id d1mr7411070qtw.290.1621546826308;
        Thu, 20 May 2021 14:40:26 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id n13sm2847968qtl.48.2021.05.20.14.40.25
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 May 2021 14:40:25 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id i4so24822348ybe.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 May 2021 14:40:25 -0700 (PDT)
X-Received: by 2002:a25:80d4:: with SMTP id c20mr10916531ybm.345.1621546824581;
 Thu, 20 May 2021 14:40:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210513122429.25295-1-srivasam@codeaurora.org> <CAE-0n51jjHWSFiip-utVKjAQbaJuj+oKq0GPLgw2q2mG_9B=eg@mail.gmail.com>
In-Reply-To: <CAE-0n51jjHWSFiip-utVKjAQbaJuj+oKq0GPLgw2q2mG_9B=eg@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 20 May 2021 14:40:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Uzg+a6ZrinAnq_=29103JPs0=oWTa3VkfTUbPRkvGyjw@mail.gmail.com>
Message-ID: <CAD=FV=Uzg+a6ZrinAnq_=29103JPs0=oWTa3VkfTUbPRkvGyjw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: Add wakeup delay for adau codec
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Judy Hsiao <judyhsiao@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,


On Mon, May 17, 2021 at 3:44 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Srinivasa Rao Mandadapu (2021-05-13 05:24:29)
> > Add wakeup delay for fixing PoP noise during capture begin.
> >
> > Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
> > Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
> > index 4c6e433c8226..3eb8550da1fc 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
> > @@ -23,6 +23,7 @@ / {
> >         adau7002: audio-codec-1 {
> >                 compatible = "adi,adau7002";
> >                 IOVDD-supply = <&pp1800_l15a>;
> > +               wakeup-delay-ms = <15>;
>
> Is this part of the binding?

It doesn't seem to be, but it's supported by the code. It's also in
the generic "dmic" bindings. The bindings are pre-yaml. Seems like
someone needs to take charge and clean those up, but I'm not sure we
need to block this patch on it?

Though I'm not an expert on audio stuff, assuming that this works OK
I'm fine with:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

-Doug
