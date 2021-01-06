Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1A2D2EBE69
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jan 2021 14:18:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726006AbhAFNRH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jan 2021 08:17:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725788AbhAFNRD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jan 2021 08:17:03 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FAEDC06134C
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jan 2021 05:16:23 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id w1so2554730pjc.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jan 2021 05:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5Mr1TL3QnxH5ZCnL9EtPOB1aaiNZS4OJAbacVglrWEM=;
        b=mPdp4xmO5Yke/1xr7J5oyG3slZkKcrMqo9z5WWa02NfxDnDS2LllKBnX7OVGzRhOUg
         EKtGnrvljEPOezc475CAEo2nQIs65euIO8QrfUnpgt6ahFXtbJFq2JPb3/7Ao88uFjD4
         rCwM1rHg5/Tjs/6Tx5VVQdatAFnCCjP5nmpXHDEZMdOwJKdrHwmiTRx2xbfRuOK7koTA
         PTeMgrX1E3ibFDE8Jh/JbcyIeOWNNyFyQewcGVzWkZO168LPn7bwsTe7euWTUmSVuTKo
         kw0Kn3S1ISrVHiq/UNNLWHOHfS9Y+sl32jmxfKeTwjIc3ov+AiGdTKu+0NOWuNE8vyn8
         EO0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5Mr1TL3QnxH5ZCnL9EtPOB1aaiNZS4OJAbacVglrWEM=;
        b=c9GlxYR6e5wD3mbH6DBa0SHn9khF8BEIRKx+QXZxMFZ9Wq0AOvzmoVUbP1Tc0nclp9
         1490Fqp9Kfq1mTDN0bLH7iw59ikVz5N/2F8/n6aa1w+uoPCSKQ6bg1sRqaWIo0sUcLhy
         DTQACCSNz9VxObD/qN9giayj8jerebyuG7/OwWIt64jnhv/ZnjEJvxEkedllZUWyBxpb
         WNZWGo/pfCbeLFbuAyD/gPQ+ytvFN2M2cqURGJZnQDxMskrC52r+vqBGsDzJcDexQkx+
         RYp1J5GX9mUUT+vEgn2cCZfBeS1to+XATj2LFl+qSAVG1hkMc2/bNszPobqACh+QmshX
         +rJQ==
X-Gm-Message-State: AOAM533fpWbNbSwHo4455YWXTXU+FZD1rixgRlzpRnS+25cV5SBIs74+
        I5Pw2QX2AhUkjfswAwp2T/+m5vKMu8nr
X-Google-Smtp-Source: ABdhPJyae9pIeMPBViav/9bwd/cabYOXzWRdJIArLUCxDcwryStesBHPN2ZPMz8NtClZsMvuI96qNQ==
X-Received: by 2002:a17:902:8d97:b029:dc:313:ee70 with SMTP id v23-20020a1709028d97b02900dc0313ee70mr4125819plo.82.1609938982721;
        Wed, 06 Jan 2021 05:16:22 -0800 (PST)
Received: from thinkpad ([2409:4072:6102:e7a2:51f0:bf72:bf80:ec88])
        by smtp.gmail.com with ESMTPSA id 8sm2720179pfz.93.2021.01.06.05.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 05:16:21 -0800 (PST)
Date:   Wed, 6 Jan 2021 18:46:16 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     Hemant Kumar <hemantk@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] mhi: unconstify mhi_event_config
Message-ID: <20210106131616.GG3131@thinkpad>
References: <1609865076-13890-1-git-send-email-loic.poulain@linaro.org>
 <b8f16e9d-0d95-0122-12f6-2565d777e707@codeaurora.org>
 <CAMZdPi-m9WopviGqH+9XJdg7oi0wA4ASLkyXcqcBqrJdY_Oq8w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMZdPi-m9WopviGqH+9XJdg7oi0wA4ASLkyXcqcBqrJdY_Oq8w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jan 06, 2021 at 09:39:27AM +0100, Loic Poulain wrote:
> Hi Hemant,
> 
> On Wed, 6 Jan 2021 at 03:28, Hemant Kumar <hemantk@codeaurora.org> wrote:
> 
> > Hi Loic
> >
> > On 1/5/21 8:44 AM, Loic Poulain wrote:
> > > Some parameters may have to be determined at runtime.
> > > It is the case for the event ring MSI vector.
> > >
> > > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > > Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > ---
> > >   v2: no change
> > >
> > >   include/linux/mhi.h | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> > > index 62da830..48b1b2a 100644
> > > --- a/include/linux/mhi.h
> > > +++ b/include/linux/mhi.h
> > > @@ -290,7 +290,7 @@ struct mhi_controller_config {
> > >       u32 num_channels;
> > >       const struct mhi_channel_config *ch_cfg;
> > >       u32 num_events;
> > > -     const struct mhi_event_config *event_cfg;
> > > +     struct mhi_event_config *event_cfg;
> > commented on previous patch set, copying my comment here
> > Do we need to update mhi controller driver like ath11k and generic pci
> > driver to avoid compiler warnings?
> >
> 
> ath11k does declare its mhi_event_config as const so it should not cause
> any issue. mhi_pci_generic event config is modified in 2/2.
> 

Ath11k doesn't declare it as const. It might be an issue before but not now ;)

Thanks,
Mani

> Regards,
> Loic
