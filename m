Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F9FA3042D9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jan 2021 16:47:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391541AbhAZPpe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jan 2021 10:45:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391908AbhAZPnb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Jan 2021 10:43:31 -0500
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AC36C0698C0
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jan 2021 07:42:51 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id n10so11651954pgl.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jan 2021 07:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ncmDJ68LDAWGkThxmEqJx8RH/Iz+CIH9uZm9OmJVrJA=;
        b=DiYM45UvYl57ZNe9Tn+LfR8CPVxag36gJh8uxi3TK4FMrwm9MkOrVk+4xerXzw2Nve
         pHI6NXyUjF0BnwFohfWjBkvjdsAhEfSr3tghQV+cwY+kDQFUkH/Ru8cpmv/rjDY2qXaG
         epAlr4IAMkNUGSFuwQvWWUbOPA1XdvW1hZwGGdX8A0DjvhGFN9JZgoW2/NJQVcgzhLRC
         ItTKCAsYL78FCDCZFLAX0C1CRg9B2xTCBmOWD6D80mplm4cV5WasNlpogdejVCVxNU/L
         E61r0HyD1Ipqn23Xp5pI3qUA4wJNAjQkAyh+zyUGC/uc/fqsxqbvWcgDrExqEnxM4uFE
         NUiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ncmDJ68LDAWGkThxmEqJx8RH/Iz+CIH9uZm9OmJVrJA=;
        b=AwAYSbJXRZQoqV03XAmQyRgOul3fng8aVydZgaz22Y4MhFyplybNIiLT5Na4smB/lf
         nDwPKKqhhOiS74WUl/0HC7na6NIv85Q0J/LAb2vYPPXT8xrFiYBILIjrzGYsq/3n2N/G
         IKh2CRTvNt8UCHH5TiDmu+ikWl3woF4jqsBEqhCwp7z+c30eSgQ364YjXJFKfRfQuc4V
         AUvhsntmddpt6r9cryDiHuN8dw/M69Cj6+AW7D2xkz0wsudEdud0nahjIRmnz8CjQUwx
         73ROpBRYdOLjCFP9UoJ7tKUMG8GIlWQ9Xj7aJ8gNbtX6UAza6SDU/K1rqDxadEpxMRtq
         pkTQ==
X-Gm-Message-State: AOAM5324o4o5f5pY7//BawpfzWAHR08ui0lmlUt0Hcl7ymvXMuWihTly
        oJBJaDiUCTJgIkdw+WXVhNBoo+wZeKvT
X-Google-Smtp-Source: ABdhPJzHK/ein4ssvfyWWKrPolLlt2P/WTA6QFF9GDoPKbSBKsC+AG5ViuVclI03U436RiufrvbD+w==
X-Received: by 2002:a63:e049:: with SMTP id n9mr6191385pgj.339.1611675770575;
        Tue, 26 Jan 2021 07:42:50 -0800 (PST)
Received: from thinkpad ([2409:4072:6d84:5293:c96f:fa31:6124:85e6])
        by smtp.gmail.com with ESMTPSA id n12sm18353963pff.29.2021.01.26.07.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 07:42:49 -0800 (PST)
Date:   Tue, 26 Jan 2021 21:12:42 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Kalle Valo <kvalo@codeaurora.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        Carl Huang <cjhuang@codeaurora.org>,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mhi: use irq_flags if controller driver configures it
Message-ID: <20210126154242.GA29751@thinkpad>
References: <20210104101128.8217-1-cjhuang@codeaurora.org>
 <20210104170359.GE2256@work>
 <87o8hti8t8.fsf@codeaurora.org>
 <20210121075242.GB30041@thinkpad>
 <87k0s0atub.fsf@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87k0s0atub.fsf@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jan 26, 2021 at 12:14:04PM +0200, Kalle Valo wrote:
> Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:
> 
> > On Wed, Jan 13, 2021 at 09:40:19AM +0200, Kalle Valo wrote:
> >> Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:
> >> 

[...]

> >> > Applied to mhi-next!
> >> 
> >> Would it be possible again to have an immutable branch for this commit?
> >> We need it for implementing one MHI support to ath11k[1] required by
> >> Dell XPS 13 9310 laptops, which a lot of people are waiting. Otherwise I
> >> can only apply the feature for v5.13, which will be released on July.
> >> 
> >
> > Dropped this patch from mhi-next and applied to mhi-ath11k-immutable branch:
> > https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git/log/?h=mhi-ath11k-immutable
> >
> > This branch will also be merged into mhi-next.
> 
> Thanks a lot!
> 
> And Greg will also pull this directly so that commit ids won't change?
> Just trying to avoid conflicts between ath and mhi trees as much as
> possible.
> 

Yes, I'm gonna send a PR to Greg this time also!

Thanks,
Mani

> -- 
> https://patchwork.kernel.org/project/linux-wireless/list/
> 
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
