Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6894B152193
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2020 21:49:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727446AbgBDUth (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Feb 2020 15:49:37 -0500
Received: from mail-vs1-f67.google.com ([209.85.217.67]:34095 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727387AbgBDUth (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Feb 2020 15:49:37 -0500
Received: by mail-vs1-f67.google.com with SMTP id g15so12420587vsf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Feb 2020 12:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JDMn7tspiLbabREBPncdwnRL1LH/yW4VpIem+eMXcdY=;
        b=Jvi8QbyK+alPjB3i+rU2Ydb52K2Cr2ER4rlq6Ohk4VOaRNp3T+BkEDdEzkvR4yW9F0
         +3q3G2bto22tSH/jvMKXTBNdgwvUKeL72DKrAg8Lrd7M0vBvUcj6nT1GAMCxqtVlvVMD
         J97ugqLNv8AVmQrF7E6TIbQNA8POEkoe1hiak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JDMn7tspiLbabREBPncdwnRL1LH/yW4VpIem+eMXcdY=;
        b=DlZAayOQx1ET4QO5MxplH5/hmf8yO5PQVNPGT4OQe5F4X3QEd/WGmoLtYEn47II16L
         ilzisFxcnrAa4iIZzEv/aUDR9J6mI5y1OyrS4tnZzYlshocfzbTSYIdwhPQ2QnJ1zxp2
         L8/dU54/4CBFmY5kf1EjJwQB4UBg2g3iuz7qFZQoyJuqHQjWEIAyYYPGfEtmIcVUCA1V
         DnvSDET6x4nLvdY8iXgriXD2Xtulj2tkpn87MbaIFgpbTfJroLU4VSdhVeuN8q4Y99Ya
         cIGhVIQFzha9Hjd2GkGS3Zk4Edh4mEDYvQHvmUouy/Xc3Sqx1mTZW3B56x6xizgpGap+
         LO3A==
X-Gm-Message-State: APjAAAWC3mcOoQPDf+tBKLmB8X5PBlQqC8neqC2NFWSxvxjJT1s37LDY
        0Rnm1qibtG/DWrx4VD03y1ThC8JlFk8=
X-Google-Smtp-Source: APXvYqw0Ey9E8ohqPmTMm5GyRl0tVCyNbefgXyCdoVs2HwbCXiNb+Mqa90P+GWu9di7o50CZBCzgSg==
X-Received: by 2002:a67:ec03:: with SMTP id d3mr19782901vso.152.1580849375806;
        Tue, 04 Feb 2020 12:49:35 -0800 (PST)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id 110sm7057456uav.18.2020.02.04.12.49.34
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2020 12:49:34 -0800 (PST)
Received: by mail-vk1-f181.google.com with SMTP id m195so5598017vkh.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Feb 2020 12:49:34 -0800 (PST)
X-Received: by 2002:ac5:c807:: with SMTP id y7mr18261663vkl.92.1580849373967;
 Tue, 04 Feb 2020 12:49:33 -0800 (PST)
MIME-Version: 1.0
References: <20200203183149.73842-1-dianders@chromium.org> <20200203103049.v4.11.I27bbd90045f38cd3218c259526409d52a48efb35@changeid>
 <20200204174900.45A5420674@mail.kernel.org>
In-Reply-To: <20200204174900.45A5420674@mail.kernel.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 4 Feb 2020 12:49:23 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VaK6faWiAC1CHd081UzWCLEE42dHBq22ZyaSaUu8CXhA@mail.gmail.com>
Message-ID: <CAD=FV=VaK6faWiAC1CHd081UzWCLEE42dHBq22ZyaSaUu8CXhA@mail.gmail.com>
Subject: Re: [PATCH v4 11/15] dt-bindings: clock: Cleanup qcom,videocc
 bindings for sdm845/sc7180
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Harigovindan P <harigovi@codeaurora.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Matthias Kaehlcke <mka@chromium.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Feb 4, 2020 at 9:49 AM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Douglas Anderson (2020-02-03 10:31:44)
> > This makes the qcom,videocc bindings match the recent changes to the
> > dispcc and gpucc.
> >
> > 1. Switched to using "bi_tcxo" instead of "xo".
> >
> > 2. Adds a description for the XO clock.  Not terribly important but
> >    nice if it cleanly matches its cousins.
> >
> > 3. Updates the example to use the symbolic name for the RPMH clock and
> >    also show that the real devices are currently using 2 address cells
> >    / size cells and fixes the spacing on the closing brace.
> >
> > 4. Split into 2 files.  In this case they could probably share one
> >    file, but let's be consistent.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> > Changes in v4:
> > - Added Rob's review tag.
>
> I don't see it. I guess I should add it?

Whoops.  I knew I'd mess something like this up.  Looks like it got
pushed without his tag but I don't think it's a big deal.  For
reference, he added his tag in:

https://lore.kernel.org/r/CAL_Jsq+_2E-bAbP9F6VYkWRp0crEyRGa5peuwP58-PZniVny7w@mail.gmail.com

I did manage to remove the "/bindings" from the ID as he requested, so
at least I didn't mess up the important part...

-Doug


-Doug
