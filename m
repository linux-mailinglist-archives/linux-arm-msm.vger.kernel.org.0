Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F38B3F89FD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Aug 2021 16:18:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232559AbhHZOTZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Aug 2021 10:19:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229832AbhHZOTY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Aug 2021 10:19:24 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B153C061757
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Aug 2021 07:18:37 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id u13-20020a17090abb0db0290177e1d9b3f7so6683240pjr.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Aug 2021 07:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tw0tIF1kOB621AUByVB9hMhF9v/HFWU5y/0iuJHRZK8=;
        b=D2D5XKxPiC/aAvQcBJ2xt+qPpSCnUf1PsRVFREE9G7kzmFvDM7ExvA0QLmUKGfbgfH
         hvQ4Pc8hseZYGLP0zuYk+isG16pw85C7CSo1bHFValChOgW+DK3iCc6408p8YeMef48m
         apz8l0m+CP5EW1kEZiWB3dlGhUQ8nbCRoCTwi77H3s8WxJRMCoDkeUX2EQVdxnuYwadO
         Eo+YzYcdz5JdfD5s7ukMRd3u8809uKj+wvOZfuCsmE5+VEKSSyCxWAiRE+lki3kDsz7r
         Dvwn4NU9eLvmN0J2QqCSnuaLWXPFno40ZcK+pYH3kf8PNYNvYrJOXmYkVnRBglWJwhbY
         upOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tw0tIF1kOB621AUByVB9hMhF9v/HFWU5y/0iuJHRZK8=;
        b=SUTBOvW3Ipib0Agh5aL7INLRy//12ey66eiI4COF1NEWvwWS+fNSd5LBRFMRi1L8TR
         kHmdZtFk6Rwenw0CEZ07m5D1K//Kf8zwmftSocelcwYZwzs/JSC/5KFj415K8p305Tzn
         fAzOhvo1rPRaUtMR2kWiTwmBRaBmRiZw5ibmWPIOX0H/+gm66FIo8eYStA8lFIGldvM4
         p0OvZ2PqNNQ2yb6+kDwdpcOQnMWHdzVvWL23UrvyeBhkeSmIRsTjkDs4xAZcXmLozBEq
         5dZkY4DpSEHnbNm2A8Csw8D2JsC5wzuNLmOxBGplw5VLcBC7+5uPYWB/zuicytaww+xD
         QPhw==
X-Gm-Message-State: AOAM5337c0nCxIDflTw9stwYZo9lHy91p/T74NJ+ckfVh8NfTeSg0olX
        JMLnUcWYdvRAbA+jRWxhsGLcEQ==
X-Google-Smtp-Source: ABdhPJz6HlH2pzmxAbV5Ytoum0k+DNzlyEEE6L4UldQhJDNyUv7O/XRTwf771E0Zuf4lzk1gqOXNFQ==
X-Received: by 2002:a17:902:db0a:b0:12d:b6d2:3f2e with SMTP id m10-20020a170902db0a00b0012db6d23f2emr3875092plx.51.1629987517112;
        Thu, 26 Aug 2021 07:18:37 -0700 (PDT)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id a1sm3797731pgt.47.2021.08.26.07.18.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Aug 2021 07:18:36 -0700 (PDT)
Date:   Thu, 26 Aug 2021 22:18:30 +0800
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
Message-ID: <20210826141826.GB31229@dragon>
References: <20210824094109.7272-1-shawnguo@kernel.org>
 <0410695f-85fe-1df9-46ee-bc494b81bf23@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0410695f-85fe-1df9-46ee-bc494b81bf23@somainline.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Marijn,

Thanks much for the information!

On Tue, Aug 24, 2021 at 05:18:05PM +0200, Marijn Suijten wrote:
> Hi Shawn,
> 
> On 8/24/21 11:41 AM, Shawn Guo wrote:
> > From: Shawn Guo <shawn.guo@linaro.org>
> > 
> > It's been observed on Sony Xperia M4 Aqua phone, that wcnss firmware has
> > the type of the second segment holding hashes just be PT_LOAD.  So drop
> > the check on phdrs[1].p_type to get it go on that phone.
> > 
> > Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> > ---
> >   drivers/soc/qcom/mdt_loader.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
> > index eba7f76f9d61..6034cd8992b0 100644
> > --- a/drivers/soc/qcom/mdt_loader.c
> > +++ b/drivers/soc/qcom/mdt_loader.c
> > @@ -98,7 +98,7 @@ void *qcom_mdt_read_metadata(const struct firmware *fw, size_t *data_len)
> >   	if (ehdr->e_phnum < 2)
> >   		return ERR_PTR(-EINVAL);
> > -	if (phdrs[0].p_type == PT_LOAD || phdrs[1].p_type == PT_LOAD)
> > +	if (phdrs[0].p_type == PT_LOAD)
> >   		return ERR_PTR(-EINVAL);
> >   	if ((phdrs[1].p_flags & QCOM_MDT_TYPE_MASK) != QCOM_MDT_TYPE_HASH)
> > 
> 
> 
> Konrad (on the CC-list) originally came up with a similar patch to make his
> Sony phone boot (Xperia XZ, MSM8996).  We however concluded that this
> solution is wrong, for the simple fact that the code below expects a PT_NULL
> header with data in the right place.  Skipping this check most likely means
> that the code below will read out of bounds since the mdt file isn't large
> enough; this data is supposed to be read from an external file as indicated
> by the meaning of PT_LOAD.  We built a solution for this, and fortunately
> CAF independently submitted a similar solution to the lists a while ago
> which is more thorough:
> 
> https://lore.kernel.org/linux-arm-msm/1609968211-7579-1-git-send-email-sidgup@codeaurora.org/

While a thorough solution is good, I do not think my patch makes
anything worse or breaks anything, while fixing my issue on Sony Xperia
M4 Aqua.  All the current assumptions hold true for my WCNSS firmware,
only except that phdrs[1] gets a PT_LOAD type.

There is a blog[1] illustrating the situation quite nicely.  Again, the
only thing my WCNSS firmware differs from the illustration is that
hash segment gets a PT_LOAD type.

Skipping the check will not cause problem for firmwares we have seen,
because hash segment is duplicated in .mdt file, and we are using that
duplication instead of reading from .b01 file.

Shawn

[1] http://bits-please.blogspot.com/2016/04/exploring-qualcomms-secure-execution.html
