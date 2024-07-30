Return-Path: <linux-arm-msm+bounces-27398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D64A940F70
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 12:33:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 265CEB25E5C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 10:33:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0C3819FA8F;
	Tue, 30 Jul 2024 10:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="BYjqIN1u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2AD11A256E
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jul 2024 10:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722335279; cv=none; b=rFeCKBRP+BflP6m2U8u7VEUSxlGbeR4E9K7RdyyZ/Dbo8ddzh8ajZjb76G4i7eQOzWg632b6TZowyqS2aGHFpxvJvxQnSdnU4ED7KCcsAXTaQUrnoChvfws5jDNYr1h3QQbTl0WX3TVG2pRAyLiVZ6IDAxwLmK+9AzM0XdtvXlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722335279; c=relaxed/simple;
	bh=695xdWLBq87soobiF8eZF1SdJcGlNDQgwQBm3jVSj+U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mj5O0RD+yYg/C7MQ4UseLTIu9hLCNdyCXvvmphV+ewMjy+mnPNVg5rkr9N0olrkAwzpu1yB9PUukEBVfq0uH/zIw+MsMYKMhoqVoHB0XBvz+ROXFSQgdAsX93aNTJyJpJMo6p5y5yDseHQZk/6wftAHZVL0J5RY29TIx5bc4RNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=BYjqIN1u; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52f01b8738dso4538827e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jul 2024 03:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1722335276; x=1722940076; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BBROzv9BFJwS0uGlOfZ/j87P+pjfdJhwP1Cozs4+zVA=;
        b=BYjqIN1u319KOLTfJKd5onGtLY/sN+qQ4/b3HC1nzVt7AbcMxopB/z8Y7yNrEMMRjv
         h+zdRBAmROvMvXAwKs6Rlj1ylw7KdS4EBYy3IR7pwX+wrrf5i/RMneXdQ6YR279P9dak
         V2SFwRy/DAsDH/zAa7EwQgGpFrM2HKCX+QsYZCO1ywkzAaXT0/iSjKl/7dJ6rJ/Q4NQH
         c28MNnEabzfClOfGcgxtLkcWBXaGltGaSGPC30FqouzgKtNRgN8kCy/KvXdCPCEtbPL4
         Sjr0D7s5v16auOSV3Liqsvz1PCH702EnW5FnjD36J4G5Y1TKAoM4A7lnNWRhktGYaYjC
         YrJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722335276; x=1722940076;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BBROzv9BFJwS0uGlOfZ/j87P+pjfdJhwP1Cozs4+zVA=;
        b=Cs2gVi1JzMRJXf23gU2QcfoTxGZwPgNoaLny5fkb4aGCpHO4M2hQ6CUweriDFMFaUI
         9UtNJW7LzJl49Qrk6cCEVxjMMtFHIAPl9iNTmGRUTJJiR5tkokW9QZVmVbnY8LSvav/H
         L2vKeNq4J2ngydxUK9vSo7jKOH/qU7iDL/tO5cCd6f9snK3S+2hj1NmKKHLrF6ek48XF
         3JTQFKjjUVk38wBEtD60AHGI6lmOGms5EtowocP+k4s97ImxHYzxfG9p6PflOZjgyYxw
         Pz6lVpdYF5Kh6yHt/zOj/3yPUNtjG+g0TJD97GTF5k8qka/VvzPAE1UGC6Y3WbYvmJdC
         oOiA==
X-Forwarded-Encrypted: i=1; AJvYcCWuTHVIeK7Wk9njaSh70GF+RYbybHiLB5ks5zHahG9mEAW9UkQ5uof4L3ntvykq+JLFsLWAUM+tn/Uui4AJoh+Clt0pHfG31N31iNHiHQ==
X-Gm-Message-State: AOJu0YyI49Mza4yui7rXtCY+Tkyya7nit991gwMojcE+dciwxe72OO01
	Zf+itq6o0ixpltJk8jJj6bM/wWVxlt368WYEhz1ZZM1HVYZSDoowV4pUkBhVGWpvDJAYwfn+4aR
	zPuSYb8k17KZzLNa+TvfZJaR9xP62PPgFC9l+JaLkI8QU8uMQ
X-Google-Smtp-Source: AGHT+IEh34ESft7ByFYQ5oR8UdIb2BK0HZ7dhQsQOkF0adw/NGKWv5qocPoIAtd/DXogHEGTuvvMgMCK/PP8ONf9u6M=
X-Received: by 2002:a05:6512:2c0b:b0:52c:9725:b32b with SMTP id
 2adb3069b0e04-5309b2707d4mr6664552e87.17.1722335275689; Tue, 30 Jul 2024
 03:27:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240730013834.41840-2-mailingradian@gmail.com>
In-Reply-To: <20240730013834.41840-2-mailingradian@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 30 Jul 2024 12:27:44 +0200
Message-ID: <CAMRc=MfPjc=QN729tiN3vxvyO_ECeqqODmjqjoea9E5Z1++TJw@mail.gmail.com>
Subject: Re: [PATCH] firmware: qcom: tzmem: disable sdm670 platform
To: Richard Acayan <mailingradian@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30, 2024 at 3:38=E2=80=AFAM Richard Acayan <mailingradian@gmail=
.com> wrote:
>
> The Pixel 3a returns 4291821499 (-3145797 or 0xFFCFFFBB) when attempting
> to load the GPU firmware if tzmem is allowed. Disable it on SDM670 so
> the GPU can successfully probe.
>
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  drivers/firmware/qcom/qcom_tzmem.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/q=
com_tzmem.c
> index 17948cfc82e7..5767ef210036 100644
> --- a/drivers/firmware/qcom/qcom_tzmem.c
> +++ b/drivers/firmware/qcom/qcom_tzmem.c
> @@ -78,6 +78,7 @@ static bool qcom_tzmem_using_shm_bridge;
>  /* List of machines that are known to not support SHM bridge correctly. =
*/
>  static const char *const qcom_tzmem_blacklist[] =3D {
>         "qcom,sc8180x",
> +       "qcom,sdm670", /* failure in GPU firmware loading */
>         "qcom,sdm845", /* reset in rmtfs memory assignment */
>         "qcom,sm8150", /* reset in rmtfs memory assignment */
>         NULL
> --
> 2.45.2
>
>

Ugh... As the list is growing post mainline merge I'm wondering
whether we should make the generic allocator the default in defconfig
and SHM Bridge an opt-in option?

Bartosz

