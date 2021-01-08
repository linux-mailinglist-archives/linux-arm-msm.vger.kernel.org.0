Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30AC62EFB06
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Jan 2021 23:21:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725813AbhAHWVU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Jan 2021 17:21:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725792AbhAHWVT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Jan 2021 17:21:19 -0500
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D55EC061574
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Jan 2021 14:20:39 -0800 (PST)
Received: by mail-vs1-xe2a.google.com with SMTP id s85so6421529vsc.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Jan 2021 14:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+28rernzc3C0mjkmB3xMJvm5PiyDyFYwes4MhAeT590=;
        b=miY99HtjMOqHsXPkemocimuS3wuxQX+VapsXPQMV4KxnP8YjfU5ngb/avj8ZdrErJd
         5ECUo9eLuD54ehNvBzHxwTqRQ9/GABakXuA81do99rbJqsKVLS8w6hBIGgz75eeVap9B
         tdylz0rZ0+h7lHAFNkDFeH6OutxCiexkTkXPg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+28rernzc3C0mjkmB3xMJvm5PiyDyFYwes4MhAeT590=;
        b=WoFOgDyAZ3N4fYHM+yZNOOMA0HZHuhK7V1r8xTnWlh8IpwcwSgLHM1YEOkSj5xa38b
         yEMMB7r0eBmhkstXgFOw+ZAHyrsxf8r9yv3YbKdHn8l5/nNcWz4FKyaM8DAxaToGJ1P+
         7P+uwrG20tLL5H6t1HdzM+djtuCI5X8+tvfIyLrpDA7Vvpu3eFNiQr7fiuBzFbprGcx6
         pF5ezQVwePTMKDZalkYJzFFTeFD4gA7V6xY7mODOE6gcAssOeC+nvURzxzCz+56G478h
         HRf31drXiaGTMFmLrcMLfx4eXn0JXwaI737foq8W2Rxx87FeL7QHzZmcQOpHFVq8H35p
         JIYQ==
X-Gm-Message-State: AOAM530LvS9qR95euOMgy6161UsSzLeP7BfSqQyldd10G+UYNUdD52gK
        tEfrEoT4Grhi8gh7NIFpfHnZTNnxtQaZ/w==
X-Google-Smtp-Source: ABdhPJypcdJOHjkEGPl5fbYHg62M30WCeR7dKuGEZxs5Esest6VQGSoTQrdvrVCdFdYfRHkQXcuUQQ==
X-Received: by 2002:a67:6044:: with SMTP id u65mr4687417vsb.31.1610144438397;
        Fri, 08 Jan 2021 14:20:38 -0800 (PST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id x18sm1395718uan.17.2021.01.08.14.20.37
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Jan 2021 14:20:37 -0800 (PST)
Received: by mail-vs1-f51.google.com with SMTP id z16so6398031vsp.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Jan 2021 14:20:37 -0800 (PST)
X-Received: by 2002:a67:32c5:: with SMTP id y188mr4644914vsy.4.1610144436974;
 Fri, 08 Jan 2021 14:20:36 -0800 (PST)
MIME-Version: 1.0
References: <20210108141648.1.Ia8019b8b303ca31a06752ed6ceb5c3ac50bd1d48@changeid>
In-Reply-To: <20210108141648.1.Ia8019b8b303ca31a06752ed6ceb5c3ac50bd1d48@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 8 Jan 2021 14:20:25 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Wn3rqgu5fLYuJRQFU1s221VNvsk6voSY=_ye24HbMH4w@mail.gmail.com>
Message-ID: <CAD=FV=Wn3rqgu5fLYuJRQFU1s221VNvsk6voSY=_ye24HbMH4w@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Add labels for cpuN-thermal nodes
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Jan 8, 2021 at 2:17 PM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> Add labels to the cpuN-thermal nodes to allow board files to use
> a phandle instead replicating the node hierarchy when adjusting
> certain properties.
>
> Due to the 'sustainable-power' property CPU thermal zones are
> more likely to need property updates than other SC7180 zones,
> hence only labels for CPU zones are added for now.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
