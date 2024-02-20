Return-Path: <linux-arm-msm+bounces-11948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C6685CBA2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 00:02:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A72441F2266C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 23:02:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 886CF154425;
	Tue, 20 Feb 2024 23:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PqcTSfZM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB575763E8
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 23:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708470173; cv=none; b=gAVtg7ET3swaz3gi5je9cyWrj70MGx3QamwnrWJK6C85SwNv5o6WWtlr1ULyF03+Pmyoi+nODYUDf/UB5Qo5ID3ZKZ4s1OYpqzWUkc9fRdtKqHJB9pHiER+vbzsuarGYeZlTfvXAeaKOR1GUkHS1jmKMxABiZ6mDExwbyODqwlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708470173; c=relaxed/simple;
	bh=m46fDwrVuliqkw7A1TrIi7G/05Wqw+0w13j26+q3lUg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Do5q1Kgme0Umdj9utMszDgEa/2YK6wuo3D/JJ7UrjDVnffY+PZVZKjdUTMQF7lOTzEUNjL2v1Oe+DEjfPqD2YKHJPlqNgDkdiofLjVGhyoaAcskcFe/gnBVd5FS43PEuCePNnEvB3ieRqHpXFcnc9zyRI0tDvDeH1NK/l7wbBtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PqcTSfZM; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dcbcea9c261so5377710276.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 15:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708470171; x=1709074971; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=h3xcc/5DqDQe+adCv6bnvAUmiBqc6BygI5OchyBvkgA=;
        b=PqcTSfZMCkfaHR6TSluKZw7tUFffVKCkyh4I9mr4o7V/vb/7DQUF4rLpPLnU2HXmf/
         JDYKWWbhb1Ht0mO2JTSKWFJO6HiVYphH5AKUDwQaEoVwP4PIZbb6SBDXlGjZ9QKH9pcR
         UBRqWUtS3wbbcXKCjVuOlpnOjTK2iwtoe2ml3xlSggt5BwFyqPoFQ6UWyCMpkT/S4jK6
         5BtTSDFZ07ElwyLxjxWYHvd4a6mF+vtVFKjbvnfT56uokOY+znXJuXxI+nudGtsg6cEX
         W3Uwhi/zA2XNOc/TRScFUfJaLU0Ver+HyK+IQKF+2610x8pDe/gasLP+KUS7SDOxVYsd
         l0CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708470171; x=1709074971;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h3xcc/5DqDQe+adCv6bnvAUmiBqc6BygI5OchyBvkgA=;
        b=JWadeZnPDE4xCUpiZ7u2zhDt/fZzNWZu8h5D1qgFPQ5EG1tS7NeQmf+jqShWWUfqUV
         fzg2nWDi9fpmA+5yLlannGIalX7bdwo/CVW82YtQq8Vp8tGCHsRaBinKHSqM+j24gkvT
         vTxL2NSDqBaqLbAyxgP5lH671KaOA6vXtFtJkF11wwTcjv2AesYNFmQ5s0vboQyloyNX
         4+L78T3O2Ho98eJqpPiVbp1/ktc/sKNMnIEG3aWSuE9bO8EfUYpwFHkPTC07roeJBO/y
         Ha39ueuUu+FACQ1TP3lQDVlPZjmeIRqTQkihw5DgCgMozDQ3JuOwepnsAfDzCvGy3Hos
         q7cQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1Ye+cjj0u+qhopibHRQPAW6E/oa6bQ7w1tdFxYSiYnXQLJbkEn3PwOOIi9n1qk8/2jVvvzz+BZySVrSyFkvzVdXN3QNSan/qV3hrfRg==
X-Gm-Message-State: AOJu0YxA9gsl8hsKQqWE4/pfBzBcZZOYYJtnw/UsNK/Cg1RM3+eQORDA
	ZU27yG+I7hwEnX3oaBI3SJWU8RSl7iuG0SSaSNkArDq3mRPmvldgUNlP2tK0K8jxGZIsMzAiBNx
	MFgqLwB2n0lwOQkmjet+afx2CtZDz3unNG1ogSA==
X-Google-Smtp-Source: AGHT+IGOx/zC8gPSOJQuDPkSkd1nf4N2mE7xnUIZOVlkbUscpDxNFS5fOG+JiLkWkR6HldqnK+FvO6CDi/U96xWLW4E=
X-Received: by 2002:a25:ab08:0:b0:dcc:ca51:c2e1 with SMTP id
 u8-20020a25ab08000000b00dccca51c2e1mr13283832ybi.2.1708470170970; Tue, 20 Feb
 2024 15:02:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240221-x1e80100-display-refactor-connector-v1-0-86c0e1ebd5ec@linaro.org>
 <20240221-x1e80100-display-refactor-connector-v1-3-86c0e1ebd5ec@linaro.org>
In-Reply-To: <20240221-x1e80100-display-refactor-connector-v1-3-86c0e1ebd5ec@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 21 Feb 2024 01:02:39 +0200
Message-ID: <CAA8EJpqSw5N5=Ki9Y7n5Dr2Ytxboa4u_d+a02Wicp=QpCNyiUA@mail.gmail.com>
Subject: Re: [PATCH RFC 3/3] drm/msm/dp: Add support for the X1E80100
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Johan Hovold <johan@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Feb 2024 at 00:50, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> Add the X1E80100 DP descs and compatible. This platform will be using
> a single compatible for both eDP and DP mode. The actual mode will
> be set in devicetree via is-edp flag.
>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 9 +++++++++
>  1 file changed, 9 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

