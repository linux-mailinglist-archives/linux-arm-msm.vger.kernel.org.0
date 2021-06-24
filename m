Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DCD93B3856
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jun 2021 23:09:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232284AbhFXVLm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Jun 2021 17:11:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232029AbhFXVLm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Jun 2021 17:11:42 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62ACDC061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jun 2021 14:09:22 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id a133so6701816oib.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jun 2021 14:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=35ev01G1d10RuKtN150atNvFxHKq+CQuhmJl4s/jsXQ=;
        b=g/8qzCeYCQG6wLBv1S0Ml9BlWWniZACSiZjNmUwIERLYCxOyWnC9s/ilvmofmvP61O
         sI0qfOlT8wXvMcDj3JGD7yofLU5uiXwwHbY396F7N6gzzT0sN7JITl2xdSgLV19oBf19
         HsaybikUVhPkG0vN+54Y+7SVQq91ZgnKgmMo29QpZAoaaQckD/HgfA4D4Sx9uE89dS/9
         rC3yvtLIj8WN99QnYBFjIDplJOv9My5s9L3KqwkX0LoOTwmg7GZA/z2Nzo3pYLLucttA
         yE2tjgNVeAnkwQ22CZ1YMkCns1zJtXWbewQXDDw7iDN1Ajzaf18HemTldlQrK20Br1yI
         Y6WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=35ev01G1d10RuKtN150atNvFxHKq+CQuhmJl4s/jsXQ=;
        b=eIEWz0H2wqJvzmpjD3hosrUTmB+T9sjXbFSUWrWX/gVFy/NwWB7orfYinU1mBu3BTq
         yQ/7c3gTv+qMWfme6K6ZVJ3RCI/pzpN/B5DTvMYfw6+wQd/3hDoxTmJCr+90axJwPcRY
         yosogjt6l9bofZVL7XcPYENqSZDKJ6t4Tp+bEMHXf7BR3fiGeN5RSIgK+gNep+1X7pDx
         eqXfAoHfSdkY1EitfKTccgqnjSpYjV1E0LP18FYQrfh65a8lRnLs0LuoUH4v3HV8ou4v
         D451zyNJ60oWR3W1MNBmMWWytDTZhyRdVw+dbu/GLh08dYbUcNQODt98+peeB/WdRHnw
         A4aQ==
X-Gm-Message-State: AOAM530TLqvbcWpa+z7+O/lPz0/8PVzaS6pOQfR2ucsq+Mzb1RLOtCoT
        qDT69mtl6EavbGg3aR7GLz6gYg==
X-Google-Smtp-Source: ABdhPJxDf/9twTzCEeGxaUzWt5Bv4xdBcnF7z4X52vKjYf8KhuLuO/7yhWj46P8xht9foEM6wot+Qw==
X-Received: by 2002:a05:6808:18a:: with SMTP id w10mr5701534oic.6.1624568961806;
        Thu, 24 Jun 2021 14:09:21 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t33sm840699oiw.13.2021.06.24.14.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 14:09:21 -0700 (PDT)
Date:   Thu, 24 Jun 2021 16:09:19 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v3] bus: mhi: Add inbound buffers allocation flag
Message-ID: <YNT0f2agKblMfBjn@yoga>
References: <1624566520-20406-1-git-send-email-loic.poulain@linaro.org>
 <YNTrePQQ3scDzAhe@builder.lan>
 <CAMZdPi_wKHQszTaJH8neHHGWJzRO9P7Zr3XTq0nSRku4EKnhuQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMZdPi_wKHQszTaJH8neHHGWJzRO9P7Zr3XTq0nSRku4EKnhuQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 24 Jun 17:45 CDT 2021, Loic Poulain wrote:

> Hi Bjorn,
> 
> On Thu, 24 Jun 2021 at 22:30, Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > On Thu 24 Jun 15:28 CDT 2021, Loic Poulain wrote:
> >
> > > Currently, the MHI controller driver defines which channels should
> > > have their inbound buffers allocated and queued. But ideally, this is
> > > something that should be decided by the MHI device driver instead,
> > > which actually deals with that buffers.
> > >
> > > Add a flag parameter to mhi_prepare_for_transfer allowing to specify
> > > if buffers have to be allocated and queued by the MHI stack.
> > >
> > > Keep auto_queue flag for now, but should be removed at some point.
> > >
> > > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > > Tested-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> > > Reviewed-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> > > Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
> > > Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > Acked-by: Jakub Kicinski <kuba@kernel.org>
> > > Link: https://lore.kernel.org/r/1621603519-16773-1-git-send-email-loic.poulain@linaro.org
> > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> >
> > What's the intention with this patch? Why is Mani the last S-o-b when
> > you're the one sending it and why is it sent only to linux-arm-msm@?
> 
> Actually the previous version of that patch has already been applied
> to mhi-next, but has been nacked as part of Mani's PR, so it's a quick
> follow-up fix to address the issue.
> 

Thanks, that makes sense.

> > And completely separate of the practical matters, is it true that qrtr
> > is the only client that use this pre-allocation feature?
> 
> yes.
> 

Then I think we should fix qrtr instead.

> > Would it be a net gain to simplify the core and add buffer allocation to qrtr instead?
> 
> Yes, I 100% agree, but I however would prefer to keep that for a
> follow-up series since this patch fixes a real issue for MHI/PCI
> modems (no inbound QRTR buffers allocated).
> 

I certainly don't mind this patch going upstream while we put such
refactoring in the backlog.

Thanks,
Bjorn
