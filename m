Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A2F83241DC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Feb 2021 17:19:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233383AbhBXQOD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Feb 2021 11:14:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234717AbhBXP7f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Feb 2021 10:59:35 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 112E6C06174A
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Feb 2021 07:58:53 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id a24so1426551plm.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Feb 2021 07:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=rtWJKbzVZIPHzIALjaxF691HrwljObBoamtutHjoveQ=;
        b=w2j6YI435I/oGZtY1rcbUSxt1cFZ77IE75fgu2lg11eSTHFhBjQRr1/8qZzqNimUvY
         2a7nthsB7mTH6js1i60hmvV9HJr4Lvw3YTRlScpCnV6NdW1jL+5vCHtE1K1lDmxJ1BjF
         877i8bxQL3YJlH62Mn2QjjgMOrlkU+oFIQSUjq1Psm+mvIbucaqqqvMsxB/QDBkcGjjR
         IaNUMKVHeecdETPg1sBlQcWi824ZIP6wt3S5AKI/qnyYyiP8SQ+kAA8N8JbIcBM/+iLX
         ataq7TWQMiict6rGeZ+53bmfKfGdYV3Ogf158rPJKmhxdf1Hyg9X+nkCLfOcKtrpYNbB
         d/Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rtWJKbzVZIPHzIALjaxF691HrwljObBoamtutHjoveQ=;
        b=b9uKwr1qgR4pkgak+/1cUY8aWCbeYQ8hepDTCL/Sb91JkfmeEwIsaQ1q9277n+M3ph
         XxcvoGd9qpZ7sNYdbhnvjcDEvsEZRCKgmU7jCaGbVXrmUZuSazPHRhPX36JMgcSKNnv/
         17Aat+CxLfMeCMpoYyEwJhFKc1Bkr4FfW6WovefI4EiptlVu4ElxWxL/ErjRxebEjc7e
         /s8pNkw2KvYfsF0ymyax0f7wsXZT6XHsjYITxky0M5QmKqNAVtOkiffWtLo+kk1zV7sN
         9h6m9+9XRgwe4xR4PRDDs6PtNH3MsHc/5VCBRKVE0qulEv5hROHoxjjFjQd9KWiGaT6p
         eFlQ==
X-Gm-Message-State: AOAM532H8kOzZAO5GCICULIkKt5MZL7GBb3zVLqoakkYx9kO7+YG2uub
        u53Irs1BOeE/B9yAAEm5yAi0ixBqzDn/
X-Google-Smtp-Source: ABdhPJwPHB7YornvtsOFDkXpoF32hxV9KPtqRuwyOAYoWGXpUvlCQJFwhOheOgcrz+ZZOHSIrYCq1w==
X-Received: by 2002:a17:902:a3cb:b029:e3:23b7:ef2f with SMTP id q11-20020a170902a3cbb02900e323b7ef2fmr33428089plb.44.1614182332447;
        Wed, 24 Feb 2021 07:58:52 -0800 (PST)
Received: from work ([103.66.79.25])
        by smtp.gmail.com with ESMTPSA id d27sm3282934pfq.40.2021.02.24.07.58.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Feb 2021 07:58:51 -0800 (PST)
Date:   Wed, 24 Feb 2021 21:28:48 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] bus: mhi: core: Check state before processing
 power_down
Message-ID: <20210224155848.GX27945@work>
References: <1613580211-22744-1-git-send-email-jhugo@codeaurora.org>
 <20210224095504.GQ27945@work>
 <c67dac35-49d8-212f-824d-5ba52513ac8a@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c67dac35-49d8-212f-824d-5ba52513ac8a@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Feb 24, 2021 at 08:14:53AM -0700, Jeffrey Hugo wrote:
> On 2/24/2021 2:55 AM, Manivannan Sadhasivam wrote:
> > On Wed, Feb 17, 2021 at 09:43:31AM -0700, Jeffrey Hugo wrote:
> > > We cannot process a power_down if the power state is DISABLED.  There is
> > > no valid mhi_ctxt in that case, so attepting to process the power_down
> > > will likely result in a null pointer dereference.  If the power state is
> > > DISABLED, there is nothing to do anyways, so just bail early.
> > > 
> > > Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> > > ---
> > > 
> > > v2: Fix subject and tweak the locking to avoid needless lock/unlock/relock
> > > 
> > >   drivers/bus/mhi/core/pm.c | 9 ++++++++-
> > >   1 file changed, 8 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> > > index 56ba3ab..47f6621 100644
> > > --- a/drivers/bus/mhi/core/pm.c
> > > +++ b/drivers/bus/mhi/core/pm.c
> > > @@ -1144,6 +1144,7 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
> > >   		mhi_deinit_dev_ctxt(mhi_cntrl);
> > >   error_dev_ctxt:
> > > +	mhi_cntrl->pm_state = MHI_PM_DISABLE;
> > >   	mutex_unlock(&mhi_cntrl->pm_mutex);
> > >   	return ret;
> > > @@ -1155,11 +1156,17 @@ void mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful)
> > >   	enum mhi_pm_state cur_state, transition_state;
> > >   	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> > > +	mutex_lock(&mhi_cntrl->pm_mutex);
> > > +	cur_state = mhi_cntrl->pm_state;
> > 
> > As I said in my previous review, you should use pm_lock for reading the
> > pm_state.
> 
> You also said on IRC that is a refactor of the entire driver, and not a
> blocker for this fix.  Based on that, I intrepreted your comments as nothing
> needed to be done regarding the locking, so I'm confused by this comment.
> 
> I'm not entirely sure what you want since I feel like you are giving
> conflicting direction, but I'm guessing you want the lock of the pm_lock to
> be moved up to just under the mutex lock then?
> 

Yes, that's what my intention is. Sorry if I confused you.

Thanks,
Mani

> -- 
> Jeffrey Hugo
> Qualcomm Technologies, Inc. is a member of the
> Code Aurora Forum, a Linux Foundation Collaborative Project.
