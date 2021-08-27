Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B90D3F9C17
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Aug 2021 18:07:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245447AbhH0QH5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Aug 2021 12:07:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233083AbhH0QH5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Aug 2021 12:07:57 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A79F8C061757
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Aug 2021 09:07:08 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id i8-20020a056830402800b0051afc3e373aso8557880ots.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Aug 2021 09:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fUEHfseOkdznNlbkQ1G51BR6zh9XslS0V+ttU8mVS7g=;
        b=gvzCf9PVdB0Lz13FxF4rb2mk9py95UtMHrKZ1SXM1zeA3/IOO5zNkXnHD/GXyq+TWz
         xs2RC9jLCPu9rJBwut6Gkf4+bn4og8tMER2S/ZJxPf8ygSihp4PWjD2goN6EHjgV41Bi
         dtqKOu7ngEAcKhxx0qo+/aBFUmBa7l94yCcFeIoTSzXWoiGRT5NkqulWZvQKxSoUthy0
         /gQ9fRTHcc4jQniqFa+sgeFSJ0K3OJJqsDqJje2nPk+I0dyKhKISSM5vNkRI+ybXwhEJ
         xN3CGnR37nC5/IiXzij8Hx5EHZOCZalSnnqHaNoOYwhpt5wMzB+jbau18y748FPx1Z2J
         QTcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fUEHfseOkdznNlbkQ1G51BR6zh9XslS0V+ttU8mVS7g=;
        b=o62ddftCcti4P31S/FAB8fXGzRBAh+QCn+gNEwKnU7EfGqbl2m0HUlqoX+/FcqI5eN
         cVAe0faBBocf4s+4pxwTFmDvyi906+05okya3EsJSVBG4aRVCCJWHR+T7jpEYnDtq0Xy
         XbQFx4cctao72QQTnuceAXHjccPkQN6GqVsfX6SBtWX0/b5OIjERFWj8v1m7K3ycOWvb
         7Y0aXWSnJjmJgw1BZga2MSZDF/KWfbcz6vEBgWB8iOM0Alq/VVDoCW2Zd0225xdeLL3V
         i0Ij7twAtzTtjglZd5wnSy5dQGiOA0CTC0L/GtpNl/GzJKK1zz3SlotffafFaNt6qAsa
         wgbg==
X-Gm-Message-State: AOAM530hfssYJYn0VaJDyQcirrlhvxTl4RXhvTsJwx+j1jOuTNLgBL72
        i5t9bx3la/ckyQRxbG8KPSjg7A==
X-Google-Smtp-Source: ABdhPJyXLgl2mVPCXdPsWfmeHC88013RFZGHcVZasw9xKtvN+JTeLJ54xk8NUMMrDjuUclVcOlLlMA==
X-Received: by 2002:a05:6830:278b:: with SMTP id x11mr8406048otu.326.1630080427874;
        Fri, 27 Aug 2021 09:07:07 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id g62sm1469425oif.14.2021.08.27.09.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 09:07:07 -0700 (PDT)
Date:   Fri, 27 Aug 2021 11:07:05 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Shawn Guo <shawnguo@kernel.org>, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Siddharth Gupta <sidgup@codeaurora.org>
Subject: Re: [PATCH] soc: qcom: mdt_loader: Drop PT_LOAD check on hash segment
Message-ID: <YSkNqYHLBh4td0bG@builder.lan>
References: <20210824094109.7272-1-shawnguo@kernel.org>
 <0410695f-85fe-1df9-46ee-bc494b81bf23@somainline.org>
 <20210826141826.GB31229@dragon>
 <ed941f01-7855-006a-9eb9-29388b3be2f4@somainline.org>
 <20210827062359.GC31229@dragon>
 <3df9b523-4d8b-b817-f074-88e38456b35b@somainline.org>
 <20210827095716.GD31229@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210827095716.GD31229@dragon>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 27 Aug 04:57 CDT 2021, Shawn Guo wrote:

> On Fri, Aug 27, 2021 at 10:29:59AM +0200, Marijn Suijten wrote:
> > On 8/27/21 8:24 AM, Shawn Guo wrote:
[..]
> > > > 
> > > > For this quick solution to be valid I propose to reject PT_LOAD in the else
> > > > clause, and otherwise validate that phdrs[1].p_offset + hash_size <=
> > > > fw->size.
> > > 
> > > I'm not sure what you propose here are required for non-split firmware.
> > 
> > 
> > Would it help if I sent a patch based on yours, with this extra validation
> > and comments + commit message explaining the cases?
> > 
> > Alternatively we can try re-spinning the patches from Siddharth while taking
> > review comments, the possible .mdt == .b00 + . b01 packing, and my
> > suggestion to handle the headers generically into account.
> 
> I would suggest this path.  It's been 8 months, so Siddharth probably lost
> the interest here.  It's reasonable that someone picks up the work.
> 

Prior to 498b98e93900 ("soc: qcom: mdt_loader: Support loading non-split
images") we'd just blindly pass the entire .mdt into the SCM call.

So reading through your discussion and looking at the problem is that
I assumed (based on the firmware files I looked at) that the hash
segment is explicitly mentioned in the ELF header - i.e. segment 0 and 1
are not PT_LOAD and define the part that should be passed to init_image,
and that this may or may not be packed.

And the problem we have here is that we have the packed case, but the
hash segment isn't described explicitly in the ELF header.

> > 
> > > > The aforementioned patch series in qcom_mdt_bins_are_split (and certain
> > > > firmware files from Sony phones) show that it is also possible to read
> > > > PT_NULL headers from external files, as long as the header references a
> > > > range that is out of bounds of the mdt file.
> > > 
> > > It's been shown that hashes can be read from .mdt or hash segment, and
> > > independently the hash segment type could be PT_NULL or PT_LOAD.  With
> > > Siddharth's patch, instead of using the hash duplication in .mdt, hash
> > > will be read from hash segment.  But again, to resolve my problem, the
> > > assertion that hash segment type cannot be PT_LOAD has to be dropped.
> > > And that's the only thing my patch is doing.
> > 
> > Correct.  If I were to respin Siddharth's patchset, I'd write
> > qcom_mdt_read_metadata as follows:
> > 
> > 1. Find the header that contains QCOM_MDT_TYPE_HASH (allowing PT_NONE
> >    and PT_LOAD);
> > 2. If `ehdr_size + hash_size == fw->size`, this is split firmware and
> >    the mdt file can be used as-is for metadata;
> > 3. If the type is PT_LOAD, _or_ if the type is PT_NULL but
> >    `p_offset + p_filesz` does not fit inside the .mdt, this is (a
> >    variant of) split-firmware, and the hash needs to be loaded from an
> >    external file and appended to the ELF header.

I would expect that PT_LOAD denotes that the segment should be loaded
into the final firmware region and that the hash segment would be
PT_NULL regardless of being part of the .mdt, single .mbn or a separate
.bNN segment.

> > 4. If none of the above, this is a non-split firmware file.  Concatenate
> >    the ELF and hash headers by reading them directly from the firmware.
> 

I'm happy with this plan and I think Sid will be as well.

I hope that we can introduce a change that fixes Shawn's reported
problem first, so that can be backported to stable, and then add Sid's
need for loading the additional .bNN after that (same series is fine).

> Looks good to me.  I will be happy to review patches if you pick up the
> work.
> 

Thanks to the both of you for looking into this!

Regards,
Bjorn
