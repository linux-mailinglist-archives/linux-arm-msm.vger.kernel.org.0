Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 202847C5E1C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Oct 2023 22:14:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233308AbjJKUOn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Oct 2023 16:14:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233279AbjJKUOm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Oct 2023 16:14:42 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 680D09D
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Oct 2023 13:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1697055233;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bYit+PDu9PL4z4YO7eZa6nfZUOBQU0KXacY8Uj59d+o=;
        b=hpbwj8YnN4oEkiMTmVR/14764P2tjFNx5D3oWB9Y+eUO6ZFDYuhLeyYU5p3S1aW4HxADur
        NJFXCGd0EObrybbqg9VcBtLgmmmfxNSt7MD6Ob1NHDykUSlMBvlr0Psed3PIa1mEFHJGZv
        qHf9cf1E0/7guAtignsdb0IcH23Yqqc=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-bqbYgFMEPdu5iqwr_CQrTA-1; Wed, 11 Oct 2023 16:13:47 -0400
X-MC-Unique: bqbYgFMEPdu5iqwr_CQrTA-1
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-774086da4dbso25830885a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Oct 2023 13:13:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697055226; x=1697660026;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bYit+PDu9PL4z4YO7eZa6nfZUOBQU0KXacY8Uj59d+o=;
        b=gbeKgnfOs1vAsOC/I7l3nHL4+74NuLDKnvmO2oaqOt78MgffPKDEU0abvEyDkP4GM6
         Hjw3lAAb/p50iyj42pz+u/hmqUX0N7cUJpb9GQEls9XSG6lcpOHjm8RCiIBrUKDjueP/
         k4QPyWolH0zDjQkImOb98MihzBbwDGZyRaMu+8txB3Z1YT56iONOMgLwYf6ARxDKYWIX
         0AJgru6WSVE3Hnc2PlMVuKAszPmZPIsf3DSifOe1lC4Ehwv9Xghd3CtYYNAXxGbv8nva
         sLxcnluLQld8/0Y1TywMAbXTc5vpOh+kvf650DBOtlOT9zS4DJBoJD/44VhBgBbST4jv
         x03g==
X-Gm-Message-State: AOJu0Yy1VTzSx8/DfdKlftZw+mimY4BvHyrLs+DQ2nNLjoD4Eemm3wpd
        RknVCRF5KUbeahzIYSJgSH52jHu9mz3Fl90Ikq1yyvD8NGwvmYUUHnaOFzisYs9By9V67KVjGxh
        Dle/Y7PRQ5KWcD/XX9rLr4sRm8w==
X-Received: by 2002:a05:620a:1da4:b0:774:2e8a:ccc6 with SMTP id pj36-20020a05620a1da400b007742e8accc6mr20969910qkn.32.1697055226648;
        Wed, 11 Oct 2023 13:13:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3gduk370dapNuDdUw/KKVll6KhLtRpucqRY7dFPOFVLxAyKy6n5IZWNdLd+zVDz6btUrMpQ==
X-Received: by 2002:a05:620a:1da4:b0:774:2e8a:ccc6 with SMTP id pj36-20020a05620a1da400b007742e8accc6mr20969892qkn.32.1697055226350;
        Wed, 11 Oct 2023 13:13:46 -0700 (PDT)
Received: from fedora ([2600:1700:1ff0:d0e0::37])
        by smtp.gmail.com with ESMTPSA id os22-20020a05620a811600b007757acf488esm5473106qkn.39.2023.10.11.13.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 13:13:46 -0700 (PDT)
Date:   Wed, 11 Oct 2023 15:13:43 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Guru Das Srinagesh <quic_gurus@quicinc.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Alex Elder <elder@linaro.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kernel@quicinc.com,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v3 07/15] firmware: qcom: scm: make qcom_scm_assign_mem()
 use the TZ allocator
