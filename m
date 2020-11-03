Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8ED362A5AC8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Nov 2020 00:53:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728675AbgKCXxU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Nov 2020 18:53:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726709AbgKCXxU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Nov 2020 18:53:20 -0500
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FE5EC0613D1
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2020 15:53:20 -0800 (PST)
Received: by mail-oi1-x243.google.com with SMTP id c21so5291563oic.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2020 15:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Jzsl0l+u2ZdPhHNWUc0rx+5LePVZdvsGME0CN+mQrUA=;
        b=JaRznvnyDTYEeqgQ8yqM7PV6d5L+zo5YgMLJDJFdHSg4fqPEIiPWuRKK8k8rqq/VM6
         ngo7+vITWlWjPOD/C2JAgT13n0B0VWVLPyewn1hutnprjiGflAT0wqU6gBPUnV6P7Dbv
         GetaXVgNaLQMkoU/zEFINLdQ6904y4DnOONg3MBlEHInfhCUmEdnZpcF7UsARQv2Z6Z1
         NahyYYwzC6AXhv6o0bFcihmpoDHaoT+OP22kH+UUGuNC6vvkkgtalnEHvHMvdYq6Vulr
         iQQ/98UzkUphT723nmu7VOYE/P09u0L7N91umIye8eGcKlZOM6VGNbxrjHphsmzo0aRI
         E7UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Jzsl0l+u2ZdPhHNWUc0rx+5LePVZdvsGME0CN+mQrUA=;
        b=kB7e2AqquiuRFIXVf+F60yNqcLi86eO+1MZLwESWwTWDAKaMmC5FFB3sLCo8uifkat
         DkmZ2D5Rdw9iLamXqO1JahTf0DmvM9xEJ2hsN5uA2iQRa9e7YavJ+5S4AvVmlckZ9uBh
         xgZj3dueS66RAl7niB76wbytKJuNO8VwLGSJw4VuIiruqJXgaPyr0xRLb0MSXCYu4/RP
         9uzEw77n+msuSNUbOiF0gtH6S2326MSZ+OBI5nk+hbfhzHGi1LWNbSE8YlopIFnHryti
         0IIOd1Y2nPnwG8oX+t/mZ4D9mmG8tHaWy+6nXCCsorGHDtqEqb5fONoudKCeJkgY4+jN
         ZXuw==
X-Gm-Message-State: AOAM5305HR7fQof17JYIEkRfU6fdiYtYOw9rb+O6oCqyaPnNL5Ak7q42
        pW+si67xfMAmQJ4s9tyggMH9DGE9O1vUeJtgI36Txg==
X-Google-Smtp-Source: ABdhPJx7gKdTHZb2kbQWLJ4DWZcN9AUZld8tYMRKLc9hIwUphni6W4wdtrbpBwoiG+/X94P6mCma2lEbT3vzx7dWfmM=
X-Received: by 2002:aca:f1c6:: with SMTP id p189mr1065757oih.18.1604447598867;
 Tue, 03 Nov 2020 15:53:18 -0800 (PST)
MIME-Version: 1.0
References: <20201027015420.908945-1-dmitry.baryshkov@linaro.org>
 <20201028044056.GA3151@builder.lan> <947976df-05c5-bc6d-455f-e71aa061055f@linaro.org>
 <20201103174041.GB65067@builder.lan>
In-Reply-To: <20201103174041.GB65067@builder.lan>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 4 Nov 2020 02:53:07 +0300
Message-ID: <CAA8EJpoNnsBNXhHy1nO_5eYbBDndtuhi71nuiwZ4M22eU2QTrg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sm8250: remove wakeup-parent for TLMM node
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

On Tue, 3 Nov 2020 at 20:40, Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
>
> On Wed 28 Oct 06:52 CDT 2020, Dmitry Baryshkov wrote:
>
> > On 28/10/2020 07:40, Bjorn Andersson wrote:
> > > On Mon 26 Oct 20:54 CDT 2020, Dmitry Baryshkov wrote:
> > >
> > > > On SM8250 TLMM doesn't use PDC interrupt controller for wakeup events.
> > > > Instead it handles them on their own (not implemented yet). In addition
> > > > setting wakeup-parent property to &pdc will result in parent hwirq being
> > > > set to ~0UL, which interact badly with the irqdomains trimming code. So
> > > > remove the wakeup-parent property.
> > > >
> > >
> > > Would you accept this patch instead?
> > >
> > > https://lore.kernel.org/r/20201028043642.1141723-1-bjorn.andersson@linaro.org
> >
> > not found
> >
>
> Seems like the tubes where slow last week, but the link works now.
> Please take a look and let me know if this works better for you.

I will check this patch. However note, that we need to get 5.10 fixed
wrt TLMM irqs. And the mentioned patch probably doesn't stand a chance
of being merged into 5.10-rc, does it?


-- 
With best wishes
Dmitry
