Return-Path: <linux-arm-msm+bounces-35641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 924A99ADA50
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 05:17:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E03E4282E54
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 03:17:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BEC2158DC5;
	Thu, 24 Oct 2024 03:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lY1MJC5d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F978156997;
	Thu, 24 Oct 2024 03:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729739853; cv=none; b=KmkMF1/ZKAmd1n9DwvPhgFv44ndubH+QnPRleGJlqvp+LbANrtGbcvWVCbXhQZrIU+jyJWy3AKQzZZ2NzCyIU9SoyDCvPZAYRJbceQIZRZrhI3AvQm9D3tcASwi42lyAew+U2+LvKyVSrQ6UbYlpoCJ4iTQwJ/LMfsSOq0Sc2X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729739853; c=relaxed/simple;
	bh=6EkibdRfD0hNLJmrqUMgqeBGkxUubBTZYbGiT9el38Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m2394KYDppmujjfjjVz+U2fVRZJPWC7pZq8qKSlLmmrsvrNGB6p8ZlYp4NI/mOZk8Cp4qubtWRIdeEmSHgvW3MfW+my5pNLTbOG3md7lN6gIwVcD95RYFmiYf/eLVMi2jvTOb1138K5oYNBJ5V1toS4UlYTSYONURVJAyqLDBSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lY1MJC5d; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6e2e41bd08bso5333657b3.2;
        Wed, 23 Oct 2024 20:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729739850; x=1730344650; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6EkibdRfD0hNLJmrqUMgqeBGkxUubBTZYbGiT9el38Y=;
        b=lY1MJC5dejv7mnRQj/V12lobDar+fBCQc2+pHlzpVSf7GPRxWsqFwAhqcnlNzlAqiU
         BVgUYBBlX2Iw6FJP6zhvmAVOAETiGcZjVQ6t3UsC64dAyzZY87pPeq6gjuhJRE0qewNo
         Tn28hDbdWAftw0a2APW8q/qIi7kruvxqFqYhTMxjJn4/XkFMW8mYtbHv1+oNUioS+iOG
         cxvIcoPDTAf0YR2b4WdnKN536UDbW69pAFEVNOx5hqwdre2yV+VGgc2gjUG2jPkLJNQM
         0kxkGpbQI/NWMP2pwyP+0p7FUWoH7qB8tCOkUTjjZ93ZdiWHz7PQmwTOsuDt1VqpPGBD
         3VZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729739850; x=1730344650;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6EkibdRfD0hNLJmrqUMgqeBGkxUubBTZYbGiT9el38Y=;
        b=D1bpW4K9mT8ubggK840N+tDZRyHx/anZOFVJWAvnmyonVLNo/kXxeg319ftdxH+rqd
         7otf66tzerHAw0JFBr/ixwU7+0f2CR9Nmbm4cwOBNy/oMv8Fk+QnEkezn4h4VynZv5zs
         k2nfxybjJz7UeFJQamEZ5/Q3lfrsfKyYSoG1vN1jJGZq7mzGjAUbPcPTU0RzbJcVKfml
         sVfhktDXVwKV5o+20sufNVTfJosuZ6o+B/U4IEVPQNQsa4bCObSfTdJ+AYgojAUZ+zHd
         nsXFOhhhoG4eDtFEgBqMKhgCl2x8Zn8JqpN1Lc3luxwohoyeWxYTbwbcUXPt5sPA6ZyX
         B6aw==
X-Forwarded-Encrypted: i=1; AJvYcCWdc5h/o+Cl/W9XcwSaafJcFPWdHomZeM58MpTTd2eNA14B/H3XBwWwncGNY52RY6xZGQJx0s/mjT1PoSs=@vger.kernel.org, AJvYcCWfO1tD/pbyQDJSUBoCbacG+4wK9QO9GMtxA4QNgu3PpHWojthnJTr10E6U/Bxt7p3Lc9cVSWEKKkZ36AzyhDlg@vger.kernel.org, AJvYcCWjOphLYQlsQ1ZlqNog6NKN6+ACFA+OhIMOv69P+8SfYsKyjrjDlfZ5SkS3FFmtKBR3PF+CyCeLPc28kg==@vger.kernel.org, AJvYcCWkd9yEDemWJpsxPKKic1cNcj5Tg9N99WnUaj52ZjClGJs7PjlyWCI0oXOYn1RY6ohVZzNvG3e2Rx67@vger.kernel.org, AJvYcCWpC3Vce9V9GRfAM/qglSa8eCQxI+XyEN7g3kKwtlkOeYCTIG5bQNndXbPl7jo9uLNX9phdDcuU3Coo/QjG@vger.kernel.org, AJvYcCXpcjJw3IawHJcZrt1RqB0jWH60P+80JJnS/jAoWSomtpdp6kchTBtDsAW03j1keNUpYupDQQSTtib80YBM@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvftde23NGRxH44VS4f6LvQmvU37yX8ciH8R8B5MMCXIkCtg53
	GK6D1VzNZFpJn18BrQcJ6CBSCwWCJBUPww0jTY/wllmRwZcqsVSCkusrdn49ARX9s/GNbh2kfpJ
	X+EOmArMNAz+/2BNkMEiPgPWtemk=
