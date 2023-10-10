Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA4EB7BF5C7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Oct 2023 10:26:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442798AbjJJI0x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Oct 2023 04:26:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442833AbjJJI0t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Oct 2023 04:26:49 -0400
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com [IPv6:2607:f8b0:4864:20::92d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 068C1B9
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Oct 2023 01:26:46 -0700 (PDT)
Received: by mail-ua1-x92d.google.com with SMTP id a1e0cc1a2514c-7abb93528e2so2160505241.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Oct 2023 01:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696926405; x=1697531205; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gxYD0mht6wRxqJ6sAAYMTrwPyt4IIpZM7FRAYXZukGA=;
        b=nBUjMMNmyUb4L2dvCS3vsqezt5sA84YZt440bhEbSqrQ75FrEdpzj5c8qMFaUA4DfN
         XdHwygX6evrq4tGkSsmSFF1OCxXKVrrYQfXHQAYRTTKJMHIL5LgtS6Q0m0NK4VOdqKpA
         kCb1K/BuLa1eqXi0DFHcRIURJsf/a1CKjz6fvOGZb2vzywrPLZ3L2he+gjX7ET2hxlqY
         6Kr+wLJf348dX5MwlesSK07yDNZrB4tqSo7wnjtdBa3i2ibJVAlIDGJirIKcbuS8ft4t
         xQDeklb8SebSQRdVIKJNlsdY+fiCxL4n04phHaBoPQsx+wGl6Uln5j4K87vMycLKDPVa
         RjdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696926405; x=1697531205;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gxYD0mht6wRxqJ6sAAYMTrwPyt4IIpZM7FRAYXZukGA=;
        b=vpLoO9cJ4s9LvtgfAq8kFrbAKKClBRS76RFITjd9fqVB93oj9GAiavKJFpiOFnzOII
         m7eL8fEDYLH+/b41S0aKKfcqq8FhL8WlMq+MKs/D8bAZW16rPIn5Fwsh2fpJklCXnOjn
         44x9UBReJ3kpO7BDZGtsDrwx0jwhIeblw8IVJ1PINkIVtW+ghjkckR7Ul557GAf8YKlD
         vjlrPDWuzMZZ89b3I6j9hMiPhTb5pxcrDGb+BwbrR85/sWfDQ1rM1/Z6W2ZLacCvvZLg
         vuWxnUVjHaOoqDPPhq8croOK5HoDLdedih8TrVMH/QsrJrD/WwHQSDX/W+w8bcH6RIWd
         L7Zg==
X-Gm-Message-State: AOJu0Yz6cpPByZf278dquhvQUcRjmRBG6svpAiJRr+0F3BmBm5+odowo
        7NJ1bv+f+x/8IcIOvg/VmHCiH5NXjsG1aMfsZN17Ug==
X-Google-Smtp-Source: AGHT+IFcDu4LtIP7KaKGrAUc0zTd4azAJy7agJfsjzpEk9oLdnmqY+dI5RDlVWlr2xTgVei3zkeuLIM714LJsVyHzFE=
X-Received: by 2002:a05:6122:17a6:b0:4a0:6fd4:4332 with SMTP id
 o38-20020a05612217a600b004a06fd44332mr5461577vkf.14.1696926405065; Tue, 10
 Oct 2023 01:26:45 -0700 (PDT)
MIME-Version: 1.0
References: <20231009153427.20951-1-brgl@bgdev.pl> <20231009153427.20951-5-brgl@bgdev.pl>
 <f6jspdoeyv6ntcrl6qndy2ud3mcdkoxxcnzqm3qpbtcd3ztdpi@7iw5f5og7is2>
In-Reply-To: <f6jspdoeyv6ntcrl6qndy2ud3mcdkoxxcnzqm3qpbtcd3ztdpi@7iw5f5og7is2>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 10 Oct 2023 10:26:34 +0200
Message-ID: <CAMRc=MchBQrpSqHHs-cD0RmOdSoKt2SLd76a97E8mSmHYGUCUg@mail.gmail.com>
Subject: Re: [PATCH v3 04/15] firmware: qcom: add a dedicated TrustZone buffer allocator
To:     Andrew Halaney <ahalaney@redhat.com>
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 9, 2023 at 11:28=E2=80=AFPM Andrew Halaney <ahalaney@redhat.com=
> wrote:
>
> On Mon, Oct 09, 2023 at 05:34:16PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > We have several SCM calls that require passing buffers to the TrustZone
> > on top of the SMC core which allocates memory for calls that require
> > more than 4 arguments.
> >
> > Currently every user does their own thing which leads to code
> > duplication. Many users call dma_alloc_coherent() for every call which
> > is terribly unperformant (speed- and size-wise).
> >
> > Provide a set of library functions for creating and managing pool of
> > memory which is suitable for sharing with the TrustZone, that is:
> > page-aligned, contiguous and non-cachable as well as provides a way of
> > mapping of kernel virtual addresses to physical space.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---

[snip]

>
> I got these warnings with this series:
>
>     ahalaney@fedora ~/git/linux-next (git)-[7204cc6c3d73] % ARCH=3Darm64 =
CROSS_COMPILE=3Daarch64-linux-gnu- make W=3D1 C=3D2 drivers/firmware/qcom/
>     drivers/firmware/qcom/qcom_tzmem.c:137: warning: Function parameter o=
r member 'size' not described in 'qcom_tzmem_pool_new'
>       CHECK   drivers/firmware/qcom/qcom_tzmem.c
>     drivers/firmware/qcom/qcom_tzmem.c:204:17: warning: incorrect type in=
 assignment (different address spaces)
>     drivers/firmware/qcom/qcom_tzmem.c:204:17:    expected void **slot
>     drivers/firmware/qcom/qcom_tzmem.c:204:17:    got void [noderef] __rc=
u **
>     drivers/firmware/qcom/qcom_tzmem.c:204:17: warning: incorrect type in=
 assignment (different address spaces)
>     drivers/firmware/qcom/qcom_tzmem.c:204:17:    expected void **slot
>     drivers/firmware/qcom/qcom_tzmem.c:204:17:    got void [noderef] __rc=
u **
>     drivers/firmware/qcom/qcom_tzmem.c:204:17: warning: incorrect type in=
 argument 1 (different address spaces)
>     drivers/firmware/qcom/qcom_tzmem.c:204:17:    expected void [noderef]=
 __rcu **slot
>     drivers/firmware/qcom/qcom_tzmem.c:204:17:    got void **slot
>     drivers/firmware/qcom/qcom_tzmem.c:204:17: warning: incorrect type in=
 assignment (different address spaces)
>     drivers/firmware/qcom/qcom_tzmem.c:204:17:    expected void **slot
>     drivers/firmware/qcom/qcom_tzmem.c:204:17:    got void [noderef] __rc=
u **
>     drivers/firmware/qcom/qcom_tzmem.c:339:13: warning: context imbalance=
 in 'qcom_tzmem_to_phys' - wrong count at exit

I fixed the other ones but this one I think comes from CHECK not
dealing correctly with the spinlock guard.

>
>
> All are confusing me, size seems described, I don't know much about
> radix tree usage / rcu, and the locking in qcom_tzmem_to_phys seems sane
> to me but I'm still grappling with the new syntax.
>
> For the one address space one, I _think_ maybe a diff like this is in
> order?
>
>     diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qc=
om/qcom_tzmem.c
>     index b3137844fe43..5b409615198d 100644
>     --- a/drivers/firmware/qcom/qcom_tzmem.c
>     +++ b/drivers/firmware/qcom/qcom_tzmem.c
>     @@ -193,7 +193,7 @@ void qcom_tzmem_pool_free(struct qcom_tzmem_pool =
*pool)
>             struct qcom_tzmem_chunk *chunk;
>             struct radix_tree_iter iter;
>             bool non_empty =3D false;
>     -       void **slot;
>     +       void __rcu **slot;
>
>             if (!pool)
>                     return;
>     @@ -202,7 +202,7 @@ void qcom_tzmem_pool_free(struct qcom_tzmem_pool =
*pool)
>
>             scoped_guard(spinlock_irqsave, &qcom_tzmem_chunks_lock) {
>                     radix_tree_for_each_slot(slot, &qcom_tzmem_chunks, &i=
ter, 0) {
>     -                       chunk =3D *slot;
>     +                       chunk =3D radix_tree_deref_slot_protected(slo=
t, &qcom_tzmem_chunks_lock);

We need to keep the lock taken for the duration of the looping so we
can use the regular radix_tree_deref_slot().

Bart

>
>                             if (chunk->owner =3D=3D pool)
>                                     non_empty =3D true;
>
>
> Still planning on reviewing/testing the rest, but got tripped up there
> so thought I'd highlight it before doing the rest.
>
> Thanks,
> Andrew
>
