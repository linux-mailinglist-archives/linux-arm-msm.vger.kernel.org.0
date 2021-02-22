Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 576753222A0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Feb 2021 00:27:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231203AbhBVX0J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Feb 2021 18:26:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231184AbhBVX0H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Feb 2021 18:26:07 -0500
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4170C06174A
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Feb 2021 15:25:27 -0800 (PST)
Received: by mail-qv1-xf2c.google.com with SMTP id 2so6994241qvd.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Feb 2021 15:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/oxheRV/zYlSYJgiTUORu/R/sZ9O15RX0FoUHQXYP0A=;
        b=L1VU0bgJMRWAPIlu7JlvZYs4sMFK0Rfgee/BaMVitzOXQEwyOFVTGmvIIrHp87Zs7C
         fTS9WDZmca6Q5MhVf143lkSoEVlBN3I/MrosQ/zRKY6Sb5suIx5R6V7ne6HhGZ2Mtge8
         WkDfz0uMBGptMDbjLSvoscg5PrfoGfwwNffrs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/oxheRV/zYlSYJgiTUORu/R/sZ9O15RX0FoUHQXYP0A=;
        b=NZq6rYBsD+zoOaVTBVVe69fNAggdOpmoPF828t8WXDSOnUjNyoRiZx1fr+JTq9vmF+
         Zgzcqk3MCPYoCAGS9X7Hvk3sA0nCoH5Jcefmx2eM7c8SQeppQPL0pS7USAwQ8k1zVCKv
         kcjNEz8t/nzEO0eUYdd1blhW3K8O4lWyvhJgoGl5bYmc6R348scGVUzRf1QN8SW17gLZ
         qHJc7saBwizDsRgSmNnTktHmdoL3kntdoc+GGJ61ZaC/ktovkr2PshXm3v4Cwo2gAq/b
         CuPPMyal5Bptk4TNvVQBYkaBlkTiBynB/eAaiJdaVu3UE//3GpP4nSHqD7wukBWcbw4s
         olQg==
X-Gm-Message-State: AOAM5311Cq9scbXW9JUq2z9ALg18fZL1CK96PHd2q1Z6FJleGEJUhl6Z
        utodwNXp9ipGOjsb9roKkO01Z20wHeaejA==
X-Google-Smtp-Source: ABdhPJypu5arp8fjH9luA+8/kkkfMA8ywRrgRiQ7c0b7j+ODb5N7n3vHobstczedzCqkQPmbTJWEAQ==
X-Received: by 2002:a0c:b66c:: with SMTP id q44mr15462289qvf.3.1614036326664;
        Mon, 22 Feb 2021 15:25:26 -0800 (PST)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id c191sm10500286qke.1.2021.02.22.15.25.26
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Feb 2021 15:25:26 -0800 (PST)
Received: by mail-yb1-f173.google.com with SMTP id m188so14608032yba.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Feb 2021 15:25:26 -0800 (PST)
X-Received: by 2002:a25:aa43:: with SMTP id s61mr38889621ybi.32.1614036325816;
 Mon, 22 Feb 2021 15:25:25 -0800 (PST)
MIME-Version: 1.0
References: <20210219181032.1.I23e12818c4a841ba9c37c60b3ba8cfeeb048285f@changeid>
 <20210219181032.2.I6a426324db3d98d6cfae8adf2598831bb30bba74@changeid>
In-Reply-To: <20210219181032.2.I6a426324db3d98d6cfae8adf2598831bb30bba74@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 22 Feb 2021 15:25:14 -0800
X-Gmail-Original-Message-ID: <CAD=FV=W7W9RT3SjGChP16o1Mz4_EwCJ=t8nNFYiS5QvK6E27OA@mail.gmail.com>
Message-ID: <CAD=FV=W7W9RT3SjGChP16o1Mz4_EwCJ=t8nNFYiS5QvK6E27OA@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sc7180: trogdor: Add labels to
 charger thermal zone and ADC channel
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
> Some revisions of trogdor boards use a thermistor for the charger
> temperature which currently isn't supported by the PM6150 ADC
> driver. Add labels for the charger thermal zone and ADC channel
> to allow the removal of these nodes from affected boards and
> avoid the use of bogus temperature values.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