Message-ID: <3tguyivqgoovzil7mqivkyx5n5n27qnwqh36dvz36s46vgqd7s@qi6zqxj5pswk>
References: <20231009153427.20951-1-brgl@bgdev.pl>
 <20231009153427.20951-8-brgl@bgdev.pl>
 <v5ty4xeshodjlpyatqlrjipqejazamuhqhauorujveyqzpikoq@rftlvk6354yx>
 <CAMRc=MdGABGa_bc3_ug+iSKtMg9pcKe40F7zv9Ff2C0ed8i2=Q@mail.gmail.com>
 <nq6m3v2wflhv5qgxtllympnzqtbtcn7d7ihgw5rdpvqjugv2xs@4vpuzoopkeic>
 <CAMRc=MdO3ctA-g=VVhXp9QKPdUT1XX0iEKTzEKzHjNzh_=-jPQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdO3ctA-g=VVhXp9QKPdUT1XX0iEKTzEKzHjNzh_=-jPQ@mail.gmail.com>
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_NONE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Oct 11, 2023 at 04:33:53PM +0200, Bartosz Golaszewski wrote:
> On Wed, Oct 11, 2023 at 3:54 PM Andrew Halaney <ahalaney@redhat.com> wrote:
> >
> > On Wed, Oct 11, 2023 at 09:41:49AM +0200, Bartosz Golaszewski wrote:
> > > On Wed, Oct 11, 2023 at 12:19 AM Andrew Halaney <ahalaney@redhat.com> wrote:
> > > >
> > > > On Mon, Oct 09, 2023 at 05:34:19PM +0200, Bartosz Golaszewski wrote:
> > > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > > >
> > > > > Let's use the new TZ memory allocator to obtain a buffer for this call
> > > > > instead of using dma_alloc_coherent().
> > > > >
> > > > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > > > ---
> > > > >  drivers/firmware/qcom/qcom_scm.c | 10 ++++++----
> > > > >  1 file changed, 6 insertions(+), 4 deletions(-)
> > > > >
> > > > > diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> > > > > index 71e98b666391..754f6056b99f 100644
> > > > > --- a/drivers/firmware/qcom/qcom_scm.c
> > > > > +++ b/drivers/firmware/qcom/qcom_scm.c
> > > > > @@ -4,6 +4,7 @@
> > > > >   */
> > > > >
> > > > >  #include <linux/arm-smccc.h>
> > > > > +#include <linux/cleanup.h>
> > > > >  #include <linux/clk.h>
> > > > >  #include <linux/completion.h>
> > > > >  #include <linux/cpumask.h>
> > > > > @@ -998,14 +999,13 @@ int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
> > > > >       struct qcom_scm_mem_map_info *mem_to_map;
> > > > >       phys_addr_t mem_to_map_phys;
> > > > >       phys_addr_t dest_phys;
> > > > > -     dma_addr_t ptr_phys;
> > > > > +     phys_addr_t ptr_phys;
> > > > >       size_t mem_to_map_sz;
> > > > >       size_t dest_sz;
> > > > >       size_t src_sz;
> > > > >       size_t ptr_sz;
> > > > >       int next_vm;
> > > > >       __le32 *src;
> > > > > -     void *ptr;
> > > >
> > > > nit: couldn't you keep this up here?
> > > >
> > >
> > > This still needs to make its way into the coding style guide but I got
> > > yelled at by Linus Torvalds personally for not declaring the managed
> > > variables where they are initialized. So this is the correct approach.
> >
> > I'm being a stick in the mud, but couldn't you initialize to NULL and
> > keep them all up top? That seems more in line with the current "declare
> > all variables at the start of function" guideline the kernel follows.
> >
> > Not a big deal... yours call! but /me shrugs
> >
> 
> I agree with you but it's not my call to make. Please see[1].
> 

Yeah, I see you're following the guidance there (declare + initialize
together unless there's a conditional, etc, preventing that) in this
series. Thanks for the pointer.

> Bartosz
> 
> [1] https://lore.kernel.org/lkml/20230919193516.GA20937@noisy.programming.kicks-ass.net/T/#m7f97e10dbfde777f58493398a77933e6a2f3c15d
> 
> > >
> > > Bart
> > >
> > > > Otherwise,
> > > >
> > > > Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
> > > >
> > > > >       int ret, i, b;
> > > > >       u64 srcvm_bits = *srcvm;
> > > > >
> > > > > @@ -1015,10 +1015,13 @@ int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
> > > > >       ptr_sz = ALIGN(src_sz, SZ_64) + ALIGN(mem_to_map_sz, SZ_64) +
> > > > >                       ALIGN(dest_sz, SZ_64);
> > > > >
> > > > > -     ptr = dma_alloc_coherent(__scm->dev, ptr_sz, &ptr_phys, GFP_KERNEL);
> > > > > +     void *ptr __free(qcom_tzmem) = qcom_tzmem_alloc(__scm->mempool,
> > > > > +                                                     ptr_sz, GFP_KERNEL);
> > > > >       if (!ptr)
> > > > >               return -ENOMEM;
> > > > >
> > > > > +     ptr_phys = qcom_tzmem_to_phys(ptr);
> > > > > +
> > > > >       /* Fill source vmid detail */
> > > > >       src = ptr;
> > > > >       i = 0;
> > > > > @@ -1047,7 +1050,6 @@ int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
> > > > >
> > > > >       ret = __qcom_scm_assign_mem(__scm->dev, mem_to_map_phys, mem_to_map_sz,
> > > > >                                   ptr_phys, src_sz, dest_phys, dest_sz);
> > > > > -     dma_free_coherent(__scm->dev, ptr_sz, ptr, ptr_phys);
> > > > >       if (ret) {
> > > > >               dev_err(__scm->dev,
> > > > >                       "Assign memory protection call failed %d\n", ret);
> > > > > --
> > > > > 2.39.2
> > > > >
> > > >
> > >
> >
> 

