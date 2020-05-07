Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBFE41C7E58
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2020 02:11:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726712AbgEGALD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 May 2020 20:11:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727869AbgEGALD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 May 2020 20:11:03 -0400
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com [IPv6:2607:f8b0:4864:20::a44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22418C061A10
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2020 17:11:03 -0700 (PDT)
Received: by mail-vk1-xa44.google.com with SMTP id p5so1169052vke.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2020 17:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GqsJ4w8SiNdYvs9i1O1oWTJDswwPt7gmDaN1Zm1BZ0o=;
        b=IirgN5uPNEkXVYW+TZDoNzKiLHCgEcf/Gvpo4Jq41Gwh+NhrB/yfrnGR3HodSUIUhd
         QZKBk14ylHtCo38AykpM4c/IUhnD2P4qVASnG0qtJtZwgUG2jSKcxJ7k5fsG4OSchZbg
         PKxQo8IGYwFPa5xgd73MGzlBnay+Myfz0dQKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GqsJ4w8SiNdYvs9i1O1oWTJDswwPt7gmDaN1Zm1BZ0o=;
        b=cqWx03uFFOiedu5isjNcVTUYYTVUR3A+BT05hN2p226fJ751M8gjLr8MfIbKJ9CDxz
         zFptpN34Y5N61UJdVH6EvzLENnYQ6VViIsVn7Ply2ox+6x4RtdifIG+Hkt1bcFvuGlW3
         BzEkp3tQZfRPVQI4qCQzX685pEC1psQGc1x1SP4euShOGyzgVDjUAhkvlIXkeIpe6IHR
         gsujfRDXcMRgg+YipCHReP/aIO/ApaDTYinxO7SQ6qe0i4BqxYqRgq9OyhO4mp6C8aFW
         h1mVgCS+topoTAzjDu+Xv2jqkFd5tMr8c0ROD8HM4ciIc1JKpHscm65BzSOjis99VZo2
         +q3A==
X-Gm-Message-State: AGi0PuZFM8joqljhOlDAsbUBWdldBx3VCcr648pKMUO1f2taz4I6yqD/
        IrDVqmYYngWMgQOGJl4onejrFG8REv8=
X-Google-Smtp-Source: APiQypL64sITD2o4NxXTQFWYpPwlETTf66dhySBsvI49JHaP7kV1UwWbiQoNbuzFhTbmN1FLd6EmbQ==
X-Received: by 2002:a1f:9b4f:: with SMTP id d76mr6176654vke.51.1588810261968;
        Wed, 06 May 2020 17:11:01 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id g29sm1799537uah.5.2020.05.06.17.11.01
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2020 17:11:01 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id w68so1036274vke.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2020 17:11:01 -0700 (PDT)
X-Received: by 2002:a1f:9605:: with SMTP id y5mr9318997vkd.75.1588810260347;
 Wed, 06 May 2020 17:11:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200423095531.9868-1-saiprakash.ranjan@codeaurora.org> <CAD=FV=W=d=KrTwgMOO-ukFc7ZhkE92qGYumUEDrtjmhQOpdWbg@mail.gmail.com>
In-Reply-To: <CAD=FV=W=d=KrTwgMOO-ukFc7ZhkE92qGYumUEDrtjmhQOpdWbg@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 6 May 2020 17:10:49 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U0Hhae3D1-P8kbcZafHeuqng11BNAbOb2YWPx+M7X5Gw@mail.gmail.com>
Message-ID: <CAD=FV=U0Hhae3D1-P8kbcZafHeuqng11BNAbOb2YWPx+M7X5Gw@mail.gmail.com>
Subject: Re: [PATCHv2] iommu/arm-smmu: Make remove callback message more informative
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Apr 23, 2020 at 7:35 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Thu, Apr 23, 2020 at 2:55 AM Sai Prakash Ranjan
> <saiprakash.ranjan@codeaurora.org> wrote:
> >
> > Currently on reboot/shutdown, the following messages are
> > displayed on the console as error messages before the
> > system reboots/shutdown as part of remove callback.
> >
> > On SC7180:
> >
> >   arm-smmu 15000000.iommu: removing device with active domains!
> >   arm-smmu 5040000.iommu: removing device with active domains!
> >
> > Make this error message more informative and less scary.
> >
> > Reported-by: Douglas Anderson <dianders@chromium.org>
> > Suggested-by: Robin Murphy <robin.murphy@arm.com>
> > Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> > ---
> >  drivers/iommu/arm-smmu.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Is this patch waiting on anything in particular now?  Do we need
reviews from Robin and/or Will?

-Doug
