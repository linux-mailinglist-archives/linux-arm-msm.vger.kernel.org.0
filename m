Return-Path: <linux-arm-msm+bounces-17372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B77E68A3B65
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Apr 2024 09:14:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C29428354B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Apr 2024 07:14:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A1BB1CA85;
	Sat, 13 Apr 2024 07:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kali.org header.i=@kali.org header.b="ML95mva9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA44A944F
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Apr 2024 07:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712992471; cv=none; b=BKPyc61Z3xTZTBV+beNssJu33mHUkX8cnggfyoRzfKSWWkLlkZ7OSoeWWGj7CNyKBAkiS1txI5QISV47YPBmcKO0IJvrTq6d9KfRqGL7XTsZS4UEOpFa1yc2HPP8xlL1Y5yNS/ZNb5U9n0XvZAqFKuvxMN7qjSkbH+7nlxVK3XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712992471; c=relaxed/simple;
	bh=o3+z2gjvWYe3ycjNtnxQBlBPcTLvyVZ3uulsKyfAvvQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gD/oNel5kAxEnMvBT5yZkhCHKbk8r1OmYmvh6W2nRq75hMVql10a5IIo19DWhF6EA8ui27EN8lJVAfcp9VkOKnpZ6y6g6U7DR13WQ/hbvFAqSNFMN0AEbTxHaPxM9Zfgjf21ECzLxypBl0F1S4TsUbeFVjeM2qYxPpK4cRUuo4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kali.org; spf=pass smtp.mailfrom=kali.org; dkim=pass (2048-bit key) header.d=kali.org header.i=@kali.org header.b=ML95mva9; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kali.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kali.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-56e4a148aeeso648417a12.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Apr 2024 00:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google; t=1712992468; x=1713597268; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/HHtPvGouLUwNBinHLkaycjej5YlmhYQaDzE3CvXbqE=;
        b=ML95mva9yTzx2l+b/6u3g9jWv5UDHCZzA6zJfTAlo9Pr1MrKAg2F8ScGGRSZJOe0og
         tDTrhpDvAIJ5CJT1bEziN6OYQ0Jf8gMMQwbEISNdapdXDBOh3S+bYdr3lOh3kVRvwBKW
         8JK37gisChfFtkttjg0SNHShiIq36n99kagrSDcNhjQ3Fj1Y4vUjcy0/d2HFl1qk0Gic
         0YPYPn9t4GqKKXYEWlW4SqBBHm0djueYhbaeMbyKLCRIsICg9QdGjGtrwrIIS3BXUVQL
         2hgj0I3q5nArW/C/2RBZPXcBlT6mAruhuRd/q3dgvM+Nq1iniiQXqKiBVscVkdZfX/Kx
         gNjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712992468; x=1713597268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/HHtPvGouLUwNBinHLkaycjej5YlmhYQaDzE3CvXbqE=;
        b=tabdT1zOM63LzNyKK1PUXyRO+l9rkz7wV+9SVmfaKli4hS9EOlsFAKVqJYyhzNm7gW
         +zO5KzC9sbifK3cDZvgbkGFUeEN50pj59QmtfoZld+O/skkkh4wU9CNmRSul2EN+wIUj
         UjomyR+PbNKJDiMwpsHBA4+Y7GQlSFwXF4iV+np5uhwccFqxjiHZQnj06rw1BFeRIAez
         vTkroFJtVL/1NhxFZvQa1FZwH+OOqGamLmywv0SyktNq2SHov/4ty/mbguMeeweWc81h
         i1MTN4nNS1TWvt8O0FUnZmb23FvNGXmII5hDOTh6Gq/KlipHMYBSubZ5cewvb8Q47yuA
         eHyg==
X-Forwarded-Encrypted: i=1; AJvYcCXg6U7vNND5wKqqSrmKEaxGscGS1OGAPDkngBFdR2r8eQp9qGCcbHjIEq6jucLVIdi+RWYBBCc2CCWBIttswm7P+zZydSoHHfnXGP9S/Q==
X-Gm-Message-State: AOJu0YyTbUPMPaVe+lm1uqFyEzz3RnxaJcsl5N3V9rZat/8IDmkEGm4M
	+LP7KuI4KhIKwi/B5CG4ImkrrQtPNleWJq1u7p4Ua8QHTaGT1Sl6plWMoYw0wtZ7OpqbL5IPK1Q
	4c4AS3khfkVez7wmMnTHGxS6lq9fv30CIU1j5CZ+4IGMgOrtnbXA=
X-Google-Smtp-Source: AGHT+IGjKQPBWk3zY4ooVWSwwjx8svo3iMnk4hrUD8lrSsQHtU9YoU3a9b5yDiFZBd6peTfPY9ZB3ENbAOeulzcfskI=
X-Received: by 2002:a50:8754:0:b0:56e:2a38:1fb3 with SMTP id
 20-20020a508754000000b0056e2a381fb3mr3884604edv.4.1712992467646; Sat, 13 Apr
 2024 00:14:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240413064225.39643-1-jenneron@postmarketos.org> <20240413064225.39643-2-jenneron@postmarketos.org>
In-Reply-To: <20240413064225.39643-2-jenneron@postmarketos.org>
From: Steev Klimaszewski <steev@kali.org>
Date: Sat, 13 Apr 2024 02:14:16 -0500
Message-ID: <CAKXuJqg43-QVWAANyt3_z3fEVrHtXqVuJy5OFNMEZz=STDZQ0A@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] soundwire: qcom: disable stop clock on 1.3.0 and below
To: Anton Bambura <jenneron@postmarketos.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
	Sanyog Kale <sanyog.r.kale@intel.com>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-msm@vger.kernel.org, 
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you!

On Sat, Apr 13, 2024 at 1:43=E2=80=AFAM Anton Bambura <jenneron@postmarketo=
s.org> wrote:
>
> This patch returns back the behavior of disabling stop clock on soundwire
> 1.3.0 and below which seems to have been altered by accident which
> results in broken audio on sdm845 + wcd9340. For example, on AYN Odin and
> Lenovo Yoga C630 devices.
>
> Fixes: 4830bfa2c812 ("soundwire: qcom: set clk stop need reset flag at ru=
ntime")
> Signed-off-by: Anton Bambura <jenneron@postmarketos.org>
> ---
>  drivers/soundwire/qcom.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index a1e2d6c98186..bc03484a28e8 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -628,6 +628,9 @@ static int qcom_swrm_enumerate(struct sdw_bus *bus)
>                         }
>                 }
>
> +               if (ctrl->version <=3D SWRM_VERSION_1_3_0)
> +                       ctrl->clock_stop_not_supported =3D true;
> +
>                 if (!found) {
>                         qcom_swrm_set_slave_dev_num(bus, NULL, i);
>                         sdw_slave_add(bus, &id, NULL);
> --
> 2.43.0
>
>
Tested on the Lenovo Yoga C630
Tested-by: Steev Klimaszewski <steev@kali.org>

-- steev

