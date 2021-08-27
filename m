Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96E173F9466
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Aug 2021 08:41:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244234AbhH0GZA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Aug 2021 02:25:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbhH0GY7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Aug 2021 02:24:59 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33D8AC061757
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Aug 2021 23:24:11 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id n18so5136809pgm.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Aug 2021 23:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9gtUpO3QmMabFNgvI1+f4IWha+H7OSFn2H1V+ka2avE=;
        b=mcmdd5A0f0HF7O90/fk5tfUFPLtmEgiC9M3UiVCortGAid+kmBsLOpViXNMS4cMdlc
         acwW3gY0aQOIG3EkvRzfzUaDZ5Uhg1Fma3vYbOWNecmpeYxZpgGnyQQXhZSMKbyL/UHb
         j3MYNWZcbodA0IhuQ2GOyXWQDR572IC8d5d8sYoVyZfbb5iB0t2WBL5Sif9NSgzMAt73
         JQjIis5+rZDT6aN3apS2bMVucT2Zmuf+EagFSuSllyVIW1mfbfm9XyI13bTRfa5KCuDN
         nM9HOJjKnzNAhAVEX6HFzEYf9nVoA2f0WYq3/QRaO86wfAZdF9/CyEaAZ0XVB+xLcRhX
         JTpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9gtUpO3QmMabFNgvI1+f4IWha+H7OSFn2H1V+ka2avE=;
        b=FV04fTPfrJAll+FhjuuJtroz7+TgAMk5GiyaAVxBuc6yhTcZolGt0OUI/9pU3mb3G5
         M5bRdEHipygoB0YmFTOSIt6L84/JCtF6Lh+6KQ8ZPbuBCkfkKL+SrJ7uAgFE9Mt74boJ
         mZwmpAAt9tf0EGpjh7eSkJCId6E2nor2ULXvqt+SSEZXRMVtRZ2ASDUBQMbJz0hk/C7j
         we8dNU0/QtHuBrEQS6rtV8PzMlb/uIJEdyhcw78aCwQeqUZ/eNcq21wqUrr+jqsef7QK
         dumDeoKjl8Ke8VzM0hbnFTAUDac6CTlvHOLCkWIYw/U4Tpu8FYBa14ZQZhseD+T+jGbC
         HHXQ==
X-Gm-Message-State: AOAM5315q/j/qP6iD5dmCVzzRFXa7EEgi1VOpQTWOynU3gwSn/eh0bRE
        SAxpi844maOMG/5iy4RFQIXsqw==
X-Google-Smtp-Source: ABdhPJztHpXW8RZtSwn7eKVBPXIFvJ8cg3pg/Qk34538Ah5WR6yGoU40R2pFEFIqEPcKBgVKnRiz+Q==
X-Received: by 2002:aa7:8058:0:b029:332:9da3:102d with SMTP id y24-20020aa780580000b02903329da3102dmr7470855pfm.21.1630045450463;
        Thu, 26 Aug 2021 23:24:10 -0700 (PDT)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id x12sm4828405pfu.21.2021.08.26.23.24.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Aug 2021 23:24:10 -0700 (PDT)
Date:   Fri, 27 Aug 2021 14:24:03 +0800
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
Message-ID: <20210827062359.GC31229@dragon>
References: <20210824094109.7272-1-shawnguo@kernel.org>
 <0410695f-85fe-1df9-46ee-bc494b81bf23@somainline.org>
 <20210826141826.GB31229@dragon>
 <ed941f01-7855-006a-9eb9-29388b3be2f4@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed941f01-7855-006a-9eb9-29388b3be2f4@somainline.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 26, 2021 at 10:52:21PM +0200, Marijn Suijten wrote:
