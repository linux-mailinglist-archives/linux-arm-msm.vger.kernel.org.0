Return-Path: <linux-arm-msm+bounces-14717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3192885774
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Mar 2024 11:29:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37107283A73
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Mar 2024 10:29:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B90935677C;
	Thu, 21 Mar 2024 10:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HEU9gnbf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A5156751
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Mar 2024 10:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711016944; cv=none; b=jZbwbO6UYf6fIJkb/OFtgcriurZnRlwppyFFYd1Lpo4erbulri6nkoOyGyX8SrXKYxy7PoorjL+AINOM9MuMM1ILkYf4kH+MJa2bnu6GxpteTe/AmJFX25nP+RWfi2LxIHuJpcMndUJtJLBDTCW2X9JVWvJJKNPlePufEZYtRUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711016944; c=relaxed/simple;
	bh=P9oLwk7VJIg3OdusQw6OhW8NcToKDBX6FFXyfjBmguI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nRB34rKYicgJclyIKOPOsT4EzmwxRtRaY7pi74opPMWuQBb1oJfRgCt3kKtsqsREf9V5DDKzbdK2KlNLKddevP3Z8cRM0p21a6LiX1DkWQW/ZfMHfuKrReq949StPQutUuzx0X/TM9hmGiuOpNDGJ6qhRL4BcgUbJJGDNbbaeqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HEU9gnbf; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-60cbcd04de9so7546617b3.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Mar 2024 03:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711016942; x=1711621742; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+uLfK8GwjqCfs3VrBCTLKTjymM9xM7mMzCdCq1/Z8B4=;
        b=HEU9gnbfJxiR4PtnaS3yck/by5EvQHOr0SZfCa/B/BsSXfvASxwZaAnGoid2udQZ9/
         TFSX5j7Xc5LzebvSOq74zHyndQ6AQRKhssEK5Va8jUHA18ar9FaUhNQyU5VF7CLFciMb
         tB3/2Qppldc7FCenKG6WwNp3HuJeD9E+fdw4Hnu7bpDA/tZk/43pz3fKzwJOr0y4TsKC
         lCmJHZrJCOccpiPaD9HreHUcX3gftkCx2GuWNJ6BmC3wuCxcnHjSxRKwj/ltGBFjCI5U
         bcs0uu6PGP6bTccYQHs9Zkz7inbRcUENBLekyyHbBsvhy7m9RFaLgL9km/kWSRYMiEFt
         XQcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711016942; x=1711621742;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+uLfK8GwjqCfs3VrBCTLKTjymM9xM7mMzCdCq1/Z8B4=;
        b=Nn0zkIhZXasxilOV4SjNpKTPoalvW9QBMeoCmhCWSxRNZIYeREead2wHzgFrs2qZtD
         +qq+iwwaoOlxM5TBsMvU96z1FXlsNZxTk+DR+ianfzgJGSfLw4LFh7YuNWDj6YdbCUeH
         5LHcD4nsNc30ghXinAUxmOoRzrvITZd7zTLHWyu6UwoKYFNDFrwoxGDltpB2grEdULRO
         sAS7pWjJITrbf79Z/BWe5H5Kkcq1FtG1mCHJ25Nig3YxJE6YWUsOaZ9yuQ8exqT0HKR9
         XC8WjWvGK+pZ+ZkQt7vElKdjPXOu5pktiUGFN3Lpg4ltE/YmgAZaPyTZ0WAm8/9owdNh
         uRLw==
X-Forwarded-Encrypted: i=1; AJvYcCX9F8sP7B0AWhgsQTZDLpZjH6nqYb+1AhGGbJ2ZDnUVz25QRe0Zxs7BQSQO+DyXNBwltlHWQgT30XgsO6JniOWub/LKfUdubINkNpZeNQ==
X-Gm-Message-State: AOJu0YweybeDdIDViiGevAB5cGgavwOQz89sEFy4VsGzgYjM524dUSBH
	bEEfwDh5TEIsK9HT8Mr73D0UI2HwztsI6veT1Ab/Z5OwF6nwBq25KT02feu68o+cJCnjYQvWW+v
	GnKOX6jqWresiGlhUad1si0v/NFqljZTHrhfOKw==
X-Google-Smtp-Source: AGHT+IGTcMuTl2BR8QgKlXuZ62FCg9xZRjlzbWgj/MWKvepEwUPTunC3DUu1ys33B8adCr0Kx8RWRCBXkvGDVJ+BSaM=
X-Received: by 2002:a05:6902:2408:b0:dd1:4908:7a91 with SMTP id
 dr8-20020a056902240800b00dd149087a91mr1515831ybb.49.1711016942104; Thu, 21
 Mar 2024 03:29:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240321-apss-ipq-pll-cleanup-v2-0-201f3cf79fd4@gmail.com> <20240321-apss-ipq-pll-cleanup-v2-6-201f3cf79fd4@gmail.com>
In-Reply-To: <20240321-apss-ipq-pll-cleanup-v2-6-201f3cf79fd4@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 21 Mar 2024 12:28:51 +0200
Message-ID: <CAA8EJppOmPJ+mNEfsS7kJYR5ASpa8__a9002KpPjaAwkwTcdMA@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] clk: qcom: clk-cbf-8996: use HUAYRA_APPS register
 map for cbf_pll
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 21 Mar 2024 at 09:50, Gabor Juhos <j4g8y7@gmail.com> wrote:
>
> The register map used for 'cbf_pll' is the same as the one defined for
> the CLK_ALPHA_PLL_TYPE_HUAYRA_APSS indice in the 'clk_alpha_pll_regs'
> array.
>
> Drop the local register map and use the global one instead to reduce
> code duplication.
>
> No functional changes intended. Compile tested only.
>
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---
> Changes since v1:
>   - new patch
>
> Note: Although this patch is not strictly related to the subject of the
> series but as the change has been suggested by Dmitry during the review
> process it has been added here for completeness.
> ---
>  drivers/clk/qcom/clk-cbf-8996.c | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

