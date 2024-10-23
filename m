Return-Path: <linux-arm-msm+bounces-35629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4CE9AD661
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 23:11:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73E1F28304E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 21:11:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7374E1E6DFE;
	Wed, 23 Oct 2024 21:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TOrnarJa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7261A155757;
	Wed, 23 Oct 2024 21:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729717881; cv=none; b=dIZFfYqYLjHgaQ5tOvHnZSz9QaX9DknUFZZ4YOEeq5HAoAh71wue3nFVgrQVRs5sCbaM8KZKmNgSXhgMg5iundngqPgglL/EYyHr8QYhOpZyoOXQi8MD73AUA8YYMsJae97jR7hjfJ3D8ZNVrrSKrvtpTcw3szFBarAxRt2KwC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729717881; c=relaxed/simple;
	bh=jKAyw/EopyQhKfZWtFJ71aOI/ZTyS19O39wXWbS1TjI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ky5YGDkQEZIwCSldpA3I+5LKadSfDg7KvnIyPCwBgKRRuDehupRd3LzshsfNBQ7J9iFsKWv4Nexpak97EemufTuZ+x287EUN81dWmz5Z5u5iW94NFmk91BjQqnY/MRy35uKqmoqQWHNgDqr5joG6QGmi1A3iViRgz+1GlwOpQVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TOrnarJa; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5c96936065dso208824a12.3;
        Wed, 23 Oct 2024 14:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729717877; x=1730322677; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jKAyw/EopyQhKfZWtFJ71aOI/ZTyS19O39wXWbS1TjI=;
        b=TOrnarJatshEFKHqo6VKxiSctB452ndjbbdUwzwdqMeBItQpnd62cjZ3MWvc0seIXX
         6gj0F7MMOC6tb6DMb5XDQ3TAG0Luhrjn9Eq+0AH73EdTswN1ejRHpLIUUOZHtcIEO3TC
         kW/nIedJUXtkKHhi9c1e1urm170RC5q1yebMSsR49txllHdqzrG4tlDdgp5C2HTc+aaW
         uHNLnjyTM1gzYiuwetvz3cNw59/KcgoFowcZxD+5RcUg1TcDSDIY1a4q+j4AltgEq7SH
         Nl8sP4pbNvlzJDnldtQAYkRKzsioj34FB61WfuPiUoi363i7K7lXjiD95U3GmM5h/iw+
         q5Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729717877; x=1730322677;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jKAyw/EopyQhKfZWtFJ71aOI/ZTyS19O39wXWbS1TjI=;
        b=EI9ekZFnQ6OuUR0jtKEbxoX3FwdnnLbWHp7huoRBQmTFoti04oVpdhQ7e9SstDM0I7
         BhuMhr3srRfm2OKe+AmIQWuVqpeZwD/oe6qcOpiIvNVwTzkJwzZFFbzaQY7eXMP+IXer
         C2zfps12rgGbRkLXgA5MlKNhAPQ5bo35ljNzLFCybIAfgswdcrwsYNZzJ7boPyLhv1L2
         n4K67SbqdPHKGCkQRPdTes0czagpDG0E6jx7GoKk6vYUPvQ8dT5ekQz4ZNTgdPg1kdQU
         VyWXkGVtJBt8Ta3qJbJg77Ua54T/A73aq81ob3qFGty0G3eO+JCRb3ncsXgWbNzDSpg2
         x6lA==
X-Forwarded-Encrypted: i=1; AJvYcCUMwtCYDF88gJ5EQj7duhOlF9tvHzMcJQkT2CPn/RjpWfac6E7A9D7Oi/0gr7qjB8wmLWZL4MT/8CgwZYzsqw==@vger.kernel.org, AJvYcCUT6IHJOYBym4N6kh3ny74w8J7AU3YfZr8WHRrzA/9nYf+1T+qHOUil4uGmfuJpGWaZRS8csvh84x7v@vger.kernel.org, AJvYcCXC0R8ju2bNolFXcZ8fpqwvKa462s9u8ehQXp+l1QogL5os9o0bJB2PRjibZOXt8f3k0o0RACaDHzZprO3r@vger.kernel.org, AJvYcCXNwaeVRV5/CPNnf1UvQ0XMQrYpTi71VSM2VZzyYu9EpfVyiyhdfIYSBp0/VAGq7z29SLucOH7BlLauSjMapP2P/voGIw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw30mHhfizor9xPxNoYioQlOmIu9qWWyrbbtf0hcoZCsbwEqb6v
	R549cqsgK+ZjoZS+L4+g1elQyt9dOniFvcOWYe/1USq169LAPzHkqblnW0HLZPT3YWm5Ntjs8eh
	6XEVa0baF8gljgZyx1IsCVw8QcQ==
X-Google-Smtp-Source: AGHT+IGjp5BWHI7BjiYEHOH7h326K2upWWA5FR/BygFMnRkS/IYWnITIfOZ2A1SOsXlzq+/uRMmOdvSxYlQdyW9kq1c=
X-Received: by 2002:a17:906:c10f:b0:a99:f0f4:463d with SMTP id
 a640c23a62f3a-a9abf875c8amr385483366b.26.1729717876612; Wed, 23 Oct 2024
 14:11:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240908223505.21011-1-jerome.debretagne@gmail.com>
 <20240908223505.21011-4-jerome.debretagne@gmail.com> <f9cbd1c3-eb05-4262-bdc6-6d37e83179e5@gmail.com>
 <CA+kEDGEdd_s+DGKsVNY6Jy870B72eHuaj2EgEnwP8J46ZGbxpQ@mail.gmail.com>
 <8370d062-b3d2-46f5-9e7b-8e16edde8480@redhat.com> <555f8a3a-ae5e-57e7-f176-96c52e1a5d45@linux.intel.com>
 <ad9fa9f2-7f97-401a-8e8f-ae633ab1932b@gmail.com>
In-Reply-To: <ad9fa9f2-7f97-401a-8e8f-ae633ab1932b@gmail.com>
From: =?UTF-8?B?SsOpcsO0bWUgZGUgQnJldGFnbmU=?= <jerome.debretagne@gmail.com>
Date: Wed, 23 Oct 2024 23:10:40 +0200
Message-ID: <CA+kEDGE+fv3FJYGi=xR-agFiM-rGhDKAqhgL8dJN8GeJkw415w@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] platform/surface: aggregator_registry: Add Surface
 Pro 9 5G
To: Maximilian Luz <luzmaximilian@gmail.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Hans de Goede <hdegoede@redhat.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 10/23/24 7:25 PM, Maximilian Luz wrote:
>
> On 10/22/24 10:56 AM, Ilpo J=C3=A4rvinen wrote:
>
> [...]
>
> > Hi all,
> >
> > I've now applied patch 3 to review-ilpo branch in pdx86 repo.
> >
> > I'd appreciate if somebody confirms I got those comment edits right.
> >
>
> Hi Ilpo,
>
> looks good to me. Thanks for fixing this up!
>
> Best regards,
> Max

Hi Ilpo, hi Max,

It looks good to me too.

Thank you both,
J=C3=A9r=C3=B4me

