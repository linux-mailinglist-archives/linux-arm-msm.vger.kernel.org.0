Return-Path: <linux-arm-msm+bounces-6343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4488B822665
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jan 2024 02:09:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D8FBFB21CB9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jan 2024 01:09:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A909C15B9;
	Wed,  3 Jan 2024 01:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tSucvz2x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB1AEC6
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jan 2024 01:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dbd990ad852so6286611276.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jan 2024 17:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704244188; x=1704848988; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DG4L4lYtCuZJbRBE8lQJs1HFF5YGxemE517QXOU6TF0=;
        b=tSucvz2xVnSJCwxEw0lH59YIk+uRrVYBgttlwfiI/GHQ1RxwqSqT5Qg89ysPo9FCmr
         k3a0zUUQX8+e0fe0UFwJHCZIPAeLbdDSa5U1mequM9PipxOiFk7nMQ36ttu30WOpZ949
         NW8UmzU2XZYfpyEaCzySr+T3pMx9IWCv2HHiqZmDiRaPgehU4Z6BtdviSEbSt6sljcy2
         8gtymqXsaWydr3nQ4Lkq1vnXLhMbBZGwW9rg8VSjnYnG4cAQz4im+NJoC5hEaLFfDpeo
         ZpzYrI5DbGeXgCVZebOKYGExtfb9LyXUw1ZKdoZv6dbJJDjOLKownDgXOQ7fEtz9qyZH
         mRzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704244188; x=1704848988;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DG4L4lYtCuZJbRBE8lQJs1HFF5YGxemE517QXOU6TF0=;
        b=uJlocqKHbHBTRATpoHZ+bMN6Ovki0Rj9z84cQ0MAF9Y6F5Xo1T89ikIl94I874f19u
         1sB0i3Wa3IVcNMfEYA0ahZHEiPLNy3GaVGypOSTImKsNRk0fbaGoD/r+rKXqzYna/+/F
         jA0NgQrlhSSsFY2uJ/FmvMobb2Alwu5wYJIF/AlNe9vngVngoq3lHw8REeORtJIJ7lAn
         djgHMu0AUM9v3YjmRGSNctlqwMCziRgoBHuuz/PVSlR2nYNw1K7MncoCbjt28ydCc++Q
         nbC/EvLk0hFRZpCjgqBpQ1nvSEL7J4CIuX9hXciYnEaOf11dMn/MFdK7h0XxxuKbQV4Z
         R/Xg==
X-Gm-Message-State: AOJu0YxXixxGK6Ca+A1tF74/pTQvJt1hpNT5UeGYFyv8O7AJmZqkUC4A
	AeVkXx9S9f0D4OkuyY+5D74PT8AiQbnKLZ5im9Ujwaa0DKdfKA==
X-Google-Smtp-Source: AGHT+IF2SG5jIzKRHJmYZYwmnlnpiJrFcs9I5f2XICXUuB+krrM5Glrodkr57n36g6T86Q04dS384DBfSqPKcmQel8Y=
X-Received: by 2002:a5b:60b:0:b0:dbe:6c6a:af85 with SMTP id
 d11-20020a5b060b000000b00dbe6c6aaf85mr2226326ybq.91.1704244188068; Tue, 02
 Jan 2024 17:09:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231231060823.1934-1-rdunlap@infradead.org>
In-Reply-To: <20231231060823.1934-1-rdunlap@infradead.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 3 Jan 2024 03:09:37 +0200
Message-ID: <CAA8EJpprirmP1=2sJNozWe8GPKCCXXPtf1XQP2u6K2CfsD378w@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: fix kernel-doc warnings
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>, 
	Vegard Nossum <vegard.nossum@oracle.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, 31 Dec 2023 at 08:08, Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Correct all kernel-doc warnings in dpu_encoder.c and dpu_rm.c:
>
> dpu_encoder.c:212: warning: Excess struct member 'crtc_kickoff_cb' description in 'dpu_encoder_virt'
> dpu_encoder.c:212: warning: Excess struct member 'crtc_kickoff_cb_data' description in 'dpu_encoder_virt'
> dpu_encoder.c:212: warning: Excess struct member 'debugfs_root' description in 'dpu_encoder_virt'
>
> dpu_rm.c:35: warning: Excess struct member 'hw_res' description in 'dpu_rm_requirements'
> dpu_rm.c:208: warning: No description found for return value of '_dpu_rm_get_lm_peer'
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Vegard Nossum <vegard.nossum@oracle.com>
> --
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |    4 ----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      |    3 ++-
>  2 files changed, 2 insertions(+), 5 deletions(-)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

