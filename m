Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D2333FA3EE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Aug 2021 08:03:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231277AbhH1GEs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Aug 2021 02:04:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbhH1GEs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Aug 2021 02:04:48 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45EA5C0613D9
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Aug 2021 23:03:58 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id m4so5492545pll.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Aug 2021 23:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=68/6LZll51YMWDfK9E2Ce0WbhUlHdIDgWPo3p8PFz5I=;
        b=tgxldRB9n6F1R9/5SEL6f98jNwk/OMJBOTRKZLxvNHp7++bCv5l/P0hFedLXQCI9fZ
         WyqhjEvuySWR5qZOZ3K33p2vSFsIB7JCg173qEtH1bCG2FDS1wfkGWS+qtpd5mYmuNWz
         VSjjB+j5a1GjbvX3py3wkgzbmpzv1EvAhp14egWtpqeQTaqiRx5GRi6ibTq7vUjCgQ+T
         Kqx+3LtM0WS4pIxvhq4o6T4njBvQQnpa838LeHOZ3RcqJ8SxjDBKjmvkOPYxb5jxJeaf
         KCknXlHHfxYqDKMv5hSOrTX4vxo0GDgPFEuYxa5EmwihGbYa3QcINe4qot86aBCAbZUz
         ITRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=68/6LZll51YMWDfK9E2Ce0WbhUlHdIDgWPo3p8PFz5I=;
        b=S8EDPKwS+QOpEesTAHdMUia+BOv7VUTkBqj14jDABsi1/WEiY+m3aOjJLOK9FRXues
         kaPqsg2w8n833JsU4XmFZkWL7CKvbvBEMo6pVLjZTGDcMTe3uocu+AN7fJ8g0zFu7OU0
         FhdRnPlgm6uPckJgxNeLtLKDzbrx+VKUTEPA+t0iHjxf13qaiSvaUdOfOqTydCRKRjwj
         0spbgv/+bU879eQ1QHZThBfBGMazLncsHP5kYZHUV9WDhSsE1MILFtAmbotoM7gTlAXD
         MPtaqwL076FJzLFcQTACrII1c6/7+INKYmvSUhboziBmIdFxGpwDY2k2lN00qg6XsmPb
         wXnA==
X-Gm-Message-State: AOAM533Y7pN+53Rz/HS6J7r2bkvFSVbE05yMOgI4CMyhnNd81t0UKyNC
        2CcXSiVPWIREZmfH30jJwy29/g==
X-Google-Smtp-Source: ABdhPJyuoyIMljpZixpBtdgVO9sHof6i9UErH57YTTshb2a/q5ekBjblT2Xm8ZRqjQjWYb2lARHTEw==
X-Received: by 2002:a17:90b:e0d:: with SMTP id ge13mr15166167pjb.53.1630130637573;
        Fri, 27 Aug 2021 23:03:57 -0700 (PDT)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id y23sm7488996pfe.129.2021.08.27.23.03.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Aug 2021 23:03:57 -0700 (PDT)
Date:   Sat, 28 Aug 2021 14:03:50 +0800
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
Message-ID: <20210828060349.GB4274@dragon>
References: <20210824094109.7272-1-shawnguo@kernel.org>
 <0410695f-85fe-1df9-46ee-bc494b81bf23@somainline.org>
 <20210826141826.GB31229@dragon>
 <ed941f01-7855-006a-9eb9-29388b3be2f4@somainline.org>
 <20210827062359.GC31229@dragon>
 <3df9b523-4d8b-b817-f074-88e38456b35b@somainline.org>
 <20210827095716.GD31229@dragon>
 <9166e1a9-5afa-7ae8-91e5-21704bc7a40f@somainline.org>
 <20210827141200.GA4274@dragon>
 <16c45f98-60ed-61d0-9e6a-d0c2aa2a20d1@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16c45f98-60ed-61d0-9e6a-d0c2aa2a20d1@somainline.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Aug 27, 2021 at 05:13:34PM +0200, Marijn Suijten wrote:
