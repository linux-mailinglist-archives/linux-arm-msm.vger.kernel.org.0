Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 497EF441F03
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Nov 2021 18:10:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232728AbhKARMn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Nov 2021 13:12:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232548AbhKARMm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Nov 2021 13:12:42 -0400
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A960C061766
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 Nov 2021 10:10:09 -0700 (PDT)
Received: by mail-io1-xd30.google.com with SMTP id b203so7094311iof.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Nov 2021 10:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ipBE8NX/wVY+ROYSuRyteYW9jHXTysDyorv6dPtGYZA=;
        b=j80Lqh6xiJcsysn7NipdlN7PT8nZlBuhjJxm9fAPEq/nQRDBmvW7X546Fn3VlkJVDm
         XRzD6pS8QFiuK9VPsH/jGtwjdE3VG9wKT4FQMk2QV4yTmnfMz19cM33ow2Re5WL2hgO3
         mcr0FbkxvPOGeiIEDGdlKj8bEonkho30alFoU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ipBE8NX/wVY+ROYSuRyteYW9jHXTysDyorv6dPtGYZA=;
        b=i7Id1cT65aMlwbuTqqSyZepCxjBw0cT19NjthtgmE1phKoZzMCP0lVR1bPMC622xQA
         9H+YH7tx3n4ojzJ2ItmyQ221J+mrj7/mL0TdfxhiBRzlje457fBY3GIDJ4MDmYoxIssB
         rqL+QOS7BHywCSsnR1jX1ExOHqWCLYC7ELp7r/bg3b8xIPCY5BxfNVGAKG45mf0AOaYG
         8q8fhk6xaf1T6TgUypvoOjMACCkH640hliPnfjYCVzwpm5NF1mmTB0AYcw2t0FwxHtrb
         gxYruft3myjVxbZzPP68eqEmpDdGiHCWi1FVoXdRkgyGTwuG6ELdDgIy+x4xx2W7nsWu
         Dgcg==
X-Gm-Message-State: AOAM53246lLBF/EULaCuPY5ES5HbMS48maareoGIdWwNm6Pvzv3EZq1E
        Tp1ZPnqSsdAutn5IsBtWbtbEKDvlGB1wPg==
X-Google-Smtp-Source: ABdhPJxvZ5qMM8SxKsga9ja14vqsaRpMLG5wFl/f0VwZggzxm8cV3HtN+OHVdA8wMZ6DXjxQoZ6oQA==
X-Received: by 2002:a02:cbb1:: with SMTP id v17mr23228379jap.51.1635786608705;
        Mon, 01 Nov 2021 10:10:08 -0700 (PDT)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com. [209.85.166.176])
        by smtp.gmail.com with ESMTPSA id f15sm217615ila.68.2021.11.01.10.10.07
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Nov 2021 10:10:07 -0700 (PDT)
Received: by mail-il1-f176.google.com with SMTP id w15so13094969ill.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Nov 2021 10:10:07 -0700 (PDT)
X-Received: by 2002:a05:6e02:2189:: with SMTP id j9mr5015590ila.120.1635786607120;
 Mon, 01 Nov 2021 10:10:07 -0700 (PDT)
MIME-Version: 1.0
References: <20211029152647.v3.1.Ie17e51ad3eb91d72826ce651ca2786534a360210@changeid>
 <20211029152647.v3.2.If23c83a786fc4d318a1986f43803f22b4b1d82cd@changeid>
In-Reply-To: <20211029152647.v3.2.If23c83a786fc4d318a1986f43803f22b4b1d82cd@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 1 Nov 2021 10:09:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xic56vn1n5jT9J=RU6qPTR3cpJ-kqGav08SrEu-8RZzg@mail.gmail.com>
Message-ID: <CAD=FV=Xic56vn1n5jT9J=RU6qPTR3cpJ-kqGav08SrEu-8RZzg@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] arm64: dts: sc7180: Specify "data-lanes" for DSI
 host output
To:     Philip Chen <philipchen@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Oct 29, 2021 at 3:27 PM Philip Chen <philipchen@chromium.org> wrote:
>
> MSM DSI host driver actually parses "data-lanes" in DT and compare
> it with the number of DSI lanes the bridge driver sets for
> mipi_dsi_device. So we need to always specify "data-lanes" for the
> DSI host output. As of now, "data-lanes" is added to ti-sn65dsi86 dts
> fragment, but missing in parade-ps8640 dts fragment, which requires
> a fixup.
>
> Since we'll do 4-lane DSI regardless of which bridge chip is used,
> instead of adding "data-lanes" to parade-ps8640 dts fragment, let's
> just move "data-lanes" from the bridge dts to sc7180-trogdor.dtsi.
>
> Signed-off-by: Philip Chen <philipchen@chromium.org>
> ---
>
> (no changes since v1)
>
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi | 1 -
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi              | 4 ++++
>  2 files changed, 4 insertions(+), 1 deletion(-)

I think it's fine to take this change even if we also decide to fix
the driver as well.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
