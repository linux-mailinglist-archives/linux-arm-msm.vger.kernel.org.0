Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C5DB6460EE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Dec 2022 19:16:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229724AbiLGSQh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Dec 2022 13:16:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229661AbiLGSQg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Dec 2022 13:16:36 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CBD466C82
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Dec 2022 10:16:35 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id c7so14809274pfc.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Dec 2022 10:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Mj3UWzkvZ7OX2zJubhP3xmlv8QJPpAA21OIPnzcsPoc=;
        b=dAmpXo7NBBUyykN9w5qZC2bmk3g136WdBboo4QPjpizGBkGZpyndQRdGighL/hkjP7
         4lg6HgtJExMFM8/Uc5DW4rtyuuHmqk9HpB3siHNOBTJdVBz7oyjSyHyICXj5yfpyEI6w
         4AfuOh8QkF1aTQ4k9Igf8wSLMLWhZPpdHZna7F6PY7PqVm/A2gFGZqdwLfgrZJAxwwD2
         M5hMRrznLBLA4hA3VEFOAkqdXzAuWp4zyn5fU0eUUHSIlgRffTcKnmBjoruE3NjnIQRZ
         U2GXwCWf2S5bqeGmG55Zx/X1kPZV06/cclKuwWK5+0EwGPWRqLXNzWjZmOxresDyUzZQ
         GpOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mj3UWzkvZ7OX2zJubhP3xmlv8QJPpAA21OIPnzcsPoc=;
        b=N/62KFcIf5Txm16YqR2bNucmOWPFHN6Ujp8bnOroe4dDhFp+hlXmnIaEL8cANj550Y
         xECA5zVD6cb9H+wo4Qjj9nd3E5aGfA+l67YvmTerED3wCSMu0uOeVqJ/WK3TCyFHYWh3
         i+R6/D4UbIcbUZccb5gqBFv6vF8lR/1i/1fiQw3Y0LD66xoVVOa76ITnQkCh9/QtQJ9z
         A4iWlxR9zMC+Ss7zYgr86PQGxClBqHSkijicANOcDbOuBoiEiIOcmumE9s5cuKIBRAIT
         cOkFpnVBJHGJGogtj89Vfk6d3xHaFbqW0NwKRhGy2ZuwfOi6g0tnqKWDkaZ/7OGBGn8G
         tEmg==
X-Gm-Message-State: ANoB5pnYyJR2dOgKLaUn+e0jVPqEYX/RizC3ltj5ny/OXznIBJ6SbG/W
        /oByK250KqCpCQjbQFRNLKCMSA==
X-Google-Smtp-Source: AA0mqf4t/o34q9VHa/gWCN16xPhbYWOxeeB/QSdmQn2mhcv2rnOsmYb6HSRa2rxcHo+1hgP9yp8C7Q==
X-Received: by 2002:a63:5146:0:b0:477:86c1:640f with SMTP id r6-20020a635146000000b0047786c1640fmr66827029pgl.231.1670436995047;
        Wed, 07 Dec 2022 10:16:35 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:5942:e1b3:57a1:f106])
        by smtp.gmail.com with ESMTPSA id gt14-20020a17090af2ce00b00219bf165b5fsm1500195pjb.21.2022.12.07.10.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 10:16:34 -0800 (PST)
Date:   Wed, 7 Dec 2022 11:16:32 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     "Aiqun(Maria) Yu" <quic_aiquny@quicinc.com>
Cc:     arnaud.pouliquen@foss.st.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, quic_clew@quicinc.com
Subject: Re: [PATCH v5 2/2] remoteproc: core: change to ordered workqueue for
 crash handler
Message-ID: <20221207181632.GA527346@p14s>
References: <20221202094532.2925-1-quic_aiquny@quicinc.com>
 <20221202094532.2925-3-quic_aiquny@quicinc.com>
 <20221202173403.GD165812@p14s>
 <780b40df-809a-67bf-0b0b-f56df70e6343@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <780b40df-809a-67bf-0b0b-f56df70e6343@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Dec 06, 2022 at 09:28:23AM +0800, Aiqun(Maria) Yu wrote:
