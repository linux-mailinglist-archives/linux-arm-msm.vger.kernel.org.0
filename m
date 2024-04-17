Return-Path: <linux-arm-msm+bounces-17693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 209178A829E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 13:58:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CEEA92821B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 11:58:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A861913CF88;
	Wed, 17 Apr 2024 11:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MBRwF4Rt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C9B7FBD2
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 11:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713355118; cv=none; b=LMLBdii3f1AAYGt4cWZsDPcmruyv/Zo25pCofZoK16gB2uj/Yc+6AM9uBe1xXwL6oUlTlaSu+c1hJSawjt0yCfF/kBwL/y+2BBxqapDBHxdU8in2ZK/8VOJz3DMzBkR/Yf3mjBBG5qPCsAkIXFAA7W2Ev9xZr0TQ1ivdlAOH7RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713355118; c=relaxed/simple;
	bh=n3E7Lzw4xFNf9xuprek+3okMw/w892dRTyoP/dcO1Ps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W61rfZ0OCJBjVUFONmBQ2WWH6LTq1cnZCfcEnxKu/dAd4i6JrMubO1FB4iumruq552bnba+1OaqIZQRGt5GbeTypNgkx8y74Fk+uN6iCvcbAZB6g9WkB883/PnVDGg/FDO6l32HCBqKt0mKTTkifXwNRxqGNyGQ9Qk6UvKbYVr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MBRwF4Rt; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dbed0710c74so4738313276.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 04:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713355116; x=1713959916; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ox5LPkHgtGr2/XHUCfFXXYvppG+HqbU+7l8WZ9khYtU=;
        b=MBRwF4Rt43DhVpdTLDXWW6zo7lKA/MV4W28NTk+6IDUp0wuMSeKZdHfYHf99RF3Mzz
         xUwvHCH7SEf2npZy03ANQ852kEFy/qG21M/3O1tAbWYtX6Yc39jerL9WSEA5G6kBp1Wh
         CEoIe3JV/dy8csAuCUbx84vkseglGQqNF86CorHcHl8z92SFVvshHt7A0nH6to5N7nPC
         +7JZ+7vxlGnFXSme2ZP4/eBYWmMh9BMFADaODPbSaYZIGNT42NgbDkGRgENP9Xwm6iK3
         UHmuKMjDGn+N4V+4HumpvKuym/fLLf5fk7ODQnSABIeZr08PB2z7gqGKjbdNIRj0Wb3u
         1Q6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713355116; x=1713959916;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ox5LPkHgtGr2/XHUCfFXXYvppG+HqbU+7l8WZ9khYtU=;
        b=jXShjv5l7DUTrnotvRlsmiYp4bWDvN/ripAuEatkHUC9jWQ7/f7Y5udv4v4dAvCGXw
         CrKnwl1L+P2xA3erbd7d50Uv3blnS/crmdejfhlNJYy/AfD0I2HUJ/CMF3g681eq6ZlY
         QSCbMbsDdYa5FP5A88eDa5Z4qW8o6jtRkCk69muV5InujpihlXK8s7bQucOgmvMpQy8Q
         yPXWyVvHn9Qo7XZ6lcMobyTCVIgQz/OnKSExq9GVxl6+4J56i7pLC0ailW/NdAlAQm8A
         qTV3UHqob6NKlYRpqYDInGwdRHM7pyWYg9fMNBy83yz3GHSPeKm/Gz+3LeorD5f69Tio
         vEJA==
X-Forwarded-Encrypted: i=1; AJvYcCVWrI1a9eH3K1Y1TLwh6LLf++qO2hO/hfIGNShhAhpyGtlHfLwTtHrJ3sQOtJW5Jy23j5P6b5TyxIvEmzVTmGFxWMEWjgilSG6DuxpjZg==
X-Gm-Message-State: AOJu0YxncgF1mSffZ9w8NCW4qOKkiNAgkmGCY1c5YZ/nxH+gW8oZB3ze
	IITAnRKZr8nhi3gCF6N/7L8xK1KvZab8arXucd2ZkWdI+GQ47uQ0QgG3ftrOjmIG4WQeu6jVeq7
	B5yHinGKA1gMrTpbtpgexqKMHiTtv7jHDZOrE8Q==
X-Google-Smtp-Source: AGHT+IHroa6k1HZ0B1EjkdHyvkWVW2/keRVisrkhSaTkSXI+Xy1B+n4dLICjNC9Mn6XDdWwQWSgpT8LgLcWwaM+pobs=
X-Received: by 2002:a25:3d05:0:b0:dc6:d093:8622 with SMTP id
 k5-20020a253d05000000b00dc6d0938622mr15444148yba.15.1713355116056; Wed, 17
 Apr 2024 04:58:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-0-78ae3ee9a697@somainline.org>
 <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-2-78ae3ee9a697@somainline.org>
In-Reply-To: <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-2-78ae3ee9a697@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 17 Apr 2024 14:58:25 +0300
Message-ID: <CAA8EJpq-1QwoM2hEyegpfKnVH+qrswjmTd_hpYs9d9B7gikHjg@mail.gmail.com>
Subject: Re: [PATCH 2/7] drm/msm/dsi: Pass bonded-DSI hdisplay/2 to DSC timing configuration
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Archit Taneja <architt@codeaurora.org>, Chandan Uddaraju <chandanu@codeaurora.org>, 
	Vinod Koul <vkoul@kernel.org>, Sravanthi Kollukuduru <skolluku@codeaurora.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Jordan Crouse <jordan@cosmicpenguin.net>, Rajesh Yadav <ryadav@codeaurora.org>, 
	Jeykumar Sankaran <jsanka@codeaurora.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Martin Botka <martin.botka@somainline.org>, 
	Jami Kettunen <jami.kettunen@somainline.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 17 Apr 2024 at 02:57, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> When configuring the timing of DSI hosts (interfaces) in
> dsi_timing_setup() all values written to registers are taking bonded
> DSI into account by dividing the original mode width by 2 (half the
> data is sent over each of the two DSI hosts), but the full width
> instead of the interface width is passed as hdisplay parameter to
> dsi_update_dsc_timing().
>
> Currently only msm_dsc_get_slices_per_intf() is called within
> dsi_update_dsc_timing() with the `hdisplay` argument which clearly
> documents that it wants the width of a single interface (which, again,
> in bonded DSI mode is half the total width of the mode).  Thus pass the
> bonded-mode-adjusted hdisplay parameter into dsi_update_dsc_timing()
> otherwise all values written to registers by this function (i.e. the
> number of slices per interface or packet, and derived from this the EOL
> byte number) are twice too large.
>
> Inversely the panel driver is expected to only set the slice width and
> number of slices for half the panel, i.e. what will be sent by each
> host individually, rather than fixing that up like hdisplay here.
>
> Fixes: 08802f515c3c ("drm/msm/dsi: Add support for DSC configuration")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

