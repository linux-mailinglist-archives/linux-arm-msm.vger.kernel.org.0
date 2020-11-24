Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E02D82C1D93
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 06:36:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726202AbgKXFgT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Nov 2020 00:36:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:54774 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725616AbgKXFgS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Nov 2020 00:36:18 -0500
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 94AC9206FB;
        Tue, 24 Nov 2020 05:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606196178;
        bh=PY5GOVNfFhgXvqmnxwhdOyaq1u3p5yH99M056S09Er0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=cR64A+ORQ6400oZFz1g+eHgUnarSwZTqjxgzn9tbuahVRr45T8kTEGAUL9cWflc4b
         eK+8hQbPW6mR7T1yNz/MS9fobqiHy33dgjqNRoeg5aUuevBfnlNwlSZkNiAbBrG9pZ
         aT+V3rklptNYUx64JXQv97sC4Rekv5XXL2XYTgZI=
Received: by mail-lf1-f54.google.com with SMTP id s30so27144726lfc.4;
        Mon, 23 Nov 2020 21:36:17 -0800 (PST)
X-Gm-Message-State: AOAM532KKLQ50i0yDFeEiHf2KruQFmxwpAlFqhNRX4O2NYAM4MDHGuN2
        Yvb7yWtQ2srEDaF1VsA4TZznCiiUsywMvgFeeOY=
X-Google-Smtp-Source: ABdhPJwt3UzrXi3DqyqC5U4j4xnCEDnsfUn4otiaOU1Yl0BmCTWOPLJFHorMabhDqJMHUM/QUM2Ymblm6VFgxkmwmqs=
X-Received: by 2002:a19:ecf:: with SMTP id 198mr992157lfo.193.1606196175805;
 Mon, 23 Nov 2020 21:36:15 -0800 (PST)
MIME-Version: 1.0
References: <20201124052701.GF8403@vkoul-mobl>
In-Reply-To: <20201124052701.GF8403@vkoul-mobl>
From:   Chen-Yu Tsai <wens@kernel.org>
Date:   Tue, 24 Nov 2020 13:36:04 +0800
X-Gmail-Original-Message-ID: <CAGb2v67DpjMkcXoumQ=92wVovCqor37U7xroxsoh+BO6i7x8jg@mail.gmail.com>
Message-ID: <CAGb2v67DpjMkcXoumQ=92wVovCqor37U7xroxsoh+BO6i7x8jg@mail.gmail.com>
Subject: Re: Reusing DTS from arm64 to arm
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Nov 24, 2020 at 1:28 PM Vinod Koul <vkoul@kernel.org> wrote:
>
> Hello Olof, Rob,
>
> We have Qualcomm arm platform which uses PMIC PM8150B. This PMIC was
> also used in SM8150 board and is already upstream [1] but in arm64.
>
> So, what is the guidance to share DTS files between 32 and 64 variants?
> Does a solution already exist which I may not be aware of..?
>
> I can think of following options for this, in case we dont have a
> solution:
>
> 1. Hack up arm include paths to also include arm64 path so that we can
> share DTS

These are already provided. See scripts/dtc/include-prefixes/ .

So just put

#include <arm64/qcom/pm8150b.dtsi>

in your DTS and it should work?

For Allwinner we have the reverse, i.e. including arm dts files from arm64.


Regards
ChenYu

> 2. Use relative path of arm64 directory and include that (seems not
> great to look at)
>
> 3. Copy the file (simplest but least preferred)
>
> Or is there a better idea to solve this...?
>
> [1]: arch/arm64/boot/dts/qcom/pm8150b.dtsi
>
> Thanks
> --
> ~Vinod
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
