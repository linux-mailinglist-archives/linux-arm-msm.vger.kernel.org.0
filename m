Return-Path: <linux-arm-msm+bounces-33451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA15B993807
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 22:14:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E1821F22037
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 20:14:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08A7E1DE4DD;
	Mon,  7 Oct 2024 20:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MnID6JNF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DAA01DE2A5
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Oct 2024 20:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728332039; cv=none; b=hXecJ56ffaOpi0ekQJ55vGHEd/aLkojuhfMwSS6vsf59DhBoOJtEkBBLeAs5Vk+Ni6m2jhJ3eFdnWBSedIOWu3CIM4g1RaVq1XhNne9pWF9uqv06zRBNC/a7rDAN/9KNcMryoGHqWotee+M4yMZTdESi9H/8YANqvh0Og/Kbdx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728332039; c=relaxed/simple;
	bh=dYf0vNhufwXL6YYKPS8LYNCtI04PBWt28yE5E2EJ0pw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sn/39RydSTFP49D+hGtOjacBbicKujzJxAI6Au2sq/3fOELV1wIAXFp+i7UwTSWsFqsvuvULjg65jVJ5GcXHibbCYTQBrbpSc2I9lZfgoK6AjodKR++IJ5ocMSQwRbffjVWnXhWMkIuSGQigbzMsprHFveRS2XBuY1zipgRqbcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MnID6JNF; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6e2fef23839so10176517b3.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Oct 2024 13:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728332037; x=1728936837; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZoXiivIPsvv87cjrNNR6k9YUkmVHQ+v2vRTV4AcmfZ4=;
        b=MnID6JNFHUlPiZFc0c0r2z16VY+0JNmVm3xUosojF3OgMYx17/buG6PGI0jEGPTdJH
         19637EUMvhi3NuibMqAU7SVwaQYYdSDGOvsukx3RID+xasLXZ7fUeFzSEfxv+Dcptwal
         GShqPF+vy/j7HivtUp0XeHhZa0Vjm5aKe1Wi7dwUCOUTqceTr0DKetT6e5yPIvQz90/5
         FvdWIxP/Rn8nXEF0tCEMRa9XpIsz6oH3BCI4erc1I0FhBdK0excPsa8XDXLkrit7J1Iu
         DO5h7tBspQoNORyeFgB/8QGB1V9AkRFc+hAyBnR8vgE56IaYJrkg1aIQRAVpgitS9r57
         Msdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728332037; x=1728936837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZoXiivIPsvv87cjrNNR6k9YUkmVHQ+v2vRTV4AcmfZ4=;
        b=GeXk66H+c9WN3oAPUij/viMxJgrBmo7Mic37lQczku+cZK1/K1i/eJkf6CiW++ZDYw
         WNCdoesnKn6yUeQMLB50z2oiTiulv2D8t46mi7zJSZ0k2cIFH66FUY6ar1nsoK3VVhf3
         NF5dpbYoXKnCNpf3JX9TqVUpbUo92ZPtU4zBA5xTCplwgdxnf18dL5v1XwWxBACPVqgA
         97oCy79ZUHIswN2wTYJxtRvEY177hzzJHNQ0LzaLUBXt0f7KSGbhPyfS/PE+AYtXBvfN
         0prEszAfuL6iY2F4TqlQ6p2lVskjk0hOeDPlDarROg8KIRebz4+yu/KJMPNdhmwA/LKD
         zBhA==
X-Forwarded-Encrypted: i=1; AJvYcCViI0n5+YOkVGCKJiDmmNIaYIhCgZBnEylIWyLmPjwC8CTPtO/5Xf/N3yvER8zkeqgvJp0cMQwl8eReMrHG@vger.kernel.org
X-Gm-Message-State: AOJu0YzMP335uIURljcCco9aoYoLzUF+XyAZ75BcO0Z311jOShsWMqTR
	aO1epy8Fext5U9FVzSGPvl7Bu8FBWIKA6/9Dbpd9f+9TJM5+3z27D3dcY+8Fz35IIx80t1dEV4V
	tQUcEfvCZh7U8EoGmgBxNIguGft8MNwRkr9D8zpGJOmqQdfbXylpGvXsB
