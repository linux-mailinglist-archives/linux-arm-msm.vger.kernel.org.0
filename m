Return-Path: <linux-arm-msm+bounces-30744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB6596C101
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 16:44:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38E921F26F2A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 14:44:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14F131DB941;
	Wed,  4 Sep 2024 14:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V+26t17K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657801DC05C
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Sep 2024 14:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725461034; cv=none; b=EIYi6BygZlyQ7VkVfAf8p0LX5tbYcvhubKIeIrEf3kPm7vLCbkKkAPAHxWad9pjBlRuziKokCoA2KLVhCrGaQa+3Rjet/e04IRpAXBRZVLo8bTB9vy5gccjsXr2PyhRUvK+tUH2A/NVphdOQhUyg5cP6h5buLYhlvz5eTYocdrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725461034; c=relaxed/simple;
	bh=iKqWCvQaTNzfamaO6Kv/yW7GdXAB81lqclGxtEdqyLo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X+AjjKyM7L6wEvAm2tEJiwqoqRTXTEngr0cb4l3aPlPQrW4XtqSJsndLtZR51DYgCO3BBCnscIfoYkqBF54kNJA8vvJ1UBAzSvdbkxFAidwx5YXkpbOPEM6tMdCB6S3+H4hXTFQ+yJ8SpzMbDx2+Riu7QX8z74mtIWWKMJdI5/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V+26t17K; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725461031;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iKqWCvQaTNzfamaO6Kv/yW7GdXAB81lqclGxtEdqyLo=;
	b=V+26t17K/6RDqPkbcD/BsVhGx7re9YtOu+CMSMoBAn3t/nyV0HTAGyShECaykpEWWcEkt6
	v7oeOEgfl+VI9siD9n5YgTKs/9pJrsjYB0xTyxxzF2OmqXeZKqAAcp0QclYTCn7zl7pFky
	T+DSJ0G9fHIH2l5op8lLl/h11bw/e6Q=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-570-5zJA-UqJNgudtrYfrmVQLQ-1; Wed, 04 Sep 2024 10:43:48 -0400
X-MC-Unique: 5zJA-UqJNgudtrYfrmVQLQ-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a868c4d16a6so459377166b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Sep 2024 07:43:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725461027; x=1726065827;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iKqWCvQaTNzfamaO6Kv/yW7GdXAB81lqclGxtEdqyLo=;
        b=bnB1KT5K3t4GqJ9G3NqFEoZwsotkSKXN5Bxn6mf9QnMLPiLuU3/1S8FnRkvgetWsZo
         w6C/NHm1W94GBP2ukksqOIp2aO4EbV7gFaZJ+J/UQ/qJ47BmSPPhSWfdPaExrmmX/mH2
         PgLTZiSMKckxQdCu7eHyEOmqUCycBHZN0Q/Rw0gYQH1qp+sCUt6lFQr39adhRmJ2bmol
         +O/qFxGGkVlciueVaxq6NFpWRLTtPNhXUjyaKd2I4mLmxNetJBSX/yF4x/nShFvCEbIP
         VmODP880eNGPC1TVpLVeuFdG6/iPoJzZMVHSpRXaeV5G66CRaCvH1OIa+L3uCDP/ZUbj
         FmmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaTWHyRNROnKoIttsZuCDUaem4KjmFpZ2VhR4f8fTg8VSanDnST33bpR/1F4gvnREIUnM16lBW8cmp2TiX@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo3ZzJho2ULLerxJRal7/HFel7N6noePZ8puu7FbCV+nnIQMvW
	xDo0wOLSInlI+ACpTTn7hAz5WUII6vOs/6RrVj/1dDFMcoFlompnE1/4n+R3QCZDerWojKp+PkS
	B3G9T88E+jA/zHiXRizziGLjELVBoAnCx5BgVg8y0yLvhrDLHDQ0+f7DBdNWKrpZnBJBJR2IVwB
	wrp/cH7tNhDMvMQv3ogfcgu6h5w8cDM//ZSSgJcw==
X-Received: by 2002:a17:906:c10c:b0:a7a:a46e:dc3c with SMTP id a640c23a62f3a-a89b94a9cd9mr1022117966b.15.1725461026912;
        Wed, 04 Sep 2024 07:43:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFo5JYtqte+s3eAerfKy35rLUJR8ZL908LjB1GKu3jHSIElZjWXpFnbsGyYvHG9OxwhFiGpzYAtdwVG44/vrLg=
X-Received: by 2002:a17:906:c10c:b0:a7a:a46e:dc3c with SMTP id
 a640c23a62f3a-a89b94a9cd9mr1022114266b.15.1725461026259; Wed, 04 Sep 2024
 07:43:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240903212230.707376-1-bmasney@redhat.com> <20240903212230.707376-2-bmasney@redhat.com>
In-Reply-To: <20240903212230.707376-2-bmasney@redhat.com>
From: Brian Masney <bmasney@redhat.com>
Date: Wed, 4 Sep 2024 10:43:34 -0400
Message-ID: <CABx5tqLh_8OMSrZsCFz3wpw4dQf6pQtQ_Ffh35Abop2fqhobTg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] crypto: qcom-rng: fix support for ACPI-based systems
To: herbert@gondor.apana.org.au
Cc: davem@davemloft.net, quic_omprsing@quicinc.com, neil.armstrong@linaro.org, 
	quic_bjorande@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ernesto.mnd.fernandez@gmail.com, quic_jhugo@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 3, 2024 at 5:22=E2=80=AFPM Brian Masney <bmasney@redhat.com> wr=
ote:
> The qcom-rng driver supports both ACPI and device tree based systems.
> ACPI support was broken when the hw_random interface support was added.
> Let's go ahead and fix this by adding a check for has_acpi_companion().
>
> This fix was boot tested on a Qualcomm Amberwing server.
>
> Fixes: f29cd5bb64c2 ("crypto: qcom-rng - Add hw_random interface support"=
)
> Reported-by: Ernesto A. Fern=C3=A1ndez <ernesto.mnd.fernandez@gmail.com>
> Closes: https://lore.kernel.org/linux-arm-msm/20240828184019.GA21181@eaf/
> Cc: stable@vger.kernel.org
> Signed-off-by: Brian Masney <bmasney@redhat.com>

I found a cleaner and less intrusive way to fix this after looking
through some other drivers, so let me post a v3. Sorry about the
noise.

Brian


