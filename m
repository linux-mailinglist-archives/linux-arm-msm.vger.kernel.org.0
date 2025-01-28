Return-Path: <linux-arm-msm+bounces-46360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFE1A208B9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 11:41:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8453518875BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 10:41:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7100319DF4B;
	Tue, 28 Jan 2025 10:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lu3tC77O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B927C19D087
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 10:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738060860; cv=none; b=cTLCYXpo9h2A9k/dfSGCwWGl8231LVA8A0M9d/o0xvL4v3Rvzm0Ev4t7YXqdOUQc0zYJpvcJ5QcbQTte4dZOQP/nrDkG7oWnigCMUrLRD9hBIqCViy3u94PaxEHkPmiKIS8txq1Tw2d6gujXrbdg7w9ns/No11+fZEoXaHSVC+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738060860; c=relaxed/simple;
	bh=fHkCcPoOld5Vayx/a8s9YzaCZAQ95P6ms4pCUpWbve4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qw+HWi0quNro+qubO5J9Ap37xFVKS4Y1/L6ectOy91trUpg0G/K4WNJ7EIoXvvnDorx3BfA+5KAMetlCtQF8feEM5WZAdNt3uHaqs+rCcFaupEy4IL8yK8TywFTPT7ewRRuXeJPsYgY9x2qQoYiD/b8bfrcPNgxIdfYaMljCHeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lu3tC77O; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e589c258663so211754276.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 02:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738060858; x=1738665658; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X+TSS9BHptLsGt0UNSzZvK+YPeXxKpKM6xF2wxrn1RY=;
        b=Lu3tC77Of9RneS7TWOsi0iIcb2go3CQdeQ8gYp+S9GaJnI0ebZiGEl92/JIeDcVqC4
         2wiVkzaeqmFSX69eVTx+QlKnEa7peCGqpBEQaAf5jF6mNe9IGLeIPCtkiqGV4K/7rR1d
         bzK661qIXsQ5NixsXSY6N1etdz23ORjYktWdcRtt56dtqVg01cgKH9SN+S35/QVjOAXl
         dq14PynK4O7v2crB7atiu2mMOuiKWHiHcrmG4HFs5CF8R+XRZmd1eyM5JjKXaO5eq4lz
         CrLtNMbg+3c8VSmvdwxxUax2x6cmrvbZKMnYYtnW9UsmIw/OgeuEavj6i0hAETJ+0D52
         CNZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738060858; x=1738665658;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X+TSS9BHptLsGt0UNSzZvK+YPeXxKpKM6xF2wxrn1RY=;
        b=vwMDWr5HrKoDNSi6Cao0EQMP2GzPsASHXPNvd+RJlGvb59V1iTmJimXJh1VHWFisYv
         MW/rOBay+crdAieis10UYyWJHP5JRQKS0seWrPCXKdeuhTBWU3d0ntOYlfdUnt7gsBnR
         DRaqsI0Vtk48dvXTsV6rK/UyC18UpLLUFAGhSdpS0Z5Dzvk6KFfmc3do/lbwxc+oHVzm
         g5leOOd4N1bzRIh5Vya+/ku6j0I4meYjiblIGxUehfjKHgSYwVbr4O7yQeT7/y6dktzq
         t8upNxomKUpR4ECvBihIwYo62Xd1U433gPk+0ZI4cRohWp8nhqdbJCFQHZK25+Dr+TrN
         vWmA==
X-Forwarded-Encrypted: i=1; AJvYcCWZAHy1UPj6QWgiy+wT/AN5MIPVI0+qpjgIvY4MJSlJUrM/6FDPQN9XYhC+PQaKw1U0jx305lhxWNlAplSU@vger.kernel.org
X-Gm-Message-State: AOJu0YwmOjaD5rOOE8mzuoYXDPv559VzpYXQKlXf1Z/cgVM2JBmuUdlk
	yCQC6fegVKFiRuZexMJzHMSQwKCXqUmvacNn24b5Z66Wm4aSSbf2m2HJZ9DkTdZSkrNUUY21o2T
	T3xdcWn6GcuF56hGHXZhEQEeWq720DekWTs8ckA==
X-Gm-Gg: ASbGncupPStqneCz/94nq9b2YZGZhs8715Ac8l7bAInsJ+dEGw78JjuAHbFbNaK0zen
	u8EoC1u1hOF4F/Lax1tW84Xp/r8HuXN7+I7YAlMMtl+/t3bkgBcImV0crjNzVvnlf0uaRtTKvNw
	==
X-Google-Smtp-Source: AGHT+IEmH8cViK+UxbmsoUoGLBe5kZAMQb5oP5iNgocXG2Sf79bsQ7NtGK8mhIzgG/5TkGLx1PVW6ZLN6j/dzVO3Q3g=
X-Received: by 2002:a05:6902:161a:b0:e57:94bd:4e0a with SMTP id
 3f1490d57ef6-e57b13451bcmr34589002276.40.1738060857692; Tue, 28 Jan 2025
 02:40:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241202-rpmpd-sm6375-v1-1-12a4f0182133@fairphone.com> <D7CS06UAY85B.1L2QQXQ63GFZ7@fairphone.com>
In-Reply-To: <D7CS06UAY85B.1L2QQXQ63GFZ7@fairphone.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 28 Jan 2025 11:40:20 +0100
X-Gm-Features: AWEUYZmLWZpIy6dPlIk9mwW7-sSnAKdnFhxVFch4NAa0RB7-7jLqSeJPT2NrRsA
Message-ID: <CAPDyKFq3xQPVzocPi13+AWoiWPpvejoAotMOM4VE4FA0BLqv0g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: power: rpmpd: Fix comment for SM6375
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Jan 2025 at 11:16, Luca Weiss <luca.weiss@fairphone.com> wrote:
>
> On Mon Dec 2, 2024 at 4:45 PM CET, Luca Weiss wrote:
> > During an earlier commit, the comment from SM6350 was copied without
> > modifying. Adjust the comment to reflect the defines.
>
> Ping, could this trivial patch be picked up please?

I pick it up after the merge window closes, via my pmdomain tree.

Kind regards
Uffe

>
> Regards
> Luca
>
> >
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > ---
> >  include/dt-bindings/power/qcom-rpmpd.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
> > index df599bf462207267a412eac8e01634189a696a59..d9b7bac309537cbfd2488e7d4fe21d195c919ef5 100644
> > --- a/include/dt-bindings/power/qcom-rpmpd.h
> > +++ b/include/dt-bindings/power/qcom-rpmpd.h
> > @@ -65,7 +65,7 @@
> >  #define SM6350_MSS   4
> >  #define SM6350_MX    5
> >
> > -/* SM6350 Power Domain Indexes */
> > +/* SM6375 Power Domain Indexes */
> >  #define SM6375_VDDCX         0
> >  #define SM6375_VDDCX_AO      1
> >  #define SM6375_VDDCX_VFL     2
> >
> > ---
> > base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
> > change-id: 20241202-rpmpd-sm6375-06582e126d7f
> >
> > Best regards,
>

