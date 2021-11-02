Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8966F442ECE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Nov 2021 14:07:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231157AbhKBNJ7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Nov 2021 09:09:59 -0400
Received: from mail-ua1-f53.google.com ([209.85.222.53]:34383 "EHLO
        mail-ua1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230170AbhKBNJ7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Nov 2021 09:09:59 -0400
Received: by mail-ua1-f53.google.com with SMTP id b3so14116097uam.1;
        Tue, 02 Nov 2021 06:07:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tkTP1A6qXwuEKMshM23kAiOxOnfyNG09RSd2SDdbGyo=;
        b=z8e0J1nieleGMnzCPbDHie1tyoi3tjWXmJ140MP56l8rSjtLQFNYYK640Qv5ddEYW8
         FCX1h52nSyUeThkjQvUq44gvTJnasMGnUdPYPi7G6PtcG/H7yOxIjgrL1XKwinExP8z7
         Qmm2f7tNIe2d1lN+vPedadncpBI9UhM8xudRY89s3BRp2l8/ntkLnWiV0gTO+5YmEZx5
         65X5U4AwvmBNH6o66tR9Gsx8Bt4HtwC5b56nMjlHII+QFJTkL4aFy3xSp1qctWkOXRMq
         raMI45jYX0s/ourGcBFhYrZXhCQnVfXZrN6jmcmZtDmini5RugaO9uG/XF3YIm3GFp3w
         QSIg==
X-Gm-Message-State: AOAM532k36tVDMO/YgdJDxNrc4rDZykVG3hh5FkbKA2FvYywton0j6Tp
        iQJiVO6bVcg0F1Z9bdQRZ2uotM6vDRq0lQ==
X-Google-Smtp-Source: ABdhPJwRNAFNZ8yhbfEJs5QBG37QCf6jkQvcThO2yFgrzkdIImvau0dFmwIDrZuJDIcBl9WNaQEi6A==
X-Received: by 2002:a05:6102:374e:: with SMTP id u14mr20640127vst.28.1635858442866;
        Tue, 02 Nov 2021 06:07:22 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id u17sm877290vsk.25.2021.11.02.06.07.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Nov 2021 06:07:22 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id bc10so9541646vkb.1;
        Tue, 02 Nov 2021 06:07:21 -0700 (PDT)
X-Received: by 2002:a1f:2906:: with SMTP id p6mr15272478vkp.19.1635858441673;
 Tue, 02 Nov 2021 06:07:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210928203815.77175-1-luca@z3ntu.xyz> <20210928203815.77175-2-luca@z3ntu.xyz>
In-Reply-To: <20210928203815.77175-2-luca@z3ntu.xyz>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 2 Nov 2021 14:07:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWfMeLOvWYWQPEYokddz=vPQ=pbicrmmb79oC211Nw=WQ@mail.gmail.com>
Message-ID: <CAMuHMdWfMeLOvWYWQPEYokddz=vPQ=pbicrmmb79oC211Nw=WQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: qcom: apq8026-lg-lenok: rename board vendor
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        arm-soc <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Luca,

On Tue, Sep 28, 2021 at 10:39 PM Luca Weiss <luca@z3ntu.xyz> wrote:
> In order to avoid having prefixes for multiple internal divisions of LG
> use the "lg" prefix instead of "lge".
>
> Fixes: ad3f04b7bef6 ("ARM: dts: qcom: Add support for LG G Watch R")
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  arch/arm/boot/dts/Makefile                                      | 2 +-
>  .../{qcom-apq8026-lge-lenok.dts => qcom-apq8026-lg-lenok.dts}   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename arch/arm/boot/dts/{qcom-apq8026-lge-lenok.dts => qcom-apq8026-lg-lenok.dts} (99%)

What about the second board DTS using "lge"?
arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
