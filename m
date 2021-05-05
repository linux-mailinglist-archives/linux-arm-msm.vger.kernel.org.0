Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34F1437486B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 May 2021 21:06:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234038AbhEETHO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 May 2021 15:07:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231422AbhEETHN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 May 2021 15:07:13 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 071E3C061574
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 May 2021 12:06:17 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id g15-20020a9d128f0000b02902a7d7a7bb6eso2658782otg.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 May 2021 12:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=i/1B5SQssOyScSlxrEKBn9g8xLWTGFvTpHsICjvNBS8=;
        b=hsXZ6wfAW9RyKd/xVJux6fMUCcBQZlzX4tYtkcQ2xyyvVHFZN8ITmRbe4SLDFm6DHE
         1Pu2nNDRyc2phynodIO3hB5eJC9VybntPV/kmrT1UwsJrgSuCKFMjKOxA+Md6UPo91Cq
         gsn2qFcl0LCzwJOiX6w88/np/XSV7zHxYdhOcsy/oxeigVuW+EchIxt4JtQ3yxJyGhKR
         5O1Rop38oqjT9pcFmN82Xpibx3b8YHgJ/OzVaVSEGzrKoN36CrVlDcyTBGQuGcb4K/H7
         CxwAl+KwYNxz2B3cU18aQHTcdee5QvRTaE55SKoKWzJOtnce/Ne+2ZiMirjte9NLEGwc
         tYeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=i/1B5SQssOyScSlxrEKBn9g8xLWTGFvTpHsICjvNBS8=;
        b=nQSXwYgLWMcpLsNkaak/fIhdmJwiAlizxPiK2EglusrQWKU5chaSKnSyxYUuBW7Pq7
         DOHQ9SlnzEdXdklmwv/86wdD8CPPLx8W06Re0BD4+IG4fAHOl8w3YtQypBYF1zT/SuHH
         R6ntFEsqMkKHKGwAQ/+OsigxOICAYIaAhkKqSCFLqX9tpafMnNqs05NcIYAo67BgKTQt
         MrxavbcORu8B+7QUqImLWGm1Ez6kfmuQzP/dlyDRx5Z/HoCqMFUvNdAxpDOEBLRuUqah
         vtuDr/6bh1uuImrGROwhnWnXrXrp4q6Nx+m0KC5zYXj/vy7hVwsqhNZwWXiXT0hXijIV
         V5Cg==
X-Gm-Message-State: AOAM531OUQU6+ObKyWhB9cLguWF3laCOsY8v3LcaVUzBFYrMYMau36sG
        fMJyjr2gOScrUPFoxaWhvMeCUQ==
X-Google-Smtp-Source: ABdhPJy6KZymaQOHgaNzORkCBuPfTG0XlPIZPtSexQUOMtPg9QUWjAMB+9EnJnM26z8Wir8sS1LMjg==
X-Received: by 2002:a9d:10a:: with SMTP id 10mr165594otu.188.1620241576414;
        Wed, 05 May 2021 12:06:16 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id c7sm44846oot.42.2021.05.05.12.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 12:06:15 -0700 (PDT)
Date:   Wed, 5 May 2021 14:06:13 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     John Stultz <john.stultz@linaro.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Vinod Koul <vinod.koul@linaro.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        YongQin Liu <yongqin.liu@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: Regression: arm64: dts: sdm845-db845c: make firmware filenames
 follow linux-firmware
Message-ID: <20210505190613.GG2484@yoga>
References: <CALAqxLXsLcA=r1x6hXxLx3aVA-8=RG5qd+yj+sKEFiaWPUzkSA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALAqxLXsLcA=r1x6hXxLx3aVA-8=RG5qd+yj+sKEFiaWPUzkSA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 05 May 01:20 CDT 2021, John Stultz wrote:

> Hey Dmitry, Bjorn,
>   I wanted to raise a regression I caught in the merge window on db845c.
> 
> I was seeing troubles with audio and while there are a few other
> pending fixes needed, they did not seem to work for me. So I spent
> some time bisecting things down and found the problematic commit was
> 7443ff06da45 ("arm64: dts: sdm845-db845c: make firmware filenames
> follow linux-firmware").
> 
> It seems for systems using the old firmware filenames, this will break
> dependent devices on adsp_pas and cdsp_pas nodes.
> 
> Now, obviously updating the firmware files in userland should resolve
> this, but it adds the complexity that we can't just replace the
> firmware files because older LTS kernels will look for the old names,
> while newer kernels will look for the new names. We can add both files
> to the system images, but then there is some confusion on which
> version of the firmware files are being used where.
> 
> So yes, we should align with linux-firmware file names, but I think
> more care is needed for this sort of thing as it has the potential to
> break folks, and this isn't the first time around we've had similar
> firmware name changes break us.
> 

Due to the workings of the userspace firmware loader fallback I
unfortunately don't see any reasonable way to deal with this.
Introducing a fallback mechanism would suffer from an unavoidable 60
second delay waiting for the first choice to timeout, or if we used the
non-userspace-assisted method we'd probably give up too early.

> So I'm working on fixing this by including both filenames in userland,

The kernel will detect in runtime if you pass it a squashed or split
firmware package, the suffix has no significance. So if you have the
need to go back and forth just make sure you have a symlink that points
the .mbn to the .mdt (or vice versa).

> so we probably don't need a revert here, but *please* maybe take more
> care on this sort of change.
> 

Yes, I should have paid more attention when we merged the original
firmware-name to avoid this issue. Sorry for not getting this right from
the beginning.

Regards,
Bjorn
