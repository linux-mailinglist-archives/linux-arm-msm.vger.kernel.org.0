Return-Path: <linux-arm-msm+bounces-9766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C9484936C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Feb 2024 06:37:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3EEC1F219E8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Feb 2024 05:37:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5F4BBA2B;
	Mon,  5 Feb 2024 05:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iTg3VA5H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC22B67F
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Feb 2024 05:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707111458; cv=none; b=i6eew63b9gDjAAv5On5fmEeoZ9BMoS82EyOUXQcjJJM9YvitFh4AOUemVds0SjMwHs6cKAfkesPSBc/4oz2DWilylzaA3UauJ56O/OVUSQkVSKFq0j/48gbU2CBdqDdi71xLDpRZQyCrrDanieOm6oGceIAN85j3nf+2bXvBDQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707111458; c=relaxed/simple;
	bh=lL3Kw0e+RGP+LCXFoBF72NdRCBasOWh0rlxV7PPYzOc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Knff4msHcZCeoBw1MeBEnJ2Nqx0/Cmf5fIhli/4mkj1WEFzBM2R/MaCdiDx8zlW3wKQ2rOEvq8KHBFpefiDlkFA7iWwos225PGyu3Oqza4BjwvOF90xIH66tJbYfdb9EaDpTEtzf9ZlsrImhXMnQuLA7ftAV1lOHGmCmHV/zgeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iTg3VA5H; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dc6c0dc50dcso3211137276.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Feb 2024 21:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707111456; x=1707716256; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wJjNw35YY1+xIX+ZjXNQI8+RD6p5g5mUPgiVQOnjdUA=;
        b=iTg3VA5HkJs4Equ/awqx1EK804y3/fDJkXo20TrEIh9cElVZLgTxS/v9B+F0/tIxjj
         QXYRJQjqFhRstspZAenlCmJPM1Q2/MbG/qY2JDAuJ+3r7SfNSWa4FJaouGBtGPE9x0Kg
         IAbIrWCw7FBb/AjG7W/QWaJOtgpl9TbCh1dyPByfn6zaOnbAHzEqe4pP9yuCe7VZ/jUg
         mBEthb1JiC1HLUJUpy0x9kWfVxRt5RgFpgKM+iYJOfjIa+IWYPdypcFJVSV9pxPNvV8r
         kkZPLnx7jNX5LlNRGYG3D6Wwovsd/Mr4sS3/oz2Wsni3W+mGVGT156ZEOGnANdHYI5EC
         5Ymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707111456; x=1707716256;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wJjNw35YY1+xIX+ZjXNQI8+RD6p5g5mUPgiVQOnjdUA=;
        b=jSPUr6mZjps5I3kaZ3FzTYl4w4xgMXXj+itOeM+KkHrhTGDnBfttbpWPQWdZ7xGslO
         AiV9K5CH9WH56ABeFWJk0YKnI3CaNMnVm85UP8tNAwdR+xNLc7LuCGDV9fF48vTgu0f2
         clmYJpbP2WSyEjTpPhAIYHqVgUgAOCH64HRZz7GJFE5bL0nuz1Yp7G/iV8GFy7jgck4n
         eUNtX5ksekwKoqzx0bq43uU7w05l3ZVJsT9WCIXtNNnUx8x9T2RRFVUBqxan0rrK7JFc
         eN28UfK8OMaE1egoNdXdakGCyGgBKIAGHsGCDv58rU7KTV+K5Tytix//GUUjIDQf383p
         zpKw==
X-Gm-Message-State: AOJu0Yx8g9+N9xIbgOxRNhe7+YT6/GLSlsVBGx938TQfuYV+tsgK+zpn
	DCXRjeOv3rYmP502u+TpimaR1uwtGjjnCnuNh56iX8vHOgjBZjrFm2PyM6iduFiBIrFw2uQ5uOQ
	Ovw/LsemyfxnnWJzeSaldi/loceAJE4FkNIEzjA==
X-Google-Smtp-Source: AGHT+IH5h/GfScQ8uw8fhFGuFhxI9uT/VT10/zpE4KPupj/LoHJfbss5PCVGWktP+vBdNies+A9M979a/66kKLxePN8=
X-Received: by 2002:a25:2681:0:b0:dc6:c2b2:c039 with SMTP id
 m123-20020a252681000000b00dc6c2b2c039mr12445401ybm.41.1707111455954; Sun, 04
 Feb 2024 21:37:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240204-dpu-dsc-multiplex-v1-1-080963233c52@somainline.org>
In-Reply-To: <20240204-dpu-dsc-multiplex-v1-1-080963233c52@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 5 Feb 2024 06:37:25 +0100
Message-ID: <CAA8EJpqBJDQ=Yodw8mQF-M7UFVA9POokqgM2rmErTSOASyMo7g@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: Only enable DSC_MODE_MULTIPLEX if dsc_merge
 is enabled
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, 4 Feb 2024 at 18:45, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> When the topology calls for two interfaces on the current fixed topology
> of 2 DSC blocks, or uses 1 DSC block for a single interface (e.g. SC7280
> with only one DSC block), there should be no merging of DSC output.
>
> This is already represented by the return value of
> dpu_encoder_use_dsc_merge(), but not yet used to correctly configure
> this flag.
>
> Fixes: 58dca9810749 ("drm/msm/disp/dpu1: Add support for DSC in encoder")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
> Note that more changes are needed to properly support the proposed 2:2:2
> and 1:1:1 topology (in contrast to the already-supported 2:2:1 topology),
> but this could be a trivial patch to get going separately before all that
> extra work is done.
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

