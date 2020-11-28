Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C919A2C73B4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Nov 2020 23:15:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387710AbgK1Vty (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Nov 2020 16:49:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731852AbgK1SzU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Nov 2020 13:55:20 -0500
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26E6FC08E861
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2020 22:29:56 -0800 (PST)
Received: by mail-pl1-x644.google.com with SMTP id x15so3686112pll.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2020 22:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fxLPby2ZZgodvkrXj4LnH57tvC3m1/hCBnaMrcy2erY=;
        b=Maq0zLzAFKaZtJb5ziGaiU0K/c0512l0OMyhPTXo+1u+9ueY1GnF8wtjs5FQ0SWwV6
         2xtGinrvIRXyEO3ajKZ8cAzRwDYWEO3ryz4wOapI0fPtt/kSP10105xv9GMyClpgfeIX
         Dgz35YyDxSlutSCtE5K/KBFXA+WH0yrKAPqAi+Mvs/CZzbqQ5RVDf/G81zuBQ/HIR0za
         zc7KzMIUEVKfAyALYj3jK3dTb+C/P33cp341XFlgZRfMvE53emP6OexeDAA5BsRxzN92
         A4EnXGE+FGX/BzNTMkuhqCJTWL019vmRo9ilUuzOHqGkr1teINtK8k4lQE/bmjcpLOJI
         il9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fxLPby2ZZgodvkrXj4LnH57tvC3m1/hCBnaMrcy2erY=;
        b=ksp1vxPGcFLEq/5XIQ+EBCVjwgdglKpaPKF7EJlZG5tRDGpKTF9ea2h+jU7wPkmPoK
         ANsPbLp6O5CR9TDVRY0EWnzdqm7v8kj+sNdchxXS/4y/shWQhQQoRFGdF6alHhOvw+uH
         CwNOpYCxcycxjYLItFd4VDaIyMrGAJ+/RKoCuhFxTft/bfUn3tTkBMgIlkmd3aQVqTgV
         3TADhJioZxT9tWkwtwsu2qH+nRpOvn92ExbGcK7h5vaS6HecuxvvJ9qzhQK6+O0JDNiy
         nvbiJ+6VKs7Vs/kbTb8FqI1bF4gyHlH0eHW/82atV64/8Suhehey6pj4PgbZuOoExYdr
         eDRw==
X-Gm-Message-State: AOAM532BTKDEKGMPoU8XtPZam3ynVxGIw3Ua+d0E1HLcWHSuUOiF3OVE
        CfUB7EkBu8Hs61sEVKkjNIJE
X-Google-Smtp-Source: ABdhPJzL+9TYLmg5wLLh3tUlGf+9HH7pyl8RV8UiyqNjgLU2dLWcdjREM5ERAsARecGIt1q7+gp+6Q==
X-Received: by 2002:a17:902:26a:b029:d6:caca:620a with SMTP id 97-20020a170902026ab02900d6caca620amr10394493plc.46.1606544995450;
        Fri, 27 Nov 2020 22:29:55 -0800 (PST)
Received: from thinkpad ([2409:4072:15:c612:48ab:f1cc:6b16:2820])
        by smtp.gmail.com with ESMTPSA id m8sm9060249pgg.1.2020.11.27.22.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 22:29:54 -0800 (PST)
Date:   Sat, 28 Nov 2020 11:59:46 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     Hemant Kumar <hemantk@codeaurora.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Network Development <netdev@vger.kernel.org>,
        skhan@linuxfoundation.org
Subject: Re: [PATCH v12 1/5] bus: mhi: core: Add helper API to return number
 of free TREs
Message-ID: <20201128062946.GL3077@thinkpad>
References: <1605566782-38013-1-git-send-email-hemantk@codeaurora.org>
 <1605566782-38013-2-git-send-email-hemantk@codeaurora.org>
 <CAMZdPi-qxKgs==kXXuSY3Y-GTfcGb7WjQuzn3tXMt2NZNuzriA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMZdPi-qxKgs==kXXuSY3Y-GTfcGb7WjQuzn3tXMt2NZNuzriA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Nov 18, 2020 at 10:32:45AM +0100, Loic Poulain wrote:
> On Mon, 16 Nov 2020 at 23:46, Hemant Kumar <hemantk@codeaurora.org> wrote:
> >
> > Introduce mhi_get_free_desc_count() API to return number
> > of TREs available to queue buffer. MHI clients can use this
> > API to know before hand if ring is full without calling queue
> > API.
> >
> > Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
> > Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>
> > Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> In case this series get new comments to address, I would suggest
> merging that patch in mhi-next separately so that other drivers can
> start benefiting this function (I would like to use it in mhi-net).
> 

Greg doesn't like that. He asked me to pick APIs only when there an in-tree
consumer available.

Thanks,
Mani

> Regards,
> Loic