X-Google-Smtp-Source: AGHT+IEemXp+EwkiqGhHJcXGCpvIbGD3LaTbLUsZH/iRvPEavrRlY5OGsv6kRpFh6IICBCS1cCjdPY7p2JkZOKY8R8c=
X-Received: by 2002:a05:690c:b:b0:6e2:167e:814f with SMTP id
 00721157ae682-6e2c7289b2emr91643627b3.31.1728332037260; Mon, 07 Oct 2024
 13:13:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241005140150.4109700-1-quic_kuldsing@quicinc.com>
 <20241005140150.4109700-3-quic_kuldsing@quicinc.com> <wzrj4vhrb4h3pe5dft7vqz2tl55txdyuciuxlysuck5isi7r4z@bs2ts3popy2t>
 <2eb53ea6-848a-48bb-8c31-83a118bc5a73@quicinc.com>
In-Reply-To: <2eb53ea6-848a-48bb-8c31-83a118bc5a73@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 7 Oct 2024 22:13:46 +0200
Message-ID: <CAA8EJppEQKJ=oQh=TeFaP0z1sXDQhz=LN_TC4YygiLOe_EX6Tw@mail.gmail.com>
Subject: Re: [PATCH 2/2] firmware: qcom: qcom_tzmem: Implement sanity checks
To: Kuldeep Singh <quic_kuldsing@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 7 Oct 2024 at 21:17, Kuldeep Singh <quic_kuldsing@quicinc.com> wrot=
e:
>
>
> On 10/7/2024 1:00 AM, Dmitry Baryshkov wrote:
> > On Sat, Oct 05, 2024 at 07:31:50PM GMT, Kuldeep Singh wrote:
> >> The qcom_tzmem driver currently has multiple exposed APIs that lack
> >> validations on input parameters. This oversight can lead to unexpected
> >> crashes due to null pointer dereference when incorrect inputs are
> >> provided.
> >>
> >> To address this issue, add required sanity for all input parameters in
> >> the exposed APIs.
> >
> > Please don't be overprotective. Inserting guarding conditions is good,
> > inserting useless guarding conditions is bad, it complicates the driver
> > and makes it harder to follow. Please validate return data rather than
> > adding extra checks to the functions.
>
> Sure, I=E2=80=99ll remove the redundant checks.
> Please see below for explanations.
>
> My intention here is to handle erroneous conditions gracefully to avoid s=
ystem crashes, as crashes can be detrimental.

Please fix the callers first, rather than adding band-aids.

>
> >>
> >> Signed-off-by: Kuldeep Singh <quic_kuldsing@quicinc.com>
> >> ---
> >>  drivers/firmware/qcom/qcom_tzmem.c | 17 ++++++++++++++++-
> >>  1 file changed, 16 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qco=
m/qcom_tzmem.c
> >> index 92b365178235..2f2e1f2fa9fc 100644
> >> --- a/drivers/firmware/qcom/qcom_tzmem.c
> >> +++ b/drivers/firmware/qcom/qcom_tzmem.c
> >> @@ -203,6 +203,9 @@ qcom_tzmem_pool_new(const struct qcom_tzmem_pool_c=
onfig *config)
> >>
> >>      might_sleep();
> >>
> >> +    if (!config || !config->policy)
> >
> > config can not be NULL
> > Ack for config->policy check.
>
> Considering a scenario where user doesn't fill config struct details and =
call devm_qcom_tzmem_pool_new.
> config will be null in that case.

Likewise other driver (not the user!) can pass NULL to other
functions, crashing the kernel. This is not a way to go.

