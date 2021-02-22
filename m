Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E42E4322296
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Feb 2021 00:22:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230105AbhBVXVs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Feb 2021 18:21:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230062AbhBVXVr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Feb 2021 18:21:47 -0500
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CEA2C061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Feb 2021 15:21:07 -0800 (PST)
Received: by mail-qk1-x730.google.com with SMTP id h8so14493384qkk.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Feb 2021 15:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ybR/H+gUTqhJdpoNFGs25EuY0u+4Z7psGbVETIdp3Zw=;
        b=WwY7R23PimrGZfgiernMgYsaxnGb7SMGCKSp9DIfZdWYP7geL+f52q5m/yUUhcLldL
         0+rlDgGKDSqWkXb4akKNJYruzKwC9VD0eNybpo5jqdTZ4Cg0kZNNxIKI6oddIuLZd9e+
         RRwYrSHQYsEauYTOlOop9qIoQvizpD1Yb9LCo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ybR/H+gUTqhJdpoNFGs25EuY0u+4Z7psGbVETIdp3Zw=;
        b=VR9N9J6bamgeunlHJtFaGVsp6eYSKR2JBxz4jcqwT2PAuhwDlLuFBKajCpzjKaUu9M
         SQYx6wWu0vrfLRHFOk/WT7KaGEpDvfCvGKS0QPxr5M2NrdMauC5l+b2ZdU87jpQhXpZD
         m5gBG5HASXQ6NG9TpzTV/MKTO5qXEXBgkj0OofTfC0rFw8tp/M60CkCzo5lQjVVp8ItK
         iWhMA0qEsCTZWK6BrAdzihxonE2/buT2wEIeaHbA4oTvepaiVF3KsSeUpvnJ127qL2SM
         ZJNxRWlY/ntCNkLYz/CoKv9jKAo/BqZXIo0n7MstddBPidS+1kT9uYYN39cgF3qOkh0S
         9Kqw==
X-Gm-Message-State: AOAM530qpkxd/KHqg1N79xoDCZADp3+c9m5eMA5HJLN6d1PwTiygJ3ls
        0vA77QK9aq4Ek6gg0WePHfGNvXGPffSsyA==
X-Google-Smtp-Source: ABdhPJw4pxW0ga/gQyMGG8k4qGV1De2nfAFEYy1TNL+ZhTB0mr6ArOp7lrv/npWU/x/zF8/LPUyc9Q==
X-Received: by 2002:a37:7744:: with SMTP id s65mr23000754qkc.357.1614036066131;
        Mon, 22 Feb 2021 15:21:06 -0800 (PST)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id s60sm12316946qtd.16.2021.02.22.15.21.05
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Feb 2021 15:21:05 -0800 (PST)
Received: by mail-yb1-f171.google.com with SMTP id d9so5734880ybq.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Feb 2021 15:21:05 -0800 (PST)
X-Received: by 2002:a5b:84f:: with SMTP id v15mr34421582ybq.79.1614036064956;
 Mon, 22 Feb 2021 15:21:04 -0800 (PST)
MIME-Version: 1.0
References: <20210219181032.1.I23e12818c4a841ba9c37c60b3ba8cfeeb048285f@changeid>
In-Reply-To: <20210219181032.1.I23e12818c4a841ba9c37c60b3ba8cfeeb048285f@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 22 Feb 2021 15:20:53 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Vcsu1JREUgtEH1zXB7Ph8QWWYMVO2ioqqVYj9Dd79JDg@mail.gmail.com>
Message-ID: <CAD=FV=Vcsu1JREUgtEH1zXB7Ph8QWWYMVO2ioqqVYj9Dd79JDg@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sc7180: Add lazor rev4
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Feb 19, 2021 at 6:11 PM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> Lazor rev3 and older are stuffed with a 47k NTC thermistor for the
> charger temperature which currently isn't supported by the PM6150 ADC
> driver. A supported thermistor is used in rev4 and later revisions.
> Add rev4 .dts files to be able to account for this.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>
>  arch/arm64/boot/dts/qcom/Makefile             |  3 ++
>  .../dts/qcom/sc7180-trogdor-lazor-r3-kb.dts   |  4 +--
>  .../dts/qcom/sc7180-trogdor-lazor-r3-lte.dts  |  4 +--
>  .../boot/dts/qcom/sc7180-trogdor-lazor-r3.dts |  4 +--
>  .../dts/qcom/sc7180-trogdor-lazor-r4-kb.dts   | 20 +++++++++++++
>  .../dts/qcom/sc7180-trogdor-lazor-r4-lte.dts  | 28 +++++++++++++++++++
>  .../boot/dts/qcom/sc7180-trogdor-lazor-r4.dts | 16 +++++++++++
>  7 files changed, 73 insertions(+), 6 deletions(-)

From what I can see in the latest discussions -r4 _won't_ get stuffed
with the 100K resistor.  Thus we can just treat -r4 as the same as all
the other revisoins now, right?

-Doug
