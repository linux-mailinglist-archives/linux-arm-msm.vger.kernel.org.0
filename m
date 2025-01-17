Return-Path: <linux-arm-msm+bounces-45398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F323A14E7A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 12:27:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A366C168828
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 11:27:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DD561FE453;
	Fri, 17 Jan 2025 11:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yW3iFQLE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CE31FDE20
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 11:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737113273; cv=none; b=luFULXmfC+7qOzwW0ezwIAP/pxxvwcQhR4wbM58z13jQK/ctIjK2VKOMYu7ZKwfgqIxW4JnE5xMt224e360ossM6m022RLaf6FbPhUQLvnKD6hSHczoZdy3S7UwgsjBDnCBRaOhMxATXMVSoZTtGhgYcfQu9dGBTxAxglWBmUbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737113273; c=relaxed/simple;
	bh=WyThD8FrVBJCKDybx9LaT3OiS2rtnaogPPFxd7+ndtA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=haJp5ABlYhpIVMCu1wchRoJ9gOxmL9iZ12VQK+Kr7tbhbKXBdDWJLO2kNBSHDyogdCR4A1ftzy5C7giyyoxzbq77oaTkBZIEKcF+1tfLc7R3TIdyWvBze8r1euzebiEU0AZVbLKvfCmaucKONl8lPJhg3VnLiyKvcfO/nhwE7fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yW3iFQLE; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e3c9ec344efso2970810276.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 03:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737113270; x=1737718070; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RxfEkKlYRP7ukIrs1MaCPw8T+wP3qoi186DEfWEac0E=;
        b=yW3iFQLE+aCthxXOqRuxgYtGjPFBBIx1L5OScZVVdblhd7JHw/lmYR9VVn5SK4Z2xl
         XYnwJ+FFCiQFujF+n5qjGd57NcyHSVlZOFg5Rh/FcNfpVQpHynbkmAJmXgrFOkyg/uEs
         MnuX4jwtDiaz4NDTn7oJ4KpWtljuOGTihcf1DODcrR62vMtTe7mVGJPM6O5TjWqBTZLi
         kwUbFK5AoXxf1a8JpSDtMVcwUrMLyRKbWoPAbxvX/pNFRtRoT3nJHJtekBwu1JTuXxj+
         z09ELZLHDBg5qr3GdJe3sv2UZKg1TtdJ5Pm9bkJq+AAYXQtnJRYEXzPatdwU33AeJWfl
         HDBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737113270; x=1737718070;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RxfEkKlYRP7ukIrs1MaCPw8T+wP3qoi186DEfWEac0E=;
        b=wrA9dNj89ClgCuSYdKz5aKPHi+UInePIShwoW+AkMDHOZ9VVfOx2emXHIf8aDrs6fJ
         hKXZez6+JUk/80PbmWyC2YuNmoN01QYWJzmfrKy11kgyQmsXu7Noq4mafuXg4nakIEUd
         PLbcS0w+WRq5I6wKbm5XzFfuZkjvpXwiOYH3T6Xb/HqNS4TOlLGUFakCa0kY9n4CKSTK
         tquGmXfyYNnDA1MKlCBd/wqLzRUdvrZHUOCedxBKNMqnqTt9QnP0s62ei7pY09NDbZ4x
         /zyiaalDQhn/0sSpmnDsu/imgqZ2Ch5MDwLlTlurqYkNiU2Bmi7+3LBhsOwJV66KcHa6
         GXyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKB/QPqljeVU1by++9QSWzDinOAYChBpJWzjalAg+Z6VOj+hk7RleP3ipbqIfUZ9VC0CUE/iwm+mPUAsIL@vger.kernel.org
X-Gm-Message-State: AOJu0YzB03kGSXjAE6uUqRQcInqUa62ZVD5daAJIpxucD4tMOO6aowxK
	bozl7PtFgf6OFLZ/ba/Xhgqf+rZ3tECegWp27dX+Z8cXtdx3DVLHIvabZnGGjiNKqtuZYCTiGsS
	tfj71pPqbbjdOyuLQpO8W2UqffsYORgNmEVS8cw==
X-Gm-Gg: ASbGncvV41ypul/midlLoS7tuMSm2K1/Z5rF0yi0QjQenxOrx742MvX82NO0WPgTlt2
	xDcccqoeEDc5FOWhAaymdX3vGMVvmm535gbFct44=
X-Google-Smtp-Source: AGHT+IEusORJsnLAB7uFHDjBIfrb4yJchecR7K5y4IVMIjvxS62ubvLYuQH1myauXkx8D3tFzPYY0Wl0i5Jr+dSW0ss=
X-Received: by 2002:a05:690c:6d88:b0:6f6:c9c6:9547 with SMTP id
 00721157ae682-6f6eb93f836mr13306007b3.33.1737113270604; Fri, 17 Jan 2025
 03:27:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250116-qcom-ice-fix-dev-leak-v1-0-84d937683790@linaro.org>
In-Reply-To: <20250116-qcom-ice-fix-dev-leak-v1-0-84d937683790@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 17 Jan 2025 12:27:14 +0100
X-Gm-Features: AbW1kvaav0qfOpmqvSp4jWBVis9VJqr0HfdaWWKr4JZ4uCU_pLkRAxHIiYm35ms
Message-ID: <CAPDyKFrV6OASHxtS-yKxBvhRpjkN2POFdL5EiWHyj+geZ8ufCw@mail.gmail.com>
Subject: Re: [PATCH 0/4] soc: qcom: ice: fix dev reference leaked through of_qcom_ice_get
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Abel Vesa <abel.vesa@linaro.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Eric Biggers <ebiggers@google.com>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-scsi@vger.kernel.org, 
	andre.draszik@linaro.org, peter.griffin@linaro.org, willmcvicker@google.com, 
	kernel-team@android.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 16 Jan 2025 at 15:49, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
> Hi!
>
> I was recently pointed to this driver for an example on how consumers
> can get a pointer to the supplier's driver data and I noticed a leak.
>
> Callers of of_qcom_ice_get() leak the device reference taken by
> of_find_device_by_node(). Introduce devm variant for of_qcom_ice_get()
> to spare consumers of an extra call to put the dev reference.
>
> This set touches mmc and scsi subsystems. Since the fix is trivial for
> them, I'd suggest taking everything through the SoC tree with Acked-by
> tags if people consider this useful. Thanks!

Sure!

>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Acked-by: Ulf Hansson <ulf.hansson@linaro.org> # For MMC

Kind regards
Uffe

> ---
> Tudor Ambarus (4):
>       soc: qcom: ice: introduce devm_of_qcom_ice_get
>       mmc: sdhci-msm: fix dev reference leaked through of_qcom_ice_get
>       scsi: ufs: qcom: fix dev reference leaked through of_qcom_ice_get
>       soc: qcom: ice: make of_qcom_ice_get() static
>
>  drivers/mmc/host/sdhci-msm.c |  2 +-
>  drivers/soc/qcom/ice.c       | 37 +++++++++++++++++++++++++++++++++++--
>  drivers/ufs/host/ufs-qcom.c  |  2 +-
>  include/soc/qcom/ice.h       |  3 ++-
>  4 files changed, 39 insertions(+), 5 deletions(-)
> ---
> base-commit: b323d8e7bc03d27dec646bfdccb7d1a92411f189
> change-id: 20250110-qcom-ice-fix-dev-leak-bbff59a964fb
>
> Best regards,
> --
> Tudor Ambarus <tudor.ambarus@linaro.org>
>

