Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A516135B267
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Apr 2021 10:19:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235193AbhDKISo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Apr 2021 04:18:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229792AbhDKISn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Apr 2021 04:18:43 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC5EBC061574
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Apr 2021 01:18:27 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id d8so4737691plh.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Apr 2021 01:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vaSoa75rP/4Huh8kDe6n5FhH7rWjAzBRDPBL/0IMkkY=;
        b=Jf4qQNpGY3o5V+3ZNBXFRyxoSytflAT8YyZN1NChFFLSxyt/OlCXLkSrvuhvvB8PyJ
         SumZUfyRK87hHfH4deuhTxLRha2QcZxeqyvAiiw8U8svTRey4Kd80c6Hy1mlS/qWrps7
         WSv5H+RdQViyQoB4qCCEbSokV4SpO/OBtmugToqMWZP1fGL8cfYo5bseveTuJ0LTtCWN
         8CMLc2a62icl26uHt3ihnGDXlwvgZGdjuhIVy2W5Edv/LWXuDDQvgRbL5LHIbt+fzaxh
         56OnftmyhRJEmsB2wt24hhhcOpcbfaOMqonc5ztBlQ4GLobrr5o6gtC6a2tvxw5kWVWQ
         bLjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vaSoa75rP/4Huh8kDe6n5FhH7rWjAzBRDPBL/0IMkkY=;
        b=baHLbzUcXCXJ/P0BHQGfOSSgMFYs1jGGDKjpakL/Bgo6ZuVt94qfC2pd+nuaOA9uop
         Qx5smctICZbaFhlap9/nWyDtl2vmTdkMGux0d4hHslBt8Oxwvepy+VNkdJqQpajtxxPY
         XzZlB0W7vFEmVWIWsMcGsfFk1wjolCZ6M0xgjZ5IBb1Oi8q7yCBvWhELwxKM7ByDLEkI
         JJcTqRxeNnuDfiZPJU8Q6zAZHKoasUuPZ37chm02AR8oUWiQVxQ/5nHAZpd55aYoZexi
         NpOt9ZW4/27U4yR8L2ZjY9kcmWOMGY7py1+ITLPAqml3Rn82ZvTjZBcgTLO2oCGuJFdM
         u64g==
X-Gm-Message-State: AOAM532RaWzINCNo8GVN36BUNz4FqK0qP2/BDJHqDSW8UhzkO9LPnYqe
        7ATJTlWeT3PfsCOQMxL5R8F7
X-Google-Smtp-Source: ABdhPJwI8YrTBaO30qCFE0Ih6wlnvxRbheGktUCxIExVgvuHw1p6kkdVhgSlh/G/HrLvM9XYuAug1A==
X-Received: by 2002:a17:90a:9281:: with SMTP id n1mr22341973pjo.146.1618129107180;
        Sun, 11 Apr 2021 01:18:27 -0700 (PDT)
Received: from thinkpad ([2409:4072:6c92:7292:bfd8:b465:2e65:8337])
        by smtp.gmail.com with ESMTPSA id l6sm7821409pgf.35.2021.04.11.01.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Apr 2021 01:18:26 -0700 (PDT)
Date:   Sun, 11 Apr 2021 13:48:19 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org, jarvis.w.jiang@gmail.com,
        loic.poulain@linaro.org
Subject: Re: MHI changes for v5.13
Message-ID: <20210411081819.GA2030@thinkpad>
References: <20210411055559.GA2068@thinkpad>
 <YHKdv3A2w0KHYcxx@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YHKdv3A2w0KHYcxx@kroah.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Greg,

On Sun, Apr 11, 2021 at 08:57:03AM +0200, Greg KH wrote:
> On Sun, Apr 11, 2021 at 11:25:59AM +0530, Manivannan Sadhasivam wrote:
> > Hi Greg,
> > 
> > Here is the MHI Pull request for the v5.13 cycle. I stayed with the PR as the
> > number patches got increased.
> > 
> > Details are in the signed tag, please consider merging!
> 
> A suggestion, please put [GIT PULL] in your subject line, so that I know
> what this is for, that's a semi-standard thing these days.
> 

Sorry, sent it a hurry so missed it.

> Also, you have a number of patches in this set that look like they
> should be backported to stable kernels.  Any reason why you did not tag
> them with a "Cc: stable@..." tag in the commit?  After they are merged
> into Linus's tree, please send the git ids of the commits that should go
> to stable kernels to stable@vger.kernel.org so that we can add them
> properly.
> 

Should've done that. Will send them once merged into mainline.

Thanks,
Mani

> Now pulled and pushed out, thanks.
> 
> thanks,
> 
> greg k-h