> Hi Shawn,
> 
> On 8/27/21 4:12 PM, Shawn Guo wrote:
> > [..]
> > 
> > So you proposed to reject PT_LOAD in the else clause, which right now
> > handles .mbn case
> 
> 
> Yes, I propose to reject PT_LOAD in the else-case, and additionally reject
> cases where p_offset+p_filesz > sw->size since PT_NULL can also cause
> external file loads (meaning split-firmware).  This is what Siddharth's
> patchset - or my respin of it - is going to implement.
> 
> > are you sure hash segment in .mbn is not going to be
> > PT_LOAD?
> 
> 
> PT_LOAD unambiguously indicates a program header that ought to be loaded
> from an external file.  Any mbn file (non-split firmware) without split
> files that set PT_LOAD are misusing this program header type field.  I have
> no way to validate whether such mbns are in circulation.

Following your take on PT_LOAD, I assume that no PT_LOAD segment should
be found in .mbn file, correct?  Here are two .mbn I found in
circulation.  Both have PT_LOAD type for a few segments.

$ readelf -l venus.mbn 

Elf file type is EXEC (Executable file)
Entry point 0xf500000
There are 5 program headers, starting at offset 52

Program Headers:
  Type           Offset   VirtAddr   PhysAddr   FileSiz MemSiz  Flg Align
  NULL           0x000000 0x00000000 0x00000000 0x000d4 0x00000     0
  LOAD           0x001000 0x0fa00000 0x0fa00000 0x00b88 0x02000     0x1000
  LOAD           0x003000 0x00000000 0x0f500000 0xeecd0 0xeecd0 R E 0x100000
  LOAD           0x0f1cd0 0x000ef000 0x0f5ef000 0x015c0 0x405000 RW  0x4000
  LOAD           0x0f3290 0x004ff000 0x0f9ff000 0x00020 0x00020 RW  0x4

$ readelf -l mba.mbn 

Elf file type is EXEC (Executable file)
Entry point 0x4417000
There are 5 program headers, starting at offset 52

Program Headers:
  Type           Offset   VirtAddr   PhysAddr   FileSiz MemSiz  Flg Align
  NULL           0x000000 0x00000000 0x00000000 0x000d4 0x00000     0
  NULL           0x001000 0x8ea4a000 0x8ea4a000 0x019c8 0x02000     0x1000
  LOAD           0x003000 0x04417000 0x8ea00000 0x350d0 0x3bbc8 RWE 0x1000
  LOAD           0x039000 0x04460000 0x8ea49000 0x00380 0x00380 RW  0x1000
  GNU_STACK      0x002000 0x00000000 0x00000000 0x00000 0x00000 RWE 0x4

Or you think these are all misusing of PT_LOAD?  Sorry, I hardly believe
your understanding on PT_LOAD matches the reality.  Instead, I'm inclined
to agree with Bjorn's comment.

Quote:

"I would expect that PT_LOAD denotes that the segment should be loaded
into the final firmware region and that the hash segment would be
PT_NULL regardless of being part of the .mdt, single .mbn or a separate
.bNN segment."

The only part that doesn't hold is "the hash segment would be PT_NULL".
But the point is that PT_LOAD doesn't mean the segment should be loaded
externally (from .bNN file). 

> 
> Of note, I have never referenced the definition of the program header types
> yet.  Please see [1]:
> 
>     PT_LOAD (1)
>         Indicates that this program header describes a segment to be
>         loaded from the file.
> 
> Let me know if you're planning to send a v2 of this patch with
> aforementioned improvements, then I'll adjust my plans to respin Siddharth's
> patchset accordingly.

I will send v2. However there will be no code change but just commit log
update based on all these discussion.  Thanks!

Shawn

> [1]: https://ftp.gnu.org/old-gnu/Manuals/ld-2.9.1/html_node/ld_23.html
