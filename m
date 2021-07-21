Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86EBC3D125B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jul 2021 17:27:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239845AbhGUOqk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jul 2021 10:46:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237983AbhGUOqj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jul 2021 10:46:39 -0400
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87634C061757
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jul 2021 08:27:15 -0700 (PDT)
Received: by mail-vs1-xe29.google.com with SMTP id r18so1633387vsa.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jul 2021 08:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z+G3Vv4B1XazSc4gX4wiFgRgrHQ34F/awuea1pT1nKk=;
        b=FTb1NMduBfSAFMwVExJiFCVoQxRqCQcCQW6kpI0C7rpfB/MokLphIaTraL/H+IG1Pu
         0983bvNl5MZU6WHpzdrOGHl2rGyZf7kerto33svOS8jHphkEFisuAiUNgFyp4DwF7wCh
         r5d4XsJPVY8bkYvgYUxbmfLrVIMQNQwDYCc1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z+G3Vv4B1XazSc4gX4wiFgRgrHQ34F/awuea1pT1nKk=;
        b=XE9CctO35XFmiBzme9vttCHpm9XKpZyVRZdzC2LKWlUP3c+IJGXvQE5evE+QKzuYD7
         oryOg3tWGkHLwdsf31eBQRRqu/q8ACqSogwbCexeri8/UwAtz6fvuK4qI86faXZwzuKH
         zUSPveg4xUHmGvMSLd++2Jrf/EhDVfbC0EBAQtt2JD3VrYvJn+qCWp8cZa/kbk5Tf8an
         yI0A1iRfP+2l5qDlppokAvZAgaaterfty1Ki5MCKVpOU7PzG8nX721vnI94o0D4aPeUB
         SXn594jnQ5ZcibR1nG7gXdoCluRSPn72OWY8U8JScAAYsXE7e2t1HBwB2IEQnLtsjQvp
         mXUQ==
X-Gm-Message-State: AOAM533fSNPh2At9PvEwn9hZNQZ/K/BTdHIUxJo74v5UCIAw5nTuX2/A
        Fs2nOyEtj5L4MpVTjOwgh+OGH7NGvZTFDQ==
X-Google-Smtp-Source: ABdhPJygsGQGLQCbxHwB0V8lZ/IMwafJXxbk9qNxi2qjSC92yEU11WGxkDPxUwapOMEwjEDAQToJbg==
X-Received: by 2002:a67:ed4a:: with SMTP id m10mr35655312vsp.56.1626881234631;
        Wed, 21 Jul 2021 08:27:14 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id f70sm2543636vka.51.2021.07.21.08.27.12
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jul 2021 08:27:13 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id o4so956083uae.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jul 2021 08:27:12 -0700 (PDT)
X-Received: by 2002:ab0:c07:: with SMTP id a7mr37239648uak.120.1626881232268;
 Wed, 21 Jul 2021 08:27:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210625045010.2914289-1-judyhsiao@chromium.org>
In-Reply-To: <20210625045010.2914289-1-judyhsiao@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 21 Jul 2021 08:27:00 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VXULSZXqt-wjMWC4YqehGJsoeC0G=Kuut0xPPKo9AEWQ@mail.gmail.com>
Message-ID: <CAD=FV=VXULSZXqt-wjMWC4YqehGJsoeC0G=Kuut0xPPKo9AEWQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: trogdor: Update audio codec to Max98360A
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Dylan Reid <dgreid@chromium.org>,
        Jimmy Cheng-Yi Chiang <cychiang@google.com>,
        Judy Hsiao <judyhsiao@google.com>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Judy Hsiao <judyhsiao@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On Thu, Jun 24, 2021 at 9:50 PM Judy Hsiao <judyhsiao@chromium.org> wrote:
>
> Use max98360a dts node to correctly describe the hardware.
>
> Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

I noticed that you landed several dts changes recently (thanks!) but I
didn't see this one. Was there a problem with it, or did it just slip
through the cracks?

Thanks!

-Doug
