Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39FAF31151D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Feb 2021 23:24:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232813AbhBEWX4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Feb 2021 17:23:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232566AbhBEOWu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Feb 2021 09:22:50 -0500
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04711C061221
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Feb 2021 08:00:21 -0800 (PST)
Received: by mail-qk1-x733.google.com with SMTP id s77so7341193qke.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Feb 2021 08:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sAvvsG7ZMJNw7+6KFQIfyBqKkWHfCTkfol06frBNA7w=;
        b=C1ABRhtKU5w2mVAd/8x8Tcfi1Corxk/A2RkmAtV+vQXzu3inH0yaYL+c9aVKxHy2bI
         MI1ttHrEebtP4dOWn/Qv8BArjcXx6yEx7pnGtw7fL2N3j8sJ4Yy1cTvJ8V7uxUbvMbxk
         bEpJK1VcPW2SBJ1WPjf7AdUUy6FCSjnK0rzLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sAvvsG7ZMJNw7+6KFQIfyBqKkWHfCTkfol06frBNA7w=;
        b=L3Vp9ujd4n7ZqZHVK5cvZBSAjwe09y1QmgB4cXJh3MiE28ds9HPcZcaW0ag3E1yebv
         Ylb9dWKnHa5YVmq63F3or2imieOi/0sJ0w8+IbrvmBL6tyziJ9mviLnU18HCp4RBFUr2
         NSlCtMhP6xeR8ImgJ5UroTOCgkPQDs79ZgJN5UKdjTaDoAx9ir6xucjJ4Yvin0B4ZVB3
         63EmqPfMU/DO1LgsUehapS0ykUFn2yt25IEGrrNqbbgDVffxKD23IZBjHRTSnkq9XNhF
         flQ4br2zPbfC09LxCF6TLReIiH0P8JTAd7BON++lFK428bSsohrB4LgWQSYw6+dEFOCa
         feog==
X-Gm-Message-State: AOAM533PAsDsGTVHPbSDrlKkDx22ek9puHNLV5Kjj/bI68Bu0+3ulYLb
        e2fcge+pYxqo/lX1k6pody7GZksE42JVSA==
X-Google-Smtp-Source: ABdhPJzVsWudb4NOfhDEMQWNYiKZyWZ7izL6TPbzbfvQnwvgaS+7/TcghY21AsPuyVTrkd/XZqieFA==
X-Received: by 2002:ac8:1385:: with SMTP id h5mr4608106qtj.95.1612537220060;
        Fri, 05 Feb 2021 07:00:20 -0800 (PST)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id z11sm8093079qto.71.2021.02.05.07.00.18
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Feb 2021 07:00:18 -0800 (PST)
Received: by mail-yb1-f169.google.com with SMTP id y128so6962069ybf.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Feb 2021 07:00:18 -0800 (PST)
X-Received: by 2002:a25:60d6:: with SMTP id u205mr7018983ybb.276.1612537218432;
 Fri, 05 Feb 2021 07:00:18 -0800 (PST)
MIME-Version: 1.0
References: <20210204204904.294555-1-dmitry.baryshkov@linaro.org>
 <YBx+LcgrbyUKpYig@builder.lan> <CAD=FV=XOk14DfAJT9j86WbiRifxUQZFPy1grJWoz0A7Fon1edg@mail.gmail.com>
 <YByQizVTnj2uTNt2@builder.lan>
In-Reply-To: <YByQizVTnj2uTNt2@builder.lan>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 5 Feb 2021 07:00:06 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UYmv-PH-m4T6RcuW1JuQ-fCZ2Lg6gCCUJ5xquT1NP1jA@mail.gmail.com>
Message-ID: <CAD=FV=UYmv-PH-m4T6RcuW1JuQ-fCZ2Lg6gCCUJ5xquT1NP1jA@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm8250: add pinctrl for SPI using
 GPIO as a CS
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Feb 4, 2021 at 4:25 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> > > > +                             mux {
> > >
> > > Rather than splitting the properties in {mux, cs, config} I think it
> > > makes more sense to split them in {spi, cs} or something like that.
> >
> > In general pinconf doesn't belong in the SoC dts file.  If there's no
> > reason to change it seems like this should match what sc7180 did.
> >
>
> Right, but I still would prefer the pinctrl state to be split by
> function/pins, rather than pinmux vs pinconf. That way it's natural to
> add pinconf properties to the various functional parts (i.e. bias or
> drive-strength for the spi pins vs cs).
>
> Do you have any concerns with this?

I read this a few times and I'm not exactly sure what you're
proposing.  Can you provide an example of what you want it to look
like in this case?

-Doug
