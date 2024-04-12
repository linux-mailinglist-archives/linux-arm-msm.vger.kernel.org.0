Return-Path: <linux-arm-msm+bounces-17303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C61138A2316
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Apr 2024 03:01:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3AFCEB21E27
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Apr 2024 01:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FD311FB2;
	Fri, 12 Apr 2024 01:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kali.org header.i=@kali.org header.b="XohyHyVd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA63D1FA4
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Apr 2024 01:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712883655; cv=none; b=c5VQNoafhjwzmqKLurr+LPVft+2xkNNnh4o+LDgI4iQXaU5L16U7/9/ElPaxAPsGkaTthAQ0nT4r5uGOuyVdXQ/SweahIv3jQkznb6vVqaDJ/HznTI8Ni+PJtTpJTSRK4/Np8Ql3bmeZw/lhiaRG6FrMEE03v9dv7bV+dlNBeYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712883655; c=relaxed/simple;
	bh=n5DyHBQNH4jECC/1QiOWkv7+cWItmYfwHMaEulQwpkM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hqIgSGgx1m28wVtyjaoAJ8rqAG4lzawosaUrr+Uz6YGowHxgl5WwfTnYA0+o6Tza1x4iuwva5joZ8J5TaflR1IVI3bquNssNnRUC0bCTMXKkEOhnsw74FDtfZOJhvkE+K/6TjS+cl2YMrM66sviXRMXhYbz1luJGhubdjg9vUOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kali.org; spf=pass smtp.mailfrom=kali.org; dkim=pass (2048-bit key) header.d=kali.org header.i=@kali.org header.b=XohyHyVd; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kali.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kali.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2d8743ecebdso3789871fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 18:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google; t=1712883652; x=1713488452; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=teCFUVoujc84LN4HbW/RAmyCbCBCbvdNQSWtdEKCzhs=;
        b=XohyHyVdKHVt87sQxjygY3XU7FeRxPguOs/nGswYJ1nXvU8tuB5MrWf/rtdAohA1Il
         B5QKVywe80SGmy5oc36qzZ9qSYC5zdFFqnud+RGnf0r5kjOIIs6jNb51dWA6eq1fDNFu
         sps5fHmDOPPolGlAKJHQStjUAGpHRHIGeOjC/RcpyEtgHWZunDHrm7SZDwpk8JtMfVam
         0tWcgbNn/NjH9LCrhpBhjhSp/9pm2oANq4w5oPe8Kv+ssUxemtHbnED9ZbwXgf21V1Lh
         Gog+TWWRO7gZtpD9IS5GNdcL1l74DJPLyn1x9Z8HGKcIVe/8DzFSx79/52HNtmskXY+C
         AXiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712883652; x=1713488452;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=teCFUVoujc84LN4HbW/RAmyCbCBCbvdNQSWtdEKCzhs=;
        b=mZUFixrqBw9gk9yliMV1WV1OMTagHPHKzFCnfEgCSWsoUhnCV2Cy/XYSBdG1kctZ5h
         Pa6KsofHK+5JwdGo1h1x8w/42eVQUVfs1X7nUY6vBVTLCggVf++unNdLDg/QW3zE6wmN
         RSWQv+6D0j0lECS/d4Ur7mMS1ObqxaXapxJPJVkmqJERuDklNRAPvWig4pX+bXxhgpbj
         o/iNQCtFM950pDzKc9IVrPiW9OsAdQEE91pL0gif/k4wtN5wg8mvcMp6mNpzAyNvyPO6
         wWc7emEL2SPJA1+yzazOp5EreyTXLuplDHVOiKa/UK5WsDVLPVKyl26GkvmNzlxoK+Nu
         u0MA==
X-Forwarded-Encrypted: i=1; AJvYcCVQd9HibqIqpFLNdkA40YtrUIKk8eUmXiD3QY3zUahgF/7AGQb27sGMLgNGDMqSvzHJZ+2Zo4HoC/SPQ2foQXQRl/rJTAjWnHQ7gn7D/g==
X-Gm-Message-State: AOJu0YyfzP+NBhOKJRBWGSzlx+nQHTDr5F7XNaMKkZo1i4mRkscdt0zg
	UpGoOYZlqdUr9hn3b09FLcvWGYZuzYjHAB0ngZEeQlCV0Aud+ys3ApNwe4yr80jY7U7qLcmG+7T
	VQE0fH6ff/JYCzNg4EB7HVS/vCuWd9yYhIh7/scRaUubwxaWt4hI=
X-Google-Smtp-Source: AGHT+IHW3q4EFhtObEcsKd+CKgmrYyrIesE7GsuZI1aMdxOi1H3OtA5zBlVysSpjkiOwYvriDjUvouc2vkDplvtXREA=
X-Received: by 2002:a2e:9890:0:b0:2d5:9cc4:da5c with SMTP id
 b16-20020a2e9890000000b002d59cc4da5cmr672075ljj.36.1712883651673; Thu, 11 Apr
 2024 18:00:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240412-enable-sm6115-icc-v2-1-12a35d5d4acd@linaro.org>
In-Reply-To: <20240412-enable-sm6115-icc-v2-1-12a35d5d4acd@linaro.org>
From: Steev Klimaszewski <steev@kali.org>
Date: Thu, 11 Apr 2024 20:00:40 -0500
Message-ID: <CAKXuJqh+0kyWXHpsyABi3=4YRHTzzg7Ezn4Mbru+ZTLeryec7Q@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: defconfig: build INTERCONNECT_QCOM_SM6115 as module
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2024 at 4:49=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Enable CONFIG_INTERCONNECT_QCOM_SM6115 as built-in to enable the
> interconnect driver for the SoC used on Qualcomm Robotics RB2 board.
> Building as built-in is required as on this platform interconnects are
> required to bring up the console.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Changes in v2:
> - Change it to be built-in (Bjorn)
> - Link to v1: https://lore.kernel.org/r/20240409-enable-sm6115-icc-v1-1-b=
f894fb5a585@linaro.org
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 9957e126e32d..30e7598bd131 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1600,6 +1600,7 @@ CONFIG_INTERCONNECT_QCOM_SC8180X=3Dy
>  CONFIG_INTERCONNECT_QCOM_SC8280XP=3Dy
>  CONFIG_INTERCONNECT_QCOM_SDM845=3Dy
>  CONFIG_INTERCONNECT_QCOM_SDX75=3Dy
> +CONFIG_INTERCONNECT_QCOM_SM6115=3Dy
>  CONFIG_INTERCONNECT_QCOM_SM8150=3Dm
>  CONFIG_INTERCONNECT_QCOM_SM8250=3Dy
>  CONFIG_INTERCONNECT_QCOM_SM8350=3Dm
>
> ---
> base-commit: a053fd3ca5d1b927a8655f239c84b0d790218fda
> change-id: 20240409-enable-sm6115-icc-7b0b0c08da2b
>
> Best regards,
> --
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
>
Subject still says as module

