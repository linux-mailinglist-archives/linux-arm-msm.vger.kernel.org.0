Return-Path: <linux-arm-msm+bounces-48280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B58A38CB9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 20:50:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87EC4188EFFA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 19:50:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78ADF372;
	Mon, 17 Feb 2025 19:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DHZOkN+6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8766D23770D
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 19:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739821837; cv=none; b=TjmDBZcvMnykIiKrT9PAeiq9DylM+foWvBfLSI8EGcPfcw0wmdzo+Sl/lVSFl3Eu+aNJArvZ9OtFZXKO84Cvm1HvR88ykvEy9I6ijajLkmrxLZXeBeWre++mcO5oonTU0onRbWG60KM89GfJWfrFf6F63NmUbGCTPDOhh52kEV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739821837; c=relaxed/simple;
	bh=OtQGjZibfaoAgSCWyYg6KTXMKcn/tqRoYLIaZ14cr7o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lJyElto1+nOjjBq5su8E9upiboU+aYTqb+NRvzQZE3SqI/mOSUysYadB6mhzNuX02Fp5hDtFYkVJYQFPUl+k3qg5qp4uI0yhbhpMBu9qyu3JRHb6XYqZikMo41Vwer+MzHNN7tVeilyM5rNnPUJetsat2G5ZO+Nm6ZpXlafKsSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DHZOkN+6; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-546237cd3cbso1271368e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 11:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739821834; x=1740426634; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b7XMMxmB25I7aAKLMKpG9EtSe+ebYBtU0fhxbENZPlY=;
        b=DHZOkN+6j4g1JB2ZqNIdmdqxxEnDt3S3x4OS3nQuRRYoCn3Qc0uOtIZsf710fFLMx5
         uguIm4xXeaeg2VI4zzn7UQgP+FYNfghQ+wSoSTdHw3ILdyWCAD4ykXIXtOzfCyTaYm8F
         RTW6RhptQrDFfgzaBugi2mgAKm3syyJfGKpGTqNxUQaNZrP0hHPDFtRtHi/XshvzBaV1
         0+I+ik5xB1vBH9zN+Xq71eK46ONniwCnnok2Qps2NA6FVtPmIcoR0HbimYyeSxySJQo+
         Wv+V6+VmK8Oxh2225P2N9pxdJcA7Sf2uj1xubqiZ46Yv9mk9ITPxESEjud/LIXAaFFVt
         +NqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739821834; x=1740426634;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b7XMMxmB25I7aAKLMKpG9EtSe+ebYBtU0fhxbENZPlY=;
        b=rWWQdvwuhDMqZiuE2qgjlDhiiX4OYg0LIADCI2+ymuDjUAmuT0TOGr63pjXEVQFts1
         2XXdhIbxQ47naaO6MKoyJc9P50cOuKkJpPrU6hQ9jFSDau0lcd8kU3aN1sL+ITM/2H13
         LbPWGDx2TNubyahAPHM2NWHEA270eBbmmY7Q0JC1vGlt3hf6jfQQJDkqURAeO9TEcYkp
         H+zDn9LMxMqKfr6Rt2ZbO8ro3nGpHZqFDv3/DdweZOpS89zmf7Wx/ZuDfOJumt0Tktmc
         3SxUzQlSobkMehMcuaUmIAdQ6YCR7WwXg6DptseqTThtxIB50NGEJdBOESkUchwSEooc
         e0XQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSis96g6F/I5SRzi7GckqXvVHHTA0IE1Q2Tca1S+LDorAuVeNFsObCFblzHmaOAwUB7UukTHqyTgRA6OA7@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1wqxxYg5XcKePt/zHlluMsK7WiwiI8M6qyR4ddycr3b+2fmoM
	yfVdTTImlABi/Ls/wZRmJbv6btDc9KzGdh/PWsvcbPprIj5WnaIPyeEBM2Zr8eA=
X-Gm-Gg: ASbGncsW4eMururJd9VVmgNtVOnh9X+TPcafw/9/HQjA+qKlS7fsJEXkKiKZ/OpccCs
	uoAqPdzC99/x8SMoXcvBGpMcje8Y6EPpTIc4Ob1lbJeBAhI7HVwsXRujk2wECXj5Ai+RtfVKWmy
	H7awOMtLirdnRsYgyY0YGmEd34301UAyd/MYC+pDsJhqotb1rix5vTK/UsrJxTakcFcxE/W9UXY
	rzZl2diEENOyurrJ7Bj4MlpGhNwDgtGqxSt08sZr39rHaWv7eNQ6wcSTflWaRkThclNd8DQkiOP
	o08j2ujonHsZihZUYch8kr8TKZxZgK2ueCzCEsK9HKFfxPRIPPk7wkcWBMwSNhurHhC7tHs=
X-Google-Smtp-Source: AGHT+IFEnXuT2usVcSoMTmal4BeyQztiA9BaCKYabRMQm3dIpVeX4YHZzzAuOaY3bq5cOJl0zMdGsg==
X-Received: by 2002:a05:6512:1194:b0:545:ff1:bcd4 with SMTP id 2adb3069b0e04-5452fe2e442mr3602142e87.3.1739821833664;
        Mon, 17 Feb 2025 11:50:33 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54522858229sm1504623e87.4.2025.02.17.11.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 11:50:32 -0800 (PST)
Date: Mon, 17 Feb 2025 21:50:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 01/15] drm/msm/dpu: check every pipe per capability
Message-ID: <sd3u2l4epms4ttytoc2bqrzsqfxnphqkutwkxremjon22ven72@3rohlpaxhryr>
References: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-0-c11402574367@linaro.org>
 <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-1-c11402574367@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-1-c11402574367@linaro.org>

On Mon, Feb 17, 2025 at 10:15:50PM +0800, Jun Nie wrote:
> The capability stored in sblk and pipe_hw_caps is checked only for
> SSPP of the first pipe in the pair with current implementation. That
> of the 2nd pipe, r_pipe, is not checked and may violate hardware
> capability. Move requirement check to dpu_plane_atomic_check_pipe()
> for the check of every pipe.
> 
> Fixes: ("dbbf57dfd04e6 drm/msm/dpu: split dpu_plane_atomic_check()")
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 71 ++++++++++++++++---------------
>  1 file changed, 36 insertions(+), 35 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

