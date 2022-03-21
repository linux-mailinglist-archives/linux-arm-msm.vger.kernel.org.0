Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16CB64E2F60
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Mar 2022 18:50:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351108AbiCURvy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Mar 2022 13:51:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245532AbiCURvx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Mar 2022 13:51:53 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6108937AA4
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Mar 2022 10:50:26 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id o8so10819030pgf.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Mar 2022 10:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Xm/AHZsJfo4Q5m1ZRbKY9ffQNuxs1oV6xRmfufFjoRM=;
        b=kNS6QJmKh3GO+IfuqJ35qyUf9JvT2eE7gGsUF6fEL6OHfBxNZnORHfHg29dMmTdk95
         h3yiaRr59guCVWMl/g5HStYr01LJk7VAvcFH0Uo7S3GHl0HFjQHY0VpWHU0HA3pouvPQ
         Ax4v+5z30lwLZJLPotdz1U8/OMCRtt1IxORyMZXni2ammgU0hXufdgDPNyh8oZqZHZn6
         GhX9XX+enV4kie3xxhpTaYB7uS8guxq+DlZ6mLhfU11QMiuTJatqRPce7LB684VHQ2nD
         bYumzEQ5N2fzoTh5muqii5dUbgqgkoUW0WDbxREVA7vZjhYGbRQgvBQ1jaMMTzVqFblI
         /GEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xm/AHZsJfo4Q5m1ZRbKY9ffQNuxs1oV6xRmfufFjoRM=;
        b=oQ4sOY32T0lZ3h8HOOyJHaSo5e6cbndHVyE+Mj5gn8Q6UIMsf4emLeL/kOrnY7twwf
         6Ixsf1zq9p0A6lcT6ZgMqsaAU/9CPyMNocoAJdy7I9wC3tiibuLp2PcV205IoeLU0tTx
         eXUGnAX/xddIjCGM9Y09fNuunHVJj+DdDaSZWVzHmxCXi5xBYb44uatw2v8oHFYhXbeV
         v/N/HU/rKZbVpCN2nescfQzuX62ZU3Ew4oyjnBG2EwWXwbS2cUEnT3QKSgqLJJXlbbLF
         /BHlitgpIl6K16LUhz0DMdRdNN/dRwGgmuGEwd/xNax4UmQLTwwrn5zL5DBQkKH1ODIR
         EfXw==
X-Gm-Message-State: AOAM5313rlSI2FvY1CRSMBb6ZZdZqtXvf9XWyZhxgsJ6Q4CKfmYEp3sV
        EnSir44L16LAO4wE3P7x5fpOj9Jy5nTTyNs+reuW
X-Google-Smtp-Source: ABdhPJyor50zDgeYlpeRIm+dAJQzQOT7vXr1ZMpuFcDQsN9OQLDu0xUGz/AvbUKA5K4OR9808SXN1ToITpXUT+9DNFI=
X-Received: by 2002:a05:6a00:14c7:b0:4f7:4553:c06e with SMTP id
 w7-20020a056a0014c700b004f74553c06emr25059646pfu.45.1647885025646; Mon, 21
 Mar 2022 10:50:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220316213118.2352683-1-morbo@google.com> <YjTJRqlFOsXz7Ss7@dev-arch.thelio-3990X>
 <CAGG=3QUXDj1Bp1kDY2F0dqw=6f8iRqE4nRDyticUrWx-nTb-=A@mail.gmail.com> <YjiYrj5euvidRKHM@builder.lan>
In-Reply-To: <YjiYrj5euvidRKHM@builder.lan>
From:   Bill Wendling <morbo@google.com>
Date:   Mon, 21 Mar 2022 10:50:14 -0700
Message-ID: <CAGG=3QVTyEC5NdLFAwy=SYn7CEKYTE9wF00KMzDutEvXoQesZQ@mail.gmail.com>
Subject: Re: [PATCH] soc: qcom: smem: use correct format characters
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-arm-msm@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 21, 2022 at 8:24 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Fri 18 Mar 13:27 CDT 2022, Bill Wendling wrote:
>
> > On Fri, Mar 18, 2022 at 11:02 AM Nathan Chancellor <nathan@kernel.org> wrote:
> > >
> > > On Wed, Mar 16, 2022 at 02:31:18PM -0700, Bill Wendling wrote:
> > > > When compiling with -Wformat, clang emits the following warnings:
> > > >
> > > > drivers/soc/qcom/smem.c:847:41: warning: format specifies type 'unsigned
> > > > short' but the argument has type 'unsigned int' [-Wformat]
> > > >                         dev_err(smem->dev, "bad host %hu\n", remote_host);
> > > >                                                      ~~~     ^~~~~~~~~~~
> > > >                                                      %u
> > > > ./include/linux/dev_printk.h:144:65: note: expanded from macro 'dev_err'
> > > >         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
> > > >                                                                ~~~     ^~~~~~~~~~~
> > > > ./include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
> > > >                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
> > > >                              ~~~    ^~~~~~~~~~~
> > > > drivers/soc/qcom/smem.c:852:47: warning: format specifies type 'unsigned
> > > > short' but the argument has type 'unsigned int' [-Wformat]
> > > >                         dev_err(smem->dev, "duplicate host %hu\n", remote_host);
> > > >                                                            ~~~     ^~~~~~~~~~~
> > > >                                                            %u
> > > > ./include/linux/dev_printk.h:144:65: note: expanded from macro 'dev_err'
> > > >         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
> > > >                                                                ~~~     ^~~~~~~~~~~
> > > > ./include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
> > > >                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
> > > >                              ~~~    ^~~~~~~~~~~
> > > >
> > > > The types of these arguments are unconditionally defined, so this patch
> > > > updates the format character to the correct ones for ints and unsigned
> > > > ints.
> > >
> > > Right. Alternatively, remote_host could be turned into a u16 to match
> > > host0 and host1, as those are the only values that will ever be assigned
> > > to it, which should have been done in commit 13a920ae7898 ("soc: qcom:
> > > smem: a few last cleanups") to avoid introducing this warning in the
> > > first place.
> > >
> > I'll be happy to redo the patch if the maintainers wish. :-)
> >
>
> Forgive me, but I think that not mixing the unsigned int and u16 would
> look better. So if you're willing to respin this to change the type of
> remote_host, I'd be happy to merge that.
>
Happy to do so! I sent out v2 of this patch. (I didn't mark it as
"PATCH v2" because I forgot about that. Sorry. :-( ).

-bw
