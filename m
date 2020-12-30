Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1279C2E78BE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Dec 2020 13:59:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726718AbgL3M6q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Dec 2020 07:58:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726650AbgL3M6q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Dec 2020 07:58:46 -0500
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3471C06179B
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Dec 2020 04:58:05 -0800 (PST)
Received: by mail-ot1-x333.google.com with SMTP id b24so15334483otj.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Dec 2020 04:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9DwicrMgPfKg6HN+ki4qoc6QI9bh3B7VrtKVBAmLaho=;
        b=LIUOaasssp8Rty1Aal/JnRfDpctaEKMvLC7fbWBqnlb0Q5Qf6YOu4WyG7VMcAVst9l
         z2Gn3v99XKMEwPHyqA+hiHkoXZ8x7iL/aTYPZAPrPpa+QRE8+GYmsPEzCYiLAwJp03Ok
         P9qWz/06rDRCNE3Im3L1gyLTNNuTs+DrRgcYJndC3YOCo66anrgAbFfCe3rCIrUUz5MV
         oz6hKTQWCjFAgRZkHb7cLnuV7e1BjtvwMydTm++wMRXyKXFL2NLDV6fr58eRdVLLevvb
         q8slwaXijLPbktuxolycdEEyssMSa+fjWBBMvOrZIcSmEg/4D/Ql/8xTeCaqVTRiEupJ
         m2ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9DwicrMgPfKg6HN+ki4qoc6QI9bh3B7VrtKVBAmLaho=;
        b=GLOUXLRlw2To+0oUfBi63YnaoeLDh6WPezxTsK9FqQKWyKmCYL9U29bMAGJHpvRz58
         3dNjvXRqQ6DQvxP39A/Klkt32OSS1hvW3KV8hNPRKIiUjdNZ97sp/VH4D6Rc3U/9ipN3
         V+ombGo4NqGO9kx40PF+KqX6g8gFQm784DB6U1m3Q48VWd9rOD2Dy9/wHqwMbZn0ur9x
         WlIXkjGZf821jA0mRvluXJMPdmjVLK5c7LOfhaPu7+pqpcAdTjeUwSZ597RlkdhT8Zhs
         UWVhXdIETiK5PiANFrqFTxDwrAZveXP4OLi/yaAmyi1Vzt5+LexkMpWhkm2AIDp1IdCN
         NLZQ==
X-Gm-Message-State: AOAM531xwCOTq+X5LD8hdmuJpHlVXICqRyvCbsfr1J8NzTNUj9jqguf8
        evWfqnyUuqN4hsJ7n9ixOuVG1t1e+3//jwEZRohApA==
X-Google-Smtp-Source: ABdhPJzJFfQTvx3M92iXRoMCAl1vevOv9X2nZka9nC4IY9hjmsI2P5QbmvdOWE62Two91i6IEYuDp5c7YbSxMpBgy70=
X-Received: by 2002:a9d:3d06:: with SMTP id a6mr37320479otc.368.1609333085291;
 Wed, 30 Dec 2020 04:58:05 -0800 (PST)
MIME-Version: 1.0
References: <20201230115408.492565-1-dmitry.baryshkov@linaro.org>
 <20201230123542.GA5679@thinkpad> <CAA8EJppWi7POSXsHnBJ__TGDBQezU1YHcvSKk9=7wpoAfREh4Q@mail.gmail.com>
 <20201230124641.GC5679@thinkpad>
In-Reply-To: <20201230124641.GC5679@thinkpad>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 30 Dec 2020 15:57:54 +0300
Message-ID: <CAA8EJppeD-Vq643VuKrOXvHr1h6gW_U5XYKqGPcxdwGybkLv1Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] PCI: qcom: fixup PCIe support on sm8250
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 30 Dec 2020 at 15:46, Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> On Wed, Dec 30, 2020 at 03:38:12PM +0300, Dmitry Baryshkov wrote:
> > Hi Mani,
> >
> > On Wed, 30 Dec 2020 at 15:35, Manivannan Sadhasivam
> > <manivannan.sadhasivam@linaro.org> wrote:
> > >
> > > On Wed, Dec 30, 2020 at 02:54:06PM +0300, Dmitry Baryshkov wrote:
> > > > SM8250 SoC requires another clock to be up to power up the translation
> > > > unit. Add necessary bindings and driver support.
> > > >
> > >
> > > So what is the exact issue you're facing?
> >
> > IOMMU timeouts for PCIe0 device (WiFi)
> >
>
> Strange. I never observed this issue while testing with onboard QCA6390. Is it
> only happening on v5.11?

No, I've faced it with 5.10 also. Don't remember about 5.9. Downstream
4.19 also has this patch.
It well might be that on your board the firmware enables this clock.
However to be on a safe side I think we should enable it too.

-- 
With best wishes
Dmitry