> Hi Shawn,
> 
> On 8/26/21 4:18 PM, Shawn Guo wrote:
> > Hi Marijn,
> > 
> > Thanks much for the information!
> > 
> > On Tue, Aug 24, 2021 at 05:18:05PM +0200, Marijn Suijten wrote:
> > > Hi Shawn,
> > > 
> > > On 8/24/21 11:41 AM, Shawn Guo wrote:
> > > > From: Shawn Guo <shawn.guo@linaro.org>
> > > > 
> > > > It's been observed on Sony Xperia M4 Aqua phone, that wcnss firmware has
> > > > the type of the second segment holding hashes just be PT_LOAD.  So drop
> > > > the check on phdrs[1].p_type to get it go on that phone.
> > > > 
> > > > Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> > > > ---
> > > >    drivers/soc/qcom/mdt_loader.c | 2 +-
> > > >    1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
> > > > index eba7f76f9d61..6034cd8992b0 100644
> > > > --- a/drivers/soc/qcom/mdt_loader.c
> > > > +++ b/drivers/soc/qcom/mdt_loader.c
> > > > @@ -98,7 +98,7 @@ void *qcom_mdt_read_metadata(const struct firmware *fw, size_t *data_len)
> > > >    	if (ehdr->e_phnum < 2)
> > > >    		return ERR_PTR(-EINVAL);
> > > > -	if (phdrs[0].p_type == PT_LOAD || phdrs[1].p_type == PT_LOAD)
> > > > +	if (phdrs[0].p_type == PT_LOAD)
> > > >    		return ERR_PTR(-EINVAL);
> > > >    	if ((phdrs[1].p_flags & QCOM_MDT_TYPE_MASK) != QCOM_MDT_TYPE_HASH)
> > > > 
> > > 
> > > 
> > > Konrad (on the CC-list) originally came up with a similar patch to make his
> > > Sony phone boot (Xperia XZ, MSM8996).  We however concluded that this
> > > solution is wrong, for the simple fact that the code below expects a PT_NULL
> > > header with data in the right place.  Skipping this check most likely means
> > > that the code below will read out of bounds since the mdt file isn't large
> > > enough; this data is supposed to be read from an external file as indicated
> > > by the meaning of PT_LOAD.  We built a solution for this, and fortunately
> > > CAF independently submitted a similar solution to the lists a while ago
> > > which is more thorough:
> > > 
> > > https://lore.kernel.org/linux-arm-msm/1609968211-7579-1-git-send-email-sidgup@codeaurora.org/
> > 
> > While a thorough solution is good, I do not think my patch makes
> > anything worse or breaks anything, while fixing my issue on Sony Xperia
> > M4 Aqua.  All the current assumptions hold true for my WCNSS firmware,
> > only except that phdrs[1] gets a PT_LOAD type.
> 
> 
> It's not up to me to choose between a thorough or quick solution,

To be clear, Siddharth's series doesn't resolve my problem, as the
assumption that hash segment type cannot be PT_LOAD is still there.
I have to add the following change on top to fix my problem.

