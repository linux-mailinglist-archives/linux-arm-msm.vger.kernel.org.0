Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 612BF3B741D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jun 2021 16:17:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231194AbhF2OTu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Jun 2021 10:19:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234244AbhF2OTu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Jun 2021 10:19:50 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08C2DC061760
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jun 2021 07:17:23 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id s14so16037055pfg.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jun 2021 07:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IArjopqIDg6BvXPUtumLL/oLHZrtIdyh0yhSmO6KMNo=;
        b=cSXVWRUqtGI4bt48bQhXvOSfa9n1a8ZVYjIKAmuyaD7HhtEWK/JRkJxuEABjXMi1ML
         mc7fCb42mJqHKfQqiX/tFabnDwBmefDYamsO/YPKy4ULbt1CxNGwvEO1hxrwZB/n9b5S
         uTydVdvwWi2zYRs9AM44OOgeS7jlr2PSBWWdg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IArjopqIDg6BvXPUtumLL/oLHZrtIdyh0yhSmO6KMNo=;
        b=eVoHbfD+3hUnV6mqrMyw/9UGoV8ORjL28bl+moo99N8sYnCc8g+KLd+JVM2UWU/UFP
         v5ilr55mntaS+vF2C8s7aXGKZOc0TiP4AW8ZqNpTlBIjFTaRV/cicDZn0v0J8r68cjGR
         CZIHGkUZ1NNON5wuWkjPQhug0EG5M3Wm8IEulT+FNdUdya8s+oXBKjim21z42FXDrTrt
         HqGxkJlQU9cAz+gJaTBKAkD71Wef9VyYZhipSrDZgAUZT/nXW7/R8r1oUnj5HjooKrHO
         UuMuNoTM0g3E/9nLS5EqYEwAAAilOn1C4/01ovfjgVIqVM7YdsDd3mTWZsw0BOqa7h0b
         bulQ==
X-Gm-Message-State: AOAM530yvtmd4QwiSmGqbirtFO4JDM8XCk9LwKZcgW0d/m7HwmZIHQ10
        4CJ4PS4t+QEYDJ/GSTgWH2ws6A==
X-Google-Smtp-Source: ABdhPJx7K8mQ3oTesZDtPCFys1fAQ5JZculaDZfoCHJ/pcLX1MXf9lej76mubPb12pVdVPxQsD3nwg==
X-Received: by 2002:a63:3e0f:: with SMTP id l15mr15945191pga.23.1624976242641;
        Tue, 29 Jun 2021 07:17:22 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:7cc8:c334:f56f:576d])
        by smtp.gmail.com with UTF8SMTPSA id e1sm18333781pfd.16.2021.06.29.07.17.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jun 2021 07:17:22 -0700 (PDT)
Date:   Tue, 29 Jun 2021 07:17:20 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, thara.gopinath@linaro.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: aoss: Fix the out of bound usage of
 cooling_devs
Message-ID: <YNsrcHOf90rZl44z@google.com>
References: <20210628172741.16894-1-manivannan.sadhasivam@linaro.org>
 <YNpVMvhEfrz9EqyO@google.com>
 <20210629042558.GA3580@workstation>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210629042558.GA3580@workstation>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 29, 2021 at 09:55:58AM +0530, Manivannan Sadhasivam wrote:
> On Mon, Jun 28, 2021 at 04:03:14PM -0700, Matthias Kaehlcke wrote:
> 
> [...]
> 
> > 
> > 
> > A few more previous lines of code for context:
> > 
> >   int count = QMP_NUM_COOLING_RESOURCES;
> > 
> >   qmp->cooling_devs = devm_kcalloc(qmp->dev, count,
> >                                    sizeof(*qmp->cooling_devs),
> >                                    GFP_KERNEL);
> > 
> > I would suggest to initialize 'count' to 0 from the start and pass
> > QMP_NUM_COOLING_RESOURCES to devm_kcalloc() rather than 'count',
> > instead of resetting 'count' afterwards.
> 
> Yeah, I thought about it but the actual bug in the code is not resetting
> the count value to 0. So fixing this way seems a better option.

I don't agree that it's the better option. IMO it's clearer to pass
the constant QMP_NUM_COOLING_RESOURCES directly to devm_kcalloc(),
rather than giving the impression that the number of allocated items
is variable. Repurposing variables can be confusing and led to this
bug. Also the resulting code doesn't need to re-initialize 'count'.
