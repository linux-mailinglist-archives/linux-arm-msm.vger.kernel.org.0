Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 863643FA11D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Aug 2021 23:23:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231913AbhH0VYh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Aug 2021 17:24:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231908AbhH0VYh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Aug 2021 17:24:37 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 393F9C0613D9
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Aug 2021 14:23:48 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id h133so11318348oib.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Aug 2021 14:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VpB0gGbRJAvAKaFcacPtNf/jL/QtM2ovfZ2Xqo3yMXw=;
        b=xQ3rkkYDG9zgNNqeXFpsW1BgS/vjS9N58M7BciKN2ialIvWQOp6AYBZUE9MDBXHqvM
         /rUQTwbuO+mlZtjt9i3EnwFRzRCYuOuFdwTXB043RfZLt+8tL/EQ41ag7R8jHkVAaScY
         Wcf9K5IIL6TXiEQOFYLHqjBbXEJU8QGx9ZuGYNtm1ecUo8ojXyW7p4G8kYYE0drMZv7p
         U/F2c3f5qnJ7JA1QJBKlo5v4eNpmaQnqREdPWV7d9LomO/tpxFTTA+UGb7k39zUZBAmm
         P46SVqvcnEWRu6c5Oh/65PqNmUSU1b807FYqT9weIdT99HRDRtU4Mz2Vb9Tr4AepxUc3
         M0qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VpB0gGbRJAvAKaFcacPtNf/jL/QtM2ovfZ2Xqo3yMXw=;
        b=K+3PH8Z++seSY8lwosLn83Bsspvuqo1pe+n3/t9eEFJ707qLVo+MpDHA5dYPSj0P6c
         YxdhWDUvkNu0EgjdsaBZPW+mQCQYpLT8THsu4JDuv1FkAv2ukYjTT/vRzRZ3UxTBwSuH
         0yrQag5R0ivn92LqkKUCEPj34ojnAI7sKX3ynlOAE9RTnM2R3xwROVofjh/YtBpfeN08
         rN2iMw/Nc0jlPPQLVe95m+Kkwq0g4yIw7AOOlgEunvAaSwXFFw6ZJslg5pEel13YqxSN
         y9GcTLay49hs+XJUQuPhpJPzqNZGCV2QagI2dPJGOr/VW9vyCXiKeNAdo4XJODyrStX6
         zOJw==
X-Gm-Message-State: AOAM531jfOZxlz1V81bGZ0ra7vNGWmitzpNSRBn9PORr56bXVlV+YoLk
        PZAR4mYOUAq74jPJvX55R3ZmYcennJQkVg==
X-Google-Smtp-Source: ABdhPJxXvP3D+WbCteJvF073lkhbdgKqVUGKqmPZ7j4QrHeTFKt1urVQJUOlbS0Mp27JoAMikO6a2g==
X-Received: by 2002:a05:6808:1513:: with SMTP id u19mr17183163oiw.109.1630099427387;
        Fri, 27 Aug 2021 14:23:47 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w9sm1502137oti.35.2021.08.27.14.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 14:23:46 -0700 (PDT)
Date:   Fri, 27 Aug 2021 14:25:00 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        Siddharth Gupta <sidgup@codeaurora.org>
Cc:     Shawn Guo <shawn.guo@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>, quic_sidgup@quicinc.com
Subject: Re: [PATCH] soc: qcom: mdt_loader: Drop PT_LOAD check on hash segment
Message-ID: <YSlYLBC1Q2WCDJ3D@ripper>
References: <20210824094109.7272-1-shawnguo@kernel.org>
 <0410695f-85fe-1df9-46ee-bc494b81bf23@somainline.org>
 <20210826141826.GB31229@dragon>
 <ed941f01-7855-006a-9eb9-29388b3be2f4@somainline.org>
 <20210827062359.GC31229@dragon>
 <3df9b523-4d8b-b817-f074-88e38456b35b@somainline.org>
 <20210827095716.GD31229@dragon>
 <YSkNqYHLBh4td0bG@builder.lan>
 <64a684c3-74f5-f544-4902-463d31d5374b@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64a684c3-74f5-f544-4902-463d31d5374b@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 27 Aug 10:40 PDT 2021, Marijn Suijten wrote:

> Hi Bjorn,
> 
> On 8/27/21 6:07 PM, Bjorn Andersson wrote:
> > On Fri 27 Aug 04:57 CDT 2021, Shawn Guo wrote:
> > 
> > > On Fri, Aug 27, 2021 at 10:29:59AM +0200, Marijn Suijten wrote:
> > > > On 8/27/21 8:24 AM, Shawn Guo wrote:
> > [..]
> > > > > > 
> > > > > > For this quick solution to be valid I propose to reject PT_LOAD in the else
> > > > > > clause, and otherwise validate that phdrs[1].p_offset + hash_size <=
> > > > > > fw->size.
> > > > > 
> > > > > I'm not sure what you propose here are required for non-split firmware.
> > > > 
> > > > 
> > > > Would it help if I sent a patch based on yours, with this extra validation
> > > > and comments + commit message explaining the cases?
> > > > 
> > > > Alternatively we can try re-spinning the patches from Siddharth while taking
> > > > review comments, the possible .mdt == .b00 + . b01 packing, and my
> > > > suggestion to handle the headers generically into account.
> > > 
> > > I would suggest this path.  It's been 8 months, so Siddharth probably lost
> > > the interest here.  It's reasonable that someone picks up the work.
> > > 
> > 
> > Prior to 498b98e93900 ("soc: qcom: mdt_loader: Support loading non-split
> > images") we'd just blindly pass the entire .mdt into the SCM call.
> > 
> > So reading through your discussion and looking at the problem is that
> > I assumed (based on the firmware files I looked at) that the hash
> > segment is explicitly mentioned in the ELF header - i.e. segment 0 and 1
> > are not PT_LOAD and define the part that should be passed to init_image,
> > and that this may or may not be packed.
> > 
> > And the problem we have here is that we have the packed case, but the
> > hash segment isn't described explicitly in the ELF header.
> 
> 
> The hash segment is still explicitly described by the presence of
> QCOM_MDT_TYPE_HASH, and the external file (.b01 when the program header is
> in slot 1) contains the hash signature.

But in Shawn's firmware the hashes follows the elf header in the .mdt
and both are described in a single program header. Are you saying that
this entry is of type QCOM_MDT_TYPE_HASH?

> And as Shawn demonstrated,
> concatenating the ELF header in .b00 and this hash in .b01 results in the
> .mdt file.  This is the case we can (and already) optimize for, by passing
> the entire .mdt as-is into SCM if such packing is detected.
> 

In the other case, where the hash is described by a separate program
header, we need to ensure that it's concatenated directly following the
ELF header.

There are three cases here:
1) It's already directly following the ELF header and we should send
ehdr_size + hash_size bytes to PAS.
2) It's in the loaded file, but it's not tightly packed (this is what we
see in the .mbn). In this case we need to pack up the two pieces before
we send them to PAS.
3) It's not part of the loaded .mdt, in which case we need to read it
from whichever program header that happens to contain it (might not be
.b01).


In the case of #1 we should not do #3, because I've seen several cases
where the signature in .b01 does not match the one present in the .mdt.

I do expect that passing the metadata of ELF+hash+b01 will still work,
as it would ignore the tailing garbage. Replacing ELF+hash with ELF+b01
is different from what we've been doing all these years, so that will
require retesting on all possible platforms...


So I think what we're looking at it the three possible operations:
1) init_image(ELF+hash)
2) init_image(pack(ELF+hash))
3) init_image(pack(ELF+load(b01)))

Let's see if Sid agrees.

> > > > > > The aforementioned patch series in qcom_mdt_bins_are_split (and certain
> > > > > > firmware files from Sony phones) show that it is also possible to read
> > > > > > PT_NULL headers from external files, as long as the header references a
> > > > > > range that is out of bounds of the mdt file.
> > > > > 
> > > > > It's been shown that hashes can be read from .mdt or hash segment, and
> > > > > independently the hash segment type could be PT_NULL or PT_LOAD.  With
> > > > > Siddharth's patch, instead of using the hash duplication in .mdt, hash
> > > > > will be read from hash segment.  But again, to resolve my problem, the
> > > > > assertion that hash segment type cannot be PT_LOAD has to be dropped.
> > > > > And that's the only thing my patch is doing.
> > > > 
> > > > Correct.  If I were to respin Siddharth's patchset, I'd write
> > > > qcom_mdt_read_metadata as follows:
> > > > 
> > > > 1. Find the header that contains QCOM_MDT_TYPE_HASH (allowing PT_NONE
> > > >     and PT_LOAD);
> > > > 2. If `ehdr_size + hash_size == fw->size`, this is split firmware and
> > > >     the mdt file can be used as-is for metadata;
> > > > 3. If the type is PT_LOAD, _or_ if the type is PT_NULL but
> > > >     `p_offset + p_filesz` does not fit inside the .mdt, this is (a
> > > >     variant of) split-firmware, and the hash needs to be loaded from an
> > > >     external file and appended to the ELF header.
> > 
> > I would expect that PT_LOAD denotes that the segment should be loaded
> > into the final firmware region and that the hash segment would be
> > PT_NULL regardless of being part of the .mdt, single .mbn or a separate
> > .bNN segment.
> 
> 
> I have two mdt files here that load the hash externally, one with PT_LOAD
> and one with PT_NULL annotation (QCOM_MDT_TYPE_HASH is set). Both have their
> p_offset and/or p_offset+p_filesz well out of bounds of the .mdt file, but
> the .mdt file is of the packed variant (.b00 + .b01 == .mdt).
> 

Ahh, because mdt_phdr_valid() will discard them anyways as we look for
PT_LOAD segments...

> This packing seems to be an optimization, making it possible to send the
> .mdt contents as-is over SCM without having to load and concatenate the
> header from a separate file.
> 

Yes, that's probably the case. I was surprised to see the need for
repacking the two segments in the .mbn case. I can only assume that
Windows does this...

Regards,
Bjorn

> The image produced by __qcom_mdt_load should still be reconstructed based on
> the layout specified in the program headers, of course.
> 
> > > > 4. If none of the above, this is a non-split firmware file.  Concatenate
> > > >     the ELF and hash headers by reading them directly from the firmware.
> > > 
> > 
> > I'm happy with this plan and I think Sid will be as well.
> > 
> > I hope that we can introduce a change that fixes Shawn's reported
> > problem first, so that can be backported to stable, and then add Sid's
> > need for loading the additional .bNN after that (same series is fine).
> 
> 
> I'm totally for fixing Shawn's reported issue first, before diving into
> extending mdt_loader as per Sid's patches.  In hindsight I'm not sure if I
> should be the person writing that until coming across a platform/firmware
> that needs this setup (hash in a different header, hash not included in the
> packed .mdt file).
> 
> Note that backporting needs a Fixes: tag, probably on 498b98e93900.
> 
> Shawn, do you want to send your reworded patch with the necessary safeguards
> as v2, or should I send it?
> 
> - Marijn
