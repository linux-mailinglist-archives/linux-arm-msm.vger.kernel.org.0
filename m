Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DECB31CFD5D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2020 20:34:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726465AbgELSep (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 May 2020 14:34:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725987AbgELSeo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 May 2020 14:34:44 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C836C061A0C
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2020 11:34:44 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id nv1so11882151ejb.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2020 11:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lDJyBodLMWu0qhUNufdBiDT9gXv62jTHVGYNy+RgCn4=;
        b=n88seXetfhopzoBMRSH8H9VRBmAOE1qq5c0Rz2YOxrb7fjtnwGYFVy0xIAjMr5JZEG
         1jevRTPR8k47xYy9FjCdr/cycRRhfzCw8Kld6E8R6tTwfOIe0MC3iZy/GsA6YtHWvbFg
         yLZnIfdP4edHVDZgAY0ziW9bj8PMHnwDOHFEbPVP2bQU6iQeEoN+bz8mojbIhrk2TrEb
         uxWMEFMFi2IMDNJo1ymEzFV5scdSuw46QjVteDezPyVWUDIU8bm9b6y0bVFkqgxQP1XS
         5sPu46jnj8szt3BSZ5GWwGrfn/tigDND/8QvJpwOmjN9buBvR/jxk7E4K5CdcQ310dd+
         2Ggw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lDJyBodLMWu0qhUNufdBiDT9gXv62jTHVGYNy+RgCn4=;
        b=PWTpNj9RXBFGZUhtohZUpCCTNQTHO5CfhHnQ1SvI0IBbsONaMn06jHJGSZfXL5Sal7
         r5h5nXsOupd2sicBQXIxjam3erjJF6Vx/hVWV4V+RxNY2F/EP3bqwXWndsMfJiJnFNtt
         e63SURD+vGjwWe8+1Q7o5zvcL2ohZT9qMfEouknzVkELvyOC2VaY1bO1JFVCZcqaLVw0
         cSUWN7qM2EK9YDa02GgWJPvfvnaZLtHTHHDuC9UJWqMk9kgJME12AjQsLLO+dYxXOHUl
         9qmMCs1x9/MiwCmFAgZIhBsX6sAs5wc+ew9OFRzRyxwo00yMPhImNol/nZkAQXpWlyoh
         WNiw==
X-Gm-Message-State: AGi0PuZeas2kQY+7uvaexFL5uPBfw/kNPi54ujDPokPJCGdlb+14GTmu
        VmqUxEwJ/ydrMM2zJ7g8oQ+i0M5dQUvRRPPBw7w=
X-Google-Smtp-Source: APiQypLNhlqIAjCQGA1LPDeDlHX4a0qstJSP7J2QUAeG/WpcRIcYsCqmti86ji1+zZSUuFs9Qa1eyxxFTQLh/roDblc=
X-Received: by 2002:a17:906:cec5:: with SMTP id si5mr19319406ejb.267.1589308483166;
 Tue, 12 May 2020 11:34:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200509130825.28248-1-shawn.guo@linaro.org> <20200512055242.GJ1302550@yoga>
In-Reply-To: <20200512055242.GJ1302550@yoga>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 12 May 2020 11:35:01 -0700
Message-ID: <CAF6AEGsod2L+VwJGhECpW8BhfexLgMMp_3V3AsnKjXcyLaT48w@mail.gmail.com>
Subject: Re: [PATCH] iommu/qcom: add optional clock for TLB invalidate
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Shawn Guo <shawn.guo@linaro.org>, Joerg Roedel <joro@8bytes.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konradybcio@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 11, 2020 at 10:52 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Sat 09 May 06:08 PDT 2020, Shawn Guo wrote:
>
> > On some SoCs like MSM8939 with A405 adreno, there is a gfx_tbu clock
> > needs to be on while doing TLB invalidate. Otherwise, TLBSYNC status
> > will not be correctly reflected, causing the system to go into a bad
> > state.  Add it as an optional clock, so that platforms that have this
> > clock can pass it over DT.
> >
> > Signed-off-by: Shawn Guo <shawn.guo@linaro.org>

[snip]

> > @@ -839,6 +849,12 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
> >               return PTR_ERR(qcom_iommu->bus_clk);
> >       }
> >
> > +     qcom_iommu->tlb_clk = devm_clk_get(dev, "tlb");
>
> Wouldn't "tbu" be a better name for this clock? Given that seems the
> actually be the hardware block you're clocking.
>
>
> That said, I thought we used device links and pm_runtime to ensure that
> the TBUs are powered and clocked...
>

please don't rely on device-link for that, buffers can be freed (and
therefore need to be unmapped) at times when the gpu is off.

BR,
-R
