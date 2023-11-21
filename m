Return-Path: <linux-arm-msm+bounces-1318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B7B7F293C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 10:47:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8821C1C20D91
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 09:47:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAFA538DC1;
	Tue, 21 Nov 2023 09:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JAB7KdF3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC472F4
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Nov 2023 01:47:39 -0800 (PST)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-5cb8440a23cso5635227b3.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Nov 2023 01:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700560059; x=1701164859; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OafUR08q0YCJ/66uYfFPZzQ+AA8BpAx9HNx2y4mOB9Q=;
        b=JAB7KdF3UJaTNMN/CeVVRjK6ZOTixWxQ0zm3K+etvDr2up1/2635vvuwitlSGddvv7
         P7iHWlBSbHRoKG8W9Dg2alvEWT32xH770bd+T6xUqVn5l3VzK4g7K0DwQYU+O+G+Xu/I
         rWosI2MCacieFibrUGyvjcMi3sJ9HUCK0hEQ3FLCWMHSKtww0XvYPEN/GKPQz+SRb71p
         3RKWxgL+Pzj4GZmWGNimz3wrcRDLTffeXuMXe7kP81EFMwGIi72/NJoX3oPoHBvbp0vJ
         3eIsiAZ4pUF2Q5Rma9I25ZWqaHdP8BYS/uvw7doGkp92iBuEAS4s1F/K/TtSclngc7Lf
         e2YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700560059; x=1701164859;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OafUR08q0YCJ/66uYfFPZzQ+AA8BpAx9HNx2y4mOB9Q=;
        b=DupZrYmDHlQXAb+9moVQkTNI+zZ7v3hEm+pmKaVydbWPvlPivw/Wf/KqhcTt39VIlz
         1l/J72J8ulOXi3Ig+2ucdIfdfrzlrQNpCS/ec/XWDou29s0TZ5Y07Wr2FTKoHn9RkL4s
         psLNDKQS9ruzXhLRf4SpjEB+R4xkNCZzxEfrQgTVr00kRw1GCWYnmxADi3JPN1eZfEGm
         tQQvwDAJSYoLrJEEbY/ufZoJJzlMK+2auW2qaoQvO5BFIxKSCRQI9zHi+Dz94knCSwxV
         yNztEyKMzC5RNXEQ0Fr57u2ozFUSNaTQRVOBNQ+M8EjhEH1bfBvqHBAeAweqKUpWb1wK
         p7Og==
X-Gm-Message-State: AOJu0Yxjpx8UznECWB2VPsNNPRN45mc30Zpjl+VfpB2KvQ5WLr/WprAN
	gEQuyJVI1Ct2I+y5kNR2zeaL1NJjq9zgY9bALWqwfA==
X-Google-Smtp-Source: AGHT+IFhx06H1N1AuTlhLr5rUGaXwMw5pegkNRx+a1uz3ea8OpZoMmYO3Fts+35J4xfy7g1FV+zhW1CYBij0W1q/eRU=
X-Received: by 2002:a05:690c:7:b0:5c9:fed2:89c7 with SMTP id
 bc7-20020a05690c000700b005c9fed289c7mr8563449ywb.32.1700560058866; Tue, 21
 Nov 2023 01:47:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231120132118.30473-1-brgl@bgdev.pl> <20231120132118.30473-4-brgl@bgdev.pl>
 <9315c8f1-19b8-9b11-8eb4-32b498f91659@quicinc.com>
In-Reply-To: <9315c8f1-19b8-9b11-8eb4-32b498f91659@quicinc.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Tue, 21 Nov 2023 10:47:27 +0100
Message-ID: <CACMJSev_cNNeOkhm0R=r+tqG-iGACL8Gif5P5dyyJXxL65RH=Q@mail.gmail.com>
Subject: Re: [RESEND PATCH v5 03/12] firmware: qcom: scm: smc: switch to using
 the SCM allocator
To: Prasad Sodagudi <quic_psodagud@quicinc.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Elliot Berman <quic_eberman@quicinc.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Guru Das Srinagesh <quic_gurus@quicinc.com>, Andrew Halaney <ahalaney@redhat.com>, 
	Maximilian Luz <luzmaximilian@gmail.com>, Alex Elder <elder@linaro.org>, 
	Srini Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 21 Nov 2023 at 07:38, Prasad Sodagudi <quic_psodagud@quicinc.com> wrote:
>
>
> On 11/20/2023 5:21 AM, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > We need to allocate, map and pass a buffer to the trustzone if we have
> > more than 4 arguments for a given SCM calls. Let's use the new TrustZone
> > allocator for that memory and shrink the code in process.
> >
> > As this code lives in a different compilation unit than the rest of the
> > SCM code, we need to provide a helper in the form of
> > qcom_scm_get_tzmem_pool() that allows the SMC low-level routines to
> > access the SCM memory pool.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
> > Tested-by: Andrew Halaney <ahalaney@redhat.com> # sc8280xp-lenovo-thinkpad-x13s
> > ---
> >   drivers/firmware/qcom/qcom_scm-smc.c | 30 ++++++++--------------------
> >   drivers/firmware/qcom/qcom_scm.c     |  5 +++++
> >   drivers/firmware/qcom/qcom_scm.h     |  3 +++
> >   3 files changed, 16 insertions(+), 22 deletions(-)
> >
> > diff --git a/drivers/firmware/qcom/qcom_scm-smc.c b/drivers/firmware/qcom/qcom_scm-smc.c
> > index 16cf88acfa8e..dca5f3f1883b 100644
> > --- a/drivers/firmware/qcom/qcom_scm-smc.c
> > +++ b/drivers/firmware/qcom/qcom_scm-smc.c
> > @@ -2,6 +2,7 @@
> >   /* Copyright (c) 2015,2019 The Linux Foundation. All rights reserved.
> >    */
> >
> > +#include <linux/cleanup.h>
> >   #include <linux/io.h>
> >   #include <linux/errno.h>
> >   #include <linux/delay.h>
> > @@ -9,6 +10,7 @@
> >   #include <linux/slab.h>
> >   #include <linux/types.h>
> >   #include <linux/firmware/qcom/qcom_scm.h>
> > +#include <linux/firmware/qcom/qcom_tzmem.h>
> >   #include <linux/arm-smccc.h>
> >   #include <linux/dma-mapping.h>
> >
> > @@ -150,11 +152,10 @@ int __scm_smc_call(struct device *dev, const struct qcom_scm_desc *desc,
> >                  enum qcom_scm_convention qcom_convention,
> >                  struct qcom_scm_res *res, bool atomic)
> >   {
> > +     struct qcom_tzmem_pool *mempool = qcom_scm_get_tzmem_pool();
> >       int arglen = desc->arginfo & 0xf;
> >       int i, ret;
> > -     dma_addr_t args_phys = 0;
> > -     void *args_virt = NULL;
> > -     size_t alloc_len;
> > +     void *args_virt __free(qcom_tzmem) = NULL;
> >       gfp_t flag = atomic ? GFP_ATOMIC : GFP_KERNEL;
> >       u32 smccc_call_type = atomic ? ARM_SMCCC_FAST_CALL : ARM_SMCCC_STD_CALL;
> >       u32 qcom_smccc_convention = (qcom_convention == SMC_CONVENTION_ARM_32) ?
> > @@ -172,9 +173,9 @@ int __scm_smc_call(struct device *dev, const struct qcom_scm_desc *desc,
> >               smc.args[i + SCM_SMC_FIRST_REG_IDX] = desc->args[i];
> >
> >       if (unlikely(arglen > SCM_SMC_N_REG_ARGS)) {
> > -             alloc_len = SCM_SMC_N_EXT_ARGS * sizeof(u64);
> > -             args_virt = kzalloc(PAGE_ALIGN(alloc_len), flag);
> > -
> > +             args_virt = qcom_tzmem_alloc(mempool,
> > +                                          SCM_SMC_N_EXT_ARGS * sizeof(u64),
> > +                                          flag);
>
> I remember seeing page alignment for this memory allocation in
> downstream code too.
>
> I think, after moving to qcom_tzmem_alloc page alignment is not
> followed. Is this cross checked with firmware requirements?
>

All SCM call requirements are still respected behind the scenes by the
allocator. Please see the implementations of qcom_tzmem_pool_new() and
qcom_tzmem_alloc().

Bart

> >               if (!args_virt)
> >                       return -ENOMEM;
> >
> > @@ -192,25 +193,10 @@ int __scm_smc_call(struct device *dev, const struct qcom_scm_desc *desc,
> >                                                     SCM_SMC_FIRST_EXT_IDX]);
> >               }
> >
> > -             args_phys = dma_map_single(dev, args_virt, alloc_len,
> > -                                        DMA_TO_DEVICE);
> > -
> > -             if (dma_mapping_error(dev, args_phys)) {
> > -                     kfree(args_virt);
> > -                     return -ENOMEM;
> > -             }
> > -
> > -             smc.args[SCM_SMC_LAST_REG_IDX] = args_phys;
> > +             smc.args[SCM_SMC_LAST_REG_IDX] = qcom_tzmem_to_phys(args_virt);
> >       }
> >
> > -     /* ret error check follows after args_virt cleanup*/
> >       ret = __scm_smc_do(dev, &smc, &smc_res, atomic);
> > -
> > -     if (args_virt) {
> > -             dma_unmap_single(dev, args_phys, alloc_len, DMA_TO_DEVICE);
> > -             kfree(args_virt);
> > -     }
> > -
> >       if (ret)
> >               return ret;
> >
> > diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> > index 0d4c028be0c1..71e98b666391 100644
> > --- a/drivers/firmware/qcom/qcom_scm.c
> > +++ b/drivers/firmware/qcom/qcom_scm.c
> > @@ -201,6 +201,11 @@ static void qcom_scm_bw_disable(void)
> >   enum qcom_scm_convention qcom_scm_convention = SMC_CONVENTION_UNKNOWN;
> >   static DEFINE_SPINLOCK(scm_query_lock);
> >
> > +struct qcom_tzmem_pool *qcom_scm_get_tzmem_pool(void)
> > +{
> > +     return __scm->mempool;
> > +}
> > +
> >   static enum qcom_scm_convention __get_convention(void)
> >   {
> >       unsigned long flags;
> > diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
> > index 4532907e8489..aa7d06939f8e 100644
> > --- a/drivers/firmware/qcom/qcom_scm.h
> > +++ b/drivers/firmware/qcom/qcom_scm.h
> > @@ -5,6 +5,7 @@
> >   #define __QCOM_SCM_INT_H
> >
> >   struct device;
> > +struct qcom_tzmem_pool;
> >
> >   enum qcom_scm_convention {
> >       SMC_CONVENTION_UNKNOWN,
> > @@ -78,6 +79,8 @@ int scm_legacy_call_atomic(struct device *dev, const struct qcom_scm_desc *desc,
> >   int scm_legacy_call(struct device *dev, const struct qcom_scm_desc *desc,
> >                   struct qcom_scm_res *res);
> >
> > +struct qcom_tzmem_pool *qcom_scm_get_tzmem_pool(void);
> > +
> >   #define QCOM_SCM_SVC_BOOT           0x01
> >   #define QCOM_SCM_BOOT_SET_ADDR              0x01
> >   #define QCOM_SCM_BOOT_TERMINATE_PC  0x02

