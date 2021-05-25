Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05A1838F8C2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 May 2021 05:28:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230138AbhEYD3n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 May 2021 23:29:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229837AbhEYD3n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 May 2021 23:29:43 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BA30C061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 May 2021 20:28:13 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id c3so29009964oic.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 May 2021 20:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yd7WNrW5RgCRq69GG/t641RhzJb1+O9rCNuKEDYZ+UQ=;
        b=Qihz9q4ulhPC5+jW95HZeqBMuDCzCUu5BXI2aHGC/4iIT85jOP8Merwq+BoCPrrNFl
         MlvM+x81c5n+TIyIs8D1H+nQNU4q7QNzAI9dT25HByHl0DudUzzbP+m5k87rrr5Q9E2V
         v5XqwFV+m63TDEQPDv/hWb6ymRQnjJEmWX8UxwOq4fEA9/YflwcPI6/SYvL1XfI9wKyu
         MX7xrQyiZQxJU57vhRcGOGin7qf+2ErXPVy3Bvl/TmpmCk08rHdDvK3HHWdT5SKcFbKm
         Ngd5FveLSInfBtCMCRZDjCg1lBKeJGBrXkut5dcay1LhdzWu9x3oZnPqKeQ4HaT3Jee2
         3LvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yd7WNrW5RgCRq69GG/t641RhzJb1+O9rCNuKEDYZ+UQ=;
        b=DuJY60axxGo4asADP6TRDAlq4DNRLjikD8hIpxsgaIOTbdQs+aUBozj+qVEOae2NAf
         BAGJgBJS19IPtSnZuPdHsSPxiq50e6mRtOp17UvTk7kPkSs1b1bVLyhNVHUufrfp7IDM
         AFpDEFbgTGaiJ/0GH3UOLeHhHmG1Tu20/a+XnIkYk7cG8MRYcdIsCY7s93TC22qMkYKi
         GcNICWrmwbHAxVLn/UhGPn0apukq6CP6/Gp+NOwrKE6UVeLTDnfbqQX7qZyqy18Gbxpn
         gjM0nGAXWVZcCZVWLovZI71W/9ubaizw1oQtSZgFyhHtbWHIQB3XnImzdNcjOnWtlRNY
         C9bQ==
X-Gm-Message-State: AOAM531sCchtNlsMK+mhzizP4qubmyDYhJYf9FDl/yeteX+8bsqb6nDC
        xuSTypjianjDi0TL3HOuGVNvwg==
X-Google-Smtp-Source: ABdhPJwKviMyrxlplBS0akvECPGFTv+lWWT2whiGwA05wk4Af21kzQrXyzWmMbn4Mo/QH1n2F7KL+Q==
X-Received: by 2002:aca:4e8c:: with SMTP id c134mr1436989oib.169.1621913292614;
        Mon, 24 May 2021 20:28:12 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id c19sm2990438oiw.7.2021.05.24.20.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 20:28:12 -0700 (PDT)
Date:   Mon, 24 May 2021 22:28:10 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        iommu@lists.linux-foundation.org,
        open list <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Patrick Daly <pdaly@codeaurora.org>,
        Pratik Patel <pratikp@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH 0/3] iommu/arm-smmu: Qualcomm bootsplash/efifb
Message-ID: <YKxuynamQBTrNksO@yoga>
References: <20191226221709.3844244-1-bjorn.andersson@linaro.org>
 <20200108091641.GA15147@willie-the-truck>
 <CAF2Aj3iKk2LSA5XC76pNiLV8a76BkibUitof-dix8rqkc0qiow@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF2Aj3iKk2LSA5XC76pNiLV8a76BkibUitof-dix8rqkc0qiow@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 24 May 07:03 CDT 2021, Lee Jones wrote:

> On Wed, 8 Jan 2020 at 09:16, Will Deacon <will@kernel.org> wrote:
> 
> > On Thu, Dec 26, 2019 at 02:17:06PM -0800, Bjorn Andersson wrote:
> > > These patches implements the stream mapping inheritance that's necessary
> > in
> > > order to not hit a security violation as the display hardware looses its
> > stream
> > > mapping during initialization of arm-smmu in various Qualcomm platforms.
> > >
> > > This was previously posted as an RFC [1], changes since then involves the
> > > rebase and migration of the read-back code to the Qualcomm specific
> > > implementation, the mapping is maintained indefinitely - to handle probe
> > > deferring clients - and rewritten commit messages.
> >
> > I don't think we should solve this in a Qualcomm-specific manner. Please
> > can
> > you take a look at the proposal from Thierry [1] and see whether or not it
> > works for you?
> >
> 
> Did this or Thierry's solution ever gain traction?
> 

There was a few pieces that landed in the common code which allowed us
to deal with the quirks of the Qualcomm platform (turned out that just
reading back the settings wasn't the only piece necessary).

The "generic" solution is essentially the second half of
qcom_smmu_cfg_probe(), which ensures that as the SMMU is reset it will
do so with bypass mappings for all stream mappings the boot loader left
us.

> Or are all the parties still 'solving' this downstream?
> 

I believe that Qualcomm has adopted the upstream solution in their
downstream kernel.

Regards,
Bjorn
