Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FF1E3F97B3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Aug 2021 11:57:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244492AbhH0J6Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Aug 2021 05:58:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233173AbhH0J6P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Aug 2021 05:58:15 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D9F7C061757
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Aug 2021 02:57:27 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id n18so5523387pgm.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Aug 2021 02:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tQhwZXH0EjZ7ZQtwV1VZAJdxt8GFo2fH5H1AITVAK3Q=;
        b=eX4ZA0SjuuC0kgI7+hUk4NVSxS862Is1FKSasbbxoigMF3ilBaD4LMUQgBLCWQc7xU
         3xazJ76eIM4Uld+wefCtKTHJNwK07Pp4uTq5d3LZEqWsS5H8Y9MT6KJamBHkKEy+FvVv
         B54zJDOWFdxERrRdRC/yc+kx0KNLidv7CHsuifI2ps+XaHyczhQuF1X1YMTjCZNsRTX1
         8FGAJFpKz+6aDaoHDj2dUxWxqhzZ+Y725hvB4YqQPX4wumoticqYsG/ndQYGVVY8o6Ul
         ktUdIWyPMoiUs5lZnVL9hdGC+2VOVo6dO8RkjUPlZ9/R52W6GHh20v5v/SYXsm1Y8/nZ
         e7TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tQhwZXH0EjZ7ZQtwV1VZAJdxt8GFo2fH5H1AITVAK3Q=;
        b=ebPKJrvrbjTEXBFY/XUSKeQ+xV+18fS5r1XudXs2Grqvaqc0aPuo/c2UhPOz2CNxu6
         PJfueGeez+P9xjh7VWGHhKuG++mNSBRtCPLzMn3HT6Hf/bT91stMfEwjJmiNhkl8oRAF
         tkbBV1HjsIMMTH6muIqWqWonjBQKGq++UwdJdRzw3Ta+zxr7I0zDTOi5ZX+xVD7LWUN3
         p7rk+u0RHA3m3AdYbDY/RCnlwiwLOx5iSVqHitf4C/3fg9NGkhpAM90HvmF6Fbr4wxjq
         df4GNjqc3P3OyuEQZ0bQtz7oIZIsXwLQdVCYeL2FPMxgGS3foo2kS6Fnz5uVFN+0JP63
         pADA==
X-Gm-Message-State: AOAM530A1/sDejUk8tYkOUjVHToTzQhbKl8HlS7ry/e1aexwja5q/7kc
        tQn3nkIMaxYCfYxBAcD9uKqf7Q==
X-Google-Smtp-Source: ABdhPJy19zzyFZS8QJf658o8cXweo93TpTzhaDW/1/riIgydVBikAZNycQF++2M3azBN4g9WXfxbXg==
X-Received: by 2002:a05:6a00:10cb:b029:3c6:8cc9:5098 with SMTP id d11-20020a056a0010cbb02903c68cc95098mr8472435pfu.41.1630058246365;
        Fri, 27 Aug 2021 02:57:26 -0700 (PDT)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id d22sm5790643pfq.158.2021.08.27.02.57.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Aug 2021 02:57:26 -0700 (PDT)
Date:   Fri, 27 Aug 2021 17:57:19 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Siddharth Gupta <sidgup@codeaurora.org>
Subject: Re: [PATCH] soc: qcom: mdt_loader: Drop PT_LOAD check on hash segment
Message-ID: <20210827095716.GD31229@dragon>
References: <20210824094109.7272-1-shawnguo@kernel.org>
 <0410695f-85fe-1df9-46ee-bc494b81bf23@somainline.org>
 <20210826141826.GB31229@dragon>
 <ed941f01-7855-006a-9eb9-29388b3be2f4@somainline.org>
 <20210827062359.GC31229@dragon>
 <3df9b523-4d8b-b817-f074-88e38456b35b@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3df9b523-4d8b-b817-f074-88e38456b35b@somainline.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Aug 27, 2021 at 10:29:59AM +0200, Marijn Suijten wrote:
