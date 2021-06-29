Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 527CE3B6D9C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jun 2021 06:26:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230026AbhF2E2b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Jun 2021 00:28:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229598AbhF2E2a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Jun 2021 00:28:30 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17C3FC061760
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jun 2021 21:26:03 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id bb10-20020a17090b008ab029016eef083425so1008518pjb.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jun 2021 21:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9Mv1hXNnZzD23y7DKDXFCUL2Q/g72yLCDWXSEXlIRgc=;
        b=Esp829CCH1PuwpOymHn7E7OTRNjAZHod05d0GEqXe863S7ReRl2zFVtBoPfr2EzYGu
         51Sqi1hoA/OEPCCyNsRxhQ2WcElHLzjbwPJgyu8ycT4w4rvbgoLIyy5BoJSLvl86rv9g
         Fvz/bx14EFJvNkUAVb74kBkPKDddHQzImmzUdMNrC2o1faYniyQLsL31t8Y5pBmT1hr2
         UufSy+Vil0tOhNbZmOc04vOrKD8C7EtGSGSmoS05ECfH15JwP1cbfRZi3ab/UlBwLxTe
         Dpq32HtuxiTXkBtBul/t2LnIYW3Kd77t8M4TMk15cIrTgNHqCHdLY3zGvj35VbEfC/QD
         7Sdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9Mv1hXNnZzD23y7DKDXFCUL2Q/g72yLCDWXSEXlIRgc=;
        b=Fgg9Sl+eFY6QNCszFrF2jmVAJakvOsYXEP2sZjUcKEyXe0xgEgF/dg2WUjCl8yM1i7
         SmWRVo9EhFCvru/yYQu9Qyv6VKjaB8S/2X5OM+EKCWgIKoxe/Sw3Px8w7qKd5gG4DnNu
         zi0+n4QeHho/fT7++BetwOF3RTdQQDiPJ1RAs2sFWbvp7499Nsj1xTznJ17KvZrGP9ZD
         xxOZsC29ErYFV0u73FSVT0ASKnWBP51YCITKMI8TZwLC91KCbLiIEnnXoKCQbfieR85H
         VSuUSeuHrESwhJKLW9qUqqFlYiCY0FE6be2FRdnLIrmP+NjRZsOzyJK8TlTyd8URh/du
         ACXg==
X-Gm-Message-State: AOAM531VdgTwI20xXBLfnBo0+kbcJTKVi1ghYAl5EmNLahqIaYIpaLAG
        md/Mu1zE2/6y+W1XViss6ouP
X-Google-Smtp-Source: ABdhPJwk6bQ+0eUyJC0EO3pZiT41ajJqG7DFEtayr7QChFiJLZJPlVPRzjvoNsJGY4/56R1ygHEx6Q==
X-Received: by 2002:a17:90a:5406:: with SMTP id z6mr41126480pjh.61.1624940762599;
        Mon, 28 Jun 2021 21:26:02 -0700 (PDT)
Received: from workstation ([120.138.12.32])
        by smtp.gmail.com with ESMTPSA id u13sm3341334pfi.54.2021.06.28.21.26.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Jun 2021 21:26:02 -0700 (PDT)
Date:   Tue, 29 Jun 2021 09:55:58 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, thara.gopinath@linaro.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: aoss: Fix the out of bound usage of
 cooling_devs
Message-ID: <20210629042558.GA3580@workstation>
References: <20210628172741.16894-1-manivannan.sadhasivam@linaro.org>
 <YNpVMvhEfrz9EqyO@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YNpVMvhEfrz9EqyO@google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 28, 2021 at 04:03:14PM -0700, Matthias Kaehlcke wrote:

[...]

> 
> 
> A few more previous lines of code for context:
> 
>   int count = QMP_NUM_COOLING_RESOURCES;
> 
>   qmp->cooling_devs = devm_kcalloc(qmp->dev, count,
>                                    sizeof(*qmp->cooling_devs),
>                                    GFP_KERNEL);
> 
> I would suggest to initialize 'count' to 0 from the start and pass
> QMP_NUM_COOLING_RESOURCES to devm_kcalloc() rather than 'count',
> instead of resetting 'count' afterwards.

Yeah, I thought about it but the actual bug in the code is not resetting
the count value to 0. So fixing this way seems a better option.

Thanks,
Mani
