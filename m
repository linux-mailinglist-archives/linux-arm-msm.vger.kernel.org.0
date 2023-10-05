Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C17F7B9F9A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Oct 2023 16:26:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234097AbjJEOZ1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Oct 2023 10:25:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234734AbjJEOXe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Oct 2023 10:23:34 -0400
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBE79769F
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 Oct 2023 00:12:54 -0700 (PDT)
Received: by mail-vs1-xe2b.google.com with SMTP id ada2fe7eead31-45260b91a29so320558137.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Oct 2023 00:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696489974; x=1697094774; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OogRoZfS+KCs50xXFrJ7TjK5qXdEjTWJkgAZyfQ+l0g=;
        b=ugxIEeSad8acpJHqII7iFa5Ktdh8QZ4oecWcCFQ5y/hbHFJlvFqMJv9iDmGt4Lxh7+
         dV/841iTvGfLm8FvRAx8S7S5p7nYC56uJN1YDkyKU/ud46bJsV1RgWc3492DQaeg2DYp
         3t6IkJM00/YebzlpF6adezg4P+8qiyBHPT/Icq/LZFEEmm8UKqHKdR7SAs7KFkznDpXs
         av3ai7azrNNoyDelT8THXPsTjxJN8X8hZm04cdaerDShut4ju0/5yS9Nwxw1MPFE2UH/
         O7B6Zssgee84pSqnmFGfnxCJci3XH/xzTE8qqjQh8DGV8dD/aTVqZi+Fc1SZToXRgQuH
         WO8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696489974; x=1697094774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OogRoZfS+KCs50xXFrJ7TjK5qXdEjTWJkgAZyfQ+l0g=;
        b=pBcJdFYO0x5t2YPN8ZKsALcPjiPsDbNrOgweEIzqeRO5ju097W2NC7IdZSaomvZ5iw
         SxR3E/rUIrnLPJoUFjPMVarI9b+lAbjgDqagORec9h+7QYk2bu6zNdc0qPi8zNHrJJeN
         /S2KhlOyyXdJyYGJaeFbymoskp+wubNQyEqzqhfOqRGmQ0G+f9hHBsLWZ7QUy3rTRhHm
         OEnxbDO6rbqJU4tF9OqmkuPtr3TygUnPxU5nXS28+fdBm9DPqOgS5vHP4Hh//bIUHTgM
         n/Tpll/ZkTTXDb9bv8XQyEtrwbxLTFq7lEA1+YSGEBL+HmnXe2QQzOjPqr9rRQFwQuUt
         RndQ==
X-Gm-Message-State: AOJu0YwDk4ANXCSQx0D4ev8IKgwc0uoBnvd4Ywd6vKeyivnFz1q49zdI
        6vJKg5h5RRL3iv0F3WHQJ3yobrPihLCGUyccmxqrCg==
X-Google-Smtp-Source: AGHT+IEkTEShELFzLmOYm9pZifwz8zN1dpxg4FkFmg/0S8ndh86LLvirqKPTBfa+qn+UdVEXq6k6eCTWXmQPRTJ8jPE=
X-Received: by 2002:a05:6102:354d:b0:450:fcad:ff23 with SMTP id
 e13-20020a056102354d00b00450fcadff23mr3890408vss.32.1696489973920; Thu, 05
 Oct 2023 00:12:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230928092040.9420-1-brgl@bgdev.pl> <20230928092040.9420-12-brgl@bgdev.pl>
 <4ab66f17-4686-411f-b829-74eab3489568@gmail.com>
In-Reply-To: <4ab66f17-4686-411f-b829-74eab3489568@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 5 Oct 2023 09:12:42 +0200
Message-ID: <CAMRc=MebkzaLUtTn20V9f0FU1PbGrUGSHAJR+j3nVpc6wdJnsQ@mail.gmail.com>
Subject: Re: [PATCH v2 11/11] firmware: qcom: scm: enable SHM bridge
To:     Maximilian Luz <luzmaximilian@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        kernel@quicinc.com,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 5, 2023 at 12:24=E2=80=AFAM Maximilian Luz <luzmaximilian@gmail=
.com> wrote:
>
> On 9/28/23 11:20, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Extens the SCM memory allocator with using the SHM Bridge feature if
> > available on the platform. This makes the trustzone only use dedicated
> > buffers for SCM calls. We map the entire SCM genpool as a bridge.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> This patch breaks something in early boot on my Surface Pro X (sc8180x).
> Unfortunately I can't provide many details at the moment because the
> only thing I can see are RCU stalls, and the traces from them are quite
> useless.
>
> Without this patch, the rest of the series (with the fix you posted on
> patch 6 applied) seems to work fine. Including both RFT qseecom patches.
>
> I plan to have a closer look at this once I have some more time though.
>

Can it be the PAS image loading? This is something Andrew reported and
I have it fixed for v3.

Bart

> Regards,
> Max
>
> > ---
> >   drivers/firmware/qcom/qcom_scm-mem.c | 42 ++++++++++++++++++++++++++-=
-
> >   1 file changed, 39 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/firmware/qcom/qcom_scm-mem.c b/drivers/firmware/qc=
om/qcom_scm-mem.c
> > index eafecbe23770..12b12b15f46f 100644
> > --- a/drivers/firmware/qcom/qcom_scm-mem.c
> > +++ b/drivers/firmware/qcom/qcom_scm-mem.c
> > @@ -16,6 +16,8 @@
> >
> >   #include "qcom_scm.h"
> >
> > +#define QCOM_SHM_BRIDGE_NUM_VM_SHIFT 9
> > +
> >   static size_t qcom_scm_mem_pool_size =3D SZ_2M;
> >   module_param_named(qcom_scm_mem_pool_size, qcom_scm_mem_pool_size,
> >                  ulong, 0400);
> > @@ -108,8 +110,24 @@ phys_addr_t qcom_scm_mem_to_phys(void *vaddr)
> >       return chunk->paddr;
> >   }
> >
> > +static int qcom_scm_mem_shm_bridge_create(void)
> > +{
> > +     uint64_t pfn_and_ns_perm, ipfn_and_s_perm, size_and_flags, ns_per=
ms;
> > +
> > +     ns_perms =3D (QCOM_SCM_PERM_WRITE | QCOM_SCM_PERM_READ);
> > +     pfn_and_ns_perm =3D (u64)qcom_scm_mem.pbase | ns_perms;
> > +     ipfn_and_s_perm =3D (u64)qcom_scm_mem.pbase | ns_perms;
> > +     size_and_flags =3D qcom_scm_mem.size | (1 << QCOM_SHM_BRIDGE_NUM_=
VM_SHIFT);
> > +
> > +     return qcom_scm_create_shm_bridge(qcom_scm_mem.dev, pfn_and_ns_pe=
rm,
> > +                                       ipfn_and_s_perm, size_and_flags=
,
> > +                                       QCOM_SCM_VMID_HLOS);
> > +}
> > +
> >   int qcom_scm_mem_enable(struct device *dev)
> >   {
> > +     int ret;
> > +
> >       INIT_RADIX_TREE(&qcom_scm_mem.chunks, GFP_ATOMIC);
> >       spin_lock_init(&qcom_scm_mem.lock);
> >       qcom_scm_mem.dev =3D dev;
> > @@ -128,7 +146,25 @@ int qcom_scm_mem_enable(struct device *dev)
> >
> >       gen_pool_set_algo(qcom_scm_mem.pool, gen_pool_best_fit, NULL);
> >
> > -     return gen_pool_add_virt(qcom_scm_mem.pool,
> > -                              (unsigned long)qcom_scm_mem.vbase,
> > -                              qcom_scm_mem.pbase, qcom_scm_mem.size, -=
1);
> > +     ret =3D gen_pool_add_virt(qcom_scm_mem.pool,
> > +                             (unsigned long)qcom_scm_mem.vbase,
> > +                             qcom_scm_mem.pbase, qcom_scm_mem.size, -1=
);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D qcom_scm_enable_shm_bridge();
> > +     if (ret) {
> > +             if (ret =3D=3D EOPNOTSUPP)
> > +                     dev_info(dev, "SHM Bridge not supported\n");
> > +             else
> > +                     return ret;
> > +     } else {
> > +             ret =3D qcom_scm_mem_shm_bridge_create();
> > +             if (ret)
> > +                     return ret;
> > +
> > +             dev_info(dev, "SHM Bridge enabled\n");
> > +     }
> > +
> > +     return 0;
> >   }