> On 12/3/2022 1:34 AM, Mathieu Poirier wrote:
> > On Fri, Dec 02, 2022 at 05:45:32PM +0800, Maria Yu wrote:
> > > Only the first detected crash needed to be handled, so change
> > > to ordered workqueue to avoid unnecessary multi active work at
> > > the same time. This will reduce the pm_relax unnecessary concurrency.
> > > 
> > > Signed-off-by: Maria Yu <quic_aiquny@quicinc.com>
> > > ---
> > >   drivers/remoteproc/remoteproc_core.c | 4 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > > index c2d0af048c69..4b973eea10bb 100644
> > > --- a/drivers/remoteproc/remoteproc_core.c
> > > +++ b/drivers/remoteproc/remoteproc_core.c
> > > @@ -2728,8 +2728,8 @@ static void __exit rproc_exit_panic(void)
> > >   static int __init remoteproc_init(void)
> > >   {
> > > -	rproc_recovery_wq = alloc_workqueue("rproc_recovery_wq",
> > > -						WQ_UNBOUND | WQ_FREEZABLE, 0);
> > > +	rproc_recovery_wq = alloc_ordered_workqueue("rproc_recovery_wq",
> > > +						WQ_FREEZABLE, 0);
> > 
> > There is an indentation issue with the second line and this patch doesn't
> > compile:
> > 
> My Clang 14.0.7 didn't have such kind of compilation error.
> what's your CC version pls? Maybe I can have a try to reproduce.

I was either:

arm-linux-gnueabihf-gcc 9.4.0

or 

aarch64-linux-gnu-gcc 9.4.0

I can't remember if I was compiling for 32 or 64 bit.

> 
> Anyway, I will double confirm if there is any difference with current
> patchset with my compile tested patchset as well.
> 
> >    CC      drivers/remoteproc/imx_dsp_rproc.o
> >    AR      drivers/hwspinlock/built-in.a
> > In file included from /home/mpoirier/work/remoteproc/kernel-review/include/linux/rhashtable-types.h:15,
> >                   from /home/mpoirier/work/remoteproc/kernel-review/include/linux/ipc.h:7,
> >                   from /home/mpoirier/work/remoteproc/kernel-review/include/uapi/linux/sem.h:5,
> >                   from /home/mpoirier/work/remoteproc/kernel-review/include/linux/sem.h:5,
> >                   from /home/mpoirier/work/remoteproc/kernel-review/include/linux/sched.h:15,
> >                   from /home/mpoirier/work/remoteproc/kernel-review/include/linux/delay.h:23,
> >                   from /home/mpoirier/work/remoteproc/kernel-review/drivers/remoteproc/remoteproc_core.c:19:
> > /home/mpoirier/work/remoteproc/kernel-review/drivers/remoteproc/remoteproc_core.c: In function ‘remoteproc_init’:
> > /home/mpoirier/work/remoteproc/kernel-review/drivers/remoteproc/remoteproc_core.c:2738:46: warning: too many arguments for format [-Wformat-extra-args]
> >   2738 |  rproc_recovery_wq = alloc_ordered_workqueue("rproc_recovery_wq",
> >        |                                              ^~~~~~~~~~~~~~~~~~~
> > /home/mpoirier/work/remoteproc/kernel-review/include/linux/workqueue.h:419:18: note: in definition of macro ‘alloc_ordered_workqueue’
> >    419 |  alloc_workqueue(fmt, WQ_UNBOUND | __WQ_ORDERED |  \
> >        |                  ^~~
> > 
> > Last but not least, please use the get_maintainer.pl script to make sure the
> > right people are CC'ed on your patchsets.get_maintainer.pl will be re-run for next patchset uploading.
> Thank you for reminder!
> > 
> > Thanks,
> > Mathieu
> > 
> > >   	if (!rproc_recovery_wq) {
> > >   		pr_err("remoteproc: creation of rproc_recovery_wq failed\n");
> > >   		return -ENOMEM;
> > > -- 
> > > 2.17.1
> > > 
> 
> 
> -- 
> Thx and BRs,
> Aiqun(Maria) Yu
