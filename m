Return-Path: <linux-arm-msm+bounces-42794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D659A9F7CA2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 14:49:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F389C1891AEF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 13:49:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4E6A224AE2;
	Thu, 19 Dec 2024 13:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y0DhZ2zG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20DC52253E3
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 13:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734616127; cv=none; b=lgr/xXQTROl8rDT5yXvWyL4CpkRxCc6WBg2+UWnXsTi7dsQHoYmr2ItinDa+0br1QEH/HKUZa2a9x2jpTZMXbRCeZaP2pgBbrO5KsQG+X6QzfG2g9/O9HaMWzKjuCtwnVWmIo5sdTLDcTfmK7xUD3mQEnK8SIXkYSSTVbM55x1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734616127; c=relaxed/simple;
	bh=dx8Z8zcbcEcD/p5AehdRTmFyVw4r+v5gMACGHmVdmnE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iFVQ7n8Q2j/TfRor9et/IN4hqDOTvilpZFPg0gGJGFc7mR5K0RK+tJPjCwF8f2nEG5ys77g4N1gMmRRd+JurIJx9RDKiTjpMrimSAH8kPTxj52PE8RekacSMfv6IufIjeK/HQZ88DAN2N2FJLkFqkadJUEW+NKdPyorXQiUl/E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y0DhZ2zG; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6f3d31808e3so6103177b3.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 05:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734616124; x=1735220924; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mXO1JWc0dzqo7dfc1rG4WRHfe9+6B85YYjaXMsQpUk8=;
        b=y0DhZ2zGrPLufsp5oM/sv6BhZoyfMB7L+eEQCEXGWZ3Fer8puvLITpgz1CDDdwCYWd
         m3YZiBIoXqxpkbpvaofaX4jNpzOqDlyxV9CPp/xiqBKcDGz9XgSTzxCclJeImKu0CBXd
         VhWGrOP611xZjSg6ywj6lZEIzRI2PbsWlaincQ7bIUxot36FlXRCYaveC9VeZ354CUrm
         1s3jJbFAowsRWT0xgNxlPR5dUQUPP5ZzRT8x6jBLu4zxxr5qIlEW2gm6jxiaao3JOtmB
         7Dijau1IQWUEWR0kfBpIdaKJbScBTmTWEx7W5eyQUZXWodXUiTui4K2zINvl5Z1enYxO
         vsZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734616124; x=1735220924;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mXO1JWc0dzqo7dfc1rG4WRHfe9+6B85YYjaXMsQpUk8=;
        b=OVl+Bx9J8BN0uTMfKQGnzSlQsDqXN1upL3W2lFyAc6t3P0Nxzh7vazCflTmfOrHBA3
         Gn7sSS+9fQoQDEwZrWD680LxjEvVupJ3WpGFosgWoCN9BxZUrZwArmNWSvdWWJ5NwXxA
         OwXg11aDR9MK/ab/jIZb5dhiY8aP+4Slk119djbzpE/89u9lildYBdL0NnhvbDzNG/qi
         IybtYRBwbOdXUuNKUg8c0v0tWLvSqbTt6VGvQdputUbFvQWIEufFZhehFbhxJsdlA7Ah
         Tcnhn6svg5AI1D8QpydsqfziXdhcfDaICNqLdwdVnd60TpT/CSZYBQ9asYTrJZjdYGxo
         +a9g==
X-Forwarded-Encrypted: i=1; AJvYcCXkeUrxRCI9wrzXKix7+s34/8KnhqDoiTEt5Qr/FxM+eibbEg0lxtqG2x/4k7jED++noDmAYbEWyaLEeo1m@vger.kernel.org
X-Gm-Message-State: AOJu0YzMfW1xwreXl/GU60eqvviuDnr/8PBFJ6XCDFpmy9iJPZhM5e3M
	XBPSVwGvAjJZxRNgrvfImisJYSSQ+aPfBG31PrUAJY4AHMr7PQqvsInQyHWEnxu5e/JXpql/LJq
	7I3PB3EqPWKNmv/rNDo/AFIfDkJ4/7XG1e9/zjg==