@@ -126,8 +126,7 @@ void *qcom_mdt_read_metadata(struct device *dev, const struct firmware *fw, cons
                return ERR_PTR(-EINVAL);
 
        for (hash_index = 1; hash_index < ehdr->e_phnum; hash_index++) {
-               if (phdrs[hash_index].p_type != PT_LOAD &&
-                  (phdrs[hash_index].p_flags & QCOM_MDT_TYPE_MASK) == QCOM_MDT_TYPE_HASH)
+               if ((phdrs[hash_index].p_flags & QCOM_MDT_TYPE_MASK) == QCOM_MDT_TYPE_HASH)
                        break;
        }
        if (hash_index >= ehdr->e_phnum)

That said, my patch is merely to break the assumption that hash segment
type cannot be PT_LOAD, and it's really orthogonal to Siddharth's
series.

> but this
> patch seems to open up the possibility for an out-of-bounds read. The
> assertion was placed in this function for a reason after all.

I would much appreciate it if someone helps to elaborate the reason.

> 
> > There is a blog[1] illustrating the situation quite nicely.  Again, the
> > only thing my WCNSS firmware differs from the illustration is that
> > hash segment gets a PT_LOAD type.
> 
> 
> Yes, that blog post nicely explains the format but it doesn't cover that the
> hash is encoded in the second program header nor that it can be copied to be
> packed tightly against the ELF header?  Maybe that only applies to newer
> formats?

Hmm, it does cover the things.  It's been illustrated that .mdt is
simply a concatenating of .b00 and .b01.  The .b00 includes ELF header
and program headers, while .b01 is just hash segment.

$ cat wcnss.b00 wcnss.b01 > wcnss.b00_b01
$ cmp wcnss.b00_b01 wcnss.mdt
$

That said, .mdt = ELF header + program headers + hash

> 
> > Skipping the check will not cause problem for firmwares we have seen,
> > because hash segment is duplicated in .mdt file, and we are using that
> > duplication instead of reading from .b01 file.
> 
> 
> Can you share some more details about the firmware file you're using: size
> and the program headers as shown by `readelf -l`?

$ readelf -l wcnss.mdt

Elf file type is EXEC (Executable file)
Entry point 0x8b6018d4
There are 12 program headers, starting at offset 52

Program Headers:
  Type           Offset   VirtAddr   PhysAddr   FileSiz MemSiz  Flg Align
  NULL           0x000000 0x00000000 0x00000000 0x001b4 0x00000     0
  LOAD           0x001000 0x8bbe0000 0x8bbe0000 0x00c58 0x02000     0x1000
  LOAD           0x003000 0x8b600000 0x8b600000 0x03308 0x03438 RWE 0x100000
  LOAD           0x00afcc 0x8b604000 0x8b604000 0x00000 0x08000 RW  0x4000
  LOAD           0x00afcc 0x8b60c000 0x8b60c000 0x0f000 0x0f000 RW  0x4
  LOAD           0x019fcc 0x8b61b000 0x8b61b000 0x00000 0x0e000 RW  0x4
  LOAD           0x019fcc 0x8b629000 0x8b629000 0x32eb04 0x4c2b10 RWE 0x80
  LOAD           0x348ad0 0x8baebb80 0x8baebb80 0x00000 0x37cf8 RW  0x8
  LOAD           0x348ad0 0x8baebb80 0x8baebb80 0x00000 0x21c44 RW  0x4
  LOAD           0x348ad0 0x8bb30000 0x8bb30000 0x00034 0x001a8 RW  0x8
  LOAD           0x349fcc 0x8bb31000 0x8bb31000 0xa0000 0xa0000 RW  0x1000
  LOAD           0x3e9fcc 0x8bbd1000 0x8bbd1000 0x0ac3c 0x0ee00 RWE 0x1000

> If possible, can you also
> validate whether QCOM_MDT_TYPE_HASH is set in phdrs[1].p_flags &
> QCOM_MDT_TYPE_MASK (using something like GNU poke)?

It is set, otherwise the QCOM_MDT_TYPE_HASH check in
qcom_mdt_read_metadata() will just fail.  To be clear, everything works
fine for me, as long as I drop the check of (phdrs[1].p_type == PT_LOAD).

> 
> All the files I'm able to test adhere to `/* Is the header and hash already
> packed */`: `ehdr_size + hash_size == fw->size` (meaning the file solely
> consists of a tightly packed ELF header and hash signature)

Yeah, my wcnss firmware is same here.  Actually, all split firmwares I
have seen are this case.  But bear it in mind there are non-split
firmware like a single .mbn file.  My understanding is that condition
(ehdr_size + hash_size == fw->size) is being used to check whether it's
a split firmware or non-split one.

> but I won't be
> surprised if there are firmware files out in the wild with different headers
> or the hash missing, otherwise the else clause wouldn't exist.
> This else clause causes a read starting at fw->data + phdrs[1].p_offset of
> phdrs[1].p_filesz bytes which is almost certainly out of bounds if the
> program header type is PT_LOAD instead of PT_NONE, otherwise it wouldn't
> need to be loaded from a .bXX file in the first place.

So the else clause is there to handle non-split firmware, which has
everything within fw->size.

> 
> For this quick solution to be valid I propose to reject PT_LOAD in the else
> clause, and otherwise validate that phdrs[1].p_offset + hash_size <=
> fw->size.

I'm not sure what you propose here are required for non-split firmware.

> The aforementioned patch series in qcom_mdt_bins_are_split (and certain
> firmware files from Sony phones) show that it is also possible to read
> PT_NULL headers from external files, as long as the header references a
> range that is out of bounds of the mdt file.

It's been shown that hashes can be read from .mdt or hash segment, and
independently the hash segment type could be PT_NULL or PT_LOAD.  With
Siddharth's patch, instead of using the hash duplication in .mdt, hash
will be read from hash segment.  But again, to resolve my problem, the
assertion that hash segment type cannot be PT_LOAD has to be dropped.
And that's the only thing my patch is doing.

Shawn