X-Google-Smtp-Source: AGHT+IFbJRa/Zgamr72R9VITjkZe2117OmIiEsBf2XL35era4TpGsQlA3Fea0E1AgytMQ4ljKeiFfFFWD+DTKuda1TM=
X-Received: by 2002:a05:690c:6609:b0:6d5:90f:d497 with SMTP id
 00721157ae682-6e7f0e302a3mr52827977b3.19.1729739850149; Wed, 23 Oct 2024
 20:17:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240916085741.1636554-1-quic_mdalam@quicinc.com>
 <20240916085741.1636554-2-quic_mdalam@quicinc.com> <20240921185519.GA2187@quark.localdomain>
 <ZvJt9ceeL18XKrTc@infradead.org> <ef3c9a17-79f3-4937-965e-52e2b9e66ac2@gmail.com>
 <ZxHwgsm2iP2Z_3at@infradead.org> <CAAdYy_mVy3uXPqWbjPzK_i8w7Okq73wKBQyc95TbnonE36rPgQ@mail.gmail.com>
 <ZxH4lnkQNhTP5fe6@infradead.org> <D96294E2-F17A-4E58-90FB-1D17747048E5@gmail.com>
 <ZxieZPlH-S9pakYW@infradead.org> <CAAdYy_ms=VmvxZy9QiMkwcNk21a2kVy73c8-NxUh4dNJuLefCg@mail.gmail.com>
In-Reply-To: <CAAdYy_ms=VmvxZy9QiMkwcNk21a2kVy73c8-NxUh4dNJuLefCg@mail.gmail.com>
From: Adrian Vovk <adrianvovk@gmail.com>
Date: Wed, 23 Oct 2024 23:17:19 -0400
Message-ID: <CAAdYy_=OT27UvZ4cNWPLLiEaMo5wkwS+BUv=+=x7-6oE4TsnWQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dm-inlinecrypt: Add inline encryption support
To: Christoph Hellwig <hch@infradead.org>
Cc: Eric Biggers <ebiggers@kernel.org>, Md Sadre Alam <quic_mdalam@quicinc.com>, axboe@kernel.dk, 
	song@kernel.org, yukuai3@huawei.com, agk@redhat.com, snitzer@kernel.org, 
	Mikulas Patocka <mpatocka@redhat.com>, adrian.hunter@intel.com, quic_asutoshd@quicinc.com, 
	ritesh.list@gmail.com, ulf.hansson@linaro.org, andersson@kernel.org, 
	konradybcio@kernel.org, kees@kernel.org, gustavoars@kernel.org, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-raid@vger.kernel.org, dm-devel@lists.linux.dev, 
	linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-hardening@vger.kernel.org, quic_srichara@quicinc.com, 
	quic_varada@quicinc.com
Content-Type: text/plain; charset="UTF-8"

> Alternatively, if I recall correctly it should be possible to just
> check if the bio has an attached encryption context. If it has one,
> then just pass-through. If it doesn't, then attach your own. No flag
> required this way, and dm-default-key would only add encryption iff
> the data isn't already encrypted.

This piqued my interest, so I went and did some git archeology to see
why this isn't the case and there's a flag now. Apparently fscrypt
will sometimes rearrange blocks without the key present. This is fine,
because if there's no key, blk-crypto doesn't need to do anything and
we can just shuffle the encrypted data around. We definitely don't
want to re-encrypt the data in that scenario.

Also, thinking about it a bit more: what should happen if we stack
dm-crypt on top of dm-default-key. I see no point in double-encrypting
even in this situation. So, dm-crypt would set the flag to skip
dm-default-key, even though it's not actually attaching an encryption
context to the bio.

So it seems like the flag is the better solution. It would just be
impermissible to set the flag on a request that will write plaintext
data to disk.

- Adrian

