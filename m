Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BC9D2C2F1A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 18:46:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403978AbgKXRqO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Nov 2020 12:46:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403811AbgKXRqO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Nov 2020 12:46:14 -0500
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com [IPv6:2607:f8b0:4864:20::944])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48C80C0613D6
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 09:46:14 -0800 (PST)
Received: by mail-ua1-x944.google.com with SMTP id v9so7067117uar.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 09:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Mep5g3jd3Wcro6wz5b9PghU5nLpdZLWg1PGCxkgwp3w=;
        b=X2o/ZcxEs4KlhZZWqNX+HZCTnBf5x/L6fV9FDjTOY/GFMTeC+8Ky9wvb/Nf8OfWUWI
         hqlAD2iIwvxuYcsVOVzC23Hu6ysGeREOWXyQma6bRhUTAt9XN6W82Jrk4tDsydvNjL+p
         VHKttUI7lJMGgp4LeK0pDdNbUPOqLnMWglorA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Mep5g3jd3Wcro6wz5b9PghU5nLpdZLWg1PGCxkgwp3w=;
        b=Ns901K7is0fsP1ZzR6x/7uon4zTwfvjlMyzSiTeAOz3ceHrqehTKTiKGROl/RP42W3
         oMTQrCAt2xI3PM3FdHDujR/0DCdk8nDfKpYybU9zCH+TG+qq8+To6Y0pkUC9pc3HQkkR
         RyATZzVHQtU3x/6fAoC8JN8hVtVe1fbHGulhr/g3RgsT+jF8UqxA0OvCwaKzub6ZMRla
         7b8Ixx45A60VVT8MsAATQy2pSegJOmnsXMhq/BRq1j2yF6lehiKtSiyenJuZEfsi108t
         2SR43TTbrXIXJd2E+im6HXzbCbpmUhRZutXkJM1lH6bvjDtMgX6mQQyMalhuVkfge/m6
         iW5Q==
X-Gm-Message-State: AOAM531D7c3diEJN8mgQLEZ76B2/GU1g+xPbxmTwV49EmEpGuHxor492
        dPl02MMcPjhoS5s1vvHhlNaNlCwN3R+nOg==
X-Google-Smtp-Source: ABdhPJwLaFf1tWlir/cZEVGA4b8QKm/NQr8gDNHkDPipuZBQMFtmtQkUyexW4NrTZaYLghlxoFo2wg==
X-Received: by 2002:a9f:2d96:: with SMTP id v22mr1822220uaj.44.1606239973290;
        Tue, 24 Nov 2020 09:46:13 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id a1sm1734448vke.21.2020.11.24.09.46.12
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2020 09:46:12 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id u24so11513547vsl.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 09:46:12 -0800 (PST)
X-Received: by 2002:a05:6102:309a:: with SMTP id l26mr4989655vsb.4.1606239971784;
 Tue, 24 Nov 2020 09:46:11 -0800 (PST)
MIME-Version: 1.0
References: <20201123160139.1.I2702919afc253e2a451bebc3b701b462b2d22344@changeid>
 <CACRpkdamdXCqZa4=qb5MsJtQMw1v53z5HZVv5SHJv84dtVACqQ@mail.gmail.com>
 <CAD=FV=W9+Wa=0d-Y+kxhqsRVM4TOofTC-C519cLkYOsLSBRZ4A@mail.gmail.com> <603c691f-3614-d87b-075a-0889e9ffc453@codeaurora.org>
In-Reply-To: <603c691f-3614-d87b-075a-0889e9ffc453@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 24 Nov 2020 09:46:00 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UdExXYaf3K6jbyr8tR3_NEib+BaYtxk1xQzS7-DuLC-g@mail.gmail.com>
Message-ID: <CAD=FV=UdExXYaf3K6jbyr8tR3_NEib+BaYtxk1xQzS7-DuLC-g@mail.gmail.com>
Subject: Re: [PATCH 1/3] irqchip: qcom-pdc: Fix phantom irq when changing
 between rising/falling
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Srinivas Ramana <sramana@codeaurora.org>,
        Neeraj Upadhyay <neeraju@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Nov 24, 2020 at 9:42 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> Hi Linus,
>
> +        * When we change types the PDC can give a phantom interrupt.
> +        * Clear it.  Specifically the phantom shows up if a line is already
> +        * high and we change to rising or if a line is already low and we
> +        * change to falling but let's be consistent and clear it always.
> +        *
>
> Can you please hold this change. I am checking with HW folks if above
> commented behaviour is expected/is valid case to set the irq type rising
> edge when the line is already high.
>
> Will keep posting update here.
>
> Thanks,
> Maulik

Thanks for the update.  I'm still going to post a v2 because I think
patch #1 in the series should land and it seems nice to keep them
together.  I'll add a note to the patch indicating your request to
wait for an ack before landing.

-Doug
