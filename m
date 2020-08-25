Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 786E6252386
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Aug 2020 00:22:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726542AbgHYWWE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Aug 2020 18:22:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726303AbgHYWWD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Aug 2020 18:22:03 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54E4BC061574;
        Tue, 25 Aug 2020 15:22:02 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id y3so368808wrl.4;
        Tue, 25 Aug 2020 15:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MjB8SE3dapmOewYm9leYc+Bg7VM5DP81gEa/d9Q95BQ=;
        b=EeLbwrDxVvap7CAAaQtDZIzUiPc92K6b/P54Fl4vvL74IbS7hOKS427Ckg38QqqCKn
         7/C8ZhL6sTBrbkthlLsRt5n25tm5KXlj6uDAAKnH/rm+nD0wmLKvPXLFDkAIZdC8lxCk
         8sBfeUu3mcCWbzB0U7KI6qeS6T3zTZsgmAR4mSJltdEseWuKxr4UdlmrXFaki4DX7EuK
         ORvNmjzu5bDtpo3dUmfWpEQQ6e+Xg5Hf8mjoCUZGSucMo/rECo4s+/bTU8JmjEqStKf/
         qe6SbSp0MnQzjKjTEQ+oeXOSUIiChnDVq32DBbLFYgEqL/fVOD+Ay6fhEcw8OfzoH9i+
         LSCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MjB8SE3dapmOewYm9leYc+Bg7VM5DP81gEa/d9Q95BQ=;
        b=t1Xwv4H7i+Wumdt893sU4CI/+Ik4enUgbYW+fD/3bLoO7ctkdkvca0QByg+ct7DcPV
         AHMsoyqXHVmw0LNytjZUCaZsxC8ZvLJw0ShkP0VATD4tVJdoyllNxRYkN5C+3HIIYswu
         nAeY6UF0hTPxUWySLHgdECXFd2spClldZZdIkBHD8EEcFXUaRYE2Nbdb9pU/7/DxbPpX
         P7Mb4sdREF3QBk6xomRVOh55+Cq5MwBj2YtU68M3Sm/QE2od5B3miVx5S2dnoRHCpBb/
         /NymkT7aBZXS7zxwVjjnnMKdjVQSjsC3R6dhmWD2x9a0gDoon9sFvBj+jgiqxvsZ5eZh
         dUdg==
X-Gm-Message-State: AOAM532GvNPMnxrQHF5fuzNrF8nm5HW/eePWIng4py8PmwDUbYQIdAX+
        PuL76KEWinUa9hjTOzOVPRtVe6v1yNFifeyBXCs=
X-Google-Smtp-Source: ABdhPJy77vbwGSBhIlrLbvHPIFwefR/X6zsRY84grxWrjRfrTFT2zNNGbF5VeAv/7CTZMUaBZRCez2dNrjf4vMNw2nw=
X-Received: by 2002:a5d:574a:: with SMTP id q10mr11680563wrw.147.1598394120864;
 Tue, 25 Aug 2020 15:22:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200825003341.1797322-1-robdclark@gmail.com> <159834727050.334488.84544239322533805@swboyd.mtv.corp.google.com>
In-Reply-To: <159834727050.334488.84544239322533805@swboyd.mtv.corp.google.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 25 Aug 2020 15:22:47 -0700
Message-ID: <CAF6AEGvNKhFMtMkqS8STaUTcw7z6-NsHROeydWnx-=2=UG357A@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180-trogdor: add initial trogdor and
 lazor dt
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Atul Dhudase <adhudase@codeaurora.org>,
        Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>,
        Evan Green <evgreen@chromium.org>,
        Cheng-Yi Chiang <cychiang@chromium.org>,
        Ajit Pandey <ajitp@codeaurora.org>,
        Alexandru Stan <amstan@chromium.org>,
        Sujit Kautkar <sujitka@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Aug 25, 2020 at 2:21 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Rob Clark (2020-08-24 17:33:39)
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> > new file mode 100644
> > index 000000000000..b04987ab6c22
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> > @@ -0,0 +1,1364 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> [...]
> > +
> > +       gpio_keys: gpio-keys {
> > +               compatible = "gpio-keys";
> > +               status = "disabled";
> > +               pinctrl-names = "default";
> > +               pinctrl-0 = <&pen_pdct_l>;
> > +
> > +               pen-insert {
> > +                       label = "Pen Insert";
> > +
> > +                       /* Insert = low, eject = high */
> > +                       gpios = <&tlmm 52 GPIO_ACTIVE_LOW>;
> > +                       linux,code = <SW_PEN_INSERTED>;
> > +                       linux,input-type = <EV_SW>;
> > +                       wakeup-source;
> > +               };
> > +       };
> > +
> > +       max98357a: max98357a {
>
> Maybe node name should be 'audio-codec' or 'dac' or 'amp' or 'speaker'
> or 'codec'?

looking at other boards, it looks like 2 votes for "audio-codec-0",
one vote for "codec0", and 2 votes for "max98357a"..  so seems to be a
codec rather than amp/speaker.. and "audio-codec" seems to be the
popular choice..

BR,
-R
