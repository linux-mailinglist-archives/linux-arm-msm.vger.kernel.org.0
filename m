Return-Path: <linux-arm-msm+bounces-44127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A96A03E36
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 12:48:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2054F162211
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 11:48:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E16C1E9B37;
	Tue,  7 Jan 2025 11:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GmCyh6Iu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B702B1E9B0B
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jan 2025 11:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736250493; cv=none; b=hpK7HttOnM80mwjiGcQuBVT/+eMiUBVbL9sv8Nmnqd5Afk0zehaghgtHbXxID3wCJ7aag0hu4Gthd+LXQNTllDlwE+fJETHe+Xqut7gN29G/pLBth4bNtYrQXtPSCVAm+4DuHjPEoujlnntoOh/2Ue6vJVckVv0rDcbvjLGZzYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736250493; c=relaxed/simple;
	bh=4RGQoBHKQZtz0IrVkoobUVpp+jAEVI23wrJ1kxeJaG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JE6+n3+XQ2QdSPKPtoavK7MJ/vkABVMCFs+1KGdCY866+EssfNDfe1m75f2esJXZKmxa6qvMJ+3p1viwJHqN4tCJ+YH9p4N/2IZarIq5X0dq8PuculdBZ4JYPza3NthkarCw0PeRqKanLq7yaLh+r6zTXSKJmlQuCh7PQTyEovs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GmCyh6Iu; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3003943288bso175959791fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2025 03:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736250487; x=1736855287; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1BZ9YGNo2SXE7kqR3kflhucDH3azbi8G4Q6AF5m/Ioc=;
        b=GmCyh6IufiHiUloPzMLOoaiNF2ZGwy8UxMG8rib6UqgQ0B9e/b7hnO9Ch6gAekn10k
         PgkhhRcGGELR6w/aLRuwGNw/5bxNDdH/ic7v6+3WYFp+rNCBFQrMIbWaih+nTaMHiXvw
         xa4mDsNRtjGMDqAwRNYYayAKPjeBx/csfBI21d3Ra0KQiM8//gzCK1epCxzenbZctoDz
         DNplB66Yg7PIq33GA9NsOj5hq8S2WBR88sJBO9YcUyClhrGl/l+PfJMgmn7TbIiqy6xL
         1Aa2aRrqihn/v3zvt9eJaSUI1gtJ8Y14gjvR+J98GqT/ZxtplsonViW8i5iti3CuEd13
         z6hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736250487; x=1736855287;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1BZ9YGNo2SXE7kqR3kflhucDH3azbi8G4Q6AF5m/Ioc=;
        b=ppxE6AypAwIcWKS44Tpp+NnLDwAG8gb+D+O+jKY2XGP7VnfovG/ERb0LUrgTVRU3y/
         3kDsy60Nl/U8t5LBFXj6jUOdgttzvVv1pjzesz/Mzk1gjM3enjH1JM8QW3rpclR325+T
         3bTYz5lX5NhbPm3z0d2mzYsW6+ebx9HDZ7wA9+b7gK4h1H2xKRB7fndi3rFskkVDnb1s
         /Q7OywbcIrqwbd5LTfuLmTKFiTgVlUDL2FzwpbMtWUvBhtevD1Tt+PrxNYZzOR/Sca89
         jezWsGEtJtMh6eosSWTjthhs2IYhmKeiCNWi7wLjhw1Yhf2x2BGMZ2FDl93X4Kw3+uur
         6ZPA==
X-Forwarded-Encrypted: i=1; AJvYcCUGot2DzjCeJ7p06DW2mCeY7R/ouu7djGhnif7rXFuzQLzNMXWWrny6y/cU1LYycqW8xQibsa7EBERkcJOM@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp5RWVwJF1mvTDkr7vv46M3GaPK7qdQnpycBQoK5hYFfz2E8eh
	dnK1MJLs2LbIuvPAs2KsVm2T40r++/G/I/k/UUIP17IIjwajQSvAEx46EPkX3xo=
X-Gm-Gg: ASbGncvx4mVbzo9lHy5WGjmWck74qYKlhWp6V3h/EWaVpUJ/h3qVnxqbyZKOhlPg/hV
	Tym19RvbpEB31aulU/z2obIViHqSz0drcgl19YYJbyHaML8wYInv3qQbth3f2dh2sBXxQ5YoAy4
	P/T1pKAiDir6DnN6ttogx2NNm8OcAI8aKJFyW4Zg3A7O2GNYFjAERi3/P7Ne3webg5Zw5WByD6w
	+IuZJHZuvgVSmFBeJYoBba7Qt9mdm0STsL0pSMbyTeL32CA78Z5u92psEnwgHh/T/jIr56xEnh3
	loI2HOOZNUykS6umrDTXeV2LMo2199d+uBwN
X-Google-Smtp-Source: AGHT+IF/JNesMMW9YpGdlDaPx32nw8jUIyI7gzybSiownU+qrpr62y2ro0G/5CclxAQbTzS55DGgEA==
X-Received: by 2002:a05:6512:318c:b0:542:2943:db06 with SMTP id 2adb3069b0e04-54229547836mr17722319e87.33.1736250487515;
        Tue, 07 Jan 2025 03:48:07 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223832002sm5244113e87.264.2025.01.07.03.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 03:48:06 -0800 (PST)
Date: Tue, 7 Jan 2025 13:48:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] drm/msm/dpu: enable CDM for all supported platforms
Message-ID: <t2pun2bz73aq426jokjlyeweknln74ygf5xj44tnmsoxowvnku@qtxqjruhfkju>
References: <20241224-dpu-add-cdm-v1-0-7aabfcb58246@linaro.org>
 <92ba142e-0793-4a47-a8b4-115050114132@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <92ba142e-0793-4a47-a8b4-115050114132@quicinc.com>

On Mon, Jan 06, 2025 at 07:17:40PM -0800, Abhinav Kumar wrote:
> 
> 
> On 12/23/2024 8:25 PM, Dmitry Baryshkov wrote:
> > Enable CDM block on all the platforms where it is supposed to be
> > present. Notably, from the platforms being supported by the DPU driver
> > it is not enabled for SM6115 (DPU 6.3), QCM2290 (DPU 6.5) and SM6375
> > (DPU 6.9)
> > 
> 
> Thanks for enabling it, but can you also explain on which of these has
> validation already been done and on which ones you need Tested-by from the
> community?

Actually none :D It is purely based on your CDM support and existing
vendor DT trees. Maybe we should spend some time validating it.

> 
> Is it fair to assume that changes (3) and (4) were sent out separately and
> not squashed into (2) because they are pending validation?

No, it's because I don't have DT (and so I didn't have reference) for
SC8280XP or X Elite.

> 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> > Dmitry Baryshkov (4):
> >        drm/msm/dpu: rename CDM block definition
> >        drm/msm/dpu: enable CDM_0 for all DPUs which are known to have it
> >        drm/msm/dpu: enable CDM_0 for SC8280XP platform
> >        drm/msm/dpu: enable CDM_0 for X Elite platform
> > 
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h  | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h  | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h   | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h   | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h   | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h   | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h   | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 2 +-
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   | 2 +-
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 2 +-
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           | 2 +-
> >   26 files changed, 26 insertions(+), 4 deletions(-)
> > ---
> > base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
> > change-id: 20241215-dpu-add-cdm-0b5b9283ffa8
> > 
> > Best regards,

-- 
With best wishes
Dmitry

