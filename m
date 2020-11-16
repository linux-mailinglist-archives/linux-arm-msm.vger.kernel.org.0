Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9AA02B467C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Nov 2020 15:58:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730292AbgKPO54 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Nov 2020 09:57:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730612AbgKPO5z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Nov 2020 09:57:55 -0500
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 520DFC0613D1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2020 06:57:55 -0800 (PST)
Received: by mail-vs1-xe43.google.com with SMTP id m16so9277651vsl.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2020 06:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sg3eMzSsvsFQKF9WYrus0kI2hc/riBKKXYCgRDx0GaI=;
        b=cDYymRXmY7cN1YqBVrDKxLtgp3HsW+XjlleSpOJL3ZvY+i5aDFQlDVe1bvmxNoormg
         F+/Yv/XabrzCe9u7fiBvT6VQg3Ose4LHuY8wcFNuSr/SS0roJaLvBKDbwBnVfeMDVVym
         srYMs68PWUkfmH5asG++lDq8nFRWyh5eNMQ/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sg3eMzSsvsFQKF9WYrus0kI2hc/riBKKXYCgRDx0GaI=;
        b=D/MEeNzizZl2BVhFI3YbjvWSf83kaGgAY5wdM2ZZPvv+g5PRrnBYtE4f03ErOJP7JU
         n/Dy9fmnaDW+f/dVFaOt+jHZqT3VUjm24cGD90QXLRItw3Nul+NsamoGhDQh7rWgdQg7
         E6YnB6I/9kficl+PsA9O5SvHrbvWz6j4Q2OdN9mgy7I7Dp3EsXj/XqSYEwDJ3xhPRcO3
         iQCC21vr7apokG3EVOXedMTwCOewBhOhc8Me7FreKPaOoaUFqwS1+r7QU1vrw12zE+Dv
         4XHVB+oEvBqKccKOsz6QepM2a0NEcyQLMtLiq40Rg0tQL0JRuNmFZbgEOtGIIXRm2Bnc
         aMGw==
X-Gm-Message-State: AOAM532ll8C/7Mvd4xFVs3qhra+Tr/uy22x/puPSR6SFgCoCudbDCeKb
        UESvjLSobtebHHSfpoZHA1CloURLhTxLBA==
X-Google-Smtp-Source: ABdhPJw/Tl9FhWiXVmxM/MFVLJm2/d6W5zJNusFmTbR3arahVCaJdI91e0jctADX5M0Dfn9Ft7J8Qg==
X-Received: by 2002:a05:6102:22ef:: with SMTP id b15mr8930848vsh.35.1605538674053;
        Mon, 16 Nov 2020 06:57:54 -0800 (PST)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id f1sm2076764vsj.33.2020.11.16.06.57.52
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2020 06:57:53 -0800 (PST)
Received: by mail-vs1-f43.google.com with SMTP id x11so9247780vsx.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2020 06:57:52 -0800 (PST)
X-Received: by 2002:a67:ef98:: with SMTP id r24mr7638617vsp.37.1605538672446;
 Mon, 16 Nov 2020 06:57:52 -0800 (PST)
MIME-Version: 1.0
References: <20201116083014.547-1-terry_hsiao@compal.corp-partner.google.com>
In-Reply-To: <20201116083014.547-1-terry_hsiao@compal.corp-partner.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 16 Nov 2020 06:57:40 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UetS0P++02rRfkxuxAau6i6pHDyc_9iz_OwZ5h_T_Fug@mail.gmail.com>
Message-ID: <CAD=FV=UetS0P++02rRfkxuxAau6i6pHDyc_9iz_OwZ5h_T_Fug@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180-trogdor: add "pen-insert" label
 for trogdor
To:     Terry Hsiao <a804335@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        terry_hsiao@compal.corp-partner.google.com,
        danny_kuo@compal.corp-partner.google.com,
        jasper_lee@compal.corp-partner.google.com,
        van_chen@compal.corp-partner.google.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Nov 16, 2020 at 12:30 AM Terry Hsiao <a804335@gmail.com> wrote:
>
> Add a label to the "pen-insert" node in sc7180-trogdor.dtsi
>
> Signed-off-by: Terry Hsiao <terry_hsiao@compal.corp-partner.google.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