X-Gm-Gg: ASbGncvBledEkslU9Z/OEZ8fNAL8yrYGUT8MXebNa0h0DJRpyGiA/hPVKVQApobKgXr
	7uSBXlqYHgAAILzV2I//YwrGdGcbknHv8zhijx/M=
X-Google-Smtp-Source: AGHT+IEjwcNyQmxYJWNy9sVDcxIilhG2jovJzAG4uTM2E71ZmGRx+o9hvF/TOHyKvnCLrmN7UM5vvGMWJdIs1tMfv4k=
X-Received: by 2002:a05:690c:6f83:b0:6ef:4fba:8151 with SMTP id
 00721157ae682-6f3d1e85c3emr52273637b3.19.1734616124150; Thu, 19 Dec 2024
 05:48:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241213041958.202565-1-ebiggers@kernel.org> <20241213041958.202565-7-ebiggers@kernel.org>
In-Reply-To: <20241213041958.202565-7-ebiggers@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 19 Dec 2024 14:48:08 +0100
Message-ID: <CAPDyKFpgM4oGv=KYyiS5qE5yznAYhMuHBm5pP6S4OVenLjecrQ@mail.gmail.com>
Subject: Re: [PATCH v10 06/15] mmc: crypto: add mmc_from_crypto_profile()
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-block@vger.kernel.org, linux-fscrypt@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Gaurav Kashyap <quic_gaurkash@quicinc.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
	Bart Van Assche <bvanassche@acm.org>, Bjorn Andersson <andersson@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Jens Axboe <axboe@kernel.dk>, 
	Konrad Dybcio <konradybcio@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	"Martin K . Petersen" <martin.petersen@oracle.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Dec 2024 at 05:20, Eric Biggers <ebiggers@kernel.org> wrote:
>
> From: Eric Biggers <ebiggers@google.com>
>
> Add a helper function that encapsulates a container_of expression.  For
> now there is just one user but soon there will be more.
>
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/cqhci-crypto.c | 5 +----
>  include/linux/mmc/host.h        | 8 ++++++++
>  2 files changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mmc/host/cqhci-crypto.c b/drivers/mmc/host/cqhci-crypto.c
> index d5f4b6972f63..2951911d3f78 100644
> --- a/drivers/mmc/host/cqhci-crypto.c
> +++ b/drivers/mmc/host/cqhci-crypto.c
> @@ -23,14 +23,11 @@ static const struct cqhci_crypto_alg_entry {
>  };
>
>  static inline struct cqhci_host *
>  cqhci_host_from_crypto_profile(struct blk_crypto_profile *profile)
>  {
> -       struct mmc_host *mmc =
> -               container_of(profile, struct mmc_host, crypto_profile);
> -
> -       return mmc->cqe_private;
> +       return mmc_from_crypto_profile(profile)->cqe_private;
>  }
>
>  static int cqhci_crypto_program_key(struct cqhci_host *cq_host,
>                                     const union cqhci_crypto_cfg_entry *cfg,
>                                     int slot)
> diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
> index f166d6611ddb..68f09a955a90 100644
> --- a/include/linux/mmc/host.h
> +++ b/include/linux/mmc/host.h
> @@ -588,10 +588,18 @@ static inline void *mmc_priv(struct mmc_host *host)
>  static inline struct mmc_host *mmc_from_priv(void *priv)
>  {
>         return container_of(priv, struct mmc_host, private);
>  }
>
> +#ifdef CONFIG_MMC_CRYPTO
> +static inline struct mmc_host *
> +mmc_from_crypto_profile(struct blk_crypto_profile *profile)
> +{
> +       return container_of(profile, struct mmc_host, crypto_profile);
> +}
> +#endif
> +
>  #define mmc_host_is_spi(host)  ((host)->caps & MMC_CAP_SPI)
>
>  #define mmc_dev(x)     ((x)->parent)
>  #define mmc_classdev(x)        (&(x)->class_dev)
>  #define mmc_hostname(x)        (dev_name(&(x)->class_dev))
> --
> 2.47.1
>

