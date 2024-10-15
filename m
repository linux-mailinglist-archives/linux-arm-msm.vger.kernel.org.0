Return-Path: <linux-arm-msm+bounces-34436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A457899EA33
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 14:45:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0DE09B24345
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 12:45:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82A0C227BAF;
	Tue, 15 Oct 2024 12:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n9vLNF7D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C82820822B
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Oct 2024 12:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728996244; cv=none; b=nY8+9y85l3hhjTc1w2Ex7BCcX2bYXlr+C04Dbf9VD3mO0oxQi5LQndyk7dnp9+Jglv2XwNuBcAadEZnnjBYBvWQnU/XyrunuchMmAKoK4DRLK0ZkkJBdxYqzhf8NK+60LErAf+h/ygI5U8BC31TVB38lAY/UyQKJ9LBT17k10dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728996244; c=relaxed/simple;
	bh=hNnxWKLlMPPZitvua3vagkjJNmVRjjlktvOTOWrbJLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VIGfEeMXN8QjVF+/ftYw24E6upGS3Dr+7JIb8n9vSgeSNRB7JCil/7HRey3yxf/5iRy6ovwmhjqJQz1MbDYvGGLJoFO6X87jmM0NxlYZ1s+dd+dvSgc1iVKAOnYNkPtSOlp8uTIps0LpumUCg9AEu73XAMqd2cIoyJfdsj171xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n9vLNF7D; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2fb498a92f6so25275181fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Oct 2024 05:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728996241; x=1729601041; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3SQaNBGN1mxZVAMjEtaA/BhZGMt2iLPd/VivsuWhVfA=;
        b=n9vLNF7DQDJ3QrproxZbCKNR/KzQEYHyND9ofV74ejfvePx8vsZS9YG4Z+NjWvRStI
         NBTqjbiTN4YQxN9xRKTICn4//BTopxz+ZHJzypFtXzNKiLmPyRhcxdlyiTwF+Lkv14HY
         xTOZQPMukn+s2Q84OJZY5kuvG+2lxo5MQy7ekEmKk/Y5YfWiuo6hlUZIhe4oT+x6/ypq
         w6uTJtTP0IHGQlVpfuRShyoKWJiqMWifPsxSUrUH1944+CMkhBWnZrOYOHmKwPCT3J4u
         ym9RrsqoA7Dsnmccbia7ZIsDxoaXXwotEC1IYtrUgzMpy4ZfSbtQ47Q6K2cjpsO4Y5IM
         6HBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728996241; x=1729601041;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3SQaNBGN1mxZVAMjEtaA/BhZGMt2iLPd/VivsuWhVfA=;
        b=FzrK0R8oegQCVw3RTiLRZmobKvDPJbrLEomHqeVEWGyaS+4vYSpRfKoDtxtOiHDNFi
         uKrjnToCedVGZ+B6nzbMwpTco7KNPBLD34WbgnNfwrE6WqR2QSy/PGzPBYLw3XC5ckym
         y+C8T2Ggi4m46fGdnHEOW0HQGoKDt8KjiLommivi4PZLRFe9Sdj1rruoYyHB4OYk/GNg
         mj/y6WZMvn8yTLEod1BQNjrlSkhSF6pQaTtBQi2RxbPOayAC8rCamzzL2jtfsv19PGG9
         y2yWlZCHw+TqBt0VcABmsEIiHLrge516wLoy0v3bzWmH0bqdxHPtq4SSgYfsYgTv7GwR
         4zCg==
X-Forwarded-Encrypted: i=1; AJvYcCVTbrp4Js5NiJbNqbnoTZSLu0Vv0lkz2tCLuWtzeNZpijvq+tSN+4Dpe174KIiUzKy94cnWscQFtcMRVXeo@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5spYMXGZJ80rPmNjL1H83oaf+rRHLcNKRby/HraIjXDQySIlL
	puRYJcvfaEOyNVoaGd4utAm5Enae0+/2HAF72cVvQB2onsB94ftTw3mcJ14Wn4E=
X-Google-Smtp-Source: AGHT+IEtf1bxgczpfiNA8NzJb5A9RmLJNMO353LaV7Pw7z3bEbJ44JZ2pT+RaReMTzzfnefZ/EOInA==
X-Received: by 2002:a2e:b164:0:b0:2fb:5504:7966 with SMTP id 38308e7fff4ca-2fb61bacc4fmr1979851fa.30.1728996240652;
        Tue, 15 Oct 2024 05:44:00 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb5d126dd6sm1575741fa.52.2024.10.15.05.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 05:44:00 -0700 (PDT)
Date: Tue, 15 Oct 2024 15:43:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, quic_abhinavk@quicinc.com, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH] drm/msm/dpu: Don't always set merge_3d pending flush
Message-ID: <mkuayois4t463oqpxi47tl5npjdsafovivmx3pscnmxy3i4v3w@xt4omvobamim>
References: <20241009-mode3d-fix-v1-1-c0258354fadc@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009-mode3d-fix-v1-1-c0258354fadc@quicinc.com>

On Wed, Oct 09, 2024 at 08:41:13PM -0700, Jessica Zhang wrote:
> Don't set the merge_3d pending flush bits if the mode_3d is
> BLEND_3D_NONE.
> 
> Always flushing merge_3d can cause timeout issues when there are
> multiple commits with concurrent writeback enabled.
> 
> This is because the video phys enc waits for the hw_ctl flush register
> to be completely cleared [1] in its wait_for_commit_done(), but the WB
> encoder always sets the merge_3d pending flush during each commit
> regardless of if the merge_3d is actually active.
> 
> This means that the hw_ctl flush register will never be 0 when there are
> multiple CWB commits and the video phys enc will hit vblank timeout
> errors after the first CWB commit.
> 
> [1] commit fe9df3f50c39 ("drm/msm/dpu: add real wait_for_commit_done()")
> 
> Fixes: 3e79527a33a8 ("drm/msm/dpu: enable merge_3d support on sm8150/sm8250")
> Fixes: d7d0e73f7de3 ("drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback")
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 5 ++++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c  | 5 ++++-
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