>
> >
> >> +            return ERR_PTR(-EINVAL);
> >> +
> >>      switch (config->policy) {
> >>      case QCOM_TZMEM_POLICY_STATIC:
> >>              if (!config->initial_size)
> >> @@ -316,6 +319,9 @@ devm_qcom_tzmem_pool_new(struct device *dev,
> >>      struct qcom_tzmem_pool *pool;
> >>      int ret;
> >>
> >> +    if (!dev || !config)
> >> +            return ERR_PTR(-EINVAL);
> >
> > dev can not be NULL
> > config can not be NULL
>
> dev may not be always __scm->dev.
> For ex: qcom_qseecom_uefisecapp.c pass it's own dev.
> If new calling driver pass dev as null, will lead to NPD.

Just don't. I don't see other devm_ functions checking the dev param,
because generally we believe in the sanity of driver authors.

>
> >
> >> +
> >>      pool =3D qcom_tzmem_pool_new(config);
> >>      if (IS_ERR(pool))
> >>              return pool;
> >> @@ -366,7 +372,7 @@ void *qcom_tzmem_alloc(struct qcom_tzmem_pool *poo=
l, size_t size, gfp_t gfp)
> >>      unsigned long vaddr;
> >>      int ret;
> >>
> >> -    if (!size)
> >> +    if (!pool || !size)
> >
> > Is it really possible to pass NULL as pool? Which code path leads to
> > this event?
>
> qcom_tzmem_alloc/free need to be used once pool is already created with d=
evm_qcom_tzmem_pool_new API.
> If pool isn't created, then calling qcom_tzmem_alloc/free will be erroneu=
s.

If your driver doesn't check pool_new() result, then it's broken.

>
> >
> >>              return NULL;
> >>
> >>      size =3D PAGE_ALIGN(size);
> >> @@ -412,6 +418,9 @@ void qcom_tzmem_free(void *vaddr)
> >>  {
> >>      struct qcom_tzmem_chunk *chunk;
> >>
> >> +    if (!vaddr)
> >> +            return;
> >
> > Ack, simplifies error handling and matches existing kfree-like function=
s.
> >
> >> +
> >>      scoped_guard(spinlock_irqsave, &qcom_tzmem_chunks_lock)
> >>              chunk =3D radix_tree_delete_item(&qcom_tzmem_chunks,
> >>                                             (unsigned long)vaddr, NULL=
);
> >> @@ -446,6 +455,9 @@ phys_addr_t qcom_tzmem_to_phys(void *vaddr)
> >>      void __rcu **slot;
> >>      phys_addr_t ret;
> >>
> >> +    if (!vaddr)
> >
> > Is it possible?
>
> Yes, A scenario where qcom_tzmem_alloc fails resulting vaddr as 0 followe=
d by no null check.
> Now, immediately passing vaddr to qcom_tzmem_to_phys will again cause NPD=
.

Likewise. If you driver doesn't check qcom_tzmem_alloc(), it's broken
and must be fixed. Null pointer exception will help fix the driver.
Adding such band-aids will hide the issue.

>
> >
> >> +            return 0;
> >> +
> >>      guard(spinlock_irqsave)(&qcom_tzmem_chunks_lock);
> >>
> >>      radix_tree_for_each_slot(slot, &qcom_tzmem_chunks, &iter, 0) {
> >> @@ -466,6 +478,9 @@ EXPORT_SYMBOL_GPL(qcom_tzmem_to_phys);
> >>
> >>  int qcom_tzmem_enable(struct device *dev)
> >>  {
> >> +    if (!dev)
> >> +            return -EINVAL;
> >
> > Definitely not possible.
>
> Ack, by this time __scm->dev will be initialised in qcom_scm driver and c=
annot be null.
> If some other caller even try and qcom_tzmem_dev is already set hence, re=
turn -EBUSY.
> Will drop the check.


--=20
With best wishes
Dmitry

