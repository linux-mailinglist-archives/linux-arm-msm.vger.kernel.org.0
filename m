Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F7272AA00B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Nov 2020 23:21:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729270AbgKFWTk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Nov 2020 17:19:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729296AbgKFWTi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Nov 2020 17:19:38 -0500
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02BB0C0613D2
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2020 14:19:38 -0800 (PST)
Received: by mail-vs1-xe41.google.com with SMTP id b129so1560149vsb.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2020 14:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zgkEP8uUBMM/1i9fO3D7PzhaF++uIglurMZlS2PGnJI=;
        b=I3+dtQrekOqIj2pffR3fKNray/EJcVUlTQU+sSXU3Q1Od8KZCkuhQ1FYF/feyaehpc
         s/gRfegERVeaAQMH38sGajrLmZ/O3nLaRAh1qgH+mTOZe58X+UC051KioNIFCxFuVrZG
         nKoJXCvzZgjY2QnIv4Uhshr2N+pIn19uNfjO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zgkEP8uUBMM/1i9fO3D7PzhaF++uIglurMZlS2PGnJI=;
        b=WBzZeQ+KNgoKfn7Ux9SgGNG7i7Pp5EU9oCuwjR7vFL+s3nUWRw2Z5ZhgFJ7H7OssW4
         7rxqQTMqkD+HI3C9RPHMd2B/0hv5Uf4ykXXk7qz1vXRIMFlbrmP4c7DDgNvJRLiVpnOf
         clpg9AE0pl2Xr/hwANPCSjYU+kMasysTo+DKZ1D5BkedSLVTeh7Qz8rs2P71jqDgMPj5
         6EsqCWSODN6vUE1aONIsKER78L+sZtL0QyTSN2mV3twy3Z6IlYJ0FkKvJiQ+5uqJ8pgF
         el2cRQTFOcbtAhnsTju8kKSdrj83GiY+fVmYEqMVROWe0AQ8CxizcK2HoT03M3Lcui5X
         uz2w==
X-Gm-Message-State: AOAM530QCrEg35soozDRGCx+Q3H1rH5rT7ngMvRsxo9bExGYS/GAjdVD
        fZuX15kBYWWwZ1LwQKIJ1gaAQlnfrmZB8w==
X-Google-Smtp-Source: ABdhPJw29gaeVGynYunWiZ/xzBoWrPWErRGCssXGJUt2HLZ21pfoDS5ncKGUnJFluF/0tTN7/o1vrw==
X-Received: by 2002:a67:cb17:: with SMTP id b23mr2929778vsl.22.1604701176970;
        Fri, 06 Nov 2020 14:19:36 -0800 (PST)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id t3sm338853vsa.15.2020.11.06.14.19.36
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2020 14:19:36 -0800 (PST)
Received: by mail-vk1-f182.google.com with SMTP id d191so583221vka.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2020 14:19:36 -0800 (PST)
X-Received: by 2002:a1f:ab87:: with SMTP id u129mr2589166vke.7.1604701175874;
 Fri, 06 Nov 2020 14:19:35 -0800 (PST)
MIME-Version: 1.0
References: <20201106140125.v3.1.I5a75056d573808f40fed22ab7d28ea6be5819f84@changeid>
In-Reply-To: <20201106140125.v3.1.I5a75056d573808f40fed22ab7d28ea6be5819f84@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 6 Nov 2020 14:19:23 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VNPoJVhdB09THXu5g8gbyuYw7Yj1Sj4UEuOSp4fQ8LAw@mail.gmail.com>
Message-ID: <CAD=FV=VNPoJVhdB09THXu5g8gbyuYw7Yj1Sj4UEuOSp4fQ8LAw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: sc7180: Add sc7180-lazor-r2/r3
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Nov 6, 2020 at 2:01 PM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> Add configs for lazor rev2 and rev3. There are no relevant deltas
> between rev1 and rev2, so just add the rev2 compatible string to the
> rev1 config.
>
> One important delta in rev3 is a switch of the power supply for the
> onboard USB hub from 'pp3300_l7c' to 'pp3300_a' + a load switch. The
> actual regulator switch is done by the patch 'arm64: dts: qcom:
> sc7180-trogdor: Make pp3300_a the default supply for pp3300_hub',
> since it affects the entire trogdor platform. Here we only add the
> .dts files for lazor rev3 and replace the generic compatible entries
> in the rev1 .dts files.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>
> Changes in v3:
> - rev3 switched the regulator, not rev2
> - also handle rev2 in rev1 files
> - fixed include in -r3-kb.dts
>
> Changes in v2:
> - patch added to the series
>
>  arch/arm64/boot/dts/qcom/Makefile              |  3 +++
>  .../dts/qcom/sc7180-trogdor-lazor-r1-kb.dts    |  4 ++--
>  .../dts/qcom/sc7180-trogdor-lazor-r1-lte.dts   |  4 ++--
>  .../boot/dts/qcom/sc7180-trogdor-lazor-r1.dts  |  4 ++--
>  .../dts/qcom/sc7180-trogdor-lazor-r3-kb.dts    | 17 +++++++++++++++++
>  .../dts/qcom/sc7180-trogdor-lazor-r3-lte.dts   | 18 ++++++++++++++++++
>  .../boot/dts/qcom/sc7180-trogdor-lazor-r3.dts  | 15 +++++++++++++++
>  7 files changed, 59 insertions(+), 6 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dts

Reviewed-by: Douglas Anderson <dianders@chromium.org>
