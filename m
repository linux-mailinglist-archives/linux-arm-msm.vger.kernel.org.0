Return-Path: <linux-arm-msm+bounces-32722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA9898953F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Sep 2024 14:07:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D83311C21442
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Sep 2024 12:07:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F122916C684;
	Sun, 29 Sep 2024 12:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="AmlKU45B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBF613A268;
	Sun, 29 Sep 2024 12:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727611638; cv=none; b=LpzMmJrjNVAVpZZ8p8wsfp3owId65J/y663sbvb7mVYWkYbGSOXdQxX7qlthrmMPkdKb6us4iH/JhEPOeDaLT6sTetGkz5Qj7d0djcdTybO0+ux1xCDgW51AEyRqCPsUbqNKYe7eV33TV55KUn3QnPqxFoSkaH7WEVlSo27tcvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727611638; c=relaxed/simple;
	bh=Xh5ExjcgQh/E77y3Jk6URT9DRI8CIzqO6ymaMql+pt4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QqjUhbO8r6+7PAHswu9I7jGVKUm27oLaZU/co88y7DcO3qE8rSYMDrnz0d83YxuFKIzOToaMTNNKOpZQg81rEH3stFveeqwQbo4S/tmxbTqwpyAGe9nM75DK9ArJjhAvOtBeDMt40P31c1KYsVTv8NGJxPOQvwBhu4MFG/Hy3j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=AmlKU45B; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-207115e3056so29820085ad.2;
        Sun, 29 Sep 2024 05:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1727611637; x=1728216437; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zjxInaNhLVD836E7kvEQ4tYnrdCtxNbjV5ha2p76v8M=;
        b=AmlKU45BzwfLhKpNVfP9Dtu6UzRHxunUagmcABuZfn2IiGPqtyBvGvw0ft48GgfGYZ
         2A0h3kAbDOtPTKgxhjMPZt0V+KRAGBhOGtpJOmHMSTbH1dufE9AMlpKSglyFlVI9TsYQ
         vRaZKcdSmH4GMt9YPV4i+71KduUMQu5fqHIqD4iZROdNhTxsX2do/Pb1Ur8pC/kgvXlN
         kaWHoDHsmjzhJ8ta7PUnOT4hlteDHauQcCMwxyDksoDSv1B9smYNWmYkCfU2IYMp8pT/
         RhFVvs61Ysky07HVVnx9UAzMt2v/on4IMSnbiI4zwgEXWHI86Km1YoxUywJVSstf2NA5
         2SQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727611637; x=1728216437;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zjxInaNhLVD836E7kvEQ4tYnrdCtxNbjV5ha2p76v8M=;
        b=XEj/zYu0yti1RZGf6zGtYebxvvZYz93Toa2WoGDOuzd6JkxM0Zg/dqWLhvJHndg6Cm
         wantUDZrXe6p4YoRqsyFG1oMbdUxNChH8BiigJ/cgAKhZJ7hC2ZTBjmlDBpV98fvLzlZ
         nDMuk8LiQRF7fQKwzi5CVBRK2XwgvAY46kc+WoimmPqY68kkWhI75PoPrzBucbJJKjuD
         vY2v1md3G70eZTZ9w/O3PgrV1DNkDtej4YZ8ZYYxIJzjHtKwq01gDhB9QUNm5o6XF4RQ
         HsxEfMAs3AquXPH2SyDdCOrEap+IkeakE2Wscv/2uvD4Ii4KUJOqwqpvE2zKlcKEmw6F
         2ZZA==
X-Forwarded-Encrypted: i=1; AJvYcCVIGWgOKi50TIdaNsRj8V0DhHkQVxNl5aMI8EFX6WPMHL2v3Zn0/ClJ+tbDvoQjjF6J/qma1QnzLIX82gqQ@vger.kernel.org, AJvYcCW1M8ekiKVi+fFywNsNf/pt93V+D1++5RfOQzJwMUbnCP7Z0UFavMlD9gnp1dKTsuTinGWma/m9fhwA@vger.kernel.org, AJvYcCWN3IrPYoq0hWMg7S/ubNuoEsGmhWvNP4iqVlNUJ75gn7qSpaeewS2KloBblY5vY3xLzHzubx0T3VxLRSeJ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywrun2JderNyIT/Q34szcY2rflPsc2NRGEX9POjJn9qCkOv0EZn
	/ZbAKQix8+GZpRfegJgukVkKx4ES+FDttgWbv6j9Upi4Ia3ls6TmtO0TZDmbyLezxWVB1F+cc7R
	TJmINti4YVkeDqhmST++2Z9NlH8A=
X-Google-Smtp-Source: AGHT+IGkItVurXd3ky7Ze3/m8wpVZ4KRuguynlrG29y9ctBKfpIWygc9BxUDQ0/p6z4xHmFc2bL685GfGWj5pSZ1VkI=
X-Received: by 2002:a17:902:d4c2:b0:207:13a3:a896 with SMTP id
 d9443c01a7336-20b369d605fmr122281315ad.23.1727611636800; Sun, 29 Sep 2024
 05:07:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240929093418.526901-1-yujiaoliang@vivo.com>
In-Reply-To: <20240929093418.526901-1-yujiaoliang@vivo.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 29 Sep 2024 14:07:05 +0200
Message-ID: <CAFBinCBYd2W8+-oKVayFmW9sEVU0Sp+vtW7QNABdsm1Rxh=Y=A@mail.gmail.com>
Subject: Re: [PATCH v1] mmc: Fix typos in comments across various files
To: Yu Jiaoliang <yujiaoliang@vivo.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, imx@lists.linux.dev, s32@nxp.com, 
	linux-arm-msm@vger.kernel.org, opensource.kernel@vivo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 29, 2024 at 11:52=E2=80=AFAM Yu Jiaoliang <yujiaoliang@vivo.com=
> wrote:
>
> This patch corrects several typos in comments within the mmc/host
> directory. No functional changes are introduced, only comment
> improvements for better readability.
>
> Detected using codespell.
>
> Signed-off-by: Yu Jiaoliang <yujiaoliang@vivo.com>
> ---
>  drivers/mmc/host/atmel-mci.c       | 2 +-
>  drivers/mmc/host/au1xmmc.c         | 2 +-
>  drivers/mmc/host/cavium-octeon.c   | 2 +-
>  drivers/mmc/host/dw_mmc.c          | 2 +-
>  drivers/mmc/host/meson-gx-mmc.c    | 2 +-
for meson-gx-mmc:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

