Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B7982AE1BC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Nov 2020 22:28:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731657AbgKJV2R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Nov 2020 16:28:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726861AbgKJV2Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Nov 2020 16:28:16 -0500
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 798C2C0613D3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2020 13:28:16 -0800 (PST)
Received: by mail-oi1-x243.google.com with SMTP id w145so16125369oie.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2020 13:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WdCTcUp3dt98pd8N/bAI9BPR8MUfMdcKBreEIwkfCWE=;
        b=cKDjQtDDjB5Lky6jr2FC81N8duXbbH+cdB+mUYl9ikTUJ7j9GcojAmJEG5BVI3wyfT
         EYNwGSw2Q9kY2uRubIVw62LI2LDhWwN1uEmD4wY2AITz56OHuw3gL1tjz9HMqlKwx+nz
         pA8JHfW05ZyNKM6CDX9Td5f8KN6q7GdIBBbdz0gwo6rMGugKLA4yaEey8lf9HdGhKbpc
         Ln9/mz15nnvKxS1xeoR5Rn4tNV+0xPqNzUbEFFw+n7J9lchvyBjpYbPWC8U42W0da+/C
         Cc8wDMJtb+YwfnH1uoSNx2viMYTLeo09VUOauM7XIlRzZJRbn6Ccoqb8a4/CStzG6bcx
         XU7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WdCTcUp3dt98pd8N/bAI9BPR8MUfMdcKBreEIwkfCWE=;
        b=YEVBZ1whthN+RBnEaY+1pLZRoJnPiaeoGcV8FSFD5E+NwjC7EdRXBC3tWegXA8jsKb
         uDJibTuCBN6eMKGYDiO4ss4fLpzjX3Uw0m33Hw2RDY9IcqFzrY/3DRfdfw5KuOD8XJqZ
         QdEYfGFGQ9oASuMtvLK0MrtEzU4qFjsLBV6nU0S8i+r2u8vqa1kfLUAWITzC/CtUJaWO
         rOhclr9VKRBKaisSBpNd7qiVZG+DP6/EUT6hxle45272M30AOTR31GnzT4JhhvvTWliK
         Lncz7eJb9jGYGvDHU3e6aNMVWNaTua1UqBDuTIMwQDOWG6w/2CmRwyg03MsK3ZBTFWxO
         MhAg==
X-Gm-Message-State: AOAM532hNxF9v8yzGaxPckea9D+H7yaLBMutZDeisx3OdTCR3YU5ErLd
        fEbgqKGfTRD2u4eyjbIQgJe4WyBjbCt33A==
X-Google-Smtp-Source: ABdhPJyGV9vepmOEKrlYJxQpWVjB8O0kCfQ9th8PqSMEhyIIM/MxzoaDwll65t2fKnc7Vlu3jyk7kw==
X-Received: by 2002:aca:b588:: with SMTP id e130mr92461oif.56.1605043695752;
        Tue, 10 Nov 2020 13:28:15 -0800 (PST)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id g3sm3422228oif.26.2020.11.10.13.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 13:28:15 -0800 (PST)
Date:   Tue, 10 Nov 2020 15:28:13 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Maulik Shah <mkshah@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM <linux-gpio@vger.kernel.org>, Andy Gross
        <agross@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper
        <jason@lakedaemon.net>, Doug Anderson <dianders@chromium.org>, Rajendra
        Nayak <rnayak@codeaurora.org>, Lina Iyer <ilina@codeaurora.org>," 
        <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>,
        "open list:GPIO SUBSYSTEM <linux-gpio@vger.kernel.org>, Andy Gross
        <agross@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper
        <jason@lakedaemon.net>, Doug Anderson <dianders@chromium.org>, Rajendra
        Nayak <rnayak@codeaurora.org>, Lina Iyer <ilina@codeaurora.org>," 
        <lsrao@codeaurora.org>
Subject: Re: [PATCH] pinctrl: qcom: Move clearing pending IRQ to
 .irq_request_resources callback
Message-ID: <20201110212813.GF807@yoga>
References: <1604561884-10166-1-git-send-email-mkshah@codeaurora.org>
 <CACRpkdZJ6yrisNKFG8MJEOhzAV7HRtUTniXpnFVd9fpVy75ruw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZJ6yrisNKFG8MJEOhzAV7HRtUTniXpnFVd9fpVy75ruw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 10 Nov 07:31 CST 2020, Linus Walleij wrote:

> On Thu, Nov 5, 2020 at 8:38 AM Maulik Shah <mkshah@codeaurora.org> wrote:
> 
> > When GPIOs that are routed to PDC are used as output they can still latch
> > the IRQ pending at GIC. As a result the spurious IRQ was handled when the
> > client driver change the direction to input to starts using it as IRQ.
> >
> > Currently such erroneous latched IRQ are cleared with .irq_enable callback
> > however if the driver continue to use GPIO as interrupt and invokes
> > disable_irq() followed by enable_irq() then everytime during enable_irq()
> > previously latched interrupt gets cleared.
> >
> > This can make edge IRQs not seen after enable_irq() if they had arrived
> > after the driver has invoked disable_irq() and were pending at GIC.
> >
> > Move clearing erroneous IRQ to .irq_request_resources callback as this is
> > the place where GPIO direction is changed as input and its locked as IRQ.
> >
> > While at this add a missing check to invoke msm_gpio_irq_clear_unmask()
> > from .irq_enable callback only when GPIO is not routed to PDC.
> >
> > Fixes: e35a6ae0eb3a ("pinctrl/msm: Setup GPIO chip in hierarchy")
> > Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> 
> This looks critical so I applied it for fixes so we get some
> rotation in linux-next.
> 
> If Bjorn has other opinions he will tell us :)
> 

No objections, the patch looks reasonable to me.

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn
