Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E61A57B252C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Sep 2023 20:23:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231406AbjI1SXv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Sep 2023 14:23:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230139AbjI1SXv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Sep 2023 14:23:51 -0400
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com [IPv6:2607:f8b0:4864:20::e2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D74A2BF
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 11:23:48 -0700 (PDT)
Received: by mail-vs1-xe2f.google.com with SMTP id ada2fe7eead31-452962769bdso6302280137.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 11:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1695925428; x=1696530228; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6lUaiAsD9uV0//FhVSk6Od3pR7CJd+sOtqQwhqcrEfk=;
        b=xPCPSdZov6JOwl5X9QWXEoqop+2np/fyd6BkgmT+MIEYV8h5RElQ8q8crc8KQC5vr6
         bC3Rbt1+11NIzI7QzTmG5skbCttfSHlrcnwTmTmWNWwDXnEiOiZ0EWwAwocs//OnkfR1
         OQxdRZ4NfLGrHad0WUTNcok2txcRONeUSkxUfoJynysh2TUkIJJjM45+wEOSkplSkeIF
         wRKIkHqT+nCyUXN6+gD5u2SkbiKACi+IE+elN3OQZ3FEvcryQyfAHfuHJK95DQ2xqVNy
         HlMRmTdHctv5QsRvlPlYtzFNkm9FJEcGOpYnmHDVPTb6+NDCd6OHCOz1HIDtd93/RvfU
         svJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695925428; x=1696530228;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6lUaiAsD9uV0//FhVSk6Od3pR7CJd+sOtqQwhqcrEfk=;
        b=nwA6cn2qWy06HH8UTeZpGG5F+nrtDfaT8Kk8i4AGew4eVBkp6FluABwN7JHo71/REO
         ZWVHhKPuxf83VgLB4JH9Ls5h0nSPGBl233t0RcKobS7a7hHyZf8+HK0+I3in43zlZ8WI
         4eHKLL6nOWU4S7f3FXm9gA3QUGbqaOp8EzJEAfhxJWumM6BkDxUxdMODDA7P/32mqMrf
         DydKUHQGMCWPpJrPwtwivehwUO6fFqo9phpHxC9PBCnHYMOn0ivJJZoycLrHZN6lghhf
         x7/foF6OPHNAMDhD1bbymOEaQW/lntVp7zhMX0qyVaBt+pmemWYoXPv+10qv5lwYLSnx
         n4rg==
X-Gm-Message-State: AOJu0YxJn/Mwc3MGq+e8tpraDQ876hP+y/tKPaP7gT0ahbLZeGiecb3T
        R4M0N3hL10LmiZaHBa76/JdRRJx/esN9fiRI8dQnVA==
X-Google-Smtp-Source: AGHT+IGJDuok+EkGthTBLrhPMTIfi4D8car2cm/ywKltBjmQ+vwJOCAjivQg7Xfj8u0+3jc8LrVtBF53Amql/LCtMEo=
X-Received: by 2002:a67:f754:0:b0:452:7f81:1502 with SMTP id
 w20-20020a67f754000000b004527f811502mr1905774vso.26.1695925427931; Thu, 28
 Sep 2023 11:23:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230928092040.9420-1-brgl@bgdev.pl> <20230928092040.9420-3-brgl@bgdev.pl>
 <be27a31c-6c63-43cd-9857-f4b2a9568cf6@quicinc.com>
In-Reply-To: <be27a31c-6c63-43cd-9857-f4b2a9568cf6@quicinc.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 28 Sep 2023 20:23:36 +0200
Message-ID: <CAMRc=McCqDLQaDP_ordNgHi3-7bGH2Y6H-JU3Uwyh0SOe_BYkg@mail.gmail.com>
Subject: Re: [PATCH v2 02/11] firmware: qcom: scm: add a dedicated SCM memory allocator
To:     Jeff Johnson <quic_jjohnson@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        kernel@quicinc.com,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Sep 28, 2023 at 8:19=E2=80=AFPM Jeff Johnson <quic_jjohnson@quicinc=
.com> wrote:
>
> On 9/28/2023 2:20 AM, Bartosz Golaszewski wrote:
> > +void *qcom_scm_mem_alloc(size_t size, gfp_t gfp)
> > +{
> > +     struct qcom_scm_mem_chunk *chunk;
> > +     unsigned long vaddr;
>
> there are places below where you unnecessarily typecast this to its
> given type
>

Ah, it's a leftover from when this variable was of type void *. Thanks.

> > +     int ret;
> > +
> > +     if (!size)
> > +             return ZERO_SIZE_PTR;
> > +
> > +     size =3D roundup(size, 1 << PAGE_SHIFT);
> > +
> > +     chunk =3D kzalloc(sizeof(*chunk), gfp);
> > +     if (!chunk)
> > +             return NULL;
> > +
> > +     vaddr =3D gen_pool_alloc(qcom_scm_mem.pool, size);
> > +     if (!vaddr) {
> > +             kfree(chunk);
> > +             return NULL;
> > +     }
> > +
> > +     chunk->paddr =3D gen_pool_virt_to_phys(qcom_scm_mem.pool,
> > +                                          (unsigned long)vaddr);
>
> unnecessary typecast?
>
> > +     chunk->size =3D size;
> > +
> > +     scoped_guard(spinlock_irqsave, &qcom_scm_mem.lock) {
>
> my first exposure to this infrastructure..very cool now that I've
> wrapped my head around it! This helped for those also new to this:
> https://lwn.net/Articles/934679/
>

It's amazing but be careful with it. I used it wrong in one place and
got yelled at by Linus Torvalds personally already. :)

Bartosz

> > +             ret =3D radix_tree_insert(&qcom_scm_mem.chunks, vaddr, ch=
unk);
> > +             if (ret) {
> > +                     gen_pool_free(qcom_scm_mem.pool, (unsigned long)v=
addr,
>
> unnecessary typecast?
>
> > +                                   chunk->size);
> > +                     kfree(chunk);
> > +                     return NULL;
> > +             }
> > +     }
> > +
> > +     return (void *)vaddr;
> > +}
>