> Hi Shawn,
> 
> On 8/27/21 8:24 AM, Shawn Guo wrote:
> > > [..]
> > > It's not up to me to choose between a thorough or quick solution,
> > 
> > To be clear, Siddharth's series doesn't resolve my problem, as the
> > assumption that hash segment type cannot be PT_LOAD is still there.
> > I have to add the following change on top to fix my problem.
> > 
> > @@ -126,8 +126,7 @@ void *qcom_mdt_read_metadata(struct device *dev, const struct firmware *fw, cons
> >                  return ERR_PTR(-EINVAL);
> >          for (hash_index = 1; hash_index < ehdr->e_phnum; hash_index++) {
> > -               if (phdrs[hash_index].p_type != PT_LOAD &&
> > -                  (phdrs[hash_index].p_flags & QCOM_MDT_TYPE_MASK) == QCOM_MDT_TYPE_HASH)
> > +               if ((phdrs[hash_index].p_flags & QCOM_MDT_TYPE_MASK) == QCOM_MDT_TYPE_HASH)
> >                          break;
> >          }
> >          if (hash_index >= ehdr->e_phnum)
> 
> 
> Patch 3/3 allows the hash segment to be read from an external file and
> should indeed get rid of this comparison, as external file loading is
> possible with PT_NULL and required with PT_LOAD.  I'd go as far as moving
> the check into the if, next to qcom_mdt_bins_are_split:
> 
>  if (phdrs[hash_index].p_type == PT_LOAD || qcom_mdt_bins_are_split(fw))
> 
> Unfortunately it seems this patchset lost optimization for the packed
> `ehdr_size + hash_size == fw->size` case, where the hash segment is already
> available in the loaded mbt.
> 
> > That said, my patch is merely to break the assumption that hash segment
> > type cannot be PT_LOAD, and it's really orthogonal to Siddharth's
> > series.
> 
> 
> It is fine - correct even - to break that assumption, but it should go with
> extra validation that we are dealing with packed mdt instead.
> 
> > > but this
> > > patch seems to open up the possibility for an out-of-bounds read. The
> > > assertion was placed in this function for a reason after all.
> > 
> > I would much appreciate it if someone helps to elaborate the reason.
> 
> 
> PT_LOAD specifies that the segment is to be loaded externally.  The fact
> that our .mdt file is a tight pack of b00 + b01 is mere convenience, but is
> it also a given for the future?  Can we rely on this assumption to never
> change?

My patch is trying to fix an existing issue, not anything for the
future.

> 
> > > > There is a blog[1] illustrating the situation quite nicely.  Again, the
> > > > only thing my WCNSS firmware differs from the illustration is that
> > > > hash segment gets a PT_LOAD type.
> > > 
> > > 
> > > Yes, that blog post nicely explains the format but it doesn't cover that the
> > > hash is encoded in the second program header nor that it can be copied to be
> > > packed tightly against the ELF header?  Maybe that only applies to newer
> > > formats?
> > 
> > Hmm, it does cover the things.  It's been illustrated that .mdt is
> > simply a concatenating of .b00 and .b01.  The .b00 includes ELF header
> > and program headers, while .b01 is just hash segment.
> > 
> > $ cat wcnss.b00 wcnss.b01 > wcnss.b00_b01
> > $ cmp wcnss.b00_b01 wcnss.mdt
> > $
> > 
> > That said, .mdt = ELF header + program headers + hash
> 
> 
> Ack, there's one picture halfway demonstrating the `ehdr_size + hash_size ==
> fw->size` case.
> 
> > > > Skipping the check will not cause problem for firmwares we have seen,
> > > > because hash segment is duplicated in .mdt file, and we are using that
> > > > duplication instead of reading from .b01 file.
> > > 
> > > 
> > > Can you share some more details about the firmware file you're using: size
> > > and the program headers as shown by `readelf -l`?
> > 
> > $ readelf -l wcnss.mdt
> > 
> > Elf file type is EXEC (Executable file)
> > Entry point 0x8b6018d4
> > There are 12 program headers, starting at offset 52
> > 
> > Program Headers:
> >    Type           Offset   VirtAddr   PhysAddr   FileSiz MemSiz  Flg Align
> >    NULL           0x000000 0x00000000 0x00000000 0x001b4 0x00000     0
> >    LOAD           0x001000 0x8bbe0000 0x8bbe0000 0x00c58 0x02000     0x1000
> >    LOAD           0x003000 0x8b600000 0x8b600000 0x03308 0x03438 RWE 0x100000
> >    LOAD           0x00afcc 0x8b604000 0x8b604000 0x00000 0x08000 RW  0x4000
> >    LOAD           0x00afcc 0x8b60c000 0x8b60c000 0x0f000 0x0f000 RW  0x4
> >    LOAD           0x019fcc 0x8b61b000 0x8b61b000 0x00000 0x0e000 RW  0x4
> >    LOAD           0x019fcc 0x8b629000 0x8b629000 0x32eb04 0x4c2b10 RWE 0x80
> >    LOAD           0x348ad0 0x8baebb80 0x8baebb80 0x00000 0x37cf8 RW  0x8
> >    LOAD           0x348ad0 0x8baebb80 0x8baebb80 0x00000 0x21c44 RW  0x4
> >    LOAD           0x348ad0 0x8bb30000 0x8bb30000 0x00034 0x001a8 RW  0x8
> >    LOAD           0x349fcc 0x8bb31000 0x8bb31000 0xa0000 0xa0000 RW  0x1000
> >    LOAD           0x3e9fcc 0x8bbd1000 0x8bbd1000 0x0ac3c 0x0ee00 RWE 0x1000
> > 
> > > If possible, can you also
> > > validate whether QCOM_MDT_TYPE_HASH is set in phdrs[1].p_flags &
> > > QCOM_MDT_TYPE_MASK (using something like GNU poke)?
> > 
> > It is set, otherwise the QCOM_MDT_TYPE_HASH check in
> > qcom_mdt_read_metadata() will just fail.  To be clear, everything works
> > fine for me, as long as I drop the check of (phdrs[1].p_type == PT_LOAD).
> 
> 
> Thanks, this all checks out and is similar to what I'm seeing here.  It all
> comes down to the mdt packing b00 and b01 tightly together already.
> 
> > > All the files I'm able to test adhere to `/* Is the header and hash already
> > > packed */`: `ehdr_size + hash_size == fw->size` (meaning the file solely
> > > consists of a tightly packed ELF header and hash signature)
> > 
> > Yeah, my wcnss firmware is same here.  Actually, all split firmwares I
> > have seen are this case.  But bear it in mind there are non-split
> > firmware like a single .mbn file.  My understanding is that condition
> > (ehdr_size + hash_size == fw->size) is being used to check whether it's
> > a split firmware or non-split one.
> 
> 
> Is it unreasonable to assume that more configurations besides split and
> non-split firmware might occur in the future (or are already out in the
> wild)?  These program headers allow for a variety of configurations which we
> should - in my opinion - parse and handle in a generic manner.  `ehdr_size +
> hash_size == fw->size` is convenient to have, but not something we should
> rely on.
> 
> > > but I won't be
> > > surprised if there are firmware files out in the wild with different headers
> > > or the hash missing, otherwise the else clause wouldn't exist.
> > > This else clause causes a read starting at fw->data + phdrs[1].p_offset of
> > > phdrs[1].p_filesz bytes which is almost certainly out of bounds if the
> > > program header type is PT_LOAD instead of PT_NONE, otherwise it wouldn't
> > > need to be loaded from a .bXX file in the first place.
> > 
> > So the else clause is there to handle non-split firmware, which has
> > everything within fw->size.
> 
> 
> Is it too much to ask for extra validation here, instead of always assuming
> either "split" or "non-split" firmware?  As mentioned before these program
> headers allow for a variety of configurations, which is confirmed by
> Siddharth's first patch looking for QCOM_MDT_TYPE_HASH in all headers
> instead of assuming it to reside in the second.
> 
> > > 
> > > For this quick solution to be valid I propose to reject PT_LOAD in the else
> > > clause, and otherwise validate that phdrs[1].p_offset + hash_size <=
> > > fw->size.
> > 
> > I'm not sure what you propose here are required for non-split firmware.
> 
> 
> Would it help if I sent a patch based on yours, with this extra validation
> and comments + commit message explaining the cases?
> 
> Alternatively we can try re-spinning the patches from Siddharth while taking
> review comments, the possible .mdt == .b00 + . b01 packing, and my
> suggestion to handle the headers generically into account.

I would suggest this path.  It's been 8 months, so Siddharth probably lost
the interest here.  It's reasonable that someone picks up the work.

> 
> > > The aforementioned patch series in qcom_mdt_bins_are_split (and certain
> > > firmware files from Sony phones) show that it is also possible to read
> > > PT_NULL headers from external files, as long as the header references a
> > > range that is out of bounds of the mdt file.
> > 
> > It's been shown that hashes can be read from .mdt or hash segment, and
> > independently the hash segment type could be PT_NULL or PT_LOAD.  With
> > Siddharth's patch, instead of using the hash duplication in .mdt, hash
> > will be read from hash segment.  But again, to resolve my problem, the
> > assertion that hash segment type cannot be PT_LOAD has to be dropped.
> > And that's the only thing my patch is doing.
> 
> Correct.  If I were to respin Siddharth's patchset, I'd write
> qcom_mdt_read_metadata as follows:
> 
> 1. Find the header that contains QCOM_MDT_TYPE_HASH (allowing PT_NONE
>    and PT_LOAD);
> 2. If `ehdr_size + hash_size == fw->size`, this is split firmware and
>    the mdt file can be used as-is for metadata;
> 3. If the type is PT_LOAD, _or_ if the type is PT_NULL but
>    `p_offset + p_filesz` does not fit inside the .mdt, this is (a
>    variant of) split-firmware, and the hash needs to be loaded from an
>    external file and appended to the ELF header.
> 4. If none of the above, this is a non-split firmware file.  Concatenate
>    the ELF and hash headers by reading them directly from the firmware.

Looks good to me.  I will be happy to review patches if you pick up the
work.

Shawn
