Return-Path: <linux-arm-msm+bounces-35239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFEC9A67EF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 14:19:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8695D283D36
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 12:19:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B5751D63E3;
	Mon, 21 Oct 2024 12:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MZ8R1w0b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF77C1F7085
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 12:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729513074; cv=none; b=EcKANO2h+xGeX5F4ygMUDO1bVjn+4i2VQ1pK3pJpIaTeP//AWP5TT66Te9l2c/PbCBhROlwm9ln8CPSA8OW2/P4FbVx+9+0b0kIoZtYoyFq+u61v59X8c94ZIxNlCJutqkzFTCXXOeOjLnNpanJZxzuPoeV66NXQNFj4zISXZ30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729513074; c=relaxed/simple;
	bh=dsJmtV80ghJAoDvBIVsWEmAs2BEyMttf10a0dnNfdbM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V1Dn3stUC25aP8+M8t5Kn+n8hgv/jiGEiYmuNRW8NqN3dHU9L1ZrTQOnM1KmzJzvlKd2LDvA7ytp85YhDh0R4O/poQAvR0h15O7YQOKA5bkvrGpyHoghgtigYZxskFoWhJH6Q1oHDJ50OpQozZ78YujJGXBwQZhXZKm8g/idN8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MZ8R1w0b; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-539e8586b53so4575956e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 05:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729513070; x=1730117870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8qLLGlelXfw2kOWRgnYcArT7sxf7Sh5Qskx0JzdYb0Y=;
        b=MZ8R1w0bOrHfj/jQWDJxDhzROvF5fUeGZULKDlOdSUs6ETUVjapkb4qtfq3z4n/Sr3
         4O/BBlFmbeTuqx7UUGRENBD120eNNSLaUmuAwc1mqrb4nTds6qMMEr2LXUdmu2gRW0as
         vPcDsaS0wmyMhsAF9Hic1lMoHXhG8fafXG8xdP7BhP3/pR743s1ePN3VnVzOjMcnW7e7
         AWlQkQZMeUKnFBLsnWguLNuC9xnPPOklrMPy0CZ0rVD4eXjZFuNZRTpC9DEGDVgcKy3P
         ow8MrPYejHIM7md7r9yBFhpNZ59wET9Xu9YO9jMRUgQAZyyKePbnpq1KGNludTmDPyTO
         IY2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729513070; x=1730117870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8qLLGlelXfw2kOWRgnYcArT7sxf7Sh5Qskx0JzdYb0Y=;
        b=mgZB5OivoSGUPdByPRbcAyke6IBXN97Wr4CwZqvIF1KvSoGiRpqR4qzEQ6vCRlyZ6j
         SaouaBOQR41hUNvdFFjJl/SGF050Zf0sQTJoLE1pq9o/VczkqpFgFSC5bEiw/1skkkI8
         gLYzwfG7hRfG4bx5FYsHE29Q5n6U5iuQmLSjHDnCILWjlEGVC/GUlTxYLqNZFj91M7/4
         5XQ8Un2IQzLtMm2xOLT6d6ztpIcrU3U1b7GWM5eOAb6+COsx0Xr0eo5WB/l3312nwOQz
         EL+5NYxD07yrh31H/kuzGV2sV76Pi6/pD3h/8RmnkvYF850deBnUMIwZYoeq6ok23Ink
         TBog==
X-Forwarded-Encrypted: i=1; AJvYcCUXiVs4IdbygMTxyvmFLp02ZLZPsk2DhPeG0Kmj0xfaL40mPeg+3ZjjK+ubnwZN/uJxvuUxFVlo2/cw4nVm@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr+FaP1GGsQF3dkZKjDM/gZclBIfIIvMwpADcjvl76nTvR9ISJ
	OjQ7CI+OCBJjaTF55SEQRLNheewxvkUGLN58qpbDWXSRCEpOo7lb2b7wXAzg54A=
X-Google-Smtp-Source: AGHT+IF0g/bNs020ktyvkJGhslYGuUa/hvVDeHmrz96Crq4Feba3diCTJ56gaV/wdKJy4llgsgIr6A==
X-Received: by 2002:a05:6512:3ca3:b0:539:f1d2:725b with SMTP id 2adb3069b0e04-53a1583d16dmr3188181e87.4.1729513069926;
        Mon, 21 Oct 2024 05:17:49 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a22431454sm464210e87.212.2024.10.21.05.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 05:17:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abel Vesa <abel.vesa@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH v6 00/15] drm/msm/dpu: be more friendly to X.org
Date: Mon, 21 Oct 2024 15:17:39 +0300
Message-Id: <172950935859.2053501.3604062038723435525.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240903-dpu-mode-config-width-v6-0-617e1ecc4b7a@linaro.org>
References: <20240903-dpu-mode-config-width-v6-0-617e1ecc4b7a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 03 Sep 2024 06:22:43 +0300, Dmitry Baryshkov wrote:
> Unlike other compositors X.org allocates a single framebuffer covering
> the whole screen space. This is not an issue with the single screens,
> but with the multi-monitor setup 5120x4096 becomes a limiting factor.
> Check the hardware-bound limitations and lift the FB max size to
> 16383x16383.
> 
> 
> [...]

Applied, thanks!

[04/15] drm/msm/dpu: drop dpu_format_check_modified_format
        https://gitlab.freedesktop.org/lumag/msm/-/commit/a26991933c01
[05/15] drm/msm/dpu: drop dpu_format_populate_layout from dpu_plane_sspp_atomic_update
        https://gitlab.freedesktop.org/lumag/msm/-/commit/759bcfe8e710
[06/15] drm/msm/dpu: drop extra aspace checks in dpu_formats
        https://gitlab.freedesktop.org/lumag/msm/-/commit/ce357877e6df
[07/15] drm/msm/dpu: drop msm_format from struct dpu_hw_fmt_layout
        https://gitlab.freedesktop.org/lumag/msm/-/commit/5e317a64967b
[08/15] drm/msm/dpu: pass drm_framebuffer to _dpu_format_get_plane_sizes()
        https://gitlab.freedesktop.org/lumag/msm/-/commit/d13445bc61dc
[09/15] drm/msm/dpu: move pitch check to _dpu_format_get_plane_sizes_linear()
        https://gitlab.freedesktop.org/lumag/msm/-/commit/d8cb42418207
[10/15] drm/msm/dpu: split dpu_format_populate_layout
        https://gitlab.freedesktop.org/lumag/msm/-/commit/b05093f4296a
[11/15] drm/msm/dpu: make dpu_format_populate_addrs return void
        https://gitlab.freedesktop.org/lumag/msm/-/commit/4f3ec1e5e152
[12/15] drm/msm/dpu: move layout setup population out of dpu_plane_prepare_fb()
        https://gitlab.freedesktop.org/lumag/msm/-/commit/dc0def61a16e
[13/15] drm/msm/dpu: check for the plane pitch overflow
        https://gitlab.freedesktop.org/lumag/msm/-/commit/707db375ecec
[14/15] drm/msm/dpu: merge MAX_IMG_WIDTH/HEIGHT with DPU_MAX_IMG_WIDTH/HEIGHT
        https://gitlab.freedesktop.org/lumag/msm/-/commit/671cc420b5f8
[15/15] drm/msm/dpu: sync mode_config limits to the FB limits in dpu_plane.c
        https://gitlab.freedesktop.org/lumag/msm/-/commit/2261751d5f22

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

