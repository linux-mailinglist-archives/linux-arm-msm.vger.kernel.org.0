Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B5903BDF63
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jul 2021 00:27:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229781AbhGFWah (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Jul 2021 18:30:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229753AbhGFWah (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Jul 2021 18:30:37 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24764C061574
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jul 2021 15:27:57 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id z3so239000oib.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jul 2021 15:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xoyK2QzlCZt8bi5diUk8cj153VxP+YLKzFJZf6Qe5Xc=;
        b=apVFqHowsFKnl/eESrEbefgya/IgviBHmDOD1jyq4Y8+IzH8UQCJieCGNF4idzkDQ9
         sHIaaZqQ8v/yb7bXWCKe6f4bN8xs7xIprzqJaNTDf3BvjUzp9TRYpzOnQTB2w1QkKVoM
         Ys8XhDhIHtXuGbX6EsBZ4qPbQEVUxaBmsZ6Bvi16R7zlUMYWydcp2UqgSgEU283zKv+9
         EDELXnDI+EOhN5aB1s7Xa8LtUqQsoeYLRhQW8fh18Hdzhjw2NjzdAB40d2Yy3Ppqevmt
         NtyB5VjcTJSn1XnQr/UYr5GrqVqN+gbkAndG8uqyz8NqgVthFqUCbE7GNo9jyqFSIw8C
         HHQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xoyK2QzlCZt8bi5diUk8cj153VxP+YLKzFJZf6Qe5Xc=;
        b=QG9VAQJmtGYetGPsaeuBkSX8qILkfTVX8VGWUeJDBdqjrr7jTHiw7aOj3zRjrvDemL
         MLYhHIf//mn7PuKt0JVXFJK5hN7Q/IOhm0e+HOdaWaNu7x6MK/1Gtz/sC0lxbJVJhxnQ
         o9ITfDPWa6Gr5sUtVoiKoM/MspP8dHbtcomEjAl/zngDv6opABCs6eGLHzp01M0ySwrn
         9QePU1NyXdN0NFHZCEsveu1jgj9Bm8g+JncHNdIA1Cy7q7hlDlhajIjK48nsetep6Q6y
         MxEt+8kUipdwXHQCktva4Z7IjYT4zS1H9pjVC0LyKQYOlQAoCFymSMu/DHi063L02aFC
         RdYg==
X-Gm-Message-State: AOAM533i/sgd0pqHhc3SBRUmn5hfXLUn+jxMwen/5sfacJdr1a2uu6J+
        +OhRLH/rrsFwJjkzTrQCgdQxXw==
X-Google-Smtp-Source: ABdhPJwqRWePe9Ly0r4VcYKwxKaiW4uAOzS/FR1dhiDVLCX0oJ+OV6IK1DmYgXsfLCDkMEDX7ZHZCg==
X-Received: by 2002:a54:4d98:: with SMTP id y24mr16335106oix.18.1625610476475;
        Tue, 06 Jul 2021 15:27:56 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id f20sm336018otq.35.2021.07.06.15.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jul 2021 15:27:55 -0700 (PDT)
Date:   Tue, 6 Jul 2021 17:27:53 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Android Kernel Team <kernel-team@android.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] arm64: cache: Lower ARCH_DMA_MINALIGN to 64
 (L1_CACHE_BYTES)
Message-ID: <YOTY6ZpVIg9cMBt2@yoga>
References: <uHgsRacR8hJ7nW-I-pIcehzg-lNIn7NJvaL7bP9tfAftFsBjsgaY2qTjG9zyBgxHkjNL1WPNrD7YVv2JVD2_Wy-a5VTbcq-1xEi8ZnwrXBo=@protonmail.com>
 <20210706102634.GB24903@arm.com>
 <59800d6c-364a-f4be-e341-c5b531657ba3@arm.com>
 <20210706133314.GB20327@willie-the-truck>
 <f136da2ea91fc22334c552b8c524f6e7@kernel.org>
 <CAK8P3a2xWTvj6HjsC6gH44Ad13adKjK0wR7UxFFQ1i=XYixvQA@mail.gmail.com>
 <87zguz7b6b.wl-maz@kernel.org>
 <CAK8P3a2eFDSdkAUgapGuANQJsO=Arsp4uxoiLRXL-ah0ttc6Fg@mail.gmail.com>
 <m-pFOMXMXSwpPq7H8syJd3qyVkuhGYjVEOgk-iiezAFhr8ApjWX8eIMkcL3updRXOOeOClx88ekyeOvEsNYp_HrY54W4iCSYl8yT03Tykv4=@protonmail.com>
 <CAK8P3a1rtXTtGQ_Q7eg2SOrYa_OhSWPWFiS8m=oSb_GU1uUNXQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a1rtXTtGQ_Q7eg2SOrYa_OhSWPWFiS8m=oSb_GU1uUNXQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 06 Jul 15:33 CDT 2021, Arnd Bergmann wrote:

> On Tue, Jul 6, 2021 at 7:15 PM Yassine Oudjana <y.oudjana@protonmail.com> wrote:
> > > (the numactl command helps run this both on the 'big' and 'little'
> > > cores without running into migration)
> > >
> > > Arnd
> >
> > Here are the results:
> 
> Thanks, that was quick
> 
> > $ numactl -C 0 line -M 1M
> > 128
> > $ numactl -C 3 line -M 1M
> > 128
> > $ numactl -C 0 cache
> > L1 cache: 512 bytes 1.37 nanoseconds 64 linesize -1.00 parallelism
> > L2 cache: 24576 bytes 2.75 nanoseconds 64 linesize 5.06 parallelism
> > L3 cache: 131072 bytes 7.89 nanoseconds 64 linesize 3.85 parallelism
> > L4 cache: 524288 bytes 15.86 nanoseconds 128 linesize 3.48 parallelism
> > Memory latency: 145.93 nanoseconds 4.88 parallelism
> > $ numactl -C 3 cache
> > L1 cache: 24576 bytes 1.29 nanoseconds 64 linesize 5.00 parallelism
> > L2 cache: 1048576 bytes 8.60 nanoseconds 128 linesize 3.07 parallelism
> > Memory latency: 143.29 nanoseconds 5.37 parallelism
> 
> This is still somewhat inconclusive, but it does give some hope. The data that
> I found on random web sites was
> 
> - 32KB L1, 2MB/1MB L2 [1][2]
> - 16KB L1, 1.5MB L2 [3]
> - 32KB L1, 1MB/512KB L2 [4]
> 
> so none of the sizes really line up. My best guess is that the actual hierarchy
> 
> 1MB per-core L2 cache on the two big CPU, 512KB per-core L2 cache on
> the two little ones, but no shared L2 or L3. The older Krait had a 4KB L0
> cache, which could explain the 512-byte L1 output.
> 
> Can you rerun the the 'line' test with '-M 128K' to see if that confirms the 64
> byte L1 line size that the 'cache' test reported?

I can confirm that MSM8996, and a few derivatives, has 128 byte cache
lines.

Regards,
Bjorn
