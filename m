Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B079E4072DB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Sep 2021 23:19:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234449AbhIJVUf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Sep 2021 17:20:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234298AbhIJVU0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Sep 2021 17:20:26 -0400
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A2C0C061756
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Sep 2021 14:19:14 -0700 (PDT)
Received: by mail-io1-xd2c.google.com with SMTP id f6so4130478iox.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Sep 2021 14:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5lhyZTASH4SJRYSNnAF6nepknOxCtJqItrbtMVPCI0I=;
        b=HqKsNG9+E/mQtTSc/qswsz3jUSkK53rxZSIixGE9gzqlmB/R5arNOEIhFALiap9nOZ
         Qh4qv/DoUYwk3jrqlEpTng0e56wwgvnUoqWbc9CAb8q2XlxLEGrmbKEEmlZUWDOm3ZVC
         fZ5eKKXsnu6FK6QIN+kKvYtG5i8SC/c0vlCI0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5lhyZTASH4SJRYSNnAF6nepknOxCtJqItrbtMVPCI0I=;
        b=LQuxQPKGa9aJkK+xAcpTg8y776SgWmSg+2gaNbXl9GaHar2otCMVpni9o2CqaCnrn4
         /omDE39Y1Ay4bpeen0821z3aMg1I18hyXSouVa4ezj8hZpybezFO/QTcY6ypHcirOR8s
         /QkLn5pMouHyMbHKFqWzy5XY4y1qcsSpBQcbjnlvzthuSU8Nd4QHlHx1QZdZkc+ueZ6O
         nZ7M/CfFBkfsJrh5loA7KGMYWFyDK6YRHdJ6yiy6Tka7ry6xc+7u9puk1qwfsDQ/cEgy
         /urbglWXzjY/PEmy1Z3vnftQRsiQocYbuyOjqbRN2COh/bZ5vqAlKRveEcCOzPWH5Gwm
         mkRA==
X-Gm-Message-State: AOAM533NZzOEu14DfMY16c3KjXdKM9SrxWQ2AU+yKYsGW/dSSke4qEqV
        VFTxTNhtitTN/ptGfUAmiqF8iGSZ+padhA==
X-Google-Smtp-Source: ABdhPJyMO8DvByeGyYpsIRfzvO94mIIKMKRimZn8n4niKqAF6svxNTIpFbmREN0wuZi7CHxmCURb8A==
X-Received: by 2002:a05:6602:1503:: with SMTP id g3mr8576601iow.25.1631308753718;
        Fri, 10 Sep 2021 14:19:13 -0700 (PDT)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com. [209.85.166.172])
        by smtp.gmail.com with ESMTPSA id x1sm3160430ilg.33.2021.09.10.14.19.12
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Sep 2021 14:19:12 -0700 (PDT)
Received: by mail-il1-f172.google.com with SMTP id z2so3476343iln.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Sep 2021 14:19:12 -0700 (PDT)
X-Received: by 2002:a92:da0c:: with SMTP id z12mr6317818ilm.120.1631308752557;
 Fri, 10 Sep 2021 14:19:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210909122053.1.Ieafda79b74f74a2b15ed86e181c06a3060706ec5@changeid>
In-Reply-To: <20210909122053.1.Ieafda79b74f74a2b15ed86e181c06a3060706ec5@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 10 Sep 2021 14:19:01 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UV_TG+zCsdYc5mqHFP5Cd8QuQNgYMtWNX9kENXpJXn4w@mail.gmail.com>
Message-ID: <CAD=FV=UV_TG+zCsdYc5mqHFP5Cd8QuQNgYMtWNX9kENXpJXn4w@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: Add sc7180-trogdor-homestar
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Sep 9, 2021 at 12:21 PM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> Homestar is a trogdor variant. The DT bits are essentially the same as
> in the downstream tree, except for:
>
> - skip -rev0 and rev1 which were early builds and have their issues,
>   it's not very useful to support them upstream
> - don't include the .dtsi for the MIPI cameras, which doesn't exist
>   upstream
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>
>  arch/arm64/boot/dts/qcom/Makefile             |   2 +
>  .../dts/qcom/sc7180-trogdor-homestar-r2.dts   |  20 ++
>  .../dts/qcom/sc7180-trogdor-homestar-r3.dts   |  15 +
>  .../dts/qcom/sc7180-trogdor-homestar.dtsi     | 335 ++++++++++++++++++
>  4 files changed, 372 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
