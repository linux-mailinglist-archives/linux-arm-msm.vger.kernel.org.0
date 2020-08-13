Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF7F2243D59
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Aug 2020 18:27:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726647AbgHMQ1X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Aug 2020 12:27:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726305AbgHMQ1T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Aug 2020 12:27:19 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51373C061757;
        Thu, 13 Aug 2020 09:27:17 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id f7so5870543wrw.1;
        Thu, 13 Aug 2020 09:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i8A41jTFfKzD80jObOhia7RlfQfORZCQM0sSroioat0=;
        b=ltF5tFROgFAZgA5ykWdfcsD7a6IqKI1lHnkqk0uW8c1mUO/qzVluK8J1t8jmVU4Job
         +Vtmoin3OAPiYr73l3JEOUZ2gUWG37ta+25nQ1mYsZAe1/7npia4seT0uQnwwQMEYozf
         HfIw62D1Rw2pf0hw8IK2fApNoBdewGrJ4hMkkeVIkyeLNEO+zqe9XwTT+LvaIITCC1xv
         1xyi8enK2pWVuiyvYNl+LV1Nbe+j4UkavqT8Slf48jxAMw7lbGS2y6k/TeSnT1m1qkQ8
         UbQwWVqGIXGph/HTTeOyWh4MAQje6Nxo0grB6X9N0p8EBYF4hrSCRZEs/R2Kdx8WoFc6
         EwDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i8A41jTFfKzD80jObOhia7RlfQfORZCQM0sSroioat0=;
        b=OJEnCfX1qB+tPDyagMonbbiHo0L9fiRGfLV9a3korVj+Lb6e3mPlRzHWuaSlMf3BPa
         lwOtLb2wP+cD4PTK0gHuEmGJJMgVZ9WNUAqpggJhu7HbiWxKAEiRLTUHbp21frbFR5ew
         yEYKZ8aTUxjiZYINdikKKDmbSkGPDLJ/P9eYKfLM3llKyxCfYQ472wN0dH8eDaZ7Wmjz
         7n5Zu/FL3rE45Eivm9HvsGZ1e7W1DJuLTq+1x1icr4zPKv9ULtnIHyOv7yT+AuBblHB6
         iTsBOMXeczy80aXEUL6iIDbOi9EzhVitda6BYRmBridC9vobC+IL8sfQoDmU7fcpHAu3
         /t2Q==
X-Gm-Message-State: AOAM5317qqZz3Psd/aHx7nfw9sGos3wCrtsi6lMccVhTiMtRA7YRR5P7
        Y0+yI0N7VItttgdNYU3sT7sXxf2R7XhwTb3/D7k=
X-Google-Smtp-Source: ABdhPJzH/J7FP/7qCdkL8eeSCxCr1qpeQTRxwqPrMBjocRjU8savD+CGNSock5FfU9Bf2OHfq/Jig6M1BNJ0N1f/Sso=
X-Received: by 2002:a5d:4a8a:: with SMTP id o10mr4512119wrq.327.1597336036448;
 Thu, 13 Aug 2020 09:27:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
 <20200810222657.1841322-5-jcrouse@codeaurora.org> <20200813131412.GB10256@willie-the-truck>
 <CAF6AEGuCubnXu7FKuCHPx0Bow4O7M8NSBThHDusev7xX6v2zQQ@mail.gmail.com> <20200813151934.GA10534@willie-the-truck>
In-Reply-To: <20200813151934.GA10534@willie-the-truck>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 13 Aug 2020 09:28:02 -0700
Message-ID: <CAF6AEGsfP14bJzdJP70YonM6J00+PAZVk2neURT3rb2+PcRNDg@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v12 04/13] iommu: Add a domain attribute to
 get/set a pagetable configuration
To:     Will Deacon <will@kernel.org>
Cc:     Jordan Crouse <jcrouse@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Joerg Roedel <joro@8bytes.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 13, 2020 at 8:19 AM Will Deacon <will@kernel.org> wrote:
>
> On Thu, Aug 13, 2020 at 08:11:02AM -0700, Rob Clark wrote:
> > On Thu, Aug 13, 2020 at 6:14 AM Will Deacon <will@kernel.org> wrote:
> > >
> > > On Mon, Aug 10, 2020 at 04:26:48PM -0600, Jordan Crouse wrote:
> > > > Add domain attribute DOMAIN_ATTR_PGTABLE_CFG. This will be used by
> > > > arm-smmu to share the current pagetable configuration with the
> > > > leaf driver and to allow the leaf driver to set up a new pagetable
> > > > configuration under certain circumstances.
> > > >
> > > > Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> > > > ---
> > > >
> > > >  include/linux/iommu.h | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> > > > index fee209efb756..995ab8c47ef2 100644
> > > > --- a/include/linux/iommu.h
> > > > +++ b/include/linux/iommu.h
> > > > @@ -118,6 +118,7 @@ enum iommu_attr {
> > > >       DOMAIN_ATTR_FSL_PAMUV1,
> > > >       DOMAIN_ATTR_NESTING,    /* two stages of translation */
> > > >       DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE,
> > > > +     DOMAIN_ATTR_PGTABLE_CFG,
> > > >       DOMAIN_ATTR_MAX,
> > > >  };
> > >
> > > Nobody other than the adreno gpu uses this, so can we avoid exposing it
> > > in the IOMMU API, please? Given that you have a reference to the adreno
> > > GPU device in the SMMU implementation code thanks to .alloc_context_bank(),
> > > can you squirrel some function pointers away in the driver data (i.e. with
> > > dev_set_drvdata()) instead?
> > >
> >
> > Hmm, we are already using drvdata on the gpu side, and it looks like
> > arm-smmu is also using it.  Could we get away with stashing an extra
> > 'void *' in iommu_domain itself?
>
> What I meant was, expose the type of whatever you put in there on the GPU
> side so that the SMMU impl can install its function pointers into a field of
> that structure. As far as I'm concerned, the SMMU impl code and the GPU
> driver are the same entity and we should keep their communication private,
> rather than expose it up the stack. After all, the GPU writes to the SMMU
> registers!
>
> If you really don't want to expose all of your gubbins, I suppose you
> could have a structure just for the SMMU view and container_of() out of
> that on the GPU side.

yeah, msm_gpu has a lot of internal state.. but I suppose we could
define a 'struct adreno_smmu_priv' and embed that in msm_gpu, and
throw in a get_gpu_drvdata() type wrapper for get_drvdata() to make
this not totally horrible in the various cases places that use
get_drvdata() currently.

BR,
-R
