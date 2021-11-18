Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E6B2455B26
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Nov 2021 13:03:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344477AbhKRMGm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Nov 2021 07:06:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344475AbhKRMGh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Nov 2021 07:06:37 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74B03C061570
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Nov 2021 04:03:35 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id gb13-20020a17090b060d00b001a674e2c4a8so5475099pjb.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Nov 2021 04:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YI1Lh1+u9y2Rdr5uc1zvo5rFFoVd9BpEe5RkTQkaRgk=;
        b=KOp8Ene37x19VH16WN233yfPR54BHDHYa4nb0L5nnvxvqubFe6QxQWhRSmpkMbif8s
         V+3b6m72vpyuv0BwIv20K2pcuOREx/enp1DIkzPg45sf8nOiledNOaxMgZoKhMiPzsb1
         YxueZ5VqrcZNRefvmUMg9kYOs/ilnbBA+xXQloVPEFCnI+6OOE5rS91wfnJXeqHB3N9k
         mmU341jzl1j48f8W4C+gBJmjP1pGCeP3oBIl4c8TJSy62CZ1/dLtJmCkwVP6c7Fiws8m
         Dyyd/l/kFcV5rl7HByK1ZbXJ3wpEbCCnr1abtQG0q25z5RBJEjW0ezDv0fCoyANw0PU5
         mzLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YI1Lh1+u9y2Rdr5uc1zvo5rFFoVd9BpEe5RkTQkaRgk=;
        b=t9wEjvEdwVackjyD7OC5E4xST50W67AkTFt0rUjeur1oczWGYbKgiqGW01q0KZ6sry
         /+8gxente5bg39Egj9Tt5bnMUnsLDsqwPiGuni50gG+KoLdbL2FmWgI8tN8YXByMVncF
         bIMAtrwQP18Qy9cj4MK4iihdfpTdxoumb1MpvOjgyAHcP5KdoT1uEfqTgUDN4KEb0Klg
         djs+pB/lUPD4We+xjvG3m10LiBRQPUHBOn5lpfBxZ1+ejSn2qvQs4s6IZO567nZsAHkp
         feC56pbOiEPlXIkq3ApQlSvAz6z9gpX9+9/fyj6yI1JStvd4YXFGH8oM6tBEQFZQaTOm
         ZymA==
X-Gm-Message-State: AOAM530afS36ircjO5gOaU3Pz2QRP2b4s293Zm8yYdaT6ZD6e0KSKGue
        L6+ZdhMgGbe74ESOP2/k1sxV5ytFxKrVfGpjTWMIDg==
X-Google-Smtp-Source: ABdhPJw6Gr+Smw+R053iYguuCDSumjKjHrfO8w2JPvCxw/fo3NTdSoxbKbNhybeZ7l+yAfiOSe1QU4ydx1fHuauJw0M=
X-Received: by 2002:a17:90b:4a05:: with SMTP id kk5mr9826965pjb.232.1637237014885;
 Thu, 18 Nov 2021 04:03:34 -0800 (PST)
MIME-Version: 1.0
References: <20211117113800.260741-1-robert.foss@linaro.org>
 <20211117113800.260741-4-robert.foss@linaro.org> <YZT4lddeEJAOkIc4@gerhold.net>
In-Reply-To: <YZT4lddeEJAOkIc4@gerhold.net>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Thu, 18 Nov 2021 13:03:23 +0100
Message-ID: <CAG3jFyuja1OYcSK6VCoRCwQ-O_CPU8eB_mzcH-y6azNAXosrew@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: msm8916: Remove clock-lanes
 property from &camss node
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, todor.too@gmail.com,
        mchehab@kernel.org, robh+dt@kernel.org,
        angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks Stephan.

On Wed, 17 Nov 2021 at 13:42, Stephan Gerhold <stephan@gerhold.net> wrote:
>
> Hi Robert,
>
> small nitpick: The subject would be more clear with
> "arm64: dts: qcom: apq8016-sbc: ..." instead of "msm8916: ..." like in
> your sdm845-db845c patch, since only apq8016-sbc is modified.

Will do.

>
> On Wed, Nov 17, 2021 at 12:37:59PM +0100, Robert Foss wrote:
> > The clock-lanes property is no longer used as it is not programmable by
> > the CSIPHY hardware block of Qcom ISPs and should be removed.
> >
> > Signed-off-by: Robert Foss <robert.foss@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi | 2 --
>
> Can you rebase this on 5.16-rc1? All of apq8016-sbc.dtsi is now in
> apq8016-sbc.dts (the extra dtsi did not have any good use).

Ack.

>
> Thanks,
> Stephan
